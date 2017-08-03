DROP TABLE IF EXISTS `at_department`;

CREATE TABLE `at_department` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
   `name` varchar(50) NOT NULL COMMENT '部门名称',
   `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
   `parent` int(11) DEFAULT NULL COMMENT '归属部门',
   `mananger` int(11) DEFAULT NULL COMMENT '部门主管',
   `staff_num` int(11) DEFAULT NULL COMMENT '部门人数',
   `display_order` int(10) DEFAULT NULL COMMENT '序号',
   `level` int(2) DEFAULT NULL COMMENT '层级',
   `path` int(11) DEFAULT NULL COMMENT '路径(当前部门节点到部门根节点的路径)',
   `enable` smallint(6) DEFAULT NULL COMMENT '是否启用(true/false)',
   `deleted` smallint(6) DEFAULT NULL COMMENT '是否删除(false/true)',
   `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
   `gmt_modified` bigint(20) DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`),
   UNIQUE KEY `name_UNIQUE` (`name`),
   KEY `fk_at_department_1_idx` (`company_id`),
   KEY `fk_at_department_2_idx` (`parent`),
   CONSTRAINT `fk_at_department_1` FOREIGN KEY (`company_id`) REFERENCES `at_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_at_department_2` FOREIGN KEY (`parent`) REFERENCES `at_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';