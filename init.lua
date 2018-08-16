HOSTNAME = "openvesta"
BROKER = "test.mosquitto.org"
CLIENTID = "openvesta-station-dev"
TOPLEVELTOPIC = "ovt-dev/"

function get_measures()
  temp, pres, humi = bme280.read()
  if temp == nil then
    temp = "err"
  else
    temp = temp / 100
  end
  if pres == nil then
    pres = "err"
  else
    pres = pres / 1000
  end
  if humi == nil then
    humi = "err"
  else
    humi = humi / 1000
  end
  iaq = 123
end

function var_replace(s)
  if s == "%temp" then
    return temp
  end
  if s == "%humi" then
    return humi
  end
  if s == "%pres" then
    return pres
  end
  if s == "%iaq" then
    return iaq
  end
end

function mqtt_on_connect(client)
  client:publish(TOPLEVELTOPIC .. "status", "online", 0, 1)
  mqtt_ready = true
end

function mqtt_on_disconnect(client)
  mqtt_ready = false
end

function wifi_on_connect()
  -- to be verified
  --mdns.register(HOSTNAME)
  m = mqtt.Client(CLIENTID, 60)
  m:lwt(TOPLEVELTOPIC .. "status", "offline", 0, 1)
  m:connect(BROKER, mqtt_on_connect)
  m:on("offline", mqtt_on_disconnect)
end

function timer_on_tick(timer)
  if mqtt_ready then
    get_measures()
    m:publish(TOPLEVELTOPIC .. "temperature", temp, 0, 0)
    m:publish(TOPLEVELTOPIC .. "humidity", humi, 0, 0)
    m:publish(TOPLEVELTOPIC .. "pressure", pres, 0, 0)
    m:publish(TOPLEVELTOPIC .. "iaq", iaq, 0, 0)
  end
end

function http_on_receive(sck, data)
  print("data:", data)
  if string.find(data, "GET / ") then
  -- max ~2500 bytes
    html = "test %temp %humi %pres %iaq"
    get_measures()
    parsed_html = string.gsub(html, "%%%w+", var_replace)
    sck:send(parsed_html)
  end
end

function http_on_sent(sck)
  sck:close()
end

sda, scl = 2, 1
i2c.setup(0, sda, scl, i2c.SLOW)
bme280.setup()
get_measures()

station_cfg = {}
station_cfg.ssid = "AndroidAP"
station_cfg.pwd = "zcse8237"
station_cfg.save = false

wifi.setmode(wifi.STATION, false) 
wifi.setphymode(wifi.PHYMODE_N)
wifi.sta.config(station_cfg)
wifi.sta.sethostname(HOSTNAME)
wifi.sta.connect(wifi_on_connect)

t = tmr.create()
t:register(10000, tmr.ALARM_AUTO, timer_on_tick)
t:start()

sv = net.createServer(net.TCP, 30)

if sv then
  sv:listen(80, function(conn)
    conn:on("receive", http_on_receive)
    conn:on("sent", http_on_sent)
  end)
end
