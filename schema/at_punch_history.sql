DROP TABLE IF EXISTS `at_punch_history`;

CREATE TABLE `at_punch_history` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `id_card` int(11) NOT NULL COMMENT '用户身份证号',
   `puncher_id` int(11) NOT NULL COMMENT '考勤机编号',
   `department_id` int(11) NOT NULL,
   `recod_time` bigint(20) NOT NULL COMMENT '部门编号',
   PRIMARY KEY (`id`),
   KEY `fk_at_punch_history_1_idx` (`id_card`),
   KEY `fk_at_punch_history_2_idx` (`puncher_id`),
   KEY `fk_at_punch_history_3_idx` (`department_id`),
   CONSTRAINT `fk_at_punch_history_1` FOREIGN KEY (`id_card`) REFERENCES `at_person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_at_punch_history_2` FOREIGN KEY (`puncher_id`) REFERENCES `at_puncher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_at_punch_history_3` FOREIGN KEY (`department_id`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打卡记录表';
