-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost:3306
-- 生成日期: 2014 年 11 月 08 日 19:44
-- 服务器版本: 5.1.57-community
-- PHP 版本: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `yxys`
--

-- --------------------------------------------------------

--
-- 表的结构 `onethink_action`
--

CREATE TABLE IF NOT EXISTS `onethink_action` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `onethink_action`
--

INSERT INTO `onethink_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_action_log`
--

CREATE TABLE IF NOT EXISTS `onethink_action_log` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='行为日志表' AUTO_INCREMENT=694 ;

--
-- 转存表中的数据 `onethink_action_log`
--

INSERT INTO `onethink_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(478, 1, 1, 2130706433, 'member', 1, '123在2014-10-26 03:11登录了后台', 1, 1414264315),
(479, 1, 1, 2102927650, 'member', 1, '123在2014-10-26 04:40登录了后台', 1, 1414269652),
(480, 1, 1, 977128489, 'member', 1, '123在2014-10-26 05:02登录了后台', 1, 1414270938),
(481, 1, 1, 977128489, 'member', 1, '123在2014-10-26 05:05登录了后台', 1, 1414271115),
(482, 6, 1, 977128489, 'config', 20, '操作url：/admin.php?s=/Config/edit.html', 1, 1414272713),
(483, 1, 1, 2102927650, 'member', 1, '123在2014-10-26 14:44登录了后台', 1, 1414305861),
(484, 1, 1, 977127763, 'member', 1, '123在2014-10-26 18:02登录了后台', 1, 1414317753),
(485, 1, 1, 977127763, 'member', 1, '123在2014-10-26 18:03登录了后台', 1, 1414317834),
(486, 1, 1, 977127763, 'member', 1, '123在2014-10-26 20:10登录了后台', 1, 1414325429),
(487, 10, 1, 977127763, 'Menu', 151, '操作url：/admin.php?s=/Menu/add.html', 1, 1414325512),
(488, 10, 1, 977127763, 'Menu', 151, '操作url：/admin.php?s=/Menu/edit.html', 1, 1414325527),
(489, 10, 1, 977127763, 'Menu', 150, '操作url：/admin.php?s=/Menu/edit.html', 1, 1414325551),
(490, 10, 1, 977127763, 'Menu', 152, '操作url：/admin.php?s=/Menu/add.html', 1, 1414325600),
(491, 10, 1, 977127763, 'Menu', 152, '操作url：/admin.php?s=/Menu/edit.html', 1, 1414325616),
(492, 8, 1, 977127763, 'attribute', 47, '操作url：/admin.php?s=/Attribute/update.html', 1, 1414329390),
(493, 1, 1, 2102927650, 'member', 1, '123在2014-10-26 22:07登录了后台', 1, 1414332459),
(494, 11, 1, 977128489, 'category', 70, '操作url：/admin.php?s=/Category/add.html', 1, 1414338807),
(495, 1, 1, 977128489, 'member', 1, '123在2014-10-27 00:46登录了后台', 1, 1414342019),
(496, 11, 1, 977128489, 'category', 71, '操作url：/admin.php?s=/Category/add.html', 1, 1414344085),
(497, 11, 1, 977128489, 'category', 68, '操作url：/admin.php?s=/Category/edit.html', 1, 1414344272),
(498, 11, 1, 977128489, 'category', 68, '操作url：/admin.php?s=/Category/edit.html', 1, 1414344293),
(499, 1, 1, 977128489, 'member', 1, '123在2014-10-27 02:05登录了后台', 1, 1414346721),
(500, 1, 1, 977128489, 'member', 1, '123在2014-10-27 02:06登录了后台', 1, 1414346776),
(501, 1, 1, 977127763, 'member', 1, '123在2014-10-27 04:55登录了后台', 1, 1414356938),
(502, 1, 1, 977127763, 'member', 1, '123在2014-10-27 06:15登录了后台', 1, 1414361711),
(503, 1, 1, 1902943685, 'member', 1, '123在2014-10-27 18:07登录了后台', 1, 1414404454),
(504, 6, 1, 977127763, 'config', 49, '操作url：/admin.php?s=/Config/edit.html', 1, 1414407504),
(505, 1, 1, 1902943685, 'member', 1, '123在2014-10-27 19:34登录了后台', 1, 1414409692),
(506, 1, 1, 2102927650, 'member', 1, '123在2014-10-28 15:58登录了后台', 1, 1414483107),
(507, 1, 1, 2102927650, 'member', 1, '123在2014-10-28 18:26登录了后台', 1, 1414492010),
(508, 1, 1, 2102927650, 'member', 1, '123在2014-10-28 21:08登录了后台', 1, 1414501702),
(509, 6, 1, 2102927650, 'config', 50, '操作url：/admin.php?s=/Config/edit.html', 1, 1414504839),
(510, 1, 1, 2102927650, 'member', 1, '123在2014-10-28 22:01登录了后台', 1, 1414504915),
(511, 1, 1, 2102927650, 'member', 1, '123在2014-10-28 22:03登录了后台', 1, 1414504984),
(512, 1, 1, 977127858, 'member', 1, '123在2014-10-29 03:15登录了后台', 1, 1414523704),
(513, 1, 1, 977127858, 'member', 1, '123在2014-10-29 14:32登录了后台', 1, 1414564347),
(514, 1, 1, 977127815, 'member', 1, '123在2014-10-29 15:57登录了后台', 1, 1414569466),
(515, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 16:57登录了后台', 1, 1414573052),
(516, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 17:25登录了后台', 1, 1414574718),
(517, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 17:41登录了后台', 1, 1414575684),
(518, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 18:04登录了后台', 1, 1414577081),
(519, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 18:15登录了后台', 1, 1414577706),
(520, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 21:17登录了后台', 1, 1414588666),
(521, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 22:25登录了后台', 1, 1414592717),
(522, 1, 1, 977127858, 'member', 1, '123在2014-10-29 23:05登录了后台', 1, 1414595119),
(523, 1, 1, 2102927650, 'member', 1, '123在2014-10-29 23:32登录了后台', 1, 1414596779),
(524, 1, 1, 977127821, 'member', 1, '123在2014-10-30 18:18登录了后台', 1, 1414664300),
(525, 1, 1, 977127821, 'member', 1, '123在2014-10-30 18:21登录了后台', 1, 1414664510),
(526, 6, 1, 977127821, 'config', 47, '操作url：/admin.php?s=/Config/edit.html', 1, 1414664772),
(527, 6, 1, 977127821, 'config', 46, '操作url：/admin.php?s=/Config/edit.html', 1, 1414664781),
(528, 8, 1, 977127821, 'attribute', 48, '操作url：/admin.php?s=/Attribute/update.html', 1, 1414669469),
(529, 8, 1, 977127821, 'attribute', 48, '操作url：/admin.php?s=/Attribute/remove/id/48.html', 1, 1414669495),
(530, 8, 1, 977127821, 'attribute', 46, '操作url：/admin.php?s=/Attribute/update.html', 1, 1414669506),
(531, 8, 1, 977127821, 'attribute', 46, '操作url：/admin.php?s=/Attribute/update.html', 1, 1414669588),
(532, 1, 1, 2102927650, 'member', 1, '123在2014-10-30 21:00登录了后台', 1, 1414674046),
(533, 11, 1, 2102927650, 'category', 72, '操作url：/admin.php?s=/Category/add.html', 1, 1414674812),
(534, 11, 1, 2102927650, 'category', 73, '操作url：/admin.php?s=/Category/add.html', 1, 1414674847),
(535, 11, 1, 2102927650, 'category', 74, '操作url：/admin.php?s=/Category/add.html', 1, 1414674877),
(536, 11, 1, 2102927650, 'category', 74, '操作url：/admin.php?s=/Category/edit.html', 1, 1414674888),
(537, 11, 1, 2102927650, 'category', 75, '操作url：/admin.php?s=/Category/add.html', 1, 1414674964),
(538, 11, 1, 2102927650, 'category', 76, '操作url：/admin.php?s=/Category/add.html', 1, 1414675003),
(539, 11, 1, 2102927650, 'category', 71, '操作url：/admin.php?s=/Category/edit.html', 1, 1414675134),
(540, 1, 1, 977127815, 'member', 1, '123在2014-10-30 22:35登录了后台', 1, 1414679721),
(541, 1, 1, 2130706433, 'member', 1, '123在2014-10-31 18:31登录了后台', 1, 1414751475),
(542, 6, 1, 2130706433, 'config', 55, '操作url：/admin.php?s=/Config/edit.html', 1, 1414761398),
(543, 6, 1, 2130706433, 'config', 51, '操作url：/admin.php?s=/Config/edit.html', 1, 1414769218),
(544, 6, 1, 2130706433, 'config', 56, '操作url：/admin.php?s=/Config/edit.html', 1, 1414769450),
(545, 6, 1, 2130706433, 'config', 51, '操作url：/admin.php?s=/Config/edit.html', 1, 1414771584),
(546, 1, 1, 2102927650, 'member', 1, '123在2014-11-01 00:18登录了后台', 1, 1414772296),
(547, 1, 1, 977128683, 'member', 1, '123在2014-11-01 03:44登录了后台', 1, 1414784684),
(548, 1, 1, 977128683, 'member', 1, '123在2014-11-01 03:44登录了后台', 1, 1414784690),
(549, 1, 1, 977128683, 'member', 1, '123在2014-11-01 03:44登录了后台', 1, 1414784697),
(550, 1, 1, 977128683, 'member', 1, '123在2014-11-01 03:45登录了后台', 1, 1414784720),
(551, 1, 1, 977128683, 'member', 1, '123在2014-11-01 03:48登录了后台', 1, 1414784923),
(552, 1, 1, 0, 'member', 1, '123在2014-11-01 16:21登录了后台', 1, 1414830080),
(553, 1, 1, 0, 'member', 1, '123在2014-11-01 16:23登录了后台', 1, 1414830187),
(554, 1, 1, 0, 'member', 1, '123在2014-11-01 19:54登录了后台', 1, 1414842898),
(555, 1, 1, 0, 'member', 1, '123在2014-11-02 02:40登录了后台', 1, 1414867234),
(556, 1, 1, 0, 'member', 1, '123在2014-11-02 02:46登录了后台', 1, 1414867570),
(557, 1, 1, 0, 'member', 1, '123在2014-11-02 02:52登录了后台', 1, 1414867959),
(558, 1, 1, 0, 'member', 1, '123在2014-11-02 02:54登录了后台', 1, 1414868083),
(559, 1, 1, 0, 'member', 1, '123在2014-11-02 14:57登录了后台', 1, 1414911424),
(560, 1, 1, 0, 'member', 1, '123在2014-11-02 14:57登录了后台', 1, 1414911469),
(561, 10, 1, 0, 'Menu', 153, '操作url：/admin.php?s=/Menu/add.html', 1, 1414911624),
(562, 10, 1, 0, 'Menu', 154, '操作url：/admin.php?s=/Menu/add.html', 1, 1414911671),
(563, 10, 1, 0, 'Menu', 155, '操作url：/admin.php?s=/Menu/add.html', 1, 1414911726),
(564, 1, 1, 0, 'member', 1, '123在2014-11-02 15:02登录了后台', 1, 1414911738),
(565, 1, 1, 0, 'member', 1, '123在2014-11-02 15:11登录了后台', 1, 1414912314),
(566, 10, 1, 0, 'Menu', 154, '操作url：/admin.php?s=/Menu/edit.html', 1, 1414926598),
(567, 10, 1, 0, 'Menu', 155, '操作url：/admin.php?s=/Menu/edit.html', 1, 1414926639),
(568, 1, 1, 0, 'member', 1, '123在2014-11-02 19:10登录了后台', 1, 1414926648),
(569, 1, 1, 0, 'member', 1, '123在2014-11-02 19:29登录了后台', 1, 1414927740),
(570, 10, 1, 0, 'Menu', 134, '操作url：/admin.php?s=/Menu/edit.html', 1, 1414928717),
(571, 1, 1, 0, 'member', 1, '123在2014-11-02 19:45登录了后台', 1, 1414928730),
(572, 1, 1, 0, 'member', 1, '123在2014-11-02 20:00登录了后台', 1, 1414929651),
(573, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:20登录了后台', 1, 1414930853),
(574, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:20登录了后台', 1, 1414930855),
(575, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:20登录了后台', 1, 1414930856),
(576, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:27登录了后台', 1, 1414931220),
(577, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:27登录了后台', 1, 1414931223),
(578, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:27登录了后台', 1, 1414931224),
(579, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:27登录了后台', 1, 1414931257),
(580, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:27登录了后台', 1, 1414931274),
(581, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:29登录了后台', 1, 1414931351),
(582, 1, 1, 2032207653, 'member', 1, '123在2014-11-02 20:29登录了后台', 1, 1414931357),
(583, 1, 1, 2102927650, 'member', 1, '123在2014-11-03 04:39登录了后台', 1, 1414960781),
(584, 1, 1, 2102927650, 'member', 1, '123在2014-11-03 04:39登录了后台', 1, 1414960783),
(585, 6, 1, 977127905, 'config', 40, '操作url：/admin.php?s=/Config/edit.html', 1, 1414964609),
(586, 1, 1, 977127905, 'member', 1, '123在2014-11-03 17:36登录了后台', 1, 1415007394),
(587, 1, 1, 977127905, 'member', 1, '123在2014-11-03 17:36登录了后台', 1, 1415007397),
(588, 1, 1, 977127905, 'member', 1, '123在2014-11-03 17:36登录了后台', 1, 1415007399),
(589, 1, 1, 2102927650, 'member', 1, '123在2014-11-04 02:57登录了后台', 1, 1415041066),
(590, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 04:51登录了后台', 1, 1415134319),
(591, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 04:53登录了后台', 1, 1415134382),
(592, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 04:53登录了后台', 1, 1415134385),
(593, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 04:59登录了后台', 1, 1415134766),
(594, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 05:06登录了后台', 1, 1415135212),
(595, 6, 1, 977127759, 'config', 58, '操作url：/admin.php?s=/Config/edit.html', 1, 1415136997),
(596, 6, 1, 977127759, 'config', 56, '操作url：/admin.php?s=/Config/edit.html', 1, 1415137255),
(597, 6, 1, 977127759, 'config', 56, '操作url：/admin.php?s=/Config/edit.html', 1, 1415137270),
(598, 6, 1, 977127759, 'config', 58, '操作url：/admin.php?s=/Config/edit.html', 1, 1415137282),
(599, 6, 1, 977127759, 'config', 60, '操作url：/admin.php?s=/Config/edit.html', 1, 1415137483),
(600, 6, 1, 977127759, 'config', 62, '操作url：/admin.php?s=/Config/edit.html', 1, 1415137548),
(601, 6, 1, 977127759, 'config', 63, '操作url：/admin.php?s=/Config/edit.html', 1, 1415137627),
(602, 1, 1, 977127759, 'member', 1, '123在2014-11-05 05:59登录了后台', 1, 1415138361),
(603, 1, 1, 977127759, 'member', 1, '123在2014-11-05 05:59登录了后台', 1, 1415138383),
(604, 1, 1, 977127759, 'member', 1, '123在2014-11-05 05:59登录了后台', 1, 1415138394),
(605, 1, 1, 977127759, 'member', 1, '123在2014-11-05 06:01登录了后台', 1, 1415138476),
(606, 1, 1, 977128797, 'member', 1, '123在2014-11-05 06:02登录了后台', 1, 1415138555),
(607, 1, 1, 977127759, 'member', 1, '123在2014-11-05 06:08登录了后台', 1, 1415138880),
(608, 1, 1, 977128797, 'member', 1, '123在2014-11-05 06:08登录了后台', 1, 1415138903),
(609, 1, 1, 977127759, 'member', 1, '123在2014-11-05 06:10登录了后台', 1, 1415139011),
(610, 1, 1, 977127759, 'member', 1, '123在2014-11-05 06:10登录了后台', 1, 1415139053),
(611, 1, 1, 977127759, 'member', 1, '123在2014-11-05 06:11登录了后台', 1, 1415139064),
(612, 1, 1, 977127759, 'member', 1, '123在2014-11-05 06:13登录了后台', 1, 1415139207),
(613, 1, 2, 2102927650, 'member', 2, '111在2014-11-05 07:44登录了后台', 1, 1415144674),
(614, 1, 3, 977127693, 'member', 3, '456在2014-11-05 07:50登录了后台', 1, 1415145053),
(615, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:55登录了后台', 1, 1415145316),
(616, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:55登录了后台', 1, 1415145320),
(617, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:56登录了后台', 1, 1415145378),
(618, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:56登录了后台', 1, 1415145379),
(619, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:56登录了后台', 1, 1415145380),
(620, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:56登录了后台', 1, 1415145404),
(621, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 07:56登录了后台', 1, 1415145405),
(622, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:01登录了后台', 1, 1415145696),
(623, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:01登录了后台', 1, 1415145701),
(624, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:01登录了后台', 1, 1415145716),
(625, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:03登录了后台', 1, 1415145804),
(626, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:03登录了后台', 1, 1415145805),
(627, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:03登录了后台', 1, 1415145806),
(628, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 08:04登录了后台', 1, 1415145855),
(629, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178015),
(630, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178017),
(631, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178019),
(632, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178020),
(633, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178021),
(634, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178022),
(635, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178023),
(636, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178024),
(637, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 17:00登录了后台', 1, 1415178025),
(638, 1, 4, 2102927650, 'member', 4, '12311231在2014-11-05 17:11登录了后台', 1, 1415178697),
(639, 1, 1, 1900181564, 'member', 1, '123在2014-11-05 19:43登录了后台', 1, 1415187786),
(640, 1, 1, 1900181564, 'member', 1, '123在2014-11-05 19:43登录了后台', 1, 1415187788),
(641, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 22:59登录了后台', 1, 1415199578),
(642, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 22:59登录了后台', 1, 1415199590),
(643, 1, 1, 2102927650, 'member', 1, '123在2014-11-05 23:00登录了后台', 1, 1415199640),
(644, 1, 1, 977127759, 'member', 1, '123在2014-11-06 03:52登录了后台', 1, 1415217143),
(645, 1, 1, 977127759, 'member', 1, '123在2014-11-06 03:52登录了后台', 1, 1415217145),
(646, 1, 1, 977127759, 'member', 1, '123在2014-11-06 03:52登录了后台', 1, 1415217145),
(647, 1, 1, 977127759, 'member', 1, '123在2014-11-06 04:01登录了后台', 1, 1415217676),
(648, 1, 1, 977127759, 'member', 1, '123在2014-11-06 04:01登录了后台', 1, 1415217681),
(649, 1, 1, 977127759, 'member', 1, '123在2014-11-06 04:01登录了后台', 1, 1415217682),
(650, 1, 1, 977127759, 'member', 1, '123在2014-11-06 04:01登录了后台', 1, 1415217682),
(651, 1, 1, 977127759, 'member', 1, '123在2014-11-06 04:01登录了后台', 1, 1415217683),
(652, 1, 1, 1900181897, 'member', 1, '123在2014-11-08 19:32登录了后台', 1, 1415446367),
(653, 1, 1, 2102927650, 'member', 1, '123在2014-11-08 21:46登录了后台', 1, 1415454390),
(654, 1, 1, 2102927650, 'member', 1, '123在2014-11-08 23:46登录了后台', 1, 1415461596),
(655, 1, 1, 2102927650, 'member', 1, '123在2014-11-08 23:49登录了后台', 1, 1415461762),
(656, 11, 1, 1900181897, 'category', 77, '操作url：/admin.php?s=/Category/add.html', 1, 1415464640),
(657, 1, 1, 1900181897, 'member', 1, '123在2014-11-09 00:58登录了后台', 1, 1415465904),
(658, 1, 1, 1903661226, 'member', 1, '123在2014-11-09 02:32登录了后台', 1, 1415471559),
(659, 1, 1, 1903661226, 'member', 1, '123在2014-11-09 02:32登录了后台', 1, 1415471560),
(660, 1, 1, 1903661226, 'member', 1, '123在2014-11-09 02:32登录了后台', 1, 1415471561),
(661, 6, 1, 1903661226, 'config', 64, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472076),
(662, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/60.html', 1, 1415472122),
(663, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/61.html', 1, 1415472128),
(664, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/58.html', 1, 1415472132),
(665, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/59.html', 1, 1415472138),
(666, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/62.html', 1, 1415472143),
(667, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/63.html', 1, 1415472148),
(668, 6, 1, 1903661226, 'config', 65, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472253),
(669, 6, 1, 1903661226, 'config', 65, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472314),
(670, 6, 1, 1903661226, 'config', 64, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472347),
(671, 6, 1, 1903661226, 'config', 65, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472405),
(672, 6, 1, 1903661226, 'config', 0, '操作url：/admin.php?s=/Config/del/id/65.html', 1, 1415472432),
(673, 6, 1, 1903661226, 'config', 67, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472498),
(674, 6, 1, 1903661226, 'config', 67, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472541),
(675, 6, 1, 1903661226, 'config', 66, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472564),
(676, 6, 1, 1903661226, 'config', 66, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472584),
(677, 6, 1, 1903661226, 'config', 67, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472604),
(678, 6, 1, 1903661226, 'config', 68, '操作url：/admin.php?s=/Config/edit.html', 1, 1415472680),
(679, 6, 1, 1903661226, 'config', 70, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473140),
(680, 6, 1, 1903661226, 'config', 69, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473153),
(681, 6, 1, 1903661226, 'config', 69, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473174),
(682, 6, 1, 1903661226, 'config', 73, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473424),
(683, 6, 1, 1903661226, 'config', 67, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473488),
(684, 6, 1, 1903661226, 'config', 66, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473499),
(685, 6, 1, 1903661226, 'config', 68, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473508),
(686, 6, 1, 1903661226, 'config', 69, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473522),
(687, 6, 1, 1903661226, 'config', 70, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473533),
(688, 6, 1, 1903661226, 'config', 71, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473540),
(689, 6, 1, 1903661226, 'config', 72, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473553),
(690, 6, 1, 1903661226, 'config', 51, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473565),
(691, 6, 1, 1903661226, 'config', 68, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473893),
(692, 6, 1, 1903661226, 'config', 68, '操作url：/admin.php?s=/Config/edit.html', 1, 1415473914),
(693, 10, 1, 1903661226, 'Menu', 156, '操作url：/admin.php?s=/Menu/add.html', 1, 1415474375);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_addons`
--

CREATE TABLE IF NOT EXISTS `onethink_addons` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `onethink_addons`
--

INSERT INTO `onethink_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(16, 'OTcaiji', 'OT采集', 'OT采集插件', 1, '{"codelogin":1,"KEYWORDS":"","URL":"","LIST":"","TITLE":"","CONTENT":""}', 'Marvin(柳英伟)', '0.2', 1411634246, 1),
(17, 'ReturnTop', '返回顶部', '回到顶部美化，随机或指定显示，100款样式，每天一种换，天天都用新样式', 0, '{"random":"0","current":"79"}', 'thinkphp', '0.1', 1411634594, 0),
(22, 'AliPlay', '支付宝', '支付宝插件,后台配置支持变量。如：价格：$GOODS["price"].但是配置的变量要和数据库商品信息一致。', 1, '{"pay_type":"1","codelogin":"1","PARTNER":"5456464","KEY":"546","SELLER_EMAIL":"54645464","NOTIFY_URL":"","RETURN_URL":"","out_trade_no":"132564546564","subject":"132564546564","price":"{$goodprice}","logistics_fee":"10","logistics_type":"EXPRESS","logistics_payment":"SELLER_PAY","body":"","show_url":"132564546564","receive_name":"","receive_address":"","receive_zip":"","receive_mobile":"13312341234","receive_phone":"13312341234"}', 'Marvin(柳英伟)', '2.0', 1412762558, 0),
(19, 'Iyo9Table', '点击成可编辑插件', '向着要编辑的位置点击一下，访位置会变成一个可编辑的input标签，编辑好后，鼠标再点击空白地方，即可保存', 1, 'null', 'i友街', '0.1', 1411636824, 0),
(21, 'Template', '模版管理', '模版在线编辑插件', 1, 'null', 'Marvin(柳英伟)', '1.0', 1411637366, 1),
(23, 'SyncLogin', '第三方账号同步登陆', '第三方账号同步登陆', 1, '{"type":["Qq","Sina"],"meta":"<meta property=\\"qc:admins\\" content=\\"14506550626121552166547\\" \\/>","QqKEY":"101164201","QqSecret":"bacdcc5fc9dec5fdff2a706a41f8f819","SinaKEY":"2304590390","SinaSecret":"c6217f28e5aceb678ba2e862a79ffcbc"}', 'yidian', '0.1', 1412762818, 0),
(26, 'ThirdLogin', '快捷登录插件', '目前登录平台为：腾讯QQ，其它请自行添加', 1, '{"login_plugin":["sina","qq"],"platformMeta":"<meta \\/>","sina_wb_akey":"","sina_wb_skey":"","qq_qzone_akey":"","qq_qzone_skey":""}', 'iszhang', '0.1', 1414484131, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_attachment`
--

CREATE TABLE IF NOT EXISTS `onethink_attachment` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_attribute`
--

CREATE TABLE IF NOT EXISTS `onethink_attribute` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `onethink_attribute`
--

INSERT INTO `onethink_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(36, 'content', '内容详细描述', 'text NOT NULL', 'editor', '', '', 1, '', 5, 0, 1, 1411376156, 1411376156, '', 3, '', 'regex', '', 3, 'function'),
(35, 'price', '价格', 'varchar(255) NOT NULL', 'string', '1.00', '', 1, '', 5, 0, 1, 1411430769, 1411375944, '', 3, '', 'regex', '', 3, 'function'),
(37, 'weight', '净重', 'varchar(255) NOT NULL', 'string', '500', 'g', 1, '', 5, 0, 1, 1411927788, 1411379961, '', 3, '', 'regex', '', 3, 'function'),
(38, 'totalsales', '总销量', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 5, 0, 1, 1411380076, 1411380076, '', 3, '', 'regex', '', 3, 'function'),
(39, 'area', '产地', 'varchar(255) NOT NULL', 'string', '中国大陆', '', 1, '', 5, 0, 1, 1411380147, 1411380147, '', 3, '', 'regex', '', 3, 'function'),
(40, 'ads_pic_id', '首页幻灯大图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '首页幻灯大图', 1, '', 5, 0, 1, 1411815168, 1411815168, '', 3, '', 'regex', '', 3, 'function'),
(41, 'adtitle', '广告宣传标题', 'varchar(255) NOT NULL', 'string', '', '副标题', 1, '', 5, 0, 1, 1411815491, 1411815491, '', 3, '', 'regex', '', 3, 'function'),
(42, 'yprice', '原价', 'varchar(255) NOT NULL', 'string', '', '产品原价', 1, '', 5, 0, 1, 1411919829, 1411919829, '', 3, '', 'regex', '', 3, 'function'),
(43, 'mark', '附加标签', 'varchar(255) NOT NULL', 'string', '', '1-最新上架，2-限时抢购，3-热卖商品，4-限时折扣', 1, '', 5, 0, 1, 1412016261, 1412016196, '', 3, '', 'regex', '', 3, 'function'),
(44, 'unionid', '关联商品', 'varchar(255) NOT NULL', 'string', '', '关联商品id,如3,9,10，逗号隔开', 1, '', 5, 0, 1, 1413845084, 1413845084, '', 3, '', 'regex', '', 3, 'function'),
(47, 'shorttitle', '商品简称', 'varchar(255) NOT NULL', 'string', '', '商品简称', 1, '', 5, 0, 1, 1414329390, 1414329390, '', 3, '', 'regex', '', 3, 'function'),
(46, 'stock', '库存', 'int(10) UNSIGNED NOT NULL', 'num', '10', '商品库存数量', 1, '', 5, 0, 1, 1414669588, 1414177236, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_extend`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`) USING BTREE,
  KEY `uid` (`group_id`) USING BTREE,
  KEY `group_id` (`extend_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_group`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `onethink_auth_group`
--

INSERT INTO `onethink_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_rule`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=236 ;

--
-- 转存表中的数据 `onethink_auth_rule`
--

INSERT INTO `onethink_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', -1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/think/lists', '数据列表', 1, ''),
(218, 'admin', 1, 'Admin/Order/index', '已提交订单', 1, ''),
(219, 'admin', 1, 'Admin/Ordertransport/index', '已发货订单', 1, ''),
(220, 'admin', 2, 'Admin/Order/index', '订单', 1, ''),
(221, 'admin', 1, 'Admin/Ordercomplete/index', '已签收订单', 1, ''),
(222, 'admin', 1, 'Admin/Fcoupon/index', '优惠券', 1, ''),
(223, 'admin', 2, 'Admin/Statistics/index', '数据', 1, ''),
(224, 'admin', 1, 'Admin/Back/index', '正退货订单', 1, ''),
(225, 'admin', 1, 'Admin/Backagree/index', '同意退货订单', 1, ''),
(226, 'admin', 1, 'Admin/Backover/index', '已退货订单', 1, ''),
(227, 'admin', 1, 'Admin/Change/index', '正换货商品', 1, ''),
(228, 'admin', 1, 'Admin/Changeagree/index', '同意换货商品', 1, ''),
(229, 'admin', 1, 'Admin/Changeover/index', '已换货商品', 1, ''),
(230, 'admin', 1, 'Admin/Statistics/index', '今日销量统计', 1, ''),
(231, 'admin', 1, 'Admin/Statistics/week', '本周销量统计', 1, ''),
(232, 'admin', 1, 'Admin/Statistics/month', '本月销量统计', 1, ''),
(233, 'admin', 1, 'Admin/Report/index', '每日数据', 1, ''),
(234, 'admin', 1, 'Admin/Report/week', '每周数据', 1, ''),
(235, 'admin', 1, 'Admin/Report/month', '每月统计', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_backlist`
--

CREATE TABLE IF NOT EXISTS `onethink_backlist` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `onethink_backlist`
--

INSERT INTO `onethink_backlist` (`ID`, `goodid`, `num`, `tool`, `toolid`, `status`, `time`, `info`, `total`, `backinfo`, `addressid`, `update_time`, `assistant`, `shopid`, `title`, `reason`) VALUES
(4, 8, 4654, NULL, NULL, 3, NULL, '同意', 0.00, '退货已完成', 21, 1414070662, NULL, NULL, NULL, NULL),
(5, 8, 2, NULL, NULL, 1, 1414087501, '暂无', 10.00, '同意退货', 21, 1414071941, NULL, NULL, NULL, NULL),
(6, 9, 2, NULL, NULL, 1, 1414067582, '暂无', 0.00, '正在编辑', 22, 1414092363, NULL, NULL, NULL, NULL),
(13, 18, 0, NULL, NULL, 1, 1414863876, '', NULL, NULL, NULL, NULL, NULL, 878, '', ''),
(24, 18, NULL, NULL, NULL, 1, 1414864155, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 18, NULL, NULL, NULL, 1, 1414864404, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 18, NULL, NULL, NULL, 1, 1414864451, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 18, NULL, NULL, NULL, 1, 1414864520, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 18, NULL, NULL, NULL, 1, 1414864577, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 18, NULL, NULL, NULL, 1, 1414864657, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 18, NULL, NULL, NULL, 1, 1414864840, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 18, NULL, NULL, NULL, 1, 1414912329, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 18, NULL, NULL, NULL, 1, 1414912373, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 18, 1, NULL, NULL, 1, 1414912849, '', NULL, NULL, NULL, NULL, NULL, 878, '1', '5665'),
(34, 18, NULL, NULL, NULL, 1, 1414912852, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 18, NULL, NULL, NULL, 1, 1414914843, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 18, NULL, NULL, NULL, 1, 1414914924, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 18, NULL, NULL, NULL, 1, 1414914932, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cancel`
--

CREATE TABLE IF NOT EXISTS `onethink_cancel` (
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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `onethink_cancel`
--

INSERT INTO `onethink_cancel` (`ID`, `goodid`, `num`, `orderid`, `time`, `title`, `reason`, `update_time`, `assistant`, `shopid`, `refuse_info`, `status`, `info`) VALUES
(18, NULL, NULL, 'DB022428935646351907', 1414924350, '55', '555', 1414927662, NULL, NULL, '', 2, '取消完成'),
(20, NULL, NULL, 'DB022446945490710824', 1414924611, '', '', 1414926443, NULL, NULL, '65564', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_category`
--

CREATE TABLE IF NOT EXISTS `onethink_category` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=78 ;

--
-- 转存表中的数据 `onethink_category`
--

INSERT INTO `onethink_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `ismenu`) VALUES
(52, 'fruit', '新鲜水果', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1411925214, 1413845667, 1, 0, 1),
(40, 'vegetable', '新鲜蔬菜', 0, 2, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1411331932, 1413845937, 1, 6, 1),
(41, 'root vegetables ', '根菜类', 40, 3, 10, '', '', '', '', '', '', '', '5', '5', '2', 0, 1, 1, 0, 0, '', '', 1411332731, 1413845950, 1, 0, 1),
(42, 'leaf vegetables', '叶菜类', 40, 4, 10, '', '', '', '', '', '', '', '2,3,5', '', '2', 0, 1, 1, 0, 0, '', '', 1411332913, 1412523532, 1, 0, 1),
(43, 'stem vegetable', '茎菜类', 40, 5, 10, '', '', '', '', '', '', '', '2,3,5', '', '2', 0, 1, 1, 0, 0, '', '', 1411332994, 1412523540, 1, 0, 1),
(44, 'flower vegetable', '花菜类', 40, 6, 10, '', '', '', '', '', '', '', '2,3,5', '', '2', 0, 1, 1, 0, 0, '', '', 1411333039, 1412523548, 1, 0, 1),
(45, ' fruit-vegetable', '果菜类', 40, 7, 10, '', '', '', '', '', '', '', '2,3,5', '', '2', 0, 1, 1, 0, 0, '', '', 1411333095, 1412523556, 1, 0, 1),
(58, 'j_fruit', '进口水果', 52, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1411935041, 1413845696, 1, 0, 1),
(56, 'notice', '公告', 0, 8, 10, '', '', '', '', '', '', '', '2', '5', '2', 0, 1, 1, 0, 1, '', '', 1411929200, 1414003441, 1, 0, 0),
(57, 'c_fruit', '国内水果', 52, 0, 10, '', '', '', '', '', '', '', '2,3,5', '5', '2', 0, 1, 1, 0, 0, '', '', 1411934874, 1413198856, 1, 0, 1),
(68, 'coupon', '优惠券', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', '2', 0, 1, 1, 0, 0, '', '', 1413987264, 1414344293, 1, 0, 0),
(70, 'activity', '活动', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', '', 1414338807, 1414338807, 1, 0, 0),
(71, 'tushu', '图书音像', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2', 0, 1, 1, 0, 0, '', '', 1414344085, 1414675134, 1, 0, 1),
(72, 'xie', '名鞋箱包', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1414674812, 1414674812, 1, 0, 1),
(73, 'car', '汽车用品', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1414674847, 1414674847, 1, 0, 1),
(74, 'electric', '电子数码', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1414674877, 1414674888, 1, 0, 1),
(75, 'fushi', '潮流服饰', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1414674964, 1414674964, 1, 0, 1),
(76, 'jiaju', '创意家居', 0, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', '', 1414675003, 1414675003, 1, 0, 1),
(77, 'gmlc', '购买流程', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', '2', 0, 1, 1, 0, 0, '', '', 1415464640, 1415464640, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_change`
--

CREATE TABLE IF NOT EXISTS `onethink_change` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `onethink_change`
--

INSERT INTO `onethink_change` (`ID`, `goodid`, `num`, `orderid`, `tool`, `toolid`, `uid`, `status`, `time`, `info`, `total`, `backinfo`, `shopid`, `update_time`, `assistant`, `title`, `reson`) VALUES
(12, 18, 1, NULL, NULL, NULL, NULL, 1, 1414915154, '', NULL, NULL, 878, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_channel`
--

CREATE TABLE IF NOT EXISTS `onethink_channel` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `onethink_channel`
--

INSERT INTO `onethink_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1412579864, 1, 0),
(7, 0, '新鲜水果', 'Article/index?category=fruit', 5, 1412760390, 1413205567, 1, 0),
(5, 4, '根菜类', 'Article/index?category=root vegetables', 0, 1411719441, 1411719441, 1, 0),
(8, 0, '个人中心', 'Center/index', 4, 1412872458, 1413205562, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_check_info`
--

CREATE TABLE IF NOT EXISTS `onethink_check_info` (
  `uid` int(11) DEFAULT NULL,
  `con_num` int(11) DEFAULT '1',
  `total_num` int(11) DEFAULT '1',
  `ctime` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_config`
--

CREATE TABLE IF NOT EXISTS `onethink_config` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- 转存表中的数据 `onethink_config`
--

INSERT INTO `onethink_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台*显示标题*', 1378898976, 1412577255, 1, 'onethink商城系统-支付系统，b2c商城系统,thinkphp商城系统,', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'b2c商城系统-ohshop b2c商城系统-，thinkphp商城系统', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink，b2c商城系统,ohshop b2c商城系统-，thinkphp商城系统', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '沪ICP备12007941号-2', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰\r\namaze:妹子UI', '后台颜色风格', 1379122533, 1411636415, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1414272713, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:费用\r\n6:商城\r\n7:接口', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(40, 'HOTSEARCH', 1, '热词', 1, '', '热门搜索词，必须逗号隔开', 1413221018, 1414964609, 1, '佳沃智利进口蓝莓，香蕉,苹果,香梨,红提', 0),
(41, 'SHIPPRICE', 0, '运费', 5, '', '低于一定金额的运费', 1414001070, 1414001482, 1, '10', 0),
(42, 'LOWWEST', 0, '最低消费金额', 5, '', '用户最低消费的金额，低于该金额，则增加运费', 1414001165, 1414001495, 1, '50', 0),
(43, 'RATIO', 0, '积分现金兑换比', 5, '', '1000表示1000积分可兑换成1元', 1414153401, 1414153401, 1, '1000', 0),
(44, 'DEADTIME', 0, '退货有效期', 5, '', '从订单签收完成多少天内可以退货', 1414164561, 1414164642, 1, '7', 0),
(45, 'CHANGETIME', 0, '换货期', 5, '', '订单签收多少天内后可以换货', 1414164627, 1414164654, 1, '15', 0),
(46, 'QQ', 1, 'QQ客服', 6, '', '网站客服的qq代码', 1414183635, 1414664781, 1, '1010422715', 0),
(47, 'ALWW', 0, '阿里旺旺号', 6, '', '网站阿里旺旺客服', 1414183716, 1414664772, 1, '', 0),
(48, 'IP_TONGJI', 4, '开启ip访问统计', 3, '0:关闭,1:开启', '开启后追踪用户的访问页面，访问明细，访问地域', 1414244159, 1414244270, 1, '1', 0),
(49, 'LAG', 0, '统计时间间隔（小时）', 3, '', '重复访问的会员每隔多少时间统计，小于这一时间，不统计', 1414258358, 1414407504, 1, '6', 21),
(50, 'DOMAIN', 1, '网站域名', 1, '', '网站域名', 1414504643, 1414504839, 1, 'http://www.ijquery.net/', 0),
(51, '100KEY', 1, '0-快递100查询key', 7, '', '申请地址：http://www.kuaidi100.com/openapi/applyapi.shtml，用于查询运单号', 1414664721, 1415473565, 1, 'f2ea02e8bbb75187', 0),
(52, 'ADDRESS', 1, '发货地址', 6, '', '卖家的发货地址', 1414664871, 1414664871, 1, '广东广州', 0),
(53, 'CONTACT', 1, '联系电话', 6, '', '卖家的联系方式', 1414664911, 1414664911, 1, '13645000000', 0),
(54, 'SHOPNAME', 1, '卖家名称', 6, '', '卖家发货时填写的昵称', 1414665008, 1414665008, 1, '小米', 0),
(55, 'SITENAME', 1, '网站名称', 1, '', '用于网站支付时显示，如土豆网', 1414761363, 1414761398, 1, 'yershop商城', 0),
(56, 'ALIPAYPARTNER', 1, '1-支付宝商户号', 7, '', '这里是你在成功申请支付宝接口后获取到的PID', 1414769351, 1415137270, 1, '', 0),
(57, 'ALIPAYKEY', 1, '支付宝密钥', 7, '', '这里是你在成功申请支付宝接口后获取到的Key', 1414769402, 1414769402, 1, '', 0),
(67, 'TENPAYPARTNER', 1, '2-财付通合作者ID', 7, '', '合作者ID，财付通有该配置，开通财付通账户后给予', 1415472468, 1415473488, 1, '', 1),
(66, 'TENPAYKEY', 1, '财付通加密key', 7, '', '加密key，开通财付通账户后给予', 1415472288, 1415473499, 1, '', 2),
(68, 'PALPAYPARTNER', 1, '3-贝宝账号', 7, '', '合作者ID，贝宝有该配置，开通贝宝账户后给予不需密码', 1415472655, 1415473914, 1, '', 3),
(69, 'YEEPAYPARTNER', 1, '4-易付宝合作者id', 7, '', '易付宝给予的合作者id', 1415472817, 1415473522, 1, '', 4),
(64, 'ALIPAYEMAIL', 1, '支付宝收款账号', 7, '', '支付宝收款账号邮箱', 1415472043, 1415472347, 1, '', 0),
(70, 'YEEPAYKEY', 1, '易付宝密钥', 7, '', '易付宝合作者的密钥', 1415473084, 1415473533, 1, '', 5),
(71, 'KUAIQIANPARTNER', 1, '5-快钱合作者id', 7, '', '合作者ID，快钱有该配置，开通财付通账户后给予', 1415473241, 1415473540, 1, '', 5),
(72, 'KUAIQIANKEY', 1, '快钱key', 7, '', '加密key，开通快钱账户后给予', 1415473293, 1415473553, 1, '', 5),
(73, 'UNIONPARTNER', 1, '6-银联合作者账号', 7, '', '合作者ID，银联有该配置，开通银联账户后给予', 1415473364, 1415473424, 1, '', 6),
(74, 'UNIONKEY', 1, '银联key', 7, '', ' 加密key，开通银联账户后给予', 1415473475, 1415473475, 1, '', 6);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document`
--

CREATE TABLE IF NOT EXISTS `onethink_document` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `onethink_document`
--

INSERT INTO `onethink_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(12, 1, '', '肯德基电子优惠券', 68, '1236589443679', 0, 0, 2, 2, 0, 0, 11, 1, 0, 0, 5, 0, 0, 0, 1413988167, 1413988167, 1),
(5, 1, '', '金灯果（又名“姑娘果”）（盒装1000g）', 45, '', 0, 0, 5, 2, 4, 0, 15, 1, 0, 0, 864, 0, 0, 0, 1411380420, 1414338160, 1),
(8, 1, '', '【天天果园】智利青苹果12个', 57, '酸爽多汁，肉质细嫩，高品质新鲜保证', 0, 0, 5, 2, 2, 0, 7, 1, 0, 0, 596, 0, 0, 0, 1411927620, 1414532702, 1),
(9, 1, '', '常鲜生 正宗菲律宾进口香蕉', 57, '', 0, 0, 5, 2, 4, 0, 9, 1, 0, 0, 257, 0, 0, 0, 1411928400, 1414533394, 1),
(13, 1, '', '冷冻（藏）品只配送京津', 56, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1414333120, 1414333120, 1),
(14, 1, '', '褚橙开售', 57, '', 0, 0, 5, 2, 4, 0, 17, 1, 0, 0, 59, 0, 0, 0, 1414339080, 1414343243, 1),
(15, 1, '', '河南河阴软籽石榴（中果） 4粒装（单果重250-300g）', 57, '', 0, 0, 5, 2, 0, 0, 20, 1, 0, 0, 33, 0, 0, 0, 1414342440, 1414343076, 1),
(16, 1, '', '佳沃智利进口蓝莓一级果125g', 57, '', 0, 0, 5, 2, 0, 0, 21, 1, 0, 0, 96, 0, 0, 0, 1414342560, 1414343180, 1),
(17, 1, '', '新疆红提950-1000g', 57, '', 0, 0, 5, 2, 0, 0, 24, 1, 0, 0, 165, 0, 0, 0, 1414342620, 1414343496, 1),
(18, 1, '', '新疆库尔勒香梨 950g-1000g 香而清甜，虽小却好吃', 57, '', 0, 0, 5, 2, 0, 0, 23, 1, 0, 0, 72, 0, 0, 0, 1414342680, 1414343054, 1),
(19, 1, '', '在线支付', 77, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1415464949, 1415464949, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_article`
--

CREATE TABLE IF NOT EXISTS `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `onethink_document_article`
--

INSERT INTO `onethink_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(1, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(4, 0, '<div id="description" class="tshop-psm ke-post J_DetailSection">\r\n	<div class="content" id="J_DivItemDesc">\r\n		<p style="background:white;">\r\n			<b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;">营养价值</span></b><b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:arial sans-serif;"></span></b> \r\n		</p>\r\n		<p style="background:white;text-indent:-35.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-size:14.0pt;font-family:宋体;">韭菜的</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>营养</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">价值很高，每</span><span style="font-size:14.0pt;"><span>100</span></span><span style="font-size:14.0pt;font-family:宋体;">克可食用部分含</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>蛋白质</span></span></a></span><span style="font-size:14.0pt;"><span>2~2.85</span></span><span style="font-size:14.0pt;font-family:宋体;">克，脂肪</span><span style="font-size:14.0pt;"><span>0.2~0.5</span></span><span style="font-size:14.0pt;font-family:宋体;">克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>碳水化合物</span></span></a></span><span style="font-size:14.0pt;"><span>2.4~6</span></span><span style="font-size:14.0pt;font-family:宋体;">克，纤维素</span><span style="font-size:14.0pt;"><span>0.6~3.2</span></span><span style="font-size:14.0pt;font-family:宋体;">克。还有大量的维生素，如</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>胡萝卜素</span></span></a></span><span style="font-size:14.0pt;"><span>0.08~3.26</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>核黄素</span></span></a></span><span style="font-size:14.0pt;"><span>0.05~0.8</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>尼克酸</span></span></a></span><span style="font-size:14.0pt;"><span>0.3~1</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，维生素</span><span style="font-size:14.0pt;"><span>C10~62.8</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，韭菜含的矿质元素也较多，如钙</span><span style="font-size:14.0pt;"><span>10~86</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，磷</span><span style="font-size:14.0pt;"><span>9~51</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，铁</span><span style="font-size:14.0pt;"><span>0.6~2.4</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，此外，韭菜含有挥发性的硫化丙烯，因此具有辛辣味，有促进食欲的作用。韭菜除做菜用外，还有良好的药用价值。</span></span> \r\n		</p>\r\n		<p style="background:white;text-indent:-35.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;"></span></span><b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;">饮食宜忌</span></b><b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:arial sans-serif;"></span></b> \r\n		</p>\r\n		<p style="background:white;text-indent:35.0pt;text-align:left;" align="left">\r\n			<span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、一般人群均能食用。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="background:white;text-indent:35.0pt;text-align:left;" align="left">\r\n			<span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、适宜便秘、产后想断乳的女性、</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>寒性体质</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">等人群。</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="background:white;text-indent:-21.0pt;text-align:left;" align="left">\r\n			<span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">、便秘者建议多吃，因为韭菜含有大量的</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>膳食纤维</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">，能改善肠道，润肠通便。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="background:white;text-indent:35.0pt;text-align:left;" align="left">\r\n			<span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">、现代医学认为，有阳亢及热性病症的人不宜食用。</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="background:white;text-indent:-21.0pt;text-align:left;" align="left">\r\n			<span><span style="font-size:14.0pt;"><span>5</span></span><span style="font-size:14.0pt;font-family:宋体;">、韭菜的粗纤维较多，不易消化吸收，所以一次不能吃太多韭菜，否则大量粗纤维刺激肠壁，</span><span style="font-size:14.0pt;font-family:宋体;">酒后尤忌</span><span style="font-size:14.0pt;font-family:宋体;">。</span></span><a name="8_2"></a><a name="sub25243_8_2"></a><span style="font-size:14.0pt;"></span> \r\n		</p>\r\n		<p>\r\n			<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>6</span></span><span style="font-size:14.0pt;font-family:宋体;">、韭菜偏热性，多食易上火，因此阴虚火旺者不宜多吃。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:35.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>7</span></span><span style="font-size:14.0pt;font-family:宋体;">、胃虚有热、消化不良不宜食用。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-21.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>8</span></span><span style="font-size:14.0pt;font-family:宋体;">、夏韭老化，纤维多而粗造，不易被人肠胃消化吸收，加之夏季胃肠蠕动，功能降低，多会引起胃肠不适或腹泻，因此夏季热时不宜多食。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:35.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>9</span></span><span style="font-size:14.0pt;font-family:宋体;">、熟的韭菜不能隔夜吃</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p>\r\n			<a name="11_2"></a><a name="sub25243_11_2"></a><b><span style="font-size:15.0pt;color:#0000cc;font-family:宋体;">推荐食谱</span></b><b><span style="font-size:15.0pt;color:#0000cc;"></span></b> \r\n		</p>\r\n		<p style="text-indent:27.75pt;">\r\n			<span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">韭菜炒蛋</span></b><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-35.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【原料】：韭菜</span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">两（约</span><span style="font-size:14.0pt;"><span>200</span></span><span style="font-size:14.0pt;font-family:宋体;">克），大鸡蛋</span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">只，调料：</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>生油</span></span></a></span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">汤匙，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>生粉</span></span></a></span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">茶匙，清水</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">汤匙，鸡粉</span><span style="font-size:14.0pt;"><span>1/4</span></span><span style="font-size:14.0pt;font-family:宋体;">茶匙，麻油</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">茶匙，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>胡椒粉</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">少许。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-35.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、韭菜洗净切小段；</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:28.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、生粉用水拌匀制成生粉水，待用；</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:28.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">、将调料、韭菜、生粉水一起拌匀；</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:28.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">、在大碗内搅散鸡蛋；</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-14.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>5</span></span><span style="font-size:14.0pt;font-family:宋体;">、炒锅烧热，放入三汤匙生油，待油热后，倒入韭菜、蛋液，快炒至凝固，即可装盘食用。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-14.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:28.0pt;">\r\n			<span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><b><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>豆丝韭菜</span></span></b></a></span><span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-49.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【原料】：韭菜</span><span style="font-size:14.0pt;"><span>500</span></span><span style="font-size:14.0pt;font-family:宋体;">克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>土豆</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">（黄皮）</span><span style="font-size:14.0pt;"><span>200</span></span><span style="font-size:14.0pt;font-family:宋体;">克。调料：胡麻油</span><span style="font-size:14.0pt;"><span>15</span></span><span style="font-size:14.0pt;font-family:宋体;">克，盐</span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>味精</span></span></a></span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">克。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-84.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：</span><span style="font-size:14.0pt;"><span>1.</span></span><span style="font-size:14.0pt;font-family:宋体;">韭菜洗净后切成段，放入沸水锅中焯一下，沥干水分；土豆洗净后去皮切成丝。</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-14.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>2.</span></span><span style="font-size:14.0pt;font-family:宋体;">花椒油、味精、</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>精盐</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">、韭菜段和土豆丝一起放入盆内，拌匀装盘即可。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span></span><span><span style="font-size:14.0pt;font-family:宋体;"></span></span> \r\n		</p>\r\n		<p>\r\n			<b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><span>&nbsp;</span></span></b> \r\n		</p>\r\n		<p style="text-indent:29.1pt;">\r\n			<span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">韭菜炒咸猪肉</span></b><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-49.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【原料】：</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>咸猪肉</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">片，韭菜，新鲜干</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>葱头</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">甲片，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>红萝卜</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">花，炸蒜片，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>小葱</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">度。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-42.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：锅内烧净</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>色拉油</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">至</span><span style="font-size:14.0pt;"><span>7</span></span><span style="font-size:14.0pt;font-family:宋体;">成热，逐片放入腌制好的咸猪肉片后离火，炸成略脆状后倒出。将韭菜花飞水后，加入少许味水略炒后倒出。锅内放少许油，倒入料头炒香，加入炸好咸猪肉片，韭菜花，料酒，味水芡汁（带少许</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>蚝油</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">），快速炒匀后亮油起锅。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p>\r\n			<b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><span>&nbsp;</span></span></b> \r\n		</p>\r\n		<p style="text-indent:29.1pt;">\r\n			<span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">培根炒韭菜</span></b><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:55.45pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【原料】：</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>韭菜</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">美式</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>培根</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">若干条、</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>食用油</span></span></a></span><span style="font-size:14.0pt;background:white;font-family:宋体;">、</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>盐</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">、</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>糖</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">。　</span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-77.0pt;">\r\n			<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、培根整条放入不粘锅中，小火煎至金黄肉脆，肥油全部渗出。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-14.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、取出培根条，切小片备用。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-14.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">、煎培根的原锅中添加适量的食用油（视韭菜量），油热后加入韭菜快速翻炒。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n		</p>\r\n		<p style="text-indent:-14.0pt;">\r\n			<span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">、韭菜断生后，立即加入培根片，少许盐，糖调味，出锅装盘即可。</span></span> \r\n		</p>\r\n	</div>\r\n</div>', '', 0),
(12, 0, '1236589443679', '', 0),
(13, 0, '<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">尊敬的本来生活网华北站用户：</span><br />\r\n<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">10月19日，华北站配送范围将作出调整：</span><br />\r\n<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">1， 冷冻（藏）品将只配送北京、天津全境。</span><br />\r\n<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">2， 停止冷冻（藏）品其他区域的配送服务。</span><br />\r\n<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">3， 常温商品配送范围不变（7省市49城），具体范围详见： http://www.benlai.com/help-11.html</span><br />\r\n<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">我们将持续为您提供优质服务，并祝您购物愉快。</span><br />\r\n<span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:35px;">本来生活网华北站 2014.10.17</span>', '', 0),
(19, 0, '<h4 style="font-family:''Lucida Grande'', Verdana, Helvetica, Arial, ''Microsoft YaHei'', Simsun, sans-serif;font-size:14px;font-weight:normal;color:#535353;background-color:#FFFFFF;">\r\n	1、选择支付宝支付，点击立即支付\r\n</h4>\r\n<img src="/Uploads/Editor/2014-11-09/545e47e28bbc1.png" alt="" /><br />\r\n<span style="color:#535353;font-family:''Microsoft YaHei'';font-size:14px;line-height:21px;background-color:#FFFFFF;"></span>\r\n<h4 style="font-family:''Lucida Grande'', Verdana, Helvetica, Arial, ''Microsoft YaHei'', Simsun, sans-serif;font-size:14px;font-weight:normal;color:#535353;background-color:#FFFFFF;">\r\n	2、登录自己的支付宝帐号。(需要检测支付环境并安装控件)\r\n</h4>\r\n<img src="http://shop.vivo.com.cn/themes/vivo/images/vivo/helpcenter/pic_alipay_step_2.jpg" /><span style="color:#535353;font-family:''Microsoft YaHei'';font-size:14px;line-height:21px;background-color:#FFFFFF;"></span>\r\n<h4 style="font-family:''Lucida Grande'', Verdana, Helvetica, Arial, ''Microsoft YaHei'', Simsun, sans-serif;font-size:14px;font-weight:normal;color:#535353;background-color:#FFFFFF;">\r\n	3、进入支付宝可以选择"余额支付"。（在支付宝账户余额不足未充值的情况下可以更改使用其他支付方式：快捷支付网银支付。）\r\n</h4>\r\n<img src="http://shop.vivo.com.cn/themes/vivo/images/vivo/helpcenter/pic_alipay_step_3.jpg" />', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_download`
--

CREATE TABLE IF NOT EXISTS `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

--
-- 转存表中的数据 `onethink_document_download`
--

INSERT INTO `onethink_document_download` (`id`, `parse`, `content`, `template`, `file_id`, `download`, `size`) VALUES
(2, 0, '<blockquote style="background-color:#F4F5F7;color:#999999;font-size:16px;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;">\r\n	题，并作了大量的改进，是一个值得升级的版本！\r\n</blockquote>\r\n<img src="http://yun.topthink.com/Uploads/Editor/2014-07-22/53ce00d943be3.png" alt="" /><br />\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:18px;"><span style="color:#E53333;"><b>OneThink会一如既往的让你的开发变得更简单！</b></span></span><br />\r\n<br />\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;">1.1开发版本会保持快速迭代，欢迎大家多参与。</span><br />\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;"> \r\n<blockquote style="background-color:#F4F5F7;color:#999999;font-size:16px;">\r\n	<b><span style="color:#E53333;">注意：最新的开发版本数据库驱动用PDO重写了，所以如果之前配置的是PDO驱动类型的话，请改成具体的数据库类型。</span></b> \r\n</blockquote>\r\n</span><br />\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;">[&nbsp;更新列表&nbsp;]</span><br />\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;"><b><span style="font-size:18px;"><b>1.1.140825_dev&nbsp;[2014.8.25]：</b></span></b></span><br />\r\n<ul style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;">\r\n	<li>\r\n		安装SQL文件更新\r\n	</li>\r\n	<li>\r\n		修复七牛上传驱动的命名空间\r\n	</li>\r\n	<li>\r\n		修正数据库备份类\r\n	</li>\r\n	<li>\r\n		修正一些警告错误\r\n	</li>\r\n	<li>\r\n		修正模板大小写问题\r\n	</li>\r\n	<li>\r\n		修正导航的授权显示\r\n	</li>\r\n	<li>\r\n		更新数据库驱动\r\n	</li>\r\n	<li>\r\n		hooks表增加status字段，修正使用lists方法查询时的bug\r\n	</li>\r\n	<li>\r\n		支持无钩子的插件安装\r\n	</li>\r\n	<li>\r\n		改进菜单获取方法\r\n	</li>\r\n	<li>\r\n		优化菜单显示&nbsp;采用session缓存&nbsp;修改菜单后需要重启才能生效\r\n	</li>\r\n</ul>\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;"><b><span style="font-size:18px;"><b>1.1.140817_dev&nbsp;[2014.8.17]：</b></span></b></span><br />\r\n<ul style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;">\r\n	<li>\r\n		修正一些警告错误\r\n	</li>\r\n	<li>\r\n		修正后台封面图片上传的显示问题\r\n	</li>\r\n	<li>\r\n		后台生成模型的时候支持指定名称和标识\r\n	</li>\r\n	<li>\r\n		修正后台模型生成获取数据表的错误\r\n	</li>\r\n	<li>\r\n		支持更准确的SQL记录\r\n	</li>\r\n	<li>\r\n		修正参数绑定可能导致的冲突问题\r\n	</li>\r\n	<li>\r\n		修正安装程序用户表写入生日字段默认值错误\r\n	</li>\r\n	<li>\r\n		改进Admin模块的ModelModel类的generate方法\r\n	</li>\r\n	<li>\r\n		改进article:list标签的category属性可以包含当前分类\r\n	</li>\r\n	<li>\r\n		修正数据备份操作\r\n	</li>\r\n</ul>\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;"><b><span style="font-size:18px;"><b>1.1.140809_dev&nbsp;[2014.8.9]：</b></span></b></span><br />\r\n<ul style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;">\r\n	<li>\r\n		升级核心框架，驱动类库采用PDO重写\r\n	</li>\r\n	<li>\r\n		修正后台文档列表查询的状态查询问题\r\n	</li>\r\n	<li>\r\n		去掉后台BaseLogic类的lists方法\r\n	</li>\r\n	<li>\r\n		简化后台模块的DocumentModel类，去掉部分不需要的方法\r\n	</li>\r\n	<li>\r\n		改进文档模型的name标识检测&nbsp;根分类下面不能重名\r\n	</li>\r\n	<li>\r\n		独立模型数据列表页改进\r\n	</li>\r\n	<li>\r\n		Home模块的Logic类改进\r\n	</li>\r\n	<li>\r\n		修正模型的属性定义中使用函数定义的问题\r\n	</li>\r\n	<li>\r\n		模板调整和删除一些无用的数据\r\n	</li>\r\n</ul>\r\n<span style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;background-color:#F4F6F8;font-size:24px;"><b><span style="font-size:18px;"><b>1.1.140726_dev&nbsp;[2014.7.26]：</b></span></b></span><br />\r\n<ul style="color:#333333;font-family:''Century Gothic'', ''MicroSoft YaHei'', ''hiragino sans GB'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;font-size:16px;background-color:#F4F6F8;">\r\n	<li>\r\n		文档模型的扩展属性支持在属性管理中设置是否必须、自动验证和自动完成，并且会自动和对应的Logic类合并；\r\n	</li>\r\n	<li>\r\n		安装完成后的后台访问错误修正；\r\n	</li>\r\n	<li>\r\n		修正多处警告错误；\r\n	</li>\r\n</ul>', '', 1, 0, 23324),
(3, 0, '<ul style="font-family:宋体, arial, sans-serif;color:#232426;background-color:#FFFFFF;">\r\n	<li style="color:#777777;">\r\n		上映年代：2014&nbsp;&nbsp;状态：全集\r\n	</li>\r\n	<li style="color:#777777;">\r\n		类型：\r\n	</li>\r\n	<li style="color:#777777;">\r\n		主演：<a href="http://www.beiwo.tv/index.php?s=vod-search-actor-%E6%B2%B3%E6%AD%A3%E5%AE%87.html" target="_blank">河正宇</a>&nbsp;<a href="http://www.beiwo.tv/index.php?s=vod-search-actor-%E5%A7%9C%E4%B8%9C%E5%85%83.html" target="_blank">姜东元</a>&nbsp;<a href="http://www.beiwo.tv/index.php?s=vod-search-actor-%E5%B0%B9%E6%99%BA%E6%85%A7.html" target="_blank">尹智慧</a>&nbsp;<a href="http://www.beiwo.tv/index.php?s=vod-search-actor-%E6%9D%8E%E7%92%9F%E8%8D%A3.html" target="_blank">李璟荣</a>\r\n	</li>\r\n	<li style="color:#777777;">\r\n		地区：韩国<img src="/111/Uploads/Editor/2014-09-18/5419eb8071136.png" alt="" />\r\n	</li>\r\n	<li style="color:#777777;">\r\n		更新日期：2014-09-08&nbsp;&nbsp;\r\n	</li>\r\n</ul>\r\n<p>\r\n	剧情： 描绘了19世纪朝鲜时代抢夺贪官污吏钱财救济百姓们的侠盗与士大夫们之间的对决。...<a href="http://www.beiwo.tv/vod/21258/#desc">详细剧情</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', 2, 0, 206166);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_product`
--

CREATE TABLE IF NOT EXISTS `onethink_document_product` (
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `onethink_document_product`
--

INSERT INTO `onethink_document_product` (`id`, `price`, `content`, `weight`, `totalsales`, `area`, `ads_pic_id`, `adtitle`, `yprice`, `mark`, `unionid`, `stock`, `shorttitle`) VALUES
(5, '20.98', '<p style="background:white;text-align:left;" align="left">\r\n	<br />\r\n</p>\r\n<span><span style="font-size:14.0pt;font-family:宋体;"></span></span>\r\n<p style="font-family:宋体, ''Arial Narrow'', HELVETICA;color:#333333;">\r\n	<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47" />\r\n</p>\r\n<div class="detl_pic" style="text-align:center;margin:10px 0px;color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n	<img src="http://image3.benlailife.com/ProductNewDetailImage/0102021623C/025.jpg" style="width:700px;" />\r\n	<div class="tal" style="text-align:left;">\r\n		&nbsp;\r\n	</div>\r\n<img src="http://image3.benlailife.com/ProductNewDetailImage/0102021623C/01p.jpg" style="width:700px;" />\r\n	<div class="tal" style="text-align:left;">\r\n		&nbsp;\r\n	</div>\r\n<img src="http://image3.benlailife.com/ProductNewDetailImage/0102021623C/93p.jpg" style="width:700px;" />\r\n</div>\r\n<br />', '500', 15, '中国大陆', 8, '迷你清甜 入口有芒果和草莓的清香', '', '2', '8,9', 1, ''),
(14, '1.00', '<div class="box990" id="layoutContent" style="margin:0px auto;padding:0px;border:none;color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n	<div class="zt_gz" id="container" style="margin:0px;padding:0px;border:none;background-color:#FFFFFF;">\r\n		<div class="gz_banner carousel" id="fader_container" style="margin:0px;padding:0px;border:none;">\r\n			<ul class="main contents" id="fader" style="vertical-align:bottom;">\r\n				<li class="list content" id="toLegend" style="vertical-align:bottom;">\r\n					<a><img src="http://image.benlailife.com/images/gz/special/chucheng/lunbo03.jpg" /></a> \r\n				</li>\r\n			</ul>\r\n			<ul class="fader_nav" style="vertical-align:bottom;">\r\n				<li class="list" id="prev" style="vertical-align:bottom;">\r\n				</li>\r\n				<li class="list" id="next" style="vertical-align:bottom;">\r\n				</li>\r\n			</ul>\r\n			<ul class="main cc_nav" id="nav" style="vertical-align:bottom;">\r\n				<li class="list" style="vertical-align:bottom;">\r\n					<a><img src="http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_01_on.jpg" /></a> \r\n				</li>\r\n				<li class="list" style="vertical-align:bottom;">\r\n					<img src="http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_02.jpg" /> \r\n				</li>\r\n				<li class="list" style="vertical-align:bottom;">\r\n					<a><img src="http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_03.jpg" /></a> \r\n				</li>\r\n			</ul>\r\n		</div>\r\n		<div style="margin:0px;padding:0px;border:none;">\r\n			<div class="sku" style="margin:0px;padding:0px;border:none;">\r\n				<ul class="main" id="sale" style="vertical-align:bottom;">\r\n					<li class="zcode list relative" style="vertical-align:bottom;">\r\n						<a href="http://www.benlai.com/item-39458.html" target="_blank"><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_02.jpg" /></a><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_03.jpg" /> \r\n						<div class="cc_buy button right" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif" id="39458_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list relative" style="vertical-align:bottom;">\r\n						<a href="http://www.benlai.com/item-39459.html" target="_blank"><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_04.jpg" /></a><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_05.jpg" /> \r\n						<div class="cc_buy button left" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif" id="39459_addCart" /> \r\n						</div>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n			<div class="cc_des" style="margin:0px;padding:0px;border:none;">\r\n				<img src="http://image.benlailife.com/images/bj/special/2014chucheng/shps.jpg" width="990" height="450" /><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_06.jpg" /><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_07.jpg" /><img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_08.jpg" /><img class="cc_section" src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_10.jpg" /> \r\n			</div>\r\n			<div class="sku cc_sp_shop" style="margin:0px;padding:0px;border:none;background-color:#F49626;">\r\n				<p class="title">\r\n					<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/spt_12.jpg" /> \r\n				</p>\r\n				<div class="cframe" style="margin:0px 20px 20px;padding:0px;border:none;">\r\n					<ul class="sp_nav" style="vertical-align:bottom;">\r\n						<li class="list" style="vertical-align:bottom;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/ytl_on.jpg" /> \r\n						</li>\r\n						<li class="list" style="vertical-align:bottom;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/zxg.jpg" /> \r\n						</li>\r\n						<li class="list" style="vertical-align:bottom;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/sml.jpg" /> \r\n						</li>\r\n						<li class="list" style="vertical-align:bottom;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/sn.jpg" /> \r\n						</li>\r\n					</ul>\r\n					<ul class="contents" style="vertical-align:bottom;background-color:#FFFFFF;">\r\n						<li class="list content relative page" style="vertical-align:bottom;">\r\n							<a href="http://www.benlai.com/item-37672.html" target="_blank"><img src="http://image.benlailife.com/images/bj/special/2014chucheng/p1.jpg" /></a> \r\n							<div class="ft_buy" style="margin:0px;padding:0px;border:none;">\r\n								<ul class="select_box" style="vertical-align:bottom;">\r\n									<li class="list button" style="vertical-align:bottom;">\r\n										<img src="http://image.benlailife.com/images/bj/special/2014chucheng/2p_on.jpg" /> \r\n									</li>\r\n									<li class="list button" style="vertical-align:bottom;">\r\n										<img src="http://image.benlailife.com/images/bj/special/2014chucheng/4p.jpg" /> \r\n									</li>\r\n								</ul>\r\n								<ul class="shop_box" style="vertical-align:bottom;">\r\n									<li class="list" style="vertical-align:bottom;">\r\n										<p class="price p_rose" style="font-family:''Microsoft YaHei'';font-size:24px;color:#F83A5E;">\r\n											￥11.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;">￥20.00</span> \r\n										</p>\r\n										<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n											<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif" id="37672_addCart" /> \r\n										</div>\r\n									</li>\r\n									<li class="list" style="vertical-align:bottom;">\r\n										<p class="price p_rose" style="font-family:''Microsoft YaHei'';font-size:24px;color:#F83A5E;">\r\n											￥18.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;">￥40.00</span> \r\n										</p>\r\n										<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n											<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif" id="36937_addCart" /> \r\n										</div>\r\n									</li>\r\n								</ul>\r\n							</div>\r\n						</li>\r\n					</ul>\r\n				</div>\r\n			</div>\r\n			<div class="sku" style="margin:0px 0px 60px;padding:0px;border:none;">\r\n				<ul class="main" style="vertical-align:bottom;">\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-39442.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							新疆姬娜果4粒装（单果重90-100g）\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥5.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥10.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="39442_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-27683.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							进口牛油果 4粒\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥35.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥78.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="27683_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-10432.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							台湾红宝石葡萄柚\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥28.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥38.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="10432_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-15307.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							浙江涌泉蜜桔 1.7-1.9kg\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥38.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥55.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="15307_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-38262.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							四川红阳红心猕猴桃（小果） 8粒装\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥28.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥36.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="38262_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-6536.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							爽口源兰州百合150g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥18.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥19.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="6536_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-6682.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							本来精选——云南鲜毛豆 400g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥10.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥14.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="6682_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-8533.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							陈集山药（鸡皮糙）500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥15.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥16.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="8533_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-27.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							斋堂鲜蘑菇拼盘\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥17.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="27_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-3153.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							本来精选——绿芦笋300g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥20.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥23.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="3153_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-15656.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							OMEGA 新西兰青口贝 1000g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥49.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥78.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="15656_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-19587.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							原装进口厄瓜多尔白虾50/60 2000g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥168.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥268.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="19587_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-19889.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							本来专供 速冻阿拉斯加真鳕切身 （生制）500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥39.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥62.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="19889_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-25845.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							【独家销售】南极磷虾 500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥18.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥25.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="25845_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-4758.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							九洋无公害生态深海养殖 三去大黄鱼 450g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥36.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥49.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="4758_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-6246.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							林地散养柴鸡蛋24枚\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥35.60<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥42.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="6246_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-9209.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							Kerchin科尔沁肉筋 500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥29.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥35.90</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="9209_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-32393.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							华北小笋鸡250g-350g*2\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥15.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥43.60</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="32393_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-25437.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							荷美尔出口备案冻前尖500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥19.90<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥26.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="25437_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-7926.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							Kerchin科尔沁肥牛 400克\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥36.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥51.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="7926_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-38159.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							【特别推荐】云南艾爱全脂巴氏水牛乳500ml\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥9.90<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥22.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="38159_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-37167.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							贝儿榴莲飘香蛋糕330g-家庭装\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥49.90<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="37167_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-7444.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							百吉福棒棒奶酪（原味）500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥48.60<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥59.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="7444_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-15775.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							红炉磨坊葡萄干核桃面包（粗粮） 300g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥23.60<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥27.60</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="15775_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-793.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							万得妙含糖酸牛奶500ml\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥11.60<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥15.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="793_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-719.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							伯爵特级初榨橄榄油500ml\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥69.50<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="719_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-6690.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							本来生活有机红小豆（红豆）360g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥9.90<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥12.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif" id="6690_back" class="defbutton" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-24389.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							响中王响水村自产大米2500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥82.50<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="24389_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-4048.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							竹里馆临安特产天目山野生石笋干250g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥25.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="4048_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-33796.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							长白山黑木耳125g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥21.50<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥28.50</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="33796_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-4159.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							广东温氏好味鸡咸香盐焗鸡600g-800g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥33.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥52.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="4159_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-28102.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							百饺园家常猪肉三鲜水饺300g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥13.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥17.20</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="28102_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-23882.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							荷美尔Hormel 超值鲜嫩火腿片135g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥14.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="23882_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-21778.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							乐世小厨培根抓饼精装5片600g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥10.90<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥17.90</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="21778_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-25866.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							天福号 蛋卷300g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥12.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥19.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="25866_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-16606.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							德国迈森蜂蜜小栈纯蜂蜜—洋槐花蜂蜜500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥63.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥126.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="16606_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-19891.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							阿鲁司滇红茶15g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥8.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥23.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="19891_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-10542.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							法国（巴黎）含气柠檬味饮料330ml*4\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥32.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥48.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="10542_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-6883.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							澳洲奔富酒园洛神山庄梅洛红葡萄酒750ml\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥49.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥98.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif" id="6883_back" class="defbutton" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-22336.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							KEO凯莉欧100%橙汁1L(塞浦路斯进口) 真正纯橙汁\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥11.40<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥22.80</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif" id="22336_back" class="defbutton" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-35043.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							7Best大象芒果干100g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥12.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="35043_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-24780.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							吃货榴莲干90g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							<img src="http://image1.benlailife.com/Content/images/no2.gif?v=8.2.47" /><span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif" id="24780_back" class="defbutton" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-6739.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							昆仑山和田玉枣六星 500g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥64.30<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="6739_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-21306.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							阿胶金丝枣180g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥12.80<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;"></span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="21306_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<a href="http://www.benlai.com/item-21304.html" target="_blank"></a> \r\n						<p class="name" style="font-family:''Microsoft YaHei'';font-size:16px;">\r\n							桃花姬阿胶糕300g\r\n						</p>\r\n						<p class="price normal-price-text p_orange" style="font-family:''Microsoft YaHei'';font-size:20px;color:#FF9472;font-weight:bold;">\r\n							￥119.00<span class="Concrete-grey" style="color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;">￥158.00</span> \r\n						</p>\r\n						<div class="button" style="margin:5px auto;padding:0px;border:none;">\r\n							<img src="http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg" id="21304_addCart" /> \r\n						</div>\r\n					</li>\r\n					<li class="zcode list col5 htyanimate" style="vertical-align:bottom;text-align:center;">\r\n						<div>\r\n							<br />\r\n						</div>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '500', 0, '中国大陆', 18, '待编辑', '', '', '', 1, '褚橙');
INSERT INTO `onethink_document_product` (`id`, `price`, `content`, `weight`, `totalsales`, `area`, `ads_pic_id`, `adtitle`, `yprice`, `mark`, `unionid`, `stock`, `shorttitle`) VALUES
(8, '10.00', '<div id="J_DcTopRightWrap" style="margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;">\r\n	<div id="J_DcTopRight" class="J_DcAsyn tb-shop" style="margin:0px;padding:0px;">\r\n		<div class="J_TModule" id="shop8751140001" style="margin:0px;padding:0px;">\r\n			<div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined" style="margin:0px;padding:0px;">\r\n				<div class="skin-box-bd clear-fix" style="margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;">\r\n					<span> \r\n					<p>\r\n						<img src="http://img03.taobaocdn.com/imgextra/i3/738580955/TB2oT.ZapXXXXaxXXXXXXXXXXXX-738580955.jpg_.webp" /> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class="skin-box-bt"><b></b></s> \r\n			</div>\r\n		</div>\r\n		<div class="J_TModule" id="shop8825085575" style="margin:0px;padding:0px;">\r\n			<div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined" style="margin:0px;padding:0px;">\r\n				<s class="skin-box-tp"><b></b></s> \r\n				<div class="skin-box-bd clear-fix" style="margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;">\r\n					<span> \r\n					<p>\r\n						<a href="http://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.UoC3cM&id=35904185523&scene=taobao_shop" target="_blank"><img src="http://img03.taobaocdn.com/imgextra/i3/738580955/TB2AEVlaFXXXXbOXXXXXXXXXXXX-738580955.jpg_.webp" /></a> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class="skin-box-bt"><b></b></s> \r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div id="description" class="J_DetailSection tshop-psm tshop-psm-bdetaildes" style="margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;">\r\n	<div class="content ke-post" style="margin:10px 0px 0px;padding:0px;font-size:14px;font-family:tahoma, arial, 宋体, sans-serif;">\r\n		<div style="margin:0px;padding:0px;">\r\n			<span><span style="font-weight:700;"><span style="font-size:18px;">智利青苹果</span></span><br />\r\n</span> \r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<p>\r\n				<span><span style="font-weight:700;"><img class="ke_anchor" id="ids-tag-m-35171" src="http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif" style="height:1px;" />产品简介</span><br />\r\n智利苹果色泽艳丽，颜色从青绿到浅绿都有，也可能会略带粉红色。口感上则相当酸，是喜欢酸味朋友们的大爱，爽脆多汁，口味鲜美，吃法较多。&nbsp;</span> \r\n			</p>\r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<span><span style="font-weight:700;">温馨提示</span><br />\r\n</span> \r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<span>此款产地为智利。</span> \r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<span>冰箱冷藏保存时间会更久，保存时表皮不要沾水。苹果皮中含有丰富营养素，建议连皮一起吃。</span> \r\n			<p>\r\n				<img align="absmiddle" src="http://img02.taobaocdn.com/imgextra/i2/738580955/T2zOhCXfdOXXXXXXXX-738580955.jpg" /><img align="absmiddle" src="http://img04.taobaocdn.com/imgextra/i4/738580955/T2Zz1aXXtdXXXXXXXX-738580955.jpg" /><img align="absmiddle" src="http://img01.taobaocdn.com/imgextra/i1/738580955/T2VPCuXc4cXXXXXXXX-738580955.jpg" /><img align="absmiddle" src="http://img04.taobaocdn.com/imgextra/i4/738580955/T2ZwXBXl8NXXXXXXXX-738580955.jpg" /> \r\n			</p>\r\n			<p>\r\n				<img align="absmiddle" src="http://img04.taobaocdn.com/imgextra/i4/738580955/T2MmJyXi0OXXXXXXXX-738580955.jpg_.webp" /><img class="ke_anchor" id="ids-tag-m-35173" src="http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif" style="height:1px;" /><img align="absmiddle" src="http://img01.taobaocdn.com/imgextra/i1/738580955/T2yn4DXj8OXXXXXXXX-738580955.jpg_.webp" /> \r\n			</p>\r\n		</div>\r\n		<p>\r\n			<img class="ke_anchor" id="ids-tag-m-35176" src="http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif" style="height:1px;" /><img align="absmiddle" src="http://img03.taobaocdn.com/imgextra/i3/738580955/T28tdGXd0OXXXXXXXX-738580955.jpg_.webp" /> \r\n		</p>\r\n	</div>\r\n</div>', '500', 11, '中国大陆', 16, '正宗进口青苹果水果酸甜新鲜水果', '', '', '', 1, '智利青苹果12个'),
(9, '5.00', '<h2 align="center" style="font-family:tahoma, arial, 宋体, sans-serif;background-color:#FFFFFF;">\r\n	配送范围：目前江浙沪（其他城市或者偏远乡镇村目前不配送，谢谢）\r\n</h2>\r\n<p align="center" style="font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<img src="http://gd1.alicdn.com/imgextra/i1/595478579/T2gtbxXINaXXXXXXXX_!!595478579.jpg" /> \r\n</p>\r\n<p align="center" style="font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<img src="http://gd2.alicdn.com/imgextra/i2/595478579/T2yOPCXKFaXXXXXXXX_!!595478579.jpg" /><img src="http://gd3.alicdn.com/imgextra/i3/595478579/T2S52CXMlaXXXXXXXX_!!595478579.jpg" /><img src="http://gd3.alicdn.com/imgextra/i3/595478579/T2XmrCXLNaXXXXXXXX_!!595478579.jpg" /> \r\n</p>\r\n<p align="center" style="font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<img src="http://gd3.alicdn.com/imgextra/i3/595478579/T2poTvXMpaXXXXXXXX_!!595478579.jpg" /> \r\n</p>', '500', 0, '中国大陆', 10, '常鲜生 菲律宾进口香蕉 都乐香蕉 新鲜水果 整箱批发', '', '', '', 1, '菲律宾进口香蕉'),
(15, '1.00', '<div class="detl_property" style="margin:20px 0px;">\r\n	<p style="font-family:宋体, ''Arial Narrow'', HELVETICA;color:#333333;">\r\n		<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit01.gif?v=8.2.47" /> \r\n	</p>\r\n	<div class="detl_com">\r\n		<div class="detl_form">\r\n			品名：河南河阴软籽石榴 4粒装（单果重250-300g）规格：250-300g\r\n		</div>\r\n		<div class="detl_pic">\r\n			<img src="http://image4.benlailife.com/ProductImage/0102022270C.jpg" style="width:340px;" /> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div class="detl_feature" style="margin:20px 0px 0px;">\r\n	<a name="sublist01"></a> \r\n	<p style="font-family:宋体, ''Arial Narrow'', HELVETICA;color:#333333;">\r\n		<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47" /> \r\n	</p>\r\n	<div class="detl_pic" style="text-align:center;margin:10px 0px;">\r\n		<img src="http://image6.benlailife.com/ProductNewDetailImage/0102022270C/22p.jpg" style="width:700px;" /><span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:normal;"></span> \r\n		<div class="tal" style="text-align:left;color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n			<br />\r\n		</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102022270C/56p.jpg" style="width:700px;" /><span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:normal;"></span> \r\n		<div class="tal" style="text-align:left;color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n			<br />\r\n		</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102022270C/18p.jpg" style="width:700px;" /><span style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;line-height:normal;"></span> \r\n	</div>\r\n	<div>\r\n		<br />\r\n	</div>\r\n</div>', '500', 0, '中国大陆', 0, '', '', '', '', 1, '河南河阴软籽石榴'),
(16, '100.00', '<div class="detail_n" style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n	<div class="detail_tab">\r\n		<h2 class="tith2" id="navList" style="font-family:''Microsoft YaHei'';font-size:14px;">\r\n			<br />\r\n		</h2>\r\n		<div class="dtl_btn" style="text-align:right;">\r\n			<a class="buy_btn" id="nav_buy_btn"><span><span>￥</span>28.00</span></a> \r\n		</div>\r\n	</div>\r\n	<div class="detl_content">\r\n		<div class="detl_property" style="margin:20px 0px;">\r\n			<p>\r\n				<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit01.gif?v=8.2.47" /> \r\n			</p>\r\n			<div class="detl_com">\r\n				<div class="detl_form">\r\n					品名：佳沃智利进口蓝莓一级果125g规格：125g温馨提示：蓝莓果实为浆果型，耐贮性较强，最佳保存温度为1 ~ 3°C。要吃新鲜蓝莓不可置入0°C以下的冷藏库。 不建议水洗入冰箱，因为水份很容易使蓝莓腐烂。\r\n				</div>\r\n				<div class="detl_pic">\r\n					<img src="http://image3.benlailife.com/ProductImage/0102022311C.jpg" style="width:340px;" /> \r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class="detl_feature" style="margin:20px 0px 0px;">\r\n			<a name="sublist01"></a> \r\n			<p>\r\n				<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47" /> \r\n			</p>\r\n			<div class="detl_pic" style="text-align:center;margin:10px 0px;">\r\n				<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/001.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/002.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/003.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/004.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/005.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/006.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/006.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/008.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class="detl_feature" style="margin:20px 0px 0px;">\r\n			<a name="sublist04"></a> \r\n			<p>\r\n				<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit05.gif?v=8.2.47" /> \r\n			</p>\r\n			<div class="detl_pic" style="text-align:center;margin:10px 0px;">\r\n				<img src="http://image6.benlailife.com/ProductNewDetailImage/0102020474C/009.jpg" style="width:700px;" /> \r\n				<div class="tal" style="text-align:left;">\r\n					&nbsp;\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class="detl_service" style="margin:20px 0px 0px;">\r\n			<a name="sublist05"></a> \r\n			<p>\r\n				<img width="760" height="42" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_tit06.gif?v=8.2.47" /> \r\n			</p>\r\n			<div class="detl_tab">\r\n				<a class="detl_tab01on">&nbsp;</a><a class="detl_tab02">&nbsp;</a><a class="detl_tab03">&nbsp;</a><a class="detl_tab04">&nbsp;</a><a class="detl_tab05 m0">&nbsp;</a> \r\n			</div>\r\n			<div class="detl_com" style="padding:19px;margin-left:20px;">\r\n				<p>\r\n					<img width="680" height="200" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_service0101.jpg?v=8.2.47" /><img width="680" height="228" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_service0102.jpg?v=8.2.47" /><img width="680" height="450" src="http://image1.benlailife.com/Content/images/detailsp/detailsp_service0103.jpg?v=8.2.47" /> \r\n				</p>\r\n				<div>\r\n					<br />\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '500', 0, '中国大陆', 0, '', '', '', '', 1, '佳沃智利进口蓝莓'),
(17, '100.00', '<div class="gdtit" style="font-size:16px;color:#333333;font-weight:bold;font-family:Arial;margin-left:15px;">\r\n	<h1 id="Product_ProductDetailsName" style="font-family:宋体, ''Arial Narrow'', HELVETICA;font-size:16px;">\r\n		新疆红提950-1000g\r\n	</h1>\r\n</div>\r\n<p class="goods_gdmis2 pdl15" style="font-family:宋体, ''Arial Narrow'', HELVETICA;color:#F08B0C;">\r\n	新疆特受欢迎的葡萄品种。\r\n</p>', '500', 0, '中国大陆', 0, '', '', '', '', 1, '新疆红提950-1000g'),
(18, '19.00', '<div class="dtl_commodity" style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n	<span style="font-size:30px;color:#669934;line-height:55px;">皮薄、肉脆、汁多、酥香的新疆香梨</span> \r\n	<p style="color:#666666;background-color:#F8F8F8;">\r\n		产自新疆天山南麓“梨乡”库尔勒，香气浓郁，皮薄肉细，酥脆爽口。这样的梨吃起来，不仅是味觉上的享受，也是帮助身体滋润的一剂良药。\r\n	</p>\r\n</div>\r\n<div class="dtl718" style="color:#333333;font-family:宋体, ''Arial Narrow'', HELVETICA;">\r\n	<div class="dtl_title" style="font-size:18px;color:#669934;">\r\n		商品介绍\r\n	</div>\r\n	<div class="dtl_infortu">\r\n		<img alt="" src="http://image1.benlailife.com/ProductDetailImage/0102020673C/001.jpg" style="width:700px;" /> \r\n	</div>\r\n	<div class="dtl_infor_top" style="margin:0px;">\r\n		<p style="color:#666666;">\r\n			<strong><span style="font-size:14px;">来自新疆梨乡的“奶西姆提”</span></strong><br />\r\n新疆巴音郭楞蒙古自治州北部的天山南麓，有一个肥沃的绿州名字叫库尔勒。这里出产的香梨远近闻名，素有“梨乡”之美称。库尔勒香梨在维吾尔语中叫做“奶西姆提”，因为营养价值丰富，印度人称它是“中国的王子”。\r\n		</p>\r\n	</div>\r\n	<div class="dtl_infortu">\r\n		<img alt="" src="http://image2.benlailife.com/ProductDetailImage/0102020673C/002.jpg" style="width:700px;" /> \r\n	</div>\r\n	<div class="dtl_infor_top" style="margin:0px;">\r\n		<p style="color:#666666;">\r\n			<strong><span style="font-size:14px;">香而清甜，虽小却极好吃</span></strong><br />\r\n库尔勒香梨个头不算大，但香气浓郁，皮薄肉细，酥脆爽口，汁多渣少。假如你以前不识此梨，尝下去的第一口，它一定能给你“竟这样好吃”的惊喜感。\r\n		</p>\r\n	</div>\r\n	<div class="dtl_infortu">\r\n		<img alt="" src="http://image.benlailife.com/ProductDetailImage/0102020673C/003.jpg" style="width:700px;" /> \r\n	</div>\r\n</div>', '500', 0, '中国大陆', 0, '新疆库尔勒香梨 ', '', '', '', 1, '新疆库尔勒香梨 ');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_favortable`
--

CREATE TABLE IF NOT EXISTS `onethink_favortable` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `goodid` int(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `num` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `onethink_favortable`
--

INSERT INTO `onethink_favortable` (`ID`, `uid`, `goodid`, `time`, `num`) VALUES
(13, 1, 8, '2014-10-22 11:14:47', 1),
(14, 1, 9, '2014-10-24 17:16:34', 1),
(15, 1, 14, '2014-10-26 16:48:30', 1),
(16, 1, 41, '2014-11-02 19:00:02', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_fcoupon`
--

CREATE TABLE IF NOT EXISTS `onethink_fcoupon` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `onethink_fcoupon`
--

INSERT INTO `onethink_fcoupon` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `price`, `code`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `ismenu`) VALUES
(1, '645645', '肯德基', 0, 0, 10, '30', '6fsgwcjf', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 1414012468, 1414174845, 1, 5, NULL),
(2, '645465', '麦当劳', 0, 0, 10, '6644', '453ljnq7', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 1414012758, 1414174944, 1, 11, NULL),
(3, '64645', '麦考林', 0, 0, 10, '656', '4nm34itt', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 1414012817, 1414175369, 1, 14, NULL),
(4, '564456', '小肥羊', 0, 0, 10, '65445', 'chmvc29z', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 1414012977, 1414174856, 1, 12, NULL),
(5, '', '必胜客', 0, 0, 10, '50', '2xs1rdw0', '', '', '', '', '', '', '', '', 0, 0, 1, 0, 0, '', '', 1414174826, 1414174826, 1, 13, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_file`
--

CREATE TABLE IF NOT EXISTS `onethink_file` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `onethink_file`
--

INSERT INTO `onethink_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `url`, `create_time`) VALUES
(1, 'yunwuxin-ThinkPay-master.zip', '5405e116b5a4e.zip', '2014-09-02/', 'zip', 'application/octet-stream', 23324, '1565d08c019b3958b1767bd8970f9f2c', '130d04a2ec9800243dc324b6ddce53f9c2c69e35', 0, '', 1409671446),
(2, '14552934C-0.jpg', '5419eb9223a5f.jpg', '2014-09-18/', 'jpg', 'application/octet-stream', 206166, '66b8f2a751472d0de3b1c86c20be9949', '323183b6c93f2f5031daa8a47f2da0c3f362e3b7', 0, '', 1410984849);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_hooks`
--

CREATE TABLE IF NOT EXISTS `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `onethink_hooks`
--

INSERT INTO `onethink_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, 'ThirdLogin', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'OTcaiji', 'OT采集插件钩子', 1, 1411634246, 'OTcaiji', 1),
(22, 'indexAliPlay', '支付宝钩子', 1, 1412762558, 'indexAliPlay,AliPlay', 1),
(19, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1411636527, 'ChinaCity', 1),
(20, 'J_iyo9Table', '向着要编辑的位置点击一下，访位置会变成一个可编辑的input标签，编辑好后，鼠标再点击空白地方，即可保存', 1, 1411636824, 'Iyo9Table', 1),
(21, 'Template', '模版管理插件钩子', 1, 1411637366, 'Template', 1),
(23, 'SyncLogin', '第三方账号同步登陆', 1, 1412762818, 'SyncLogin', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_iswork`
--

CREATE TABLE IF NOT EXISTS `onethink_iswork` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(225) CHARACTER SET utf8 NOT NULL,
  `time` varchar(225) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '1-未使用 2-已使用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `onethink_iswork`
--

INSERT INTO `onethink_iswork` (`ID`, `uid`, `time`, `status`) VALUES
(18, '1', '14189089729', 1),
(22, '1', '1414090388', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_listtmp`
--

CREATE TABLE IF NOT EXISTS `onethink_listtmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `url` text CHARACTER SET utf8 NOT NULL,
  `source` text CHARACTER SET utf8 NOT NULL,
  `sourceurl` text CHARACTER SET utf8 NOT NULL,
  `dates` int(10) NOT NULL,
  `st` int(1) NOT NULL,
  `zt` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_login`
--

CREATE TABLE IF NOT EXISTS `onethink_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `type_uid` varchar(255) NOT NULL COMMENT '授权登陆用户名 第三方分配的appid',
  `type` char(80) NOT NULL COMMENT '登陆类型 qq|sina',
  `oauth_token` varchar(150) DEFAULT NULL COMMENT '授权账号',
  `oauth_token_secret` varchar(150) DEFAULT NULL COMMENT '授权密码',
  PRIMARY KEY (`login_id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_member`
--

CREATE TABLE IF NOT EXISTS `onethink_member` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `onethink_member`
--

INSERT INTO `onethink_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `address`, `cellphone`, `position`, `realname`, `youbian`, `lever`, `iswors`) VALUES
(1, '123', 30, '1900-00-00', '1010422715', 350, 206, 2130706433, 1413206453, 1903661226, 1415471561, 1, '', '213', '5564', '5646', '', 'lv1', NULL),
(2, '111', 0, '0000-00-00', '', 10, 1, 2102927650, 1415144674, 2102927650, 1415144674, 1, NULL, NULL, NULL, NULL, NULL, 'lv1 ', NULL),
(3, '456', 0, '0000-00-00', '', 10, 1, 977127693, 1415145053, 977127693, 1415145053, 1, NULL, NULL, NULL, NULL, NULL, 'lv1 ', NULL),
(4, '12311231', 0, '0000-00-00', '', 10, 1, 2102927650, 1415178697, 2102927650, 1415178697, 1, NULL, NULL, NULL, NULL, NULL, 'lv1 ', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_menu`
--

CREATE TABLE IF NOT EXISTS `onethink_menu` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

--
-- 转存表中的数据 `onethink_menu`
--

INSERT INTO `onethink_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '内容', 0, 4, 'Article/index', 0, '', '', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '用户', 0, 5, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(150, '首页统计', 146, 20, 'Lookup/index', 0, '', '访问统计', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 6, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 0, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 2, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(135, '已发货订单', 131, 2, 'Ordertransport/index', 0, '', '订单管理', 0, 1),
(134, '优惠券', 16, 4, 'Fcoupon/index', 0, '', '优惠券管理', 0, 1),
(131, '订单', 0, 3, 'Order/index', 0, '', '', 0, 1),
(132, '已提交订单', 131, 1, 'Order/index', 0, '', '订单管理', 0, 1),
(133, '已签收订单', 131, 3, 'Ordercomplete/index', 0, '', '订单管理', 0, 1),
(137, '正退货订单', 131, 6, 'Back/index', 0, '', '退货管理', 0, 1),
(141, '同意换货商品', 131, 10, 'Changeagree/index', 0, '', '换货管理', 0, 1),
(138, '同意退货订单', 131, 7, 'Backagree/index', 0, '', '退货管理', 0, 1),
(139, '已退货订单', 131, 8, 'Backover/index', 0, '', '退货管理', 0, 1),
(140, '正换货商品', 131, 9, 'Change/index', 0, '', '换货管理', 0, 1),
(142, '已换货商品', 131, 12, 'Changeover/index', 0, '', '换货管理', 0, 1),
(143, '今日销量统计', 146, 13, 'Statistics/index', 0, '', '数据统计', 0, 1),
(144, '本周销量统计', 146, 14, 'Statistics/week', 0, '', '数据统计', 0, 1),
(145, '本月销量统计', 146, 15, 'Statistics/month', 0, '', '数据统计', 0, 1),
(146, '数据', 0, 4, 'Statistics/index', 0, '', '数据统计', 0, 1),
(147, '每日数据', 146, 16, 'Report/index', 0, '', '报表统计', 0, 1),
(148, '每周数据', 146, 17, 'Report/week', 0, '', '报表统计', 0, 1),
(149, '每月统计', 146, 18, 'Report/month', 0, '', '报表统计', 0, 1),
(151, '栏目页统计', 146, 23, 'Lookup/category', 0, '', '访问统计', 0, 1),
(152, '内容页统计', 146, 24, 'Lookup/article', 0, '', '访问统计', 0, 1),
(153, '申请取消的订单', 131, 0, 'Cancel/index', 0, '', '取消管理', 0, 1),
(154, '拒绝的订单', 131, 0, 'Cancelrefuse/index', 0, '', '取消管理', 0, 1),
(155, '同意取消的订单', 131, 0, 'Cancelagree/index', 0, '', '取消管理', 0, 1),
(156, '已支付的订单', 131, 0, 'Pay/index', 0, '', '支付管理', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_model`
--

CREATE TABLE IF NOT EXISTS `onethink_model` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `onethink_model`
--

INSERT INTO `onethink_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["2","3","5","9","10","11","12","13","14","16","17","19","20"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1413845425, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', '', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM'),
(5, 'product', '商品', 1, '', 1, '{"1":["3","12","36","46","44","43","37","35","39"],"2":["2","41","40","9","10","42","13","14","5","16","20","38","11","17","19"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:', 10, '', '', 1411375498, 1414177267, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_order`
--

CREATE TABLE IF NOT EXISTS `onethink_order` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1013 ;

--
-- 转存表中的数据 `onethink_order`
--

INSERT INTO `onethink_order` (`ID`, `orderid`, `pricetotal`, `ptime`, `status`, `assistant`, `update_time`, `uid`, `shipprice`, `display`, `isover`, `ispay`, `total`, `tool`, `addressid`, `toolid`, `isdefault`, `info`, `backinfo`, `score`, `codeid`, `act_service`, `act_change`, `act_backmoney`, `act_confirm`, `act_getwuliu`, `act_tousu`, `send_name`, `send_contact`, `send_address`, `act_cancel`) VALUES
(950, 'DB021679181159397264', 100.00, 1414916802, 4, '1', 1414916870, 1, 0.00, 1, NULL, NULL, 100.00, '', 49, '', 0, NULL, '订单已取消', NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://localhost/index.php?s=/Home/Order/wuliu/id/DB021679181159397264''>查看物流</a>', NULL, '', '', '', ''),
(959, 'DB022965466403330577', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, 'DB022965327603779019', 100.00, 1414929810, 1, '无', 0, 1, 0.00, 1, NULL, 1, 100.00, NULL, 0, NULL, 0, NULL, '等待支付', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://localhost/index.php?s=/Home/Order/cancel/id/DB022965327603779019''>取消订单</a>'),
(957, 'DB022447066515760668', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, 'DB035452579830669829', 200.00, 1414954542, 1, '无', 0, 1, 0.00, 1, NULL, NULL, 200.00, NULL, 0, NULL, 0, NULL, '已提交等待发货', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035452579830669829''>取消订单</a>'),
(967, 'DB035452660868277358', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(955, 'DB022429043088665634', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, 'DB022250955662217299', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, 'DB022250839918865207', 100.00, 1414922649, 4, '1', 1414922682, 1, 0.00, 1, NULL, NULL, 100.00, '', 0, '', 0, NULL, '订单已取消', NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://localhost/index.php?s=/Home/Order/wuliu/id/DB022250839918865207''>查看物流</a>', NULL, '', '', '', ''),
(954, 'DB022428935646351907', 100.00, 1414924298, 4, '无', 0, 1, 0.00, 1, NULL, NULL, 100.00, NULL, 0, NULL, 0, NULL, '订单已关闭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://localhost/index.php?s=/Home/Order/canceldetail/id/DB022428935646351907''>订单已取消</a>'),
(960, 'DB023137586522138986', 100.00, 1414931391, NULL, '无', 0, 1, 0.00, 1, NULL, 1, 100.00, NULL, 0, NULL, 0, NULL, '等待支付', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(961, 'DB023137658180696540', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(962, 'DB035395696740362222', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(963, 'DB035395845824716708', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, 'DB035412203038407760', 947.00, 1414954137, 1, '无', 0, 1, 0.00, 1, NULL, NULL, 947.00, NULL, 0, NULL, 0, NULL, '已提交等待发货', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035412203038407760''>取消订单</a>'),
(965, 'DB035412315893413947', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, 'DB035475294688413797', 12.00, 1414954767, 1, '无', 0, 1, 10.00, 1, NULL, NULL, 2.00, NULL, 0, NULL, 0, NULL, '已提交等待发货', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035475294688413797''>取消订单</a>'),
(969, 'DB035475366478746500', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, 'DB035481173597427825', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(971, 'DB035481254904436010', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, 'DB035484445501789146', 100.00, 1414954859, NULL, '无', 0, 1, 0.00, 1, NULL, 1, 100.00, NULL, 0, NULL, 0, NULL, '等待支付', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(973, 'DB035484537896182928', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, 'DB035497958720303305', 300.67, 1414954999, 1, '无', 0, 1, 0.00, 1, NULL, 1, 301.00, NULL, 0, NULL, 0, NULL, '等待支付', 330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035497958720303305''>取消订单</a>'),
(975, 'DB035498045500556623', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, 'DB035630482117630696', 120.00, 1414956320, 1, '无', 0, 1, 0.00, 1, NULL, NULL, 120.00, NULL, 0, NULL, 0, NULL, '已提交等待发货', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035630482117630696''>取消订单</a>'),
(977, 'DB035630600101905736', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'DB035649175148458273', 100.00, 1414956506, 1, '无', 0, 1, 0.00, 1, NULL, NULL, 100.00, NULL, 0, NULL, 0, NULL, '已提交等待发货', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB035649175148458273''>取消订单</a>'),
(979, 'DB035649258694664605', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, 'DB035768313933553330', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, 'DB035768434272958994', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, 'DB036075782400436969', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, 'DB036075866653995455', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, 'DB036078988438319220', 1177.67, 1414960799, NULL, '无', 0, 1, 0.00, 1, NULL, 1, 1178.00, NULL, 0, NULL, 0, NULL, '等待支付', 330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'DB036079079821402315', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'DB036092942295786208', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, 'DB036093032776235500', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, 'DB044107594513822005', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, 'DB044107711369299803', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, 'DB053464681904954446', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, 'DB053464775699583241', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, 'DB053489983206253214', 1998.00, 1415134932, 1, '无', 0, 1, 0.00, 1, NULL, 1, 1998.00, NULL, 0, NULL, 0, NULL, '等待支付', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB053489983206253214''>取消订单</a>'),
(993, 'DB053490255838807075', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, 'DB053851055773407494', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, 'DB053851101357426888', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, 'DB053851200281164433', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(997, 'DB053851556178417070', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, 'DB053940792071196234', 30.64, 1415139436, 1, '无', 0, 1, 10.00, 1, NULL, 1, 20.98, NULL, 0, NULL, 0, NULL, '等待支付', 340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<A href=''http://www.ijquery.net/index.php?s=/Home/Order/cancel/id/DB053940792071196234''>取消订单</a>'),
(999, 'DB053940972618607764', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, 'DB053943058328192832', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, 'DB061908479925918712', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, 'DB061908587426833957', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 'DB061912472017780465', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 'DB061912839966936620', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 'DB061956002768778037', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, 'DB061956132064973763', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, 'DB096763153653478789', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 'DB096763234032791595', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 'DB096765835058177749', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, 'DB096765928137925393', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 'DB096770482860845628', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, 'DB096770563535182599', 0.00, NULL, NULL, '无', 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_pay`
--

CREATE TABLE IF NOT EXISTS `onethink_pay` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_picture`
--

CREATE TABLE IF NOT EXISTS `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `onethink_picture`
--

INSERT INTO `onethink_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2014-09-02/5405e0f3b1705.png', '', '36d077267c76901835c07eb98f43647f', '0f7ce26261cb7a81dcfb14e057982ec60fa3a6e0', 1, 1409671411),
(2, '/Uploads/Picture/2014-09-18/5419eb4fec0c7.jpg', '', '5435a1dae36fafc2e544f2f78854fb29', 'd93a6e9869e7bf2fc17a533d3060ade8c88c40a9', 1, 1410984783),
(3, '/Uploads/Picture/2014-09-22/541f3d86103d3.jpg', '', '8e77701a8b49232f17d7f13d91d40693', '4dd3a9e9938d8890db37452b3abe6ff91ead531a', 1, 1411333508),
(4, '/Uploads/Picture/2014-09-22/541ff48c48dcf.jpg', '', 'e23489fd7e4dcc3dffaecbdef316bc97', '212c69983a3aaae6e379c68521523f847f5065fc', 1, 1411380364),
(5, '/Uploads/Picture/2014-09-27/5426973d68594.jpg', '', 'b1cc728f0903646228442f12afec0559', '2dbeabe21876fe2e489eeaf8e71f9de9c6465886', 1, 1411815228),
(6, '/Uploads/Picture/2014-09-28/54282d125f21a.jpg', '', 'da9f27eee154037434fbad74dc73430a', 'd3299248c9946cb94e7f5eeaaa7818fe750ad9de', 1, 1411919121),
(7, '/Uploads/Picture/2014-09-28/54282f255e437.jpg', '', '2e1205543c59f21e6317c2adf56a64ae', '1ad27e3a47c074ab9b7ed3b2d0aff5f8f848a17f', 1, 1411919653),
(8, '/Uploads/Picture/2014-09-29/54284e0bb791c.jpg', '', '314edb167e8e67abe5fadb9ecb56a5bb', 'b7a1cf4f226334a39db5fa7351e3c696d3d562b3', 1, 1411927563),
(9, '/Uploads/Picture/2014-09-29/5428505721fe3.jpg', '', '3a9cfc025a0b8ae90939d080b6b0b3da', 'f0e1654339c40d42da7037cae6b26cef1336570b', 1, 1411928151),
(10, '/Uploads/Picture/2014-09-29/542851809c5fe.jpg', '', 'b7e3396d129e2501f393c5fbb59080d5', '1961d4b5d20e1ac3d50000570535ca41b5fa8c44', 1, 1411928448),
(11, '/Uploads/Picture/2014-10-22/5447bf1b8a10a.jpg', '', '4182ad0929a3a535f11273c31a7fd16b', 'b36f727aada45dd67f8206b978c46afc4b1254e6', 1, 1413988123),
(12, '/Uploads/Picture/2014-10-23/54481f89ef4dc.gif', '', '40e797c3661da89e463bf739b819a4fd', 'bba0f04434413fb63c3e6d82fe74d0ece7b647bf', 1, 1414012809),
(13, '/Uploads/Picture/2014-10-25/544a986712125.jpg', '', '5332d06200bc87cbeddefea48859eb87', 'e2207e6f2b7f0d7c6f9392ab70eb99b6a14f473b', 1, 1414174821),
(14, '/Uploads/Picture/2014-10-25/544a994e1e338.jpg', '', 'ad1a25faa262cf395b42b4aa4aead8cf', 'e08dc9cbab906cbeea1e036deaf3b791d6db4f9e', 1, 1414175054),
(15, '/Uploads/Picture/2014-10-26/544cff452d8fa.jpg', '', 'c1b04f3754108967f1edd5c94657095e', 'd1726508f25b1ef354d48586797a82da18503726', 1, 1414332229),
(16, '/Uploads/Picture/2014-10-26/544cffc5540ee.jpg', '', 'aac9bafdb67dc58312b65e001ea84540', '068acddf258436463eee6915e919a13f5e3877fe', 1, 1414332357),
(17, '/Uploads/Picture/2014-10-26/544d19999e40b.png', '', '20887db6ea7f9b810bd6d3ec5e91695b', 'f37a6e21817dd2a4163b3a5bdd05380c8a88efe1', 1, 1414338969),
(18, '/Uploads/Picture/2014-10-26/544d19be81949.jpg', '', 'da5fdeaed09a782168e78b6907b45a44', 'd8bb619b09799c52eb8b08ca292fd53ef405aea3', 1, 1414339006),
(19, '/Uploads/Picture/2014-10-27/544d1abbbd6b0.jpg', '', 'db8ea2928ce128693663d2252698bd05', '4dd01d2d86525d61ec12e44779959eb4cc074d9d', 1, 1414339259),
(20, '/Uploads/Picture/2014-10-27/544d2707616a5.png', '', '31f9e56579f958ff1a9eac6e040c4c20', '608746815de21abbfbee5f646bcb9b747a996c1f', 1, 1414342406),
(21, '/Uploads/Picture/2014-10-27/544d2792b3e05.png', '', '8a6d4676b58e25f538dc037337b28a6c', 'ef346ce444e1f5a117e388aa5fc018df4d623673', 1, 1414342546),
(22, '/Uploads/Picture/2014-10-27/544d27e160e6b.png', '', '0b2fdd0c3a198bc9b4034567e0bb112c', '05b9f8b88fff5b614b3d55fd8e617722d1bc7d93', 1, 1414342625),
(23, '/Uploads/Picture/2014-10-27/544d283099170.png', '', 'b7a5ed3253065b3e2540e779487d5767', 'a06b5bfe54272aedd2d645c560a1d836cd853bcc', 1, 1414342704),
(24, '/Uploads/Picture/2014-10-27/544d2b43ddf15.png', '', 'ff85333e81966a8cb8f012e59eeb749f', 'b430506b7467ff4842d396d5602a2ac511aea4b6', 1, 1414343491),
(25, '/Uploads/Picture/2014-10-29/5450091034207.png', '', 'f7aec314e1916bf12a46caf55ea947ac', '0b5fe01203ea843d9ce57ec076deba6686b972fc', 1, 1414531343);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_records`
--

CREATE TABLE IF NOT EXISTS `onethink_records` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

--
-- 转存表中的数据 `onethink_records`
--

INSERT INTO `onethink_records` (`ID`, `ip`, `url`, `country`, `time`, `uid`, `info`, `province`, `city`, `referer`, `tag`, `page`) VALUES
(54, '101.226.33.239', 'ijquery.net/index.php', '中国', 1414485301, NULL, '', '上海', '上海', 'http://www.sogou.com/ ', 1, NULL),
(6, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248528, 1, '', '5', '5', NULL, NULL, NULL),
(7, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248536, 1, '', '5', '5', NULL, NULL, NULL),
(8, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248537, 1, '', '5', '5', NULL, NULL, NULL),
(9, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248579, 1, '', '5', '5', NULL, NULL, NULL),
(10, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248581, 1, '', '5', '5', NULL, NULL, NULL),
(11, '125.88.33.34', 'www.ijquery.net/', '中国', 1414269911, NULL, '', '广东', '广州', NULL, 1, NULL),
(12, '58.61.203.46', 'www.ijquery.net/', '中国', 1414271042, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Fcoupon/add.html', 1, NULL),
(13, '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414271116, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', 1, NULL),
(14, '222.73.40.174', 'ijquery.net/', '中国', 1414281996, NULL, '', '上海', '上海', NULL, 1, NULL),
(15, '125.88.33.34', 'ijquery.net/', '中国', 1414304738, NULL, '', '广东', '广州', NULL, 1, NULL),
(16, '58.61.201.83', 'www.ijquery.net/', '中国', 1414317572, NULL, '', '广东', '广州', NULL, 1, NULL),
(17, '112.90.78.158', 'www.ijquery.net/', '中国', 1414318781, NULL, '', '广东', '深圳', NULL, 1, NULL),
(18, '112.90.78.151', 'www.ijquery.net/', '中国', 1414318783, NULL, '', '广东', '深圳', NULL, 1, NULL),
(19, '66.249.77.198', 'ijquery.net/?page=11', '美国', 1414322195, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(20, '66.249.79.116', 'ijquery.net/?page=10', '美国', 1414322293, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(21, '66.249.77.188', 'ijquery.net/?page=11', '美国', 1414322356, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=11', 1, NULL),
(22, '125.88.33.34', 'www.ijquery.net/', '中国', 1414332077, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Article/edit/id/9/model/5/cate_id/57.html', 1, NULL),
(23, '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414337830, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', 1, NULL),
(24, '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414339204, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', 1, NULL),
(25, '146.148.93.21', 'ijquery.net/', '美国', 1414339205, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(26, '58.61.201.83', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414356857, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 1, NULL),
(27, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414365134, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Shopcart/makeorder.html', 1, NULL),
(28, '101.226.33.237', 'www.ijquery.net/', '中国', 1414365423, NULL, '', '上海', '上海', 'http://www.sogou.com/ ', 1, NULL),
(29, '192.99.107.46', 'www.ijquery.net/', '加拿大', 1414382840, NULL, '', '魁北克', '', NULL, 1, NULL),
(30, '66.249.77.198', 'ijquery.net/?page=9', '美国', 1414387861, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(31, '66.249.77.208', 'ijquery.net/?page=9', '美国', 1414388245, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=9', 1, NULL),
(32, '66.249.77.188', 'ijquery.net/index.php?s=', '美国', 1414396011, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(33, '178.154.150.213', 'ijquery.net/', '俄罗斯', 1414401823, NULL, '', '', '', NULL, 1, NULL),
(34, '178.154.150.213', 'www.ijquery.net/', '俄罗斯', 1414401822, NULL, '', '', '', NULL, 1, NULL),
(35, '113.108.157.197', 'www.ijquery.net/', '中国', 1414404345, NULL, '', '广东', '广州', NULL, 1, NULL),
(36, '58.61.201.83', 'www.ijquery.net/', '中国', 1414404702, NULL, '', '广东', '广州', NULL, 1, NULL),
(37, '112.90.78.151', 'www.ijquery.net/', '中国', 1414405566, NULL, '', '广东', '深圳', NULL, 1, NULL),
(38, '112.90.78.158', 'www.ijquery.net/', '中国', 1414406001, NULL, '', '广东', '深圳', NULL, 1, NULL),
(39, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/pay/', '中国', 1414411472, 1, '', '广东', '广州', NULL, 1, NULL),
(40, '42.62.74.38', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414411568, NULL, '', '北京', '北京', NULL, 1, NULL),
(41, '123.125.71.72', 'ijquery.net/', '中国', 1414420494, NULL, '', '北京', '北京', NULL, 1, NULL),
(42, '66.249.71.57', 'www.ijquery.net/', '美国', 1414423867, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(43, '58.61.204.41', 'www.ijquery.net/', '中国', 1414425178, NULL, '', '广东', '广州', NULL, 1, NULL),
(44, '146.148.86.175', 'ijquery.net/', '美国', 1414425510, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(45, '58.61.204.41', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414425636, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', 1, NULL),
(46, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414426575, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', 1, NULL),
(47, '58.61.201.178', 'www.ijquery.net/', '中国', 1414442442, NULL, '', '广东', '广州', NULL, 1, NULL),
(48, '42.62.74.38', 'ijquery.net/', '中国', 1414456348, NULL, '', '北京', '北京', NULL, 1, NULL),
(49, '91.250.15.69', 'ijquery.net/', '乌克兰', 1414471048, NULL, '', 'Donets''ka Oblast''', 'Mariupol', 'http://galaxydownloads.co', 1, NULL),
(50, '192.99.107.136', 'www.ijquery.net/', '加拿大', 1414474333, NULL, '', '魁北克', '', NULL, 1, NULL),
(51, '66.249.71.252', 'ijquery.net/', '美国', 1414480889, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, NULL),
(52, '66.249.79.124', 'ijquery.net/', '美国', 1414481039, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, NULL),
(53, '125.88.33.34', 'www.ijquery.net/', '中国', 1414483038, NULL, '', '广东', '广州', NULL, 1, NULL),
(55, '210.14.128.133', 'ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1414486031, NULL, '', '北京', '北京', NULL, 3, NULL),
(56, '210.14.139.153', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414486475, NULL, '', '北京', '北京', NULL, 3, NULL),
(57, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414486771, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 2, NULL),
(58, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414487284, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/15.html', 1, 'index'),
(59, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414487366, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(60, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1414487387, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '8'),
(61, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/c_fruit', '中国', 1414487405, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/8.html', 2, 'c_fruit'),
(62, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414487520, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(63, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1414487709, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '14'),
(64, '210.14.139.153', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1414487720, NULL, '', '北京', '北京', NULL, 3, '14'),
(65, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1414487769, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 3, '18'),
(66, '210.14.139.153', 'ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1414487779, NULL, '', '北京', '北京', NULL, 3, '18'),
(67, '192.99.107.118', 'www.ijquery.net/', '加拿大', 1414490958, NULL, '', '魁北克', '', NULL, 1, 'index'),
(68, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1414491995, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '15'),
(69, '210.14.128.133', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1414492017, NULL, '', '北京', '北京', NULL, 3, '15'),
(70, '210.14.128.133', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1414492022, NULL, '', '北京', '北京', NULL, 3, '15'),
(71, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1414492222, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '5'),
(72, '66.249.77.188', 'ijquery.net/', '美国', 1414498615, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(73, '66.249.77.208', 'ijquery.net/', '美国', 1414498743, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(74, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414505686, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(75, '210.14.139.153', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414505697, NULL, '', '北京', '北京', NULL, 3, '16'),
(76, '58.61.201.178', 'www.ijquery.net/', '中国', 1414510393, NULL, '', '广东', '广州', NULL, 1, 'index'),
(77, '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414511512, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 2, 'fruit'),
(78, '146.148.71.223', 'ijquery.net/', '美国', 1414511926, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(79, '58.61.201.178', 'www.ijquery.net/', '中国', 1414512021, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Index/index.html', 1, 'index'),
(80, '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1414512839, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '15'),
(81, '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414512888, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(82, '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414512897, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 3, '17'),
(83, '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1414513275, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '9'),
(84, '58.61.201.178', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414524006, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(85, '125.88.33.34', 'www.ijquery.net/', '中国', 1414532588, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Article/index.html', 1, 'index'),
(86, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1414532640, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '9'),
(87, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414533513, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 2, 'fruit'),
(88, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414533523, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(89, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1414536057, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '8'),
(90, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1414536062, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '14'),
(91, '157.55.39.247', 'www.ijquery.net/', '美国', 1414537287, NULL, '', '华盛顿州', 'Redmond', NULL, 1, 'index'),
(92, '66.249.77.188', 'ijquery.net/', '美国', 1414558704, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(93, '58.61.201.178', 'www.ijquery.net/', '中国', 1414564378, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Lookup/index/p/6.html', 1, 'index'),
(94, '58.61.201.135', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414568363, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '17'),
(95, '58.61.201.135', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414568378, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', 2, 'fruit'),
(96, '58.61.201.135', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414568446, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', 1, 'index'),
(97, '58.61.201.58', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414569108, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 1, 'index'),
(98, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414572892, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', 3, '17'),
(99, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414573096, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Shopcart/makeorder.html', 1, 'index'),
(100, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1414573290, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '9'),
(101, '178.154.150.213', 'ijquery.net/', '俄罗斯', 1414574642, NULL, '', '', '', NULL, 1, 'index'),
(102, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414577178, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/index/index.html', 3, '16'),
(103, '192.99.40.137', 'ijquery.net/', '加拿大', 1414580782, NULL, '', '魁北克', '', 'http://www.domaintuno.com/d/ijquery.net', 1, 'index'),
(104, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1414582017, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '14'),
(105, '66.249.77.208', 'ijquery.net/?page=11', '美国', 1414587507, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(106, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1414587530, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '18'),
(107, '66.249.79.124', 'ijquery.net/?page=11', '美国', 1414587806, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=11', 1, 'index'),
(108, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1414592254, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Lookup/article.html', 3, '8'),
(109, '58.61.201.83', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1414592299, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '9'),
(110, '58.61.201.83', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414592335, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(111, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414592745, 1, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/index/index.html', 2, 'fruit'),
(112, '58.61.201.178', 'www.ijquery.net/', '中国', 1414595152, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Order/index.html', 1, 'index'),
(113, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414596129, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', 1, 'index'),
(114, '176.102.38.75', 'IJQUERY.NET/', '乌克兰', 1414596433, NULL, '', 'Kharkivs''ka Oblast''', 'Kharkov', NULL, 1, 'index'),
(115, '101.226.65.106', 'ijquery.net/', '中国', 1414596626, NULL, '', '上海', '上海', 'http://www.sogou.com/ ', 1, 'index'),
(116, '58.61.201.58', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414596679, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 1, 'index'),
(117, '146.148.93.90', 'ijquery.net/', '美国', 1414598375, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(118, '192.99.40.137', 'ijquery.net/', '加拿大', 1414603125, NULL, '', '魁北克', '', 'http://www.domaintuno.com/d/ijquery.net', 1, 'index'),
(119, '66.249.77.198', 'ijquery.net/?page=11', '美国', 1414603530, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(120, '66.249.77.208', 'ijquery.net/?page=11', '美国', 1414619308, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(121, '66.249.79.108', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414623374, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(122, '66.249.77.188', 'ijquery.net/?page=12', '美国', 1414623981, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(123, '66.249.71.75', 'www.ijquery.net/', '美国', 1414624231, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(124, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414642544, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', 3, '14'),
(125, '192.99.107.226', 'www.ijquery.net/', '加拿大', 1414643492, NULL, '', '魁北克', '', NULL, 1, 'index'),
(126, '66.249.77.198', 'ijquery.net/', '美国', 1414660028, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(127, '58.61.201.141', 'www.ijquery.net/', '中国', 1414664310, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Index/index.html', 1, 'index'),
(128, '180.153.163.186', 'www.ijquery.net/', '中国', 1414664737, NULL, '', '上海', '上海', 'http://www.sogou.com/ ', 1, 'index'),
(129, '58.61.201.141', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1414668077, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '9'),
(130, '58.61.201.141', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414668582, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '17'),
(131, '125.88.33.34', 'www.ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', 1414674332, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'vegetable'),
(132, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414674337, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/shopcart/index.html', 1, 'index'),
(133, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1414675241, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 2, 'fruit'),
(134, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414675256, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 3, '17'),
(135, '58.61.201.58', 'www.ijquery.net/', '中国', 1414677353, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php/', 1, 'index'),
(136, '148.251.71.4', 'ijquery.net/', '德国', 1414683427, NULL, '', '', '', 'http://getdownload.ws', 1, 'index'),
(137, '146.148.87.32', 'ijquery.net/', '美国', 1414684738, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(138, '188.92.76.167', 'ijquery.net/', '拉脱维亚', 1414689300, NULL, '', '', '', 'http://google.com/', 1, 'index'),
(139, '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414696173, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(140, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414701594, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(141, '66.249.77.198', 'ijquery.net/', '美国', 1414702002, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(142, '66.249.77.188', 'ijquery.net/', '美国', 1414702173, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(143, '192.99.107.10', 'www.ijquery.net/', '加拿大', 1414721742, NULL, '', '魁北克', '', NULL, 1, 'index'),
(144, '66.249.77.208', 'ijquery.net/', '美国', 1414722063, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(145, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414730376, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(146, '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414730685, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', 3, '14'),
(147, '66.249.79.108', 'ijquery.net/?page=11', '美国', 1414733571, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=11', 1, 'index'),
(148, '66.249.77.188', 'ijquery.net/?page=12', '美国', 1414736788, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(149, '66.249.77.198', 'ijquery.net/index.php?s=/Home/index/index.html', '美国', 1414737276, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(150, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', 1414760924, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 1, 'index'),
(151, '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414767667, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(152, '23.251.151.197', 'ijquery.net/', '美国', 1414771178, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(153, '66.249.77.208', 'ijquery.net/', '美国', 1414771335, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(154, '66.249.79.124', 'ijquery.net/', '美国', 1414771522, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(155, '125.88.33.34', 'www.ijquery.net/', '中国', 1414772358, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Config/group/id/7.html', 1, 'index'),
(156, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414773931, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(157, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414773966, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '17'),
(158, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1414774648, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '18'),
(159, '178.154.150.213', 'ijquery.net/', '俄罗斯', 1414776755, NULL, '', '', '', NULL, 1, 'index'),
(160, '66.249.77.198', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414777860, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(161, '66.249.77.198', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', 1414777894, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(162, '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1414778096, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', 3, '14'),
(163, '58.61.204.235', 'www.ijquery.net/', '中国', 1414784567, NULL, '', '广东', '广州', 'http://localhost/admin.php?s=/Lookup/index.html', 1, 'index'),
(164, '66.249.77.188', 'ijquery.net/', '美国', 1414784985, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(165, '66.249.71.57', 'www.ijquery.net/', '美国', 1414804028, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(166, '42.156.138.34', 'ijquery.net/', '中国', 1414815599, NULL, '', '浙江', '杭州', NULL, 1, 'index'),
(167, '66.249.77.208', 'ijquery.net/?page=10', '美国', 1414820537, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(168, '66.249.71.39', 'www.ijquery.net/', '美国', 1414822447, NULL, '', '加利福尼亚', 'Mountain View', 'http://www.ijquery.net/', 1, 'index'),
(169, '192.99.107.190', 'www.ijquery.net/', '加拿大', 1414823775, NULL, '', '魁北克', '', NULL, 1, 'index'),
(170, '121.33.7.37', 'www.ijquery.net/', '中国', 1414931238, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Cancel/index.html', 1, 'index'),
(171, '121.33.7.37', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414931243, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(172, '125.88.33.34', 'www.ijquery.net/', '中国', 1414941504, 1, '', '广东', '广州', 'http://localhost/index.php?s=/Home/shopcart/index.html', 1, 'index'),
(173, '130.211.154.101', 'ijquery.net/', '美国', 1414947430, NULL, '', '', '', NULL, 1, 'index'),
(174, '121.33.7.122', 'www.ijquery.net/', '中国', 1414949655, 1, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Lookup/article/p/5.html', 1, 'index'),
(175, '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414951886, 1, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(176, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1414957639, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(177, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1414957695, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 1, 'index'),
(178, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1414960874, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '9'),
(179, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1414962246, NULL, '', '广东', '广州', 'http://ijquery.net/', 3, '15'),
(180, '58.61.201.225', 'www.ijquery.net/', '中国', 1414963951, NULL, '', '广东', '广州', 'http://www.ijquery.net/admin.php?s=/Index/index.html', 1, 'index'),
(181, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1414964015, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(182, '66.249.77.198', 'ijquery.net/?page=10', '美国', 1414967751, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(183, '66.249.77.188', 'ijquery.net/?page=12', '美国', 1414970816, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(184, '66.249.77.208', 'ijquery.net/?page=10', '美国', 1414985649, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=10', 1, 'index'),
(185, '42.156.136.110', 'ijquery.net/index.php?s=/home/article/index/category/car.html', '中国', 1415000634, NULL, '', '浙江', '杭州', NULL, 2, 'car'),
(186, '42.156.139.110', 'ijquery.net/index.php?s=/home/article/index/category/c_fruit.html', '中国', 1415000642, NULL, '', '浙江', '杭州', NULL, 2, 'c_fruit'),
(187, '42.120.160.110', 'ijquery.net/index.php?s=/home/article/index/category/root%20vegetables%20.html', '中国', 1415000644, NULL, '', '浙江', '杭州', NULL, 2, 'root vegetables '),
(188, '42.120.161.110', 'ijquery.net/index.php?s=/home/article/index/category/stem%20vegetable.html', '中国', 1415000648, NULL, '', '浙江', '杭州', NULL, 2, 'stem vegetable'),
(189, '220.181.108.120', 'ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', 1415006718, NULL, '', '北京', '北京', NULL, 2, 'vegetable'),
(190, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1415007277, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '14'),
(191, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415007918, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '8'),
(192, '178.154.150.213', 'www.ijquery.net/', '俄罗斯', 1415010951, NULL, '', '', '', NULL, 1, 'index'),
(193, '121.33.7.122', 'www.ijquery.net/', '中国', 1415018874, NULL, '', '广东', '广州', 'http://localhost/admin.php?s=/Article/edit/id/18/model/5/cate_id/57.html', 1, 'index'),
(194, '148.251.71.4', 'ijquery.net/', '德国', 1415019161, NULL, '', '', '', 'http://prox100download.com', 1, 'index'),
(195, '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415019201, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '8'),
(196, '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415019405, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '9'),
(197, '121.33.7.122', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415019504, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(198, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415020443, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(199, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415020714, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 1, 'index'),
(200, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415021814, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 1, 'index'),
(201, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1415022281, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '14'),
(202, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415024754, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(203, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415024832, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '8'),
(204, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415029817, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '9'),
(205, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1415029861, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '18'),
(206, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415030109, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(207, '58.61.201.225', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1415030344, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '5'),
(208, '130.211.147.137', 'ijquery.net/', '美国', 1415033877, NULL, '', '', '', NULL, 1, 'index'),
(209, '121.33.7.122', 'www.ijquery.net/', '中国', 1415033932, NULL, '', '广东', '广州', 'http://localhost/admin.php?s=/Config/group/id/7.html', 1, 'index'),
(210, '66.249.77.208', 'ijquery.net/index.php?s=/Home/index/index.html', '美国', 1415038593, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(211, '66.249.77.198', 'ijquery.net/index.php?s=/Home/index/index.html', '美国', 1415038779, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/index/index.html', 1, 'index'),
(212, '125.88.33.34', 'ijquery.net/', '中国', 1415040728, NULL, '', '广东', '广州', NULL, 1, 'index'),
(213, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415040743, NULL, '', '广东', '广州', 'http://ijquery.net/', 3, '9'),
(214, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', 1415041045, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 1, 'index'),
(215, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415041202, 1, '', '广东', '广州', 'http://ijquery.net/', 2, 'fruit'),
(216, '220.181.108.140', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415057417, NULL, '', '北京', '北京', NULL, 3, '9'),
(217, '192.99.40.137', 'ijquery.net/', '加拿大', 1415061059, NULL, '', '魁北克', '', 'http://www.domaintuno.com/d/ijquery.net', 1, 'index'),
(218, '5.45.77.35', 'www.ijquery.net/', '荷兰', 1415071922, NULL, '', '', '', 'http://www.ijquery.net/', 1, 'index'),
(219, '42.156.138.103', 'ijquery.net/index.php?s=/Home/index/index.html', '中国', 1415088089, NULL, '', '浙江', '杭州', NULL, 1, 'index'),
(220, '42.156.139.103', 'ijquery.net/index.php?s=/home/article/index/category/jiaju.html', '中国', 1415088099, NULL, '', '浙江', '杭州', NULL, 2, 'jiaju'),
(221, '42.120.160.103', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415088102, NULL, '', '浙江', '杭州', NULL, 1, 'index'),
(222, '125.88.33.34', 'ijquery.net/', '中国', 1415094114, NULL, '', '广东', '广州', NULL, 1, 'index'),
(223, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415094263, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/shopcart/index.html', 2, 'fruit'),
(224, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415094280, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 3, '17'),
(225, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '中国', 1415094341, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '14'),
(226, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415094364, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '9'),
(227, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1415094405, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '18'),
(228, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415094417, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(229, '66.249.77.208', 'ijquery.net/', '美国', 1415094634, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(230, '121.33.7.122', 'ijquery.net/', '中国', 1415099158, NULL, '', '广东', '广州', NULL, 1, 'index'),
(231, '58.61.201.13', 'ijquery.net/', '中国', 1415101625, NULL, '', '广东', '广州', NULL, 1, 'index'),
(232, '188.92.76.167', 'ijquery.net/', '拉脱维亚', 1415115323, NULL, '', '', '', 'http://wmaid.com/en/explore/ijquery.net/', 1, 'index'),
(233, '130.211.177.67', 'ijquery.net/', '美国', 1415120289, NULL, '', '', '', NULL, 1, 'index'),
(234, '113.66.120.60', 'ijquery.net/', '中国', 1415126837, NULL, '', '广东', '广州', NULL, 1, 'index'),
(235, '125.88.33.34', 'ijquery.net/', '中国', 1415134302, NULL, '', '广东', '广州', NULL, 1, 'index'),
(236, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415134642, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(237, '180.149.135.16', 'ijquery.net/', '中国', 1415135287, NULL, '', '北京', '北京', NULL, 1, 'index'),
(238, '111.206.36.11', 'www.ijquery.net/', '中国', 1415135374, NULL, '', '北京', '北京', NULL, 1, 'index'),
(239, '58.61.201.79', 'www.ijquery.net/', '中国', 1415136070, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Addons/index.html', 1, 'index'),
(240, '58.61.205.93', 'www.ijquery.net/', '中国', 1415136073, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 1, 'index'),
(241, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415136666, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(242, '111.206.36.140', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415136668, NULL, '', '北京', '北京', NULL, 3, '16'),
(243, '66.249.77.208', 'ijquery.net/', '美国', 1415136761, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(244, '111.206.36.136', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415137946, NULL, '', '北京', '北京', NULL, 1, 'index'),
(245, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415137948, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(246, '111.206.36.141', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415137956, NULL, '', '北京', '北京', NULL, 3, '17'),
(247, '58.61.205.93', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415138518, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(248, '58.61.205.93', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1415138540, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '15'),
(249, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1415138598, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', 3, '15'),
(250, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1415138820, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', 3, '5'),
(251, '58.61.205.93', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1415138822, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', 3, '5'),
(252, '58.61.201.13', 'www.ijquery.net/', '中国', 1415144657, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/logout.html', 1, 'index'),
(253, '58.61.201.13', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415145023, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', 2, 'fruit'),
(254, '111.206.36.143', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415145025, NULL, '', '北京', '北京', NULL, 2, 'fruit'),
(255, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415145025, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 2, 'fruit'),
(256, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1415146262, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(257, '182.131.19.96', 'www.ijquery.net/', '中国', 1415152293, NULL, '', '四川', '成都', 'http://qconnadmin.oa.com/schema?m=release&a=query&json={%22source%22:{%22id%22:12},%22fields%22:[%22AppID%22,%22platform%22,%22AppState%22,%22AppAlias%22,%22Developer%22,%22Logo16%22,%22last_modify%22,%22admin%22,%22AppUrl%22', 1, 'index'),
(258, '66.249.77.198', 'ijquery.net/', '美国', 1415152837, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(259, '66.249.77.198', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1415163214, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(260, '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1415163550, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', 3, '14'),
(261, '42.120.160.37', 'ijquery.net/index.php?s=/home/article/index/category/fushi.html', '中国', 1415166690, NULL, '', '浙江', '杭州', NULL, 2, 'fushi'),
(262, '42.156.137.37', 'ijquery.net/index.php?s=/home/article/index/category/flower%20vegetable.html', '中国', 1415166691, NULL, '', '浙江', '杭州', NULL, 2, 'flower vegetable'),
(263, '42.120.161.37', 'ijquery.net/', '中国', 1415166691, NULL, '', '浙江', '杭州', NULL, 1, 'index'),
(264, '66.249.71.75', 'www.ijquery.net/?page=2', '美国', 1415168750, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(265, '66.249.71.57', 'www.ijquery.net/?page=2', '美国', 1415168967, NULL, '', '加利福尼亚', 'Mountain View', 'http://www.ijquery.net/?page=2', 1, 'index'),
(266, '66.249.77.188', 'ijquery.net/', '美国', 1415171045, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(267, '66.249.71.39', 'www.ijquery.net/?page=15', '美国', 1415171253, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(268, '66.249.79.116', 'ijquery.net/', '美国', 1415171323, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(269, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415177922, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/login.html', 1, 'index'),
(270, '66.249.77.198', 'ijquery.net/', '美国', 1415178422, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(271, '178.154.150.213', 'www.ijquery.net/', '俄罗斯', 1415181683, NULL, '', '', '', NULL, 1, 'index'),
(272, '113.66.120.60', 'www.ijquery.net/', '中国', 1415187793, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Index/index.html', 1, 'index'),
(273, '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415187802, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '9'),
(274, '61.135.190.105', 'www.ijquery.net/', '中国', 1415200650, NULL, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', 1, 'index'),
(275, '130.211.137.181', 'ijquery.net/', '美国', 1415206615, NULL, '', '', '', NULL, 1, 'index'),
(276, '58.61.201.79', 'www.ijquery.net/', '中国', 1415217152, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Addons/index.html', 1, 'index'),
(277, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415217485, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '8'),
(278, '58.61.201.13', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415217522, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '9'),
(279, '123.125.106.81', 'www.ijquery.net//index.php?s=/Home/Article/detail/id/9.html', '中国', 1415217572, NULL, '', '北京', '北京', NULL, 3, '9'),
(280, '180.149.135.120', 'www.ijquery.net//index.php?s=/Home/Article/detail/id/9.html', '中国', 1415217573, NULL, '', '北京', '北京', NULL, 3, '9'),
(281, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415217694, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(282, '58.61.201.79', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415217769, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(283, '113.66.120.60', 'www.ijquery.net/', '中国', 1415219071, 1, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Addons/index.html', 1, 'index'),
(284, '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415219080, 1, '', '广东', '广州', 'http://www.ijquery.net/', 3, '17'),
(285, '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415219232, 1, '', '广东', '广州', 'http://www.ijquery.net/', 3, '9'),
(286, '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1415219320, 1, '', '广东', '广州', 'http://www.ijquery.net/', 3, '15'),
(287, '113.66.120.60', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415219434, 1, '', '广东', '广州', 'http://www.ijquery.net/', 3, '8'),
(288, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415220826, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Center/index.html', 1, 'index'),
(289, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415220840, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(290, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415220843, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 3, '17'),
(291, '66.249.64.100', 'ijquery.net/', '美国', 1415222369, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(292, '66.249.64.97', 'www.ijquery.net/?page=1', '美国', 1415225261, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(293, '66.249.64.93', 'www.ijquery.net/', '美国', 1415232716, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(294, '66.249.64.101', 'www.ijquery.net/', '美国', 1415232835, NULL, '', '加利福尼亚', 'Mountain View', 'http://www.ijquery.net/', 1, 'index'),
(295, '42.120.160.75', 'ijquery.net/index.php?s=/home/article/index/category/j_fruit.html', '中国', 1415243845, NULL, '', '浙江', '杭州', NULL, 2, 'j_fruit'),
(296, '42.156.138.75', 'ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', 1415243854, NULL, '', '浙江', '杭州', NULL, 2, 'vegetable'),
(297, '42.120.160.75', 'ijquery.net/index.php?s=/home/article/index/category/electric.html', '中国', 1415244002, NULL, '', '浙江', '杭州', NULL, 2, 'electric'),
(298, '123.125.71.99', 'ijquery.net/index.php?s=/home/article/index/category/flower%20vegetable.html', '中国', 1415257629, NULL, '', '北京', '北京', NULL, 2, 'flower vegetable'),
(299, '66.249.64.96', 'ijquery.net/?page=10', '美国', 1415264621, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(300, '180.153.206.34', 'ijquery.net/', '中国', 1415276681, NULL, '', '上海', '上海', NULL, 1, 'index'),
(301, '61.135.190.101', 'www.ijquery.net/', '中国', 1415286414, NULL, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', 1, 'index'),
(302, '125.88.33.34', 'ijquery.net/', '中国', 1415291475, NULL, '', '广东', '广州', NULL, 1, 'index'),
(303, '112.64.235.89', 'ijquery.net/', '中国', 1415291475, NULL, '', '上海', '上海', NULL, 1, 'index'),
(304, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415291661, NULL, '', '广东', '广州', 'http://ijquery.net/', 2, 'fruit'),
(305, '101.226.89.117', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415291661, NULL, '', '上海', '上海', NULL, 2, 'fruit'),
(306, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/j_fruit.html', '中国', 1415291668, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 2, 'j_fruit'),
(307, '101.226.66.174', 'ijquery.net/index.php?s=/Home/Article/index/category/j_fruit.html', '中国', 1415291671, NULL, '', '上海', '上海', NULL, 2, 'j_fruit'),
(308, '125.88.33.34', 'ijquery.net/index.php?s=/Home/Article/index/category/c_fruit.html', '中国', 1415291856, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 2, 'c_fruit'),
(309, '180.153.214.190', 'ijquery.net/index.php?s=/Home/Article/index/category/c_fruit.html', '中国', 1415291856, NULL, '', '上海', '上海', NULL, 2, 'c_fruit'),
(310, '101.226.33.201', 'ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415292252, NULL, '', '上海', '上海', NULL, 1, 'index'),
(311, '130.211.174.246', 'ijquery.net/', '美国', 1415293049, NULL, '', '', '', NULL, 1, 'index'),
(312, '113.66.120.93', 'www.ijquery.net/', '中国', 1415294983, NULL, '', '广东', '广州', 'http://localhost/admin.php?s=/Article/index.html', 1, 'index'),
(313, '72.46.136.178', 'www.ijquery.net/', '美国', 1415314360, NULL, '', '内华达州', 'Las Vegas', NULL, 1, 'index'),
(314, '37.140.141.37', 'www.ijquery.net/', '俄罗斯', 1415315066, NULL, '', '', '', NULL, 1, 'index'),
(315, '38.72.114.141', 'ijquery.net/', '美国', 1415327840, NULL, '', '', '', NULL, 1, 'index'),
(316, '42.156.136.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1415333843, NULL, '', '浙江', '杭州', NULL, 3, '15'),
(317, '42.156.137.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1415333843, NULL, '', '浙江', '杭州', NULL, 3, '5'),
(318, '113.66.120.93', 'ijquery.net/', '中国', 1415333923, NULL, '', '广东', '广州', NULL, 1, 'index');
INSERT INTO `onethink_records` (`ID`, `ip`, `url`, `country`, `time`, `uid`, `info`, `province`, `city`, `referer`, `tag`, `page`) VALUES
(319, '113.66.120.93', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415333941, NULL, '', '广东', '广州', 'http://ijquery.net/', 3, '17'),
(320, '113.66.120.93', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415333955, NULL, '', '广东', '广州', 'http://ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(321, '66.249.79.108', 'ijquery.net/?page=10', '美国', 1415350661, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/?page=10', 1, 'index'),
(322, '61.135.190.105', 'www.ijquery.net/', '中国', 1415356220, NULL, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', 1, 'index'),
(323, '178.154.150.213', 'ijquery.net/', '俄罗斯', 1415356676, NULL, '', '', '', NULL, 1, 'index'),
(324, '162.243.9.227', 'www.ijquery.net/', '美国', 1415363217, NULL, '', '纽约州', 'New York', NULL, 1, 'index'),
(325, '66.249.71.39', 'www.ijquery.net/', '美国', 1415363756, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(326, '108.172.73.210', 'ijquery.net/', '加拿大', 1415365273, NULL, '', '不列颠哥伦比亚', 'Delta', NULL, 1, 'index'),
(327, '130.211.169.143', 'ijquery.net/', '美国', 1415379466, NULL, '', '', '', NULL, 1, 'index'),
(328, '61.135.190.105', 'ijquery.net/', '中国', 1415380613, NULL, '', '北京', '北京', 'http://www.baidu.com/s?wd=NULL', 1, 'index'),
(329, '66.249.77.188', 'ijquery.net/', '美国', 1415389769, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(330, '66.249.77.208', 'ijquery.net/', '美国', 1415399329, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/', 1, 'index'),
(331, '220.181.108.139', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415409687, NULL, '', '北京', '北京', NULL, 3, '8'),
(332, '14.121.99.166', 'ijquery.net/', '中国', 1415412380, NULL, '', '广东', '广州', NULL, 1, 'index'),
(333, '14.121.99.166', 'ijquery.net/index.php?s=/Home/Article/detail/id/15.html', '中国', 1415412453, NULL, '', '广东', '广州', 'http://ijquery.net/', 3, '15'),
(334, '14.121.99.166', 'ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415412461, NULL, '', '广东', '广州', 'http://ijquery.net/', 3, '16'),
(335, '14.121.99.166', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415412494, NULL, '', '广东', '广州', 'http://ijquery.net/', 3, '9'),
(336, '183.33.35.213', 'www.ijquery.net/', '中国', 1415415833, NULL, '', '广东', '中山', NULL, 1, 'index'),
(337, '42.156.139.56', 'ijquery.net/index.php?s=/home/article/index/category/jiaju.html', '中国', 1415418236, NULL, '', '浙江', '杭州', NULL, 2, 'jiaju'),
(338, '42.156.136.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415418237, NULL, '', '浙江', '杭州', NULL, 3, '17'),
(339, '42.156.137.56', 'ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415418238, NULL, '', '浙江', '杭州', NULL, 3, '9'),
(340, '42.120.160.56', 'ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415418238, NULL, '', '浙江', '杭州', NULL, 2, 'fruit'),
(341, '14.116.16.125', 'ijquery.net/', '中国', 1415418590, NULL, '', '广东', '珠海', NULL, 1, 'index'),
(342, '66.249.77.198', 'ijquery.net/', '美国', 1415430294, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(343, '81.180.73.182', 'ijquery.net/', '摩尔多瓦', 1415434994, NULL, '', 'Chisinau', 'Chisinau', NULL, 1, 'index'),
(344, '113.66.121.137', 'www.ijquery.net/', '中国', 1415446552, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Index/index.html', 1, 'index'),
(345, '111.206.36.19', 'www.ijquery.net/', '中国', 1415446585, NULL, '', '北京', '北京', NULL, 1, 'index'),
(346, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415446615, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '16'),
(347, '113.66.121.137', 'www.ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', 1415447139, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'vegetable'),
(348, '111.206.36.142', 'www.ijquery.net/index.php?s=/home/article/index/category/vegetable.html', '中国', 1415447144, NULL, '', '北京', '北京', NULL, 2, 'vegetable'),
(349, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415447292, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(350, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415447366, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Search/index/words/%E8%8B%B9%E6%9E%9C.html', 3, '8'),
(351, '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415448892, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '9'),
(352, '111.206.36.143', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415448906, NULL, '', '北京', '北京', NULL, 3, '9'),
(353, '113.66.121.250', 'www.ijquery.net/', '中国', 1415449607, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Index/index.html', 1, 'index'),
(354, '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415450210, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(355, '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415450215, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', 3, '17'),
(356, '111.206.36.147', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415450227, NULL, '', '北京', '北京', NULL, 2, 'fruit'),
(357, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415454390, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(358, '125.88.33.34', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415454391, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(359, '125.88.33.34', 'www.ijquery.net/', '中国', 1415454437, NULL, '', '广东', '广州', NULL, 1, 'index'),
(360, '66.249.77.198', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1415454566, NULL, '', '加利福尼亚', 'Mountain View', NULL, 3, '14'),
(361, '66.249.77.208', 'ijquery.net/index.php?s=/Home/Article/detail/id/14.html', '美国', 1415455141, NULL, '', '加利福尼亚', 'Mountain View', 'http://ijquery.net/index.php?s=/Home/Article/detail/id/14.html', 3, '14'),
(362, '157.55.39.119', 'www.ijquery.net/', '美国', 1415460075, NULL, '', '华盛顿州', 'Redmond', NULL, 1, 'index'),
(363, '113.66.121.137', 'www.ijquery.net/', '中国', 1415463239, NULL, '', '广东', '广州', 'http://ijquery.net/admin.php?s=/Config/index/group/6.html', 1, 'index'),
(364, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1415463378, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '18'),
(365, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415463964, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 3, '17'),
(366, '66.249.77.188', 'ijquery.net/index.php?s=/Home/Index/index.html', '美国', 1415464272, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(367, '130.211.167.27', 'ijquery.net/', '美国', 1415465887, NULL, '', '', '', NULL, 1, 'index'),
(368, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466048, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(369, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466049, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(370, '111.206.36.145', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466050, NULL, '', '北京', '北京', NULL, 4, NULL),
(371, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466059, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(372, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466061, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(373, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466154, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(374, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466169, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(375, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466223, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(376, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466230, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(377, '121.33.7.46', 'www.ijquery.net/', '中国', 1415466275, 1, '', '广东', '广州', 'http://www.ijquery.net/', 1, 'index'),
(378, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466462, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/profile.html', 4, NULL),
(379, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466464, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/profile.html', 4, NULL),
(380, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466477, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/profile.html', 4, NULL),
(381, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466478, 1, '', '广东', '广州', NULL, 4, NULL),
(382, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466479, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(383, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466480, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(384, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466531, 1, '', '广东', '广州', NULL, 4, NULL),
(385, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466536, 1, '', '广东', '广州', NULL, 4, NULL),
(386, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466539, 1, '', '广东', '广州', NULL, 4, NULL),
(387, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466550, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/User/profile.html', 4, NULL),
(388, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466552, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(389, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466563, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(390, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466567, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(391, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466590, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(392, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466595, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(393, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466602, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(394, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466625, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(395, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415466626, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(396, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415467017, 1, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(397, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415467018, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(398, '121.33.7.46', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415467033, 1, '', '广东', '广州', 'http://www.ijquery.net/', 3, '17'),
(399, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415467479, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '8'),
(400, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1415467545, 1, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', 3, '5'),
(401, '111.206.36.9', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/5.html', '中国', 1415467548, NULL, '', '北京', '北京', NULL, 3, '5'),
(402, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415467716, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(403, '113.66.121.137', 'www.ijquery.net/index.php?s=/Home/Article/index/category/fruit.html', '中国', 1415467747, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 2, 'fruit'),
(404, '123.125.106.97', 'www.ijquery.net//index.php?s=/Home/Article/detail/id/17.html', '中国', 1415467763, NULL, '', '北京', '北京', NULL, 3, '17'),
(405, '180.149.134.10', 'www.ijquery.net//index.php?s=/Home/Article/detail/id/17.html', '中国', 1415467764, NULL, '', '北京', '北京', NULL, 3, '17'),
(406, '113.66.121.250', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1415467879, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '18'),
(407, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1415468417, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '18'),
(408, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415468522, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', 3, '9'),
(409, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415468537, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', 1, 'index'),
(410, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415468591, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '16'),
(411, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415468616, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', 3, '8'),
(412, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468696, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 4, NULL),
(413, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468699, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(414, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468699, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(415, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Index/index.html', '中国', 1415468713, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 1, 'index'),
(416, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468719, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 4, NULL),
(417, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468720, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(418, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468720, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(419, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468744, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(420, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468745, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(421, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415468746, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(422, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415468780, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 3, '17'),
(423, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', '中国', 1415468783, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '17'),
(424, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', '中国', 1415468796, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '16'),
(425, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', '中国', 1415468813, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/16.html', 3, '9'),
(426, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/8.html', '中国', 1415468824, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/9.html', 3, '8'),
(427, '113.103.65.48', 'www.ijquery.net/index.php?s=/Home/Article/detail/id/18.html', '中国', 1415468835, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Article/detail/id/17.html', 3, '18'),
(428, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415469557, NULL, '', '广东', '广州', 'http://www.ijquery.net/', 4, NULL),
(429, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415469557, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(430, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415469558, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(431, '113.119.144.170', 'www.ijquery.net/index.php?s=%2FHome%2FService%2Findex%2Fid%2F19.html', '中国', 1415469591, NULL, '', '广东', '广州', NULL, 4, NULL),
(432, '113.119.144.170', 'www.ijquery.net/index.php?s=%2FHome%2FService%2Findex%2Fid%2F19.html', '中国', 1415469593, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=%2FHome%2FService%2Findex%2Fid%2F19.html', 4, NULL),
(433, '113.119.144.170', 'www.ijquery.net/index.php?s=%2FHome%2FService%2Findex%2Fid%2F19.html', '中国', 1415469593, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=%2FHome%2FService%2Findex%2Fid%2F19.html', 4, NULL),
(434, '66.249.77.208', 'ijquery.net/?page=11', '美国', 1415469818, NULL, '', '加利福尼亚', 'Mountain View', NULL, 1, 'index'),
(435, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415469833, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Index/index.html', 4, NULL),
(436, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415469834, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(437, '113.119.144.170', 'www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', '中国', 1415469837, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/Service/index/id/19.html', 4, NULL),
(438, '121.33.6.15', 'www.ijquery.net/index.php?s=/Home/index/index.html', '中国', 1415469873, NULL, '', '广东', '广州', 'http://www.ijquery.net/index.php?s=/Home/index/index.html', 1, 'index'),
(439, '61.135.190.220', 'www.ijquery.net/', '中国', 1415470652, NULL, '', '北京', '北京', 'http://www.baidu.com/s?wd=K%27sBlog', 1, 'index');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_service`
--

CREATE TABLE IF NOT EXISTS `onethink_service` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(225) DEFAULT NULL,
  `num` int(50) DEFAULT NULL,
  `orderid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `time` int(10) DEFAULT NULL,
  `title` varchar(225) NOT NULL,
  `reason` varchar(225) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `assistant` int(100) DEFAULT NULL,
  `backinfo` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_shaddress`
--

CREATE TABLE IF NOT EXISTS `onethink_shaddress` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(5) NOT NULL,
  `uid` int(5) NOT NULL,
  `detail` varchar(50) DEFAULT NULL,
  `ptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_shopcart`
--

CREATE TABLE IF NOT EXISTS `onethink_shopcart` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(5) NOT NULL,
  `uid` int(5) NOT NULL,
  `num` int(50) DEFAULT NULL,
  `ptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `onethink_shopcart`
--

INSERT INTO `onethink_shopcart` (`ID`, `goodid`, `uid`, `num`, `ptime`) VALUES
(50, 18, 1, 6, '2014-11-04 21:59:22'),
(51, 17, 1, 6, '2014-11-04 21:59:22'),
(52, 16, 1, 4, '2014-11-04 21:59:22'),
(53, 15, 1, 1, '2014-11-04 21:59:22');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_shoplist`
--

CREATE TABLE IF NOT EXISTS `onethink_shoplist` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(225) DEFAULT NULL,
  `num` int(50) DEFAULT NULL,
  `orderid` varchar(225) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单号',
  `uid` int(225) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '默认null-未提交订单1-表示已提交订单或已支付2-已完成3-退货4-换货',
  `time` int(10) DEFAULT NULL,
  `back` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `change` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `backmoney` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=940 ;

--
-- 转存表中的数据 `onethink_shoplist`
--

INSERT INTO `onethink_shoplist` (`ID`, `goodid`, `num`, `orderid`, `uid`, `status`, `time`, `back`, `change`, `backmoney`, `total`) VALUES
(878, 18, 1, '934', NULL, 1, NULL, '', '<A href=''http://localhost/index.php?s=/Home/Order/changedetail/id/878''>换货详情</a>', '', 100),
(879, 18, 1, '936', NULL, 1, 1414915366, NULL, NULL, NULL, 19),
(880, 18, 1, '938', NULL, 1, 1414915379, NULL, NULL, NULL, 19),
(881, 18, 1, '940', NULL, 1, 1414915610, NULL, NULL, NULL, 19),
(882, 18, 1, '942', NULL, 1, 1414915682, NULL, NULL, NULL, 19),
(883, 15, 1, '944', NULL, 1, 1414915699, NULL, NULL, NULL, 1),
(884, 15, 1, '946', NULL, 1, 1414915886, NULL, NULL, NULL, 1),
(885, 18, 1, '948', NULL, 1, 1414916672, NULL, NULL, NULL, 19),
(886, 16, 1, '950', NULL, 1, 1414916791, NULL, NULL, NULL, 100),
(887, 16, 1, '952', NULL, 1, 1414922508, NULL, NULL, NULL, 100),
(888, 16, 1, '954', NULL, 1, 1414924289, NULL, NULL, NULL, 100),
(889, 16, 1, '956', NULL, 1, 1414924469, NULL, NULL, NULL, 100),
(890, 17, 1, '958', NULL, 1, 1414929653, NULL, NULL, NULL, 100),
(891, 16, 1, '960', NULL, 1, 1414931375, NULL, NULL, NULL, 100),
(892, 16, 5, '962', NULL, 1, 1414953956, NULL, NULL, NULL, 500),
(893, 17, 4, '962', NULL, 1, 1414953956, NULL, NULL, NULL, 400),
(894, 18, 1, '962', NULL, 1, 1414953956, NULL, NULL, NULL, 19),
(895, 15, 1, '962', NULL, 1, 1414953956, NULL, NULL, NULL, 1),
(896, 9, 3, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 15),
(897, 14, 2, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 2),
(898, 8, 1, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 10),
(899, 16, 5, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 500),
(900, 17, 4, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 400),
(901, 18, 1, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 19),
(902, 15, 1, '964', NULL, 1, 1414954121, NULL, NULL, NULL, 1),
(903, 16, 1, '966', NULL, 1, 1414954525, NULL, NULL, NULL, 100),
(904, 17, 1, '966', NULL, 1, 1414954525, NULL, NULL, NULL, 100),
(905, 15, 2, '968', NULL, 1, 1414954752, NULL, NULL, NULL, 2),
(906, 16, 1, '972', NULL, 1, 1414954844, NULL, NULL, NULL, 100),
(907, 16, 3, '974', NULL, 1, 1414954979, NULL, NULL, NULL, 300),
(908, 15, 1, '974', NULL, 1, 1414954979, NULL, NULL, NULL, 1),
(909, 17, 1, '976', NULL, 1, 1414956304, NULL, NULL, NULL, 100),
(910, 18, 1, '976', NULL, 1, 1414956304, NULL, NULL, NULL, 19),
(911, 15, 1, '976', NULL, 1, 1414956304, NULL, NULL, NULL, 1),
(912, 16, 1, '978', NULL, 1, 1414956491, NULL, NULL, NULL, 100),
(913, 17, 4, '980', NULL, 1, 1414957683, NULL, NULL, NULL, 400),
(914, 17, 2, '982', NULL, 1, 1414960757, NULL, NULL, NULL, 200),
(915, 18, 3, '982', NULL, 1, 1414960757, NULL, NULL, NULL, 57),
(916, 17, 2, '984', NULL, 1, 1414960789, NULL, NULL, NULL, 200),
(917, 18, 3, '984', NULL, 1, 1414960789, NULL, NULL, NULL, 57),
(918, 16, 9, '984', NULL, 1, 1414960789, NULL, NULL, NULL, 900),
(919, 15, 21, '984', NULL, 1, 1414960789, NULL, NULL, NULL, 21),
(920, 9, 1, '986', NULL, 1, 1414960929, NULL, NULL, NULL, 5),
(921, 9, 1, '988', NULL, 1, 1415041075, NULL, NULL, NULL, 5),
(922, 17, 1, '990', NULL, 1, 1415134646, NULL, NULL, NULL, 100),
(923, 17, 7, '992', NULL, 1, 1415134899, NULL, NULL, NULL, 700),
(924, 18, 4, '992', NULL, 1, 1415134899, NULL, NULL, NULL, 76),
(925, 16, 12, '992', NULL, 1, 1415134899, NULL, NULL, NULL, 1200),
(926, 15, 22, '992', NULL, 1, 1415134899, NULL, NULL, NULL, 22),
(927, 17, 1, '994', NULL, 1, 1415138510, NULL, NULL, NULL, 100),
(928, 17, 1, '995', NULL, 1, 1415138510, NULL, NULL, NULL, 100),
(929, 17, 1, '996', NULL, 1, 1415138511, NULL, NULL, NULL, 100),
(930, 5, 1, '998', NULL, 1, 1415139407, NULL, NULL, NULL, 21),
(931, 17, 1, '1001', NULL, 1, 1415219084, NULL, NULL, NULL, 100),
(932, 18, 3, '1003', NULL, 1, 1415219124, NULL, NULL, NULL, 57),
(933, 17, 2, '1003', NULL, 1, 1415219124, NULL, NULL, NULL, 200),
(934, 16, 2, '1003', NULL, 1, 1415219124, NULL, NULL, NULL, 200),
(935, 15, 1, '1003', NULL, 1, 1415219124, NULL, NULL, NULL, 1),
(936, 8, 2, '1005', NULL, 1, 1415219559, NULL, NULL, NULL, 20),
(937, 18, 1, '1007', NULL, 1, 1415467631, NULL, NULL, NULL, 19),
(938, 18, 1, '1009', NULL, 1, 1415467658, NULL, NULL, NULL, 19),
(939, 8, 1, '1011', NULL, 1, 1415467704, NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_sync_login`
--

CREATE TABLE IF NOT EXISTS `onethink_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_transport`
--

CREATE TABLE IF NOT EXISTS `onethink_transport` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(5) NOT NULL,
  `cellphone` varchar(225) CHARACTER SET utf8 NOT NULL,
  `address` varchar(225) CHARACTER SET utf8 NOT NULL,
  `realname` varchar(225) CHARACTER SET utf8 NOT NULL,
  `time` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `onethink_transport`
--

INSERT INTO `onethink_transport` (`ID`, `orderid`, `cellphone`, `address`, `realname`, `time`, `status`, `uid`) VALUES
(49, 735, '546464', '4564', '564', 1414080657, 1, NULL),
(50, 946, '4564', '5464', '4564', 1414915898, 1, NULL),
(51, 948, '123', '123', '123', 1414916683, 1, NULL),
(52, 950, '5464', '4564', '4564', 1414916800, 1, NULL),
(53, 952, '46554', '564654', '564546', 1414922646, 1, NULL),
(54, 954, '4564', '5464', '4564', 1414924295, 1, NULL),
(55, 956, '654564', '65654', '654564', 1414924479, 1, NULL),
(56, 958, '4564', '5464', '5464', 1414929659, 1, NULL),
(57, 960, '5464', '56945', '4564', 1414931383, 1, NULL),
(58, 964, '', '1235454546', '546546', 1414954134, 1, NULL),
(59, 966, '65564', '65645', '321321', 1414954537, 1, NULL),
(60, 968, '5454', '654654', '6565', 1414954764, 1, NULL),
(61, 972, '6565', '', '', 1414954851, 1, NULL),
(62, 974, '54546', '', '', 1414954989, 1, NULL),
(63, 976, '5644456', '56564456', '56456', 1414956317, 1, NULL),
(64, 978, '65456', '564654', '56564', 1414956504, 1, NULL),
(65, 984, '455465', '', '', 1414960795, 1, NULL),
(66, 992, '5454', '', '', 1415134907, 1, NULL),
(67, 998, '213', '', '5646', 1415139424, 1, NULL),
(68, 998, '213', '', '5646', 1415139433, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_turnover`
--

CREATE TABLE IF NOT EXISTS `onethink_turnover` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(225) DEFAULT NULL,
  `sales` decimal(50,2) DEFAULT NULL,
  `back` decimal(50,2) DEFAULT NULL,
  `change` decimal(50,2) DEFAULT NULL,
  `profits` decimal(50,2) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `status` int(225) DEFAULT NULL COMMENT '年月日的标示',
  `info` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `onethink_turnover`
--

INSERT INTO `onethink_turnover` (`ID`, `uid`, `sales`, `back`, `change`, `profits`, `time`, `update_time`, `status`, `info`) VALUES
(24, 1, 35.00, 30.00, 17.88, -12.88, 1414104925, 1414334903, 2, '43'),
(27, 1, 133.34, 20.00, 17.88, 95.46, 1414104975, 1414166156, 1, '20141024'),
(33, 1, 35.00, NULL, NULL, 35.00, 1414254313, 1414334902, 1, '20141026'),
(31, 1, 11.00, 30.00, 17.88, -36.88, 1414137480, 1414137480, 3, '201410'),
(32, 1, 210.00, NULL, NULL, 210.00, 1414177041, 1414251851, 1, '20141025'),
(34, 1, 1597.88, NULL, NULL, 1597.88, 1414343889, 1414411964, 1, '20141027'),
(35, 1, 29.00, NULL, NULL, 29.00, 1414343920, 1414861287, 2, '44'),
(36, 1, NULL, NULL, NULL, 0.00, 1414483123, 1414505611, 1, '20141028'),
(37, 1, 241.67, NULL, NULL, 241.67, 1414523755, 1414596314, 1, '20141029'),
(38, 1, NULL, NULL, NULL, 0.00, 1414668153, 1414674193, 1, '20141030'),
(39, 1, 100.00, NULL, NULL, 100.00, 1414772361, 1414839742, 1, '20141101'),
(40, 1, 600.00, 19.00, 19.00, 562.00, 1414861284, 1414937325, 1, '20141102'),
(41, 1, 5485.98, 19.00, 19.00, 5447.98, 1414928515, 1415469669, 3, '201411'),
(42, 1, 2957.34, NULL, NULL, 2957.34, 1414955451, 1415007410, 1, '20141103'),
(43, 1, 4985.98, NULL, NULL, 4985.98, 1414956121, 1415469665, 2, '45'),
(44, 1, 2028.64, NULL, NULL, 2028.64, 1415178043, 1415178638, 1, '20141105'),
(45, 1, NULL, NULL, NULL, 0.00, 1415220892, 1415220986, 1, '20141106'),
(46, 1, NULL, NULL, NULL, 0.00, 1415446553, 1415449639, 1, '20141108'),
(47, 1, NULL, NULL, NULL, 0.00, 1415466781, 1415474216, 1, '20141109');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `onethink_ucenter_member`
--

INSERT INTO `onethink_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, '123', '46db58210048e61766852b1842cb4f0d', '14@qq.com', '1010422715', 1409671058, 2130706433, 1415471561, 1903661226, 1409671058, 1),
(2, '111', '7e8d52ab449b47fa29490f47ff6fc136', '111@qq.com', '', 1415144674, 2102927650, 0, 0, 1415144674, 1),
(3, '456', '8738f6e6ec9ce516a96658f5b147c0a7', '456@qq.com', '', 1415145053, 977127693, 0, 0, 1415145053, 1),
(4, '12311231', 'b295130d368e80eaf4faa0acc0538884', '12321233@qq.com', '', 1415178697, 2102927650, 0, 0, 1415178697, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_url`
--

CREATE TABLE IF NOT EXISTS `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_usercoupon`
--

CREATE TABLE IF NOT EXISTS `onethink_usercoupon` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(225) CHARACTER SET utf8 NOT NULL,
  `couponid` varchar(225) CHARACTER SET utf8 NOT NULL,
  `time` int(100) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '1-未使用 2-已使用',
  `cover_id` int(225) DEFAULT NULL COMMENT '图片',
  `info` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `onethink_usercoupon`
--

INSERT INTO `onethink_usercoupon` (`ID`, `uid`, `couponid`, `time`, `status`, `cover_id`, `info`) VALUES
(7, '1', '5', 1414176060, 1, NULL, '未使用'),
(8, '1', '2', 1414176205, 1, NULL, '未使用'),
(9, '1', '3', 1415466670, 1, NULL, '未使用');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_userdata`
--

CREATE TABLE IF NOT EXISTS `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
<br />
<b>Fatal error</b>:  Allowed memory size of 67108864 bytes exhausted (tried to allocate 8624153 bytes) in <b>Unknown</b> on line <b>0</b><br />
