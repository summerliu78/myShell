
-- ----------------------------
-- Table structure for black_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `black_bank_card`;
CREATE TABLE `black_bank_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_card` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_bank_card` (`bank_card`)
) ENGINE=InnoDB AUTO_INCREMENT=120328 DEFAULT CHARSET=utf8 COMMENT='银行卡号黑名单';

-- ----------------------------
-- Table structure for black_device_fingerprint
-- ----------------------------
DROP TABLE IF EXISTS `black_device_fingerprint`;
CREATE TABLE `black_device_fingerprint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_fingerprint` varchar(50) DEFAULT NULL COMMENT '同盾设备编号',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_device_fingerprint` (`device_fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=120327 DEFAULT CHARSET=utf8 COMMENT='同盾设备编号黑名单';

-- ----------------------------
-- Table structure for black_id_card
-- ----------------------------
DROP TABLE IF EXISTS `black_id_card`;
CREATE TABLE `black_id_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_card` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=561328 DEFAULT CHARSET=utf8 COMMENT='身份证号黑名单';

-- ----------------------------
-- Table structure for black_ip_address
-- ----------------------------
DROP TABLE IF EXISTS `black_ip_address`;
CREATE TABLE `black_ip_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_ip_address` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=550203 DEFAULT CHARSET=utf8 COMMENT='ip地址黑名单';

-- ----------------------------
-- Table structure for black_mac_address
-- ----------------------------
DROP TABLE IF EXISTS `black_mac_address`;
CREATE TABLE `black_mac_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mac_address` varchar(50) DEFAULT NULL COMMENT 'mac地址',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_mac_address` (`mac_address`)
) ENGINE=InnoDB AUTO_INCREMENT=11806 DEFAULT CHARSET=utf8 COMMENT='mac地址黑名单';

-- ----------------------------
-- Table structure for black_mobile
-- ----------------------------
DROP TABLE IF EXISTS `black_mobile`;
CREATE TABLE `black_mobile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=420328 DEFAULT CHARSET=utf8 COMMENT='手机号黑名单';


-- ----------------------------
-- Table structure for black_wbid
-- ----------------------------
DROP TABLE IF EXISTS `black_wbid`;
CREATE TABLE `black_wbid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wbid` varchar(50) DEFAULT NULL COMMENT '微博id',
  `opt_type` char(9) NOT NULL COMMENT '操作类型：100入库，200出库，300更新',
  `curop_id` bigint(20) DEFAULT NULL COMMENT '当前操作人id',
  `curop_name` varchar(20) DEFAULT NULL COMMENT '当前操作人姓名',
  `status` char(9) NOT NULL COMMENT '状态：100有效，200无效',
  `effective_type` char(9) NOT NULL COMMENT '入库类型：30--30天,30000--永久',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '批次号uuid',
  `file_alias` varchar(50) DEFAULT NULL COMMENT '名单别名',
  `tag_content` varchar(500) DEFAULT NULL COMMENT '打标内容',
  `black_level` varchar(100) DEFAULT NULL COMMENT '涉黑级别',
  `data_source` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_black_wbid` (`wbid`)
) ENGINE=InnoDB AUTO_INCREMENT=511835 DEFAULT CHARSET=utf8 COMMENT='微博id黑名单';
