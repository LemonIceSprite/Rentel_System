/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.15 : Database - renter_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`renter_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `renter_system`;

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `Bill_Code` int(8) NOT NULL AUTO_INCREMENT,
  `Order_Code` int(8) DEFAULT NULL,
  `Order_time` int(8) DEFAULT NULL,
  `Real_time` int(11) DEFAULT NULL,
  `Money` float DEFAULT NULL,
  PRIMARY KEY (`Bill_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bill` */

insert  into `bill`(`Bill_Code`,`Order_Code`,`Order_time`,`Real_time`,`Money`) values (1,1,11,23,200),(2,3,33,28,333),(40,200,12,-51,444),(41,123,NULL,NULL,33),(69,123,NULL,NULL,33),(91,123,NULL,NULL,33),(92,123,NULL,NULL,33),(113,123,NULL,NULL,33),(114,123,NULL,NULL,33),(115,123,NULL,NULL,33),(116,123,NULL,NULL,33),(117,123,NULL,NULL,33),(118,123,NULL,NULL,33),(119,123,NULL,NULL,33),(120,123,NULL,NULL,33),(194,315,0,NULL,NULL),(195,316,0,NULL,NULL),(196,317,12,NULL,NULL),(197,318,0,NULL,NULL),(198,319,0,NULL,NULL),(199,320,0,NULL,NULL),(200,321,10,NULL,NULL),(201,322,0,NULL,NULL),(202,323,0,NULL,NULL),(203,324,10,NULL,NULL),(204,325,0,NULL,NULL),(205,326,0,NULL,NULL),(206,327,0,NULL,NULL),(207,328,0,NULL,NULL),(208,329,10,NULL,NULL),(209,330,10,NULL,NULL),(210,331,10,NULL,NULL),(211,332,10,NULL,NULL),(212,333,10,0,170),(213,334,10,NULL,NULL),(214,335,10,NULL,NULL),(215,336,10,NULL,NULL),(216,337,10,NULL,NULL),(224,345,10,0,220);

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `Car_Code` char(5) NOT NULL,
  `Model` varchar(6) DEFAULT NULL,
  `Rent` bit(1) DEFAULT NULL,
  `Manager_Code` char(8) NOT NULL,
  `Owner_Code` char(8) NOT NULL,
  `note` text,
  PRIMARY KEY (`Car_Code`),
  UNIQUE KEY `Car_Car_Code_uindex` (`Car_Code`),
  KEY `Car_Manager_Manager_Code_fk` (`Manager_Code`),
  KEY `Car_Owner_Owner_Code_fk` (`Owner_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `car` */

insert  into `car`(`Car_Code`,`Model`,`Rent`,`Manager_Code`,`Owner_Code`,`note`) values ('C001','aaa','\0','123456','2222',''),('C0089','A0801','\0','A0801','A0801',NULL),('ca','022','\0','2019002','011','11'),('E33','ew','','2019003','1001',NULL),('F33','aaa','\0','123456','2222',''),('F35','aa','\0','2121','1002',NULL),('S002','xue','\0','10001','1002',NULL),('X23','xunjie','','asd','1001',NULL);

/*Table structure for table `check_bill` */

DROP TABLE IF EXISTS `check_bill`;

CREATE TABLE `check_bill` (
  `Check_Code` char(8) NOT NULL,
  `Renter_Code` char(8) NOT NULL,
  `Car_Code` char(5) NOT NULL,
  `sign` bit(1) DEFAULT NULL,
  `Sign_describe` tinytext,
  PRIMARY KEY (`Check_Code`),
  UNIQUE KEY `Check_Bill_Check_Code_uindex` (`Check_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `check_bill` */

insert  into `check_bill`(`Check_Code`,`Renter_Code`,`Car_Code`,`sign`,`Sign_describe`) values ('0004','0004','C004',NULL,NULL),('0005','0005','C005',NULL,NULL),('0006','0006','C006',NULL,NULL),('10001','0001','C001',NULL,''),('10002','0002','C002',NULL,''),('1003','0003','C003',NULL,NULL);

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `Manager_Code` char(8) NOT NULL,
  `Name` varchar(5) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `Password` char(8) NOT NULL,
  `Phone_num` int(11) DEFAULT NULL,
  `Address` tinytext,
  PRIMARY KEY (`Manager_Code`),
  UNIQUE KEY `Manager_Manager_Code_uindex` (`Manager_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `manager` */

insert  into `manager`(`Manager_Code`,`Name`,`Gender`,`Password`,`Phone_num`,`Address`) values ('123456','child','\0','88888',NULL,'beijing'),('2019002','9','','99999',9,'99'),('2019003','sad','\0','12143',NULL,'åäº¬'),('2019004','Tony',NULL,'123456',122,'天津'),('2019005','Jack',NULL,'123456',144,'上海'),('2019006','Pandy',NULL,'123456',177,'深圳');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `Order_Code` int(8) NOT NULL AUTO_INCREMENT,
  `Car_Code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Start_time` datetime DEFAULT NULL,
  `End_time` datetime DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Renter_Code` char(8) NOT NULL,
  PRIMARY KEY (`Order_Code`),
  UNIQUE KEY `Order_Order_Code_uindex` (`Order_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order` */

insert  into `order`(`Order_Code`,`Car_Code`,`Start_time`,`End_time`,`note`,`Renter_Code`) values (1,'X23','2019-06-26 11:00:00','2019-06-27 10:00:00','好想放假','10001'),(2,'C002','2019-06-26 23:00:00','2019-06-27 12:00:00','','0002'),(3,'C003','2019-06-26 08:00:00','2019-06-27 12:00:00','','0003'),(4,'C004','2019-06-26 12:00:00','2019-06-27 23:00:00','hello','0004'),(5,'C005','2019-06-26 08:00:00','2019-06-27 06:00:00','','0005'),(6,'C006','2019-06-26 09:00:00','2019-06-27 09:00:00','','0006'),(200,'F35','2019-06-28 14:42:54','2019-06-26 11:00:00','sssss','10001'),(214,'null','2019-06-28 16:44:28',NULL,NULL,'null'),(215,'null','2019-06-28 16:47:11',NULL,NULL,'null'),(216,'C001','2019-06-28 16:47:21',NULL,NULL,'null'),(217,'C001','2019-06-28 16:47:31',NULL,NULL,'null'),(308,'','2019-06-28 17:52:25',NULL,NULL,'null'),(309,'','2019-06-28 17:52:26',NULL,NULL,'null'),(310,'','2019-06-28 17:52:27',NULL,NULL,'null'),(311,'','2019-06-28 17:52:28',NULL,NULL,'null'),(312,'','2019-06-28 17:52:28',NULL,NULL,'null'),(313,'','2019-06-28 17:52:29',NULL,NULL,'null'),(314,'','2019-06-28 17:52:30',NULL,NULL,'null'),(315,'','2019-06-28 18:04:29',NULL,NULL,'null'),(316,'','2019-06-28 18:04:57',NULL,NULL,'null'),(318,'null','2019-06-29 11:08:54',NULL,NULL,'10001'),(319,'null','2019-06-29 11:09:05',NULL,NULL,'10001'),(320,'null','2019-06-29 11:12:40',NULL,NULL,'10001'),(321,'X23','2019-06-29 11:12:46',NULL,NULL,'10001'),(322,'null','2019-06-29 11:36:56',NULL,NULL,'10001'),(323,'null','2019-06-29 14:27:46',NULL,NULL,'null'),(324,'E33','2019-06-29 14:35:30',NULL,NULL,'10001'),(325,'null','2019-06-29 14:43:17',NULL,NULL,'10001'),(326,'null','2019-06-29 14:44:24',NULL,NULL,'10001'),(327,'null','2019-06-29 14:44:27',NULL,NULL,'10001'),(328,'null','2019-06-29 14:44:40',NULL,NULL,'10001'),(331,'C001','2019-06-29 15:07:44',NULL,'å¥æª','10001'),(332,'C001','2019-06-29 15:08:21',NULL,NULL,'10001'),(333,'C001','2019-06-29 15:10:21','2019-06-29 15:47:00',NULL,'10001'),(334,'X23','2019-06-30 10:10:20',NULL,NULL,'10001'),(336,'X23','2019-06-30 10:15:00',NULL,NULL,'10001'),(337,'X23','2019-06-30 10:16:22',NULL,NULL,'10001'),(345,'X23','2019-06-30 13:49:30','2019-06-30 13:49:52','null','10001');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `Owner_Code` char(8) NOT NULL,
  `Name` varchar(5) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `Password` char(8) DEFAULT NULL,
  `Phone_num` int(11) DEFAULT NULL,
  `Address` tinytext,
  PRIMARY KEY (`Owner_Code`),
  UNIQUE KEY `Owner_Owner_Code_uindex` (`Owner_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `owner` */

insert  into `owner`(`Owner_Code`,`Name`,`Gender`,`Password`,`Phone_num`,`Address`) values ('1002','sad','\0','123456',213233,'beijing'),('1003','Abbey',NULL,'123456',155,'北京'),('1004','Alex',NULL,'123456',199,'广州'),('1005','child','\0','22223',213233,'åäº¬'),('1006','eee','','22222',1807032,'beijing'),('1007','aaa','\0','88888',1807032,'beijing'),('1009','child','\0','88888',213233,'beijing'),('1010','child','\0','88888',213233,'beijing'),('123456','child','\0','88888',213233,'beijing');

/*Table structure for table `owner_balance` */

DROP TABLE IF EXISTS `owner_balance`;

CREATE TABLE `owner_balance` (
  `Owner_Code` char(8) NOT NULL,
  `remain` float DEFAULT NULL,
  PRIMARY KEY (`Owner_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `owner_balance` */

insert  into `owner_balance`(`Owner_Code`,`remain`) values ('1001',233.99),('1002',59);

/*Table structure for table `rate` */

DROP TABLE IF EXISTS `rate`;

CREATE TABLE `rate` (
  `Car_Code` char(8) NOT NULL,
  `Time_rate` float(5,0) DEFAULT NULL,
  `Over_rate` float(5,0) DEFAULT NULL,
  `Start_fare` float(5,0) DEFAULT NULL,
  PRIMARY KEY (`Car_Code`),
  UNIQUE KEY `Rate_Car_Code_uindex` (`Car_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `rate` */

insert  into `rate`(`Car_Code`,`Time_rate`,`Over_rate`,`Start_fare`) values ('C001',12,15,50),('E33',20,23,44),('X23',12,23,100);

/*Table structure for table `renter` */

DROP TABLE IF EXISTS `renter`;

CREATE TABLE `renter` (
  `Renter_Code` char(8) NOT NULL,
  `Name` varchar(5) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `Address` tinytext,
  `Password` char(8) DEFAULT NULL,
  PRIMARY KEY (`Renter_Code`),
  UNIQUE KEY `Renter_Renter_Code_uindex` (`Renter_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `renter` */

insert  into `renter`(`Renter_Code`,`Name`,`Age`,`Gender`,`Address`,`Password`) values ('0004','child',12,'\0','beijing','88888'),('0005','Aaron',18,NULL,'深圳','123456'),('0006','Adam',20,NULL,'上海','123456'),('10001','child',12,'\0','beijing','123456'),('10002','Luby',22,NULL,'北京','123456'),('6666667','boy',22,'','beijing','88888');

/*Table structure for table `renter_balance` */

DROP TABLE IF EXISTS `renter_balance`;

CREATE TABLE `renter_balance` (
  `Renter_Code` char(8) NOT NULL,
  `remain` float DEFAULT NULL,
  PRIMARY KEY (`Renter_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `renter_balance` */

insert  into `renter_balance`(`Renter_Code`,`remain`) values ('10001',15);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `no` int(11) NOT NULL,
  `name` char(9) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `test_no_uindex` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `test` */

insert  into `test`(`no`,`name`,`sex`) values (1,'hat',1),(2,'jone',0);

/* Trigger structure for table `order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `Carstatus_u_tri` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `Carstatus_u_tri` AFTER INSERT ON `order` FOR EACH ROW #INSERT INTO Car VALUES ('C002','M002',0,'Man002','Owner02',NULL);
            UPDATE Car SET Car.Rent = 1 WHERE Car.Car_Code = NEW.Car_Code */$$


DELIMITER ;

/* Trigger structure for table `order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `Bill_u_tri` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `Bill_u_tri` AFTER UPDATE ON `order` FOR EACH ROW BEGIN
	UPDATE Bill,`Order`
        SET Real_time = (TIMEDIFF(`Order`.End_time,`Order`.Start_time))/10000
    WHERE Bill.Order_Code=`Order`.Order_Code;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `proc_BillSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_BillSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_BillSelect`()
begin
    select * from Bill;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_CarDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_CarDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_CarDelete`(in CarCode char(5))
begin
    delete from Car where Car.Car_Code=CarCode;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_CarInsert` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_CarInsert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_CarInsert`(in CarCode char(5),in Model char(6),in ManagerCode char(8),in OwnerCode char(8))
begin
    insert into Car
        values (CarCode,Model,0,ManagerCode,OwnerCode,NULL);
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_CarSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_CarSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_CarSelect`()
begin
    select * from Car;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_CarSelect_Renter` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_CarSelect_Renter` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_CarSelect_Renter`()
begin
    select Car_Code,Model,Rent
    from Car;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_CheckbillDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_CheckbillDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_CheckbillDelete`(IN code int)
begin
    delete from Check_Bill
        where Check_Code = code;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ManagerDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ManagerDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_ManagerDelete`(IN code int)
begin
    delete from Manager
        where Manager_Code = code;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_OrderDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_OrderDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_OrderDelete`(IN code int)
begin
    delete from `Order`
        where Order_Code = code;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_OrderEndUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_OrderEndUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_OrderEndUpdate`(in code int,out CarCode char)
begin
    update `Order`
    set `Order`.End_time = now()
        where `Order`.Order_Code = code;
    select `Order`.Car_Code from `Order` where Order_Code=(select last_insert_id()) into CarCode;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_OrderInsert` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_OrderInsert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_OrderInsert`(IN RenterCode int, IN CarCode int, IN OrderTime int, OUT OrderCode int)
begin
    insert into `Order`
        values (NULL,CarCode,now(),NUll,NUll,RenterCode);
    select `Order`.Order_Code from `Order` where Order_Code=(select last_insert_id()) into OrderCode;
    insert into Bill
        values (OrderCode,OrderTime,NULL,NULL);
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_OrderSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_OrderSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_OrderSelect`()
begin
    select * from `Order`;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_OwnerDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_OwnerDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_OwnerDelete`(IN code int)
begin
    delete from Owner
        where Owner_Code = code;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_OwnerSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_OwnerSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_OwnerSelect`()
begin
    select * from Owner;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_RateDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_RateDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_RateDelete`(IN code int)
begin
    delete from Rate
        where Car_Code = code;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_RateSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_RateSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_RateSelect`()
begin
    select * from Rate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_RenterDelete` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_RenterDelete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_RenterDelete`(IN code int)
begin
    delete from Renter
        where Renter_Code = code;
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_RrenterSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_RrenterSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_RrenterSelect`()
begin
    select * from Renter;
end */$$
DELIMITER ;

/*Table structure for table `bill_view` */

DROP TABLE IF EXISTS `bill_view`;

/*!50001 DROP VIEW IF EXISTS `bill_view` */;
/*!50001 DROP TABLE IF EXISTS `bill_view` */;

/*!50001 CREATE TABLE  `bill_view`(
 `Bill_Code` int(8) ,
 `Order_Code` int(8) ,
 `Car_Code` char(5) ,
 `start_time` datetime ,
 `end_time` datetime ,
 `Order_Time` int(8) ,
 `real_time` int(11) ,
 `Money` float ,
 `note` text ,
 `Renter_Code` char(8) ,
 `Time_rate` float(5,0) ,
 `Over_rate` float(5,0) ,
 `Start_fare` float(5,0) 
)*/;

/*Table structure for table `car_message` */

DROP TABLE IF EXISTS `car_message`;

/*!50001 DROP VIEW IF EXISTS `car_message` */;
/*!50001 DROP TABLE IF EXISTS `car_message` */;

/*!50001 CREATE TABLE  `car_message`(
 `Car_Code` char(8) ,
 `Model` varchar(6) ,
 `Manager_Code` char(8) ,
 `Rent` bit(1) ,
 `Owner_Code` char(8) ,
 `note` text ,
 `Time_rate` float(5,0) ,
 `Over_rate` float(5,0) ,
 `Start_fare` float(5,0) 
)*/;

/*Table structure for table `car_view` */

DROP TABLE IF EXISTS `car_view`;

/*!50001 DROP VIEW IF EXISTS `car_view` */;
/*!50001 DROP TABLE IF EXISTS `car_view` */;

/*!50001 CREATE TABLE  `car_view`(
 `Car_Code` char(5) ,
 `Manager_Code` char(8) ,
 `Rent` bit(1) ,
 `Sign` bit(1) ,
 `Sign_Describe` tinytext 
)*/;

/*Table structure for table `host_summary` */

DROP TABLE IF EXISTS `host_summary`;

/*!50001 DROP VIEW IF EXISTS `host_summary` */;
/*!50001 DROP TABLE IF EXISTS `host_summary` */;

/*!50001 CREATE TABLE  `host_summary`(
 `host` int(1) ,
 `statements` int(1) ,
 `statement_latency` int(1) ,
 `statement_avg_latency` int(1) ,
 `table_scans` int(1) ,
 `file_ios` int(1) ,
 `file_io_latency` int(1) ,
 `current_connections` int(1) ,
 `total_connections` int(1) ,
 `unique_users` int(1) ,
 `current_memory` int(1) ,
 `total_memory_allocated` int(1) 
)*/;

/*Table structure for table `host_summary_by_file_io` */

DROP TABLE IF EXISTS `host_summary_by_file_io`;

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io` */;
/*!50001 DROP TABLE IF EXISTS `host_summary_by_file_io` */;

/*!50001 CREATE TABLE  `host_summary_by_file_io`(
 `host` int(1) ,
 `ios` int(1) ,
 `io_latency` int(1) 
)*/;

/*Table structure for table `host_summary_by_file_io_type` */

DROP TABLE IF EXISTS `host_summary_by_file_io_type`;

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type` */;
/*!50001 DROP TABLE IF EXISTS `host_summary_by_file_io_type` */;

/*!50001 CREATE TABLE  `host_summary_by_file_io_type`(
 `host` int(1) ,
 `event_name` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*Table structure for table `host_summary_by_stages` */

DROP TABLE IF EXISTS `host_summary_by_stages`;

/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages` */;
/*!50001 DROP TABLE IF EXISTS `host_summary_by_stages` */;

/*!50001 CREATE TABLE  `host_summary_by_stages`(
 `host` int(1) ,
 `event_name` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `avg_latency` int(1) 
)*/;

/*Table structure for table `host_summary_by_statement_latency` */

DROP TABLE IF EXISTS `host_summary_by_statement_latency`;

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency` */;
/*!50001 DROP TABLE IF EXISTS `host_summary_by_statement_latency` */;

/*!50001 CREATE TABLE  `host_summary_by_statement_latency`(
 `host` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `lock_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_examined` int(1) ,
 `rows_affected` int(1) ,
 `full_scans` int(1) 
)*/;

/*Table structure for table `host_summary_by_statement_type` */

DROP TABLE IF EXISTS `host_summary_by_statement_type`;

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type` */;
/*!50001 DROP TABLE IF EXISTS `host_summary_by_statement_type` */;

/*!50001 CREATE TABLE  `host_summary_by_statement_type`(
 `host` int(1) ,
 `statement` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `lock_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_examined` int(1) ,
 `rows_affected` int(1) ,
 `full_scans` int(1) 
)*/;

/*Table structure for table `innodb_buffer_stats_by_schema` */

DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema`;

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema` */;
/*!50001 DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema` */;

/*!50001 CREATE TABLE  `innodb_buffer_stats_by_schema`(
 `object_schema` int(1) ,
 `allocated` int(1) ,
 `data` int(1) ,
 `pages` int(1) ,
 `pages_hashed` int(1) ,
 `pages_old` int(1) ,
 `rows_cached` int(1) 
)*/;

/*Table structure for table `innodb_buffer_stats_by_table` */

DROP TABLE IF EXISTS `innodb_buffer_stats_by_table`;

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table` */;
/*!50001 DROP TABLE IF EXISTS `innodb_buffer_stats_by_table` */;

/*!50001 CREATE TABLE  `innodb_buffer_stats_by_table`(
 `object_schema` int(1) ,
 `object_name` int(1) ,
 `allocated` int(1) ,
 `data` int(1) ,
 `pages` int(1) ,
 `pages_hashed` int(1) ,
 `pages_old` int(1) ,
 `rows_cached` int(1) 
)*/;

/*Table structure for table `innodb_lock_waits` */

DROP TABLE IF EXISTS `innodb_lock_waits`;

/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits` */;
/*!50001 DROP TABLE IF EXISTS `innodb_lock_waits` */;

/*!50001 CREATE TABLE  `innodb_lock_waits`(
 `wait_started` int(1) ,
 `wait_age` int(1) ,
 `wait_age_secs` int(1) ,
 `locked_table` int(1) ,
 `locked_table_schema` int(1) ,
 `locked_table_name` int(1) ,
 `locked_table_partition` int(1) ,
 `locked_table_subpartition` int(1) ,
 `locked_index` int(1) ,
 `locked_type` int(1) ,
 `waiting_trx_id` int(1) ,
 `waiting_trx_started` int(1) ,
 `waiting_trx_age` int(1) ,
 `waiting_trx_rows_locked` int(1) ,
 `waiting_trx_rows_modified` int(1) ,
 `waiting_pid` int(1) ,
 `waiting_query` int(1) ,
 `waiting_lock_id` int(1) ,
 `waiting_lock_mode` int(1) ,
 `blocking_trx_id` int(1) ,
 `blocking_pid` int(1) ,
 `blocking_query` int(1) ,
 `blocking_lock_id` int(1) ,
 `blocking_lock_mode` int(1) ,
 `blocking_trx_started` int(1) ,
 `blocking_trx_age` int(1) ,
 `blocking_trx_rows_locked` int(1) ,
 `blocking_trx_rows_modified` int(1) ,
 `sql_kill_blocking_query` int(1) ,
 `sql_kill_blocking_connection` int(1) 
)*/;

/*Table structure for table `io_by_thread_by_latency` */

DROP TABLE IF EXISTS `io_by_thread_by_latency`;

/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `io_by_thread_by_latency` */;

/*!50001 CREATE TABLE  `io_by_thread_by_latency`(
 `user` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `min_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) ,
 `thread_id` int(1) ,
 `processlist_id` int(1) 
)*/;

/*Table structure for table `io_global_by_file_by_bytes` */

DROP TABLE IF EXISTS `io_global_by_file_by_bytes`;

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes` */;
/*!50001 DROP TABLE IF EXISTS `io_global_by_file_by_bytes` */;

/*!50001 CREATE TABLE  `io_global_by_file_by_bytes`(
 `file` int(1) ,
 `count_read` int(1) ,
 `total_read` int(1) ,
 `avg_read` int(1) ,
 `count_write` int(1) ,
 `total_written` int(1) ,
 `avg_write` int(1) ,
 `total` int(1) ,
 `write_pct` int(1) 
)*/;

/*Table structure for table `io_global_by_file_by_latency` */

DROP TABLE IF EXISTS `io_global_by_file_by_latency`;

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `io_global_by_file_by_latency` */;

/*!50001 CREATE TABLE  `io_global_by_file_by_latency`(
 `file` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `count_read` int(1) ,
 `read_latency` int(1) ,
 `count_write` int(1) ,
 `write_latency` int(1) ,
 `count_misc` int(1) ,
 `misc_latency` int(1) 
)*/;

/*Table structure for table `io_global_by_wait_by_bytes` */

DROP TABLE IF EXISTS `io_global_by_wait_by_bytes`;

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes` */;
/*!50001 DROP TABLE IF EXISTS `io_global_by_wait_by_bytes` */;

/*!50001 CREATE TABLE  `io_global_by_wait_by_bytes`(
 `event_name` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `min_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) ,
 `count_read` int(1) ,
 `total_read` int(1) ,
 `avg_read` int(1) ,
 `count_write` int(1) ,
 `total_written` int(1) ,
 `avg_written` int(1) ,
 `total_requested` int(1) 
)*/;

/*Table structure for table `io_global_by_wait_by_latency` */

DROP TABLE IF EXISTS `io_global_by_wait_by_latency`;

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `io_global_by_wait_by_latency` */;

/*!50001 CREATE TABLE  `io_global_by_wait_by_latency`(
 `event_name` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) ,
 `read_latency` int(1) ,
 `write_latency` int(1) ,
 `misc_latency` int(1) ,
 `count_read` int(1) ,
 `total_read` int(1) ,
 `avg_read` int(1) ,
 `count_write` int(1) ,
 `total_written` int(1) ,
 `avg_written` int(1) 
)*/;

/*Table structure for table `latest_file_io` */

DROP TABLE IF EXISTS `latest_file_io`;

/*!50001 DROP VIEW IF EXISTS `latest_file_io` */;
/*!50001 DROP TABLE IF EXISTS `latest_file_io` */;

/*!50001 CREATE TABLE  `latest_file_io`(
 `thread` int(1) ,
 `file` int(1) ,
 `latency` int(1) ,
 `operation` int(1) ,
 `requested` int(1) 
)*/;

/*Table structure for table `memory_by_host_by_current_bytes` */

DROP TABLE IF EXISTS `memory_by_host_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `memory_by_host_by_current_bytes` */;

/*!50001 CREATE TABLE  `memory_by_host_by_current_bytes`(
 `host` int(1) ,
 `current_count_used` int(1) ,
 `current_allocated` int(1) ,
 `current_avg_alloc` int(1) ,
 `current_max_alloc` int(1) ,
 `total_allocated` int(1) 
)*/;

/*Table structure for table `memory_by_thread_by_current_bytes` */

DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes` */;

/*!50001 CREATE TABLE  `memory_by_thread_by_current_bytes`(
 `thread_id` int(1) ,
 `user` int(1) ,
 `current_count_used` int(1) ,
 `current_allocated` int(1) ,
 `current_avg_alloc` int(1) ,
 `current_max_alloc` int(1) ,
 `total_allocated` int(1) 
)*/;

/*Table structure for table `memory_by_user_by_current_bytes` */

DROP TABLE IF EXISTS `memory_by_user_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `memory_by_user_by_current_bytes` */;

/*!50001 CREATE TABLE  `memory_by_user_by_current_bytes`(
 `user` int(1) ,
 `current_count_used` int(1) ,
 `current_allocated` int(1) ,
 `current_avg_alloc` int(1) ,
 `current_max_alloc` int(1) ,
 `total_allocated` int(1) 
)*/;

/*Table structure for table `memory_global_by_current_bytes` */

DROP TABLE IF EXISTS `memory_global_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `memory_global_by_current_bytes` */;

/*!50001 CREATE TABLE  `memory_global_by_current_bytes`(
 `event_name` int(1) ,
 `current_count` int(1) ,
 `current_alloc` int(1) ,
 `current_avg_alloc` int(1) ,
 `high_count` int(1) ,
 `high_alloc` int(1) ,
 `high_avg_alloc` int(1) 
)*/;

/*Table structure for table `memory_global_total` */

DROP TABLE IF EXISTS `memory_global_total`;

/*!50001 DROP VIEW IF EXISTS `memory_global_total` */;
/*!50001 DROP TABLE IF EXISTS `memory_global_total` */;

/*!50001 CREATE TABLE  `memory_global_total`(
 `total_allocated` int(1) 
)*/;

/*Table structure for table `metrics` */

DROP TABLE IF EXISTS `metrics`;

/*!50001 DROP VIEW IF EXISTS `metrics` */;
/*!50001 DROP TABLE IF EXISTS `metrics` */;

/*!50001 CREATE TABLE  `metrics`(
 `Variable_name` int(1) ,
 `Variable_value` int(1) ,
 `Type` int(1) ,
 `Enabled` int(1) 
)*/;

/*Table structure for table `processlist` */

DROP TABLE IF EXISTS `processlist`;

/*!50001 DROP VIEW IF EXISTS `processlist` */;
/*!50001 DROP TABLE IF EXISTS `processlist` */;

/*!50001 CREATE TABLE  `processlist`(
 `thd_id` int(1) ,
 `conn_id` int(1) ,
 `user` int(1) ,
 `db` int(1) ,
 `command` int(1) ,
 `state` int(1) ,
 `time` int(1) ,
 `current_statement` int(1) ,
 `statement_latency` int(1) ,
 `progress` int(1) ,
 `lock_latency` int(1) ,
 `rows_examined` int(1) ,
 `rows_sent` int(1) ,
 `rows_affected` int(1) ,
 `tmp_tables` int(1) ,
 `tmp_disk_tables` int(1) ,
 `full_scan` int(1) ,
 `last_statement` int(1) ,
 `last_statement_latency` int(1) ,
 `current_memory` int(1) ,
 `last_wait` int(1) ,
 `last_wait_latency` int(1) ,
 `source` int(1) ,
 `trx_latency` int(1) ,
 `trx_state` int(1) ,
 `trx_autocommit` int(1) ,
 `pid` int(1) ,
 `program_name` int(1) 
)*/;

/*Table structure for table `ps_check_lost_instrumentation` */

DROP TABLE IF EXISTS `ps_check_lost_instrumentation`;

/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation` */;
/*!50001 DROP TABLE IF EXISTS `ps_check_lost_instrumentation` */;

/*!50001 CREATE TABLE  `ps_check_lost_instrumentation`(
 `variable_name` int(1) ,
 `variable_value` int(1) 
)*/;

/*Table structure for table `rent_view` */

DROP TABLE IF EXISTS `rent_view`;

/*!50001 DROP VIEW IF EXISTS `rent_view` */;
/*!50001 DROP TABLE IF EXISTS `rent_view` */;

/*!50001 CREATE TABLE  `rent_view`(
 `Car_Code` char(5) ,
 `Order_Code` int(8) ,
 `Money` float ,
 `Order_TIme` int(8) 
)*/;

/*Table structure for table `schema_auto_increment_columns` */

DROP TABLE IF EXISTS `schema_auto_increment_columns`;

/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns` */;
/*!50001 DROP TABLE IF EXISTS `schema_auto_increment_columns` */;

/*!50001 CREATE TABLE  `schema_auto_increment_columns`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `column_name` int(1) ,
 `data_type` int(1) ,
 `column_type` int(1) ,
 `is_signed` int(1) ,
 `is_unsigned` int(1) ,
 `max_value` int(1) ,
 `auto_increment` int(1) ,
 `auto_increment_ratio` int(1) 
)*/;

/*Table structure for table `schema_index_statistics` */

DROP TABLE IF EXISTS `schema_index_statistics`;

/*!50001 DROP VIEW IF EXISTS `schema_index_statistics` */;
/*!50001 DROP TABLE IF EXISTS `schema_index_statistics` */;

/*!50001 CREATE TABLE  `schema_index_statistics`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `index_name` int(1) ,
 `rows_selected` int(1) ,
 `select_latency` int(1) ,
 `rows_inserted` int(1) ,
 `insert_latency` int(1) ,
 `rows_updated` int(1) ,
 `update_latency` int(1) ,
 `rows_deleted` int(1) ,
 `delete_latency` int(1) 
)*/;

/*Table structure for table `schema_object_overview` */

DROP TABLE IF EXISTS `schema_object_overview`;

/*!50001 DROP VIEW IF EXISTS `schema_object_overview` */;
/*!50001 DROP TABLE IF EXISTS `schema_object_overview` */;

/*!50001 CREATE TABLE  `schema_object_overview`(
 `db` int(1) ,
 `object_type` int(1) ,
 `count` int(1) 
)*/;

/*Table structure for table `schema_redundant_indexes` */

DROP TABLE IF EXISTS `schema_redundant_indexes`;

/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes` */;
/*!50001 DROP TABLE IF EXISTS `schema_redundant_indexes` */;

/*!50001 CREATE TABLE  `schema_redundant_indexes`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `redundant_index_name` int(1) ,
 `redundant_index_columns` int(1) ,
 `redundant_index_non_unique` int(1) ,
 `dominant_index_name` int(1) ,
 `dominant_index_columns` int(1) ,
 `dominant_index_non_unique` int(1) ,
 `subpart_exists` int(1) ,
 `sql_drop_index` int(1) 
)*/;

/*Table structure for table `schema_table_lock_waits` */

DROP TABLE IF EXISTS `schema_table_lock_waits`;

/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits` */;
/*!50001 DROP TABLE IF EXISTS `schema_table_lock_waits` */;

/*!50001 CREATE TABLE  `schema_table_lock_waits`(
 `object_schema` int(1) ,
 `object_name` int(1) ,
 `waiting_thread_id` int(1) ,
 `waiting_pid` int(1) ,
 `waiting_account` int(1) ,
 `waiting_lock_type` int(1) ,
 `waiting_lock_duration` int(1) ,
 `waiting_query` int(1) ,
 `waiting_query_secs` int(1) ,
 `waiting_query_rows_affected` int(1) ,
 `waiting_query_rows_examined` int(1) ,
 `blocking_thread_id` int(1) ,
 `blocking_pid` int(1) ,
 `blocking_account` int(1) ,
 `blocking_lock_type` int(1) ,
 `blocking_lock_duration` int(1) ,
 `sql_kill_blocking_query` int(1) ,
 `sql_kill_blocking_connection` int(1) 
)*/;

/*Table structure for table `schema_table_statistics` */

DROP TABLE IF EXISTS `schema_table_statistics`;

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics` */;
/*!50001 DROP TABLE IF EXISTS `schema_table_statistics` */;

/*!50001 CREATE TABLE  `schema_table_statistics`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `total_latency` int(1) ,
 `rows_fetched` int(1) ,
 `fetch_latency` int(1) ,
 `rows_inserted` int(1) ,
 `insert_latency` int(1) ,
 `rows_updated` int(1) ,
 `update_latency` int(1) ,
 `rows_deleted` int(1) ,
 `delete_latency` int(1) ,
 `io_read_requests` int(1) ,
 `io_read` int(1) ,
 `io_read_latency` int(1) ,
 `io_write_requests` int(1) ,
 `io_write` int(1) ,
 `io_write_latency` int(1) ,
 `io_misc_requests` int(1) ,
 `io_misc_latency` int(1) 
)*/;

/*Table structure for table `schema_table_statistics_with_buffer` */

DROP TABLE IF EXISTS `schema_table_statistics_with_buffer`;

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer` */;
/*!50001 DROP TABLE IF EXISTS `schema_table_statistics_with_buffer` */;

/*!50001 CREATE TABLE  `schema_table_statistics_with_buffer`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `rows_fetched` int(1) ,
 `fetch_latency` int(1) ,
 `rows_inserted` int(1) ,
 `insert_latency` int(1) ,
 `rows_updated` int(1) ,
 `update_latency` int(1) ,
 `rows_deleted` int(1) ,
 `delete_latency` int(1) ,
 `io_read_requests` int(1) ,
 `io_read` int(1) ,
 `io_read_latency` int(1) ,
 `io_write_requests` int(1) ,
 `io_write` int(1) ,
 `io_write_latency` int(1) ,
 `io_misc_requests` int(1) ,
 `io_misc_latency` int(1) ,
 `innodb_buffer_allocated` int(1) ,
 `innodb_buffer_data` int(1) ,
 `innodb_buffer_free` int(1) ,
 `innodb_buffer_pages` int(1) ,
 `innodb_buffer_pages_hashed` int(1) ,
 `innodb_buffer_pages_old` int(1) ,
 `innodb_buffer_rows_cached` int(1) 
)*/;

/*Table structure for table `schema_tables_with_full_table_scans` */

DROP TABLE IF EXISTS `schema_tables_with_full_table_scans`;

/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans` */;
/*!50001 DROP TABLE IF EXISTS `schema_tables_with_full_table_scans` */;

/*!50001 CREATE TABLE  `schema_tables_with_full_table_scans`(
 `object_schema` int(1) ,
 `object_name` int(1) ,
 `rows_full_scanned` int(1) ,
 `latency` int(1) 
)*/;

/*Table structure for table `schema_unused_indexes` */

DROP TABLE IF EXISTS `schema_unused_indexes`;

/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes` */;
/*!50001 DROP TABLE IF EXISTS `schema_unused_indexes` */;

/*!50001 CREATE TABLE  `schema_unused_indexes`(
 `object_schema` int(1) ,
 `object_name` int(1) ,
 `index_name` int(1) 
)*/;

/*Table structure for table `session` */

DROP TABLE IF EXISTS `session`;

/*!50001 DROP VIEW IF EXISTS `session` */;
/*!50001 DROP TABLE IF EXISTS `session` */;

/*!50001 CREATE TABLE  `session`(
 `thd_id` int(1) ,
 `conn_id` int(1) ,
 `user` int(1) ,
 `db` int(1) ,
 `command` int(1) ,
 `state` int(1) ,
 `time` int(1) ,
 `current_statement` int(1) ,
 `statement_latency` int(1) ,
 `progress` int(1) ,
 `lock_latency` int(1) ,
 `rows_examined` int(1) ,
 `rows_sent` int(1) ,
 `rows_affected` int(1) ,
 `tmp_tables` int(1) ,
 `tmp_disk_tables` int(1) ,
 `full_scan` int(1) ,
 `last_statement` int(1) ,
 `last_statement_latency` int(1) ,
 `current_memory` int(1) ,
 `last_wait` int(1) ,
 `last_wait_latency` int(1) ,
 `source` int(1) ,
 `trx_latency` int(1) ,
 `trx_state` int(1) ,
 `trx_autocommit` int(1) ,
 `pid` int(1) ,
 `program_name` int(1) 
)*/;

/*Table structure for table `session_ssl_status` */

DROP TABLE IF EXISTS `session_ssl_status`;

/*!50001 DROP VIEW IF EXISTS `session_ssl_status` */;
/*!50001 DROP TABLE IF EXISTS `session_ssl_status` */;

/*!50001 CREATE TABLE  `session_ssl_status`(
 `thread_id` int(1) ,
 `ssl_version` int(1) ,
 `ssl_cipher` int(1) ,
 `ssl_sessions_reused` int(1) 
)*/;

/*Table structure for table `statement_analysis` */

DROP TABLE IF EXISTS `statement_analysis`;

/*!50001 DROP VIEW IF EXISTS `statement_analysis` */;
/*!50001 DROP TABLE IF EXISTS `statement_analysis` */;

/*!50001 CREATE TABLE  `statement_analysis`(
 `query` int(1) ,
 `db` int(1) ,
 `full_scan` int(1) ,
 `exec_count` int(1) ,
 `err_count` int(1) ,
 `warn_count` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `avg_latency` int(1) ,
 `lock_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_sent_avg` int(1) ,
 `rows_examined` int(1) ,
 `rows_examined_avg` int(1) ,
 `rows_affected` int(1) ,
 `rows_affected_avg` int(1) ,
 `tmp_tables` int(1) ,
 `tmp_disk_tables` int(1) ,
 `rows_sorted` int(1) ,
 `sort_merge_passes` int(1) ,
 `digest` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) 
)*/;

/*Table structure for table `statements_with_errors_or_warnings` */

DROP TABLE IF EXISTS `statements_with_errors_or_warnings`;

/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings` */;
/*!50001 DROP TABLE IF EXISTS `statements_with_errors_or_warnings` */;

/*!50001 CREATE TABLE  `statements_with_errors_or_warnings`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `errors` int(1) ,
 `error_pct` int(1) ,
 `warnings` int(1) ,
 `warning_pct` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `statements_with_full_table_scans` */

DROP TABLE IF EXISTS `statements_with_full_table_scans`;

/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans` */;
/*!50001 DROP TABLE IF EXISTS `statements_with_full_table_scans` */;

/*!50001 CREATE TABLE  `statements_with_full_table_scans`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `total_latency` int(1) ,
 `no_index_used_count` int(1) ,
 `no_good_index_used_count` int(1) ,
 `no_index_used_pct` int(1) ,
 `rows_sent` int(1) ,
 `rows_examined` int(1) ,
 `rows_sent_avg` int(1) ,
 `rows_examined_avg` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `statements_with_runtimes_in_95th_percentile` */

DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile`;

/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile` */;
/*!50001 DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile` */;

/*!50001 CREATE TABLE  `statements_with_runtimes_in_95th_percentile`(
 `query` int(1) ,
 `db` int(1) ,
 `full_scan` int(1) ,
 `exec_count` int(1) ,
 `err_count` int(1) ,
 `warn_count` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `avg_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_sent_avg` int(1) ,
 `rows_examined` int(1) ,
 `rows_examined_avg` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `statements_with_sorting` */

DROP TABLE IF EXISTS `statements_with_sorting`;

/*!50001 DROP VIEW IF EXISTS `statements_with_sorting` */;
/*!50001 DROP TABLE IF EXISTS `statements_with_sorting` */;

/*!50001 CREATE TABLE  `statements_with_sorting`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `total_latency` int(1) ,
 `sort_merge_passes` int(1) ,
 `avg_sort_merges` int(1) ,
 `sorts_using_scans` int(1) ,
 `sort_using_range` int(1) ,
 `rows_sorted` int(1) ,
 `avg_rows_sorted` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `statements_with_temp_tables` */

DROP TABLE IF EXISTS `statements_with_temp_tables`;

/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables` */;
/*!50001 DROP TABLE IF EXISTS `statements_with_temp_tables` */;

/*!50001 CREATE TABLE  `statements_with_temp_tables`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `total_latency` int(1) ,
 `memory_tmp_tables` int(1) ,
 `disk_tmp_tables` int(1) ,
 `avg_tmp_tables_per_query` int(1) ,
 `tmp_tables_to_disk_pct` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `user_summary` */

DROP TABLE IF EXISTS `user_summary`;

/*!50001 DROP VIEW IF EXISTS `user_summary` */;
/*!50001 DROP TABLE IF EXISTS `user_summary` */;

/*!50001 CREATE TABLE  `user_summary`(
 `user` varchar(32) ,
 `statements` decimal(32,0) ,
 `statement_latency` text ,
 `statement_avg_latency` text ,
 `table_scans` decimal(32,0) ,
 `file_ios` decimal(32,0) ,
 `file_io_latency` text ,
 `current_connections` decimal(41,0) ,
 `total_connections` decimal(41,0) ,
 `unique_hosts` bigint(21) ,
 `current_memory` text ,
 `total_memory_allocated` text 
)*/;

/*Table structure for table `user_summary_by_file_io` */

DROP TABLE IF EXISTS `user_summary_by_file_io`;

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io` */;
/*!50001 DROP TABLE IF EXISTS `user_summary_by_file_io` */;

/*!50001 CREATE TABLE  `user_summary_by_file_io`(
 `user` varchar(32) ,
 `ios` decimal(42,0) ,
 `io_latency` text 
)*/;

/*Table structure for table `user_summary_by_file_io_type` */

DROP TABLE IF EXISTS `user_summary_by_file_io_type`;

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type` */;
/*!50001 DROP TABLE IF EXISTS `user_summary_by_file_io_type` */;

/*!50001 CREATE TABLE  `user_summary_by_file_io_type`(
 `user` varchar(32) ,
 `event_name` varchar(128) ,
 `total` bigint(20) unsigned ,
 `latency` text ,
 `max_latency` text 
)*/;

/*Table structure for table `user_summary_by_stages` */

DROP TABLE IF EXISTS `user_summary_by_stages`;

/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages` */;
/*!50001 DROP TABLE IF EXISTS `user_summary_by_stages` */;

/*!50001 CREATE TABLE  `user_summary_by_stages`(
 `user` varchar(32) ,
 `event_name` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` text ,
 `avg_latency` text 
)*/;

/*Table structure for table `user_summary_by_statement_latency` */

DROP TABLE IF EXISTS `user_summary_by_statement_latency`;

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency` */;
/*!50001 DROP TABLE IF EXISTS `user_summary_by_statement_latency` */;

/*!50001 CREATE TABLE  `user_summary_by_statement_latency`(
 `user` varchar(32) ,
 `total` decimal(42,0) ,
 `total_latency` text ,
 `max_latency` text ,
 `lock_latency` text ,
 `rows_sent` decimal(42,0) ,
 `rows_examined` decimal(42,0) ,
 `rows_affected` decimal(42,0) ,
 `full_scans` decimal(43,0) 
)*/;

/*Table structure for table `user_summary_by_statement_type` */

DROP TABLE IF EXISTS `user_summary_by_statement_type`;

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type` */;
/*!50001 DROP TABLE IF EXISTS `user_summary_by_statement_type` */;

/*!50001 CREATE TABLE  `user_summary_by_statement_type`(
 `user` varchar(32) ,
 `statement` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` text ,
 `max_latency` text ,
 `lock_latency` text ,
 `rows_sent` bigint(20) unsigned ,
 `rows_examined` bigint(20) unsigned ,
 `rows_affected` bigint(20) unsigned ,
 `full_scans` bigint(21) unsigned 
)*/;

/*Table structure for table `version` */

DROP TABLE IF EXISTS `version`;

/*!50001 DROP VIEW IF EXISTS `version` */;
/*!50001 DROP TABLE IF EXISTS `version` */;

/*!50001 CREATE TABLE  `version`(
 `sys_version` varchar(5) ,
 `mysql_version` varchar(6) 
)*/;

/*Table structure for table `wait_classes_global_by_avg_latency` */

DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency`;

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency` */;
/*!50001 DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency` */;

/*!50001 CREATE TABLE  `wait_classes_global_by_avg_latency`(
 `event_class` varchar(128) ,
 `total` decimal(42,0) ,
 `total_latency` text ,
 `min_latency` text ,
 `avg_latency` text ,
 `max_latency` text 
)*/;

/*Table structure for table `wait_classes_global_by_latency` */

DROP TABLE IF EXISTS `wait_classes_global_by_latency`;

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `wait_classes_global_by_latency` */;

/*!50001 CREATE TABLE  `wait_classes_global_by_latency`(
 `event_class` varchar(128) ,
 `total` decimal(42,0) ,
 `total_latency` text ,
 `min_latency` text ,
 `avg_latency` text ,
 `max_latency` text 
)*/;

/*Table structure for table `waits_by_host_by_latency` */

DROP TABLE IF EXISTS `waits_by_host_by_latency`;

/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `waits_by_host_by_latency` */;

/*!50001 CREATE TABLE  `waits_by_host_by_latency`(
 `host` varchar(60) ,
 `event` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` text ,
 `avg_latency` text ,
 `max_latency` text 
)*/;

/*Table structure for table `waits_by_user_by_latency` */

DROP TABLE IF EXISTS `waits_by_user_by_latency`;

/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `waits_by_user_by_latency` */;

/*!50001 CREATE TABLE  `waits_by_user_by_latency`(
 `user` varchar(32) ,
 `event` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` text ,
 `avg_latency` text ,
 `max_latency` text 
)*/;

/*Table structure for table `waits_global_by_latency` */

DROP TABLE IF EXISTS `waits_global_by_latency`;

/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `waits_global_by_latency` */;

/*!50001 CREATE TABLE  `waits_global_by_latency`(
 `events` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` text ,
 `avg_latency` text ,
 `max_latency` text 
)*/;

/*Table structure for table `x$host_summary` */

DROP TABLE IF EXISTS `x$host_summary`;

/*!50001 DROP VIEW IF EXISTS `x$host_summary` */;
/*!50001 DROP TABLE IF EXISTS `x$host_summary` */;

/*!50001 CREATE TABLE  `x$host_summary`(
 `host` varchar(60) ,
 `statements` decimal(64,0) ,
 `statement_latency` decimal(64,0) ,
 `statement_avg_latency` decimal(65,4) ,
 `table_scans` decimal(65,0) ,
 `file_ios` decimal(64,0) ,
 `file_io_latency` decimal(64,0) ,
 `current_connections` decimal(41,0) ,
 `total_connections` decimal(41,0) ,
 `unique_users` bigint(21) ,
 `current_memory` decimal(63,0) ,
 `total_memory_allocated` decimal(64,0) 
)*/;

/*Table structure for table `x$host_summary_by_file_io` */

DROP TABLE IF EXISTS `x$host_summary_by_file_io`;

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io` */;
/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_file_io` */;

/*!50001 CREATE TABLE  `x$host_summary_by_file_io`(
 `host` varchar(60) ,
 `ios` decimal(42,0) ,
 `io_latency` decimal(42,0) 
)*/;

/*Table structure for table `x$host_summary_by_file_io_type` */

DROP TABLE IF EXISTS `x$host_summary_by_file_io_type`;

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type` */;
/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_file_io_type` */;

/*!50001 CREATE TABLE  `x$host_summary_by_file_io_type`(
 `host` varchar(60) ,
 `event_name` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` bigint(20) unsigned ,
 `max_latency` bigint(20) unsigned 
)*/;

/*Table structure for table `x$host_summary_by_stages` */

DROP TABLE IF EXISTS `x$host_summary_by_stages`;

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages` */;
/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_stages` */;

/*!50001 CREATE TABLE  `x$host_summary_by_stages`(
 `host` varchar(60) ,
 `event_name` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` bigint(20) unsigned ,
 `avg_latency` bigint(20) unsigned 
)*/;

/*Table structure for table `x$host_summary_by_statement_latency` */

DROP TABLE IF EXISTS `x$host_summary_by_statement_latency`;

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_statement_latency` */;

/*!50001 CREATE TABLE  `x$host_summary_by_statement_latency`(
 `host` varchar(60) ,
 `total` decimal(42,0) ,
 `total_latency` decimal(42,0) ,
 `max_latency` bigint(20) unsigned ,
 `lock_latency` decimal(42,0) ,
 `rows_sent` decimal(42,0) ,
 `rows_examined` decimal(42,0) ,
 `rows_affected` decimal(42,0) ,
 `full_scans` decimal(43,0) 
)*/;

/*Table structure for table `x$host_summary_by_statement_type` */

DROP TABLE IF EXISTS `x$host_summary_by_statement_type`;

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type` */;
/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_statement_type` */;

/*!50001 CREATE TABLE  `x$host_summary_by_statement_type`(
 `host` varchar(60) ,
 `statement` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` bigint(20) unsigned ,
 `max_latency` bigint(20) unsigned ,
 `lock_latency` bigint(20) unsigned ,
 `rows_sent` bigint(20) unsigned ,
 `rows_examined` bigint(20) unsigned ,
 `rows_affected` bigint(20) unsigned ,
 `full_scans` bigint(21) unsigned 
)*/;

/*Table structure for table `x$innodb_buffer_stats_by_schema` */

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema`;

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema` */;
/*!50001 DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema` */;

/*!50001 CREATE TABLE  `x$innodb_buffer_stats_by_schema`(
 `object_schema` text ,
 `allocated` decimal(43,0) ,
 `data` decimal(43,0) ,
 `pages` bigint(21) ,
 `pages_hashed` bigint(21) ,
 `pages_old` bigint(21) ,
 `rows_cached` decimal(44,0) 
)*/;

/*Table structure for table `x$innodb_buffer_stats_by_table` */

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table`;

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table` */;
/*!50001 DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table` */;

/*!50001 CREATE TABLE  `x$innodb_buffer_stats_by_table`(
 `object_schema` text ,
 `object_name` text ,
 `allocated` decimal(43,0) ,
 `data` decimal(43,0) ,
 `pages` bigint(21) ,
 `pages_hashed` bigint(21) ,
 `pages_old` bigint(21) ,
 `rows_cached` decimal(44,0) 
)*/;

/*Table structure for table `x$innodb_lock_waits` */

DROP TABLE IF EXISTS `x$innodb_lock_waits`;

/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits` */;
/*!50001 DROP TABLE IF EXISTS `x$innodb_lock_waits` */;

/*!50001 CREATE TABLE  `x$innodb_lock_waits`(
 `wait_started` datetime ,
 `wait_age` time ,
 `wait_age_secs` bigint(21) ,
 `locked_table` mediumtext ,
 `locked_table_schema` varchar(64) ,
 `locked_table_name` varchar(64) ,
 `locked_table_partition` varchar(64) ,
 `locked_table_subpartition` varchar(64) ,
 `locked_index` varchar(64) ,
 `locked_type` varchar(32) ,
 `waiting_trx_id` varchar(18) ,
 `waiting_trx_started` datetime ,
 `waiting_trx_age` time ,
 `waiting_trx_rows_locked` bigint(21) unsigned ,
 `waiting_trx_rows_modified` bigint(21) unsigned ,
 `waiting_pid` bigint(21) unsigned ,
 `waiting_query` varchar(1024) ,
 `waiting_lock_id` varchar(128) ,
 `waiting_lock_mode` varchar(32) ,
 `blocking_trx_id` varchar(18) ,
 `blocking_pid` bigint(21) unsigned ,
 `blocking_query` varchar(1024) ,
 `blocking_lock_id` varchar(128) ,
 `blocking_lock_mode` varchar(32) ,
 `blocking_trx_started` datetime ,
 `blocking_trx_age` time ,
 `blocking_trx_rows_locked` bigint(21) unsigned ,
 `blocking_trx_rows_modified` bigint(21) unsigned ,
 `sql_kill_blocking_query` varchar(32) ,
 `sql_kill_blocking_connection` varchar(26) 
)*/;

/*Table structure for table `x$io_by_thread_by_latency` */

DROP TABLE IF EXISTS `x$io_by_thread_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$io_by_thread_by_latency` */;

/*!50001 CREATE TABLE  `x$io_by_thread_by_latency`(
 `user` varchar(128) ,
 `total` decimal(42,0) ,
 `total_latency` decimal(42,0) ,
 `min_latency` bigint(20) unsigned ,
 `avg_latency` decimal(24,4) ,
 `max_latency` bigint(20) unsigned ,
 `thread_id` bigint(20) unsigned ,
 `processlist_id` bigint(20) unsigned 
)*/;

/*Table structure for table `x$io_global_by_file_by_bytes` */

DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes`;

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes` */;
/*!50001 DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes` */;

/*!50001 CREATE TABLE  `x$io_global_by_file_by_bytes`(
 `file` varchar(512) ,
 `count_read` bigint(20) unsigned ,
 `total_read` bigint(20) ,
 `avg_read` decimal(23,4) ,
 `count_write` bigint(20) unsigned ,
 `total_written` bigint(20) ,
 `avg_write` decimal(23,4) ,
 `total` bigint(21) ,
 `write_pct` decimal(26,2) 
)*/;

/*Table structure for table `x$io_global_by_file_by_latency` */

DROP TABLE IF EXISTS `x$io_global_by_file_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$io_global_by_file_by_latency` */;

/*!50001 CREATE TABLE  `x$io_global_by_file_by_latency`(
 `file` varchar(512) ,
 `total` bigint(20) unsigned ,
 `total_latency` bigint(20) unsigned ,
 `count_read` bigint(20) unsigned ,
 `read_latency` bigint(20) unsigned ,
 `count_write` bigint(20) unsigned ,
 `write_latency` bigint(20) unsigned ,
 `count_misc` bigint(20) unsigned ,
 `misc_latency` bigint(20) unsigned 
)*/;

/*Table structure for table `x$io_global_by_wait_by_bytes` */

DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes`;

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes` */;
/*!50001 DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes` */;

/*!50001 CREATE TABLE  `x$io_global_by_wait_by_bytes`(
 `event_name` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` bigint(20) unsigned ,
 `min_latency` bigint(20) unsigned ,
 `avg_latency` bigint(20) unsigned ,
 `max_latency` bigint(20) unsigned ,
 `count_read` bigint(20) unsigned ,
 `total_read` bigint(20) ,
 `avg_read` decimal(23,4) ,
 `count_write` bigint(20) unsigned ,
 `total_written` bigint(20) ,
 `avg_written` decimal(23,4) ,
 `total_requested` bigint(21) 
)*/;

/*Table structure for table `x$io_global_by_wait_by_latency` */

DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency` */;

/*!50001 CREATE TABLE  `x$io_global_by_wait_by_latency`(
 `event_name` varchar(128) ,
 `total` bigint(20) unsigned ,
 `total_latency` bigint(20) unsigned ,
 `avg_latency` bigint(20) unsigned ,
 `max_latency` bigint(20) unsigned ,
 `read_latency` bigint(20) unsigned ,
 `write_latency` bigint(20) unsigned ,
 `misc_latency` bigint(20) unsigned ,
 `count_read` bigint(20) unsigned ,
 `total_read` bigint(20) ,
 `avg_read` decimal(23,4) ,
 `count_write` bigint(20) unsigned ,
 `total_written` bigint(20) ,
 `avg_written` decimal(23,4) 
)*/;

/*Table structure for table `x$latest_file_io` */

DROP TABLE IF EXISTS `x$latest_file_io`;

/*!50001 DROP VIEW IF EXISTS `x$latest_file_io` */;
/*!50001 DROP TABLE IF EXISTS `x$latest_file_io` */;

/*!50001 CREATE TABLE  `x$latest_file_io`(
 `thread` varchar(149) ,
 `file` varchar(512) ,
 `latency` bigint(20) unsigned ,
 `operation` varchar(32) ,
 `requested` bigint(20) 
)*/;

/*Table structure for table `x$memory_by_host_by_current_bytes` */

DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes` */;

/*!50001 CREATE TABLE  `x$memory_by_host_by_current_bytes`(
 `host` varchar(60) ,
 `current_count_used` decimal(41,0) ,
 `current_allocated` decimal(41,0) ,
 `current_avg_alloc` decimal(45,4) ,
 `current_max_alloc` bigint(20) ,
 `total_allocated` decimal(42,0) 
)*/;

/*Table structure for table `x$memory_by_thread_by_current_bytes` */

DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes` */;

/*!50001 CREATE TABLE  `x$memory_by_thread_by_current_bytes`(
 `thread_id` bigint(20) unsigned ,
 `user` varchar(128) ,
 `current_count_used` decimal(41,0) ,
 `current_allocated` decimal(41,0) ,
 `current_avg_alloc` decimal(45,4) ,
 `current_max_alloc` bigint(20) ,
 `total_allocated` decimal(42,0) 
)*/;

/*Table structure for table `x$memory_by_user_by_current_bytes` */

DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes` */;

/*!50001 CREATE TABLE  `x$memory_by_user_by_current_bytes`(
 `user` varchar(32) ,
 `current_count_used` decimal(41,0) ,
 `current_allocated` decimal(41,0) ,
 `current_avg_alloc` decimal(45,4) ,
 `current_max_alloc` bigint(20) ,
 `total_allocated` decimal(42,0) 
)*/;

/*Table structure for table `x$memory_global_by_current_bytes` */

DROP TABLE IF EXISTS `x$memory_global_by_current_bytes`;

/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes` */;
/*!50001 DROP TABLE IF EXISTS `x$memory_global_by_current_bytes` */;

/*!50001 CREATE TABLE  `x$memory_global_by_current_bytes`(
 `event_name` varchar(128) ,
 `current_count` bigint(20) ,
 `current_alloc` bigint(20) ,
 `current_avg_alloc` decimal(23,4) ,
 `high_count` bigint(20) ,
 `high_alloc` bigint(20) ,
 `high_avg_alloc` decimal(23,4) 
)*/;

/*Table structure for table `x$memory_global_total` */

DROP TABLE IF EXISTS `x$memory_global_total`;

/*!50001 DROP VIEW IF EXISTS `x$memory_global_total` */;
/*!50001 DROP TABLE IF EXISTS `x$memory_global_total` */;

/*!50001 CREATE TABLE  `x$memory_global_total`(
 `total_allocated` decimal(41,0) 
)*/;

/*Table structure for table `x$processlist` */

DROP TABLE IF EXISTS `x$processlist`;

/*!50001 DROP VIEW IF EXISTS `x$processlist` */;
/*!50001 DROP TABLE IF EXISTS `x$processlist` */;

/*!50001 CREATE TABLE  `x$processlist`(
 `thd_id` bigint(20) unsigned ,
 `conn_id` bigint(20) unsigned ,
 `user` varchar(128) ,
 `db` varchar(64) ,
 `command` varchar(16) ,
 `state` varchar(64) ,
 `time` bigint(20) ,
 `current_statement` longtext ,
 `statement_latency` bigint(20) unsigned ,
 `progress` decimal(26,2) ,
 `lock_latency` bigint(20) unsigned ,
 `rows_examined` bigint(20) unsigned ,
 `rows_sent` bigint(20) unsigned ,
 `rows_affected` bigint(20) unsigned ,
 `tmp_tables` bigint(20) unsigned ,
 `tmp_disk_tables` bigint(20) unsigned ,
 `full_scan` varchar(3) ,
 `last_statement` longtext ,
 `last_statement_latency` bigint(20) unsigned ,
 `current_memory` decimal(41,0) ,
 `last_wait` varchar(128) ,
 `last_wait_latency` varchar(20) ,
 `source` varchar(64) ,
 `trx_latency` bigint(20) unsigned ,
 `trx_state` enum('ACTIVE','COMMITTED','ROLLED BACK') ,
 `trx_autocommit` enum('YES','NO') ,
 `pid` varchar(1024) ,
 `program_name` varchar(1024) 
)*/;

/*Table structure for table `x$ps_digest_95th_percentile_by_avg_us` */

DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`;

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us` */;
/*!50001 DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us` */;

/*!50001 CREATE TABLE  `x$ps_digest_95th_percentile_by_avg_us`(
 `avg_us` decimal(21,0) ,
 `percentile` decimal(46,4) 
)*/;

/*Table structure for table `x$ps_digest_avg_latency_distribution` */

DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution`;

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution` */;
/*!50001 DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution` */;

/*!50001 CREATE TABLE  `x$ps_digest_avg_latency_distribution`(
 `cnt` bigint(21) ,
 `avg_us` decimal(21,0) 
)*/;

/*Table structure for table `x$schema_flattened_keys` */

DROP TABLE IF EXISTS `x$schema_flattened_keys`;

/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys` */;
/*!50001 DROP TABLE IF EXISTS `x$schema_flattened_keys` */;

/*!50001 CREATE TABLE  `x$schema_flattened_keys`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `index_name` int(1) ,
 `non_unique` int(1) ,
 `subpart_exists` int(1) ,
 `index_columns` int(1) 
)*/;

/*Table structure for table `x$schema_index_statistics` */

DROP TABLE IF EXISTS `x$schema_index_statistics`;

/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics` */;
/*!50001 DROP TABLE IF EXISTS `x$schema_index_statistics` */;

/*!50001 CREATE TABLE  `x$schema_index_statistics`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `index_name` int(1) ,
 `rows_selected` int(1) ,
 `select_latency` int(1) ,
 `rows_inserted` int(1) ,
 `insert_latency` int(1) ,
 `rows_updated` int(1) ,
 `update_latency` int(1) ,
 `rows_deleted` int(1) ,
 `delete_latency` int(1) 
)*/;

/*Table structure for table `x$schema_table_lock_waits` */

DROP TABLE IF EXISTS `x$schema_table_lock_waits`;

/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits` */;
/*!50001 DROP TABLE IF EXISTS `x$schema_table_lock_waits` */;

/*!50001 CREATE TABLE  `x$schema_table_lock_waits`(
 `object_schema` int(1) ,
 `object_name` int(1) ,
 `waiting_thread_id` int(1) ,
 `waiting_pid` int(1) ,
 `waiting_account` int(1) ,
 `waiting_lock_type` int(1) ,
 `waiting_lock_duration` int(1) ,
 `waiting_query` int(1) ,
 `waiting_query_secs` int(1) ,
 `waiting_query_rows_affected` int(1) ,
 `waiting_query_rows_examined` int(1) ,
 `blocking_thread_id` int(1) ,
 `blocking_pid` int(1) ,
 `blocking_account` int(1) ,
 `blocking_lock_type` int(1) ,
 `blocking_lock_duration` int(1) ,
 `sql_kill_blocking_query` int(1) ,
 `sql_kill_blocking_connection` int(1) 
)*/;

/*Table structure for table `x$schema_table_statistics` */

DROP TABLE IF EXISTS `x$schema_table_statistics`;

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics` */;
/*!50001 DROP TABLE IF EXISTS `x$schema_table_statistics` */;

/*!50001 CREATE TABLE  `x$schema_table_statistics`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `total_latency` int(1) ,
 `rows_fetched` int(1) ,
 `fetch_latency` int(1) ,
 `rows_inserted` int(1) ,
 `insert_latency` int(1) ,
 `rows_updated` int(1) ,
 `update_latency` int(1) ,
 `rows_deleted` int(1) ,
 `delete_latency` int(1) ,
 `io_read_requests` int(1) ,
 `io_read` int(1) ,
 `io_read_latency` int(1) ,
 `io_write_requests` int(1) ,
 `io_write` int(1) ,
 `io_write_latency` int(1) ,
 `io_misc_requests` int(1) ,
 `io_misc_latency` int(1) 
)*/;

/*Table structure for table `x$schema_table_statistics_with_buffer` */

DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer`;

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer` */;
/*!50001 DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer` */;

/*!50001 CREATE TABLE  `x$schema_table_statistics_with_buffer`(
 `table_schema` int(1) ,
 `table_name` int(1) ,
 `rows_fetched` int(1) ,
 `fetch_latency` int(1) ,
 `rows_inserted` int(1) ,
 `insert_latency` int(1) ,
 `rows_updated` int(1) ,
 `update_latency` int(1) ,
 `rows_deleted` int(1) ,
 `delete_latency` int(1) ,
 `io_read_requests` int(1) ,
 `io_read` int(1) ,
 `io_read_latency` int(1) ,
 `io_write_requests` int(1) ,
 `io_write` int(1) ,
 `io_write_latency` int(1) ,
 `io_misc_requests` int(1) ,
 `io_misc_latency` int(1) ,
 `innodb_buffer_allocated` int(1) ,
 `innodb_buffer_data` int(1) ,
 `innodb_buffer_free` int(1) ,
 `innodb_buffer_pages` int(1) ,
 `innodb_buffer_pages_hashed` int(1) ,
 `innodb_buffer_pages_old` int(1) ,
 `innodb_buffer_rows_cached` int(1) 
)*/;

/*Table structure for table `x$schema_tables_with_full_table_scans` */

DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans`;

/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans` */;
/*!50001 DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans` */;

/*!50001 CREATE TABLE  `x$schema_tables_with_full_table_scans`(
 `object_schema` int(1) ,
 `object_name` int(1) ,
 `rows_full_scanned` int(1) ,
 `latency` int(1) 
)*/;

/*Table structure for table `x$session` */

DROP TABLE IF EXISTS `x$session`;

/*!50001 DROP VIEW IF EXISTS `x$session` */;
/*!50001 DROP TABLE IF EXISTS `x$session` */;

/*!50001 CREATE TABLE  `x$session`(
 `thd_id` int(1) ,
 `conn_id` int(1) ,
 `user` int(1) ,
 `db` int(1) ,
 `command` int(1) ,
 `state` int(1) ,
 `time` int(1) ,
 `current_statement` int(1) ,
 `statement_latency` int(1) ,
 `progress` int(1) ,
 `lock_latency` int(1) ,
 `rows_examined` int(1) ,
 `rows_sent` int(1) ,
 `rows_affected` int(1) ,
 `tmp_tables` int(1) ,
 `tmp_disk_tables` int(1) ,
 `full_scan` int(1) ,
 `last_statement` int(1) ,
 `last_statement_latency` int(1) ,
 `current_memory` int(1) ,
 `last_wait` int(1) ,
 `last_wait_latency` int(1) ,
 `source` int(1) ,
 `trx_latency` int(1) ,
 `trx_state` int(1) ,
 `trx_autocommit` int(1) ,
 `pid` int(1) ,
 `program_name` int(1) 
)*/;

/*Table structure for table `x$statement_analysis` */

DROP TABLE IF EXISTS `x$statement_analysis`;

/*!50001 DROP VIEW IF EXISTS `x$statement_analysis` */;
/*!50001 DROP TABLE IF EXISTS `x$statement_analysis` */;

/*!50001 CREATE TABLE  `x$statement_analysis`(
 `query` int(1) ,
 `db` int(1) ,
 `full_scan` int(1) ,
 `exec_count` int(1) ,
 `err_count` int(1) ,
 `warn_count` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `avg_latency` int(1) ,
 `lock_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_sent_avg` int(1) ,
 `rows_examined` int(1) ,
 `rows_examined_avg` int(1) ,
 `rows_affected` int(1) ,
 `rows_affected_avg` int(1) ,
 `tmp_tables` int(1) ,
 `tmp_disk_tables` int(1) ,
 `rows_sorted` int(1) ,
 `sort_merge_passes` int(1) ,
 `digest` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) 
)*/;

/*Table structure for table `x$statements_with_errors_or_warnings` */

DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings`;

/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings` */;
/*!50001 DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings` */;

/*!50001 CREATE TABLE  `x$statements_with_errors_or_warnings`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `errors` int(1) ,
 `error_pct` int(1) ,
 `warnings` int(1) ,
 `warning_pct` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `x$statements_with_full_table_scans` */

DROP TABLE IF EXISTS `x$statements_with_full_table_scans`;

/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans` */;
/*!50001 DROP TABLE IF EXISTS `x$statements_with_full_table_scans` */;

/*!50001 CREATE TABLE  `x$statements_with_full_table_scans`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `total_latency` int(1) ,
 `no_index_used_count` int(1) ,
 `no_good_index_used_count` int(1) ,
 `no_index_used_pct` int(1) ,
 `rows_sent` int(1) ,
 `rows_examined` int(1) ,
 `rows_sent_avg` int(1) ,
 `rows_examined_avg` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `x$statements_with_runtimes_in_95th_percentile` */

DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile`;

/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile` */;
/*!50001 DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile` */;

/*!50001 CREATE TABLE  `x$statements_with_runtimes_in_95th_percentile`(
 `query` int(1) ,
 `db` int(1) ,
 `full_scan` int(1) ,
 `exec_count` int(1) ,
 `err_count` int(1) ,
 `warn_count` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `avg_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_sent_avg` int(1) ,
 `rows_examined` int(1) ,
 `rows_examined_avg` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `x$statements_with_sorting` */

DROP TABLE IF EXISTS `x$statements_with_sorting`;

/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting` */;
/*!50001 DROP TABLE IF EXISTS `x$statements_with_sorting` */;

/*!50001 CREATE TABLE  `x$statements_with_sorting`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `total_latency` int(1) ,
 `sort_merge_passes` int(1) ,
 `avg_sort_merges` int(1) ,
 `sorts_using_scans` int(1) ,
 `sort_using_range` int(1) ,
 `rows_sorted` int(1) ,
 `avg_rows_sorted` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `x$statements_with_temp_tables` */

DROP TABLE IF EXISTS `x$statements_with_temp_tables`;

/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables` */;
/*!50001 DROP TABLE IF EXISTS `x$statements_with_temp_tables` */;

/*!50001 CREATE TABLE  `x$statements_with_temp_tables`(
 `query` int(1) ,
 `db` int(1) ,
 `exec_count` int(1) ,
 `total_latency` int(1) ,
 `memory_tmp_tables` int(1) ,
 `disk_tmp_tables` int(1) ,
 `avg_tmp_tables_per_query` int(1) ,
 `tmp_tables_to_disk_pct` int(1) ,
 `first_seen` int(1) ,
 `last_seen` int(1) ,
 `digest` int(1) 
)*/;

/*Table structure for table `x$user_summary` */

DROP TABLE IF EXISTS `x$user_summary`;

/*!50001 DROP VIEW IF EXISTS `x$user_summary` */;
/*!50001 DROP TABLE IF EXISTS `x$user_summary` */;

/*!50001 CREATE TABLE  `x$user_summary`(
 `user` int(1) ,
 `statements` int(1) ,
 `statement_latency` int(1) ,
 `statement_avg_latency` int(1) ,
 `table_scans` int(1) ,
 `file_ios` int(1) ,
 `file_io_latency` int(1) ,
 `current_connections` int(1) ,
 `total_connections` int(1) ,
 `unique_hosts` int(1) ,
 `current_memory` int(1) ,
 `total_memory_allocated` int(1) 
)*/;

/*Table structure for table `x$user_summary_by_file_io` */

DROP TABLE IF EXISTS `x$user_summary_by_file_io`;

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io` */;
/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_file_io` */;

/*!50001 CREATE TABLE  `x$user_summary_by_file_io`(
 `user` int(1) ,
 `ios` int(1) ,
 `io_latency` int(1) 
)*/;

/*Table structure for table `x$user_summary_by_file_io_type` */

DROP TABLE IF EXISTS `x$user_summary_by_file_io_type`;

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type` */;
/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_file_io_type` */;

/*!50001 CREATE TABLE  `x$user_summary_by_file_io_type`(
 `user` int(1) ,
 `event_name` int(1) ,
 `total` int(1) ,
 `latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*Table structure for table `x$user_summary_by_stages` */

DROP TABLE IF EXISTS `x$user_summary_by_stages`;

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages` */;
/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_stages` */;

/*!50001 CREATE TABLE  `x$user_summary_by_stages`(
 `user` int(1) ,
 `event_name` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `avg_latency` int(1) 
)*/;

/*Table structure for table `x$user_summary_by_statement_latency` */

DROP TABLE IF EXISTS `x$user_summary_by_statement_latency`;

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_statement_latency` */;

/*!50001 CREATE TABLE  `x$user_summary_by_statement_latency`(
 `user` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `lock_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_examined` int(1) ,
 `rows_affected` int(1) ,
 `full_scans` int(1) 
)*/;

/*Table structure for table `x$user_summary_by_statement_type` */

DROP TABLE IF EXISTS `x$user_summary_by_statement_type`;

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type` */;
/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_statement_type` */;

/*!50001 CREATE TABLE  `x$user_summary_by_statement_type`(
 `user` int(1) ,
 `statement` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `max_latency` int(1) ,
 `lock_latency` int(1) ,
 `rows_sent` int(1) ,
 `rows_examined` int(1) ,
 `rows_affected` int(1) ,
 `full_scans` int(1) 
)*/;

/*Table structure for table `x$wait_classes_global_by_avg_latency` */

DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency`;

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency` */;

/*!50001 CREATE TABLE  `x$wait_classes_global_by_avg_latency`(
 `event_class` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `min_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*Table structure for table `x$wait_classes_global_by_latency` */

DROP TABLE IF EXISTS `x$wait_classes_global_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$wait_classes_global_by_latency` */;

/*!50001 CREATE TABLE  `x$wait_classes_global_by_latency`(
 `event_class` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `min_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*Table structure for table `x$waits_by_host_by_latency` */

DROP TABLE IF EXISTS `x$waits_by_host_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$waits_by_host_by_latency` */;

/*!50001 CREATE TABLE  `x$waits_by_host_by_latency`(
 `host` int(1) ,
 `event` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*Table structure for table `x$waits_by_user_by_latency` */

DROP TABLE IF EXISTS `x$waits_by_user_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$waits_by_user_by_latency` */;

/*!50001 CREATE TABLE  `x$waits_by_user_by_latency`(
 `user` int(1) ,
 `event` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*Table structure for table `x$waits_global_by_latency` */

DROP TABLE IF EXISTS `x$waits_global_by_latency`;

/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency` */;
/*!50001 DROP TABLE IF EXISTS `x$waits_global_by_latency` */;

/*!50001 CREATE TABLE  `x$waits_global_by_latency`(
 `events` int(1) ,
 `total` int(1) ,
 `total_latency` int(1) ,
 `avg_latency` int(1) ,
 `max_latency` int(1) 
)*/;

/*View structure for view bill_view */

/*!50001 DROP TABLE IF EXISTS `bill_view` */;
/*!50001 DROP VIEW IF EXISTS `bill_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bill_view` AS select `bill`.`Bill_Code` AS `Bill_Code`,`bill`.`Order_Code` AS `Order_Code`,`order`.`Car_Code` AS `Car_Code`,`order`.`Start_time` AS `start_time`,`order`.`End_time` AS `end_time`,`bill`.`Order_time` AS `Order_Time`,`bill`.`Real_time` AS `real_time`,`bill`.`Money` AS `Money`,`order`.`note` AS `note`,`order`.`Renter_Code` AS `Renter_Code`,`rate`.`Time_rate` AS `Time_rate`,`rate`.`Over_rate` AS `Over_rate`,`rate`.`Start_fare` AS `Start_fare` from ((`bill` join `order`) join `rate`) where ((`order`.`Order_Code` = `bill`.`Order_Code`) and (`order`.`Car_Code` = `rate`.`Car_Code`)) */;

/*View structure for view car_message */

/*!50001 DROP TABLE IF EXISTS `car_message` */;
/*!50001 DROP VIEW IF EXISTS `car_message` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_message` AS select `rate`.`Car_Code` AS `Car_Code`,`car`.`Model` AS `Model`,`car`.`Manager_Code` AS `Manager_Code`,`car`.`Rent` AS `Rent`,`car`.`Owner_Code` AS `Owner_Code`,`car`.`note` AS `note`,`rate`.`Time_rate` AS `Time_rate`,`rate`.`Over_rate` AS `Over_rate`,`rate`.`Start_fare` AS `Start_fare` from (`rate` join `car`) where (`rate`.`Car_Code` = `car`.`Car_Code`) */;

/*View structure for view car_view */

/*!50001 DROP TABLE IF EXISTS `car_view` */;
/*!50001 DROP VIEW IF EXISTS `car_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_view` AS select `car`.`Car_Code` AS `Car_Code`,`car`.`Manager_Code` AS `Manager_Code`,`car`.`Rent` AS `Rent`,`check_bill`.`sign` AS `Sign`,`check_bill`.`Sign_describe` AS `Sign_Describe` from (`car` join `check_bill`) where (`car`.`Car_Code` = `check_bill`.`Car_Code`) */;

/*View structure for view host_summary */

/*!50001 DROP TABLE IF EXISTS `host_summary` */;
/*!50001 DROP VIEW IF EXISTS `host_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `host_summary` AS select 1 AS `host`,1 AS `statements`,1 AS `statement_latency`,1 AS `statement_avg_latency`,1 AS `table_scans`,1 AS `file_ios`,1 AS `file_io_latency`,1 AS `current_connections`,1 AS `total_connections`,1 AS `unique_users`,1 AS `current_memory`,1 AS `total_memory_allocated` */;

/*View structure for view host_summary_by_file_io */

/*!50001 DROP TABLE IF EXISTS `host_summary_by_file_io` */;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `host_summary_by_file_io` AS select 1 AS `host`,1 AS `ios`,1 AS `io_latency` */;

/*View structure for view host_summary_by_file_io_type */

/*!50001 DROP TABLE IF EXISTS `host_summary_by_file_io_type` */;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `host_summary_by_file_io_type` AS select 1 AS `host`,1 AS `event_name`,1 AS `total`,1 AS `total_latency`,1 AS `max_latency` */;

/*View structure for view host_summary_by_stages */

/*!50001 DROP TABLE IF EXISTS `host_summary_by_stages` */;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `host_summary_by_stages` AS select 1 AS `host`,1 AS `event_name`,1 AS `total`,1 AS `total_latency`,1 AS `avg_latency` */;

/*View structure for view host_summary_by_statement_latency */

/*!50001 DROP TABLE IF EXISTS `host_summary_by_statement_latency` */;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `host_summary_by_statement_latency` AS select 1 AS `host`,1 AS `total`,1 AS `total_latency`,1 AS `max_latency`,1 AS `lock_latency`,1 AS `rows_sent`,1 AS `rows_examined`,1 AS `rows_affected`,1 AS `full_scans` */;

/*View structure for view host_summary_by_statement_type */

/*!50001 DROP TABLE IF EXISTS `host_summary_by_statement_type` */;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `host_summary_by_statement_type` AS select 1 AS `host`,1 AS `statement`,1 AS `total`,1 AS `total_latency`,1 AS `max_latency`,1 AS `lock_latency`,1 AS `rows_sent`,1 AS `rows_examined`,1 AS `rows_affected`,1 AS `full_scans` */;

/*View structure for view innodb_buffer_stats_by_schema */

/*!50001 DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema` */;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `innodb_buffer_stats_by_schema` AS select 1 AS `object_schema`,1 AS `allocated`,1 AS `data`,1 AS `pages`,1 AS `pages_hashed`,1 AS `pages_old`,1 AS `rows_cached` */;

/*View structure for view innodb_buffer_stats_by_table */

/*!50001 DROP TABLE IF EXISTS `innodb_buffer_stats_by_table` */;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `innodb_buffer_stats_by_table` AS select 1 AS `object_schema`,1 AS `object_name`,1 AS `allocated`,1 AS `data`,1 AS `pages`,1 AS `pages_hashed`,1 AS `pages_old`,1 AS `rows_cached` */;

/*View structure for view innodb_lock_waits */

/*!50001 DROP TABLE IF EXISTS `innodb_lock_waits` */;
/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `innodb_lock_waits` AS select 1 AS `wait_started`,1 AS `wait_age`,1 AS `wait_age_secs`,1 AS `locked_table`,1 AS `locked_table_schema`,1 AS `locked_table_name`,1 AS `locked_table_partition`,1 AS `locked_table_subpartition`,1 AS `locked_index`,1 AS `locked_type`,1 AS `waiting_trx_id`,1 AS `waiting_trx_started`,1 AS `waiting_trx_age`,1 AS `waiting_trx_rows_locked`,1 AS `waiting_trx_rows_modified`,1 AS `waiting_pid`,1 AS `waiting_query`,1 AS `waiting_lock_id`,1 AS `waiting_lock_mode`,1 AS `blocking_trx_id`,1 AS `blocking_pid`,1 AS `blocking_query`,1 AS `blocking_lock_id`,1 AS `blocking_lock_mode`,1 AS `blocking_trx_started`,1 AS `blocking_trx_age`,1 AS `blocking_trx_rows_locked`,1 AS `blocking_trx_rows_modified`,1 AS `sql_kill_blocking_query`,1 AS `sql_kill_blocking_connection` */;

/*View structure for view io_by_thread_by_latency */

/*!50001 DROP TABLE IF EXISTS `io_by_thread_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `io_by_thread_by_latency` AS select 1 AS `user`,1 AS `total`,1 AS `total_latency`,1 AS `min_latency`,1 AS `avg_latency`,1 AS `max_latency`,1 AS `thread_id`,1 AS `processlist_id` */;

/*View structure for view io_global_by_file_by_bytes */

/*!50001 DROP TABLE IF EXISTS `io_global_by_file_by_bytes` */;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `io_global_by_file_by_bytes` AS select 1 AS `file`,1 AS `count_read`,1 AS `total_read`,1 AS `avg_read`,1 AS `count_write`,1 AS `total_written`,1 AS `avg_write`,1 AS `total`,1 AS `write_pct` */;

/*View structure for view io_global_by_file_by_latency */

/*!50001 DROP TABLE IF EXISTS `io_global_by_file_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `io_global_by_file_by_latency` AS select 1 AS `file`,1 AS `total`,1 AS `total_latency`,1 AS `count_read`,1 AS `read_latency`,1 AS `count_write`,1 AS `write_latency`,1 AS `count_misc`,1 AS `misc_latency` */;

/*View structure for view io_global_by_wait_by_bytes */

/*!50001 DROP TABLE IF EXISTS `io_global_by_wait_by_bytes` */;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `io_global_by_wait_by_bytes` AS select 1 AS `event_name`,1 AS `total`,1 AS `total_latency`,1 AS `min_latency`,1 AS `avg_latency`,1 AS `max_latency`,1 AS `count_read`,1 AS `total_read`,1 AS `avg_read`,1 AS `count_write`,1 AS `total_written`,1 AS `avg_written`,1 AS `total_requested` */;

/*View structure for view io_global_by_wait_by_latency */

/*!50001 DROP TABLE IF EXISTS `io_global_by_wait_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `io_global_by_wait_by_latency` AS select 1 AS `event_name`,1 AS `total`,1 AS `total_latency`,1 AS `avg_latency`,1 AS `max_latency`,1 AS `read_latency`,1 AS `write_latency`,1 AS `misc_latency`,1 AS `count_read`,1 AS `total_read`,1 AS `avg_read`,1 AS `count_write`,1 AS `total_written`,1 AS `avg_written` */;

/*View structure for view latest_file_io */

/*!50001 DROP TABLE IF EXISTS `latest_file_io` */;
/*!50001 DROP VIEW IF EXISTS `latest_file_io` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_file_io` AS select 1 AS `thread`,1 AS `file`,1 AS `latency`,1 AS `operation`,1 AS `requested` */;

/*View structure for view memory_by_host_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `memory_by_host_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `memory_by_host_by_current_bytes` AS select 1 AS `host`,1 AS `current_count_used`,1 AS `current_allocated`,1 AS `current_avg_alloc`,1 AS `current_max_alloc`,1 AS `total_allocated` */;

/*View structure for view memory_by_thread_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `memory_by_thread_by_current_bytes` AS select 1 AS `thread_id`,1 AS `user`,1 AS `current_count_used`,1 AS `current_allocated`,1 AS `current_avg_alloc`,1 AS `current_max_alloc`,1 AS `total_allocated` */;

/*View structure for view memory_by_user_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `memory_by_user_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `memory_by_user_by_current_bytes` AS select 1 AS `user`,1 AS `current_count_used`,1 AS `current_allocated`,1 AS `current_avg_alloc`,1 AS `current_max_alloc`,1 AS `total_allocated` */;

/*View structure for view memory_global_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `memory_global_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `memory_global_by_current_bytes` AS select 1 AS `event_name`,1 AS `current_count`,1 AS `current_alloc`,1 AS `current_avg_alloc`,1 AS `high_count`,1 AS `high_alloc`,1 AS `high_avg_alloc` */;

/*View structure for view memory_global_total */

/*!50001 DROP TABLE IF EXISTS `memory_global_total` */;
/*!50001 DROP VIEW IF EXISTS `memory_global_total` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `memory_global_total` AS select 1 AS `total_allocated` */;

/*View structure for view metrics */

/*!50001 DROP TABLE IF EXISTS `metrics` */;
/*!50001 DROP VIEW IF EXISTS `metrics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `metrics` AS select 1 AS `Variable_name`,1 AS `Variable_value`,1 AS `Type`,1 AS `Enabled` */;

/*View structure for view processlist */

/*!50001 DROP TABLE IF EXISTS `processlist` */;
/*!50001 DROP VIEW IF EXISTS `processlist` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `processlist` AS select 1 AS `thd_id`,1 AS `conn_id`,1 AS `user`,1 AS `db`,1 AS `command`,1 AS `state`,1 AS `time`,1 AS `current_statement`,1 AS `statement_latency`,1 AS `progress`,1 AS `lock_latency`,1 AS `rows_examined`,1 AS `rows_sent`,1 AS `rows_affected`,1 AS `tmp_tables`,1 AS `tmp_disk_tables`,1 AS `full_scan`,1 AS `last_statement`,1 AS `last_statement_latency`,1 AS `current_memory`,1 AS `last_wait`,1 AS `last_wait_latency`,1 AS `source`,1 AS `trx_latency`,1 AS `trx_state`,1 AS `trx_autocommit`,1 AS `pid`,1 AS `program_name` */;

/*View structure for view ps_check_lost_instrumentation */

/*!50001 DROP TABLE IF EXISTS `ps_check_lost_instrumentation` */;
/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ps_check_lost_instrumentation` AS select 1 AS `variable_name`,1 AS `variable_value` */;

/*View structure for view rent_view */

/*!50001 DROP TABLE IF EXISTS `rent_view` */;
/*!50001 DROP VIEW IF EXISTS `rent_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rent_view` AS select `order`.`Car_Code` AS `Car_Code`,`bill`.`Order_Code` AS `Order_Code`,`bill`.`Money` AS `Money`,`bill`.`Order_time` AS `Order_TIme` from (`order` join `bill`) where (`order`.`Order_Code` = `bill`.`Order_Code`) */;

/*View structure for view schema_auto_increment_columns */

/*!50001 DROP TABLE IF EXISTS `schema_auto_increment_columns` */;
/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_auto_increment_columns` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `column_name`,1 AS `data_type`,1 AS `column_type`,1 AS `is_signed`,1 AS `is_unsigned`,1 AS `max_value`,1 AS `auto_increment`,1 AS `auto_increment_ratio` */;

/*View structure for view schema_index_statistics */

/*!50001 DROP TABLE IF EXISTS `schema_index_statistics` */;
/*!50001 DROP VIEW IF EXISTS `schema_index_statistics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_index_statistics` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `index_name`,1 AS `rows_selected`,1 AS `select_latency`,1 AS `rows_inserted`,1 AS `insert_latency`,1 AS `rows_updated`,1 AS `update_latency`,1 AS `rows_deleted`,1 AS `delete_latency` */;

/*View structure for view schema_object_overview */

/*!50001 DROP TABLE IF EXISTS `schema_object_overview` */;
/*!50001 DROP VIEW IF EXISTS `schema_object_overview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_object_overview` AS select 1 AS `db`,1 AS `object_type`,1 AS `count` */;

/*View structure for view schema_redundant_indexes */

/*!50001 DROP TABLE IF EXISTS `schema_redundant_indexes` */;
/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_redundant_indexes` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `redundant_index_name`,1 AS `redundant_index_columns`,1 AS `redundant_index_non_unique`,1 AS `dominant_index_name`,1 AS `dominant_index_columns`,1 AS `dominant_index_non_unique`,1 AS `subpart_exists`,1 AS `sql_drop_index` */;

/*View structure for view schema_table_lock_waits */

/*!50001 DROP TABLE IF EXISTS `schema_table_lock_waits` */;
/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_table_lock_waits` AS select 1 AS `object_schema`,1 AS `object_name`,1 AS `waiting_thread_id`,1 AS `waiting_pid`,1 AS `waiting_account`,1 AS `waiting_lock_type`,1 AS `waiting_lock_duration`,1 AS `waiting_query`,1 AS `waiting_query_secs`,1 AS `waiting_query_rows_affected`,1 AS `waiting_query_rows_examined`,1 AS `blocking_thread_id`,1 AS `blocking_pid`,1 AS `blocking_account`,1 AS `blocking_lock_type`,1 AS `blocking_lock_duration`,1 AS `sql_kill_blocking_query`,1 AS `sql_kill_blocking_connection` */;

/*View structure for view schema_table_statistics */

/*!50001 DROP TABLE IF EXISTS `schema_table_statistics` */;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_table_statistics` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `total_latency`,1 AS `rows_fetched`,1 AS `fetch_latency`,1 AS `rows_inserted`,1 AS `insert_latency`,1 AS `rows_updated`,1 AS `update_latency`,1 AS `rows_deleted`,1 AS `delete_latency`,1 AS `io_read_requests`,1 AS `io_read`,1 AS `io_read_latency`,1 AS `io_write_requests`,1 AS `io_write`,1 AS `io_write_latency`,1 AS `io_misc_requests`,1 AS `io_misc_latency` */;

/*View structure for view schema_table_statistics_with_buffer */

/*!50001 DROP TABLE IF EXISTS `schema_table_statistics_with_buffer` */;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_table_statistics_with_buffer` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `rows_fetched`,1 AS `fetch_latency`,1 AS `rows_inserted`,1 AS `insert_latency`,1 AS `rows_updated`,1 AS `update_latency`,1 AS `rows_deleted`,1 AS `delete_latency`,1 AS `io_read_requests`,1 AS `io_read`,1 AS `io_read_latency`,1 AS `io_write_requests`,1 AS `io_write`,1 AS `io_write_latency`,1 AS `io_misc_requests`,1 AS `io_misc_latency`,1 AS `innodb_buffer_allocated`,1 AS `innodb_buffer_data`,1 AS `innodb_buffer_free`,1 AS `innodb_buffer_pages`,1 AS `innodb_buffer_pages_hashed`,1 AS `innodb_buffer_pages_old`,1 AS `innodb_buffer_rows_cached` */;

/*View structure for view schema_tables_with_full_table_scans */

/*!50001 DROP TABLE IF EXISTS `schema_tables_with_full_table_scans` */;
/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_tables_with_full_table_scans` AS select 1 AS `object_schema`,1 AS `object_name`,1 AS `rows_full_scanned`,1 AS `latency` */;

/*View structure for view schema_unused_indexes */

/*!50001 DROP TABLE IF EXISTS `schema_unused_indexes` */;
/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schema_unused_indexes` AS select 1 AS `object_schema`,1 AS `object_name`,1 AS `index_name` */;

/*View structure for view session */

/*!50001 DROP TABLE IF EXISTS `session` */;
/*!50001 DROP VIEW IF EXISTS `session` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `session` AS select 1 AS `thd_id`,1 AS `conn_id`,1 AS `user`,1 AS `db`,1 AS `command`,1 AS `state`,1 AS `time`,1 AS `current_statement`,1 AS `statement_latency`,1 AS `progress`,1 AS `lock_latency`,1 AS `rows_examined`,1 AS `rows_sent`,1 AS `rows_affected`,1 AS `tmp_tables`,1 AS `tmp_disk_tables`,1 AS `full_scan`,1 AS `last_statement`,1 AS `last_statement_latency`,1 AS `current_memory`,1 AS `last_wait`,1 AS `last_wait_latency`,1 AS `source`,1 AS `trx_latency`,1 AS `trx_state`,1 AS `trx_autocommit`,1 AS `pid`,1 AS `program_name` */;

/*View structure for view session_ssl_status */

/*!50001 DROP TABLE IF EXISTS `session_ssl_status` */;
/*!50001 DROP VIEW IF EXISTS `session_ssl_status` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `session_ssl_status` AS select 1 AS `thread_id`,1 AS `ssl_version`,1 AS `ssl_cipher`,1 AS `ssl_sessions_reused` */;

/*View structure for view statement_analysis */

/*!50001 DROP TABLE IF EXISTS `statement_analysis` */;
/*!50001 DROP VIEW IF EXISTS `statement_analysis` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statement_analysis` AS select 1 AS `query`,1 AS `db`,1 AS `full_scan`,1 AS `exec_count`,1 AS `err_count`,1 AS `warn_count`,1 AS `total_latency`,1 AS `max_latency`,1 AS `avg_latency`,1 AS `lock_latency`,1 AS `rows_sent`,1 AS `rows_sent_avg`,1 AS `rows_examined`,1 AS `rows_examined_avg`,1 AS `rows_affected`,1 AS `rows_affected_avg`,1 AS `tmp_tables`,1 AS `tmp_disk_tables`,1 AS `rows_sorted`,1 AS `sort_merge_passes`,1 AS `digest`,1 AS `first_seen`,1 AS `last_seen` */;

/*View structure for view statements_with_errors_or_warnings */

/*!50001 DROP TABLE IF EXISTS `statements_with_errors_or_warnings` */;
/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statements_with_errors_or_warnings` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `errors`,1 AS `error_pct`,1 AS `warnings`,1 AS `warning_pct`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view statements_with_full_table_scans */

/*!50001 DROP TABLE IF EXISTS `statements_with_full_table_scans` */;
/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statements_with_full_table_scans` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `total_latency`,1 AS `no_index_used_count`,1 AS `no_good_index_used_count`,1 AS `no_index_used_pct`,1 AS `rows_sent`,1 AS `rows_examined`,1 AS `rows_sent_avg`,1 AS `rows_examined_avg`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view statements_with_runtimes_in_95th_percentile */

/*!50001 DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile` */;
/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statements_with_runtimes_in_95th_percentile` AS select 1 AS `query`,1 AS `db`,1 AS `full_scan`,1 AS `exec_count`,1 AS `err_count`,1 AS `warn_count`,1 AS `total_latency`,1 AS `max_latency`,1 AS `avg_latency`,1 AS `rows_sent`,1 AS `rows_sent_avg`,1 AS `rows_examined`,1 AS `rows_examined_avg`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view statements_with_sorting */

/*!50001 DROP TABLE IF EXISTS `statements_with_sorting` */;
/*!50001 DROP VIEW IF EXISTS `statements_with_sorting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statements_with_sorting` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `total_latency`,1 AS `sort_merge_passes`,1 AS `avg_sort_merges`,1 AS `sorts_using_scans`,1 AS `sort_using_range`,1 AS `rows_sorted`,1 AS `avg_rows_sorted`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view statements_with_temp_tables */

/*!50001 DROP TABLE IF EXISTS `statements_with_temp_tables` */;
/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statements_with_temp_tables` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `total_latency`,1 AS `memory_tmp_tables`,1 AS `disk_tmp_tables`,1 AS `avg_tmp_tables_per_query`,1 AS `tmp_tables_to_disk_pct`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view user_summary */

/*!50001 DROP TABLE IF EXISTS `user_summary` */;
/*!50001 DROP VIEW IF EXISTS `user_summary` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,`sys`.`format_time`(sum(`stmt`.`total_latency`)) AS `statement_latency`,`sys`.`format_time`(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,`sys`.`format_time`(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,`sys`.`format_bytes`(sum(`mem`.`current_allocated`)) AS `current_memory`,`sys`.`format_bytes`(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;

/*View structure for view user_summary_by_file_io */

/*!50001 DROP TABLE IF EXISTS `user_summary_by_file_io` */;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,`sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;

/*View structure for view user_summary_by_file_io_type */

/*!50001 DROP TABLE IF EXISTS `user_summary_by_file_io_type` */;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view user_summary_by_stages */

/*!50001 DROP TABLE IF EXISTS `user_summary_by_stages` */;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view user_summary_by_statement_latency */

/*!50001 DROP TABLE IF EXISTS `user_summary_by_statement_latency` */;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,`sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,`sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;

/*View structure for view user_summary_by_statement_type */

/*!50001 DROP TABLE IF EXISTS `user_summary_by_statement_type` */;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`sys`.`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`sys`.`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view version */

/*!50001 DROP TABLE IF EXISTS `version` */;
/*!50001 DROP VIEW IF EXISTS `version` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `version` (`sys_version`,`mysql_version`) AS select '2.0.0' AS `sys_version`,version() AS `mysql_version` */;

/*View structure for view wait_classes_global_by_avg_latency */

/*!50001 DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency` */;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,`sys`.`format_time`(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,`sys`.`format_time`(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,`sys`.`format_time`(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,`sys`.`format_time`(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;

/*View structure for view wait_classes_global_by_latency */

/*!50001 DROP TABLE IF EXISTS `wait_classes_global_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,`sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,`sys`.`format_time`(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,`sys`.`format_time`(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,`sys`.`format_time`(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;

/*View structure for view waits_by_host_by_latency */

/*!50001 DROP TABLE IF EXISTS `waits_by_host_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view waits_by_user_by_latency */

/*!50001 DROP TABLE IF EXISTS `waits_by_user_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view waits_global_by_latency */

/*!50001 DROP TABLE IF EXISTS `waits_global_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`sys`.`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view x$host_summary */

/*!50001 DROP TABLE IF EXISTS `x$host_summary` */;
/*!50001 DROP VIEW IF EXISTS `x$host_summary` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`) */;

/*View structure for view x$host_summary_by_file_io */

/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_file_io` */;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;

/*View structure for view x$host_summary_by_file_io_type */

/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_file_io_type` */;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view x$host_summary_by_stages */

/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_stages` */;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view x$host_summary_by_statement_latency */

/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_statement_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;

/*View structure for view x$host_summary_by_statement_type */

/*!50001 DROP TABLE IF EXISTS `x$host_summary_by_statement_type` */;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view x$innodb_buffer_stats_by_schema */

/*!50001 DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema` */;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;

/*View structure for view x$innodb_buffer_stats_by_table */

/*!50001 DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table` */;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;

/*View structure for view x$innodb_lock_waits */

/*!50001 DROP TABLE IF EXISTS `x$innodb_lock_waits` */;
/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((convert(`b`.`trx_id` using utf8mb4) = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((convert(`r`.`trx_id` using utf8mb4) = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`))) join `performance_schema`.`data_locks` `rl` on((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`))) order by `r`.`trx_wait_started` */;

/*View structure for view x$io_by_thread_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$io_by_thread_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if(isnull(`performance_schema`.`threads`.`PROCESSLIST_ID`),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',`performance_schema`.`threads`.`PROCESSLIST_HOST`)) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;

/*View structure for view x$io_global_by_file_by_bytes */

/*!50001 DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes` */;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00) AS `avg_write`,(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;

/*View structure for view x$io_global_by_file_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$io_global_by_file_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;

/*View structure for view x$io_global_by_wait_by_bytes */

/*!50001 DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes` */;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;

/*View structure for view x$io_global_by_wait_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;

/*View structure for view x$latest_file_io */

/*!50001 DROP TABLE IF EXISTS `x$latest_file_io` */;
/*!50001 DROP VIEW IF EXISTS `x$latest_file_io` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`) using utf8mb4)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;

/*View structure for view x$memory_by_host_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;

/*View structure for view x$memory_by_thread_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `t`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `t`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;

/*View structure for view x$memory_by_user_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;

/*View structure for view x$memory_global_by_current_bytes */

/*!50001 DROP TABLE IF EXISTS `x$memory_global_by_current_bytes` */;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes` */;

/*!50001 CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;

/*View structure for view x$memory_global_total */

/*!50001 DROP TABLE IF EXISTS `x$memory_global_total` */;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_total` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_global_total` (`total_allocated`) AS select sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;

/*View structure for view x$processlist */

/*!50001 DROP TABLE IF EXISTS `x$processlist` */;
/*!50001 DROP VIEW IF EXISTS `x$processlist` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`statement_latency`,`progress`,`lock_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,if(isnull(`esc`.`END_EVENT_ID`),`esc`.`TIMER_WAIT`,NULL) AS `statement_latency`,if(isnull(`esc`.`END_EVENT_ID`),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`mem`.`current_allocated` AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`END_EVENT_ID`) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,`etc`.`TIMER_WAIT` AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;

/*View structure for view x$ps_digest_95th_percentile_by_avg_us */

/*!50001 DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us` */;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_digest_95th_percentile_by_avg_us` (`avg_us`,`percentile`) AS select `s2`.`avg_us` AS `avg_us`,ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) AS `percentile` from (`x$ps_digest_avg_latency_distribution` `s1` join `x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) > 0.95) order by `percentile` limit 1 */;

/*View structure for view x$ps_digest_avg_latency_distribution */

/*!50001 DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution` */;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_digest_avg_latency_distribution` (`cnt`,`avg_us`) AS select count(0) AS `cnt`,round((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000),0) AS `avg_us` from `performance_schema`.`events_statements_summary_by_digest` group by `avg_us` */;

/*View structure for view x$schema_flattened_keys */

/*!50001 DROP TABLE IF EXISTS `x$schema_flattened_keys` */;
/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$schema_flattened_keys` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `index_name`,1 AS `non_unique`,1 AS `subpart_exists`,1 AS `index_columns` */;

/*View structure for view x$schema_index_statistics */

/*!50001 DROP TABLE IF EXISTS `x$schema_index_statistics` */;
/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$schema_index_statistics` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `index_name`,1 AS `rows_selected`,1 AS `select_latency`,1 AS `rows_inserted`,1 AS `insert_latency`,1 AS `rows_updated`,1 AS `update_latency`,1 AS `rows_deleted`,1 AS `delete_latency` */;

/*View structure for view x$schema_table_lock_waits */

/*!50001 DROP TABLE IF EXISTS `x$schema_table_lock_waits` */;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$schema_table_lock_waits` AS select 1 AS `object_schema`,1 AS `object_name`,1 AS `waiting_thread_id`,1 AS `waiting_pid`,1 AS `waiting_account`,1 AS `waiting_lock_type`,1 AS `waiting_lock_duration`,1 AS `waiting_query`,1 AS `waiting_query_secs`,1 AS `waiting_query_rows_affected`,1 AS `waiting_query_rows_examined`,1 AS `blocking_thread_id`,1 AS `blocking_pid`,1 AS `blocking_account`,1 AS `blocking_lock_type`,1 AS `blocking_lock_duration`,1 AS `sql_kill_blocking_query`,1 AS `sql_kill_blocking_connection` */;

/*View structure for view x$schema_table_statistics */

/*!50001 DROP TABLE IF EXISTS `x$schema_table_statistics` */;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$schema_table_statistics` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `total_latency`,1 AS `rows_fetched`,1 AS `fetch_latency`,1 AS `rows_inserted`,1 AS `insert_latency`,1 AS `rows_updated`,1 AS `update_latency`,1 AS `rows_deleted`,1 AS `delete_latency`,1 AS `io_read_requests`,1 AS `io_read`,1 AS `io_read_latency`,1 AS `io_write_requests`,1 AS `io_write`,1 AS `io_write_latency`,1 AS `io_misc_requests`,1 AS `io_misc_latency` */;

/*View structure for view x$schema_table_statistics_with_buffer */

/*!50001 DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer` */;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$schema_table_statistics_with_buffer` AS select 1 AS `table_schema`,1 AS `table_name`,1 AS `rows_fetched`,1 AS `fetch_latency`,1 AS `rows_inserted`,1 AS `insert_latency`,1 AS `rows_updated`,1 AS `update_latency`,1 AS `rows_deleted`,1 AS `delete_latency`,1 AS `io_read_requests`,1 AS `io_read`,1 AS `io_read_latency`,1 AS `io_write_requests`,1 AS `io_write`,1 AS `io_write_latency`,1 AS `io_misc_requests`,1 AS `io_misc_latency`,1 AS `innodb_buffer_allocated`,1 AS `innodb_buffer_data`,1 AS `innodb_buffer_free`,1 AS `innodb_buffer_pages`,1 AS `innodb_buffer_pages_hashed`,1 AS `innodb_buffer_pages_old`,1 AS `innodb_buffer_rows_cached` */;

/*View structure for view x$schema_tables_with_full_table_scans */

/*!50001 DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans` */;
/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$schema_tables_with_full_table_scans` AS select 1 AS `object_schema`,1 AS `object_name`,1 AS `rows_full_scanned`,1 AS `latency` */;

/*View structure for view x$session */

/*!50001 DROP TABLE IF EXISTS `x$session` */;
/*!50001 DROP VIEW IF EXISTS `x$session` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$session` AS select 1 AS `thd_id`,1 AS `conn_id`,1 AS `user`,1 AS `db`,1 AS `command`,1 AS `state`,1 AS `time`,1 AS `current_statement`,1 AS `statement_latency`,1 AS `progress`,1 AS `lock_latency`,1 AS `rows_examined`,1 AS `rows_sent`,1 AS `rows_affected`,1 AS `tmp_tables`,1 AS `tmp_disk_tables`,1 AS `full_scan`,1 AS `last_statement`,1 AS `last_statement_latency`,1 AS `current_memory`,1 AS `last_wait`,1 AS `last_wait_latency`,1 AS `source`,1 AS `trx_latency`,1 AS `trx_state`,1 AS `trx_autocommit`,1 AS `pid`,1 AS `program_name` */;

/*View structure for view x$statement_analysis */

/*!50001 DROP TABLE IF EXISTS `x$statement_analysis` */;
/*!50001 DROP VIEW IF EXISTS `x$statement_analysis` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$statement_analysis` AS select 1 AS `query`,1 AS `db`,1 AS `full_scan`,1 AS `exec_count`,1 AS `err_count`,1 AS `warn_count`,1 AS `total_latency`,1 AS `max_latency`,1 AS `avg_latency`,1 AS `lock_latency`,1 AS `rows_sent`,1 AS `rows_sent_avg`,1 AS `rows_examined`,1 AS `rows_examined_avg`,1 AS `rows_affected`,1 AS `rows_affected_avg`,1 AS `tmp_tables`,1 AS `tmp_disk_tables`,1 AS `rows_sorted`,1 AS `sort_merge_passes`,1 AS `digest`,1 AS `first_seen`,1 AS `last_seen` */;

/*View structure for view x$statements_with_errors_or_warnings */

/*!50001 DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings` */;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$statements_with_errors_or_warnings` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `errors`,1 AS `error_pct`,1 AS `warnings`,1 AS `warning_pct`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view x$statements_with_full_table_scans */

/*!50001 DROP TABLE IF EXISTS `x$statements_with_full_table_scans` */;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$statements_with_full_table_scans` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `total_latency`,1 AS `no_index_used_count`,1 AS `no_good_index_used_count`,1 AS `no_index_used_pct`,1 AS `rows_sent`,1 AS `rows_examined`,1 AS `rows_sent_avg`,1 AS `rows_examined_avg`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view x$statements_with_runtimes_in_95th_percentile */

/*!50001 DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile` */;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$statements_with_runtimes_in_95th_percentile` AS select 1 AS `query`,1 AS `db`,1 AS `full_scan`,1 AS `exec_count`,1 AS `err_count`,1 AS `warn_count`,1 AS `total_latency`,1 AS `max_latency`,1 AS `avg_latency`,1 AS `rows_sent`,1 AS `rows_sent_avg`,1 AS `rows_examined`,1 AS `rows_examined_avg`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view x$statements_with_sorting */

/*!50001 DROP TABLE IF EXISTS `x$statements_with_sorting` */;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$statements_with_sorting` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `total_latency`,1 AS `sort_merge_passes`,1 AS `avg_sort_merges`,1 AS `sorts_using_scans`,1 AS `sort_using_range`,1 AS `rows_sorted`,1 AS `avg_rows_sorted`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view x$statements_with_temp_tables */

/*!50001 DROP TABLE IF EXISTS `x$statements_with_temp_tables` */;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$statements_with_temp_tables` AS select 1 AS `query`,1 AS `db`,1 AS `exec_count`,1 AS `total_latency`,1 AS `memory_tmp_tables`,1 AS `disk_tmp_tables`,1 AS `avg_tmp_tables_per_query`,1 AS `tmp_tables_to_disk_pct`,1 AS `first_seen`,1 AS `last_seen`,1 AS `digest` */;

/*View structure for view x$user_summary */

/*!50001 DROP TABLE IF EXISTS `x$user_summary` */;
/*!50001 DROP VIEW IF EXISTS `x$user_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$user_summary` AS select 1 AS `user`,1 AS `statements`,1 AS `statement_latency`,1 AS `statement_avg_latency`,1 AS `table_scans`,1 AS `file_ios`,1 AS `file_io_latency`,1 AS `current_connections`,1 AS `total_connections`,1 AS `unique_hosts`,1 AS `current_memory`,1 AS `total_memory_allocated` */;

/*View structure for view x$user_summary_by_file_io */

/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_file_io` */;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$user_summary_by_file_io` AS select 1 AS `user`,1 AS `ios`,1 AS `io_latency` */;

/*View structure for view x$user_summary_by_file_io_type */

/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_file_io_type` */;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$user_summary_by_file_io_type` AS select 1 AS `user`,1 AS `event_name`,1 AS `total`,1 AS `latency`,1 AS `max_latency` */;

/*View structure for view x$user_summary_by_stages */

/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_stages` */;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$user_summary_by_stages` AS select 1 AS `user`,1 AS `event_name`,1 AS `total`,1 AS `total_latency`,1 AS `avg_latency` */;

/*View structure for view x$user_summary_by_statement_latency */

/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_statement_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$user_summary_by_statement_latency` AS select 1 AS `user`,1 AS `total`,1 AS `total_latency`,1 AS `max_latency`,1 AS `lock_latency`,1 AS `rows_sent`,1 AS `rows_examined`,1 AS `rows_affected`,1 AS `full_scans` */;

/*View structure for view x$user_summary_by_statement_type */

/*!50001 DROP TABLE IF EXISTS `x$user_summary_by_statement_type` */;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$user_summary_by_statement_type` AS select 1 AS `user`,1 AS `statement`,1 AS `total`,1 AS `total_latency`,1 AS `max_latency`,1 AS `lock_latency`,1 AS `rows_sent`,1 AS `rows_examined`,1 AS `rows_affected`,1 AS `full_scans` */;

/*View structure for view x$wait_classes_global_by_avg_latency */

/*!50001 DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$wait_classes_global_by_avg_latency` AS select 1 AS `event_class`,1 AS `total`,1 AS `total_latency`,1 AS `min_latency`,1 AS `avg_latency`,1 AS `max_latency` */;

/*View structure for view x$wait_classes_global_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$wait_classes_global_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$wait_classes_global_by_latency` AS select 1 AS `event_class`,1 AS `total`,1 AS `total_latency`,1 AS `min_latency`,1 AS `avg_latency`,1 AS `max_latency` */;

/*View structure for view x$waits_by_host_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$waits_by_host_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$waits_by_host_by_latency` AS select 1 AS `host`,1 AS `event`,1 AS `total`,1 AS `total_latency`,1 AS `avg_latency`,1 AS `max_latency` */;

/*View structure for view x$waits_by_user_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$waits_by_user_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$waits_by_user_by_latency` AS select 1 AS `user`,1 AS `event`,1 AS `total`,1 AS `total_latency`,1 AS `avg_latency`,1 AS `max_latency` */;

/*View structure for view x$waits_global_by_latency */

/*!50001 DROP TABLE IF EXISTS `x$waits_global_by_latency` */;
/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x$waits_global_by_latency` AS select 1 AS `events`,1 AS `total`,1 AS `total_latency`,1 AS `avg_latency`,1 AS `max_latency` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
