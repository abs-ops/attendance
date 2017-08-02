DROP TABLE IF EXISTS `at_employee_department`;

CREATE TABLE `at_employee_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-部门表';