/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 5.7.18-log : Database - db_exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_exam` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_exam`;

/*Table structure for table `t_exam` */

DROP TABLE IF EXISTS `t_exam`;

CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examDate` datetime DEFAULT NULL,
  `moreScore` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `singleScore` int(11) NOT NULL,
  `paperId` int(11) DEFAULT NULL,
  `studentId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l14kkd2w86mpy8v2snw37hskx` (`paperId`),
  KEY `FK_sl2v4qucyp0qe9yvnk6icka10` (`studentId`),
  CONSTRAINT `FK_l14kkd2w86mpy8v2snw37hskx` FOREIGN KEY (`paperId`) REFERENCES `t_paper` (`id`),
  CONSTRAINT `FK_sl2v4qucyp0qe9yvnk6icka10` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `t_exam` */

insert  into `t_exam`(`id`,`examDate`,`moreScore`,`score`,`singleScore`,`paperId`,`studentId`) values (1,NULL,0,20,0,1,'JS110'),(2,NULL,0,120,0,1,'JS123'),(3,'2017-02-01 17:59:54',0,0,0,1,'JS123'),(4,'2017-02-01 17:59:54',0,0,0,1,'JS123'),(5,'2017-02-01 17:59:54',30,50,20,1,'JS123'),(6,'2017-02-01 17:59:54',30,50,20,1,'JS110'),(7,'2017-02-01 17:59:54',0,20,20,1,'JS123'),(8,'2017-02-01 17:59:54',0,20,20,1,'JS123'),(9,'2017-02-01 17:59:54',0,20,20,1,'JS123'),(10,'2017-02-01 17:59:54',0,20,20,1,'JS123'),(11,'2017-02-01 17:59:54',0,20,20,1,'JS123'),(13,'2017-02-01 17:59:54',0,60,60,1,'JS123'),(14,'2017-02-01 17:59:54',60,100,40,1,'JS123'),(15,'2017-02-01 17:59:54',30,70,40,1,'JS123'),(16,'2017-02-01 17:59:54',30,50,20,1,'JS123'),(17,'2017-02-01 17:59:54',30,50,20,1,'JS123'),(18,'2017-02-01 17:59:54',30,50,20,1,'JS123'),(19,'2017-02-01 17:59:54',0,20,20,1,'JS123'),(20,'2017-10-06 13:02:44',0,40,40,1,'JS110'),(21,'2017-10-06 13:27:52',30,90,60,2,'JS110'),(22,'2017-10-07 10:11:03',30,90,60,2,'JS123');

/*Table structure for table `t_manager` */

DROP TABLE IF EXISTS `t_manager`;

CREATE TABLE `t_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_manager` */

insert  into `t_manager`(`id`,`name`,`password`,`userName`) values (1,'管理员','123456','admin');

/*Table structure for table `t_paper` */

DROP TABLE IF EXISTS `t_paper`;

CREATE TABLE `t_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joinDate` datetime DEFAULT NULL,
  `paperName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_paper` */

insert  into `t_paper`(`id`,`joinDate`,`paperName`) values (1,'2017-02-01 17:59:54','Java试卷一'),(2,'2017-02-01 17:59:54','语文试卷二'),(3,'2017-10-04 21:59:02','物理试卷二'),(4,'2017-10-11 21:58:35','数学试卷一'),(5,NULL,NULL),(6,NULL,NULL);

/*Table structure for table `t_question` */

DROP TABLE IF EXISTS `t_question`;

CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `optionA` varchar(255) DEFAULT NULL,
  `optionB` varchar(255) DEFAULT NULL,
  `optionC` varchar(255) DEFAULT NULL,
  `optionD` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ebouwob97chiilpjmc6gtgwkw` (`paperId`),
  CONSTRAINT `FK_ebouwob97chiilpjmc6gtgwkw` FOREIGN KEY (`paperId`) REFERENCES `t_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `t_question` */

insert  into `t_question`(`id`,`answer`,`joinTime`,`optionA`,`optionB`,`optionC`,`optionD`,`subject`,`type`,`paperId`) values (1,'D','2017-02-01 00:00:00','A. a1','B. $1','C. _1','D .11','下列不可作为java语言修饰符的是？','1',1),(2,'A','2017-02-01 00:00:00','A. a1.java','B. a.class','C. a1','D. 都可以','有一段java应用程序，它的主类名是a1，那么保存 它的源文件名可以是？','1',1),(3,'A,B','2017-02-01 17:59:54','A. String []a','B. String a[]','C. char a[][]','D. String a[10]','下面正确声明一个一维数组的是？','2',1),(4,'A,D','2017-02-01 17:59:54','A. 在java中只允许单继承。','B. 在java中一个类只能实现一个接口。','C. 在java中一个类不能同时继承一个类和实现一个接口。','D. java的单一继承使代码更可靠。','下面关于继承的叙述哪些是正确的？','2',1),(5,'C','2017-02-01 17:59:54','A. 一个子类可以有多个父类，一个父类也可以有多个子类','B. 一个子类可以有多个父类，但一个父类只可以有一个子类','C. 一个子类可以有一个父类，但一个父类可以有多个子类','D. 上述说法都不对','在Java中？','1',1),(6,'A,D','2017-02-01 17:59:54','A. 包的声明必须是源文件的第一句代码。','B. 包的声明必须紧跟在import语句的后面。','C. 只有公共类才能放在包中。','D. 可以将多个源文件中的类放在同一个包中。','可以将多个源文件中的类放在同一个包中？','2',1),(7,'C','2017-02-01 17:59:54','A. Java是跨平台的编程语言','B. Java支持分布式计算','C. Java是面向过程的编程语言','D. Java是面向对象的编程语言','下列关于Java语言的特点，描述错误的是？','1',1),(16,'A,B','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','2',2),(17,'A,D','2017-02-01 17:59:54','2321','321','321','321','测试题目','2',1),(18,'A,D','2017-02-01 17:59:54','1114','2224','3334','4444','测试题目2233','2',1),(19,'A','2017-10-06 00:00:00','A.111','B.11','C.123','D.1234','语文测试11','2',3),(20,'A','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','1',2),(21,'A','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','1',2),(22,'A','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','1',2),(23,'A','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','1',2),(24,'A,B,C','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','2',2),(25,'A,B,C','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','2',2),(26,'A,B,C','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','2',2),(27,'A,B,C','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','2',2),(28,'A,B,C','2017-02-01 17:59:54','1122','2223','3322','4422','测试题目2','2',2);

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `id` varchar(40) NOT NULL,
  `cardNo` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `prefession` varchar(40) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`id`,`cardNo`,`name`,`password`,`prefession`,`sex`) values ('JS110','1616516165161615616','朱传亮','123456','软件','男'),('JS123','21321321','张三','1234','计算机','男'),('JS124','221321','李四','1234','网络','女'),('JS125',NULL,NULL,NULL,NULL,NULL),('JS1252',NULL,NULL,NULL,NULL,NULL),('JS1253',NULL,NULL,NULL,NULL,NULL),('JS1254',NULL,NULL,NULL,NULL,NULL),('JS1255',NULL,NULL,NULL,NULL,NULL),('JS1256',NULL,NULL,NULL,NULL,NULL),('JS126',NULL,NULL,NULL,NULL,NULL),('JS127',NULL,NULL,NULL,NULL,NULL),('JS20140701094518','21','张三2','21','21','男'),('JS20140701094708','22','11','344','33','男'),('JS20140701094728','223','113','34433','3333','女'),('JS20140704052827','fa','fda2','fda','fda','男'),('Js20170607104040','asfasf','查娜','sdgs','阿三','男');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
