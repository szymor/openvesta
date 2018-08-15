HOSTNAME = "openvesta"
BROKER = "test.mosquitto.org"
CLIENTID = "openvesta-station-dev"
MAINTOPIC = "ovt-dev/"

function mqtt_on_connect(client)
  client:publish(MAINTOPIC .. "status", "online", 0, 1)
  mqtt_ready = true
end

function mqtt_on_disconnect(client)
  mqtt_ready = false
end

function wifi_on_connect()
  -- to be verified
  --mdns.register(HOSTNAME)
  m = mqtt.Client(CLIENTID, 60)
  m:lwt(MAINTOPIC .. "status", "offline", 0, 1)
  m:connect(BROKER, mqtt_on_connect)
  m:on("offline", mqtt_on_disconnect)
end

function timer_on_tick(timer)
  if mqtt_ready then
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
    m:publish(MAINTOPIC .. "temperature", temp, 0, 0)
    m:publish(MAINTOPIC .. "humidity", humi, 0, 0)
    m:publish(MAINTOPIC .. "pressure", pres, 0, 0)
    m:publish(MAINTOPIC .. "illuminance", "300", 0, 0)
    m:publish(MAINTOPIC .. "iaq", "40", 0, 0)
  end
end

sda, scl = 2, 1
i2c.setup(0, sda, scl, i2c.SLOW)
bme280.setup()

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
