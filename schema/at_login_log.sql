DROP TABLE IF EXISTS `at_login_log`;

CREATE TABLE `at_login_log` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `user_id` int(11) NOT NULL COMMENT '用户编号',
   `ip_address` varchar(60) NOT NULL COMMENT 'ip地址',
   `entry_time` bigint(20) NOT NULL COMMENT '登录时间',
   `left_time` bigint(20) NOT NULL COMMENT '离开时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';