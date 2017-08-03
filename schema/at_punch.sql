DROP TABLE IF EXISTS `at_punch`;

CREATE TABLE `at_punch` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `employee_id` int(11) NOT NULL COMMENT '员工编号',
   `device_id` int(11) NOT NULL COMMENT '设备编号',
   `start_time` bigint(20) NOT NULL COMMENT '打卡时间',
   `status` INT(3) DEFAULT NULL COMMENT '是否正常(0-正常/1-迟到/2-早退)',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤表';
