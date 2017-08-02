#数据存储模型设计说明


![数据模型概览](/assets/image/attendance.png "数据模型概览")

## 用户域
###用户表
```
drop TABLE IF EXISTS `at_user`;

CREATE TABLE `at_user` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
   `user_name` varchar(32) DEFAULT NULL COMMENT '用户名',
   `password` varchar(64) DEFAULT NULL COMMENT '密码',
   `full_name` varchar(64) DEFAULT NULL COMMENT '姓名',
   `id_card` varchar(20) DEFAULT NULL COMMENT '身份证号',
   `gender` varchar(2) DEFAULT NULL COMMENT '性别(male/female)',
   `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
   `nation` varchar(64) DEFAULT NULL COMMENT '民族',
   `origin` varchar(255) DEFAULT NULL COMMENT '籍贯',
   `home_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
   `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   PRIMARY KEY (`id`),
   UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
```
###民族
```
drop TABLE IF EXISTS `at_nation`;

CREATE TABLE `at_nation` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '民族编号',
   `name` varchar(32) DEFAULT NULL COMMENT '民族名称',
   `desc` varchar(255) DEFAULT NULL COMMENT '说明',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   PRIMARY KEY (`id`),
   UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='民族表';

```
###登录日志表
```
DROP TABLE IF EXISTS `at_login_log`;

CREATE TABLE `at_login_log` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `user_id` int(11) NOT NULL COMMENT '用户编号',
   `ip_address` varchar(60) NOT NULL COMMENT 'ip地址',
   `entry_time` bigint(20) NOT NULL COMMENT '登录时间',
   `left_time` bigint(20) NOT NULL COMMENT '离开时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';
```

##企业域
###员工表
```
DROP TABLE IF EXISTS `at_employee`;

CREATE TABLE `at_employee` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
   `user_id` int(11) NOT NULL COMMENT '用户编号',
   `position` varchar(50) NOT NULL COMMENT '职位',
   `entry_date` bigint(20) NOT NULL COMMENT '入职日期',
   `left_date` bigint(20) DEFAULT NULL COMMENT '离职日期',
   `staff_status` int(1) NOT NULL COMMENT '在职状态',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

```
###公司表
```
drop TABLE IF EXISTS `at_company`;

CREATE TABLE `at_company` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
   `name` varchar(128) NOT NULL COMMENT '公司名称',
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
###部门表
```
DROP TABLE IF EXISTS `at_department`;

CREATE TABLE `at_department` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
   `name` varchar(50) NOT NULL COMMENT '部门名称',
   `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
   `parent` int(11) DEFAULT NULL COMMENT '归属部门',
   `mananger` int(11) DEFAULT NULL COMMENT '部门主管',
   `display_order` int(10) DEFAULT NULL COMMENT '序号',
   `level` int(2) DEFAULT NULL COMMENT '层级',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`),
   UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';
```
###员工-部门表
```
drop table if exists `at_employee_department`;

CREATE TABLE `at_employee_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-部门表';
```

###员工-公司表
```
DROP TABLE IF EXISTS `at_employee_company`;

CREATE TABLE `at_employee_company` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `employee_id` int(11) NOT NULL COMMENT '员工编号',
   `company_id` int(11) NOT NULL COMMENT '公司编号',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-公司表';
```


###打卡记录
```
DROP TABLE IF EXISTS `at_punch_edits`;

CREATE TABLE `at_punch_edits` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `id_card` int(11) NOT NULL COMMENT '用户身份证号',
   `device_id` int(11) NOT NULL COMMENT '设备编号',
   `recod_time` bigint(20) NOT NULL COMMENT '打卡时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打卡记录表';
```

##设备域
###设备表
```
DROP TABLE IF EXISTS `at_device`;

CREATE TABLE `at_device` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备编号',
   `name` varchar(32) NOT NULL COMMENT '设备名称',
   `category` int(2) NOT NULL COMMENT '设备类型(0-中控/1-考勤机/2-LED)',
   `ip_address` varchar(20) NOT NULL COMMENT 'ip地址',
   `serial_number` varchar(60) NOT NULL COMMENT '设备序列号',
   `brand` varchar(60) NOT NULL COMMENT '品牌',
   `type` varchar(60) NOT NULL COMMENT '型号',
   `installed_time` bigint(20) NOT NULL COMMENT '安装时间',
   `installed_location` varchar(50) NOT NULL COMMENT '安装位置',
   `installed_address` varchar(100) NOT NULL COMMENT '安装地址',
   `parent` int(11) DEFAULT NULL COMMENT '归属设备(仅为中控)',
   `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
   `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
   `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`),
   UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备表';
```

###设备-部门表
```
drop table if exists `at_device_department`;

CREATE TABLE `at_device_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `device_id` int(11) NOT NULL COMMENT '设备编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备-部门表';
```

###设备-公司表
```
DROP TABLE IF EXISTS `at_device_company`;

CREATE TABLE `at_device_company` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `device_id` int(11) NOT NULL COMMENT '设备编号',
   `company_id` int(11) NOT NULL COMMENT '公司编号',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备-公司表';
```