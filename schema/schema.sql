CREATE DATABASE  IF NOT EXISTS `attendance` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `attendance`;
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: attendance
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `at_company`
--

DROP TABLE IF EXISTS `at_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `name` varchar(128) NOT NULL COMMENT '公司名称',
  `user_code` varchar(32) NOT NULL COMMENT '用户编号',
  `logo_url` varchar(256) DEFAULT NULL COMMENT '公司LOGO',
  `registration_num` varchar(100) DEFAULT NULL COMMENT '注册号或社会信用代码',
  `business_nature` varchar(256) DEFAULT NULL COMMENT '公司性质',
  `enterprise_type` varchar(256) DEFAULT NULL COMMENT '公司类型',
  `business_start` varchar(16) DEFAULT NULL COMMENT '经营期限开始',
  `business_end` varchar(16) DEFAULT NULL COMMENT '经营期限截止',
  `business_period_term` varchar(10) DEFAULT NULL COMMENT '长期(ALL表示长期)',
  `business_license_url` varchar(200) DEFAULT NULL COMMENT '营业执照',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
  `company_province` varchar(20) DEFAULT NULL COMMENT '公司所在省',
  `company_city` varchar(20) DEFAULT NULL COMMENT '公司所在城市',
  `company_address` varchar(100) DEFAULT NULL COMMENT '办公地址',
  `registered_address` char(10) DEFAULT NULL COMMENT '注册地址',
  `telephone` varchar(8) DEFAULT NULL COMMENT '固定电话',
  `email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `parent` int(11) DEFAULT NULL COMMENT '母公司',
  `corporation` varchar(64) DEFAULT NULL COMMENT '公司法人',
  `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_department`
--

DROP TABLE IF EXISTS `at_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `parent` int(11) DEFAULT NULL COMMENT '归属部门',
  `mananger` int(11) DEFAULT NULL COMMENT '部门主管',
  `staff_num` int(11) DEFAULT NULL COMMENT '部门人数',
  `display_order` int(10) DEFAULT NULL COMMENT '序号',
  `level` int(2) DEFAULT NULL COMMENT '层级',
  `path` int(11) DEFAULT NULL COMMENT '路径(当前部门节点到部门根节点的路径)',
  `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_at_department_1_idx` (`company_id`),
  KEY `fk_at_department_2_idx` (`parent`),
  CONSTRAINT `fk_at_department_1` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_department_2` FOREIGN KEY (`parent`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_department_regular`
--

DROP TABLE IF EXISTS `at_department_regular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_department_regular` (
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  `regular_id` int(11) NOT NULL COMMENT '考勤规则编号',
  PRIMARY KEY (`department_id`,`regular_id`),
  KEY `fk_at_department_regular_2_idx` (`regular_id`),
  CONSTRAINT `fk_at_department_regular_1` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_department_regular_2` FOREIGN KEY (`regular_id`) REFERENCES `at_regular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门考勤规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_employee`
--

DROP TABLE IF EXISTS `at_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `person_id` int(11) NOT NULL COMMENT '用户编号',
  `position` varchar(50) NOT NULL COMMENT '职位',
  `entry_date` bigint(20) NOT NULL COMMENT '入职日期',
  `left_date` bigint(20) DEFAULT NULL COMMENT '离职日期',
  `staff_status` int(1) NOT NULL COMMENT '在职状态',
  PRIMARY KEY (`id`),
  KEY `fk_at_employee_1_idx` (`person_id`),
  CONSTRAINT `fk_at_employee_1` FOREIGN KEY (`person_id`) REFERENCES `at_person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_employee_company`
--

DROP TABLE IF EXISTS `at_employee_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_employee_company` (
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  PRIMARY KEY (`employee_id`,`company_id`),
  KEY `fk_at_employee_company_2_idx` (`company_id`),
  CONSTRAINT `fk_at_employee_company_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_employee_company_2` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_employee_department`
--

DROP TABLE IF EXISTS `at_employee_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_employee_department` (
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`employee_id`,`department_id`),
  KEY `fk_at_employee_department_2_idx` (`department_id`),
  CONSTRAINT `fk_at_employee_department_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_employee_department_2` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_led`
--

DROP TABLE IF EXISTS `at_led`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_led` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'led编号',
  `name` varchar(32) NOT NULL COMMENT 'led名称',
  `ip_address` varchar(20) NOT NULL COMMENT 'ip地址',
  `serial_number` varchar(60) NOT NULL COMMENT '设备序列号',
  `brand` varchar(60) NOT NULL COMMENT '品牌',
  `type` varchar(60) NOT NULL COMMENT '型号',
  `installed_time` bigint(20) NOT NULL COMMENT '安装时间',
  `installed_location` varchar(50) NOT NULL COMMENT '安装位置',
  `installed_address` varchar(100) NOT NULL COMMENT '安装地址',
  `supcon_id` varchar(100) NOT NULL COMMENT '归属中控设备',
  `display` varchar(256) NOT NULL COMMENT '显示内容',
  `company_id` int(11) NOT NULL COMMENT '归属公司',
  `department_id` int(11) NOT NULL COMMENT '归属部门',
  `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_at_led_1_idx` (`company_id`),
  KEY `fk_at_led_2_idx` (`department_id`),
  CONSTRAINT `fk_at_led_1` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_led_2` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='led设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_led_message`
--

DROP TABLE IF EXISTS `at_led_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_led_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息编号',
  `name` varchar(32) NOT NULL COMMENT '消息名称',
  `content` varchar(256) NOT NULL COMMENT '规则内容',
  `led_id` int(11) NOT NULL COMMENT 'led编号',
  `start_time` bigint(20) NOT NULL COMMENT '消息生效时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '消息失效时间',
  `expiry_date` varchar(6) NOT NULL COMMENT '有效期(0：长期/nd：n天/nw:n周/nM：n月/nY:n年/自定义)',
  `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_at_led_message_1_idx` (`led_id`),
  CONSTRAINT `fk_at_led_message_1` FOREIGN KEY (`led_id`) REFERENCES `at_led` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='led消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_person`
--

DROP TABLE IF EXISTS `at_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `full_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_code` varchar(32) NOT NULL COMMENT '用户编号',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别(male/female)',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `origin` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `home_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
  `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_punch`
--

DROP TABLE IF EXISTS `at_punch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_punch` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `puncher_id` int(11) NOT NULL COMMENT '设备编号',
  `recod_time` bigint(20) NOT NULL COMMENT '打卡时间',
  `status` int(3) NOT NULL COMMENT '是否正常(0-正常/1-迟到/2-早退)',
  PRIMARY KEY (`id`),
  KEY `fk_at_punch_1_idx` (`employee_id`),
  KEY `fk_at_punch_2_idx` (`puncher_id`),
  CONSTRAINT `fk_at_punch_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_punch_2` FOREIGN KEY (`puncher_id`) REFERENCES `at_puncher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_punch_history`
--

DROP TABLE IF EXISTS `at_punch_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_punch_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `id_card` int(11) NOT NULL COMMENT '用户身份证号',
  `puncher_id` int(11) NOT NULL COMMENT '考勤机编号',
  `department_id` int(11) NOT NULL,
  `recod_time` bigint(20) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`),
  KEY `fk_at_punch_history_1_idx` (`id_card`),
  KEY `fk_at_punch_history_2_idx` (`puncher_id`),
  KEY `fk_at_punch_history_3_idx` (`department_id`),
  CONSTRAINT `fk_at_punch_history_1` FOREIGN KEY (`id_card`) REFERENCES `at_person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_punch_history_2` FOREIGN KEY (`puncher_id`) REFERENCES `at_puncher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_punch_history_3` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打卡记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_puncher`
--

DROP TABLE IF EXISTS `at_puncher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_puncher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤机设备编号',
  `name` varchar(32) NOT NULL COMMENT '考勤机设备名称',
  `ip_address` varchar(20) NOT NULL COMMENT 'ip地址',
  `serial_number` varchar(60) NOT NULL COMMENT '设备序列号',
  `brand` varchar(60) NOT NULL COMMENT '品牌',
  `type` varchar(60) NOT NULL COMMENT '型号',
  `installed_time` bigint(20) NOT NULL COMMENT '安装时间',
  `installed_location` varchar(50) NOT NULL COMMENT '安装位置',
  `installed_address` varchar(100) NOT NULL COMMENT '安装地址',
  `supcon_id` int(11) NOT NULL COMMENT '归属中控设备',
  `company_id` int(11) NOT NULL COMMENT '归属公司',
  `department_id` int(11) NOT NULL COMMENT '归属部门',
  `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_at_puncher_1_idx` (`supcon_id`),
  KEY `fk_at_puncher_3_idx` (`department_id`),
  KEY `fk_at_puncher_2_idx` (`company_id`),
  CONSTRAINT `fk_at_puncher_1` FOREIGN KEY (`supcon_id`) REFERENCES `at_supcon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_puncher_2` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_puncher_3` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤机设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_puncher_regular`
--

DROP TABLE IF EXISTS `at_puncher_regular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_puncher_regular` (
  `puncher_id` int(11) NOT NULL COMMENT '考勤机编号',
  `regular_id` int(11) NOT NULL COMMENT '考勤规则编号',
  PRIMARY KEY (`puncher_id`,`regular_id`),
  KEY `fk_at_puncher_regular_2_idx` (`regular_id`),
  CONSTRAINT `fk_at_puncher_regular_1` FOREIGN KEY (`puncher_id`) REFERENCES `at_puncher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_puncher_regular_2` FOREIGN KEY (`regular_id`) REFERENCES `at_regular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤机考勤规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_regular`
--

DROP TABLE IF EXISTS `at_regular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_regular` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(256) NOT NULL COMMENT '规则名称',
  `content` varchar(256) NOT NULL COMMENT '规则内容',
  `desc` varchar(256) NOT NULL COMMENT '规则描述',
  `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
  `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `at_supcon`
--

DROP TABLE IF EXISTS `at_supcon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_supcon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '中控设备编号',
  `name` varchar(32) NOT NULL COMMENT '中控设备名称',
  `ip_address` varchar(20) NOT NULL COMMENT 'ip地址',
  `serial_number` varchar(60) NOT NULL COMMENT '设备序列号',
  `brand` varchar(60) NOT NULL COMMENT '品牌',
  `type` varchar(60) NOT NULL COMMENT '型号',
  `installed_time` bigint(20) NOT NULL COMMENT '安装时间',
  `installed_location` varchar(50) NOT NULL COMMENT '安装位置',
  `installed_address` varchar(100) NOT NULL COMMENT '安装地址',
  `company_id` int(11) NOT NULL COMMENT '归属公司',
  `department_id` int(11) NOT NULL COMMENT '归属部门',
  `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_at_supcon_1_idx` (`company_id`),
  KEY `fk_at_supcon_2_idx` (`department_id`),
  CONSTRAINT `fk_at_supcon_1` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_supcon_2` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中控设备表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-04  2:07:22
