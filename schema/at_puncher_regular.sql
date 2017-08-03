DROP TABLE IF EXISTS `at_puncher_regular`;

CREATE TABLE `at_puncher_regular` (
   `puncher_id` int(11) NOT NULL COMMENT '考勤机编号',
   `regular_id` int(11) NOT NULL COMMENT '考勤规则编号',
   PRIMARY KEY (`puncher_id`,`regular_id`),
   KEY `fk_at_puncher_regular_2_idx` (`regular_id`),
   CONSTRAINT `fk_at_puncher_regular_1` FOREIGN KEY (`puncher_id`) REFERENCES `at_puncher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_at_puncher_regular_2` FOREIGN KEY (`regular_id`) REFERENCES `at_regular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤机考勤规则表';
