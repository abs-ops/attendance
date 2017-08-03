DROP TABLE IF EXISTS `at_puncher`;

CREATE TABLE `at_puncher` (
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
  `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  `company_id` int(11) NOT NULL COMMENT '归属公司',
  `department_id` int(11) NOT NULL COMMENT '归属部门',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤机表';
