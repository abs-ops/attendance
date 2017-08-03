DROP TABLE IF EXISTS `at_employee_department`;

CREATE TABLE `at_employee_department` (
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`employee_id`,`department_id`),
  KEY `fk_at_employee_department_2_idx` (`department_id`),
  CONSTRAINT `fk_at_employee_department_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_at_employee_department_2` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-部门表';