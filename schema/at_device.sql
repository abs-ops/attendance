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
