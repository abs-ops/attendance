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
