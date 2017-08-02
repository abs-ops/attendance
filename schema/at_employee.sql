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
