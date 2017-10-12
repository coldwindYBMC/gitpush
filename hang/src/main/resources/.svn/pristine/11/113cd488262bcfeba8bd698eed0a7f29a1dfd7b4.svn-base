-- ----------涓氬姟搴� start------------------
-- -------------------------------------
-- -------------------------------------

DROP TABLE IF EXISTS `t_u_activity_evolement`;
DROP TABLE IF EXISTS `t_u_activity_evolvement`;
CREATE TABLE `t_u_activity_evolvement` (
  `Id` bigint(20) NOT NULL,
  `PlayerId` bigint(20) DEFAULT NULL,
  `ActivityItemId` int(11) DEFAULT NULL,
  `Count` int(11) NOT NULL DEFAULT '0' COMMENT '鏈疆浠诲姟瀹屾垚鐨勬鏁�',
  `RewardedCount` int(11) NOT NULL DEFAULT '0' COMMENT '棰嗗彇浠诲姟鐨勬鏁�',
  `RepeatedTurns` int(11) DEFAULT NULL COMMENT '宸茬粡瀹屾垚鐨勯噸澶嶈疆娆�''',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_u_activityrestitution`;
CREATE TABLE `t_u_activityrestitution` (
  `PlayerId` bigint(20) NOT NULL,
  `RechargeNum` int(11) DEFAULT NULL,
  `RestitutionNum` int(11) DEFAULT NULL,
  `RestitutionStatus` int(11) DEFAULT NULL,
  `RestitutionElements` varchar(5000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for `t_u_activity`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_activity`;
CREATE TABLE `t_u_activity` (
  `TemplateId` bigint(20) NOT NULL,
  `FunctionId` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `State` int(11) NOT NULL,
  `StartTime` bigint(20) DEFAULT '0',
  `EndTime` bigint(20) DEFAULT '0',
  `Data` TEXT DEFAULT NULL,
  PRIMARY KEY (`TemplateId`),
  KEY `idx_activity_state` (`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `t_u_activityinfo`;
CREATE TABLE `t_u_activityinfo` (
  `TemplateId` int(11) NOT NULL COMMENT '娲诲姩Id,瀵瑰簲妯＄増琛ㄤ腑鐨処D',
  `PlayerId` bigint(20) NOT NULL,
  `FunctionId` int(11) NOT NULL,
  `DailyUseCount` int(11) NOT NULL,
  `Progress` int(11) NOT NULL,
  `isOverTime` tinyint(1) DEFAULT NULL,
  `IsFinish` tinyint(1) DEFAULT NULL,
  `Today` bigint(20) DEFAULT NULL,
  `FinishTime` bigint(20) DEFAULT NULL,
  `CreateTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TemplateId`,`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_u_activityitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_activityitem`;
CREATE TABLE `t_u_activityitem` (
  `TemplateId` int(11) NOT NULL,
  `PlayerId` bigint(20) NOT NULL,
  `ActivityItemId` int(11) NOT NULL,
  `FunctionId` int(11) NOT NULL,
  `RewardStatus` int(11) NOT NULL,
  `Progresses` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`PlayerId`,`ActivityItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `t_u_activity_crowdfunding_communal`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_activity_crowdfunding_communal`;
CREATE TABLE `t_u_activity_crowdfunding_communal` (
  `TemplateId` int(11) DEFAULT NULL COMMENT '娲诲姩templateId',
  `Id` int(11) NOT NULL COMMENT '鍏叡浼楃鏁版嵁琛╥d',
  `WonPlayerId` bigint(20) NOT NULL DEFAULT '0' COMMENT '宸茶幏濂栫帺瀹秈d',
  `WonPlayerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '宸茶幏濂栫帺瀹跺悕瀛�',
  `WonPlayerHeadImg` varchar(255) DEFAULT NULL COMMENT '宸茶幏濂栫帺瀹跺ご鍍�',
  `WonPlayerBuyCount` int(4) NOT NULL DEFAULT '0' COMMENT '宸茶幏濂栫帺瀹惰喘涔版鏁�',
  `CrowdfundTemplateId` int(11) NOT NULL DEFAULT '0' COMMENT '浼楃妯℃澘琛╥d(澶栭敭)',
  `CurrentCount` int(7) NOT NULL DEFAULT '0' COMMENT '浼楃褰撳墠鏁伴噺',
  `TotalCount` int(7) DEFAULT NULL COMMENT '鐗╁搧鎬绘暟閲�',
  `ConsumeId` int(11) DEFAULT '0' COMMENT '娑堣�楃墿鍝乮d',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_u_activity_crowdfunding_player`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_activity_crowdfunding_player`;
CREATE TABLE `t_u_activity_crowdfunding_player` (
  `TemplateId` int(11) DEFAULT NULL COMMENT '娲诲姩templateId',
  `Id` int(11) NOT NULL COMMENT '瑙掕壊浼楃鏁版嵁琛↖d',
  `PlayerId` bigint(20) NOT NULL DEFAULT '0' COMMENT '瑙掕壊Id',
  `CommunalId` int(11) NOT NULL DEFAULT '0' COMMENT '浼楃鍏叡琛╥d(澶栭敭)',
  `BuyCount` int(11) NOT NULL DEFAULT '0' COMMENT '浼楃鐗╁搧璐拱鏁伴噺',
  `HasRedPoint` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄惁鏈夊皬绾㈢偣',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `t_u_activity_condition_state`;
CREATE TABLE `t_u_activity_condition_state` (
  `ConditionId` int(11) NOT NULL COMMENT 't_s_activity_condition.id',
  `State` text COMMENT '淇濆瓨鍚勭被鐘舵��,JSON鏍煎紡',
  PRIMARY KEY (`ConditionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_u_activity_evolement_njzl`;
DROP TABLE IF EXISTS `t_u_activity_evolvement_njzl`;
CREATE TABLE `t_u_activity_evolvement_njzl` (
  `PlayerId` BIGINT(20) NOT NULL,
  `Count` INT(11) NOT NULL,
  `TaskRewardStatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_u_activity_personal_state`;
CREATE TABLE `t_u_activity_personal_state` (
  `TemplateId` int(11) NOT NULL COMMENT '活动Id,对应模版表中的ID',
  `PlayerId` bigint(20) NOT NULL,
  `FunctionId` int(11) NOT NULL,
  `State` int(11) NOT NULL DEFAULT '0',
  `StartTime` bigint(20) DEFAULT NULL,
  `EndTime` bigint(20) DEFAULT NULL,
  `Data` text,
  PRIMARY KEY (`TemplateId`,`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_u_activity_lbgift`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_activity_lbgift`;
CREATE TABLE `t_u_activity_lbgift` (
  `TemplateId` int(11) NOT NULL,
  `SoldierCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
