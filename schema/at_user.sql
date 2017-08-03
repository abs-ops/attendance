DROP TABLE IF EXISTS `at_user`;

CREATE TABLE `at_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_code` varchar(32) NOT NULL COMMENT '账号',
  `full_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别(male/female)',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `origin` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `home_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
  `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_code_UNIQUE` (`user_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';