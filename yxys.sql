/*
Navicat MySQL Data Transfer

Source Server         : hk19.26pd.com_3306
Source Server Version : 50157
Source Host           : hk19.26pd.com:3306
Source Database       : yxys

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2014-11-14 01:30:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_action`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of onethink_action
-- ----------------------------
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `onethink_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `onethink_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `onethink_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `onethink_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `onethink_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `onethink_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `onethink_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `onethink_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `onethink_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for `onethink_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`) USING BTREE,
  KEY `action_id_ix` (`action_id`) USING BTREE,
  KEY `user_id_ix` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=967 DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Records of onethink_action_log
-- ----------------------------
INSERT INTO `onethink_action_log` VALUES ('478', '1', '1', '2130706433', 'member', '1', '123在2014-10-26 03:11登录了后台', '1', '1414264315');
INSERT INTO `onethink_action_log` VALUES ('479', '1', '1', '2102927650', 'member', '1', '123在2014-10-26 04:40登录了后台', '1', '1414269652');
INSERT INTO `onethink_action_log` VALUES ('480', '1', '1', '977128489', 'member', '1', '123在2014-10-26 05:02登录了后台', '1', '1414270938');
INSERT INTO `onethink_action_log` VALUES ('481', '1', '1', '977128489', 'member', '1', '123在2014-10-26 05:05登录了后台', '1', '1414271115');
INSERT INTO `onethink_action_log` VALUES ('482', '6', '1', '977128489', 'config', '20', '操作url：/admin.php?s=/Config/edit.html', '1', '1414272713');
INSERT INTO `onethink_action_log` VALUES ('483', '1', '1', '2102927650', 'member', '1', '123在2014-10-26 14:44登录了后台', '1', '1414305861');
INSERT INTO `onethink_action_log` VALUES ('484', '1', '1', '977127763', 'member', '1', '123在2014-10-26 18:02登录了后台', '1', '1414317753');
INSERT INTO `onethink_action_log` VALUES ('485', '1', '1', '977127763', 'member', '1', '123在2014-10-26 18:03登录了后台', '1', '1414317834');
INSERT INTO `onethink_action_log` VALUES ('486', '1', '1', '977127763', 'member', '1', '123在2014-10-26 20:10登录了后台', '1', '1414325429');
INSERT INTO `onethink_action_log` VALUES ('487', '10', '1', '977127763', 'Menu', '151', '操作url：/admin.php?s=/Menu/add.html', '1', '1414325512');
INSERT INTO `onethink_action_log` VALUES ('488', '10', '1', '977127763', 'Menu', '151', '操作url：/admin.php?s=/Menu/edit.html', '1', '1414325527');
INSERT INTO `onethink_action_log` VALUES ('489', '10', '1', '977127763', 'Menu', '150', '操作url：/admin.php?s=/Menu/edit.html', '1', '1414325551');
INSERT INTO `onethink_action_log` VALUES ('490', '10', '1', '977127763', 'Menu', '152', '操作url：/admin.php?s=/Menu/add.html', '1', '1414325600');
INSERT INTO `onethink_action_log` VALUES ('491', '10', '1', '977127763', 'Menu', '152', '操作url：/admin.php?s=/Menu/edit.html', '1', '1414325616');
INSERT INTO `onethink_action_log` VALUES ('492', '8', '1', '977127763', 'attribute', '47', '操作url：/admin.php?s=/Attribute/update.html', '1', '1414329390');
INSERT INTO `onethink_action_log` VALUES ('493', '1', '1', '2102927650', 'member', '1', '123在2014-10-26 22:07登录了后台', '1', '1414332459');
INSERT INTO `onethink_action_log` VALUES ('494', '11', '1', '977128489', 'category', '70', '操作url：/admin.php?s=/Category/add.html', '1', '1414338807');
INSERT INTO `onethink_action_log` VALUES ('495', '1', '1', '977128489', 'member', '1', '123在2014-10-27 00:46登录了后台', '1', '1414342019');
INSERT INTO `onethink_action_log` VALUES ('496', '11', '1', '977128489', 'category', '71', '操作url：/admin.php?s=/Category/add.html', '1', '1414344085');
INSERT INTO `onethink_action_log` VALUES ('497', '11', '1', '977128489', 'category', '68', '操作url：/admin.php?s=/Category/edit.html', '1', '1414344272');
INSERT INTO `onethink_action_log` VALUES ('498', '11', '1', '977128489', 'category', '68', '操作url：/admin.php?s=/Category/edit.html', '1', '1414344293');
INSERT INTO `onethink_action_log` VALUES ('499', '1', '1', '977128489', 'member', '1', '123在2014-10-27 02:05登录了后台', '1', '1414346721');
INSERT INTO `onethink_action_log` VALUES ('500', '1', '1', '977128489', 'member', '1', '123在2014-10-27 02:06登录了后台', '1', '1414346776');
INSERT INTO `onethink_action_log` VALUES ('501', '1', '1', '977127763', 'member', '1', '123在2014-10-27 04:55登录了后台', '1', '1414356938');
INSERT INTO `onethink_action_log` VALUES ('502', '1', '1', '977127763', 'member', '1', '123在2014-10-27 06:15登录了后台', '1', '1414361711');
INSERT INTO `onethink_action_log` VALUES ('503', '1', '1', '1902943685', 'member', '1', '123在2014-10-27 18:07登录了后台', '1', '1414404454');
INSERT INTO `onethink_action_log` VALUES ('504', '6', '1', '977127763', 'config', '49', '操作url：/admin.php?s=/Config/edit.html', '1', '1414407504');
INSERT INTO `onethink_action_log` VALUES ('505', '1', '1', '1902943685', 'member', '1', '123在2014-10-27 19:34登录了后台', '1', '1414409692');
INSERT INTO `onethink_action_log` VALUES ('506', '1', '1', '2102927650', 'member', '1', '123在2014-10-28 15:58登录了后台', '1', '1414483107');
INSERT INTO `onethink_action_log` VALUES ('507', '1', '1', '2102927650', 'member', '1', '123在2014-10-28 18:26登录了后台', '1', '1414492010');
INSERT INTO `onethink_action_log` VALUES ('508', '1', '1', '2102927650', 'member', '1', '123在2014-10-28 21:08登录了后台', '1', '1414501702');
INSERT INTO `onethink_action_log` VALUES ('509', '6', '1', '2102927650', 'config', '50', '操作url：/admin.php?s=/Config/edit.html', '1', '1414504839');
INSERT INTO `onethink_action_log` VALUES ('510', '1', '1', '2102927650', 'member', '1', '123在2014-10-28 22:01登录了后台', '1', '1414504915');
INSERT INTO `onethink_action_log` VALUES ('511', '1', '1', '2102927650', 'member', '1', '123在2014-10-28 22:03登录了后台', '1', '1414504984');
INSERT INTO `onethink_action_log` VALUES ('512', '1', '1', '977127858', 'member', '1', '123在2014-10-29 03:15登录了后台', '1', '1414523704');
INSERT INTO `onethink_action_log` VALUES ('513', '1', '1', '977127858', 'member', '1', '123在2014-10-29 14:32登录了后台', '1', '1414564347');
INSERT INTO `onethink_action_log` VALUES ('514', '1', '1', '977127815', 'member', '1', '123在2014-10-29 15:57登录了后台', '1', '1414569466');
INSERT INTO `onethink_action_log` VALUES ('515', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 16:57登录了后台', '1', '1414573052');
INSERT INTO `onethink_action_log` VALUES ('516', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 17:25登录了后台', '1', '1414574718');
INSERT INTO `onethink_action_log` VALUES ('517', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 17:41登录了后台', '1', '1414575684');
INSERT INTO `onethink_action_log` VALUES ('518', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 18:04登录了后台', '1', '1414577081');
INSERT INTO `onethink_action_log` VALUES ('519', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 18:15登录了后台', '1', '1414577706');
INSERT INTO `onethink_action_log` VALUES ('520', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 21:17登录了后台', '1', '1414588666');
INSERT INTO `onethink_action_log` VALUES ('521', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 22:25登录了后台', '1', '1414592717');
INSERT INTO `onethink_action_log` VALUES ('522', '1', '1', '977127858', 'member', '1', '123在2014-10-29 23:05登录了后台', '1', '1414595119');
INSERT INTO `onethink_action_log` VALUES ('523', '1', '1', '2102927650', 'member', '1', '123在2014-10-29 23:32登录了后台', '1', '1414596779');
INSERT INTO `onethink_action_log` VALUES ('524', '1', '1', '977127821', 'member', '1', '123在2014-10-30 18:18登录了后台', '1', '1414664300');
INSERT INTO `onethink_action_log` VALUES ('525', '1', '1', '977127821', 'member', '1', '123在2014-10-30 18:21登录了后台', '1', '1414664510');
INSERT INTO `onethink_action_log` VALUES ('526', '6', '1', '977127821', 'config', '47', '操作url：/admin.php?s=/Config/edit.html', '1', '1414664772');
INSERT INTO `onethink_action_log` VALUES ('527', '6', '1', '977127821', 'config', '46', '操作url：/admin.php?s=/Config/edit.html', '1', '1414664781');
INSERT INTO `onethink_action_log` VALUES ('528', '8', '1', '977127821', 'attribute', '48', '操作url：/admin.php?s=/Attribute/update.html', '1', '1414669469');
INSERT INTO `onethink_action_log` VALUES ('529', '8', '1', '977127821', 'attribute', '48', '操作url：/admin.php?s=/Attribute/remove/id/48.html', '1', '1414669495');
INSERT INTO `onethink_action_log` VALUES ('530', '8', '1', '977127821', 'attribute', '46', '操作url：/admin.php?s=/Attribute/update.html', '1', '1414669506');
INSERT INTO `onethink_action_log` VALUES ('531', '8', '1', '977127821', 'attribute', '46', '操作url：/admin.php?s=/Attribute/update.html', '1', '1414669588');
INSERT INTO `onethink_action_log` VALUES ('532', '1', '1', '2102927650', 'member', '1', '123在2014-10-30 21:00登录了后台', '1', '1414674046');
INSERT INTO `onethink_action_log` VALUES ('533', '11', '1', '2102927650', 'category', '72', '操作url：/admin.php?s=/Category/add.html', '1', '1414674812');
INSERT INTO `onethink_action_log` VALUES ('534', '11', '1', '2102927650', 'category', '73', '操作url：/admin.php?s=/Category/add.html', '1', '1414674847');
INSERT INTO `onethink_action_log` VALUES ('535', '11', '1', '2102927650', 'category', '74', '操作url：/admin.php?s=/Category/add.html', '1', '1414674877');
INSERT INTO `onethink_action_log` VALUES ('536', '11', '1', '2102927650', 'category', '74', '操作url：/admin.php?s=/Category/edit.html', '1', '1414674888');
INSERT INTO `onethink_action_log` VALUES ('537', '11', '1', '2102927650', 'category', '75', '操作url：/admin.php?s=/Category/add.html', '1', '1414674964');
INSERT INTO `onethink_action_log` VALUES ('538', '11', '1', '2102927650', 'category', '76', '操作url：/admin.php?s=/Category/add.html', '1', '1414675003');
INSERT INTO `onethink_action_log` VALUES ('539', '11', '1', '2102927650', 'category', '71', '操作url：/admin.php?s=/Category/edit.html', '1', '1414675134');
INSERT INTO `onethink_action_log` VALUES ('540', '1', '1', '977127815', 'member', '1', '123在2014-10-30 22:35登录了后台', '1', '1414679721');
INSERT INTO `onethink_action_log` VALUES ('541', '1', '1', '2130706433', 'member', '1', '123在2014-10-31 18:31登录了后台', '1', '1414751475');
INSERT INTO `onethink_action_log` VALUES ('542', '6', '1', '2130706433', 'config', '55', '操作url：/admin.php?s=/Config/edit.html', '1', '1414761398');
INSERT INTO `onethink_action_log` VALUES ('543', '6', '1', '2130706433', 'config', '51', '操作url：/admin.php?s=/Config/edit.html', '1', '1414769218');
INSERT INTO `onethink_action_log` VALUES ('544', '6', '1', '2130706433', 'config', '56', '操作url：/admin.php?s=/Config/edit.html', '1', '1414769450');
INSERT INTO `onethink_action_log` VALUES ('545', '6', '1', '2130706433', 'config', '51', '操作url：/admin.php?s=/Config/edit.html', '1', '1414771584');
INSERT INTO `onethink_action_log` VALUES ('546', '1', '1', '2102927650', 'member', '1', '123在2014-11-01 00:18登录了后台', '1', '1414772296');
INSERT INTO `onethink_action_log` VALUES ('547', '1', '1', '977128683', 'member', '1', '123在2014-11-01 03:44登录了后台', '1', '1414784684');
INSERT INTO `onethink_action_log` VALUES ('548', '1', '1', '977128683', 'member', '1', '123在2014-11-01 03:44登录了后台', '1', '1414784690');
INSERT INTO `onethink_action_log` VALUES ('549', '1', '1', '977128683', 'member', '1', '123在2014-11-01 03:44登录了后台', '1', '1414784697');
INSERT INTO `onethink_action_log` VALUES ('550', '1', '1', '977128683', 'member', '1', '123在2014-11-01 03:45登录了后台', '1', '1414784720');
INSERT INTO `onethink_action_log` VALUES ('551', '1', '1', '977128683', 'member', '1', '123在2014-11-01 03:48登录了后台', '1', '1414784923');
INSERT INTO `onethink_action_log` VALUES ('552', '1', '1', '0', 'member', '1', '123在2014-11-01 16:21登录了后台', '1', '1414830080');
INSERT INTO `onethink_action_log` VALUES ('553', '1', '1', '0', 'member', '1', '123在2014-11-01 16:23登录了后台', '1', '1414830187');
INSERT INTO `onethink_action_log` VALUES ('554', '1', '1', '0', 'member', '1', '123在2014-11-01 19:54登录了后台', '1', '1414842898');
INSERT INTO `onethink_action_log` VALUES ('555', '1', '1', '0', 'member', '1', '123在2014-11-02 02:40登录了后台', '1', '1414867234');
INSERT INTO `onethink_action_log` VALUES ('556', '1', '1', '0', 'member', '1', '123在2014-11-02 02:46登录了后台', '1', '1414867570');
INSERT INTO `onethink_action_log` VALUES ('557', '1', '1', '0', 'member', '1', '123在2014-11-02 02:52登录了后台', '1', '1414867959');
INSERT INTO `onethink_action_log` VALUES ('558', '1', '1', '0', 'member', '1', '123在2014-11-02 02:54登录了后台', '1', '1414868083');
INSERT INTO `onethink_action_log` VALUES ('559', '1', '1', '0', 'member', '1', '123在2014-11-02 14:57登录了后台', '1', '1414911424');
INSERT INTO `onethink_action_log` VALUES ('560', '1', '1', '0', 'member', '1', '123在2014-11-02 14:57登录了后台', '1', '1414911469');
INSERT INTO `onethink_action_log` VALUES ('561', '10', '1', '0', 'Menu', '153', '操作url：/admin.php?s=/Menu/add.html', '1', '1414911624');
INSERT INTO `onethink_action_log` VALUES ('562', '10', '1', '0', 'Menu', '154', '操作url：/admin.php?s=/Menu/add.html', '1', '1414911671');
INSERT INTO `onethink_action_log` VALUES ('563', '10', '1', '0', 'Menu', '155', '操作url：/admin.php?s=/Menu/add.html', '1', '1414911726');
INSERT INTO `onethink_action_log` VALUES ('564', '1', '1', '0', 'member', '1', '123在2014-11-02 15:02登录了后台', '1', '1414911738');
INSERT INTO `onethink_action_log` VALUES ('565', '1', '1', '0', 'member', '1', '123在2014-11-02 15:11登录了后台', '1', '1414912314');
INSERT INTO `onethink_action_log` VALUES ('566', '10', '1', '0', 'Menu', '154', '操作url：/admin.php?s=/Menu/edit.html', '1', '1414926598');
INSERT INTO `onethink_action_log` VALUES ('567', '10', '1', '0', 'Menu', '155', '操作url：/admin.php?s=/Menu/edit.html', '1', '1414926639');
INSERT INTO `onethink_action_log` VALUES ('568', '1', '1', '0', 'member', '1', '123在2014-11-02 19:10登录了后台', '1', '1414926648');
INSERT INTO `onethink_action_log` VALUES ('569', '1', '1', '0', 'member', '1', '123在2014-11-02 19:29登录了后台', '1', '1414927740');
INSERT INTO `onethink_action_log` VALUES ('570', '10', '1', '0', 'Menu', '134', '操作url：/admin.php?s=/Menu/edit.html', '1', '1414928717');
INSERT INTO `onethink_action_log` VALUES ('571', '1', '1', '0', 'member', '1', '123在2014-11-02 19:45登录了后台', '1', '1414928730');
INSERT INTO `onethink_action_log` VALUES ('572', '1', '1', '0', 'member', '1', '123在2014-11-02 20:00登录了后台', '1', '1414929651');
INSERT INTO `onethink_action_log` VALUES ('573', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:20登录了后台', '1', '1414930853');
INSERT INTO `onethink_action_log` VALUES ('574', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:20登录了后台', '1', '1414930855');
INSERT INTO `onethink_action_log` VALUES ('575', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:20登录了后台', '1', '1414930856');
INSERT INTO `onethink_action_log` VALUES ('576', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:27登录了后台', '1', '1414931220');
INSERT INTO `onethink_action_log` VALUES ('577', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:27登录了后台', '1', '1414931223');
INSERT INTO `onethink_action_log` VALUES ('578', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:27登录了后台', '1', '1414931224');
INSERT INTO `onethink_action_log` VALUES ('579', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:27登录了后台', '1', '1414931257');
INSERT INTO `onethink_action_log` VALUES ('580', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:27登录了后台', '1', '1414931274');
INSERT INTO `onethink_action_log` VALUES ('581', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:29登录了后台', '1', '1414931351');
INSERT INTO `onethink_action_log` VALUES ('582', '1', '1', '2032207653', 'member', '1', '123在2014-11-02 20:29登录了后台', '1', '1414931357');
INSERT INTO `onethink_action_log` VALUES ('583', '1', '1', '2102927650', 'member', '1', '123在2014-11-03 04:39登录了后台', '1', '1414960781');
INSERT INTO `onethink_action_log` VALUES ('584', '1', '1', '2102927650', 'member', '1', '123在2014-11-03 04:39登录了后台', '1', '1414960783');
INSERT INTO `onethink_action_log` VALUES ('585', '6', '1', '977127905', 'config', '40', '操作url：/admin.php?s=/Config/edit.html', '1', '1414964609');
INSERT INTO `onethink_action_log` VALUES ('586', '1', '1', '977127905', 'member', '1', '123在2014-11-03 17:36登录了后台', '1', '1415007394');
INSERT INTO `onethink_action_log` VALUES ('587', '1', '1', '977127905', 'member', '1', '123在2014-11-03 17:36登录了后台', '1', '1415007397');
INSERT INTO `onethink_action_log` VALUES ('588', '1', '1', '977127905', 'member', '1', '123在2014-11-03 17:36登录了后台', '1', '1415007399');
INSERT INTO `onethink_action_log` VALUES ('589', '1', '1', '2102927650', 'member', '1', '123在2014-11-04 02:57登录了后台', '1', '1415041066');
INSERT INTO `onethink_action_log` VALUES ('590', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 04:51登录了后台', '1', '1415134319');
INSERT INTO `onethink_action_log` VALUES ('591', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 04:53登录了后台', '1', '1415134382');
INSERT INTO `onethink_action_log` VALUES ('592', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 04:53登录了后台', '1', '1415134385');
INSERT INTO `onethink_action_log` VALUES ('593', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 04:59登录了后台', '1', '1415134766');
INSERT INTO `onethink_action_log` VALUES ('594', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 05:06登录了后台', '1', '1415135212');
INSERT INTO `onethink_action_log` VALUES ('595', '6', '1', '977127759', 'config', '58', '操作url：/admin.php?s=/Config/edit.html', '1', '1415136997');
INSERT INTO `onethink_action_log` VALUES ('596', '6', '1', '977127759', 'config', '56', '操作url：/admin.php?s=/Config/edit.html', '1', '1415137255');
INSERT INTO `onethink_action_log` VALUES ('597', '6', '1', '977127759', 'config', '56', '操作url：/admin.php?s=/Config/edit.html', '1', '1415137270');
INSERT INTO `onethink_action_log` VALUES ('598', '6', '1', '977127759', 'config', '58', '操作url：/admin.php?s=/Config/edit.html', '1', '1415137282');
INSERT INTO `onethink_action_log` VALUES ('599', '6', '1', '977127759', 'config', '60', '操作url：/admin.php?s=/Config/edit.html', '1', '1415137483');
INSERT INTO `onethink_action_log` VALUES ('600', '6', '1', '977127759', 'config', '62', '操作url：/admin.php?s=/Config/edit.html', '1', '1415137548');
INSERT INTO `onethink_action_log` VALUES ('601', '6', '1', '977127759', 'config', '63', '操作url：/admin.php?s=/Config/edit.html', '1', '1415137627');
INSERT INTO `onethink_action_log` VALUES ('602', '1', '1', '977127759', 'member', '1', '123在2014-11-05 05:59登录了后台', '1', '1415138361');
INSERT INTO `onethink_action_log` VALUES ('603', '1', '1', '977127759', 'member', '1', '123在2014-11-05 05:59登录了后台', '1', '1415138383');
INSERT INTO `onethink_action_log` VALUES ('604', '1', '1', '977127759', 'member', '1', '123在2014-11-05 05:59登录了后台', '1', '1415138394');
INSERT INTO `onethink_action_log` VALUES ('605', '1', '1', '977127759', 'member', '1', '123在2014-11-05 06:01登录了后台', '1', '1415138476');
INSERT INTO `onethink_action_log` VALUES ('606', '1', '1', '977128797', 'member', '1', '123在2014-11-05 06:02登录了后台', '1', '1415138555');
INSERT INTO `onethink_action_log` VALUES ('607', '1', '1', '977127759', 'member', '1', '123在2014-11-05 06:08登录了后台', '1', '1415138880');
INSERT INTO `onethink_action_log` VALUES ('608', '1', '1', '977128797', 'member', '1', '123在2014-11-05 06:08登录了后台', '1', '1415138903');
INSERT INTO `onethink_action_log` VALUES ('609', '1', '1', '977127759', 'member', '1', '123在2014-11-05 06:10登录了后台', '1', '1415139011');
INSERT INTO `onethink_action_log` VALUES ('610', '1', '1', '977127759', 'member', '1', '123在2014-11-05 06:10登录了后台', '1', '1415139053');
INSERT INTO `onethink_action_log` VALUES ('611', '1', '1', '977127759', 'member', '1', '123在2014-11-05 06:11登录了后台', '1', '1415139064');
INSERT INTO `onethink_action_log` VALUES ('612', '1', '1', '977127759', 'member', '1', '123在2014-11-05 06:13登录了后台', '1', '1415139207');
INSERT INTO `onethink_action_log` VALUES ('613', '1', '2', '2102927650', 'member', '2', '111在2014-11-05 07:44登录了后台', '1', '1415144674');
INSERT INTO `onethink_action_log` VALUES ('614', '1', '3', '977127693', 'member', '3', '456在2014-11-05 07:50登录了后台', '1', '1415145053');
INSERT INTO `onethink_action_log` VALUES ('615', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:55登录了后台', '1', '1415145316');
INSERT INTO `onethink_action_log` VALUES ('616', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:55登录了后台', '1', '1415145320');
INSERT INTO `onethink_action_log` VALUES ('617', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:56登录了后台', '1', '1415145378');
INSERT INTO `onethink_action_log` VALUES ('618', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:56登录了后台', '1', '1415145379');
INSERT INTO `onethink_action_log` VALUES ('619', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:56登录了后台', '1', '1415145380');
INSERT INTO `onethink_action_log` VALUES ('620', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:56登录了后台', '1', '1415145404');
INSERT INTO `onethink_action_log` VALUES ('621', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 07:56登录了后台', '1', '1415145405');
INSERT INTO `onethink_action_log` VALUES ('622', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:01登录了后台', '1', '1415145696');
INSERT INTO `onethink_action_log` VALUES ('623', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:01登录了后台', '1', '1415145701');
INSERT INTO `onethink_action_log` VALUES ('624', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:01登录了后台', '1', '1415145716');
INSERT INTO `onethink_action_log` VALUES ('625', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:03登录了后台', '1', '1415145804');
INSERT INTO `onethink_action_log` VALUES ('626', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:03登录了后台', '1', '1415145805');
INSERT INTO `onethink_action_log` VALUES ('627', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:03登录了后台', '1', '1415145806');
INSERT INTO `onethink_action_log` VALUES ('628', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 08:04登录了后台', '1', '1415145855');
INSERT INTO `onethink_action_log` VALUES ('629', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178015');
INSERT INTO `onethink_action_log` VALUES ('630', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178017');
INSERT INTO `onethink_action_log` VALUES ('631', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178019');
INSERT INTO `onethink_action_log` VALUES ('632', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178020');
INSERT INTO `onethink_action_log` VALUES ('633', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178021');
INSERT INTO `onethink_action_log` VALUES ('634', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178022');
INSERT INTO `onethink_action_log` VALUES ('635', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178023');
INSERT INTO `onethink_action_log` VALUES ('636', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178024');
INSERT INTO `onethink_action_log` VALUES ('637', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 17:00登录了后台', '1', '1415178025');
INSERT INTO `onethink_action_log` VALUES ('638', '1', '4', '2102927650', 'member', '4', '12311231在2014-11-05 17:11登录了后台', '1', '1415178697');
INSERT INTO `onethink_action_log` VALUES ('639', '1', '1', '1900181564', 'member', '1', '123在2014-11-05 19:43登录了后台', '1', '1415187786');
INSERT INTO `onethink_action_log` VALUES ('640', '1', '1', '1900181564', 'member', '1', '123在2014-11-05 19:43登录了后台', '1', '1415187788');
INSERT INTO `onethink_action_log` VALUES ('641', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 22:59登录了后台', '1', '1415199578');
INSERT INTO `onethink_action_log` VALUES ('642', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 22:59登录了后台', '1', '1415199590');
INSERT INTO `onethink_action_log` VALUES ('643', '1', '1', '2102927650', 'member', '1', '123在2014-11-05 23:00登录了后台', '1', '1415199640');
INSERT INTO `onethink_action_log` VALUES ('644', '1', '1', '977127759', 'member', '1', '123在2014-11-06 03:52登录了后台', '1', '1415217143');
INSERT INTO `onethink_action_log` VALUES ('645', '1', '1', '977127759', 'member', '1', '123在2014-11-06 03:52登录了后台', '1', '1415217145');
INSERT INTO `onethink_action_log` VALUES ('646', '1', '1', '977127759', 'member', '1', '123在2014-11-06 03:52登录了后台', '1', '1415217145');
INSERT INTO `onethink_action_log` VALUES ('647', '1', '1', '977127759', 'member', '1', '123在2014-11-06 04:01登录了后台', '1', '1415217676');
INSERT INTO `onethink_action_log` VALUES ('648', '1', '1', '977127759', 'member', '1', '123在2014-11-06 04:01登录了后台', '1', '1415217681');
INSERT INTO `onethink_action_log` VALUES ('649', '1', '1', '977127759', 'member', '1', '123在2014-11-06 04:01登录了后台', '1', '1415217682');
INSERT INTO `onethink_action_log` VALUES ('650', '1', '1', '977127759', 'member', '1', '123在2014-11-06 04:01登录了后台', '1', '1415217682');
INSERT INTO `onethink_action_log` VALUES ('651', '1', '1', '977127759', 'member', '1', '123在2014-11-06 04:01登录了后台', '1', '1415217683');
INSERT INTO `onethink_action_log` VALUES ('652', '1', '1', '1900181897', 'member', '1', '123在2014-11-08 19:32登录了后台', '1', '1415446367');
INSERT INTO `onethink_action_log` VALUES ('653', '1', '1', '2102927650', 'member', '1', '123在2014-11-08 21:46登录了后台', '1', '1415454390');
INSERT INTO `onethink_action_log` VALUES ('654', '1', '1', '2102927650', 'member', '1', '123在2014-11-08 23:46登录了后台', '1', '1415461596');
INSERT INTO `onethink_action_log` VALUES ('655', '1', '1', '2102927650', 'member', '1', '123在2014-11-08 23:49登录了后台', '1', '1415461762');
INSERT INTO `onethink_action_log` VALUES ('656', '11', '1', '1900181897', 'category', '77', '操作url：/admin.php?s=/Category/add.html', '1', '1415464640');
INSERT INTO `onethink_action_log` VALUES ('657', '1', '1', '1900181897', 'member', '1', '123在2014-11-09 00:58登录了后台', '1', '1415465904');
INSERT INTO `onethink_action_log` VALUES ('658', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 02:32登录了后台', '1', '1415471559');
INSERT INTO `onethink_action_log` VALUES ('659', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 02:32登录了后台', '1', '1415471560');
INSERT INTO `onethink_action_log` VALUES ('660', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 02:32登录了后台', '1', '1415471561');
INSERT INTO `onethink_action_log` VALUES ('661', '6', '1', '1903661226', 'config', '64', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472076');
INSERT INTO `onethink_action_log` VALUES ('662', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/60.html', '1', '1415472122');
INSERT INTO `onethink_action_log` VALUES ('663', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/61.html', '1', '1415472128');
INSERT INTO `onethink_action_log` VALUES ('664', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/58.html', '1', '1415472132');
INSERT INTO `onethink_action_log` VALUES ('665', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/59.html', '1', '1415472138');
INSERT INTO `onethink_action_log` VALUES ('666', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/62.html', '1', '1415472143');
INSERT INTO `onethink_action_log` VALUES ('667', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/63.html', '1', '1415472148');
INSERT INTO `onethink_action_log` VALUES ('668', '6', '1', '1903661226', 'config', '65', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472253');
INSERT INTO `onethink_action_log` VALUES ('669', '6', '1', '1903661226', 'config', '65', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472314');
INSERT INTO `onethink_action_log` VALUES ('670', '6', '1', '1903661226', 'config', '64', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472347');
INSERT INTO `onethink_action_log` VALUES ('671', '6', '1', '1903661226', 'config', '65', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472405');
INSERT INTO `onethink_action_log` VALUES ('672', '6', '1', '1903661226', 'config', '0', '操作url：/admin.php?s=/Config/del/id/65.html', '1', '1415472432');
INSERT INTO `onethink_action_log` VALUES ('673', '6', '1', '1903661226', 'config', '67', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472498');
INSERT INTO `onethink_action_log` VALUES ('674', '6', '1', '1903661226', 'config', '67', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472541');
INSERT INTO `onethink_action_log` VALUES ('675', '6', '1', '1903661226', 'config', '66', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472564');
INSERT INTO `onethink_action_log` VALUES ('676', '6', '1', '1903661226', 'config', '66', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472584');
INSERT INTO `onethink_action_log` VALUES ('677', '6', '1', '1903661226', 'config', '67', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472604');
INSERT INTO `onethink_action_log` VALUES ('678', '6', '1', '1903661226', 'config', '68', '操作url：/admin.php?s=/Config/edit.html', '1', '1415472680');
INSERT INTO `onethink_action_log` VALUES ('679', '6', '1', '1903661226', 'config', '70', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473140');
INSERT INTO `onethink_action_log` VALUES ('680', '6', '1', '1903661226', 'config', '69', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473153');
INSERT INTO `onethink_action_log` VALUES ('681', '6', '1', '1903661226', 'config', '69', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473174');
INSERT INTO `onethink_action_log` VALUES ('682', '6', '1', '1903661226', 'config', '73', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473424');
INSERT INTO `onethink_action_log` VALUES ('683', '6', '1', '1903661226', 'config', '67', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473488');
INSERT INTO `onethink_action_log` VALUES ('684', '6', '1', '1903661226', 'config', '66', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473499');
INSERT INTO `onethink_action_log` VALUES ('685', '6', '1', '1903661226', 'config', '68', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473508');
INSERT INTO `onethink_action_log` VALUES ('686', '6', '1', '1903661226', 'config', '69', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473522');
INSERT INTO `onethink_action_log` VALUES ('687', '6', '1', '1903661226', 'config', '70', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473533');
INSERT INTO `onethink_action_log` VALUES ('688', '6', '1', '1903661226', 'config', '71', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473540');
INSERT INTO `onethink_action_log` VALUES ('689', '6', '1', '1903661226', 'config', '72', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473553');
INSERT INTO `onethink_action_log` VALUES ('690', '6', '1', '1903661226', 'config', '51', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473565');
INSERT INTO `onethink_action_log` VALUES ('691', '6', '1', '1903661226', 'config', '68', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473893');
INSERT INTO `onethink_action_log` VALUES ('692', '6', '1', '1903661226', 'config', '68', '操作url：/admin.php?s=/Config/edit.html', '1', '1415473914');
INSERT INTO `onethink_action_log` VALUES ('693', '10', '1', '1903661226', 'Menu', '156', '操作url：/admin.php?s=/Menu/add.html', '1', '1415474375');
INSERT INTO `onethink_action_log` VALUES ('694', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 04:40登录了后台', '1', '1415479224');
INSERT INTO `onethink_action_log` VALUES ('695', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 04:40登录了后台', '1', '1415479244');
INSERT INTO `onethink_action_log` VALUES ('696', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 06:29登录了后台', '1', '1415485760');
INSERT INTO `onethink_action_log` VALUES ('697', '1', '5', '1903661226', 'member', '5', '8898在2014-11-09 06:40登录了后台', '1', '1415486409');
INSERT INTO `onethink_action_log` VALUES ('698', '1', '6', '1903661226', 'member', '6', '88988在2014-11-09 06:41登录了后台', '1', '1415486499');
INSERT INTO `onethink_action_log` VALUES ('699', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 06:47登录了后台', '1', '1415486850');
INSERT INTO `onethink_action_log` VALUES ('700', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 06:48登录了后台', '1', '1415486931');
INSERT INTO `onethink_action_log` VALUES ('701', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 06:49登录了后台', '1', '1415486943');
INSERT INTO `onethink_action_log` VALUES ('702', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 06:56登录了后台', '1', '1415487375');
INSERT INTO `onethink_action_log` VALUES ('703', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:08登录了后台', '1', '1415488100');
INSERT INTO `onethink_action_log` VALUES ('704', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:09登录了后台', '1', '1415488187');
INSERT INTO `onethink_action_log` VALUES ('705', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:10登录了后台', '1', '1415488205');
INSERT INTO `onethink_action_log` VALUES ('706', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:11登录了后台', '1', '1415488298');
INSERT INTO `onethink_action_log` VALUES ('707', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:12登录了后台', '1', '1415488322');
INSERT INTO `onethink_action_log` VALUES ('708', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:14登录了后台', '1', '1415488451');
INSERT INTO `onethink_action_log` VALUES ('709', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:17登录了后台', '1', '1415488657');
INSERT INTO `onethink_action_log` VALUES ('710', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:30登录了后台', '1', '1415489456');
INSERT INTO `onethink_action_log` VALUES ('711', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:30登录了后台', '1', '1415489459');
INSERT INTO `onethink_action_log` VALUES ('712', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:36登录了后台', '1', '1415489783');
INSERT INTO `onethink_action_log` VALUES ('713', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:36登录了后台', '1', '1415489786');
INSERT INTO `onethink_action_log` VALUES ('714', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:36登录了后台', '1', '1415489786');
INSERT INTO `onethink_action_log` VALUES ('715', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:36登录了后台', '1', '1415489792');
INSERT INTO `onethink_action_log` VALUES ('716', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:41登录了后台', '1', '1415490068');
INSERT INTO `onethink_action_log` VALUES ('717', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:41登录了后台', '1', '1415490088');
INSERT INTO `onethink_action_log` VALUES ('718', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:41登录了后台', '1', '1415490105');
INSERT INTO `onethink_action_log` VALUES ('719', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:41登录了后台', '1', '1415490118');
INSERT INTO `onethink_action_log` VALUES ('720', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:42登录了后台', '1', '1415490129');
INSERT INTO `onethink_action_log` VALUES ('721', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:42登录了后台', '1', '1415490137');
INSERT INTO `onethink_action_log` VALUES ('722', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:50登录了后台', '1', '1415490626');
INSERT INTO `onethink_action_log` VALUES ('723', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:54登录了后台', '1', '1415490857');
INSERT INTO `onethink_action_log` VALUES ('724', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:54登录了后台', '1', '1415490859');
INSERT INTO `onethink_action_log` VALUES ('725', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:54登录了后台', '1', '1415490865');
INSERT INTO `onethink_action_log` VALUES ('726', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:54登录了后台', '1', '1415490880');
INSERT INTO `onethink_action_log` VALUES ('727', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 07:58登录了后台', '1', '1415491123');
INSERT INTO `onethink_action_log` VALUES ('728', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 17:58登录了后台', '1', '1415527094');
INSERT INTO `onethink_action_log` VALUES ('729', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 17:58登录了后台', '1', '1415527098');
INSERT INTO `onethink_action_log` VALUES ('730', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 18:01登录了后台', '1', '1415527261');
INSERT INTO `onethink_action_log` VALUES ('731', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 18:09登录了后台', '1', '1415527741');
INSERT INTO `onethink_action_log` VALUES ('732', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 18:09登录了后台', '1', '1415527767');
INSERT INTO `onethink_action_log` VALUES ('733', '1', '1', '2032207268', 'member', '1', '123在2014-11-09 20:11登录了后台', '1', '1415535080');
INSERT INTO `onethink_action_log` VALUES ('734', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 21:00登录了后台', '1', '1415538050');
INSERT INTO `onethink_action_log` VALUES ('735', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 21:23登录了后台', '1', '1415539426');
INSERT INTO `onethink_action_log` VALUES ('736', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 22:29登录了后台', '1', '1415543372');
INSERT INTO `onethink_action_log` VALUES ('737', '1', '1', '1903661226', 'member', '1', '123在2014-11-09 22:29登录了后台', '1', '1415543374');
INSERT INTO `onethink_action_log` VALUES ('738', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:08登录了后台', '1', '1415563683');
INSERT INTO `onethink_action_log` VALUES ('739', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:08登录了后台', '1', '1415563685');
INSERT INTO `onethink_action_log` VALUES ('740', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:08登录了后台', '1', '1415563685');
INSERT INTO `onethink_action_log` VALUES ('741', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:08登录了后台', '1', '1415563686');
INSERT INTO `onethink_action_log` VALUES ('742', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:08登录了后台', '1', '1415563689');
INSERT INTO `onethink_action_log` VALUES ('743', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:08登录了后台', '1', '1415563690');
INSERT INTO `onethink_action_log` VALUES ('744', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:18登录了后台', '1', '1415564299');
INSERT INTO `onethink_action_log` VALUES ('745', '1', '1', '2032207268', 'member', '1', '123在2014-11-10 04:18登录了后台', '1', '1415564300');
INSERT INTO `onethink_action_log` VALUES ('746', '11', '1', '2032207268', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1415564696');
INSERT INTO `onethink_action_log` VALUES ('747', '1', '1', '2032207375', 'member', '1', '123在2014-11-10 04:54登录了后台', '1', '1415566464');
INSERT INTO `onethink_action_log` VALUES ('748', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567248');
INSERT INTO `onethink_action_log` VALUES ('749', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567252');
INSERT INTO `onethink_action_log` VALUES ('750', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567257');
INSERT INTO `onethink_action_log` VALUES ('751', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567258');
INSERT INTO `onethink_action_log` VALUES ('752', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567258');
INSERT INTO `onethink_action_log` VALUES ('753', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567263');
INSERT INTO `onethink_action_log` VALUES ('754', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567263');
INSERT INTO `onethink_action_log` VALUES ('755', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567264');
INSERT INTO `onethink_action_log` VALUES ('756', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567265');
INSERT INTO `onethink_action_log` VALUES ('757', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 05:07登录了后台', '1', '1415567266');
INSERT INTO `onethink_action_log` VALUES ('758', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 06:16登录了后台', '1', '1415571361');
INSERT INTO `onethink_action_log` VALUES ('759', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 06:16登录了后台', '1', '1415571376');
INSERT INTO `onethink_action_log` VALUES ('760', '1', '1', '1903661226', 'member', '1', '123在2014-11-10 06:16登录了后台', '1', '1415571391');
INSERT INTO `onethink_action_log` VALUES ('761', '1', '1', '1903661408', 'member', '1', '123在2014-11-11 02:33登录了后台', '1', '1415644383');
INSERT INTO `onethink_action_log` VALUES ('762', '1', '1', '1903661408', 'member', '1', '123在2014-11-11 02:33登录了后台', '1', '1415644387');
INSERT INTO `onethink_action_log` VALUES ('763', '1', '1', '1903661408', 'member', '1', '123在2014-11-11 02:33登录了后台', '1', '1415644388');
INSERT INTO `onethink_action_log` VALUES ('764', '1', '1', '1903661408', 'member', '1', '123在2014-11-11 02:33登录了后台', '1', '1415644389');
INSERT INTO `onethink_action_log` VALUES ('765', '1', '1', '1903661408', 'member', '1', '123在2014-11-11 02:33登录了后台', '1', '1415644396');
INSERT INTO `onethink_action_log` VALUES ('766', '1', '1', '1903661408', 'member', '1', '123在2014-11-11 02:40登录了后台', '1', '1415644808');
INSERT INTO `onethink_action_log` VALUES ('767', '1', '1', '2032207428', 'member', '1', '123在2014-11-11 04:19登录了后台', '1', '1415650776');
INSERT INTO `onethink_action_log` VALUES ('768', '1', '1', '977127758', 'member', '1', '123在2014-11-11 21:05登录了后台', '1', '1415711151');
INSERT INTO `onethink_action_log` VALUES ('769', '1', '1', '977127758', 'member', '1', '123在2014-11-11 21:05登录了后台', '1', '1415711153');
INSERT INTO `onethink_action_log` VALUES ('770', '1', '1', '977127758', 'member', '1', '123在2014-11-11 21:34登录了后台', '1', '1415712846');
INSERT INTO `onethink_action_log` VALUES ('771', '1', '1', '977127758', 'member', '1', '123在2014-11-11 21:34登录了后台', '1', '1415712851');
INSERT INTO `onethink_action_log` VALUES ('772', '7', '1', '977127758', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1415713123');
INSERT INTO `onethink_action_log` VALUES ('773', '1', '1', '977127758', 'member', '1', '123在2014-11-11 21:42登录了后台', '1', '1415713328');
INSERT INTO `onethink_action_log` VALUES ('774', '8', '1', '977127758', 'attribute', '49', '操作url：/admin.php?s=/Attribute/update.html', '1', '1415714559');
INSERT INTO `onethink_action_log` VALUES ('775', '11', '1', '977127758', 'category', '1', '操作url：/admin.php?s=/Fcoupon/edit.html', '1', '1415716837');
INSERT INTO `onethink_action_log` VALUES ('776', '1', '1', '1903661408', 'member', '1', '123在2014-11-12 04:28登录了后台', '1', '1415737681');
INSERT INTO `onethink_action_log` VALUES ('777', '1', '1', '1903661408', 'member', '1', '123在2014-11-12 04:28登录了后台', '1', '1415737683');
INSERT INTO `onethink_action_log` VALUES ('778', '1', '1', '1903661408', 'member', '1', '123在2014-11-12 06:12登录了后台', '1', '1415743962');
INSERT INTO `onethink_action_log` VALUES ('779', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:19登录了后台', '1', '1415755169');
INSERT INTO `onethink_action_log` VALUES ('780', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:19登录了后台', '1', '1415755183');
INSERT INTO `onethink_action_log` VALUES ('781', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:19登录了后台', '1', '1415755194');
INSERT INTO `onethink_action_log` VALUES ('782', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:19登录了后台', '1', '1415755195');
INSERT INTO `onethink_action_log` VALUES ('783', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755235');
INSERT INTO `onethink_action_log` VALUES ('784', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755236');
INSERT INTO `onethink_action_log` VALUES ('785', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755236');
INSERT INTO `onethink_action_log` VALUES ('786', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755237');
INSERT INTO `onethink_action_log` VALUES ('787', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755237');
INSERT INTO `onethink_action_log` VALUES ('788', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755238');
INSERT INTO `onethink_action_log` VALUES ('789', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 09:20登录了后台', '1', '1415755257');
INSERT INTO `onethink_action_log` VALUES ('790', '1', '1', '1886391666', 'member', '1', '123在2014-11-12 10:00登录了后台', '1', '1415757625');
INSERT INTO `onethink_action_log` VALUES ('791', '1', '1', '1886391666', 'member', '1', '123在2014-11-12 10:00登录了后台', '1', '1415757630');
INSERT INTO `onethink_action_log` VALUES ('792', '1', '1', '1886391666', 'member', '1', '123在2014-11-12 10:00登录了后台', '1', '1415757636');
INSERT INTO `onethink_action_log` VALUES ('793', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 10:02登录了后台', '1', '1415757773');
INSERT INTO `onethink_action_log` VALUES ('794', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 10:02登录了后台', '1', '1415757778');
INSERT INTO `onethink_action_log` VALUES ('795', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:31登录了后台', '1', '1415763073');
INSERT INTO `onethink_action_log` VALUES ('796', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:31登录了后台', '1', '1415763078');
INSERT INTO `onethink_action_log` VALUES ('797', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:31登录了后台', '1', '1415763079');
INSERT INTO `onethink_action_log` VALUES ('798', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:31登录了后台', '1', '1415763080');
INSERT INTO `onethink_action_log` VALUES ('799', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:31登录了后台', '1', '1415763080');
INSERT INTO `onethink_action_log` VALUES ('800', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:31登录了后台', '1', '1415763095');
INSERT INTO `onethink_action_log` VALUES ('801', '1', '1', '1961299203', 'member', '1', '123在2014-11-12 11:37登录了后台', '1', '1415763421');
INSERT INTO `onethink_action_log` VALUES ('802', '1', '1', '1961299203', 'member', '1', '123在2014-11-12 11:37登录了后台', '1', '1415763438');
INSERT INTO `onethink_action_log` VALUES ('803', '1', '1', '993528020', 'member', '1', '123在2014-11-12 11:37登录了后台', '1', '1415763476');
INSERT INTO `onethink_action_log` VALUES ('804', '1', '1', '993528020', 'member', '1', '123在2014-11-12 11:38登录了后台', '1', '1415763497');
INSERT INTO `onethink_action_log` VALUES ('805', '1', '1', '993528020', 'member', '1', '123在2014-11-12 11:38登录了后台', '1', '1415763519');
INSERT INTO `onethink_action_log` VALUES ('806', '1', '1', '993528020', 'member', '1', '123在2014-11-12 11:38登录了后台', '1', '1415763520');
INSERT INTO `onethink_action_log` VALUES ('807', '1', '1', '993528020', 'member', '1', '123在2014-11-12 11:38登录了后台', '1', '1415763520');
INSERT INTO `onethink_action_log` VALUES ('808', '1', '1', '993528020', 'member', '1', '123在2014-11-12 11:38登录了后台', '1', '1415763521');
INSERT INTO `onethink_action_log` VALUES ('809', '1', '1', '2005629578', 'member', '1', '123在2014-11-12 11:41登录了后台', '1', '1415763700');
INSERT INTO `onethink_action_log` VALUES ('810', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:46登录了后台', '1', '1415763976');
INSERT INTO `onethink_action_log` VALUES ('811', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:46登录了后台', '1', '1415763983');
INSERT INTO `onethink_action_log` VALUES ('812', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:46登录了后台', '1', '1415763984');
INSERT INTO `onethink_action_log` VALUES ('813', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:46登录了后台', '1', '1415763985');
INSERT INTO `onethink_action_log` VALUES ('814', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:46登录了后台', '1', '1415763985');
INSERT INTO `onethink_action_log` VALUES ('815', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:46登录了后台', '1', '1415763985');
INSERT INTO `onethink_action_log` VALUES ('816', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:47登录了后台', '1', '1415764040');
INSERT INTO `onethink_action_log` VALUES ('817', '1', '1', '2071435420', 'member', '1', '123在2014-11-12 11:47登录了后台', '1', '1415764040');
INSERT INTO `onethink_action_log` VALUES ('818', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769429');
INSERT INTO `onethink_action_log` VALUES ('819', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769434');
INSERT INTO `onethink_action_log` VALUES ('820', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769435');
INSERT INTO `onethink_action_log` VALUES ('821', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769436');
INSERT INTO `onethink_action_log` VALUES ('822', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769437');
INSERT INTO `onethink_action_log` VALUES ('823', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769438');
INSERT INTO `onethink_action_log` VALUES ('824', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769456');
INSERT INTO `onethink_action_log` VALUES ('825', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769457');
INSERT INTO `onethink_action_log` VALUES ('826', '1', '1', '993867441', 'member', '1', '123在2014-11-12 13:17登录了后台', '1', '1415769458');
INSERT INTO `onethink_action_log` VALUES ('827', '1', '1', '2088773075', 'member', '1', '123在2014-11-12 13:30登录了后台', '1', '1415770247');
INSERT INTO `onethink_action_log` VALUES ('828', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:37登录了后台', '1', '1415774238');
INSERT INTO `onethink_action_log` VALUES ('829', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:40登录了后台', '1', '1415774431');
INSERT INTO `onethink_action_log` VALUES ('830', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:55登录了后台', '1', '1415775353');
INSERT INTO `onethink_action_log` VALUES ('831', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:56登录了后台', '1', '1415775397');
INSERT INTO `onethink_action_log` VALUES ('832', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:57登录了后台', '1', '1415775432');
INSERT INTO `onethink_action_log` VALUES ('833', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:59登录了后台', '1', '1415775578');
INSERT INTO `onethink_action_log` VALUES ('834', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 14:59登录了后台', '1', '1415775587');
INSERT INTO `onethink_action_log` VALUES ('835', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:03登录了后台', '1', '1415775822');
INSERT INTO `onethink_action_log` VALUES ('836', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:06登录了后台', '1', '1415775965');
INSERT INTO `onethink_action_log` VALUES ('837', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:06登录了后台', '1', '1415775983');
INSERT INTO `onethink_action_log` VALUES ('838', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:10登录了后台', '1', '1415776235');
INSERT INTO `onethink_action_log` VALUES ('839', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:11登录了后台', '1', '1415776310');
INSERT INTO `onethink_action_log` VALUES ('840', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:11登录了后台', '1', '1415776319');
INSERT INTO `onethink_action_log` VALUES ('841', '1', '1', '2032207268', 'member', '1', '123在2014-11-12 15:13登录了后台', '1', '1415776398');
INSERT INTO `onethink_action_log` VALUES ('842', '1', '1', '2032207268', 'member', '1', '123在2014-11-12 15:13登录了后台', '1', '1415776426');
INSERT INTO `onethink_action_log` VALUES ('843', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:15登录了后台', '1', '1415776506');
INSERT INTO `onethink_action_log` VALUES ('844', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:20登录了后台', '1', '1415776813');
INSERT INTO `onethink_action_log` VALUES ('845', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:20登录了后台', '1', '1415776813');
INSERT INTO `onethink_action_log` VALUES ('846', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:26登录了后台', '1', '1415777203');
INSERT INTO `onethink_action_log` VALUES ('847', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:26登录了后台', '1', '1415777203');
INSERT INTO `onethink_action_log` VALUES ('848', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:32登录了后台', '1', '1415777534');
INSERT INTO `onethink_action_log` VALUES ('849', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:32登录了后台', '1', '1415777534');
INSERT INTO `onethink_action_log` VALUES ('850', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:32登录了后台', '1', '1415777544');
INSERT INTO `onethink_action_log` VALUES ('851', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:32登录了后台', '1', '1415777544');
INSERT INTO `onethink_action_log` VALUES ('852', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:34登录了后台', '1', '1415777680');
INSERT INTO `onethink_action_log` VALUES ('853', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:34登录了后台', '1', '1415777680');
INSERT INTO `onethink_action_log` VALUES ('854', '1', '1', '2090617009', 'member', '1', '123在2014-11-12 15:36登录了后台', '1', '1415777761');
INSERT INTO `onethink_action_log` VALUES ('855', '1', '1', '2090617009', 'member', '1', '123在2014-11-12 15:36登录了后台', '1', '1415777763');
INSERT INTO `onethink_action_log` VALUES ('856', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:36登录了后台', '1', '1415777765');
INSERT INTO `onethink_action_log` VALUES ('857', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:36登录了后台', '1', '1415777765');
INSERT INTO `onethink_action_log` VALUES ('858', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:37登录了后台', '1', '1415777849');
INSERT INTO `onethink_action_log` VALUES ('859', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:37登录了后台', '1', '1415777849');
INSERT INTO `onethink_action_log` VALUES ('860', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:37登录了后台', '1', '1415777869');
INSERT INTO `onethink_action_log` VALUES ('861', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:37登录了后台', '1', '1415777869');
INSERT INTO `onethink_action_log` VALUES ('862', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:39登录了后台', '1', '1415777963');
INSERT INTO `onethink_action_log` VALUES ('863', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:39登录了后台', '1', '1415777963');
INSERT INTO `onethink_action_log` VALUES ('864', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:41登录了后台', '1', '1415778077');
INSERT INTO `onethink_action_log` VALUES ('865', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:41登录了后台', '1', '1415778104');
INSERT INTO `onethink_action_log` VALUES ('866', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:42登录了后台', '1', '1415778125');
INSERT INTO `onethink_action_log` VALUES ('867', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:47登录了后台', '1', '1415778465');
INSERT INTO `onethink_action_log` VALUES ('868', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:48登录了后台', '1', '1415778534');
INSERT INTO `onethink_action_log` VALUES ('869', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:49登录了后台', '1', '1415778545');
INSERT INTO `onethink_action_log` VALUES ('870', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:52登录了后台', '1', '1415778777');
INSERT INTO `onethink_action_log` VALUES ('871', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:53登录了后台', '1', '1415778786');
INSERT INTO `onethink_action_log` VALUES ('872', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:55登录了后台', '1', '1415778918');
INSERT INTO `onethink_action_log` VALUES ('873', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 15:56登录了后台', '1', '1415778973');
INSERT INTO `onethink_action_log` VALUES ('874', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:02登录了后台', '1', '1415779378');
INSERT INTO `onethink_action_log` VALUES ('875', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:03登录了后台', '1', '1415779396');
INSERT INTO `onethink_action_log` VALUES ('876', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:04登录了后台', '1', '1415779468');
INSERT INTO `onethink_action_log` VALUES ('877', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:04登录了后台', '1', '1415779495');
INSERT INTO `onethink_action_log` VALUES ('878', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:07登录了后台', '1', '1415779672');
INSERT INTO `onethink_action_log` VALUES ('879', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:08登录了后台', '1', '1415779704');
INSERT INTO `onethink_action_log` VALUES ('880', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:08登录了后台', '1', '1415779708');
INSERT INTO `onethink_action_log` VALUES ('881', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:08登录了后台', '1', '1415779731');
INSERT INTO `onethink_action_log` VALUES ('882', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:15登录了后台', '1', '1415780157');
INSERT INTO `onethink_action_log` VALUES ('883', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:26登录了后台', '1', '1415780799');
INSERT INTO `onethink_action_log` VALUES ('884', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:27登录了后台', '1', '1415780854');
INSERT INTO `onethink_action_log` VALUES ('885', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:31登录了后台', '1', '1415781110');
INSERT INTO `onethink_action_log` VALUES ('886', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:35登录了后台', '1', '1415781340');
INSERT INTO `onethink_action_log` VALUES ('887', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:36登录了后台', '1', '1415781400');
INSERT INTO `onethink_action_log` VALUES ('888', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:36登录了后台', '1', '1415781410');
INSERT INTO `onethink_action_log` VALUES ('889', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 16:43登录了后台', '1', '1415781839');
INSERT INTO `onethink_action_log` VALUES ('890', '1', '1', '-558976302', 'member', '1', '123在2014-11-12 17:10登录了后台', '1', '1415783400');
INSERT INTO `onethink_action_log` VALUES ('891', '1', '1', '-558976302', 'member', '1', '123在2014-11-12 17:10登录了后台', '1', '1415783405');
INSERT INTO `onethink_action_log` VALUES ('892', '1', '1', '-558976302', 'member', '1', '123在2014-11-12 17:10登录了后台', '1', '1415783408');
INSERT INTO `onethink_action_log` VALUES ('893', '1', '1', '-558976302', 'member', '1', '123在2014-11-12 17:10登录了后台', '1', '1415783409');
INSERT INTO `onethink_action_log` VALUES ('894', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 17:13登录了后台', '1', '1415783605');
INSERT INTO `onethink_action_log` VALUES ('895', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 17:26登录了后台', '1', '1415784367');
INSERT INTO `onethink_action_log` VALUES ('896', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 17:26登录了后台', '1', '1415784396');
INSERT INTO `onethink_action_log` VALUES ('897', '1', '1', '1900181745', 'member', '1', '123在2014-11-12 17:26登录了后台', '1', '1415784405');
INSERT INTO `onethink_action_log` VALUES ('898', '1', '1', '1858335472', 'member', '1', '123在2014-11-12 17:34登录了后台', '1', '1415784898');
INSERT INTO `onethink_action_log` VALUES ('899', '1', '1', '1858335472', 'member', '1', '123在2014-11-12 17:35登录了后台', '1', '1415784907');
INSERT INTO `onethink_action_log` VALUES ('900', '1', '1', '1858335472', 'member', '1', '123在2014-11-12 17:38登录了后台', '1', '1415785098');
INSERT INTO `onethink_action_log` VALUES ('901', '1', '1', '1858335472', 'member', '1', '123在2014-11-12 17:38登录了后台', '1', '1415785102');
INSERT INTO `onethink_action_log` VALUES ('902', '1', '1', '1858335472', 'member', '1', '123在2014-11-12 17:38登录了后台', '1', '1415785105');
INSERT INTO `onethink_action_log` VALUES ('903', '1', '1', '1007306119', 'member', '1', '123在2014-11-12 18:05登录了后台', '1', '1415786703');
INSERT INTO `onethink_action_log` VALUES ('904', '1', '1', '1007306119', 'member', '1', '123在2014-11-12 18:07登录了后台', '1', '1415786876');
INSERT INTO `onethink_action_log` VALUES ('905', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801372');
INSERT INTO `onethink_action_log` VALUES ('906', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801378');
INSERT INTO `onethink_action_log` VALUES ('907', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801380');
INSERT INTO `onethink_action_log` VALUES ('908', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801381');
INSERT INTO `onethink_action_log` VALUES ('909', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801381');
INSERT INTO `onethink_action_log` VALUES ('910', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801381');
INSERT INTO `onethink_action_log` VALUES ('911', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801389');
INSERT INTO `onethink_action_log` VALUES ('912', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:09登录了后台', '1', '1415801390');
INSERT INTO `onethink_action_log` VALUES ('913', '1', '1', '-1238597421', 'member', '1', '123在2014-11-12 22:11登录了后台', '1', '1415801507');
INSERT INTO `onethink_action_log` VALUES ('914', '1', '1', '-555810078', 'member', '1', '123在2014-11-12 22:54登录了后台', '1', '1415804073');
INSERT INTO `onethink_action_log` VALUES ('915', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812162');
INSERT INTO `onethink_action_log` VALUES ('916', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812164');
INSERT INTO `onethink_action_log` VALUES ('917', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812167');
INSERT INTO `onethink_action_log` VALUES ('918', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812167');
INSERT INTO `onethink_action_log` VALUES ('919', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812169');
INSERT INTO `onethink_action_log` VALUES ('920', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812170');
INSERT INTO `onethink_action_log` VALUES ('921', '1', '1', '1873429336', 'member', '1', '123在2014-11-13 01:09登录了后台', '1', '1415812170');
INSERT INTO `onethink_action_log` VALUES ('922', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:24登录了后台', '1', '1415813062');
INSERT INTO `onethink_action_log` VALUES ('923', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:39登录了后台', '1', '1415813982');
INSERT INTO `onethink_action_log` VALUES ('924', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:39登录了后台', '1', '1415813994');
INSERT INTO `onethink_action_log` VALUES ('925', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:40登录了后台', '1', '1415814031');
INSERT INTO `onethink_action_log` VALUES ('926', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:40登录了后台', '1', '1415814034');
INSERT INTO `onethink_action_log` VALUES ('927', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814063');
INSERT INTO `onethink_action_log` VALUES ('928', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814076');
INSERT INTO `onethink_action_log` VALUES ('929', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814076');
INSERT INTO `onethink_action_log` VALUES ('930', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814076');
INSERT INTO `onethink_action_log` VALUES ('931', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814076');
INSERT INTO `onethink_action_log` VALUES ('932', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814077');
INSERT INTO `onethink_action_log` VALUES ('933', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814077');
INSERT INTO `onethink_action_log` VALUES ('934', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814077');
INSERT INTO `onethink_action_log` VALUES ('935', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814077');
INSERT INTO `onethink_action_log` VALUES ('936', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814078');
INSERT INTO `onethink_action_log` VALUES ('937', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814078');
INSERT INTO `onethink_action_log` VALUES ('938', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814078');
INSERT INTO `onethink_action_log` VALUES ('939', '1', '1', '1902592427', 'member', '1', '123在2014-11-13 01:41登录了后台', '1', '1415814078');
INSERT INTO `onethink_action_log` VALUES ('940', '1', '1', '-1222132635', 'member', '1', '123在2014-11-13 01:52登录了后台', '1', '1415814724');
INSERT INTO `onethink_action_log` VALUES ('941', '1', '1', '-1222132635', 'member', '1', '123在2014-11-13 01:52登录了后台', '1', '1415814728');
INSERT INTO `onethink_action_log` VALUES ('942', '1', '1', '1967613829', 'member', '1', '123在2014-11-13 10:06登录了后台', '1', '1415844402');
INSERT INTO `onethink_action_log` VALUES ('943', '1', '1', '1967613829', 'member', '1', '123在2014-11-13 10:06登录了后台', '1', '1415844414');
INSERT INTO `onethink_action_log` VALUES ('944', '1', '1', '974255701', 'member', '1', '123在2014-11-13 10:18登录了后台', '1', '1415845108');
INSERT INTO `onethink_action_log` VALUES ('945', '1', '1', '974255701', 'member', '1', '123在2014-11-13 10:18登录了后台', '1', '1415845109');
INSERT INTO `onethink_action_log` VALUES ('946', '1', '1', '974255701', 'member', '1', '123在2014-11-13 10:25登录了后台', '1', '1415845541');
INSERT INTO `onethink_action_log` VALUES ('947', '1', '1', '974255701', 'member', '1', '123在2014-11-13 10:25登录了后台', '1', '1415845545');
INSERT INTO `onethink_action_log` VALUES ('948', '1', '1', '1882590658', 'member', '1', '123在2014-11-13 11:18登录了后台', '1', '1415848688');
INSERT INTO `onethink_action_log` VALUES ('949', '1', '1', '1961299203', 'member', '1', '123在2014-11-13 11:18登录了后台', '1', '1415848735');
INSERT INTO `onethink_action_log` VALUES ('950', '1', '1', '1961299203', 'member', '1', '123在2014-11-13 11:19登录了后台', '1', '1415848749');
INSERT INTO `onethink_action_log` VALUES ('951', '1', '1', '-899121216', 'member', '1', '123在2014-11-13 11:43登录了后台', '1', '1415850207');
INSERT INTO `onethink_action_log` VALUES ('952', '1', '1', '1882590658', 'member', '1', '123在2014-11-13 12:18登录了后台', '1', '1415852326');
INSERT INTO `onethink_action_log` VALUES ('953', '1', '1', '1882590658', 'member', '1', '123在2014-11-13 12:19登录了后台', '1', '1415852341');
INSERT INTO `onethink_action_log` VALUES ('954', '1', '1', '1007313295', 'member', '1', '123在2014-11-13 14:48登录了后台', '1', '1415861302');
INSERT INTO `onethink_action_log` VALUES ('955', '1', '1', '1007313295', 'member', '1', '123在2014-11-13 14:48登录了后台', '1', '1415861308');
INSERT INTO `onethink_action_log` VALUES ('956', '1', '1', '1007313295', 'member', '1', '123在2014-11-13 14:48登录了后台', '1', '1415861311');
INSERT INTO `onethink_action_log` VALUES ('957', '1', '1', '1698979253', 'member', '1', '123在2014-11-13 16:28登录了后台', '1', '1415867332');
INSERT INTO `onethink_action_log` VALUES ('958', '1', '1', '1698979253', 'member', '1', '123在2014-11-13 16:29登录了后台', '1', '1415867342');
INSERT INTO `onethink_action_log` VALUES ('959', '1', '1', '1698979253', 'member', '1', '123在2014-11-13 16:29登录了后台', '1', '1415867351');
INSERT INTO `onethink_action_log` VALUES ('960', '1', '1', '242453099', 'member', '1', '123在2014-11-13 20:24登录了后台', '1', '1415881470');
INSERT INTO `onethink_action_log` VALUES ('961', '1', '1', '242453099', 'member', '1', '123在2014-11-13 20:24登录了后台', '1', '1415881482');
INSERT INTO `onethink_action_log` VALUES ('962', '1', '1', '-636585710', 'member', '1', '123在2014-11-13 21:10登录了后台', '1', '1415884215');
INSERT INTO `onethink_action_log` VALUES ('963', '1', '1', '-636585710', 'member', '1', '123在2014-11-13 21:13登录了后台', '1', '1415884387');
INSERT INTO `onethink_action_log` VALUES ('964', '1', '1', '-636585710', 'member', '1', '123在2014-11-13 21:13登录了后台', '1', '1415884439');
INSERT INTO `onethink_action_log` VALUES ('965', '1', '1', '-636585710', 'member', '1', '123在2014-11-13 21:14登录了后台', '1', '1415884441');
INSERT INTO `onethink_action_log` VALUES ('966', '1', '1', '1711150690', 'member', '1', '123在2014-11-14 00:01登录了后台', '1', '1415894461');

-- ----------------------------
-- Table structure for `onethink_addons`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of onethink_addons
-- ----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `onethink_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `onethink_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `onethink_addons` VALUES ('16', 'OTcaiji', 'OT采集', 'OT采集插件', '1', '{\"codelogin\":1,\"KEYWORDS\":\"\",\"URL\":\"\",\"LIST\":\"\",\"TITLE\":\"\",\"CONTENT\":\"\"}', 'Marvin(柳英伟)', '0.2', '1411634246', '1');
INSERT INTO `onethink_addons` VALUES ('17', 'ReturnTop', '返回顶部', '回到顶部美化，随机或指定显示，100款样式，每天一种换，天天都用新样式', '1', '{\"random\":\"0\",\"current\":\"79\"}', 'thinkphp', '0.1', '1411634594', '0');
INSERT INTO `onethink_addons` VALUES ('19', 'Iyo9Table', '点击成可编辑插件', '向着要编辑的位置点击一下，访位置会变成一个可编辑的input标签，编辑好后，鼠标再点击空白地方，即可保存', '1', 'null', 'i友街', '0.1', '1411636824', '0');
INSERT INTO `onethink_addons` VALUES ('28', 'Template', '模版管理', '模版在线编辑插件', '1', 'null', 'Marvin(柳英伟)', '1.0', '1415711535', '1');
INSERT INTO `onethink_addons` VALUES ('23', 'SyncLogin', '第三方账号同步登陆', '第三方账号同步登陆', '1', '{\"type\":[\"Qq\",\"Sina\"],\"meta\":\"<meta property=\\\"qc:admins\\\" content=\\\"14506550626121552166547\\\" \\/>\",\"QqKEY\":\"101164201\",\"QqSecret\":\"bacdcc5fc9dec5fdff2a706a41f8f819\",\"SinaKEY\":\"2304590390\",\"SinaSecret\":\"c6217f28e5aceb678ba2e862a79ffcbc\"}', 'yidian', '0.1', '1412762818', '0');
INSERT INTO `onethink_addons` VALUES ('26', 'ThirdLogin', '快捷登录插件', '目前登录平台为：腾讯QQ，其它请自行添加', '0', '{\"login_plugin\":[\"sina\",\"qq\"],\"platformMeta\":\"<meta \\/>\",\"sina_wb_akey\":\"\",\"sina_wb_skey\":\"\",\"qq_qzone_akey\":\"\",\"qq_qzone_skey\":\"\"}', 'iszhang', '0.1', '1414484131', '0');

-- ----------------------------
-- Table structure for `onethink_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of onethink_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of onethink_attribute
-- ----------------------------
INSERT INTO `onethink_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('36', 'content', '内容详细描述', 'text NOT NULL', 'editor', '', '', '1', '', '5', '0', '1', '1411376156', '1411376156', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('35', 'price', '价格', 'varchar(255) NOT NULL', 'string', '1.00', '', '1', '', '5', '0', '1', '1411430769', '1411375944', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('37', 'weight', '净重', 'varchar(255) NOT NULL', 'string', '500', 'g', '1', '', '5', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('38', 'totalsales', '总销量', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '5', '0', '1', '1411380076', '1411380076', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('39', 'area', '产地', 'varchar(255) NOT NULL', 'string', '中国大陆', '', '1', '', '5', '0', '1', '1411380147', '1411380147', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('40', 'ads_pic_id', '首页幻灯大图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '首页幻灯大图', '1', '', '5', '0', '1', '1411815168', '1411815168', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('41', 'adtitle', '广告宣传标题', 'varchar(255) NOT NULL', 'string', '', '副标题', '1', '', '5', '0', '1', '1411815491', '1411815491', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('42', 'yprice', '原价', 'varchar(255) NOT NULL', 'string', '', '产品原价', '1', '', '5', '0', '1', '1411919829', '1411919829', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('43', 'mark', '附加标签', 'varchar(255) NOT NULL', 'string', '', '1-最新上架，2-限时抢购，3-热卖商品，4-限时折扣', '1', '', '5', '0', '1', '1412016261', '1412016196', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('44', 'unionid', '关联商品', 'varchar(255) NOT NULL', 'string', '', '关联商品id,如3,9,10，逗号隔开', '1', '', '5', '0', '1', '1413845084', '1413845084', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('47', 'shorttitle', '商品简称', 'varchar(255) NOT NULL', 'string', '', '商品简称', '1', '', '5', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('46', 'stock', '库存', 'int(10) UNSIGNED NOT NULL', 'num', '10', '商品库存数量', '1', '', '5', '0', '1', '1414669588', '1414177236', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('49', 'pics', '图集', 'varchar(255) NOT NULL', 'pictures', '', '', '1', '', '5', '0', '1', '1415714560', '1415713073', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for `onethink_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`) USING BTREE,
  KEY `uid` (`group_id`) USING BTREE,
  KEY `group_id` (`extend_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of onethink_auth_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group
-- ----------------------------
INSERT INTO `onethink_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `onethink_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for `onethink_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_rule
-- ----------------------------
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('111', 'admin', '2', 'Admin/Article/index', '内容', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('217', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('218', 'admin', '1', 'Admin/Order/index', '已提交订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Ordertransport/index', '已发货订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('220', 'admin', '2', 'Admin/Order/index', '订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Ordercomplete/index', '已签收订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Fcoupon/index', '优惠券', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('223', 'admin', '2', 'Admin/Statistics/index', '数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Back/index', '正退货订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Backagree/index', '同意退货订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Backover/index', '已退货订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('227', 'admin', '1', 'Admin/Change/index', '正换货商品', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Changeagree/index', '同意换货商品', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Changeover/index', '已换货商品', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Statistics/index', '今日销量统计', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Statistics/week', '本周销量统计', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Statistics/month', '本月销量统计', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Report/index', '每日数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Report/week', '每周数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('235', 'admin', '1', 'Admin/Report/month', '每月统计', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Cancel/index', '申请取消的订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('237', 'admin', '1', 'Admin/Cancelrefuse/index', '拒绝的订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('238', 'admin', '1', 'Admin/Cancelagree/index', '同意取消的订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Pay/index', '已支付的订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Lookup/index', '首页统计', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Lookup/category', '栏目页统计', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Lookup/article', '内容页统计', '1', '');

-- ----------------------------
-- Table structure for `onethink_backlist`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_backlist`;
CREATE TABLE `onethink_backlist` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(225) DEFAULT NULL,
  `num` int(50) DEFAULT NULL,
  `tool` varchar(225) DEFAULT NULL COMMENT '订单号',
  `toolid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `status` int(10) DEFAULT '1',
  `time` int(10) DEFAULT NULL,
  `info` varchar(225) NOT NULL,
  `total` decimal(50,2) DEFAULT NULL,
  `backinfo` varchar(225) DEFAULT NULL,
  `addressid` int(225) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `assistant` int(100) DEFAULT NULL,
  `shopid` int(225) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  `reason` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_backlist
-- ----------------------------
INSERT INTO `onethink_backlist` VALUES ('4', '8', '4654', null, null, '3', null, '同意', '0.00', '退货已完成', '21', '1414070662', null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('5', '8', '2', null, null, '1', '1414087501', '暂无', '1000.00', '同意退货', '21', '1415483820', null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('6', '9', '2', null, null, '1', '1414067582', '暂无', '0.00', '正在编辑', '22', '1414092363', null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('13', '18', '0', null, null, '1', '1414863876', '', '1400.00', '正在编辑', null, '1415483833', null, '878', '', '');
INSERT INTO `onethink_backlist` VALUES ('24', '18', null, null, null, '1', '1414864155', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('25', '18', null, null, null, '1', '1414864404', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('26', '18', null, null, null, '1', '1414864451', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('27', '18', null, null, null, '1', '1414864520', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('28', '18', null, null, null, '1', '1414864577', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('29', '18', null, null, null, '1', '1414864657', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('30', '18', null, null, null, '1', '1414864840', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('31', '18', null, null, null, '1', '1414912329', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('32', '18', null, null, null, '1', '1414912373', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('33', '18', '1', null, null, '1', '1414912849', '', null, null, null, null, null, '878', '1', '5665');
INSERT INTO `onethink_backlist` VALUES ('34', '18', null, null, null, '1', '1414912852', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('35', '18', null, null, null, '1', '1414914843', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('36', '18', null, null, null, '1', '1414914924', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('37', '18', null, null, null, '1', '1414914932', '', null, null, null, null, null, null, null, null);
INSERT INTO `onethink_backlist` VALUES ('38', '8', '100', null, null, '1', '1415718648', '', '1000.00', '正在编辑', null, '1415718665', null, null, null, null);

-- ----------------------------
-- Table structure for `onethink_cancel`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_cancel`;
CREATE TABLE `onethink_cancel` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(225) DEFAULT NULL,
  `num` int(50) DEFAULT NULL,
  `orderid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `time` int(10) DEFAULT NULL,
  `title` varchar(225) NOT NULL,
  `reason` varchar(225) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `assistant` int(100) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `refuse_info` varchar(225) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `info` varchar(225) DEFAULT NULL,
  `cash` decimal(50,2) DEFAULT NULL,
  `count` int(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_cancel
-- ----------------------------
INSERT INTO `onethink_cancel` VALUES ('18', null, null, 'DB022428935646351907', '1414924350', '55', '555', '1414927662', null, null, '', '2', '取消完成', null, null);
INSERT INTO `onethink_cancel` VALUES ('20', '18', '10', 'DB022446945490710824', '1414924611', '', '', '1414926443', null, null, '65564', '1', null, '100.00', '10');

-- ----------------------------
-- Table structure for `onethink_category`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `ismenu` int(11) DEFAULT NULL COMMENT '无限极分类调用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of onethink_category
-- ----------------------------
INSERT INTO `onethink_category` VALUES ('52', 'fruit', '新鲜水果', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1411925214', '1413845667', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('40', 'vegetable', '新鲜蔬菜', '0', '2', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1411331932', '1415564696', '1', '6', '0');
INSERT INTO `onethink_category` VALUES ('41', 'root vegetables ', '根菜类', '40', '3', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1411332731', '1413845950', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('42', 'leaf vegetables', '叶菜类', '40', '4', '10', '', '', '', '', '', '', '', '2,3,5', '', '2', '0', '1', '1', '0', '0', '', '', '1411332913', '1412523532', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('43', 'stem vegetable', '茎菜类', '40', '5', '10', '', '', '', '', '', '', '', '2,3,5', '', '2', '0', '1', '1', '0', '0', '', '', '1411332994', '1412523540', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('44', 'flower vegetable', '花菜类', '40', '6', '10', '', '', '', '', '', '', '', '2,3,5', '', '2', '0', '1', '1', '0', '0', '', '', '1411333039', '1412523548', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('45', ' fruit-vegetable', '果菜类', '40', '7', '10', '', '', '', '', '', '', '', '2,3,5', '', '2', '0', '1', '1', '0', '0', '', '', '1411333095', '1412523556', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('58', 'j_fruit', '进口水果', '52', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1411935041', '1413845696', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('56', 'notice', '公告', '0', '8', '10', '', '', '', '', '', '', '', '2', '5', '2', '0', '1', '1', '0', '1', '', '', '1411929200', '1414003441', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('57', 'c_fruit', '国内水果', '52', '0', '10', '', '', '', '', '', '', '', '2,3,5', '5', '2', '0', '1', '1', '0', '0', '', '', '1411934874', '1413198856', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('68', 'coupon', '优惠券', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1413987264', '1414344293', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('70', 'activity', '活动', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414338807', '1414338807', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('71', 'tushu', '图书音像', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1414344085', '1414675134', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('72', 'xie', '名鞋箱包', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674812', '1414674812', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('73', 'car', '汽车用品', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674847', '1414674847', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('74', 'electric', '电子数码', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674877', '1414674888', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('75', 'fushi', '潮流服饰', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674964', '1414674964', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('76', 'jiaju', '创意家居', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414675003', '1414675003', '1', '0', '1');
INSERT INTO `onethink_category` VALUES ('77', 'gmlc', '购买流程', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1415464640', '1415464640', '1', '0', '0');

-- ----------------------------
-- Table structure for `onethink_change`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_change`;
CREATE TABLE `onethink_change` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(225) DEFAULT NULL,
  `num` int(50) DEFAULT NULL,
  `orderid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `tool` varchar(225) DEFAULT NULL COMMENT '订单号',
  `toolid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `uid` int(225) DEFAULT NULL,
  `status` int(10) DEFAULT '1',
  `time` int(10) DEFAULT NULL,
  `info` varchar(225) NOT NULL,
  `total` decimal(50,2) DEFAULT NULL,
  `backinfo` varchar(225) DEFAULT NULL,
  `shopid` int(225) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `assistant` int(100) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  `reson` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_change
-- ----------------------------
INSERT INTO `onethink_change` VALUES ('12', '18', '10', null, null, null, null, '1', '1414915154', '', null, null, '878', null, null, '', null);
INSERT INTO `onethink_change` VALUES ('13', '9', '10', null, null, null, null, '1', '1415718735', '', null, '正处理换货商品', null, null, null, null, null);

-- ----------------------------
-- Table structure for `onethink_channel`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_channel
-- ----------------------------
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1412579864', '1', '0');
INSERT INTO `onethink_channel` VALUES ('7', '0', '新鲜水果', 'Article/index?category=fruit', '5', '1412760390', '1413205567', '1', '0');
INSERT INTO `onethink_channel` VALUES ('5', '4', '根菜类', 'Article/index?category=root vegetables', '0', '1411719441', '1411719441', '1', '0');
INSERT INTO `onethink_channel` VALUES ('8', '0', '个人中心', 'Center/index', '4', '1412872458', '1413205562', '1', '0');

-- ----------------------------
-- Table structure for `onethink_check_info`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_check_info`;
CREATE TABLE `onethink_check_info` (
  `uid` int(11) DEFAULT NULL,
  `con_num` int(11) DEFAULT '1',
  `total_num` int(11) DEFAULT '1',
  `ctime` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_check_info
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_config`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `group` (`group`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_config
-- ----------------------------
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台*显示标题*', '1378898976', '1412577255', '1', 'yershop商城系统-onethink商城系统，b2c商城系统,thinkphp商城系统,', '0');
INSERT INTO `onethink_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'b2c商城系统-ohshop b2c商城系统-，thinkphp商城系统', '1');
INSERT INTO `onethink_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink，b2c商城系统,ohshop b2c商城系统-，thinkphp商城系统', '8');
INSERT INTO `onethink_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `onethink_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '沪ICP备12007941号-2', '9');
INSERT INTO `onethink_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `onethink_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `onethink_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰\r\namaze:妹子UI', '后台颜色风格', '1379122533', '1411636415', '1', 'default_color', '10');
INSERT INTO `onethink_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1414272713', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:费用\r\n6:商城\r\n7:接口', '4');
INSERT INTO `onethink_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `onethink_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `onethink_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `onethink_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `onethink_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `onethink_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `onethink_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `onethink_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `onethink_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `onethink_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `onethink_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `onethink_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `onethink_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `onethink_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `onethink_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `onethink_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `onethink_config` VALUES ('40', 'HOTSEARCH', '1', '热词', '1', '', '热门搜索词，必须逗号隔开', '1413221018', '1414964609', '1', '蓝莓,香蕉,苹果,香梨,红提', '0');
INSERT INTO `onethink_config` VALUES ('41', 'SHIPPRICE', '0', '运费', '5', '', '低于一定金额的运费', '1414001070', '1414001482', '1', '10', '0');
INSERT INTO `onethink_config` VALUES ('42', 'LOWWEST', '0', '最低消费金额', '5', '', '用户最低消费的金额，低于该金额，则增加运费', '1414001165', '1414001495', '1', '50', '0');
INSERT INTO `onethink_config` VALUES ('43', 'RATIO', '0', '积分现金兑换比', '5', '', '1000表示1000积分可兑换成1元', '1414153401', '1414153401', '1', '1000', '0');
INSERT INTO `onethink_config` VALUES ('44', 'DEADTIME', '0', '退货有效期', '5', '', '从订单签收完成多少天内可以退货', '1414164561', '1414164642', '1', '7', '0');
INSERT INTO `onethink_config` VALUES ('45', 'CHANGETIME', '0', '换货期', '5', '', '订单签收多少天内后可以换货', '1414164627', '1414164654', '1', '15', '0');
INSERT INTO `onethink_config` VALUES ('46', 'QQ', '1', 'QQ客服', '6', '', '网站客服的qq代码', '1414183635', '1414664781', '1', '10000', '0');
INSERT INTO `onethink_config` VALUES ('47', 'ALWW', '0', '阿里旺旺号', '6', '', '网站阿里旺旺客服', '1414183716', '1414664772', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('48', 'IP_TONGJI', '4', '开启ip访问统计', '3', '0:关闭,1:开启', '开启后追踪用户的访问页面，访问明细，访问地域', '1414244159', '1414244270', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('49', 'LAG', '0', '统计时间间隔（小时）', '3', '', '重复访问的会员每隔多少时间统计，小于这一时间，不统计', '1414258358', '1414407504', '1', '6', '21');
INSERT INTO `onethink_config` VALUES ('50', 'DOMAIN', '1', '网站域名', '1', '', '网站域名', '1414504643', '1414504839', '1', 'http://www.ijquery.net', '0');
INSERT INTO `onethink_config` VALUES ('51', '100KEY', '1', '0-快递100查询key', '7', '', '申请地址：http://www.kuaidi100.com/openapi/applyapi.shtml，用于查询运单号', '1414664721', '1415473565', '1', 'f2ea02e8bbb75187', '0');
INSERT INTO `onethink_config` VALUES ('52', 'ADDRESS', '1', '发货地址', '6', '', '卖家的发货地址', '1414664871', '1414664871', '1', '广东广州', '0');
INSERT INTO `onethink_config` VALUES ('53', 'CONTACT', '1', '联系电话', '6', '', '卖家的联系方式', '1414664911', '1414664911', '1', '13645000000', '0');
INSERT INTO `onethink_config` VALUES ('54', 'SHOPNAME', '1', '卖家名称', '6', '', '卖家发货时填写的昵称', '1414665008', '1414665008', '1', '小米', '0');
INSERT INTO `onethink_config` VALUES ('55', 'SITENAME', '1', '网站名称', '1', '', '用于网站支付时显示，如土豆网', '1414761363', '1414761398', '1', 'yershop商城', '0');
INSERT INTO `onethink_config` VALUES ('56', 'ALIPAYPARTNER', '1', '1-支付宝商户号', '7', '', '这里是你在成功申请支付宝接口后获取到的PID', '1414769351', '1415137270', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('57', 'ALIPAYKEY', '1', '支付宝密钥', '7', '', '这里是你在成功申请支付宝接口后获取到的Key', '1414769402', '1414769402', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('67', 'TENPAYPARTNER', '1', '2-财付通合作者ID', '7', '', '合作者ID，财付通有该配置，开通财付通账户后给予', '1415472468', '1415473488', '1', '', '1');
INSERT INTO `onethink_config` VALUES ('66', 'TENPAYKEY', '1', '财付通加密key', '7', '', '加密key，开通财付通账户后给予', '1415472288', '1415473499', '1', '', '2');
INSERT INTO `onethink_config` VALUES ('68', 'PALPAYPARTNER', '1', '3-贝宝账号', '7', '', '合作者ID，贝宝有该配置，开通贝宝账户后给予不需密码', '1415472655', '1415473914', '1', '', '3');
INSERT INTO `onethink_config` VALUES ('69', 'YEEPAYPARTNER', '1', '4-易付宝合作者id', '7', '', '易付宝给予的合作者id', '1415472817', '1415473522', '1', '', '4');
INSERT INTO `onethink_config` VALUES ('64', 'ALIPAYEMAIL', '1', '支付宝收款账号', '7', '', '支付宝收款账号邮箱', '1415472043', '1415472347', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('70', 'YEEPAYKEY', '1', '易付宝密钥', '7', '', '易付宝合作者的密钥', '1415473084', '1415473533', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('71', 'KUAIQIANPARTNER', '1', '5-快钱合作者id', '7', '', '合作者ID，快钱有该配置，开通财付通账户后给予', '1415473241', '1415473540', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('72', 'KUAIQIANKEY', '1', '快钱key', '7', '', '加密key，开通快钱账户后给予', '1415473293', '1415473553', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('73', 'UNIONPARTNER', '1', '6-银联合作者账号', '7', '', '合作者ID，银联有该配置，开通银联账户后给予', '1415473364', '1415473424', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('74', 'UNIONKEY', '1', '银联key', '7', '', ' 加密key，开通银联账户后给予', '1415473475', '1415473475', '1', '', '6');

-- ----------------------------
-- Table structure for `onethink_document`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`) USING BTREE,
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of onethink_document
-- ----------------------------
INSERT INTO `onethink_document` VALUES ('12', '1', '', '肯德基电子优惠券', '68', '1236589443679', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '6', '0', '0', '0', '1413988167', '1413988167', '1');
INSERT INTO `onethink_document` VALUES ('5', '1', '', '金灯果（又名“姑娘果”）（盒装1000g）', '45', '', '0', '0', '5', '2', '4', '0', '15', '1', '0', '0', '866', '0', '0', '0', '1411380420', '1414338160', '1');
INSERT INTO `onethink_document` VALUES ('8', '1', '', '【天天果园】智利青苹果12个', '57', '酸爽多汁，肉质细嫩，高品质新鲜保证', '0', '0', '5', '2', '2', '0', '7', '1', '0', '0', '645', '0', '0', '0', '1411927620', '1414532702', '1');
INSERT INTO `onethink_document` VALUES ('9', '1', '', '常鲜生 正宗菲律宾进口香蕉', '57', '', '0', '0', '5', '2', '4', '0', '9', '1', '0', '0', '290', '0', '0', '0', '1411928400', '1414533394', '1');
INSERT INTO `onethink_document` VALUES ('13', '1', '', '冷冻（藏）品只配送京津', '56', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1414333120', '1414333120', '1');
INSERT INTO `onethink_document` VALUES ('14', '1', '', '褚橙开售', '57', '', '0', '0', '5', '2', '4', '0', '17', '1', '0', '0', '106', '0', '0', '0', '1414339080', '1414343243', '1');
INSERT INTO `onethink_document` VALUES ('15', '1', '', '河南河阴软籽石榴（中果） 4粒装（单果重250-300g）', '57', '', '0', '0', '5', '2', '0', '0', '20', '1', '0', '0', '53', '0', '0', '0', '1414342440', '1414343076', '1');
INSERT INTO `onethink_document` VALUES ('16', '1', '', '佳沃智利进口蓝莓一级果125g', '57', '', '0', '0', '5', '2', '0', '0', '21', '1', '0', '0', '155', '0', '0', '0', '1414342560', '1414343180', '1');
INSERT INTO `onethink_document` VALUES ('17', '1', '', '新疆红提950-1000g', '57', '', '0', '0', '5', '2', '0', '0', '24', '1', '0', '0', '298', '0', '0', '0', '1414342620', '1414343496', '1');
INSERT INTO `onethink_document` VALUES ('18', '1', '', '新疆库尔勒香梨 950g-1000g 香而清甜，虽小却好吃', '57', '', '0', '0', '5', '2', '0', '0', '23', '1', '0', '0', '130', '0', '0', '0', '1414342680', '1415713929', '1');
INSERT INTO `onethink_document` VALUES ('19', '1', '', '在线支付', '77', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1415464949', '1415464949', '1');

-- ----------------------------
-- Table structure for `onethink_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of onethink_document_article
-- ----------------------------
INSERT INTO `onethink_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');
INSERT INTO `onethink_document_article` VALUES ('4', '0', '<div id=\"description\" class=\"tshop-psm ke-post J_DetailSection\">\r\n	<div class=\"content\" id=\"J_DivItemDesc\">\r\n		<p style=\"background:white;\">\r\n			<b><span style=\"font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;\">营养价值</span></b><b><span style=\"font-size:15.0pt;background:white;color:#0000cc;font-family:arial sans-serif;\"></span></b> \r\n		</p>\r\n		<p style=\"background:white;text-indent:-35.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style=\"font-size:14.0pt;font-family:宋体;\">韭菜的</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>营养</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">价值很高，每</span><span style=\"font-size:14.0pt;\"><span>100</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克可食用部分含</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>蛋白质</span></span></a></span><span style=\"font-size:14.0pt;\"><span>2~2.85</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克，脂肪</span><span style=\"font-size:14.0pt;\"><span>0.2~0.5</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>碳水化合物</span></span></a></span><span style=\"font-size:14.0pt;\"><span>2.4~6</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克，纤维素</span><span style=\"font-size:14.0pt;\"><span>0.6~3.2</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克。还有大量的维生素，如</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>胡萝卜素</span></span></a></span><span style=\"font-size:14.0pt;\"><span>0.08~3.26</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>核黄素</span></span></a></span><span style=\"font-size:14.0pt;\"><span>0.05~0.8</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>尼克酸</span></span></a></span><span style=\"font-size:14.0pt;\"><span>0.3~1</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，维生素</span><span style=\"font-size:14.0pt;\"><span>C10~62.8</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，韭菜含的矿质元素也较多，如钙</span><span style=\"font-size:14.0pt;\"><span>10~86</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，磷</span><span style=\"font-size:14.0pt;\"><span>9~51</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，铁</span><span style=\"font-size:14.0pt;\"><span>0.6~2.4</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">毫克，此外，韭菜含有挥发性的硫化丙烯，因此具有辛辣味，有促进食欲的作用。韭菜除做菜用外，还有良好的药用价值。</span></span> \r\n		</p>\r\n		<p style=\"background:white;text-indent:-35.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\"></span></span><b><span style=\"font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;\">饮食宜忌</span></b><b><span style=\"font-size:15.0pt;background:white;color:#0000cc;font-family:arial sans-serif;\"></span></b> \r\n		</p>\r\n		<p style=\"background:white;text-indent:35.0pt;text-align:left;\" align=\"left\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>1</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、一般人群均能食用。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"background:white;text-indent:35.0pt;text-align:left;\" align=\"left\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>2</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、适宜便秘、产后想断乳的女性、</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>寒性体质</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">等人群。</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"background:white;text-indent:-21.0pt;text-align:left;\" align=\"left\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>3</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、便秘者建议多吃，因为韭菜含有大量的</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>膳食纤维</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">，能改善肠道，润肠通便。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"background:white;text-indent:35.0pt;text-align:left;\" align=\"left\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>4</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、现代医学认为，有阳亢及热性病症的人不宜食用。</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"background:white;text-indent:-21.0pt;text-align:left;\" align=\"left\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>5</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、韭菜的粗纤维较多，不易消化吸收，所以一次不能吃太多韭菜，否则大量粗纤维刺激肠壁，</span><span style=\"font-size:14.0pt;font-family:宋体;\">酒后尤忌</span><span style=\"font-size:14.0pt;font-family:宋体;\">。</span></span><a name=\"8_2\"></a><a name=\"sub25243_8_2\"></a><span style=\"font-size:14.0pt;\"></span> \r\n		</p>\r\n		<p>\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>6</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、韭菜偏热性，多食易上火，因此阴虚火旺者不宜多吃。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:35.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>7</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、胃虚有热、消化不良不宜食用。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-21.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>8</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、夏韭老化，纤维多而粗造，不易被人肠胃消化吸收，加之夏季胃肠蠕动，功能降低，多会引起胃肠不适或腹泻，因此夏季热时不宜多食。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:35.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>9</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、熟的韭菜不能隔夜吃</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p>\r\n			<a name=\"11_2\"></a><a name=\"sub25243_11_2\"></a><b><span style=\"font-size:15.0pt;color:#0000cc;font-family:宋体;\">推荐食谱</span></b><b><span style=\"font-size:15.0pt;color:#0000cc;\"></span></b> \r\n		</p>\r\n		<p style=\"text-indent:27.75pt;\">\r\n			<span><b><span style=\"font-size:14.0pt;background:white;font-family:宋体;\">韭菜炒蛋</span></b><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-35.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【原料】：韭菜</span><span style=\"font-size:14.0pt;\"><span>4</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">两（约</span><span style=\"font-size:14.0pt;\"><span>200</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克），大鸡蛋</span><span style=\"font-size:14.0pt;\"><span>3</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">只，调料：</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>生油</span></span></a></span><span style=\"font-size:14.0pt;\"><span>3</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">汤匙，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>生粉</span></span></a></span><span style=\"font-size:14.0pt;\"><span>2</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">茶匙，清水</span><span style=\"font-size:14.0pt;\"><span>1</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">汤匙，鸡粉</span><span style=\"font-size:14.0pt;\"><span>1/4</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">茶匙，麻油</span><span style=\"font-size:14.0pt;\"><span>1</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">茶匙，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>胡椒粉</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">少许。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-35.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【做法】：</span><span style=\"font-size:14.0pt;\"><span>1</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、韭菜洗净切小段；</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:28.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>2</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、生粉用水拌匀制成生粉水，待用；</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:28.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>3</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、将调料、韭菜、生粉水一起拌匀；</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:28.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>4</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、在大碗内搅散鸡蛋；</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-14.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>5</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、炒锅烧热，放入三汤匙生油，待油热后，倒入韭菜、蛋液，快炒至凝固，即可装盘食用。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-14.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:28.0pt;\">\r\n			<span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><b><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>豆丝韭菜</span></span></b></a></span><span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-49.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【原料】：韭菜</span><span style=\"font-size:14.0pt;\"><span>500</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>土豆</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">（黄皮）</span><span style=\"font-size:14.0pt;\"><span>200</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克。调料：胡麻油</span><span style=\"font-size:14.0pt;\"><span>15</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克，盐</span><span style=\"font-size:14.0pt;\"><span>3</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>味精</span></span></a></span><span style=\"font-size:14.0pt;\"><span>2</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">克。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-84.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【做法】：</span><span style=\"font-size:14.0pt;\"><span>1.</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">韭菜洗净后切成段，放入沸水锅中焯一下，沥干水分；土豆洗净后去皮切成丝。</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-14.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>2.</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">花椒油、味精、</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>精盐</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">、韭菜段和土豆丝一起放入盆内，拌匀装盘即可。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span></span><span><span style=\"font-size:14.0pt;font-family:宋体;\"></span></span> \r\n		</p>\r\n		<p>\r\n			<b><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><span>&nbsp;</span></span></b> \r\n		</p>\r\n		<p style=\"text-indent:29.1pt;\">\r\n			<span><b><span style=\"font-size:14.0pt;background:white;font-family:宋体;\">韭菜炒咸猪肉</span></b><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-49.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【原料】：</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>咸猪肉</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">片，韭菜，新鲜干</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>葱头</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">甲片，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>红萝卜</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">花，炸蒜片，</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>小葱</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">度。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-42.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【做法】：锅内烧净</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>色拉油</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">至</span><span style=\"font-size:14.0pt;\"><span>7</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">成热，逐片放入腌制好的咸猪肉片后离火，炸成略脆状后倒出。将韭菜花飞水后，加入少许味水略炒后倒出。锅内放少许油，倒入料头炒香，加入炸好咸猪肉片，韭菜花，料酒，味水芡汁（带少许</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>蚝油</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">），快速炒匀后亮油起锅。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p>\r\n			<b><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><span>&nbsp;</span></span></b> \r\n		</p>\r\n		<p style=\"text-indent:29.1pt;\">\r\n			<span><b><span style=\"font-size:14.0pt;background:white;font-family:宋体;\">培根炒韭菜</span></b><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:55.45pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【原料】：</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>韭菜</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">美式</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>培根</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">若干条、</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>食用油</span></span></a></span><span style=\"font-size:14.0pt;background:white;font-family:宋体;\">、</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>盐</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">、</span><span style=\"font-size:14.0pt;background:white;font-family:arial sans-serif;\"><a><span style=\"color:windowtext;font-family:宋体;text-decoration:none;\"><span>糖</span></span></a></span><span style=\"font-size:14.0pt;font-family:宋体;\">。　</span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-77.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;font-family:宋体;\">【做法】：</span><span style=\"font-size:14.0pt;\"><span>1</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、培根整条放入不粘锅中，小火煎至金黄肉脆，肥油全部渗出。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-14.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>2</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、取出培根条，切小片备用。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-14.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>3</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、煎培根的原锅中添加适量的食用油（视韭菜量），油热后加入韭菜快速翻炒。</span><span style=\"font-size:14.0pt;\"></span><span style=\"font-size:14.0pt;font-family:宋体;\"></span><span style=\"font-size:14.0pt;\"></span></span> \r\n		</p>\r\n		<p style=\"text-indent:-14.0pt;\">\r\n			<span><span style=\"font-size:14.0pt;\"><span>4</span></span><span style=\"font-size:14.0pt;font-family:宋体;\">、韭菜断生后，立即加入培根片，少许盐，糖调味，出锅装盘即可。</span></span> \r\n		</p>\r\n	</div>\r\n</div>', '', '0');
INSERT INTO `onethink_document_article` VALUES ('12', '0', '1236589443679', '', '0');
INSERT INTO `onethink_document_article` VALUES ('13', '0', '<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">尊敬的本来生活网华北站用户：</span><br />\r\n<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">10月19日，华北站配送范围将作出调整：</span><br />\r\n<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">1， 冷冻（藏）品将只配送北京、天津全境。</span><br />\r\n<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">2， 停止冷冻（藏）品其他区域的配送服务。</span><br />\r\n<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">3， 常温商品配送范围不变（7省市49城），具体范围详见： http://www.benlai.com/help-11.html</span><br />\r\n<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">我们将持续为您提供优质服务，并祝您购物愉快。</span><br />\r\n<span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:35px;\">本来生活网华北站 2014.10.17</span>', '', '0');
INSERT INTO `onethink_document_article` VALUES ('19', '0', '<h4 style=\"font-family:\'Lucida Grande\', Verdana, Helvetica, Arial, \'Microsoft YaHei\', Simsun, sans-serif;font-size:14px;font-weight:normal;color:#535353;background-color:#FFFFFF;\">\r\n	1、选择支付宝支付，点击立即支付\r\n</h4>\r\n<img src=\"/Uploads/Editor/2014-11-09/545e47e28bbc1.png\" alt=\"\" /><br />\r\n<span style=\"color:#535353;font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;background-color:#FFFFFF;\"></span>\r\n<h4 style=\"font-family:\'Lucida Grande\', Verdana, Helvetica, Arial, \'Microsoft YaHei\', Simsun, sans-serif;font-size:14px;font-weight:normal;color:#535353;background-color:#FFFFFF;\">\r\n	2、登录自己的支付宝帐号。(需要检测支付环境并安装控件)\r\n</h4>\r\n<img src=\"http://shop.vivo.com.cn/themes/vivo/images/vivo/helpcenter/pic_alipay_step_2.jpg\" /><span style=\"color:#535353;font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;background-color:#FFFFFF;\"></span>\r\n<h4 style=\"font-family:\'Lucida Grande\', Verdana, Helvetica, Arial, \'Microsoft YaHei\', Simsun, sans-serif;font-size:14px;font-weight:normal;color:#535353;background-color:#FFFFFF;\">\r\n	3、进入支付宝可以选择\"余额支付\"。（在支付宝账户余额不足未充值的情况下可以更改使用其他支付方式：快捷支付网银支付。）\r\n</h4>\r\n<img src=\"http://shop.vivo.com.cn/themes/vivo/images/vivo/helpcenter/pic_alipay_step_3.jpg\" />', '', '0');

-- ----------------------------
-- Table structure for `onethink_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of onethink_document_download
-- ----------------------------
INSERT INTO `onethink_document_download` VALUES ('2', '0', '<blockquote style=\"background-color:#F4F5F7;color:#999999;font-size:16px;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">\r\n	题，并作了大量的改进，是一个值得升级的版本！\r\n</blockquote>\r\n<img src=\"http://yun.topthink.com/Uploads/Editor/2014-07-22/53ce00d943be3.png\" alt=\"\" /><br />\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:18px;\"><span style=\"color:#E53333;\"><b>OneThink会一如既往的让你的开发变得更简单！</b></span></span><br />\r\n<br />\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\">1.1开发版本会保持快速迭代，欢迎大家多参与。</span><br />\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\"> \r\n<blockquote style=\"background-color:#F4F5F7;color:#999999;font-size:16px;\">\r\n	<b><span style=\"color:#E53333;\">注意：最新的开发版本数据库驱动用PDO重写了，所以如果之前配置的是PDO驱动类型的话，请改成具体的数据库类型。</span></b> \r\n</blockquote>\r\n</span><br />\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\">[&nbsp;更新列表&nbsp;]</span><br />\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\"><b><span style=\"font-size:18px;\"><b>1.1.140825_dev&nbsp;[2014.8.25]：</b></span></b></span><br />\r\n<ul style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;\">\r\n	<li>\r\n		安装SQL文件更新\r\n	</li>\r\n	<li>\r\n		修复七牛上传驱动的命名空间\r\n	</li>\r\n	<li>\r\n		修正数据库备份类\r\n	</li>\r\n	<li>\r\n		修正一些警告错误\r\n	</li>\r\n	<li>\r\n		修正模板大小写问题\r\n	</li>\r\n	<li>\r\n		修正导航的授权显示\r\n	</li>\r\n	<li>\r\n		更新数据库驱动\r\n	</li>\r\n	<li>\r\n		hooks表增加status字段，修正使用lists方法查询时的bug\r\n	</li>\r\n	<li>\r\n		支持无钩子的插件安装\r\n	</li>\r\n	<li>\r\n		改进菜单获取方法\r\n	</li>\r\n	<li>\r\n		优化菜单显示&nbsp;采用session缓存&nbsp;修改菜单后需要重启才能生效\r\n	</li>\r\n</ul>\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\"><b><span style=\"font-size:18px;\"><b>1.1.140817_dev&nbsp;[2014.8.17]：</b></span></b></span><br />\r\n<ul style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;\">\r\n	<li>\r\n		修正一些警告错误\r\n	</li>\r\n	<li>\r\n		修正后台封面图片上传的显示问题\r\n	</li>\r\n	<li>\r\n		后台生成模型的时候支持指定名称和标识\r\n	</li>\r\n	<li>\r\n		修正后台模型生成获取数据表的错误\r\n	</li>\r\n	<li>\r\n		支持更准确的SQL记录\r\n	</li>\r\n	<li>\r\n		修正参数绑定可能导致的冲突问题\r\n	</li>\r\n	<li>\r\n		修正安装程序用户表写入生日字段默认值错误\r\n	</li>\r\n	<li>\r\n		改进Admin模块的ModelModel类的generate方法\r\n	</li>\r\n	<li>\r\n		改进article:list标签的category属性可以包含当前分类\r\n	</li>\r\n	<li>\r\n		修正数据备份操作\r\n	</li>\r\n</ul>\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\"><b><span style=\"font-size:18px;\"><b>1.1.140809_dev&nbsp;[2014.8.9]：</b></span></b></span><br />\r\n<ul style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;\">\r\n	<li>\r\n		升级核心框架，驱动类库采用PDO重写\r\n	</li>\r\n	<li>\r\n		修正后台文档列表查询的状态查询问题\r\n	</li>\r\n	<li>\r\n		去掉后台BaseLogic类的lists方法\r\n	</li>\r\n	<li>\r\n		简化后台模块的DocumentModel类，去掉部分不需要的方法\r\n	</li>\r\n	<li>\r\n		改进文档模型的name标识检测&nbsp;根分类下面不能重名\r\n	</li>\r\n	<li>\r\n		独立模型数据列表页改进\r\n	</li>\r\n	<li>\r\n		Home模块的Logic类改进\r\n	</li>\r\n	<li>\r\n		修正模型的属性定义中使用函数定义的问题\r\n	</li>\r\n	<li>\r\n		模板调整和删除一些无用的数据\r\n	</li>\r\n</ul>\r\n<span style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;\"><b><span style=\"font-size:18px;\"><b>1.1.140726_dev&nbsp;[2014.7.26]：</b></span></b></span><br />\r\n<ul style=\"color:#333333;font-family:\'Century Gothic\', \'MicroSoft YaHei\', \'hiragino sans GB\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;\">\r\n	<li>\r\n		文档模型的扩展属性支持在属性管理中设置是否必须、自动验证和自动完成，并且会自动和对应的Logic类合并；\r\n	</li>\r\n	<li>\r\n		安装完成后的后台访问错误修正；\r\n	</li>\r\n	<li>\r\n		修正多处警告错误；\r\n	</li>\r\n</ul>', '', '1', '0', '23324');
INSERT INTO `onethink_document_download` VALUES ('3', '0', '<ul style=\"font-family:宋体, arial, sans-serif;color:#232426;background-color:#FFFFFF;\">\r\n	<li style=\"color:#777777;\">\r\n		上映年代：2014&nbsp;&nbsp;状态：全集\r\n	</li>\r\n	<li style=\"color:#777777;\">\r\n		类型：\r\n	</li>\r\n	<li style=\"color:#777777;\">\r\n		主演：<a href=\"http://www.beiwo.tv/index.php?s=vod-search-actor-%E6%B2%B3%E6%AD%A3%E5%AE%87.html\" target=\"_blank\">河正宇</a>&nbsp;<a href=\"http://www.beiwo.tv/index.php?s=vod-search-actor-%E5%A7%9C%E4%B8%9C%E5%85%83.html\" target=\"_blank\">姜东元</a>&nbsp;<a href=\"http://www.beiwo.tv/index.php?s=vod-search-actor-%E5%B0%B9%E6%99%BA%E6%85%A7.html\" target=\"_blank\">尹智慧</a>&nbsp;<a href=\"http://www.beiwo.tv/index.php?s=vod-search-actor-%E6%9D%8E%E7%92%9F%E8%8D%A3.html\" target=\"_blank\">李璟荣</a>\r\n	</li>\r\n	<li style=\"color:#777777;\">\r\n		地区：韩国<img src=\"/111/Uploads/Editor/2014-09-18/5419eb8071136.png\" alt=\"\" />\r\n	</li>\r\n	<li style=\"color:#777777;\">\r\n		更新日期：2014-09-08&nbsp;&nbsp;\r\n	</li>\r\n</ul>\r\n<p>\r\n	剧情： 描绘了19世纪朝鲜时代抢夺贪官污吏钱财救济百姓们的侠盗与士大夫们之间的对决。...<a href=\"http://www.beiwo.tv/vod/21258/#desc\">详细剧情</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '2', '0', '206166');

-- ----------------------------
-- Table structure for `onethink_document_product`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_product`;
CREATE TABLE `onethink_document_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `price` varchar(255) NOT NULL DEFAULT '1.00' COMMENT '价格',
  `content` text NOT NULL COMMENT '内容详细描述',
  `weight` varchar(255) NOT NULL DEFAULT '500' COMMENT '净重',
  `totalsales` int(10) unsigned NOT NULL COMMENT '总销量',
  `area` varchar(255) NOT NULL DEFAULT '中国大陆' COMMENT '产地',
  `ads_pic_id` int(10) unsigned NOT NULL COMMENT '首页幻灯大图',
  `adtitle` varchar(255) NOT NULL COMMENT '广告宣传标题',
  `yprice` varchar(255) NOT NULL COMMENT '原价',
  `mark` varchar(255) NOT NULL COMMENT '附加标签',
  `unionid` varchar(255) NOT NULL COMMENT '关联商品',
  `stock` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '库存',
  `shorttitle` varchar(255) NOT NULL COMMENT '商品简称',
  `pics` varchar(255) NOT NULL COMMENT '图集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_document_product
-- ----------------------------
INSERT INTO `onethink_document_product` VALUES ('5', '20.98', '<p style=\"background:white;text-align:left;\" align=\"left\">\r\n	<br />\r\n</p>\r\n<span><span style=\"font-size:14.0pt;font-family:宋体;\"></span></span>\r\n<p style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#333333;\">\r\n	<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47\" />\r\n</p>\r\n<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<img src=\"http://image3.benlailife.com/ProductNewDetailImage/0102021623C/025.jpg\" style=\"width:700px;\" />\r\n	<div class=\"tal\" style=\"text-align:left;\">\r\n		&nbsp;\r\n	</div>\r\n<img src=\"http://image3.benlailife.com/ProductNewDetailImage/0102021623C/01p.jpg\" style=\"width:700px;\" />\r\n	<div class=\"tal\" style=\"text-align:left;\">\r\n		&nbsp;\r\n	</div>\r\n<img src=\"http://image3.benlailife.com/ProductNewDetailImage/0102021623C/93p.jpg\" style=\"width:700px;\" />\r\n</div>\r\n<br />', '500', '15', '中国大陆', '8', '迷你清甜 入口有芒果和草莓的清香', '', '2', '8,9', '1', '', '');
INSERT INTO `onethink_document_product` VALUES ('14', '1.00', '<div class=\"box990\" id=\"layoutContent\" style=\"margin:0px auto;padding:0px;border:none;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<div class=\"zt_gz\" id=\"container\" style=\"margin:0px;padding:0px;border:none;background-color:#FFFFFF;\">\r\n		<div class=\"gz_banner carousel\" id=\"fader_container\" style=\"margin:0px;padding:0px;border:none;\">\r\n			<ul class=\"main contents\" id=\"fader\" style=\"vertical-align:bottom;\">\r\n				<li class=\"list content\" id=\"toLegend\" style=\"vertical-align:bottom;\">\r\n					<a><img src=\"http://image.benlailife.com/images/gz/special/chucheng/lunbo03.jpg\" /></a> \r\n				</li>\r\n			</ul>\r\n			<ul class=\"fader_nav\" style=\"vertical-align:bottom;\">\r\n				<li class=\"list\" id=\"prev\" style=\"vertical-align:bottom;\">\r\n				</li>\r\n				<li class=\"list\" id=\"next\" style=\"vertical-align:bottom;\">\r\n				</li>\r\n			</ul>\r\n			<ul class=\"main cc_nav\" id=\"nav\" style=\"vertical-align:bottom;\">\r\n				<li class=\"list\" style=\"vertical-align:bottom;\">\r\n					<a><img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_01_on.jpg\" /></a> \r\n				</li>\r\n				<li class=\"list\" style=\"vertical-align:bottom;\">\r\n					<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_02.jpg\" /> \r\n				</li>\r\n				<li class=\"list\" style=\"vertical-align:bottom;\">\r\n					<a><img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_03.jpg\" /></a> \r\n				</li>\r\n			</ul>\r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;border:none;\">\r\n			<div class=\"sku\" style=\"margin:0px;padding:0px;border:none;\">\r\n				<ul class=\"main\" id=\"sale\" style=\"vertical-align:bottom;\">\r\n					<li class=\"zcode list relative\" style=\"vertical-align:bottom;\">\r\n						<a href=\"http://www.benlai.com/item-39458.html\" target=\"_blank\"><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_02.jpg\" /></a><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_03.jpg\" /> \r\n						<div class=\"cc_buy button right\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"39458_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list relative\" style=\"vertical-align:bottom;\">\r\n						<a href=\"http://www.benlai.com/item-39459.html\" target=\"_blank\"><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_04.jpg\" /></a><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_05.jpg\" /> \r\n						<div class=\"cc_buy button left\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"39459_addCart\" /> \r\n						</div>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n			<div class=\"cc_des\" style=\"margin:0px;padding:0px;border:none;\">\r\n				<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/shps.jpg\" width=\"990\" height=\"450\" /><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_06.jpg\" /><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_07.jpg\" /><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_08.jpg\" /><img class=\"cc_section\" src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_10.jpg\" /> \r\n			</div>\r\n			<div class=\"sku cc_sp_shop\" style=\"margin:0px;padding:0px;border:none;background-color:#F49626;\">\r\n				<p class=\"title\">\r\n					<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/spt_12.jpg\" /> \r\n				</p>\r\n				<div class=\"cframe\" style=\"margin:0px 20px 20px;padding:0px;border:none;\">\r\n					<ul class=\"sp_nav\" style=\"vertical-align:bottom;\">\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/ytl_on.jpg\" /> \r\n						</li>\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/zxg.jpg\" /> \r\n						</li>\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/sml.jpg\" /> \r\n						</li>\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/sn.jpg\" /> \r\n						</li>\r\n					</ul>\r\n					<ul class=\"contents\" style=\"vertical-align:bottom;background-color:#FFFFFF;\">\r\n						<li class=\"list content relative page\" style=\"vertical-align:bottom;\">\r\n							<a href=\"http://www.benlai.com/item-37672.html\" target=\"_blank\"><img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/p1.jpg\" /></a> \r\n							<div class=\"ft_buy\" style=\"margin:0px;padding:0px;border:none;\">\r\n								<ul class=\"select_box\" style=\"vertical-align:bottom;\">\r\n									<li class=\"list button\" style=\"vertical-align:bottom;\">\r\n										<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/2p_on.jpg\" /> \r\n									</li>\r\n									<li class=\"list button\" style=\"vertical-align:bottom;\">\r\n										<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/4p.jpg\" /> \r\n									</li>\r\n								</ul>\r\n								<ul class=\"shop_box\" style=\"vertical-align:bottom;\">\r\n									<li class=\"list\" style=\"vertical-align:bottom;\">\r\n										<p class=\"price p_rose\" style=\"font-family:\'Microsoft YaHei\';font-size:24px;color:#F83A5E;\">\r\n											￥11.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;\">￥20.00</span> \r\n										</p>\r\n										<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n											<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"37672_addCart\" /> \r\n										</div>\r\n									</li>\r\n									<li class=\"list\" style=\"vertical-align:bottom;\">\r\n										<p class=\"price p_rose\" style=\"font-family:\'Microsoft YaHei\';font-size:24px;color:#F83A5E;\">\r\n											￥18.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;\">￥40.00</span> \r\n										</p>\r\n										<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n											<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"36937_addCart\" /> \r\n										</div>\r\n									</li>\r\n								</ul>\r\n							</div>\r\n						</li>\r\n					</ul>\r\n				</div>\r\n			</div>\r\n			<div class=\"sku\" style=\"margin:0px 0px 60px;padding:0px;border:none;\">\r\n				<ul class=\"main\" style=\"vertical-align:bottom;\">\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-39442.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							新疆姬娜果4粒装（单果重90-100g）\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥5.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥10.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"39442_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-27683.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							进口牛油果 4粒\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥35.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥78.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"27683_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-10432.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							台湾红宝石葡萄柚\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥28.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥38.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"10432_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-15307.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							浙江涌泉蜜桔 1.7-1.9kg\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥38.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥55.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"15307_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-38262.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							四川红阳红心猕猴桃（小果） 8粒装\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥28.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥36.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"38262_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6536.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							爽口源兰州百合150g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥18.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥19.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6536_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6682.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来精选——云南鲜毛豆 400g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥10.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥14.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6682_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-8533.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							陈集山药（鸡皮糙）500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥15.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥16.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"8533_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-27.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							斋堂鲜蘑菇拼盘\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥17.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"27_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-3153.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来精选——绿芦笋300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥20.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥23.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"3153_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-15656.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							OMEGA 新西兰青口贝 1000g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥49.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥78.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"15656_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-19587.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							原装进口厄瓜多尔白虾50/60 2000g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥168.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥268.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"19587_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-19889.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来专供 速冻阿拉斯加真鳕切身 （生制）500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥39.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥62.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"19889_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-25845.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							【独家销售】南极磷虾 500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥18.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥25.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"25845_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-4758.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							九洋无公害生态深海养殖 三去大黄鱼 450g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥36.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥49.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"4758_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6246.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							林地散养柴鸡蛋24枚\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥35.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥42.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6246_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-9209.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							Kerchin科尔沁肉筋 500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥29.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥35.90</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"9209_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-32393.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							华北小笋鸡250g-350g*2\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥15.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥43.60</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"32393_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-25437.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							荷美尔出口备案冻前尖500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥19.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥26.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"25437_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-7926.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							Kerchin科尔沁肥牛 400克\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥36.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥51.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"7926_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-38159.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							【特别推荐】云南艾爱全脂巴氏水牛乳500ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥9.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥22.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"38159_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-37167.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							贝儿榴莲飘香蛋糕330g-家庭装\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥49.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"37167_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-7444.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							百吉福棒棒奶酪（原味）500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥48.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥59.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"7444_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-15775.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							红炉磨坊葡萄干核桃面包（粗粮） 300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥23.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥27.60</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"15775_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-793.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							万得妙含糖酸牛奶500ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥11.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥15.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"793_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-719.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							伯爵特级初榨橄榄油500ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥69.50<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"719_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6690.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来生活有机红小豆（红豆）360g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥9.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥12.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"6690_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-24389.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							响中王响水村自产大米2500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥82.50<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"24389_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-4048.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							竹里馆临安特产天目山野生石笋干250g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥25.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"4048_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-33796.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							长白山黑木耳125g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥21.50<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥28.50</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"33796_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-4159.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							广东温氏好味鸡咸香盐焗鸡600g-800g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥33.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥52.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"4159_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-28102.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							百饺园家常猪肉三鲜水饺300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥13.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥17.20</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"28102_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-23882.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							荷美尔Hormel 超值鲜嫩火腿片135g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥14.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"23882_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-21778.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							乐世小厨培根抓饼精装5片600g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥10.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥17.90</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"21778_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-25866.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							天福号 蛋卷300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥12.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥19.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"25866_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-16606.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							德国迈森蜂蜜小栈纯蜂蜜—洋槐花蜂蜜500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥63.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥126.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"16606_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-19891.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							阿鲁司滇红茶15g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥8.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥23.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"19891_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-10542.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							法国（巴黎）含气柠檬味饮料330ml*4\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥32.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥48.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"10542_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6883.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							澳洲奔富酒园洛神山庄梅洛红葡萄酒750ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥49.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥98.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"6883_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-22336.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							KEO凯莉欧100%橙汁1L(塞浦路斯进口) 真正纯橙汁\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥11.40<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥22.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"22336_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-35043.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							7Best大象芒果干100g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥12.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"35043_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-24780.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							吃货榴莲干90g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							<img src=\"http://image1.benlailife.com/Content/images/no2.gif?v=8.2.47\" /><span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"24780_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6739.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							昆仑山和田玉枣六星 500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥64.30<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6739_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-21306.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							阿胶金丝枣180g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥12.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"21306_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-21304.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							桃花姬阿胶糕300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥119.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥158.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"21304_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<div>\r\n							<br />\r\n						</div>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '500', '0', '中国大陆', '18', '待编辑', '', '', '', '1', '褚橙', '');
INSERT INTO `onethink_document_product` VALUES ('8', '10.00', '<div id=\"J_DcTopRightWrap\" style=\"margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;\">\r\n	<div id=\"J_DcTopRight\" class=\"J_DcAsyn tb-shop\" style=\"margin:0px;padding:0px;\">\r\n		<div class=\"J_TModule\" id=\"shop8751140001\" style=\"margin:0px;padding:0px;\">\r\n			<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"margin:0px;padding:0px;\">\r\n				<div class=\"skin-box-bd clear-fix\" style=\"margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;\">\r\n					<span> \r\n					<p>\r\n						<img src=\"http://img03.taobaocdn.com/imgextra/i3/738580955/TB2oT.ZapXXXXaxXXXXXXXXXXXX-738580955.jpg_.webp\" /> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class=\"skin-box-bt\"><b></b></s> \r\n			</div>\r\n		</div>\r\n		<div class=\"J_TModule\" id=\"shop8825085575\" style=\"margin:0px;padding:0px;\">\r\n			<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"margin:0px;padding:0px;\">\r\n				<s class=\"skin-box-tp\"><b></b></s> \r\n				<div class=\"skin-box-bd clear-fix\" style=\"margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;\">\r\n					<span> \r\n					<p>\r\n						<a href=\"http://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.UoC3cM&id=35904185523&scene=taobao_shop\" target=\"_blank\"><img src=\"http://img03.taobaocdn.com/imgextra/i3/738580955/TB2AEVlaFXXXXbOXXXXXXXXXXXX-738580955.jpg_.webp\" /></a> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class=\"skin-box-bt\"><b></b></s> \r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div id=\"description\" class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" style=\"margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;\">\r\n	<div class=\"content ke-post\" style=\"margin:10px 0px 0px;padding:0px;font-size:14px;font-family:tahoma, arial, 宋体, sans-serif;\">\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span><span style=\"font-weight:700;\"><span style=\"font-size:18px;\">智利青苹果</span></span><br />\r\n</span> \r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<p>\r\n				<span><span style=\"font-weight:700;\"><img class=\"ke_anchor\" id=\"ids-tag-m-35171\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"height:1px;\" />产品简介</span><br />\r\n智利苹果色泽艳丽，颜色从青绿到浅绿都有，也可能会略带粉红色。口感上则相当酸，是喜欢酸味朋友们的大爱，爽脆多汁，口味鲜美，吃法较多。&nbsp;</span> \r\n			</p>\r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span><span style=\"font-weight:700;\">温馨提示</span><br />\r\n</span> \r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span>此款产地为智利。</span> \r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span>冰箱冷藏保存时间会更久，保存时表皮不要沾水。苹果皮中含有丰富营养素，建议连皮一起吃。</span> \r\n			<p>\r\n				<img align=\"absmiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/738580955/T2zOhCXfdOXXXXXXXX-738580955.jpg\" /><img align=\"absmiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/738580955/T2Zz1aXXtdXXXXXXXX-738580955.jpg\" /><img align=\"absmiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/738580955/T2VPCuXc4cXXXXXXXX-738580955.jpg\" /><img align=\"absmiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/738580955/T2ZwXBXl8NXXXXXXXX-738580955.jpg\" /> \r\n			</p>\r\n			<p>\r\n				<img align=\"absmiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/738580955/T2MmJyXi0OXXXXXXXX-738580955.jpg_.webp\" /><img class=\"ke_anchor\" id=\"ids-tag-m-35173\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"height:1px;\" /><img align=\"absmiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/738580955/T2yn4DXj8OXXXXXXXX-738580955.jpg_.webp\" /> \r\n			</p>\r\n		</div>\r\n		<p>\r\n			<img class=\"ke_anchor\" id=\"ids-tag-m-35176\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"height:1px;\" /><img align=\"absmiddle\" src=\"http://img03.taobaocdn.com/imgextra/i3/738580955/T28tdGXd0OXXXXXXXX-738580955.jpg_.webp\" /> \r\n		</p>\r\n	</div>\r\n</div>', '500', '11', '中国大陆', '16', '正宗进口青苹果水果酸甜新鲜水果', '', '', '', '1', '智利青苹果12个', '');
INSERT INTO `onethink_document_product` VALUES ('9', '5.00', '<h2 align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	配送范围：目前江浙沪（其他城市或者偏远乡镇村目前不配送，谢谢）\r\n</h2>\r\n<p align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://gd1.alicdn.com/imgextra/i1/595478579/T2gtbxXINaXXXXXXXX_!!595478579.jpg\" /> \r\n</p>\r\n<p align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://gd2.alicdn.com/imgextra/i2/595478579/T2yOPCXKFaXXXXXXXX_!!595478579.jpg\" /><img src=\"http://gd3.alicdn.com/imgextra/i3/595478579/T2S52CXMlaXXXXXXXX_!!595478579.jpg\" /><img src=\"http://gd3.alicdn.com/imgextra/i3/595478579/T2XmrCXLNaXXXXXXXX_!!595478579.jpg\" /> \r\n</p>\r\n<p align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://gd3.alicdn.com/imgextra/i3/595478579/T2poTvXMpaXXXXXXXX_!!595478579.jpg\" /> \r\n</p>', '500', '0', '中国大陆', '10', '常鲜生 菲律宾进口香蕉 都乐香蕉 新鲜水果 整箱批发', '', '', '', '1', '菲律宾进口香蕉', '');
INSERT INTO `onethink_document_product` VALUES ('15', '1.00', '<div class=\"detl_property\" style=\"margin:20px 0px;\">\r\n	<p style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#333333;\">\r\n		<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit01.gif?v=8.2.47\" /> \r\n	</p>\r\n	<div class=\"detl_com\">\r\n		<div class=\"detl_form\">\r\n			品名：河南河阴软籽石榴 4粒装（单果重250-300g）规格：250-300g\r\n		</div>\r\n		<div class=\"detl_pic\">\r\n			<img src=\"http://image4.benlailife.com/ProductImage/0102022270C.jpg\" style=\"width:340px;\" /> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"detl_feature\" style=\"margin:20px 0px 0px;\">\r\n	<a name=\"sublist01\"></a> \r\n	<p style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#333333;\">\r\n		<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47\" /> \r\n	</p>\r\n	<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;\">\r\n		<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102022270C/22p.jpg\" style=\"width:700px;\" /><span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:normal;\"></span> \r\n		<div class=\"tal\" style=\"text-align:left;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n			<br />\r\n		</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102022270C/56p.jpg\" style=\"width:700px;\" /><span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:normal;\"></span> \r\n		<div class=\"tal\" style=\"text-align:left;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n			<br />\r\n		</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102022270C/18p.jpg\" style=\"width:700px;\" /><span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:normal;\"></span> \r\n	</div>\r\n	<div>\r\n		<br />\r\n	</div>\r\n</div>', '500', '0', '中国大陆', '0', '', '', '', '', '1', '河南河阴软籽石榴', '');
INSERT INTO `onethink_document_product` VALUES ('16', '100.00', '<div class=\"detail_n\" style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<div class=\"detail_tab\">\r\n		<h2 class=\"tith2\" id=\"navList\" style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">\r\n			<br />\r\n		</h2>\r\n		<div class=\"dtl_btn\" style=\"text-align:right;\">\r\n			<a class=\"buy_btn\" id=\"nav_buy_btn\"><span><span>￥</span>28.00</span></a> \r\n		</div>\r\n	</div>\r\n	<div class=\"detl_content\">\r\n		<div class=\"detl_property\" style=\"margin:20px 0px;\">\r\n			<p>\r\n				<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit01.gif?v=8.2.47\" /> \r\n			</p>\r\n			<div class=\"detl_com\">\r\n				<div class=\"detl_form\">\r\n					品名：佳沃智利进口蓝莓一级果125g规格：125g温馨提示：蓝莓果实为浆果型，耐贮性较强，最佳保存温度为1 ~ 3°C。要吃新鲜蓝莓不可置入0°C以下的冷藏库。 不建议水洗入冰箱，因为水份很容易使蓝莓腐烂。\r\n				</div>\r\n				<div class=\"detl_pic\">\r\n					<img src=\"http://image3.benlailife.com/ProductImage/0102022311C.jpg\" style=\"width:340px;\" /> \r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class=\"detl_feature\" style=\"margin:20px 0px 0px;\">\r\n			<a name=\"sublist01\"></a> \r\n			<p>\r\n				<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47\" /> \r\n			</p>\r\n			<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;\">\r\n				<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/001.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/002.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/003.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/004.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/005.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/006.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/006.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/008.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class=\"detl_feature\" style=\"margin:20px 0px 0px;\">\r\n			<a name=\"sublist04\"></a> \r\n			<p>\r\n				<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit05.gif?v=8.2.47\" /> \r\n			</p>\r\n			<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;\">\r\n				<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/009.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class=\"detl_service\" style=\"margin:20px 0px 0px;\">\r\n			<a name=\"sublist05\"></a> \r\n			<p>\r\n				<img width=\"760\" height=\"42\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit06.gif?v=8.2.47\" /> \r\n			</p>\r\n			<div class=\"detl_tab\">\r\n				<a class=\"detl_tab01on\">&nbsp;</a><a class=\"detl_tab02\">&nbsp;</a><a class=\"detl_tab03\">&nbsp;</a><a class=\"detl_tab04\">&nbsp;</a><a class=\"detl_tab05 m0\">&nbsp;</a> \r\n			</div>\r\n			<div class=\"detl_com\" style=\"padding:19px;margin-left:20px;\">\r\n				<p>\r\n					<img width=\"680\" height=\"200\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_service0101.jpg?v=8.2.47\" /><img width=\"680\" height=\"228\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_service0102.jpg?v=8.2.47\" /><img width=\"680\" height=\"450\" src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_service0103.jpg?v=8.2.47\" /> \r\n				</p>\r\n				<div>\r\n					<br />\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '500', '0', '中国大陆', '0', '', '', '', '', '1', '佳沃智利进口蓝莓', '');
INSERT INTO `onethink_document_product` VALUES ('17', '100.00', '<div class=\"gdtit\" style=\"font-size:16px;color:#333333;font-weight:bold;font-family:Arial;margin-left:15px;\">\r\n	<h1 id=\"Product_ProductDetailsName\" style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;font-size:16px;\">\r\n		新疆红提950-1000g\r\n	</h1>\r\n</div>\r\n<p class=\"goods_gdmis2 pdl15\" style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#F08B0C;\">\r\n	新疆特受欢迎的葡萄品种。\r\n</p>', '500', '0', '中国大陆', '0', '', '', '', '', '1', '新疆红提950-1000g', '');
INSERT INTO `onethink_document_product` VALUES ('18', '19.00', '<div class=\"dtl_commodity\" style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<span style=\"font-size:30px;color:#669934;line-height:55px;\">皮薄、肉脆、汁多、酥香的新疆香梨</span> \r\n	<p style=\"color:#666666;background-color:#F8F8F8;\">\r\n		产自新疆天山南麓“梨乡”库尔勒，香气浓郁，皮薄肉细，酥脆爽口。这样的梨吃起来，不仅是味觉上的享受，也是帮助身体滋润的一剂良药。\r\n	</p>\r\n</div>\r\n<div class=\"dtl718\" style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<div class=\"dtl_title\" style=\"font-size:18px;color:#669934;\">\r\n		商品介绍\r\n	</div>\r\n	<div class=\"dtl_infortu\">\r\n		<img alt=\"\" src=\"http://image1.benlailife.com/ProductDetailImage/0102020673C/001.jpg\" style=\"width:700px;\" /> \r\n	</div>\r\n	<div class=\"dtl_infor_top\" style=\"margin:0px;\">\r\n		<p style=\"color:#666666;\">\r\n			<strong><span style=\"font-size:14px;\">来自新疆梨乡的“奶西姆提”</span></strong><br />\r\n新疆巴音郭楞蒙古自治州北部的天山南麓，有一个肥沃的绿州名字叫库尔勒。这里出产的香梨远近闻名，素有“梨乡”之美称。库尔勒香梨在维吾尔语中叫做“奶西姆提”，因为营养价值丰富，印度人称它是“中国的王子”。\r\n		</p>\r\n	</div>\r\n	<div class=\"dtl_infortu\">\r\n		<img alt=\"\" src=\"http://image2.benlailife.com/ProductDetailImage/0102020673C/002.jpg\" style=\"width:700px;\" /> \r\n	</div>\r\n	<div class=\"dtl_infor_top\" style=\"margin:0px;\">\r\n		<p style=\"color:#666666;\">\r\n			<strong><span style=\"font-size:14px;\">香而清甜，虽小却极好吃</span></strong><br />\r\n库尔勒香梨个头不算大，但香气浓郁，皮薄肉细，酥脆爽口，汁多渣少。假如你以前不识此梨，尝下去的第一口，它一定能给你“竟这样好吃”的惊喜感。\r\n		</p>\r\n	</div>\r\n	<div class=\"dtl_infortu\">\r\n		<img alt=\"\" src=\"http://image.benlailife.com/ProductDetailImage/0102020673C/003.jpg\" style=\"width:700px;\" /> \r\n	</div>\r\n</div>', '500', '0', '中国大陆', '0', '新疆库尔勒香梨 ', '', '', '', '1', '新疆库尔勒香梨 ', '');

-- ----------------------------
-- Table structure for `onethink_favortable`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_favortable`;
CREATE TABLE `onethink_favortable` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `goodid` int(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `num` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of onethink_favortable
-- ----------------------------
INSERT INTO `onethink_favortable` VALUES ('13', '1', '8', '2014-10-22 19:14:47', '1');
INSERT INTO `onethink_favortable` VALUES ('14', '1', '9', '2014-10-25 01:16:34', '1');
INSERT INTO `onethink_favortable` VALUES ('15', '1', '14', '2014-10-27 00:48:30', '1');
INSERT INTO `onethink_favortable` VALUES ('16', '1', '41', '2014-11-03 03:00:02', '1');
INSERT INTO `onethink_favortable` VALUES ('17', '1', '17', '2014-11-12 18:09:26', '1');

-- ----------------------------
-- Table structure for `onethink_fcoupon`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_fcoupon`;
CREATE TABLE `onethink_fcoupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `price` varchar(50) NOT NULL COMMENT '金额',
  `code` varchar(255) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` int(4) DEFAULT NULL COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `ismenu` int(11) DEFAULT NULL COMMENT '无限极分类调用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_fcoupon
-- ----------------------------
INSERT INTO `onethink_fcoupon` VALUES ('1', '645645', '肯德基', '0', '0', '10', '30', '6fsgwcjf', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', '', '1414012468', '1415716837', '1', '5', null);
INSERT INTO `onethink_fcoupon` VALUES ('2', '645465', '麦当劳', '0', '0', '10', '6644', '453ljnq7', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', '', '1414012758', '1414174944', '1', '11', null);
INSERT INTO `onethink_fcoupon` VALUES ('3', '64645', '麦考林', '0', '0', '10', '656', '4nm34itt', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', '', '1414012817', '1414175369', '1', '14', null);
INSERT INTO `onethink_fcoupon` VALUES ('4', '564456', '小肥羊', '0', '0', '10', '65445', 'chmvc29z', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', '', '1414012977', '1414174856', '1', '12', null);
INSERT INTO `onethink_fcoupon` VALUES ('5', '', '必胜客', '0', '0', '10', '50', '2xs1rdw0', '', '', '', '', '', '', '', '', '0', '0', '1', '0', '0', '', '', '1414174826', '1414174826', '1', '13', null);

-- ----------------------------
-- Table structure for `onethink_file`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of onethink_file
-- ----------------------------
INSERT INTO `onethink_file` VALUES ('1', 'yunwuxin-ThinkPay-master.zip', '5405e116b5a4e.zip', '2014-09-02/', 'zip', 'application/octet-stream', '23324', '1565d08c019b3958b1767bd8970f9f2c', '130d04a2ec9800243dc324b6ddce53f9c2c69e35', '0', '', '1409671446');
INSERT INTO `onethink_file` VALUES ('2', '14552934C-0.jpg', '5419eb9223a5f.jpg', '2014-09-18/', 'jpg', 'application/octet-stream', '206166', '66b8f2a751472d0de3b1c86c20be9949', '323183b6c93f2f5031daa8a47f2da0c3f362e3b7', '0', '', '1410984849');

-- ----------------------------
-- Table structure for `onethink_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_hooks
-- ----------------------------
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', 'ThirdLogin', '1');
INSERT INTO `onethink_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `onethink_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `onethink_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment', '1');
INSERT INTO `onethink_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `onethink_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `onethink_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `onethink_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `onethink_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `onethink_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `onethink_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');
INSERT INTO `onethink_hooks` VALUES ('26', 'Template', '模版管理插件钩子', '1', '1415711535', 'Template', '1');
INSERT INTO `onethink_hooks` VALUES ('23', 'SyncLogin', '第三方账号同步登陆', '1', '1412762818', 'SyncLogin', '1');

-- ----------------------------
-- Table structure for `onethink_iswork`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_iswork`;
CREATE TABLE `onethink_iswork` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(225) CHARACTER SET utf8 NOT NULL,
  `time` varchar(225) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '1-未使用 2-已使用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of onethink_iswork
-- ----------------------------
INSERT INTO `onethink_iswork` VALUES ('18', '1', '14189089729', '1');
INSERT INTO `onethink_iswork` VALUES ('22', '1', '1414090388', '1');
INSERT INTO `onethink_iswork` VALUES ('23', '1', '1415541071', '1');

-- ----------------------------
-- Table structure for `onethink_listtmp`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_listtmp`;
CREATE TABLE `onethink_listtmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `url` text CHARACTER SET utf8 NOT NULL,
  `source` text CHARACTER SET utf8 NOT NULL,
  `sourceurl` text CHARACTER SET utf8 NOT NULL,
  `dates` int(10) NOT NULL,
  `st` int(1) NOT NULL,
  `zt` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of onethink_listtmp
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_login`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_login`;
CREATE TABLE `onethink_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `type_uid` varchar(255) NOT NULL COMMENT '授权登陆用户名 第三方分配的appid',
  `type` char(80) NOT NULL COMMENT '登陆类型 qq|sina',
  `oauth_token` varchar(150) DEFAULT NULL COMMENT '授权账号',
  `oauth_token_secret` varchar(150) DEFAULT NULL COMMENT '授权密码',
  PRIMARY KEY (`login_id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_login
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `address` varchar(225) DEFAULT NULL,
  `cellphone` varchar(225) DEFAULT NULL,
  `position` varchar(225) DEFAULT NULL,
  `realname` varchar(225) DEFAULT NULL,
  `youbian` varchar(225) DEFAULT NULL,
  `lever` varchar(225) DEFAULT 'lv1 ',
  `iswors` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of onethink_member
-- ----------------------------
INSERT INTO `onethink_member` VALUES ('1', '123', '30', '1900-00-00', '1010422715', '360', '473', '2130706433', '1413206453', '1711150690', '1415894461', '1', '654564', '2221231', '5564', '564564', '', 'lv1', null);
INSERT INTO `onethink_member` VALUES ('2', '111', '0', '0000-00-00', '', '10', '1', '2102927650', '1415144674', '2102927650', '1415144674', '1', null, null, null, null, null, 'lv1 ', null);
INSERT INTO `onethink_member` VALUES ('3', '456', '0', '0000-00-00', '', '10', '1', '977127693', '1415145053', '977127693', '1415145053', '1', null, null, null, null, null, 'lv1 ', null);
INSERT INTO `onethink_member` VALUES ('4', '12311231', '0', '0000-00-00', '', '10', '1', '2102927650', '1415178697', '2102927650', '1415178697', '1', null, null, null, null, null, 'lv1 ', null);
INSERT INTO `onethink_member` VALUES ('5', '8898', '0', '0000-00-00', '', '10', '1', '1903661226', '1415486409', '1903661226', '1415486409', '1', null, null, null, null, null, 'lv1 ', null);
INSERT INTO `onethink_member` VALUES ('6', '88988', '0', '0000-00-00', '', '10', '1', '1903661226', '1415486499', '1903661226', '1415486499', '1', null, null, null, null, null, 'lv1 ', null);

-- ----------------------------
-- Table structure for `onethink_menu`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_menu
-- ----------------------------
INSERT INTO `onethink_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('2', '内容', '0', '4', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `onethink_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `onethink_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('16', '用户', '0', '5', 'User/index', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('150', '首页统计', '146', '20', 'Lookup/index', '0', '', '访问统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('43', '扩展', '0', '6', 'Addons/index', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `onethink_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `onethink_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '0', '网站属性配置。', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('68', '系统', '0', '2', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `onethink_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `onethink_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `onethink_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('135', '已发货订单', '131', '2', 'Ordertransport/index', '0', '', '订单管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('134', '优惠券', '16', '4', 'Fcoupon/index', '0', '', '优惠券管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('131', '订单', '0', '3', 'Order/index', '0', '', '', '0', '1');
INSERT INTO `onethink_menu` VALUES ('132', '已提交订单', '131', '1', 'Order/index', '0', '', '订单管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('133', '已签收订单', '131', '3', 'Ordercomplete/index', '0', '', '订单管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('137', '正退货订单', '131', '6', 'Back/index', '0', '', '退货管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('141', '同意换货商品', '131', '10', 'Changeagree/index', '0', '', '换货管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('138', '同意退货订单', '131', '7', 'Backagree/index', '0', '', '退货管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('139', '已退货订单', '131', '8', 'Backover/index', '0', '', '退货管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('140', '正换货商品', '131', '9', 'Change/index', '0', '', '换货管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('142', '已换货商品', '131', '12', 'Changeover/index', '0', '', '换货管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('143', '今日销量统计', '146', '13', 'Statistics/index', '0', '', '数据统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('144', '本周销量统计', '146', '14', 'Statistics/week', '0', '', '数据统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('145', '本月销量统计', '146', '15', 'Statistics/month', '0', '', '数据统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('146', '数据', '0', '4', 'Statistics/index', '0', '', '数据统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('147', '每日数据', '146', '16', 'Report/index', '0', '', '报表统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('148', '每周数据', '146', '17', 'Report/week', '0', '', '报表统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('149', '每月统计', '146', '18', 'Report/month', '0', '', '报表统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('151', '栏目页统计', '146', '23', 'Lookup/category', '0', '', '访问统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('152', '内容页统计', '146', '24', 'Lookup/article', '0', '', '访问统计', '0', '1');
INSERT INTO `onethink_menu` VALUES ('153', '申请取消的订单', '131', '0', 'Cancel/index', '0', '', '取消管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('154', '拒绝的订单', '131', '0', 'Cancelrefuse/index', '0', '', '取消管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('155', '同意取消的订单', '131', '0', 'Cancelagree/index', '0', '', '取消管理', '0', '1');
INSERT INTO `onethink_menu` VALUES ('156', '已支付的订单', '131', '0', 'Pay/index', '0', '', '支付管理', '0', '1');

-- ----------------------------
-- Table structure for `onethink_model`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of onethink_model
-- ----------------------------
INSERT INTO `onethink_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1413845425', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('5', 'product', '商品', '1', '', '1', '{\"1\":[\"47\",\"3\",\"12\",\"36\",\"46\",\"44\",\"43\",\"37\",\"35\",\"39\"],\"2\":[\"2\",\"41\",\"49\",\"40\",\"9\",\"10\",\"42\",\"13\",\"14\",\"5\",\"16\",\"20\",\"38\",\"11\",\"17\",\"19\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:', '10', '', '', '1411375498', '1415713123', '1', 'MyISAM');

-- ----------------------------
-- Table structure for `onethink_order`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_order`;
CREATE TABLE `onethink_order` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(225) DEFAULT NULL,
  `pricetotal` decimal(50,2) NOT NULL DEFAULT '0.00',
  `ptime` int(225) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-系统生成完成1-用户已提交订单2-3系统处理进入物流配送',
  `assistant` varchar(225) DEFAULT '无' COMMENT '操作人',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(225) DEFAULT NULL,
  `shipprice` decimal(50,2) DEFAULT NULL,
  `display` int(12) DEFAULT '1',
  `isover` varchar(225) DEFAULT NULL,
  `ispay` int(11) DEFAULT NULL COMMENT '1在线支付未完成2在线支付完成3-货到付款',
  `total` decimal(50,2) DEFAULT NULL,
  `tool` varchar(225) DEFAULT NULL COMMENT '是否默认地址',
  `addressid` int(225) DEFAULT NULL,
  `toolid` varchar(225) DEFAULT NULL,
  `isdefault` int(11) NOT NULL,
  `info` varchar(225) DEFAULT NULL,
  `backinfo` varchar(225) DEFAULT NULL,
  `score` int(225) DEFAULT NULL,
  `codeid` int(11) DEFAULT NULL,
  `act_service` varchar(225) DEFAULT NULL COMMENT '退货',
  `act_change` varchar(225) DEFAULT NULL COMMENT '售后',
  `act_backmoney` varchar(225) DEFAULT NULL COMMENT '退款',
  `act_confirm` varchar(225) DEFAULT NULL COMMENT '确认收货',
  `act_getwuliu` varchar(225) DEFAULT NULL COMMENT '查看物流',
  `act_tousu` varchar(225) DEFAULT NULL,
  `send_name` varchar(225) DEFAULT NULL,
  `send_contact` varchar(225) DEFAULT NULL,
  `send_address` varchar(225) DEFAULT NULL,
  `act_cancel` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_order
-- ----------------------------
INSERT INTO `onethink_order` VALUES ('950', 'DB021679181159397264', '100.00', '1414916802', '4', '1', '1414916870', '1', '0.00', '1', null, null, '100.00', '', '49', '', '0', null, '订单已取消', null, null, null, null, null, null, '<A href=\'http://localhost/index.php?s=/Home/Order/wuliu/id/DB021679181159397264\'>查看物流</a>', null, '', '', '', '');
INSERT INTO `onethink_order` VALUES ('959', 'DB022965466403330577', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('958', 'DB022965327603779019', '100.00', '1414929810', '1', '无', '0', '1', '0.00', '1', null, '1', '100.00', null, '0', null, '0', null, '等待支付', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://localhost/index.php?s=/Home/Order/cancel/id/DB022965327603779019\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('957', 'DB022447066515760668', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('966', 'DB035452579830669829', '200.00', '1414954542', '1', '无', '0', '1', '0.00', '1', null, null, '200.00', null, '0', null, '0', null, '已提交等待发货', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035452579830669829\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('967', 'DB035452660868277358', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('955', 'DB022429043088665634', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('953', 'DB022250955662217299', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('952', 'DB022250839918865207', '100.00', '1414922649', '4', '1', '1414922682', '1', '0.00', '1', null, null, '100.00', '', '0', '', '0', null, '订单已取消', null, null, null, null, null, null, '<A href=\'http://localhost/index.php?s=/Home/Order/wuliu/id/DB022250839918865207\'>查看物流</a>', null, '', '', '', '');
INSERT INTO `onethink_order` VALUES ('954', 'DB022428935646351907', '100.00', '1414924298', '4', '无', '0', '1', '0.00', '1', null, null, '100.00', null, '0', null, '0', null, '订单已关闭', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://localhost/index.php?s=/Home/Order/canceldetail/id/DB022428935646351907\'>订单已取消</a>');
INSERT INTO `onethink_order` VALUES ('960', 'DB023137586522138986', '100.00', '1414931391', null, '无', '0', '1', '0.00', '1', null, '1', '100.00', null, '0', null, '0', null, '等待支付', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('961', 'DB023137658180696540', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('962', 'DB035395696740362222', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('963', 'DB035395845824716708', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('964', 'DB035412203038407760', '147.00', '1414954137', '1', '无', '0', '1', '0.00', '1', null, null, '947.00', null, '0', null, '0', null, '已提交等待发货', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035412203038407760\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('965', 'DB035412315893413947', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('968', 'DB035475294688413797', '12.00', '1414954767', '1', '无', '0', '1', '10.00', '1', null, null, '2.00', null, '0', null, '0', null, '已提交等待发货', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035475294688413797\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('969', 'DB035475366478746500', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('970', 'DB035481173597427825', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('971', 'DB035481254904436010', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('972', 'DB035484445501789146', '100.00', '1414954859', null, '无', '0', '1', '0.00', '1', null, '1', '100.00', null, '0', null, '0', null, '等待支付', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('973', 'DB035484537896182928', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('974', 'DB035497958720303305', '300.67', '1414954999', '1', '无', '0', '1', '0.00', '1', null, '1', '301.00', null, '0', null, '0', null, '等待支付', '330', null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035497958720303305\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('975', 'DB035498045500556623', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('976', 'DB035630482117630696', '120.00', '1414956320', '1', '无', '0', '1', '0.00', '1', null, null, '120.00', null, '0', null, '0', null, '已提交等待发货', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035630482117630696\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('977', 'DB035630600101905736', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('978', 'DB035649175148458273', '100.00', '1414956506', '2', '1', '1415540163', '1', '0.00', '1', null, null, '100.00', '韵达快递', '0', '1201397270897', '0', null, '已发货', null, null, null, null, null, null, '<A href=\'http://ijquery.net/index.php?s=/Home/Order/wuliu/id/DB035649175148458273\'>查看物流</a>', null, '', '', '', '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035649175148458273\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('979', 'DB035649258694664605', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('980', 'DB035768313933553330', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('981', 'DB035768434272958994', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('982', 'DB036075782400436969', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('983', 'DB036075866653995455', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('984', 'DB036078988438319220', '1177.67', '1414960799', null, '无', '0', '1', '0.00', '1', null, '1', '1178.00', null, '0', null, '0', null, '等待支付', '330', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('985', 'DB036079079821402315', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('986', 'DB036092942295786208', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('987', 'DB036093032776235500', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('988', 'DB044107594513822005', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('989', 'DB044107711369299803', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('990', 'DB053464681904954446', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('991', 'DB053464775699583241', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('992', 'DB053489983206253214', '98.00', '1415134932', '1', '无', '0', '1', '0.00', '1', null, '1', '1998.00', null, '0', null, '0', null, '等待支付', null, null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB053489983206253214\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('993', 'DB053490255838807075', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('994', 'DB053851055773407494', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('995', 'DB053851101357426888', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('996', 'DB053851200281164433', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('997', 'DB053851556178417070', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('998', 'DB053940792071196234', '30.64', '1415139436', '1', '无', '0', '1', '10.00', '1', null, '1', '20.98', null, '0', null, '0', null, '等待支付', '340', null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB053940792071196234\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('999', 'DB053940972618607764', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1000', 'DB053943058328192832', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1001', 'DB061908479925918712', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1002', 'DB061908587426833957', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1003', 'DB061912472017780465', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1004', 'DB061912839966936620', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1005', 'DB061956002768778037', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1006', 'DB061956132064973763', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1007', 'DB096763153653478789', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1008', 'DB096763234032791595', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1009', 'DB096765835058177749', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1010', 'DB096765928137925393', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1011', 'DB096770482860845628', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1012', 'DB096770563535182599', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1013', 'DB092750463242736220', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1014', 'DB092750559215266705', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1015', 'DB092750591337687497', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1016', 'DB092774380300270877', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1017', 'DB092774460978575756', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1018', 'DB092774488412821455', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1019', 'DB093942878474260155', '100.00', '1415539441', '2', '1', '1415539635', '1', '0.00', '1', null, null, '100.00', '韵达快递', '0', '1900894599302', '0', null, '已发货', null, null, null, null, null, null, '<A href=\'http://ijquery.net/index.php?s=/Home/Order/wuliu/id/DB093942878474260155\'>查看物流</a>', null, '', '', '', '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB093942878474260155\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('1020', 'DB093942937465294343', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1037', 'DB124399184244358917', '865.64', '1415744012', '1', '无', '0', '1', '0.00', '1', null, null, '866.00', null, '0', null, '0', null, '已提交等待发货', '360', null, null, null, null, null, null, null, null, null, null, '<A href=\'http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB124399184244358917\'>取消订单</a>');
INSERT INTO `onethink_order` VALUES ('1038', 'DB124399440727906679', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1039', 'DB124399566941792369', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1040', 'DB127443445146632855', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1041', 'DB127443515863324071', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1042', 'DB127443530759195090', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1043', 'DB127939806842348825', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1044', 'DB127939934859286758', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1045', 'DB128360734585705397', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1046', 'DB128360803058528463', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1047', 'DB128363743141102419', '0.00', null, null, '无', '0', null, null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1048', 'DB131404566249545595', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1049', 'DB131404663175703355', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1050', 'DB131407928743448844', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1051', 'DB131408084257628840', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1052', 'DB131408216809240411', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1053', 'DB131408316255640945', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1054', 'DB131408420419328549', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1055', 'DB131408462828263138', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1056', 'DB131408601247403760', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1057', 'DB131408691808993699', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1058', 'DB131408753131727812', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1059', 'DB131408775609579173', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1060', 'DB131408810260827367', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1061', 'DB131408872445930792', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1062', 'DB131408993235359175', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1063', 'DB131409073451284231', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1064', 'DB131410956020186849', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `onethink_order` VALUES ('1065', 'DB131411039418427716', '0.00', null, null, '无', '0', '1', null, '1', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `onethink_pay`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_pay`;
CREATE TABLE `onethink_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `callback` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `param` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_pay
-- ----------------------------
INSERT INTO `onethink_pay` VALUES ('1', '', '50.00', '0', 'Home/Pay/success', '/index.php?s=/Home/Pay/over.html', 'a:1:{s:8:\"order_id\";N;}', '1415482853', '1415482853');
INSERT INTO `onethink_pay` VALUES ('2', '', '50.00', '0', 'Home/Pay/success', '/index.php?s=/Home/Pay/over.html', 'a:1:{s:8:\"order_id\";N;}', '1415482865', '1415482865');

-- ----------------------------
-- Table structure for `onethink_picture`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_picture
-- ----------------------------
INSERT INTO `onethink_picture` VALUES ('1', '/Uploads/Picture/2014-09-02/5405e0f3b1705.png', '', '36d077267c76901835c07eb98f43647f', '0f7ce26261cb7a81dcfb14e057982ec60fa3a6e0', '1', '1409671411');
INSERT INTO `onethink_picture` VALUES ('2', '/Uploads/Picture/2014-09-18/5419eb4fec0c7.jpg', '', '5435a1dae36fafc2e544f2f78854fb29', 'd93a6e9869e7bf2fc17a533d3060ade8c88c40a9', '1', '1410984783');
INSERT INTO `onethink_picture` VALUES ('3', '/Uploads/Picture/2014-09-22/541f3d86103d3.jpg', '', '8e77701a8b49232f17d7f13d91d40693', '4dd3a9e9938d8890db37452b3abe6ff91ead531a', '1', '1411333508');
INSERT INTO `onethink_picture` VALUES ('4', '/Uploads/Picture/2014-09-22/541ff48c48dcf.jpg', '', 'e23489fd7e4dcc3dffaecbdef316bc97', '212c69983a3aaae6e379c68521523f847f5065fc', '1', '1411380364');
INSERT INTO `onethink_picture` VALUES ('5', '/Uploads/Picture/2014-09-27/5426973d68594.jpg', '', 'b1cc728f0903646228442f12afec0559', '2dbeabe21876fe2e489eeaf8e71f9de9c6465886', '1', '1411815228');
INSERT INTO `onethink_picture` VALUES ('6', '/Uploads/Picture/2014-09-28/54282d125f21a.jpg', '', 'da9f27eee154037434fbad74dc73430a', 'd3299248c9946cb94e7f5eeaaa7818fe750ad9de', '1', '1411919121');
INSERT INTO `onethink_picture` VALUES ('7', '/Uploads/Picture/2014-09-28/54282f255e437.jpg', '', '2e1205543c59f21e6317c2adf56a64ae', '1ad27e3a47c074ab9b7ed3b2d0aff5f8f848a17f', '1', '1411919653');
INSERT INTO `onethink_picture` VALUES ('8', '/Uploads/Picture/2014-09-29/54284e0bb791c.jpg', '', '314edb167e8e67abe5fadb9ecb56a5bb', 'b7a1cf4f226334a39db5fa7351e3c696d3d562b3', '1', '1411927563');
INSERT INTO `onethink_picture` VALUES ('9', '/Uploads/Picture/2014-09-29/5428505721fe3.jpg', '', '3a9cfc025a0b8ae90939d080b6b0b3da', 'f0e1654339c40d42da7037cae6b26cef1336570b', '1', '1411928151');
INSERT INTO `onethink_picture` VALUES ('10', '/Uploads/Picture/2014-09-29/542851809c5fe.jpg', '', 'b7e3396d129e2501f393c5fbb59080d5', '1961d4b5d20e1ac3d50000570535ca41b5fa8c44', '1', '1411928448');
INSERT INTO `onethink_picture` VALUES ('11', '/Uploads/Picture/2014-10-22/5447bf1b8a10a.jpg', '', '4182ad0929a3a535f11273c31a7fd16b', 'b36f727aada45dd67f8206b978c46afc4b1254e6', '1', '1413988123');
INSERT INTO `onethink_picture` VALUES ('12', '/Uploads/Picture/2014-10-23/54481f89ef4dc.gif', '', '40e797c3661da89e463bf739b819a4fd', 'bba0f04434413fb63c3e6d82fe74d0ece7b647bf', '1', '1414012809');
INSERT INTO `onethink_picture` VALUES ('13', '/Uploads/Picture/2014-10-25/544a986712125.jpg', '', '5332d06200bc87cbeddefea48859eb87', 'e2207e6f2b7f0d7c6f9392ab70eb99b6a14f473b', '1', '1414174821');
INSERT INTO `onethink_picture` VALUES ('14', '/Uploads/Picture/2014-10-25/544a994e1e338.jpg', '', 'ad1a25faa262cf395b42b4aa4aead8cf', 'e08dc9cbab906cbeea1e036deaf3b791d6db4f9e', '1', '1414175054');
INSERT INTO `onethink_picture` VALUES ('15', '/Uploads/Picture/2014-10-26/544cff452d8fa.jpg', '', 'c1b04f3754108967f1edd5c94657095e', 'd1726508f25b1ef354d48586797a82da18503726', '1', '1414332229');
INSERT INTO `onethink_picture` VALUES ('16', '/Uploads/Picture/2014-10-26/544cffc5540ee.jpg', '', 'aac9bafdb67dc58312b65e001ea84540', '068acddf258436463eee6915e919a13f5e3877fe', '1', '1414332357');
INSERT INTO `onethink_picture` VALUES ('17', '/Uploads/Picture/2014-10-26/544d19999e40b.png', '', '20887db6ea7f9b810bd6d3ec5e91695b', 'f37a6e21817dd2a4163b3a5bdd05380c8a88efe1', '1', '1414338969');
INSERT INTO `onethink_picture` VALUES ('18', '/Uploads/Picture/2014-10-26/544d19be81949.jpg', '', 'da5fdeaed09a782168e78b6907b45a44', 'd8bb619b09799c52eb8b08ca292fd53ef405aea3', '1', '1414339006');
INSERT INTO `onethink_picture` VALUES ('19', '/Uploads/Picture/2014-10-27/544d1abbbd6b0.jpg', '', 'db8ea2928ce128693663d2252698bd05', '4dd01d2d86525d61ec12e44779959eb4cc074d9d', '1', '1414339259');
INSERT INTO `onethink_picture` VALUES ('20', '/Uploads/Picture/2014-10-27/544d2707616a5.png', '', '31f9e56579f958ff1a9eac6e040c4c20', '608746815de21abbfbee5f646bcb9b747a996c1f', '1', '1414342406');
INSERT INTO `onethink_picture` VALUES ('21', '/Uploads/Picture/2014-10-27/544d2792b3e05.png', '', '8a6d4676b58e25f538dc037337b28a6c', 'ef346ce444e1f5a117e388aa5fc018df4d623673', '1', '1414342546');
INSERT INTO `onethink_picture` VALUES ('22', '/Uploads/Picture/2014-10-27/544d27e160e6b.png', '', '0b2fdd0c3a198bc9b4034567e0bb112c', '05b9f8b88fff5b614b3d55fd8e617722d1bc7d93', '1', '1414342625');
INSERT INTO `onethink_picture` VALUES ('23', '/Uploads/Picture/2014-10-27/544d283099170.png', '', 'b7a5ed3253065b3e2540e779487d5767', 'a06b5bfe54272aedd2d645c560a1d836cd853bcc', '1', '1414342704');
INSERT INTO `onethink_picture` VALUES ('24', '/Uploads/Picture/2014-10-27/544d2b43ddf15.png', '', 'ff85333e81966a8cb8f012e59eeb749f', 'b430506b7467ff4842d396d5602a2ac511aea4b6', '1', '1414343491');
INSERT INTO `onethink_picture` VALUES ('25', '/Uploads/Picture/2014-10-29/5450091034207.png', '', 'f7aec314e1916bf12a46caf55ea947ac', '0b5fe01203ea843d9ce57ec076deba6686b972fc', '1', '1414531343');
INSERT INTO `onethink_picture` VALUES ('27', '/Uploads/Picture/2014-11-11/546215b4b6e52.jpg', '', '6d5df175cf29abedfc8f0e53dce5e67f', '062053c9b9b7f50d318256e3097703c673677c3b', '1', '1415714228');

-- ----------------------------
-- Table structure for `onethink_records`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_records`;
CREATE TABLE `onethink_records` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(225) DEFAULT NULL,
  `url` varchar(225) DEFAULT NULL,
  `country` varchar(225) DEFAULT NULL COMMENT '订单号',
  `time` int(10) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `info` varchar(225) NOT NULL,
  `province` varchar(225) NOT NULL,
  `city` varchar(225) DEFAULT NULL,
  `referer` varchar(225) DEFAULT NULL COMMENT '访问来源',
  `tag` int(11) DEFAULT NULL,
  `page` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_records
-- ----------------------------
INSERT INTO `onethink_records` VALUES ('54', '101.226.33.239', 'ijquery.net/index.php', '中国', '1414485301', null, '', '上海', '上海', 'http://www.sogou.com/ ', '1', null);
INSERT INTO `onethink_records` VALUES ('6', '5', 'localhost/111/index.php?s=/Home/pay/', '5', '1414248528', '1', '', '5', '5', null, null, null);
INSERT INTO `onethink_records` VALUES ('7', '5', 'localhost/111/index.php?s=/Home/pay/', '5', '1414248536', '1', '', '5', '5', null, null, null);
INSERT INTO `onethink_records` VALUES ('8', '5', 'localhost/111/index.php?s=/Home/pay/', '5', '1414248537', '1', '', '5', '5', null, null, null);
INSERT INTO `onethink_records` VALUES ('9', '5', 'localhost/111/index.php?s=/Home/pay/', '5', '1414248579', '1', '', '5', '5', null, null, null);
INSERT INTO `onethink_records` VALUES ('10', '5', 'localhost/111/index.php?s=/Home/pay/', '5', '1414248581', '1', '', '5', '5', null, null, null);
INSERT INTO `onethink_records` VALUES ('11', '125.88.33.34', 'www.ijquery.net/', '中国', '1414269911', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('12', '58.61.203.46', 'www.ijquery.net/', '中国', '1414271042', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Fcoupon/add.html', '1', null);
INSERT INTO `onethink_records` VALUES ('13', '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414271116', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', '1', null);
INSERT INTO `onethink_records` VALUES ('14', '222.73.40.174', 'ijquery.net/', '中国', '1414281996', null, '', '上海', '上海', null, '1', null);
INSERT INTO `onethink_records` VALUES ('15', '125.88.33.34', 'ijquery.net/', '中国', '1414304738', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('16', '58.61.201.83', 'www.ijquery.net/', '中国', '1414317572', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('17', '112.90.78.158', 'www.ijquery.net/', '中国', '1414318781', null, '', '广东', '深圳', null, '1', null);
INSERT INTO `onethink_records` VALUES ('18', '112.90.78.151', 'www.ijquery.net/', '中国', '1414318783', null, '', '广东', '深圳', null, '1', null);
INSERT INTO `onethink_records` VALUES ('19', '66.249.77.198', 'ijquery.net/?page=11', '美国', '1414322195', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('20', '66.249.79.116', 'ijquery.net/?page=10', '美国', '1414322293', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('21', '66.249.77.188', 'ijquery.net/?page=11', '美国', '1414322356', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=11', '1', null);
INSERT INTO `onethink_records` VALUES ('22', '125.88.33.34', 'www.ijquery.net/', '中国', '1414332077', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Article/edit/id/9/model/5/cate_id/57.html', '1', null);
INSERT INTO `onethink_records` VALUES ('23', '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414337830', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '1', null);
INSERT INTO `onethink_records` VALUES ('24', '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414339204', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '1', null);
INSERT INTO `onethink_records` VALUES ('25', '146.148.93.21', 'ijquery.net/', '美国', '1414339205', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('26', '58.61.201.83', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414356857', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '1', null);
INSERT INTO `onethink_records` VALUES ('27', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414365134', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Shopcart/makeorder.html', '1', null);
INSERT INTO `onethink_records` VALUES ('28', '101.226.33.237', 'www.ijquery.net/', '中国', '1414365423', null, '', '上海', '上海', 'http://www.sogou.com/ ', '1', null);
INSERT INTO `onethink_records` VALUES ('29', '192.99.107.46', 'www.ijquery.net/', '加拿大', '1414382840', null, '', '魁北克', '', null, '1', null);
INSERT INTO `onethink_records` VALUES ('30', '66.249.77.198', 'ijquery.net/?page=9', '美国', '1414387861', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('31', '66.249.77.208', 'ijquery.net/?page=9', '美国', '1414388245', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=9', '1', null);
INSERT INTO `onethink_records` VALUES ('32', '66.249.77.188', 'ijquery.net/index.php?s=', '美国', '1414396011', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('33', '178.154.150.213', 'ijquery.net/', '俄罗斯', '1414401823', null, '', '', '', null, '1', null);
INSERT INTO `onethink_records` VALUES ('34', '178.154.150.213', 'www.ijquery.net/', '俄罗斯', '1414401822', null, '', '', '', null, '1', null);
INSERT INTO `onethink_records` VALUES ('35', '113.108.157.197', 'www.ijquery.net/', '中国', '1414404345', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('36', '58.61.201.83', 'www.ijquery.net/', '中国', '1414404702', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('37', '112.90.78.151', 'www.ijquery.net/', '中国', '1414405566', null, '', '广东', '深圳', null, '1', null);
INSERT INTO `onethink_records` VALUES ('38', '112.90.78.158', 'www.ijquery.net/', '中国', '1414406001', null, '', '广东', '深圳', null, '1', null);
INSERT INTO `onethink_records` VALUES ('39', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/pay/', '中国', '1414411472', '1', '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('40', '42.62.74.38', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414411568', null, '', '北京', '北京', null, '1', null);
INSERT INTO `onethink_records` VALUES ('41', '123.125.71.72', 'ijquery.net/', '中国', '1414420494', null, '', '北京', '北京', null, '1', null);
INSERT INTO `onethink_records` VALUES ('42', '66.249.71.57', 'www.ijquery.net/', '美国', '1414423867', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('43', '58.61.204.41', 'www.ijquery.net/', '中国', '1414425178', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('44', '146.148.86.175', 'ijquery.net/', '美国', '1414425510', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('45', '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414425636', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', '1', null);
INSERT INTO `onethink_records` VALUES ('46', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414426575', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', '1', null);
INSERT INTO `onethink_records` VALUES ('47', '58.61.201.178', 'www.ijquery.net/', '中国', '1414442442', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('48', '42.62.74.38', 'ijquery.net/', '中国', '1414456348', null, '', '北京', '北京', null, '1', null);
INSERT INTO `onethink_records` VALUES ('49', '91.250.15.69', 'ijquery.net/', '乌克兰', '1414471048', null, '', 'Donets\'ka Oblast\'', 'Mariupol', 'http://galaxydownloads.co', '1', null);
INSERT INTO `onethink_records` VALUES ('50', '192.99.107.136', 'www.ijquery.net/', '加拿大', '1414474333', null, '', '魁北克', '', null, '1', null);
INSERT INTO `onethink_records` VALUES ('51', '66.249.71.252', 'ijquery.net/', '美国', '1414480889', null, '', '加利福尼亚', 'Mountain View', null, '1', null);
INSERT INTO `onethink_records` VALUES ('52', '66.249.79.124', 'ijquery.net/', '美国', '1414481039', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', null);
INSERT INTO `onethink_records` VALUES ('53', '125.88.33.34', 'www.ijquery.net/', '中国', '1414483038', null, '', '广东', '广州', null, '1', null);
INSERT INTO `onethink_records` VALUES ('55', '210.14.128.133', 'ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1414486031', null, '', '北京', '北京', null, '3', null);
INSERT INTO `onethink_records` VALUES ('56', '210.14.139.153', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414486475', null, '', '北京', '北京', null, '3', null);
INSERT INTO `onethink_records` VALUES ('57', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414486771', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '2', null);
INSERT INTO `onethink_records` VALUES ('58', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414487284', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('59', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414487366', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('60', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1414487387', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '3', '8');
INSERT INTO `onethink_records` VALUES ('61', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/c_fruit', '中国', '1414487405', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '2', 'c_fruit');
INSERT INTO `onethink_records` VALUES ('62', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414487520', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('63', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1414487709', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('64', '210.14.139.153', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1414487720', null, '', '北京', '北京', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('65', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', '1414487769', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '3', '18');
INSERT INTO `onethink_records` VALUES ('66', '210.14.139.153', 'ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', '1414487779', null, '', '北京', '北京', null, '3', '18');
INSERT INTO `onethink_records` VALUES ('67', '192.99.107.118', 'www.ijquery.net/', '加拿大', '1414490958', null, '', '魁北克', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('68', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1414491995', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '15');
INSERT INTO `onethink_records` VALUES ('69', '210.14.128.133', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1414492017', null, '', '北京', '北京', null, '3', '15');
INSERT INTO `onethink_records` VALUES ('70', '210.14.128.133', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1414492022', null, '', '北京', '北京', null, '3', '15');
INSERT INTO `onethink_records` VALUES ('71', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', '1414492222', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '3', '5');
INSERT INTO `onethink_records` VALUES ('72', '66.249.77.188', 'ijquery.net/', '美国', '1414498615', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('73', '66.249.77.208', 'ijquery.net/', '美国', '1414498743', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('74', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414505686', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '16');
INSERT INTO `onethink_records` VALUES ('75', '210.14.139.153', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414505697', null, '', '北京', '北京', null, '3', '16');
INSERT INTO `onethink_records` VALUES ('76', '58.61.201.178', 'www.ijquery.net/', '中国', '1414510393', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('77', '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414511512', null, '', '广东', '广州', 'http://www.ijquery.net/', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('78', '146.148.71.223', 'ijquery.net/', '美国', '1414511926', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('79', '58.61.201.178', 'www.ijquery.net/', '中国', '1414512021', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('80', '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1414512839', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '15');
INSERT INTO `onethink_records` VALUES ('81', '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414512888', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('82', '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414512897', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('83', '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1414513275', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('84', '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414524006', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('85', '125.88.33.34', 'www.ijquery.net/', '中国', '1414532588', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Article/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('86', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1414532640', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('87', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414533513', null, '', '广东', '广州', 'http://www.ijquery.net/', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('88', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414533523', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '16');
INSERT INTO `onethink_records` VALUES ('89', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1414536057', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '8');
INSERT INTO `onethink_records` VALUES ('90', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1414536062', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('91', '157.55.39.247', 'www.ijquery.net/', '美国', '1414537287', null, '', '华盛顿州', 'Redmond', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('92', '66.249.77.188', 'ijquery.net/', '美国', '1414558704', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('93', '58.61.201.178', 'www.ijquery.net/', '中国', '1414564378', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Lookup/index/p/6.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('94', '58.61.201.135', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414568363', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '17');
INSERT INTO `onethink_records` VALUES ('95', '58.61.201.135', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414568378', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('96', '58.61.201.135', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414568446', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('97', '58.61.201.58', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414569108', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('98', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414572892', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('99', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414573096', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Shopcart/makeorder.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('100', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1414573290', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('101', '178.154.150.213', 'ijquery.net/', '俄罗斯', '1414574642', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('102', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414577178', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/index/index.html', '3', '16');
INSERT INTO `onethink_records` VALUES ('103', '192.99.40.137', 'ijquery.net/', '加拿大', '1414580782', null, '', '魁北克', '', 'http://www.domaintuno.com/d/ijquery.net', '1', 'index');
INSERT INTO `onethink_records` VALUES ('104', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1414582017', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('105', '66.249.77.208', 'ijquery.net/?page=11', '美国', '1414587507', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('106', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', '1414587530', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '18');
INSERT INTO `onethink_records` VALUES ('107', '66.249.79.124', 'ijquery.net/?page=11', '美国', '1414587806', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=11', '1', 'index');
INSERT INTO `onethink_records` VALUES ('108', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1414592254', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Lookup/article.html', '3', '8');
INSERT INTO `onethink_records` VALUES ('109', '58.61.201.83', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1414592299', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('110', '58.61.201.83', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414592335', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('111', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414592745', '1', '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('112', '58.61.201.178', 'www.ijquery.net/', '中国', '1414595152', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Order/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('113', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414596129', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('114', '176.102.38.75', 'IJQUERY.NET/', '乌克兰', '1414596433', null, '', 'Kharkivs\'ka Oblast\'', 'Kharkov', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('115', '101.226.65.106', 'ijquery.net/', '中国', '1414596626', null, '', '上海', '上海', 'http://www.sogou.com/ ', '1', 'index');
INSERT INTO `onethink_records` VALUES ('116', '58.61.201.58', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414596679', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('117', '146.148.93.90', 'ijquery.net/', '美国', '1414598375', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('118', '192.99.40.137', 'ijquery.net/', '加拿大', '1414603125', null, '', '魁北克', '', 'http://www.domaintuno.com/d/ijquery.net', '1', 'index');
INSERT INTO `onethink_records` VALUES ('119', '66.249.77.198', 'ijquery.net/?page=11', '美国', '1414603530', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('120', '66.249.77.208', 'ijquery.net/?page=11', '美国', '1414619308', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('121', '66.249.79.108', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414623374', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('122', '66.249.77.188', 'ijquery.net/?page=12', '美国', '1414623981', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('123', '66.249.71.75', 'www.ijquery.net/', '美国', '1414624231', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('124', '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414642544', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('125', '192.99.107.226', 'www.ijquery.net/', '加拿大', '1414643492', null, '', '魁北克', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('126', '66.249.77.198', 'ijquery.net/', '美国', '1414660028', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('127', '58.61.201.141', 'www.ijquery.net/', '中国', '1414664310', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('128', '180.153.163.186', 'www.ijquery.net/', '中国', '1414664737', null, '', '上海', '上海', 'http://www.sogou.com/ ', '1', 'index');
INSERT INTO `onethink_records` VALUES ('129', '58.61.201.141', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1414668077', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('130', '58.61.201.141', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414668582', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '17');
INSERT INTO `onethink_records` VALUES ('131', '125.88.33.34', 'www.ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', '1414674332', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'vegetable');
INSERT INTO `onethink_records` VALUES ('132', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414674337', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('133', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1414675241', null, '', '广东', '广州', 'http://www.ijquery.net/', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('134', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414675256', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('135', '58.61.201.58', 'www.ijquery.net/', '中国', '1414677353', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('136', '148.251.71.4', 'ijquery.net/', '德国', '1414683427', null, '', '', '', 'http://getdownload.ws', '1', 'index');
INSERT INTO `onethink_records` VALUES ('137', '146.148.87.32', 'ijquery.net/', '美国', '1414684738', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('138', '188.92.76.167', 'ijquery.net/', '拉脱维亚', '1414689300', null, '', '', '', 'http://google.com/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('139', '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414696173', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('140', '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414701594', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('141', '66.249.77.198', 'ijquery.net/', '美国', '1414702002', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('142', '66.249.77.188', 'ijquery.net/', '美国', '1414702173', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('143', '192.99.107.10', 'www.ijquery.net/', '加拿大', '1414721742', null, '', '魁北克', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('144', '66.249.77.208', 'ijquery.net/', '美国', '1414722063', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('145', '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414730376', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('146', '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414730685', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('147', '66.249.79.108', 'ijquery.net/?page=11', '美国', '1414733571', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=11', '1', 'index');
INSERT INTO `onethink_records` VALUES ('148', '66.249.77.188', 'ijquery.net/?page=12', '美国', '1414736788', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('149', '66.249.77.198', 'ijquery.net/index.php?s=/Home/index/index.html', '美国', '1414737276', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('150', '66.249.77.188', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', '1414760924', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('151', '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414767667', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('152', '23.251.151.197', 'ijquery.net/', '美国', '1414771178', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('153', '66.249.77.208', 'ijquery.net/', '美国', '1414771335', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('154', '66.249.79.124', 'ijquery.net/', '美国', '1414771522', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('155', '125.88.33.34', 'www.ijquery.net/', '中国', '1414772358', null, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Config/group/id/7.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('156', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414773931', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('157', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414773966', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '17');
INSERT INTO `onethink_records` VALUES ('158', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', '1414774648', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '18');
INSERT INTO `onethink_records` VALUES ('159', '178.154.150.213', 'ijquery.net/', '俄罗斯', '1414776755', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('160', '66.249.77.198', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414777860', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('161', '66.249.77.198', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', '1414777894', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('162', '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1414778096', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('163', '58.61.204.235', 'www.ijquery.net/', '中国', '1414784567', null, '', '广东', '广州', 'http://localhost/admin.php?s=/Lookup/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('164', '66.249.77.188', 'ijquery.net/', '美国', '1414784985', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('165', '66.249.71.57', 'www.ijquery.net/', '美国', '1414804028', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('166', '42.156.138.34', 'ijquery.net/', '中国', '1414815599', null, '', '浙江', '杭州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('167', '66.249.77.208', 'ijquery.net/?page=10', '美国', '1414820537', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('168', '66.249.71.39', 'www.ijquery.net/', '美国', '1414822447', null, '', '加利福尼亚', 'Mountain View', 'http://www.ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('169', '192.99.107.190', 'www.ijquery.net/', '加拿大', '1414823775', null, '', '魁北克', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('170', '121.33.7.37', 'www.ijquery.net/', '中国', '1414931238', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Cancel/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('171', '121.33.7.37', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414931243', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('172', '125.88.33.34', 'www.ijquery.net/', '中国', '1414941504', '1', '', '广东', '广州', 'http://localhost/index.php?s=/Home/shopcart/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('173', '130.211.154.101', 'ijquery.net/', '美国', '1414947430', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('174', '121.33.7.122', 'www.ijquery.net/', '中国', '1414949655', '1', '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Lookup/article/p/5.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('175', '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414951886', '1', '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('176', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1414957639', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('177', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1414957695', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('178', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1414960874', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('179', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1414962246', null, '', '广东', '广州', 'http://ijquery.net/', '3', '15');
INSERT INTO `onethink_records` VALUES ('180', '58.61.201.225', 'www.ijquery.net/', '中国', '1414963951', null, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('181', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1414964015', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('182', '66.249.77.198', 'ijquery.net/?page=10', '美国', '1414967751', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('183', '66.249.77.188', 'ijquery.net/?page=12', '美国', '1414970816', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('184', '66.249.77.208', 'ijquery.net/?page=10', '美国', '1414985649', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=10', '1', 'index');
INSERT INTO `onethink_records` VALUES ('185', '42.156.136.110', 'ijquery.net/index.php?s=/home/article/index/category/car.html', '中国', '1415000634', null, '', '浙江', '杭州', null, '2', 'car');
INSERT INTO `onethink_records` VALUES ('186', '42.156.139.110', 'ijquery.net/index.php?s=/home/article/index/category/c_fruit.html', '中国', '1415000642', null, '', '浙江', '杭州', null, '2', 'c_fruit');
INSERT INTO `onethink_records` VALUES ('187', '42.120.160.110', 'ijquery.net/index.php?s=/home/article/index/category/root%20vegetables%20.html', '中国', '1415000644', null, '', '浙江', '杭州', null, '2', 'root vegetables ');
INSERT INTO `onethink_records` VALUES ('188', '42.120.161.110', 'ijquery.net/index.php?s=/home/article/index/category/stem%20vegetable.html', '中国', '1415000648', null, '', '浙江', '杭州', null, '2', 'stem vegetable');
INSERT INTO `onethink_records` VALUES ('189', '220.181.108.120', 'ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', '1415006718', null, '', '北京', '北京', null, '2', 'vegetable');
INSERT INTO `onethink_records` VALUES ('190', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1415007277', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '14');
INSERT INTO `onethink_records` VALUES ('191', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415007918', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '8');
INSERT INTO `onethink_records` VALUES ('192', '178.154.150.213', 'www.ijquery.net/', '俄罗斯', '1415010951', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('193', '121.33.7.122', 'www.ijquery.net/', '中国', '1415018874', null, '', '广东', '广州', 'http://localhost/admin.php?s=/Article/edit/id/18/model/5/cate_id/57.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('194', '148.251.71.4', 'ijquery.net/', '德国', '1415019161', null, '', '', '', 'http://prox100download.com', '1', 'index');
INSERT INTO `onethink_records` VALUES ('195', '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415019201', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '8');
INSERT INTO `onethink_records` VALUES ('196', '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415019405', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('197', '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415019504', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('198', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415020443', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('199', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415020714', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('200', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415021814', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('201', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1415022281', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('202', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415024754', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('203', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415024832', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '8');
INSERT INTO `onethink_records` VALUES ('204', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415029817', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('205', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', '1415029861', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '18');
INSERT INTO `onethink_records` VALUES ('206', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415030109', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '16');
INSERT INTO `onethink_records` VALUES ('207', '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', '1415030344', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '3', '5');
INSERT INTO `onethink_records` VALUES ('208', '130.211.147.137', 'ijquery.net/', '美国', '1415033877', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('209', '121.33.7.122', 'www.ijquery.net/', '中国', '1415033932', null, '', '广东', '广州', 'http://localhost/admin.php?s=/Config/group/id/7.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('210', '66.249.77.208', 'ijquery.net/index.php?s=/Home/index/index.html', '美国', '1415038593', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('211', '66.249.77.198', 'ijquery.net/index.php?s=/Home/index/index.html', '美国', '1415038779', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('212', '125.88.33.34', 'ijquery.net/', '中国', '1415040728', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('213', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415040743', null, '', '广东', '广州', 'http://ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('214', '66.249.77.188', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', '1415041045', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('215', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415041202', '1', '', '广东', '广州', 'http://ijquery.net/', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('216', '220.181.108.140', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415057417', null, '', '北京', '北京', null, '3', '9');
INSERT INTO `onethink_records` VALUES ('217', '192.99.40.137', 'ijquery.net/', '加拿大', '1415061059', null, '', '魁北克', '', 'http://www.domaintuno.com/d/ijquery.net', '1', 'index');
INSERT INTO `onethink_records` VALUES ('218', '5.45.77.35', 'www.ijquery.net/', '荷兰', '1415071922', null, '', '', '', 'http://www.ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('219', '42.156.138.103', 'ijquery.net/index.php?s=/Home/index/index.html', '中国', '1415088089', null, '', '浙江', '杭州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('220', '42.156.139.103', 'ijquery.net/index.php?s=/home/article/index/category/jiaju.html', '中国', '1415088099', null, '', '浙江', '杭州', null, '2', 'jiaju');
INSERT INTO `onethink_records` VALUES ('221', '42.120.160.103', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415088102', null, '', '浙江', '杭州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('222', '125.88.33.34', 'ijquery.net/', '中国', '1415094114', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('223', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415094263', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/shopcart/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('224', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415094280', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('225', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', '1415094341', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('226', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415094364', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('227', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', '1415094405', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '18');
INSERT INTO `onethink_records` VALUES ('228', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415094417', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '3', '16');
INSERT INTO `onethink_records` VALUES ('229', '66.249.77.208', 'ijquery.net/', '美国', '1415094634', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('230', '121.33.7.122', 'ijquery.net/', '中国', '1415099158', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('231', '58.61.201.13', 'ijquery.net/', '中国', '1415101625', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('232', '188.92.76.167', 'ijquery.net/', '拉脱维亚', '1415115323', null, '', '', '', 'http://wmaid.com/en/explore/ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('233', '130.211.177.67', 'ijquery.net/', '美国', '1415120289', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('234', '113.66.120.60', 'ijquery.net/', '中国', '1415126837', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('235', '125.88.33.34', 'ijquery.net/', '中国', '1415134302', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('236', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415134642', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('237', '180.149.135.16', 'ijquery.net/', '中国', '1415135287', null, '', '北京', '北京', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('238', '111.206.36.11', 'www.ijquery.net/', '中国', '1415135374', null, '', '北京', '北京', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('239', '58.61.201.79', 'www.ijquery.net/', '中国', '1415136070', null, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Addons/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('240', '58.61.205.93', 'www.ijquery.net/', '中国', '1415136073', null, '', '广东', '广州', 'http://www.ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('241', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415136666', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('242', '111.206.36.140', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415136668', null, '', '北京', '北京', null, '3', '16');
INSERT INTO `onethink_records` VALUES ('243', '66.249.77.208', 'ijquery.net/', '美国', '1415136761', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('244', '111.206.36.136', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415137946', null, '', '北京', '北京', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('245', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415137948', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('246', '111.206.36.141', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415137956', null, '', '北京', '北京', null, '3', '17');
INSERT INTO `onethink_records` VALUES ('247', '58.61.205.93', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415138518', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('248', '58.61.205.93', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1415138540', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '15');
INSERT INTO `onethink_records` VALUES ('249', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1415138598', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '3', '15');
INSERT INTO `onethink_records` VALUES ('250', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', '1415138820', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '3', '5');
INSERT INTO `onethink_records` VALUES ('251', '58.61.205.93', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', '1415138822', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '3', '5');
INSERT INTO `onethink_records` VALUES ('252', '58.61.201.13', 'www.ijquery.net/', '中国', '1415144657', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/logout.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('253', '58.61.201.13', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415145023', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('254', '111.206.36.143', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415145025', null, '', '北京', '北京', null, '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('255', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415145025', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('256', '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1415146262', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('257', '182.131.19.96', 'www.ijquery.net/', '中国', '1415152293', null, '', '四川', '成都', 'http://qconnadmin.oa.com/schema?m=release&a=query&json={%22source%22:{%22id%22:12},%22fields%22:[%22AppID%22,%22platform%22,%22AppState%22,%22AppAlias%22,%22Developer%22,%22Logo16%22,%22last_modify%22,%22admin%22,%22AppUrl%22', '1', 'index');
INSERT INTO `onethink_records` VALUES ('258', '66.249.77.198', 'ijquery.net/', '美国', '1415152837', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('259', '66.249.77.198', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1415163214', null, '', '加利福尼亚', 'Mountain View', null, '3', '14');
INSERT INTO `onethink_records` VALUES ('260', '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', '1415163550', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '3', '14');
INSERT INTO `onethink_records` VALUES ('261', '42.120.160.37', 'ijquery.net/index.php?s=/home/article/index/category/fushi.html', '中国', '1415166690', null, '', '浙江', '杭州', null, '2', 'fushi');
INSERT INTO `onethink_records` VALUES ('262', '42.156.137.37', 'ijquery.net/index.php?s=/home/article/index/category/flower%20vegetable.html', '中国', '1415166691', null, '', '浙江', '杭州', null, '2', 'flower vegetable');
INSERT INTO `onethink_records` VALUES ('263', '42.120.161.37', 'ijquery.net/', '中国', '1415166691', null, '', '浙江', '杭州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('264', '66.249.71.75', 'www.ijquery.net/?page=2', '美国', '1415168750', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('265', '66.249.71.57', 'www.ijquery.net/?page=2', '美国', '1415168967', null, '', '加利福尼亚', 'Mountain View', 'http://www.ijquery.net/?page=2', '1', 'index');
INSERT INTO `onethink_records` VALUES ('266', '66.249.77.188', 'ijquery.net/', '美国', '1415171045', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('267', '66.249.71.39', 'www.ijquery.net/?page=15', '美国', '1415171253', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('268', '66.249.79.116', 'ijquery.net/', '美国', '1415171323', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('269', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415177922', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('270', '66.249.77.198', 'ijquery.net/', '美国', '1415178422', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('271', '178.154.150.213', 'www.ijquery.net/', '俄罗斯', '1415181683', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('272', '113.66.120.60', 'www.ijquery.net/', '中国', '1415187793', null, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('273', '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415187802', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('274', '61.135.190.105', 'www.ijquery.net/', '中国', '1415200650', null, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', '1', 'index');
INSERT INTO `onethink_records` VALUES ('275', '130.211.137.181', 'ijquery.net/', '美国', '1415206615', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('276', '58.61.201.79', 'www.ijquery.net/', '中国', '1415217152', null, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Addons/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('277', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415217485', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '8');
INSERT INTO `onethink_records` VALUES ('278', '58.61.201.13', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415217522', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('279', '123.125.106.81', 'www.ijquery.net//index.php?s=/Home/Article/detail/id/9.html', '中国', '1415217572', null, '', '北京', '北京', null, '3', '9');
INSERT INTO `onethink_records` VALUES ('280', '180.149.135.120', 'www.ijquery.net//index.php?s=/Home/Article/detail/id/9.html', '中国', '1415217573', null, '', '北京', '北京', null, '3', '9');
INSERT INTO `onethink_records` VALUES ('281', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415217694', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '16');
INSERT INTO `onethink_records` VALUES ('282', '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415217769', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('283', '113.66.120.60', 'www.ijquery.net/', '中国', '1415219071', '1', '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Addons/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('284', '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415219080', '1', '', '广东', '广州', 'http://www.ijquery.net/', '3', '17');
INSERT INTO `onethink_records` VALUES ('285', '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415219232', '1', '', '广东', '广州', 'http://www.ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('286', '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1415219320', '1', '', '广东', '广州', 'http://www.ijquery.net/', '3', '15');
INSERT INTO `onethink_records` VALUES ('287', '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415219434', '1', '', '广东', '广州', 'http://www.ijquery.net/', '3', '8');
INSERT INTO `onethink_records` VALUES ('288', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415220826', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Center/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('289', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415220840', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('290', '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415220843', '1', '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('291', '66.249.64.100', 'ijquery.net/', '美国', '1415222369', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('292', '66.249.64.97', 'www.ijquery.net/?page=1', '美国', '1415225261', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('293', '66.249.64.93', 'www.ijquery.net/', '美国', '1415232716', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('294', '66.249.64.101', 'www.ijquery.net/', '美国', '1415232835', null, '', '加利福尼亚', 'Mountain View', 'http://www.ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('295', '42.120.160.75', 'ijquery.net/index.php?s=/home/article/index/category/j_fruit.html', '中国', '1415243845', null, '', '浙江', '杭州', null, '2', 'j_fruit');
INSERT INTO `onethink_records` VALUES ('296', '42.156.138.75', 'ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', '1415243854', null, '', '浙江', '杭州', null, '2', 'vegetable');
INSERT INTO `onethink_records` VALUES ('297', '42.120.160.75', 'ijquery.net/index.php?s=/home/article/index/category/electric.html', '中国', '1415244002', null, '', '浙江', '杭州', null, '2', 'electric');
INSERT INTO `onethink_records` VALUES ('298', '123.125.71.99', 'ijquery.net/index.php?s=/home/article/index/category/flower%20vegetable.html', '中国', '1415257629', null, '', '北京', '北京', null, '2', 'flower vegetable');
INSERT INTO `onethink_records` VALUES ('299', '66.249.64.96', 'ijquery.net/?page=10', '美国', '1415264621', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('300', '180.153.206.34', 'ijquery.net/', '中国', '1415276681', null, '', '上海', '上海', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('301', '61.135.190.101', 'www.ijquery.net/', '中国', '1415286414', null, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', '1', 'index');
INSERT INTO `onethink_records` VALUES ('302', '125.88.33.34', 'ijquery.net/', '中国', '1415291475', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('303', '112.64.235.89', 'ijquery.net/', '中国', '1415291475', null, '', '上海', '上海', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('304', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415291661', null, '', '广东', '广州', 'http://ijquery.net/', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('305', '101.226.89.117', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415291661', null, '', '上海', '上海', null, '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('306', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/j_fruit.html', '中国', '1415291668', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '2', 'j_fruit');
INSERT INTO `onethink_records` VALUES ('307', '101.226.66.174', 'ijquery.net/index.php?s=/Home/Article/index/category/j_fruit.html', '中国', '1415291671', null, '', '上海', '上海', null, '2', 'j_fruit');
INSERT INTO `onethink_records` VALUES ('308', '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/c_fruit.html', '中国', '1415291856', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '2', 'c_fruit');
INSERT INTO `onethink_records` VALUES ('309', '180.153.214.190', 'ijquery.net/index.php?s=/Home/Article/index/category/c_fruit.html', '中国', '1415291856', null, '', '上海', '上海', null, '2', 'c_fruit');
INSERT INTO `onethink_records` VALUES ('310', '101.226.33.201', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', '1415292252', null, '', '上海', '上海', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('311', '130.211.174.246', 'ijquery.net/', '美国', '1415293049', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('312', '113.66.120.93', 'www.ijquery.net/', '中国', '1415294983', null, '', '广东', '广州', 'http://localhost/admin.php?s=/Article/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('313', '72.46.136.178', 'www.ijquery.net/', '美国', '1415314360', null, '', '内华达州', 'Las Vegas', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('314', '37.140.141.37', 'www.ijquery.net/', '俄罗斯', '1415315066', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('315', '38.72.114.141', 'ijquery.net/', '美国', '1415327840', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('316', '42.156.136.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1415333843', null, '', '浙江', '杭州', null, '3', '15');
INSERT INTO `onethink_records` VALUES ('317', '42.156.137.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', '1415333843', null, '', '浙江', '杭州', null, '3', '5');
INSERT INTO `onethink_records` VALUES ('318', '113.66.120.93', 'ijquery.net/', '中国', '1415333923', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('319', '113.66.120.93', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415333941', null, '', '广东', '广州', 'http://ijquery.net/', '3', '17');
INSERT INTO `onethink_records` VALUES ('320', '113.66.120.93', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415333955', null, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('321', '66.249.79.108', 'ijquery.net/?page=10', '美国', '1415350661', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=10', '1', 'index');
INSERT INTO `onethink_records` VALUES ('322', '61.135.190.105', 'www.ijquery.net/', '中国', '1415356220', null, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', '1', 'index');
INSERT INTO `onethink_records` VALUES ('323', '178.154.150.213', 'ijquery.net/', '俄罗斯', '1415356676', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('324', '162.243.9.227', 'www.ijquery.net/', '美国', '1415363217', null, '', '纽约州', 'New York', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('325', '66.249.71.39', 'www.ijquery.net/', '美国', '1415363756', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('326', '108.172.73.210', 'ijquery.net/', '加拿大', '1415365273', null, '', '不列颠哥伦比亚', 'Delta', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('327', '130.211.169.143', 'ijquery.net/', '美国', '1415379466', null, '', '', '', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('328', '61.135.190.105', 'ijquery.net/', '中国', '1415380613', null, '', '北京', '北京', 'http://www.baidu.com/s?wd=NULL', '1', 'index');
INSERT INTO `onethink_records` VALUES ('329', '66.249.77.188', 'ijquery.net/', '美国', '1415389769', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('330', '66.249.77.208', 'ijquery.net/', '美国', '1415399329', null, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', '1', 'index');
INSERT INTO `onethink_records` VALUES ('331', '220.181.108.139', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415409687', null, '', '北京', '北京', null, '3', '8');
INSERT INTO `onethink_records` VALUES ('332', '14.121.99.166', 'ijquery.net/', '中国', '1415412380', null, '', '广东', '广州', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('333', '14.121.99.166', 'ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', '1415412453', null, '', '广东', '广州', 'http://ijquery.net/', '3', '15');
INSERT INTO `onethink_records` VALUES ('334', '14.121.99.166', 'ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415412461', null, '', '广东', '广州', 'http://ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('335', '14.121.99.166', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415412494', null, '', '广东', '广州', 'http://ijquery.net/', '3', '9');
INSERT INTO `onethink_records` VALUES ('336', '183.33.35.213', 'www.ijquery.net/', '中国', '1415415833', null, '', '广东', '中山', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('337', '42.156.139.56', 'ijquery.net/index.php?s=/home/article/index/category/jiaju.html', '中国', '1415418236', null, '', '浙江', '杭州', null, '2', 'jiaju');
INSERT INTO `onethink_records` VALUES ('338', '42.156.136.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415418237', null, '', '浙江', '杭州', null, '3', '17');
INSERT INTO `onethink_records` VALUES ('339', '42.156.137.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415418238', null, '', '浙江', '杭州', null, '3', '9');
INSERT INTO `onethink_records` VALUES ('340', '42.120.160.56', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415418238', null, '', '浙江', '杭州', null, '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('341', '14.116.16.125', 'ijquery.net/', '中国', '1415418590', null, '', '广东', '珠海', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('342', '66.249.77.198', 'ijquery.net/', '美国', '1415430294', null, '', '加利福尼亚', 'Mountain View', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('343', '81.180.73.182', 'ijquery.net/', '摩尔多瓦', '1415434994', null, '', 'Chisinau', 'Chisinau', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('344', '113.66.121.137', 'www.ijquery.net/', '中国', '1415446552', null, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('345', '111.206.36.19', 'www.ijquery.net/', '中国', '1415446585', null, '', '北京', '北京', null, '1', 'index');
INSERT INTO `onethink_records` VALUES ('346', '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', '1415446615', null, '', '广东', '广州', 'http://www.ijquery.net/', '3', '16');
INSERT INTO `onethink_records` VALUES ('347', '113.66.121.137', 'www.ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', '1415447139', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'vegetable');
INSERT INTO `onethink_records` VALUES ('348', '111.206.36.142', 'www.ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', '1415447144', null, '', '北京', '北京', null, '2', 'vegetable');
INSERT INTO `onethink_records` VALUES ('349', '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415447292', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '17');
INSERT INTO `onethink_records` VALUES ('350', '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', '1415447366', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Search/index/words/%E8%8B%B9%E6%9E%9C.html', '3', '8');
INSERT INTO `onethink_records` VALUES ('351', '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415448892', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '3', '9');
INSERT INTO `onethink_records` VALUES ('352', '111.206.36.143', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', '1415448906', null, '', '北京', '北京', null, '3', '9');
INSERT INTO `onethink_records` VALUES ('353', '113.66.121.250', 'www.ijquery.net/', '中国', '1415449607', null, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Index/index.html', '1', 'index');
INSERT INTO `onethink_records` VALUES ('354', '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', '1415450210', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', '2', 'fruit');
INSERT INTO `onethink_records` VALUES ('355', '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', '1415450215', null, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '3', '17');
