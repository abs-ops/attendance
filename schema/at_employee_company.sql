DROP TABLE IF EXISTS `at_employee_company`;

CREATE TABLE `at_employee_company` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `employee_id` int(11) NOT NULL COMMENT '员工编号',
   `company_id` int(11) NOT NULL COMMENT '公司编号',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-公司表';