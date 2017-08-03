DROP TABLE IF EXISTS `at_account`;

CREATE TABLE `at_account` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `user_code` varchar(128) NOT NULL COMMENT '账号',
   `user_id` int(11) NOT NULL COMMENT '用户编号（人员编号/公司编号)',
   `type` int(2) NOT NULL COMMENT '账号类型(0-人员/1-公司)',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户表';