EESchema Schematic File Version 4
LIBS:openvesta-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "OpenVesta development board"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP-12F U?
U 1 1 5B7C5F67
P 1900 1950
F 0 "U?" H 1900 2928 50  0000 C CNN
F 1 "ESP-12F" H 1900 2837 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 1900 1950 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 1550 2050 50  0001 C CNN
	1    1900 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7C60B7
P 1900 2750
F 0 "#PWR?" H 1900 2500 50  0001 C CNN
F 1 "GND" H 1905 2577 50  0000 C CNN
F 2 "" H 1900 2750 50  0001 C CNN
F 3 "" H 1900 2750 50  0001 C CNN
	1    1900 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2750 1900 2650
$Comp
L Sensor:BME680 U?
U 1 1 5B7C634E
P 5000 1650
F 0 "U?" H 4570 1696 50  0000 R CNN
F 1 "BME680" H 4570 1605 50  0000 R CNN
F 2 "Package_LGA:Bosch_LGA-8_3x3mm_P0.8mm_ClockwisePinNumbering" H 5000 1450 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BME680-DS001-00.pdf" H 5000 1450 50  0001 C CNN
	1    5000 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7C65A6
P 4900 2350
F 0 "#PWR?" H 4900 2100 50  0001 C CNN
F 1 "GND" H 4905 2177 50  0000 C CNN
F 2 "" H 4900 2350 50  0001 C CNN
F 3 "" H 4900 2350 50  0001 C CNN
	1    4900 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2250 4900 2300
Wire Wire Line
	5100 2250 5100 2300
Wire Wire Line
	5100 2300 4900 2300
Connection ~ 4900 2300
Wire Wire Line
	4900 2300 4900 2350
$Comp
L power:+3V3 #PWR?
U 1 1 5B7C662A
P 1600 1150
F 0 "#PWR?" H 1600 1000 50  0001 C CNN
F 1 "+3V3" H 1615 1323 50  0000 C CNN
F 2 "" H 1600 1150 50  0001 C CNN
F 3 "" H 1600 1150 50  0001 C CNN
	1    1600 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5B7C670B
P 4900 950
F 0 "#PWR?" H 4900 800 50  0001 C CNN
F 1 "+3V3" H 4915 1123 50  0000 C CNN
F 2 "" H 4900 950 50  0001 C CNN
F 3 "" H 4900 950 50  0001 C CNN
	1    4900 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1050 4900 1000
Wire Wire Line
	5100 1050 5100 1000
Wire Wire Line
	5100 1000 4900 1000
Connection ~ 4900 1000
Wire Wire Line
	4900 1000 4900 950 
$Comp
L power:+3V3 #PWR?
U 1 1 5B7C6AFC
P 5700 1950
F 0 "#PWR?" H 5700 1800 50  0001 C CNN
F 1 "+3V3" H 5715 2123 50  0000 C CNN
F 2 "" H 5700 1950 50  0001 C CNN
F 3 "" H 5700 1950 50  0001 C CNN
	1    5700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1150 1600 1150
Wire Wire Line
	5700 1950 5600 1950
Wire Wire Line
	5600 1350 5600 1000
Wire Wire Line
	5600 1000 5100 1000
Connection ~ 5100 1000
$Comp
L Device:C C?
U 1 1 5B7C6DE1
P 4100 1200
F 0 "C?" H 4215 1246 50  0000 L CNN
F 1 "100n" H 4215 1155 50  0000 L CNN
F 2 "" H 4138 1050 50  0001 C CNN
F 3 "~" H 4100 1200 50  0001 C CNN
	1    4100 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5B7C6EAA
P 4100 950
F 0 "#PWR?" H 4100 800 50  0001 C CNN
F 1 "+3V3" H 4115 1123 50  0000 C CNN
F 2 "" H 4100 950 50  0001 C CNN
F 3 "" H 4100 950 50  0001 C CNN
	1    4100 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7C6EE5
P 4100 1450
F 0 "#PWR?" H 4100 1200 50  0001 C CNN
F 1 "GND" H 4105 1277 50  0000 C CNN
F 2 "" H 4100 1450 50  0001 C CNN
F 3 "" H 4100 1450 50  0001 C CNN
	1    4100 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1050 4100 950 
Wire Wire Line
	4100 1350 4100 1450
$Comp
L Device:R R?
U 1 1 5B7C7258
P 5700 1350
F 0 "R?" H 5770 1396 50  0000 L CNN
F 1 "4k7" H 5770 1305 50  0000 L CNN
F 2 "" V 5630 1350 50  0001 C CNN
F 3 "~" H 5700 1350 50  0001 C CNN
	1    5700 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5B7C72B4
P 5950 1550
F 0 "R?" H 6020 1596 50  0000 L CNN
F 1 "4k7" H 6020 1505 50  0000 L CNN
F 2 "" V 5880 1550 50  0001 C CNN
F 3 "~" H 5950 1550 50  0001 C CNN
	1    5950 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1200 5700 1000
Wire Wire Line
	5700 1000 5600 1000
Connection ~ 5600 1000
Wire Wire Line
	5950 1400 5950 1000
Wire Wire Line
	5950 1000 5700 1000
Connection ~ 5700 1000
Wire Wire Line
	5600 1550 5700 1550
Wire Wire Line
	5700 1550 5700 1500
Wire Wire Line
	5600 1750 5950 1750
Wire Wire Line
	5950 1750 5950 1700
Wire Wire Line
	5700 1550 5750 1550
Connection ~ 5700 1550
Wire Wire Line
	5950 1750 6000 1750
Connection ~ 5950 1750
Text Label 5750 1550 0    50   ~ 0
SCL
Text Label 6000 1750 0    50   ~ 0
SDA
$Comp
L Connector:USB_B_Micro J?
U 1 1 5B7DA1B2
P 10050 2650
F 0 "J?" H 10105 3117 50  0000 C CNN
F 1 "USB_B_Micro" H 10105 3026 50  0000 C CNN
F 2 "" H 10200 2600 50  0001 C CNN
F 3 "~" H 10200 2600 50  0001 C CNN
	1    10050 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7DA479
P 10050 3150
F 0 "#PWR?" H 10050 2900 50  0001 C CNN
F 1 "GND" H 10055 2977 50  0000 C CNN
F 2 "" H 10050 3150 50  0001 C CNN
F 3 "" H 10050 3150 50  0001 C CNN
	1    10050 3150
	1    0    0    -1  
$EndComp
Text Label 2600 1450 0    50   ~ 0
TX
Text Label 2600 1650 0    50   ~ 0
RX
Wire Wire Line
	2600 1650 2500 1650
Wire Wire Line
	2600 1450 2500 1450
Wire Wire Line
	10350 2650 10450 2650
Wire Wire Line
	10350 2750 10450 2750
Text Label 10450 2650 0    50   ~ 0
DP
Text Label 10450 2750 0    50   ~ 0
DM
$Comp
L power:+5V #PWR?
U 1 1 5B7DC07F
P 10500 2050
F 0 "#PWR?" H 10500 1900 50  0001 C CNN
F 1 "+5V" H 10515 2223 50  0000 C CNN
F 2 "" H 10500 2050 50  0001 C CNN
F 3 "" H 10500 2050 50  0001 C CNN
	1    10500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 2100 10500 2050
NoConn ~ 10350 2850
$Comp
L Interface_USB:FT232RL U?
U 1 1 5B7DE520
P 2450 6250
F 0 "U?" H 2450 7428 50  0000 C CNN
F 1 "FT232RL" H 2450 7337 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 2450 6250 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 2450 6250 50  0001 C CNN
	1    2450 6250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP1117-33 U?
U 1 1 5B7DF6E7
P 10400 1000
F 0 "U?" H 10400 1242 50  0000 C CNN
F 1 "AP1117-33" H 10400 1151 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 10400 1200 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 10500 750 50  0001 C CNN
	1    10400 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7DF749
P 10400 1400
F 0 "#PWR?" H 10400 1150 50  0001 C CNN
F 1 "GND" H 10405 1227 50  0000 C CNN
F 2 "" H 10400 1400 50  0001 C CNN
F 3 "" H 10400 1400 50  0001 C CNN
	1    10400 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5B7DF78D
P 9950 900
F 0 "#PWR?" H 9950 750 50  0001 C CNN
F 1 "+5V" H 9965 1073 50  0000 C CNN
F 2 "" H 9950 900 50  0001 C CNN
F 3 "" H 9950 900 50  0001 C CNN
	1    9950 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5B7DF7D1
P 10800 900
F 0 "#PWR?" H 10800 750 50  0001 C CNN
F 1 "+3V3" H 10815 1073 50  0000 C CNN
F 2 "" H 10800 900 50  0001 C CNN
F 3 "" H 10800 900 50  0001 C CNN
	1    10800 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5B7DF900
P 9950 1200
F 0 "C?" H 10068 1246 50  0000 L CNN
F 1 "10u" H 10068 1155 50  0000 L CNN
F 2 "" H 9988 1050 50  0001 C CNN
F 3 "~" H 9950 1200 50  0001 C CNN
	1    9950 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5B7DF96C
P 10800 1200
F 0 "C?" H 10918 1246 50  0000 L CNN
F 1 "10u" H 10918 1155 50  0000 L CNN
F 2 "" H 10838 1050 50  0001 C CNN
F 3 "~" H 10800 1200 50  0001 C CNN
	1    10800 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 1050 10800 1000
Wire Wire Line
	10100 1000 9950 1000
Wire Wire Line
	9950 1000 9950 900 
Wire Wire Line
	9950 1050 9950 1000
Connection ~ 9950 1000
Wire Wire Line
	10700 1000 10800 1000
Connection ~ 10800 1000
Wire Wire Line
	10800 1000 10800 900 
Wire Wire Line
	10800 1350 10400 1350
Wire Wire Line
	10400 1350 10400 1300
Wire Wire Line
	10400 1400 10400 1350
Connection ~ 10400 1350
Wire Wire Line
	9950 1350 10400 1350
$Comp
L Device:Ferrite_Bead L?
U 1 1 5B7E6BE1
P 10500 2250
F 0 "L?" H 10637 2296 50  0000 L CNN
F 1 "Ferrite_Bead" H 10637 2205 50  0000 L CNN
F 2 "" V 10430 2250 50  0001 C CNN
F 3 "~" H 10500 2250 50  0001 C CNN
	1    10500 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 2450 10500 2450
Wire Wire Line
	10500 2450 10500 2400
Wire Wire Line
	10050 3050 10050 3100
NoConn ~ 9950 3050
$Comp
L Device:C C?
U 1 1 5B7EB258
P 10700 2650
F 0 "C?" H 10815 2696 50  0000 L CNN
F 1 "10n" H 10815 2605 50  0000 L CNN
F 2 "" H 10738 2500 50  0001 C CNN
F 3 "~" H 10700 2650 50  0001 C CNN
	1    10700 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 2500 10700 2450
Wire Wire Line
	10700 2450 10500 2450
Connection ~ 10500 2450
Wire Wire Line
	10700 2800 10700 3100
Wire Wire Line
	10700 3100 10050 3100
Connection ~ 10050 3100
Wire Wire Line
	10050 3100 10050 3150
$Comp
L power:+5V #PWR?
U 1 1 5B7EC50B
P 2150 5200
F 0 "#PWR?" H 2150 5050 50  0001 C CNN
F 1 "+5V" H 2165 5373 50  0000 C CNN
F 2 "" H 2150 5200 50  0001 C CNN
F 3 "" H 2150 5200 50  0001 C CNN
	1    2150 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5250 2550 5200
Wire Wire Line
	2550 5200 2350 5200
Wire Wire Line
	2350 5250 2350 5200
Connection ~ 2350 5200
Wire Wire Line
	2350 5200 2150 5200
$Comp
L Device:C C?
U 1 1 5B7EDA14
P 1100 5700
F 0 "C?" H 1215 5746 50  0000 L CNN
F 1 "100n" H 1215 5655 50  0000 L CNN
F 2 "" H 1138 5550 50  0001 C CNN
F 3 "~" H 1100 5700 50  0001 C CNN
	1    1100 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7EE6CB
P 1100 5950
F 0 "#PWR?" H 1100 5700 50  0001 C CNN
F 1 "GND" H 1105 5777 50  0000 C CNN
F 2 "" H 1100 5950 50  0001 C CNN
F 3 "" H 1100 5950 50  0001 C CNN
	1    1100 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5850 1100 5950
Wire Wire Line
	1650 5850 1550 5850
Wire Wire Line
	1650 5950 1550 5950
Text Label 1550 5850 2    50   ~ 0
DP
Text Label 1550 5950 2    50   ~ 0
DM
$Comp
L power:GND #PWR?
U 1 1 5B7F2C67
P 2250 7350
F 0 "#PWR?" H 2250 7100 50  0001 C CNN
F 1 "GND" H 2255 7177 50  0000 C CNN
F 2 "" H 2250 7350 50  0001 C CNN
F 3 "" H 2250 7350 50  0001 C CNN
	1    2250 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 7250 2250 7300
Wire Wire Line
	2650 7250 2650 7300
Wire Wire Line
	2650 7300 2550 7300
Connection ~ 2250 7300
Wire Wire Line
	2250 7300 2250 7350
Wire Wire Line
	2450 7250 2450 7300
Connection ~ 2450 7300
Wire Wire Line
	2450 7300 2250 7300
Wire Wire Line
	2550 7250 2550 7300
Connection ~ 2550 7300
Wire Wire Line
	2550 7300 2450 7300
$Comp
L Device:CP C?
U 1 1 5B7F6FDC
P 850 5050
F 0 "C?" H 968 5096 50  0000 L CNN
F 1 "4u7" H 968 5005 50  0000 L CNN
F 2 "" H 888 4900 50  0001 C CNN
F 3 "~" H 850 5050 50  0001 C CNN
	1    850  5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5B7F7042
P 1250 5050
F 0 "C?" H 1365 5096 50  0000 L CNN
F 1 "100n" H 1365 5005 50  0000 L CNN
F 2 "" H 1288 4900 50  0001 C CNN
F 3 "~" H 1250 5050 50  0001 C CNN
	1    1250 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7F70AA
P 850 5300
F 0 "#PWR?" H 850 5050 50  0001 C CNN
F 1 "GND" H 855 5127 50  0000 C CNN
F 2 "" H 850 5300 50  0001 C CNN
F 3 "" H 850 5300 50  0001 C CNN
	1    850  5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  5200 850  5250
Wire Wire Line
	1250 5200 1250 5250
Wire Wire Line
	1250 5250 850  5250
Connection ~ 850  5250
Wire Wire Line
	850  5250 850  5300
$Comp
L power:+5V #PWR?
U 1 1 5B7F9A25
P 850 4800
F 0 "#PWR?" H 850 4650 50  0001 C CNN
F 1 "+5V" H 865 4973 50  0000 C CNN
F 2 "" H 850 4800 50  0001 C CNN
F 3 "" H 850 4800 50  0001 C CNN
	1    850  4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4900 850  4850
Wire Wire Line
	1250 4900 1250 4850
Wire Wire Line
	1250 4850 850  4850
Connection ~ 850  4850
Wire Wire Line
	850  4850 850  4800
Wire Wire Line
	1100 5550 1650 5550
NoConn ~ 3250 6250
NoConn ~ 3250 6150
NoConn ~ 3250 6050
NoConn ~ 3250 5850
Wire Wire Line
	3250 5550 3350 5550
Wire Wire Line
	3250 5650 3350 5650
Text Label 3350 5550 0    50   ~ 0
RX
Text Label 3350 5650 0    50   ~ 0
TX
NoConn ~ 3250 6950
NoConn ~ 3250 6850
NoConn ~ 3250 6750
NoConn ~ 3250 6650
NoConn ~ 3250 6550
Wire Wire Line
	1650 7300 2250 7300
Wire Wire Line
	1650 6950 1650 7300
NoConn ~ 1650 6650
NoConn ~ 1650 6450
NoConn ~ 1650 6250
$Comp
L Switch:SW_Push SW?
U 1 1 5B7F2E31
P 2600 2550
F 0 "SW?" V 2554 2698 50  0000 L CNN
F 1 "SW_Push" V 2645 2698 50  0000 L CNN
F 2 "" H 2600 2750 50  0001 C CNN
F 3 "" H 2600 2750 50  0001 C CNN
	1    2600 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B7F2F0C
P 2600 2850
F 0 "#PWR?" H 2600 2600 50  0001 C CNN
F 1 "GND" H 2605 2677 50  0000 C CNN
F 2 "" H 2600 2850 50  0001 C CNN
F 3 "" H 2600 2850 50  0001 C CNN
	1    2600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2350 2500 2350
Wire Wire Line
	2600 2850 2600 2750
Text Label 2600 1750 0    50   ~ 0
SDA
Text Label 2600 1850 0    50   ~ 0
SCL
Wire Wire Line
	2600 1750 2500 1750
Wire Wire Line
	2600 1850 2500 1850
$Comp
L Device:R R?
U 1 1 5B7FAEC3
P 1200 1100
F 0 "R?" H 1270 1146 50  0000 L CNN
F 1 "10k" H 1270 1055 50  0000 L CNN
F 2 "" V 1130 1100 50  0001 C CNN
F 3 "~" H 1200 1100 50  0001 C CNN
	1    1200 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5B7FAF30
P 800 1400
F 0 "R?" H 870 1446 50  0000 L CNN
F 1 "10k" H 870 1355 50  0000 L CNN
F 2 "" V 730 1400 50  0001 C CNN
F 3 "~" H 800 1400 50  0001 C CNN
	1    800  1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1350 1200 1350
Wire Wire Line
	1200 1350 1200 1250
Wire Wire Line
	1200 950  1200 850 
Wire Wire Line
	800  1250 800  1150
$Comp
L power:+3V3 #PWR?
U 1 1 5B803298
P 1200 850
F 0 "#PWR?" H 1200 700 50  0001 C CNN
F 1 "+3V3" H 1215 1023 50  0000 C CNN
F 2 "" H 1200 850 50  0001 C CNN
F 3 "" H 1200 850 50  0001 C CNN
	1    1200 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5B8032F0
P 800 1150
F 0 "#PWR?" H 800 1000 50  0001 C CNN
F 1 "+3V3" H 815 1323 50  0000 C CNN
F 2 "" H 800 1150 50  0001 C CNN
F 3 "" H 800 1150 50  0001 C CNN
	1    800  1150
	1    0    0    -1  
$EndComp
NoConn ~ 1300 1950
NoConn ~ 1300 2050
NoConn ~ 1300 2150
NoConn ~ 1300 2250
NoConn ~ 1300 2350
NoConn ~ 1300 2450
NoConn ~ 1300 1750
NoConn ~ 2500 1550
NoConn ~ 2500 1950
NoConn ~ 2500 2050
NoConn ~ 2500 2150
NoConn ~ 2500 2250
$Comp
L Device:Q_DUAL_NPN_NPN_E1B1C2E2B2C1 Q?
U 1 1 5B824422
P 7300 1050
F 0 "Q?" H 7491 1096 50  0000 L CNN
F 1 "Q_DUAL_NPN_NPN_E1B1C2E2B2C1" H 7491 1005 50  0000 L CNN
F 2 "" H 7500 1150 50  0001 C CNN
F 3 "~" H 7300 1050 50  0001 C CNN
	1    7300 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_DUAL_NPN_NPN_E1B1C2E2B2C1 Q?
U 2 1 5B824610
P 7300 2150
F 0 "Q?" H 7491 2196 50  0000 L CNN
F 1 "Q_DUAL_NPN_NPN_E1B1C2E2B2C1" H 7491 2105 50  0000 L CNN
F 2 "" H 7500 2250 50  0001 C CNN
F 3 "~" H 7300 2150 50  0001 C CNN
	2    7300 2150
	1    0    0    -1  
$EndComp
Text Label 1150 1350 2    50   ~ 0
RST
Wire Wire Line
	1150 1350 1200 1350
Connection ~ 1200 1350
Wire Wire Line
	800  1550 1300 1550
Text Label 7400 1350 3    50   ~ 0
RTS
Text Label 7400 750  1    50   ~ 0
RST
Wire Wire Line
	7400 1350 7400 1250
Wire Wire Line
	7400 750  7400 850 
Text Label 6600 1050 2    50   ~ 0
DTR
Wire Wire Line
	6600 1050 6700 1050
$Comp
L Device:R R?
U 1 1 5B83E321
P 6850 1050
F 0 "R?" V 6643 1050 50  0000 C CNN
F 1 "4k7" V 6734 1050 50  0000 C CNN
F 2 "" V 6780 1050 50  0001 C CNN
F 3 "~" H 6850 1050 50  0001 C CNN
	1    6850 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 1050 7100 1050
$Comp
L Device:R R?
U 1 1 5B847CBE
P 6850 2150
F 0 "R?" V 6643 2150 50  0000 C CNN
F 1 "4k7" V 6734 2150 50  0000 C CNN
F 2 "" V 6780 2150 50  0001 C CNN
F 3 "~" H 6850 2150 50  0001 C CNN
	1    6850 2150
	0    1    1    0   
$EndComp
Text Label 7400 2450 3    50   ~ 0
DTR
Text Label 6600 2150 2    50   ~ 0
RTS
Text Label 7400 1850 1    50   ~ 0
GPIO0
Wire Wire Line
	6600 2150 6700 2150
Wire Wire Line
	7400 2450 7400 2350
Wire Wire Line
	7400 1950 7400 1850
Wire Wire Line
	7000 2150 7100 2150
Text Label 2600 1350 0    50   ~ 0
GPIO0
Wire Wire Line
	2500 1350 2600 1350
Wire Wire Line
	3250 5750 3350 5750
Wire Wire Line
	3250 5950 3350 5950
Text Label 3350 5750 0    50   ~ 0
RTS
Text Label 3350 5950 0    50   ~ 0
DTR
$EndSCHEMATC
