DROP TABLE IF EXISTS `at_punch_history`;

CREATE TABLE `at_punch_history` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `id_card` int(11) NOT NULL COMMENT '用户身份证号',
   `device_id` int(11) NOT NULL COMMENT '设备编号',
   `recod_time` bigint(20) NOT NULL COMMENT '打卡时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打卡记录表';
