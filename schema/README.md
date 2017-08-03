#数据存储模型设计文档


![数据模型概览](/assets/image/attendance.png "数据模型概览")

##公司表
```
DROP TABLE IF EXISTS `at_company`;

CREATE TABLE `at_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `name` varchar(128) NOT NULL COMMENT '公司名称',
  `user_code` varchar(32) NOT NULL COMMENT '用户编号',(1)
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

```




##部门表

```
DROP TABLE IF EXISTS `at_department`;

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

```



##部门考勤规则表

```
DROP TABLE IF EXISTS `at_department_regular`;

CREATE TABLE `at_department_regular` (
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  `regular_id` int(11) NOT NULL COMMENT '考勤规则编号',
  PRIMARY KEY (`department_id`,`regular_id`),
  KEY `fk_at_department_regular_2_idx` (`regular_id`),
  CONSTRAINT `fk_at_department_regular_1` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_department_regular_2` FOREIGN KEY (`regular_id`) REFERENCES `at_regular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门考勤规则表';

```


##员工表

```
DROP TABLE IF EXISTS `at_employee`;

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

```



##员工-公司表
```
DROP TABLE IF EXISTS `at_employee_company`;

CREATE TABLE `at_employee_company` (
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `company_id` int(11) NOT NULL COMMENT '公司编号',
  PRIMARY KEY (`employee_id`,`company_id`),
  KEY `fk_at_employee_company_2_idx` (`company_id`),
  CONSTRAINT `fk_at_employee_company_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_employee_company_2` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-公司表';

```



##员工-部门表

```
DROP TABLE IF EXISTS `at_employee_department`;

CREATE TABLE `at_employee_department` (
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`employee_id`,`department_id`),
  KEY `fk_at_employee_department_2_idx` (`department_id`),
  CONSTRAINT `fk_at_employee_department_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_employee_department_2` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-部门表';

```



##led设备表

```
DROP TABLE IF EXISTS `at_led`;

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

```



##led消息表

```
DROP TABLE IF EXISTS `at_led_message`;

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

```


##人员表

```
DROP TABLE IF EXISTS `at_person`;

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

```

##考勤表

```
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

```

##打卡记录表

```
DROP TABLE IF EXISTS `at_punch_history`;

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

```



##考勤机设备表
```
DROP TABLE IF EXISTS `at_puncher`;

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

```

##考勤机考勤规则表

```
DROP TABLE IF EXISTS `at_puncher_regular`;

CREATE TABLE `at_puncher_regular` (
  `puncher_id` int(11) NOT NULL COMMENT '考勤机编号',
  `regular_id` int(11) NOT NULL COMMENT '考勤规则编号',
  PRIMARY KEY (`puncher_id`,`regular_id`),
  KEY `fk_at_puncher_regular_2_idx` (`regular_id`),
  CONSTRAINT `fk_at_puncher_regular_1` FOREIGN KEY (`puncher_id`) REFERENCES `at_puncher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_puncher_regular_2` FOREIGN KEY (`regular_id`) REFERENCES `at_regular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤机考勤规则表';

```

##考勤规则表

```
DROP TABLE IF EXISTS `at_regular`;

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

```

##中控设备表

```
DROP TABLE IF EXISTS `at_supcon`;

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

