HOSTNAME = "openvesta"
BROKER = "test.mosquitto.org"
BROKER_PORT = 1883
MQTTUSER = ""
MQTTPASS = ""
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
  if iaq == nil then
    iaq = "err"
  else
    iaq = 1234
  end
end

function var_replace(s)
  if s == "%temp" then
    return temp
  elseif s == "%humi" then
    return humi
  elseif s == "%pres" then
    return pres
  elseif s == "%iaq" then
    return iaq
  elseif s == "%address" then
    return BROKER
  elseif s == "%port" then
    return BROKER_PORT
  elseif s == "%mqttuser" then
    return MQTTUSER
  elseif s == "%mqttpass" then
    return MQTTPASS
  elseif s == "%clientid" then
    return CLIENTID
  elseif s == "%toplevel" then
    return TOPLEVELTOPIC
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
  -- send not more than ~2500 bytes at once or crash will happen
  print("data:", data)
  local getfound = string.find(data, "GET / ")
  local postfound = string.find(data, "POST / ")
  
  if postfound then
    for pair in string.gmatch(data, "%w+=[0-9a-zA-Z.%-%%]*") do
      local iter = string.gmatch(pair, "[0-9a-zA-Z.%-%%]*")
      local name = iter()
      iter() -- empty call to iter(), in Lua 5.3.5 it is not needed
      local val = iter()
      val = string.gsub(val, "%%2F", "/")

      if name == "address" then
        BROKER = val
      elseif name == "port" then
        BROKER_PORT = val
      elseif name == "mqttuser" then
        MQTTUSER = val
      elseif name == "mqttpass" then
        MQTTPASS = val
      elseif name == "clientid" then
        CLIENTID = val
      elseif name == "toplevel" then
        TOPLEVELTOPIC = val
      elseif name == "mode" then
        reconnect = true
        wifimode = val
      elseif name == "ssid" then
        station_cfg.ssid = val
      elseif name == "wifipass" then
        station_cfg.pwd = val
      end
    end
  end

  if getfound or postfound then
    get_measures()
    parsed_html = string.gsub(html, "%%%w+", var_replace)
    sck:send(parsed_html)
  end

  if not getfound and not postfound then
    sck:close()
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

sv = net.createServer(net.TCP, 5)

if sv then
  sv:listen(80, function(conn)
    conn:on("receive", http_on_receive)
    conn:on("sent", http_on_sent)
  end)
end

if file.open("confpanel.htm", "r") then
  html = file.read(2048)
  file.close()
end
