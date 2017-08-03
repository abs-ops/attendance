DROP TABLE IF EXISTS `at_employee_company`;

CREATE TABLE `at_employee_company` (
   `employee_id` int(11) NOT NULL COMMENT '员工编号',
   `company_id` int(11) NOT NULL COMMENT '公司编号',
   PRIMARY KEY (`employee_id`,`company_id`),
   KEY `fk_at_employee_company_2_idx` (`company_id`),
   CONSTRAINT `fk_at_employee_company_1` FOREIGN KEY (`employee_id`) REFERENCES `at_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_at_employee_company_2` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-公司表';