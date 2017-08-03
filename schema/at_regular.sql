DROP TABLE IF EXISTS `at_regular`;

CREATE TABLE `at_regular` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `name` varchar(256) NOT NULL COMMENT '规则名称',
   `content` varchar(256) NOT NULL COMMENT '规则内容',
   `desc` varchar(256) NOT NULL COMMENT '规则描述',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤规则表';
