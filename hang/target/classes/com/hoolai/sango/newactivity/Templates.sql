-- ----------模版库 start------------------
-- -------------------------------------
-- -------------------------------------
DROP TABLE IF EXISTS `t_s_activity_evolvement`;
CREATE TABLE `t_s_activity_evolvement` (
  `Id` bigint(20) NOT NULL,
  `ActivityItemIds` varchar(255) DEFAULT NULL,
  `Day` int(11) NOT NULL,
  `Count` int(11) DEFAULT NULL COMMENT '循环多少轮',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_s_activity_evolvement` (`Id`, `ActivityItemIds`, `Day`, `Count`)
VALUES
	(1, '150001,150002,150003', 0, 1),
	(2, '150001,150002,150003', 1, 4),
	(3, '150001,150002,150003', 2, 7),
	(4, '150001,150002,150003', 3, 10),
	(5, '150001,150002,150003', 4, 13),
	(6, '150001,150002,150003', 5, 16);


-- ----------------------------
-- Table structure for `t_s_activity_condition`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_activity_condition`;
CREATE TABLE `t_s_activity_condition` (
  `Id` int(11) NOT NULL,
  `TemplateId` int(11) NOT NULL COMMENT 'ActivityTemplateId',
  `Type` varchar(63) NOT NULL COMMENT '权限类别',
  `Desc` varchar(63) DEFAULT NULL,
  `TransitionCodes` varchar(255) NOT NULL DEFAULT '' COMMENT '针对变迁的code,逗号分隔',
  `Params` text COMMENT '参数，json格式',
  `IsPersonal` tinyint(1) DEFAULT '0' COMMENT '玩家条件还是全局条件',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_activity_condition
-- ----------------------------

INSERT INTO `t_s_activity_condition` (`Id`, `TemplateId`, `Type`, `Desc`, `TransitionCodes`, `Params`, `IsPersonal`)
VALUES
	(1, 1, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(2, 2, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(3, 3, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(4, 4, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(5, 5, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(6, 6, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(7, 7, '10004', '新手狂欢', '', '{\"lastDays\":\"28\"}', 0),
	(8, 7, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(9, 8, '10003', '累计充值礼包', '', '{\"lastDays\":\"1\",\"preActivityTemplateId\":\"1\"}', 0),
	(10, 8, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(11, 9, '1002', '开服{afterDays}至{lastDays}', '10001,10004', '{\"afterDays\":\"0\",\"lastDays\":\"2\"}', 0),
	(12, 10, '10005', '七日礼包', '', '{\"lastDays\":\"1\",\"preActivityTemplateId\":\"10006\"}', 0),
	(13, 10, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(14, 11, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(15, 12, '10008', 'RMB武将进阶礼包', '', '{\"lastDays\":\"1\",\"soldierId\":\"60046\"}', 0),
	(16, 12, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(17, 14, '10008', '钻石武将进阶礼包', '', '{\"lastDays\":\"1\",\"soldierId\":\"60052\"}', 0),
	(18, 14, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(19, 101, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(20, 10001, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(21, 10002, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(22, 10003, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(23, 10004, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(24, 10005, '1001', '起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(25, 10006, '10002', '玩家创建{afterDays}至{lastDays}', '', '{\"afterDays\":\"0\",\"lastDays\":\"30\"}', 0),
	(26, 10006, '1001', '新服签到-起止时间-永久', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(27, 10007, '1002', '充值返利-开服{afterDays}天后，持续{lastDays}天', '10001,10004', '{\"afterDays\":\"3\",\"lastDays\":\"4\"}', 0),
	(28, 10008, '1001', '消费返利-起止时间-永久-假数据', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(29, 10011, '1002', '每日充值-开服{afterDays}天后，持续{lastDays}天', '10001,10004', '{\"afterDays\":\"2\",\"lastDays\":\"-1\"}', 0),
	(30, 10013, '1002', '摇钱树-开服{afterDays}天后，持续{lastDays}天', '10001,10004', '{\"afterDays\":\"13\",\"lastDays\":\"3\"}', 0),
	(32, 10014, '10002', '限时神将-玩家条件-玩家创建{afterDays}至{lastDays}', '', '{\"afterDays\":\"300\",\"lastDays\":\"30\"}', 0),
	(33, 10014, '1001', '限时神将-起止时间-永久', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(34, 10015, '1001', '领取体力-起止时间-永久', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(35, 10016, '10002', '坐骑礼包-玩家创建{afterDays}至{lastDays}', '', '{\"afterDays\":\"0\",\"lastDays\":\"7\"}', 0),
	(36, 10016, '1001', '坐骑礼包-起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(37, 10017, '1001', '登录送vip-起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(38, 10018, '10006', '限时关羽-玩家条件', '', '{\"lastDays\":\"3\",\"accumulateRmb\":\"30\"}', 0),
	(39, 10018, '1001', '限时关羽-起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(40, 10019, '10007', '关羽礼包-玩家条件', '', '{\"lastDays\":\"-1\",\"preActivityTemplateId\":\"10018\"}', 0),
	(41, 10019, '1001', '关羽礼包-起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(42, 10020, '1002', '充值排行-开服{afterDays}至{lastDays}', '10001,10004', '{\"afterDays\":\"4\",\"lastDays\":\"30\"}', 0),
	(43, 10021, '1001', '将领礼包-起止时间', '10001,10004', '{\"startTime\":\"2017-06-04 08:00:00\",\"endTime\":\"2017-06-04 08:00:00\"}', 0),
	(44, 10022, '1002', '一元夺宝-开服{afterDays}至{lastDays}', '10001,10004', '{\"afterDays\":\"3\",\"lastDays\":\"3\"}', 0),
	(45, 10023, '1002', '限时团购-开服{afterDays}至{lastDays}', '10001,10004', '{\"afterDays\":\"4\",\"lastDays\":\"2\"}', 0),
	(46, 10024, '1005', '备战南郡-30159事件发生，延续3天', '10001,10004', '{\"days\":\"3\",\"eventId\":\"30159\"}', 0),
	(47, 10026, '2003', '南郡之乱-开启的天下大势id', '10001,10004', '{\"evolvementId\":\"1005\"}', 0),
	(48, 10028, '1001', '月卡-起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(49, 10031, '1001', '老玩家福利-起止时间-永久', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', 0),
	(50, 10027, '10009', '吕布礼包', '', '{\"soldierId\":\"60040\",\"afterDays\":\"0\",\"lastDays\":\"3\",\"count\":\"5\",\"itemId\":\"2110144\",\"rewardNum\":\"20\"}', '0'),
    (51, 10027, '1001', '吕布礼包--起止时间', '10001,10004', '{\"startTime\":\"-1\",\"endTime\":\"-1\"}', '0');
;


	
	
-- ----------------------------
-- Table structure for `t_s_activitytemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_activitytemplate`;
CREATE TABLE `t_s_activitytemplate` (
  `TemplateId` int(11) NOT NULL DEFAULT '0' COMMENT '活动Id',
  `FunctionId` int(11) NOT NULL DEFAULT '0' COMMENT '是哪种功能, 替代原来的activityType ',
  `PositionType` int(11) NOT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Enabled` tinyint(1) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `BtnIcon` varchar(256) DEFAULT NULL,
  `Icon` varchar(256) DEFAULT NULL,
  `OpenConditionId` int(11) DEFAULT NULL,
  `VisibleConditionId` int(11) DEFAULT NULL,
  `DailyMaxCount` int(11) DEFAULT NULL,
  `ConditionType` int(11) DEFAULT NULL,
  `SonType` int(11) DEFAULT NULL,
  `ShineType` int(11) DEFAULT NULL,
  `CanModify` int(11) DEFAULT '0' COMMENT '运营是否可以配置',
  `ClearServiceData` tinyint(1) DEFAULT '0' COMMENT '手动下线时，是否要清理业务数据',
  PRIMARY KEY (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_activitytemplate
-- ----------------------------
INSERT INTO `t_s_activitytemplate` VALUES ('1', '106', '0', '1800', '1', '首冲礼包', 'main_btn_shouchong', 'main_btn_shouchong', '1', '2', '0', '-1', '0', '4', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('2', '102', '0', '800', '1', '限时玩法', 'main_btn_activitytime', 'main_btn_activitytime', '1', '3', '0', '-1', '1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('3', '101', '0', '900', '1', '精彩活动', 'main_btn_activity', 'main_btn_activity', '1', '3', '0', '-1', '1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('4', '105', '0', '700', '1', '日常', 'main_btn_sign', 'main_btn_sign', '1', '3', '0', '-1', '0', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('5', '103', '4', '800', '1', '邮件', 'main_btn_mail', 'main_btn_mail', '1', '3', '0', '-1', '1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('6', '104', '4', '900', '1', '排行榜', 'ui_mainui_btn_paihangbang', null, '1', '3', '0', '-1', '1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('7', '204', '2', '10001', '1', '新手狂欢', 'main_btn_kuanghuan', 'main_btn_kuanghuan', '1', '10', '0', '-1', '1', '4', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('8', '409', '0', '1400', '1', '累计充值礼包', 'main_bag_chongzhi', 'main_bag_chongzhi', '1', '7', '0', '150', '2', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('9', '410', '0', '1500', '1', '幸运装备礼包', 'main_bag_shenbing', 'main_bag_shenbing', '1', '18', '0', '150', '2', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10', '411', '0', '1950', '1', '七日礼包', 'main_bag_qiri', 'main_bag_qiri', '1', '9', '0', '150', '2', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('11', '412', '0', '1000', '1', '皇宫宝藏', 'main_btn_choujiang', 'main_btn_choujiang', '1', '3', '0', '-1', '1', '3', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('12', '417', '0', '1940', '1', 'RMB进阶礼包', 'main_bag_jj', null, '1', '16', '0', '-1', '2', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('14', '420', '0', '1930', '1', '钻石进阶礼包', 'main_bag_jj', null, '1', '15', '0', '-1', '2', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('101', '10001', '0', '3000', '1', '限时礼包', 'ui_mainui_btn_bag', null, '1', '2', '0', '-1', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10001', '201', '1', '100', '1', '更新公告', null, 'main_act_gonggao', '1', '3', '0', '-1', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10002', '202', '1', '200', '1', '礼包兑换', null, 'main_act_libao', '1', '3', '0', '-1', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10003', '203', '1', '300', '1', '联系我们', null, 'main_act_call', '1', '3', '0', '-1', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10004', '205', '1', '400', '1', '新服在线', null, 'main_act_zaixian', '1', '2', '0', '149', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10005', '301', '1', '500', '1', '成长基金', null, 'main_act_chengzhang', '1', '2', '0', '24', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10006', '206', '1', '700', '1', '新服签到', null, 'main_act_qiandao', '1', '1', '0', '148', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10007', '401', '1', '600', '1', '充值返利', null, 'main_act_chongzhi', '1', '14', '0', '150', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10008', '402', '1', '800', '1', '消费返利', null, 'main_act_xiaofei', '1', '2', '0', '151', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10011', '405', '5', '1900', '1', '每日充值', 'main_btn_everyday', 'ui_mainui_act_everyday', '1', '13', '0', '150', '2', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10013', '406', '1', '100', '1', '摇钱树', null, 'ui_mainui_act_tree', '1', '5', '8', '-1', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10014', '407', '1', '100', '0', '限时神将', null, null, '2', '5', '0', '147', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10015', '207', '1', '750', '1', '领取体力', null, 'main_act_tili', '1', '3', '0', '-1', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10016', '408', '5', '1950', '1', '坐骑礼包', 'ui_main_btn_ride', 'main_act_ride', '1', '6', '0', '-1', '2', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10017', '413', '1', '810', '1', '登录送VIP', 'ui_mainui_act_vip', 'ui_mainui_act_vip', '1', '2', '0', '148', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10018', '414', '5', '2000', '1', '限时关羽', 'main_btn_guanyu', 'ui_mainui_act_guanyu', '1', '11', '0', '-1', '2', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10019', '415', '1', '800', '1', '关羽礼包', null, 'ui_mainui_act_guanyu', '1', '12', '0', '-1', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10020', '416', '1', '2100', '1', '充值排行', null, 'main_act_rank', '1', '17', '0', '150', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10021', '418', '1', '820', '1', '将领礼包', null, 'main_act_jl_bag', '1', '21', '0', '-1', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10022', '421', '1', '910', '1', '一元夺宝', null, 'main_act_duobao', '1', '19', '0', '-1', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10023', '422', '1', '910', '1', '限时团购', null, 'main_act_tuangou', '5', '20', '0', '-1', '-1', '0', '1', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10024', '423', '1', '920', '1', '备战南郡', null, 'ui_mainui_act_nanjun', '1', '23', '0', '-1', '-1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10026', '424', '1', '930', '1', '南郡之战', 'ui_mainui_btn_njzl', 'ui_mainui_act_nanjun', '4', '24', '0', '-1', '1', '4', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10027', '426', '6', '940', '1', '吕布礼包', '', '', '1', '1', '0', '-1', '1', '0', '0', '0');
INSERT INTO `t_s_activitytemplate` VALUES ('10031', '425', '1', '0', '1', '老玩家福利', null, 'ui_mainui_act_neice', null, null, '0', '-1', '-1', '0', '0', '0');






-- ----------------------------
-- Table structure for `t_s_activityitemtemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_activityitemtemplate`;
CREATE TABLE `t_s_activityitemtemplate` (
  `TemplateId` int(11) DEFAULT NULL,
  `ActivityItemId` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `FunctionId` int(11) NOT NULL,
  `Level` int(11) DEFAULT NULL,
  `ClientValue` int(11) DEFAULT NULL,
  `PreActivityItemId` int(11) DEFAULT NULL,
  `CompleteConditionIds` varchar(256) NOT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Rewards` varchar(1024) DEFAULT NULL,
  `Coin` int(11) DEFAULT '0' COMMENT '金币或人民币',
  PRIMARY KEY (`ActivityItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_activityitemtemplate
-- ----------------------------
INSERT INTO `t_s_activityitemtemplate` VALUES ('10014', '10001', '限时神将', '407', '0', '10', '-1', '50101', '限时神将10积分可兑换', '2110141,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10014', '10002', '限时神将', '407', '0', '100', '-1', '50102', '限时神将100积分可兑换', '-10003,300,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10014', '10003', '限时神将', '407', '0', '300', '-1', '50103', '限时神将300积分可兑换', '2110141,20,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10014', '10004', '限时神将', '407', '0', '600', '-1', '50104', '限时神将600积分可兑换', '-10003,2000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10014', '10005', '限时神将', '407', '0', '1000', '-1', '50105', '限时神将1000积分可兑换', '2110141,30,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10014', '10006', '限时神将', '407', '0', '1500', '-1', '50106', '限时神将1500积分可兑换', '2110141,40,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20001', '连续签到', '206', '0', '1', '-1', '50201', '连续登陆1天', '2020301,20,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20002', '连续签到', '206', '0', '2', '-1', '50202', '连续登陆2天', '60052,1,5', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20003', '连续签到', '206', '0', '3', '-1', '50203', '连续登陆3天', '2090101,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20004', '连续签到', '206', '0', '4', '-1', '50204', '连续登陆4天', '2020301,200,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20005', '连续签到', '206', '0', '5', '-1', '50205', '连续登陆5天', '2010603,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20006', '连续签到', '206', '0', '6', '-1', '50206', '连续登陆6天', '-10003,500,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10006', '20007', '连续签到', '206', '0', '7', '-1', '50207', '连续登陆7天', '60053,1,5', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30001', '在线奖励', '205', '0', '5', '-1', '50301', '在线5分钟', '2270102,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30002', '在线奖励', '205', '0', '15', '-1', '50302', '在线15分钟', '-10003,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30003', '在线奖励', '205', '0', '30', '-1', '50303', '在线30分钟', '2260102,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30004', '在线奖励', '205', '0', '60', '-1', '50304', '在线60分钟', '2020301,50,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30005', '在线奖励', '205', '0', '120', '-1', '50305', '在线120分钟', '-10003,200,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30006', '在线奖励', '205', '0', '240', '-1', '50306', '在线240分钟', '2110101,50,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30007', '在线奖励', '205', '0', '360', '-1', '50307', '在线360分钟', '2020301,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10004', '30008', '在线奖励', '205', '0', '600', '-1', '50308', '在线600分钟', '-10003,300,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40001', '成长基金', '301', '20', '20', '-1', '50401', '等级到达20级', '-10003,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40002', '成长基金', '301', '25', '25', '-1', '50402', '等级到达25级', '-10003,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40003', '成长基金', '301', '30', '30', '-1', '50403', '等级到达30级', '-10003,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40004', '成长基金', '301', '35', '35', '-1', '50404', '等级到达35级', '-10003,200,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40005', '成长基金', '301', '40', '40', '-1', '50405', '等级到达40级', '-10003,200,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40006', '成长基金', '301', '45', '45', '-1', '50406', '等级到达45级', '-10003,200,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40007', '成长基金', '301', '50', '50', '-1', '50407', '等级到达50级', '-10003,300,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40008', '成长基金', '301', '55', '55', '-1', '50408', '等级到达55级', '-10003,300,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40009', '成长基金', '301', '60', '60', '-1', '50409', '等级到达60级', '-10003,300,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40010', '成长基金', '301', '65', '65', '-1', '50410', '等级到达65级', '-10003,400,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40011', '成长基金', '301', '70', '70', '-1', '50411', '等级到达70级', '-10003,400,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40012', '成长基金', '301', '75', '75', '-1', '50412', '等级到达75级', '-10003,500,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40013', '成长基金', '301', '80', '80', '-1', '50413', '等级到达80级', '-10003,500,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40014', '成长基金', '301', '85', '85', '-1', '50414', '等级到达85级', '-10003,600,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40015', '成长基金', '301', '90', '90', '-1', '50415', '等级到达90级', '-10003,600,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40016', '成长基金', '301', '95', '95', '-1', '50416', '等级到达95级', '-10003,1000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10005', '40017', '成长基金', '301', '100', '100', '-1', '50417', '等级到达100级', '-10003,1000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10011', '50001', '每日充值', '405', '0', '60', '-1', '50501', '每日充值60钻', '2110101,10,0;2010102,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10011', '50002', '每日充值', '405', '0', '300', '-1', '50502', '每日充值300钻', '2110101,15,0;2010202,1,0;2010602,1,0;-10030,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10011', '50003', '每日充值', '405', '0', '980', '-1', '50503', '每日充值980钻', '2440103,5,0;2110101,30,0;2010203,1,0;2010603,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10011', '50004', '每日充值', '405', '0', '2960', '-1', '50504', '每日充值2960钻', '2440103,5,0;2110101,40,0;2470204,1,0;2470404,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60001', '充值返利', '401', '0', '60', '-1', '50601', '充值60钻', '2260105,1,0;2041238,1,0;2110101,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60002', '充值返利', '401', '0', '300', '-1', '50602', '充值300钻', '2260105,2,0;2041238,1,0;2110101,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60003', '充值返利', '401', '0', '1980', '-1', '50604', '充值1980钻', '2260105,3,0;2041238,2,0;2110101,20,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60004', '充值返利', '401', '0', '3280', '-1', '50605', '充值3280钻', '2049006,1,0;2041238,2,0;2110101,30,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60005', '充值返利', '401', '0', '6480', '-1', '50606', '充值6480钻', '2260105,10,0;2041239,1,0;2110101,60,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60006', '充值返利', '401', '0', '9840', '-1', '50607', '充值9840钻', '2010605,1,0;2010205,1,0;2110101,70,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60007', '充值返利', '401', '0', '20000', '-1', '50608', '充值20000钻', '8990006,1,1;2440103,10,0;2110101,150,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10007', '60008', '充值返利', '401', '0', '50000', '-1', '50610', '充值50000钻', '2120104,1,0;2440103,30,0;2110101,500,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70001', '消费返利', '402', '0', '60', '-1', '50701', '消耗60钻', '2010102,1,0;-10001,10000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70002', '消费返利', '402', '0', '300', '-1', '50702', '消耗300钻', '2041252,5,0;-10001,30000,0;2090101,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70003', '消费返利', '402', '0', '980', '-1', '50703', '消耗980钻', '2240136,3,0;2020301,20,0;2090101,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70004', '消费返利', '402', '0', '1980', '-1', '50704', '消耗1980钻', '2041254,5,0;-10001,50000,0;2090101,15,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70005', '消费返利', '402', '0', '3280', '-1', '50705', '消耗3280钻', '2049003,1,0;2020301,60,0;2090101,15,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70006', '消费返利', '402', '0', '6480', '-1', '50706', '消耗6480钻', '2110101,20,0;-10001,200000,0;2090101,50,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70007', '消费返利', '402', '0', '10000', '-1', '50707', '消耗10000钻', '2049004,1,0;2020301,150,0;2070111,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10008', '70008', '消费返利', '402', '0', '30000', '-1', '50708', '消耗30000钻', '2110101,50,0;-10001,1000000,0;2090101,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10016', '80001', '坐骑礼包', '408', '0', '0', '-1', '50801', '坐骑礼包奖励', '2042202,1,0;-10003,388,0;2260102,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('1', '90001', '首冲礼包', '106', '0', '0', '-1', '50901', '首冲礼包', '60041,1,5;2260105,1,0;2020301,50,0;-10001,100000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('8', '90002', '累计充值礼包', '409', '0', '300', '-1', '50902', '今日累计充值30元', '2120104,1,0;2110143,16,0;2240136,2,0;2270103,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('8', '90003', '累计充值礼包', '409', '0', '980', '-1', '50903', '今日累计充值98元', '2042601,1,0;2110143,36,0;2240136,5,0;2270104,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('9', '90004', '幸运装备礼包', '410', '0', '980', '-1', '51201', '幸运装备礼包', '8990003,1,1;2440103,8,0;2020302,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10', '90005', '七日礼包', '411', '0', '980', '-1', '50905', '今日累计充值980钻', '240301,1,4;2110156,30,0;2240153,3,0;2270104,5,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100001', '登录送VIP', '413', '0', '1', '-1', '51001', '累计登录1天', '-10034,10,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100002', '登录送VIP', '413', '0', '2', '-1', '51002', '累计登录2天', '-10034,10,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100003', '登录送VIP', '413', '0', '3', '-1', '51003', '累计登录3天', '-10034,10,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100004', '登录送VIP', '413', '0', '4', '-1', '51004', '累计登录4天', '-10034,20,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100005', '登录送VIP', '413', '0', '5', '-1', '51005', '累计登录5天(可升级到VIP1)', '-10034,20,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100006', '登录送VIP', '413', '0', '6', '-1', '51006', '累计登录6天', '-10034,20,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100007', '登录送VIP', '413', '0', '7', '-1', '51007', '累计登录7天', '-10034,30,0;2270104,1,0;-10001,50000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100008', '登录送VIP', '413', '0', '9', '-1', '51008', '累计登录9天', '-10034,30,0;2270104,2,0;-10001,100000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100009', '登录送VIP', '413', '0', '12', '-1', '51009', '累计登录12天', '-10034,30,0;2270104,2,0;-10001,100000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100010', '登录送VIP', '413', '0', '16', '-1', '51010', '累计登录16天(可升级到VIP2)', '-10034,75,0;2270104,3,0;-10001,150000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100011', '登录送VIP', '413', '0', '20', '-1', '51011', '累计登录20天', '-10034,75,0;2270104,3,0;-10001,150000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100012', '登录送VIP', '413', '0', '25', '-1', '51012', '累计登录25天', '-10034,75,0;2270104,3,0;-10001,150000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100013', '登录送VIP', '413', '0', '30', '-1', '51013', '累计登录30天(可升级到VIP3)', '-10034,150,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100014', '登录送VIP', '413', '0', '40', '-1', '51014', '累计登录40天', '-10034,150,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100015', '登录送VIP', '413', '0', '50', '-1', '51015', '累计登录50天', '-10034,150,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100016', '登录送VIP', '413', '0', '60', '-1', '51016', '累计登录60天(可升级到VIP4)', '-10034,300,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100017', '登录送VIP', '413', '0', '75', '-1', '51017', '累计登录75天', '-10034,300,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100018', '登录送VIP', '413', '0', '90', '-1', '51018', '累计登录90天', '-10034,300,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100019', '登录送VIP', '413', '0', '105', '-1', '51019', '累计登录105天(可升级到VIP5)', '-10034,500,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100020', '登录送VIP', '413', '0', '120', '-1', '51020', '累计登录120天', '-10034,500,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10017', '100021', '登录送VIP', '413', '0', '135', '-1', '51021', '累计登录135天(可升级到VIP6)', '-10034,500,0;2270104,5,0;-10001,200000,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10018', '110001', '限时关羽礼包', '414', '0', '0', '-1', '51101', '关羽礼包奖励', '60017,1,5;2110132,100,0;-10042,1,0;2042603,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10019', '110002', '关羽礼包', '415', '0', '0', '-1', '51101', '关羽礼包奖励', '60017,1,5;2110132,100,0;-10042,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('12', '120001', 'RMB进阶礼包', '417', '0', '300', '-1', '51301', 'RMB进阶礼包', '2110149,150,0;243301,1,4;-10003,2000,0;-10030,100,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10021', '130001', '张飞将领礼包', '418', '0', '2980', '-1', '50801', '购买张飞将领礼包', '60018,1,5;2110133,10,0;2240130,1,0', '2980');
INSERT INTO `t_s_activityitemtemplate` VALUES ('14', '140001', '钻石进阶礼包', '420', '0', '98', '-1', '50903', '钻石进阶礼包', '282301,1,4;2110155,80,0;2120102,150,0;-10001,100000,0', '1980');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10024', '150001', '备战南郡', '423', '0', '20', '-1', '51501', '通过副本20次', '-10005,80,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10024', '150002', '备战南郡', '423', '0', '10', '-1', '51502', '击杀10个攻城略地中的野怪', '-10045,8,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10024', '150003', '备战南郡', '423', '0', '5', '-1', '51503', '击杀5个攻城略地中的橙怪', '-10046,3,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10025', '160001', '南郡之乱', '424', '0', '8', '-1', '51601', '击杀8个攻城略地中的精英橙怪', '2260101,2,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10025', '160002', '南郡之乱', '424', '0', '12', '-1', '51602', '击杀12个攻城略地中的精英橙怪', '2110101,10,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10025', '160003', '南郡之乱', '424', '0', '16', '-1', '51603', '击杀16个攻城略地中的精英橙怪', '2490201,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10026', '170001', '南郡之乱', '425', '0', '12', '-1', '51701', '击杀12个攻城略地中的精英橙怪', '2260101,6,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10026', '170002', '南郡之乱', '425', '0', '24', '-1', '51702', '击杀24个攻城略地中的精英橙怪', '2110101,20,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10026', '170003', '南郡之乱', '425', '0', '48', '-1', '51703', '击杀48个攻城略地中的精英橙怪', '2490201,1,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10027', '180001', '南郡之乱', '426', '0', '10', '-1', '51801', '击杀10个攻城略地中的精英橙怪', '2260101,4,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10027', '180002', '南郡之乱', '426', '0', '21', '-1', '51802', '击杀21个攻城略地中的精英橙怪', '2110101,15,0', '-1');
INSERT INTO `t_s_activityitemtemplate` VALUES ('10027', '180003', '南郡之乱', '426', '0', '32', '-1', '51803', '击杀32个攻城略地中的精英橙怪', '2490201,1,0', '-1');




-- ----------------------------
-- Table structure for `t_s_activity_crowdfundingtemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_activity_crowdfundingtemplate`;
CREATE TABLE `t_s_activity_crowdfundingtemplate` (
  `TemplateId` int(11) NOT NULL DEFAULT '0',
  `CrowdfundingId` int(11) NOT NULL COMMENT '众筹表id(也用于活动顶替顺序)',
  `TotalCount` int(7) NOT NULL DEFAULT '0' COMMENT '众筹完成总数量',
  `Price` int(3) NOT NULL DEFAULT '0' COMMENT '众筹物品购买单价',
  `ItemId` int(11) NOT NULL DEFAULT '0' COMMENT '众筹奖励物品id',
  `ItemCount` int(4) NOT NULL DEFAULT '0' COMMENT '众筹奖励物品数量',
  `ItemType` int(11) NOT NULL DEFAULT '0' COMMENT '众筹奖励物品类别',
  `ConsumeId` int(11) NOT NULL DEFAULT '0' COMMENT '消耗物品id',
  PRIMARY KEY (`TemplateId`,`CrowdfundingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_activity_crowdfundingtemplate
-- ----------------------------
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '1', '100', '1', '2480101', '2000', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '2', '100', '1', '2480401', '2000', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '3', '100', '1', '2480201', '2000', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '4', '100', '1', '2480301', '2000', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '5', '400', '1', '2010205', '1', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '6', '400', '1', '2010605', '1', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '7', '400', '1', '2110101', '100', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '8', '1000', '1', '2010206', '1', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '9', '1000', '1', '2010606', '1', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '10', '1000', '1', '2010306', '1', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '11', '1000', '1', '2010106', '1', '0', '2500101');
INSERT INTO `t_s_activity_crowdfundingtemplate` VALUES ('10022', '12', '10000', '1', '2070108', '1', '0', '2500101');



-- ----------------------------
-- Table structure for `t_s_activity_group_purchase_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_activity_group_purchase_item`;
CREATE TABLE `t_s_activity_group_purchase_item` (
  `TemplateId` bigint(20) NOT NULL COMMENT '主键',
  `ActivityId` int(11) NOT NULL COMMENT '活动id',
  `ItemId` int(11) NOT NULL COMMENT '道具TemplateId',
  `ItemName` varchar(63) DEFAULT NULL COMMENT '道具名称',
  `Discounts` varchar(255) DEFAULT NULL COMMENT '折扣配置，"count1,discount1;count2,discount2;..."',
  `Count` int(11) DEFAULT NULL COMMENT '数量',
  `OriginPrice` int(11) DEFAULT NULL COMMENT '原价',
  `CurrencyId` int(11) DEFAULT NULL COMMENT '货币Id',
  `LimitCount` int(11) DEFAULT NULL COMMENT '每人限购次数',
  PRIMARY KEY (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时团购';

-- ----------------------------
-- Records of t_s_activity_group_purchase_item
-- ----------------------------
INSERT INTO `t_s_activity_group_purchase_item` VALUES ('1', '422', '2480201', '青龙玉', '0,8;2,7;4,6;6,5;8,4', '100', '10', '-10003', '20');
INSERT INTO `t_s_activity_group_purchase_item` VALUES ('2', '422', '2480401', '白虎玉', '0,8;200,7;400,6;600,5;800,4', '100', '10', '-10003', '20');
INSERT INTO `t_s_activity_group_purchase_item` VALUES ('3', '422', '2010204', '4级攻击宝石', '0,8;200,7;400,6;600,5;800,4', '1', '135', '-10003', '10');
INSERT INTO `t_s_activity_group_purchase_item` VALUES ('4', '422', '2010604', '4级暴击宝石', '0,8;200,7;400,6;600,5;800,4', '1', '135', '-10003', '10');
INSERT INTO `t_s_activity_group_purchase_item` VALUES ('5', '422', '2120105', '将领升橙书碎片', '0,8;200,7;400,6;600,5;800,4', '1', '100', '-10003', '20');
INSERT INTO `t_s_activity_group_purchase_item` VALUES ('6', '422', '2440103', '橙色精炼石', '0,8;200,7;400,6;600,5;800,4', '1', '50', '-10003', '10');





-- ----------------------------
-- Table structure for `t_s_rechargetemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_rechargetemplate`;
CREATE TABLE `t_s_rechargetemplate` (
  `RechargeId` int(11) NOT NULL,
  `RechargeName` varchar(32) DEFAULT NULL,
  `RechargeType` int(11) NOT NULL,
  `TemplateId` int(11) DEFAULT NULL,
  `RMB` int(11) NOT NULL,
  `Coin` int(11) NOT NULL,
  `DonateType` int(11) NOT NULL,
  `CoinToken` int(11) NOT NULL,
  `VipValue` int(11) DEFAULT NULL,
  `GoodDescrice` varchar(512) DEFAULT NULL,
  `Icon` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`RechargeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_rechargetemplate
-- ----------------------------
INSERT INTO `t_s_rechargetemplate` VALUES ('2001001', '周卡', '2', null, '12', '150', '3', '0', '120', '每日领取<font color=#0167b5>150</font>钻(7天）', 'vip_day');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001002', '月卡', '1', null, '25', '300', '3', '0', '250', '每日领取<font color=#0167b5>100</font>钻(30天)', 'vip_month');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001003', '60钻', '3', null, '6', '60', '1', '60', '60', '另赠<font color=#0167b5>60</font>钻', 'vip_zs_1');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001004', '300钻', '3', null, '30', '300', '1', '300', '300', '另赠<font color=#0167b5>300</font>钻', 'vip_zs_2');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001005', '980钻', '3', null, '98', '980', '1', '980', '980', '另赠<font color=#0167b5>980</font>钻', 'vip_zs_3');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001006', '1980钻', '3', null, '198', '1980', '1', '1980', '1980', '另赠<font color=#0167b5>1980</font>钻', 'vip_zs_4');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001007', '3280钻', '3', null, '328', '3280', '1', '3280', '3280', '另赠<font color=#0167b5>3280</font>钻', 'vip_zs_5');
INSERT INTO `t_s_rechargetemplate` VALUES ('2001008', '6480钻', '3', null, '648', '6480', '1', '6480', '6480', '另赠<font color=#0167b5>6480</font>钻', 'vip_zs_6');
INSERT INTO `t_s_rechargetemplate` VALUES ('3001002', '坐骑礼包', '4', '10016', '30', '0', '1', '0', '300', null, null);
INSERT INTO `t_s_rechargetemplate` VALUES ('3001003', '限时关羽礼包', '4', '10018', '998', '0', '1', '0', '9980', null, null);
INSERT INTO `t_s_rechargetemplate` VALUES ('3001004', '关羽礼包', '4', '10019', '998', '0', '1', '0', '9980', null, null);
INSERT INTO `t_s_rechargetemplate` VALUES ('3001005', '成长基金', '4', '10005', '68', '0', '1', '1360', '680', null, null);
INSERT INTO `t_s_rechargetemplate` VALUES ('3001006', '幸运装备礼包', '4', '9', '98', '0', '1', '0', '980', null, null);
INSERT INTO `t_s_rechargetemplate` VALUES ('3001007', 'RMB进阶礼包', '4', '12', '648', '0', '1', '0', '6480', null, null);

