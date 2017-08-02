drop table if exists `at_device_department`;

CREATE TABLE `at_device_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `device_id` int(11) NOT NULL COMMENT '设备编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备-部门表';