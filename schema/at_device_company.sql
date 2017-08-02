DROP TABLE IF EXISTS `at_device_company`;

CREATE TABLE `at_device_company` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `device_id` int(11) NOT NULL COMMENT '设备编号',
   `company_id` int(11) NOT NULL COMMENT '公司编号',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备-公司表';