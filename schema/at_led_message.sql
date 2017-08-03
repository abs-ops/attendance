DROP TABLE IF EXISTS `at_led_message`;

CREATE TABLE `at_led_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息编号',
  `name` varchar(32) NOT NULL COMMENT '消息名称',
  `content` varchar(256) NOT NULL COMMENT '规则内容',
  `led_id` int(11) NOT NULL COMMENT 'led编号',
  `start_time` bigint(20) NOT NULL COMMENT '消息生效时间',
  `end_time` bigint(20) NULL COMMENT '消息失效时间',
  `expiry_date` varchar(6) NOT NULL COMMENT '有效期(0：长期/nd：n天/nw:n周/nM：n月/nY:n年/自定义)',
  `enable` smallint(6) NOT NULL COMMENT '是否启用(true/false)',
  `deleted` smallint(6) NOT NULL COMMENT '是否删除(false/true)',
  `gmt_created` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='led消息表';
