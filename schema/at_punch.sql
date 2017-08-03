DROP TABLE IF EXISTS `at_punch`;

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
