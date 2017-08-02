drop TABLE IF EXISTS `at_nation`;

CREATE TABLE `at_nation` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '民族编号',
   `name` varchar(32) DEFAULT NULL COMMENT '民族名称',
   `desc` varchar(255) DEFAULT NULL COMMENT '说明',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   PRIMARY KEY (`id`),
   UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='民族表';
