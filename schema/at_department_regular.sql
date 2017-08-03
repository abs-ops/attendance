DROP TABLE IF EXISTS `at_department_regular`;

CREATE TABLE `at_department_regular` (
   `department_id` int(11) NOT NULL COMMENT '部门编号',
   `regular_id` int(11) NOT NULL COMMENT '考勤规则编号',
   PRIMARY KEY (`department_id`,`regular_id`),
   KEY `fk_at_department_regular_2_idx` (`regular_id`),
   CONSTRAINT `fk_at_department_regular_1` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_at_department_regular_2` FOREIGN KEY (`regular_id`) REFERENCES `at_regular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门考勤规则表';