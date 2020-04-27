USE springboot;
/*
create table router(
router_ID int AUTO_INCREMENT,
router_IPv6 char(50),
router_name char(50) default NULL,
online int default 0,
total_terminal int DEFAULT 0,
CONSTRAINT keyofrouter PRIMARY KEY (router_ID,router_IPv6)
)
*/
CREATE TABLE router(

router_IPv6 CHAR(50) PRIMARY KEY,
router_name CHAR(50) DEFAULT NULL,
online INT DEFAULT 0,
total_terminal INT DEFAULT 0
);



CREATE TABLE stm32(
stm32_IPv6 CHAR(50) PRIMARY KEY,
stm32_name CHAR(50) DEFAULT NULL,
state BOOL DEFAULT FALSE,
router_IPv6 CHAR(50),
sensor_num INT DEFAULT 0,
last_comm DATE DEFAULT NULL,
register TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,	
power_ID INT DEFAULT NULL,
FOREIGN KEY (power_ID) REFERENCES power_grid (power_ID),
FOREIGN KEY (router_IPv6) REFERENCES router (router_IPv6)
);


CREATE TABLE sensor_type(
type_ID INT AUTO_INCREMENT PRIMARY KEY,
type_name CHAR(50) DEFAULT NULL,
threshold FLOAT DEFAULT 0
);

CREATE TABLE power_grid(
power_ID INT AUTO_INCREMENT PRIMARY KEY,
power_name CHAR(50) DEFAULT NULL);

CREATE TABLE sensor(
sensor_ID INT PRIMARY KEY AUTO_INCREMENT,
stm32_IPv6 CHAR(50),
type_ID INT,
sensor_state BOOL DEFAULT FALSE,
sensor_name CHAR(50),
stm32_sensor_ID INT DEFAULT NULL,
FOREIGN KEY (stm32_IPv6) REFERENCES stm32 (stm32_IPv6),
FOREIGN KEY (type_ID) REFERENCES sensor_type (type_ID)
);


CREATE TABLE power_sensor(
power_ID INT,
sensor_ID INT,
FOREIGN KEY (power_ID) REFERENCES power_grid(power_ID),
FOREIGN KEY (sensor_ID) REFERENCES sensor(sensor_ID)
)









/*测试数据*/


INSERT INTO `springboot`.`power_grid` (`power_name`)
VALUES('电力线路1'),('电力线路2'),('电力线路3'),('电力线路4'),('电力线路5');


INSERT INTO `springboot`.`router` (`router_IPv6`)
VALUES('fe80::1:1'),('fe80::2:1'),('fe80::3:1'),('fe80::4:1'),('fe80::5:1'),('fe80::6:1'),('fe80::7:1'),('fe80::8:1');



INSERT INTO `springboot`.`stm32` (`stm32_IPv6`, `router_IPv6`,`state`, `sensor_num`, `last_comm`)
VALUES 
('fe80::1:2', 'fe80::1:1','1','9', '2000-01-01'),
('2001:db5::2', '2001:db5::1','1','1', '2000-01-01'),
('2001:db5::3', '2001:db5::1','0','2', '2000-01-01'),
('2001:db5::4', '2001:db5::1','1','3', '2000-01-01'),
('2001:db5::5', '2001:db5::1','0','2', '2000-01-01'),
('2001:db6::2', '2001:db6::1','1','1', '2000-01-01'),
('2001:db6::3', '2001:db6::1','0','2', '2000-01-01'),
('2001:db6::4', '2001:db6::1','1','3', '2000-01-01'),
('2001:db6::5', '2001:db6::1','0','2', '2000-01-01'),
('2001:db6::6', '2001:db6::1','1','1', '2000-01-01');

SELECT COUNT(*) FROM stm32 WHERE stm32.router_IPv6 = "fe80::1:1";
SELECT COUNT(*) FROM stm32 WHERE stm32.router_IPv6 = "fe80::1:1" AND state = 1;


DELETE FROM router WHERE router_IPv6 = "fe80::9:1";


INSERT INTO `springboot`.`sensor_type` (`type_name`)
VALUES('1281B_Temp'),('1281B_Current'),('1281B_Vol'),('BME_Press'),('BME_Temp'),('BME_Gas'),('BME_Hum'),('rotatex'),('rotatey');


INSERT INTO `springboot`.`sensor` (`stm32_IPv6`,`type_ID`, `sensor_state`)
VALUES
('fe80::1:2', '1',  '1'),
('fe80::1:2', '2', '1'),
('fe80::1:2', '4', '1'),
('fe80::1:2', '5', '1'),
('fe80::1:2', '6', '1'),
('fe80::1:2', '7', '1'),
('fe80::1:2', '8', '1'),
('fe80::1:2', '9', '1');
/*传感器表  IPv6_type_ID*/
CREATE TABLE Sensor_2(
Sensor_data FLOAT,
Sensor_time TIMESTAMP  DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE Sensor_10(
Sensor_data FLOAT,
Sensor_time TIMESTAMP  DEFAULT CURRENT_TIMESTAMP);

INSERT INTO `springboot`.`sensor_2` (`Sensor_data`)
VALUES('2');
INSERT INTO `springboot`.`sensor_2` (`Sensor_data`)
VALUES('3');
INSERT INTO `springboot`.`sensor_2` (`Sensor_data`)
VALUES('4');
INSERT INTO `springboot`.`sensor_2` (`Sensor_data`)
VALUES('5');
INSERT INTO `springboot`.`sensor_2` (`Sensor_data`)
VALUES('6');



SELECT * FROM Sensor_2  ORDER BY Sensor_time DESC LIMIT 1;

SELECT sensor.sensor_ID FROM sensor WHERE sensor.stm32_IPv6 = "fe80::1:2" AND type_ID = 2;


SELECT COUNT(*) FROM sensor_2
SELECT * FROM stm32 WHERE stm32_IPv6 = "fe80::1:2"

UPDATE router SET total_terminal = total_terminal + 1 WHERE router_IPv6 = "fe80::1:1"

SELECT *FROM stm32

SELECT COUNT(*) FROM router

SELECT COUNT(*) FROM stm32 WHERE router_IPv6 = "fe80::1:1"
       
       
        SELECT * FROM sensor WHERE stm32_IPv6 = "fe80::1:2"
        
        SELECT * FROM sensor WHERE stm32_IPv6 = "fe80::1:2"
UPDATE stm32 SET stm32.stm32_name = "testupdate",stm32.power_ID = 2 WHERE stm32.stm32_IPv6 = "2222222222"

DELETE FROM stm32 WHERE stm32_IPv6 = "111"

SELECT * FROM sensor LIMIT 10,10;

SELECT sensor_ID FROM sensor WHERE stm32_IPv6 = "2001::db5::3" AND type_ID = 1
 
  SHOW TABLES LIKE 'sensor'
  
   SELECT sensor.sensor_ID FROM sensor WHERE sensor.stm32_IPv6 = "2001:db8:0:0:0:0:0:24" AND type_ID = 2 AND sensor.stm32_sensor_ID = 0;
TRUNCATE TABLE sensor_532

SELECT power_ID+1 FROM power_grid  ORDER BY power_ID DESC LIMIT 1;




INSERT INTO `springboot`.`power_grid` 
(`power_name`, `parent_ID`)
VALUES("电力线路54",21),
("电力线路55",21),
("电力线路56",21),
("电力线路57",21),
("电力线路58",21),
("电力线路59",21),
("电力线路60",21);

INSERT INTO `springboot`.`power_grid` 
(`power_name`, `parent_ID`)
VALUES("电力线路61",47),
("电力线路62",47),
("电力线路63",47),
("电力线路64",47),
("电力线路65",47),
("电力线路66",47),
("电力线路67",47);

INSERT INTO `springboot`.`power_grid` 
(`power_name`, `parent_ID`)
VALUES("电力线路61",48),
("电力线路68",48),
("电力线路69",48),
("电力线路70",48),
("电力线路71",48),
("电力线路72",48),
("电力线路73",48);


INSERT INTO `springboot`.`power_grid` 
(`power_name`, `parent_ID`)
VALUES("电力线路61",49),
("电力线路74",49),
("电力线路75",49),
("电力线路76",49),
("电力线路77",49),
("电力线路78",49),
("电力线路79",49);

INSERT INTO `springboot`.`power_grid` 
(`power_name`, `parent_ID`)
VALUES("电力线路61",20),
("电力线路80",20),
("电力线路81",20),
("电力线路82",20),
("电力线路83",20),
("电力线路84",20),
("电力线路85",20);

INSERT INTO `springboot`.`power_grid` 
(`power_name`, `parent_ID`)
VALUES("电力线路61",85),
("电力线路90",85),
("电力线路91",85),
("电力线路92",85),
("电力线路93",85),
("电力线路94",85),
("电力线路95",85);