-- OpenVesta -- indoor wi-fi sensor

HOSTNAME = "openvesta"

function load_mqtt_configuration()
  if file.open("mqtt.conf", "r") then
    -- reads lines without \n
    BROKER = string.sub(file.readline(), 0, -2)
    BROKER_PORT = string.sub(file.readline(), 0, -2)
    MQTTUSER = string.sub(file.readline(), 0, -2)
    MQTTPASS = string.sub(file.readline(), 0, -2)
    CLIENTID = string.sub(file.readline(), 0, -2)
    TOPLEVELTOPIC = string.sub(file.readline(), 0, -2)
    file.close()
  else
    -- default settings
    BROKER = "test.mosquitto.org"
    BROKER_PORT = 1883
    MQTTUSER = ""
    MQTTPASS = ""
    CLIENTID = "openvesta-station-dev"
    TOPLEVELTOPIC = "ovt-dev/"
  end
end

function save_mqtt_configuration()
  if file.open("mqtt.conf", "w") then
    file.writeline(BROKER)
    file.writeline(BROKER_PORT)
    file.writeline(MQTTUSER)
    file.writeline(MQTTPASS)
    file.writeline(CLIENTID)
    file.writeline(TOPLEVELTOPIC)
    file.close()
  end
end

function reboot()
  if mqtt_ready == true then
    m:close()
  end

  -- delay needed for the web interface
  tmr.create():alarm(500, tmr.ALARM_SINGLE, function ()
    if sv then
      sv:close()
    end
  end)
  
  tmr.create():alarm(1000, tmr.ALARM_SINGLE, function ()
    if wifimode == "STA" then
      station_cfg.auto = true
      station_cfg.save = true
      wifi.setmode(wifi.STATION, true) 
      wifi.setphymode(wifi.PHYMODE_N)
      wifi.sta.config(station_cfg)
    elseif wifimode == "AP" then
      -- ssid and pwd does not matter in AP mode
      wifi.sta.clearconfig()
      wifi.sta.disconnect()
    end
  end)
  
  tmr.create():alarm(1500, tmr.ALARM_SINGLE, node.restart)
end

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
    m:publish(TOPLEVELTOPIC .. "temperature", temp, 0, 0)
    m:publish(TOPLEVELTOPIC .. "humidity", humi, 0, 0)
    m:publish(TOPLEVELTOPIC .. "pressure", pres, 0, 0)
    m:publish(TOPLEVELTOPIC .. "iaq", iaq, 0, 0)
  end
end

function http_on_receive(sck, data)
  local new_mqtt_conf = false
  local restart_request = false
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
        new_mqtt_conf = true
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
        restart_request = true
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
    -- send not more than ~2500 bytes at once or crash will happen
    sck:send(parsed_html)
  end

  if not getfound and not postfound then
    sck:close()
  end

  if new_mqtt_conf == true then
    save_mqtt_configuration()
    restart_request = true
  end

  if restart_request == true then
    reboot()
  end
end

function http_on_sent(sck)
  sck:close()
end

gpio.mode(0, gpio.INPUT, gpio.PULLUP)
gpio.write(0, gpio.HIGH)
tmr.delay(100)
if gpio.read(0) == 0 then
  -- reset wi-fi and mqtt settings
  file.remove("mqtt.conf")
  wifimode = "AP"
  reboot()
end

load_mqtt_configuration()

sda, scl = 2, 1
i2c.setup(0, sda, scl, i2c.SLOW)
bme280.setup()
get_measures()

station_cfg = wifi.sta.getdefaultconfig(true)
if station_cfg.ssid == "" then
  cfg = {}
  cfg.ssid = "OpenVesta"
  cfg.pwd = nil
  wifi.setmode(wifi.SOFTAP, false) 
  wifi.setphymode(wifi.PHYMODE_G) -- 802.11n not supported in AP mode
  wifi.ap.config(cfg)
else
--station_cfg = {}
--station_cfg.ssid = "AndroidAP"
--station_cfg.pwd = "zcse8237"
--station_cfg.save = false
--  station_cfg.auto = false
--  wifi.setmode(wifi.STATION, false) 
--  wifi.setphymode(wifi.PHYMODE_N)
--  wifi.sta.config(station_cfg)
  wifi.sta.sethostname(HOSTNAME)
  wifi.sta.connect(wifi_on_connect)
end

sv = net.createServer(net.TCP, 5)
if sv then
  sv:listen(80, function(conn)
    conn:on("receive", http_on_receive)
    conn:on("sent", http_on_sent)
  end)
end

t = tmr.create()
t:register(10000, tmr.ALARM_AUTO, timer_on_tick)
t:start()

if file.open("confpanel.htm", "r") then
  html = file.read(2048)
  file.close()
end
