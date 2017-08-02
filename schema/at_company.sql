DROP TABLE IF EXISTS `at_company`;

CREATE TABLE `at_company` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
   `name` varchar(128) NOT NULL COMMENT '公司名称',
   `logo_url` varchar(256) DEFAULT NULL COMMENT '公司LOGO',
   `registration_num` varchar(100) DEFAULT NULL COMMENT '注册号或社会信用代码',
   `business_nature` varchar(256) DEFAULT NULL COMMENT '公司性质',
   `enterprise_type` varchar(256) DEFAULT NULL COMMENT '公司类型',
   `business_start` varchar(16) DEFAULT NULL COMMENT '经营期限开始',
   `business_end` varchar(16) DEFAULT NULL COMMENT '经营期限截止',
   `business_period_term` varchar(10) DEFAULT NULL COMMENT '长期(ALL表示长期)',
   `business_license_url` varchar(200) DEFAULT NULL COMMENT '营业执照',
   `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
   `company_province` varchar(20) DEFAULT NULL COMMENT '公司所在省',
   `company_city` varchar(20) DEFAULT NULL COMMENT '公司所在城市',
   `company_address` varchar(100) DEFAULT NULL COMMENT '办公地址',
   `registered_address` char(10) DEFAULT NULL COMMENT '注册地址',
   `telephone` varchar(8) DEFAULT NULL COMMENT '固定电话',
   `email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
   `parent` int(11) DEFAULT NULL COMMENT '母公司',
   `corporation` varchar(64) DEFAULT NULL COMMENT '公司法人',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`),
   UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';