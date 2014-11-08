
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL DEFAULT '' COMMENT '行为规则',
  `log` text NOT NULL DEFAULT '' COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

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
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=479 ;

--
-- 转存表中的数据 `onethink_action_log`
--

INSERT INTO `onethink_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(478, 1, 1, 2130706433, 'member', 1, '123在2014-10-26 03:11登录了后台', 1, 1414264315);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `onethink_addons`
--

INSERT INTO `onethink_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 0, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0),
(16, 'OTcaiji', 'OT采集', 'OT采集插件', 1, '{"codelogin":1,"KEYWORDS":"","URL":"","LIST":"","TITLE":"","CONTENT":""}', 'Marvin(柳英伟)', '0.2', 1411634246, 1),
(17, 'ReturnTop', '返回顶部', '回到顶部美化，随机或指定显示，100款样式，每天一种换，天天都用新样式', 0, '{"random":"0","current":"79"}', 'thinkphp', '0.1', 1411634594, 0),
(22, 'AliPlay', '支付宝', '支付宝插件,后台配置支持变量。如：价格：$GOODS["price"].但是配置的变量要和数据库商品信息一致。', 1, '{"pay_type":"1","codelogin":"1","PARTNER":"5456464","KEY":"546","SELLER_EMAIL":"54645464","NOTIFY_URL":"","RETURN_URL":"","out_trade_no":"132564546564","subject":"132564546564","price":"{$goodprice}","logistics_fee":"10","logistics_type":"EXPRESS","logistics_payment":"SELLER_PAY","body":"","show_url":"132564546564","receive_name":"","receive_address":"","receive_zip":"","receive_mobile":"13312341234","receive_phone":"13312341234"}', 'Marvin(柳英伟)', '2.0', 1412762558, 0),
(19, 'Iyo9Table', '点击成可编辑插件', '向着要编辑的位置点击一下，访位置会变成一个可编辑的input标签，编辑好后，鼠标再点击空白地方，即可保存', 1, 'null', 'i友街', '0.1', 1411636824, 0),
(21, 'Template', '模版管理', '模版在线编辑插件', 1, 'null', 'Marvin(柳英伟)', '1.0', 1411637366, 1),
(23, 'SyncLogin', '第三方账号同步登陆', '第三方账号同步登陆', 1, '{"type":["Qq","Sina"],"meta":"","QqKEY":"","QqSecret":"","SinaKEY":"","SinaSecret":""}', 'yidian', '0.1', 1412762818, 0);

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
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `onethink_attachment`
--


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
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=47 ;

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
(45, 'price', '优惠券价值', '优惠券价值', '', '', '', 1, '', 7, 0, 1, 1414003061, 1414003061, '', 3, '', 'regex', '', 3, 'function'),
(46, 'num', '库存', 'int(10) UNSIGNED NOT NULL', 'num', '1', '商品库存数量', 1, '', 5, 0, 1, 1414177236, 1414177236, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_extend`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `onethink_auth_extend`
--

INSERT INTO `onethink_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

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
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `onethink_auth_group_access`
--


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
  KEY `module` (`module`,`status`,`type`)
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
  `orderid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `tool` varchar(225) DEFAULT NULL COMMENT '订单号',
  `toolid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `uid` int(225) DEFAULT NULL,
  `status` int(10) DEFAULT '1',
  `time` int(10) DEFAULT NULL,
  `info` varchar(225) NOT NULL,
  `total` decimal(50,2) DEFAULT NULL,
  `backinfo` varchar(225) DEFAULT NULL,
  `addressid` int(225) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `assistant` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `onethink_backlist`
--

INSERT INTO `onethink_backlist` (`ID`, `goodid`, `num`, `orderid`, `tool`, `toolid`, `uid`, `status`, `time`, `info`, `total`, `backinfo`, `addressid`, `update_time`, `assistant`) VALUES
(1, 5, 2, '56+', '5+4+', '45+4', 1, 4, 5, '同意退货,已重新提交订单并发货', '80.00', NULL, 21, NULL, NULL),
(4, 8, 4654, NULL, NULL, NULL, NULL, 3, NULL, '同意', '0.00', '退货已完成', 21, 1414070662, NULL),
(5, 8, 2, NULL, NULL, NULL, 123, 1, 1414087501, '暂无', '10.00', '同意退货', 21, 1414071941, NULL),
(6, 9, 2, NULL, NULL, NULL, 1, 1, 1414067582, '暂无', '0.00', '正在编辑', 22, 1414092363, NULL);

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
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=70 ;

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
(68, 'coupon', '优惠券', 0, 0, 10, '', '', '', '', '', '', '', '2', '2', '2', 0, 1, 1, 0, 0, '', '', 1413987264, 1413987264, 1, 0, NULL);

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
  `addressid` int(225) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `assistant` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `onethink_change`
--

INSERT INTO `onethink_change` (`ID`, `goodid`, `num`, `orderid`, `tool`, `toolid`, `uid`, `status`, `time`, `info`, `total`, `backinfo`, `addressid`, `update_time`, `assistant`) VALUES
(7, 5, 6, '455', '564', '1', NULL, 1, 1414087501, '5656', NULL, '正处理换货商品', NULL, 1414076414, 1);

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
  KEY `pid` (`pid`)
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

--
-- 转存表中的数据 `onethink_check_info`
--


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
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `onethink_config`
--

INSERT INTO `onethink_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台*显示标题*', 1378898976, 1412577255, 1, 'b2b商城系统-onethink b2b商城系统-，thinkphp商城系统', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'b2b商城系统-onethink b2b商城系统-，thinkphp商城系统', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink，b2b商城系统', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '沪ICP备12007941号-2', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰\r\namaze:妹子UI', '后台颜色风格', 1379122533, 1411636415, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:运费', 4),
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
(40, 'HOTSEARCH', 1, '热词', 1, '', '热门搜索词', 1413221018, 1413224479, 1, '国庆节放假时间,商务小清新,苹果,中国风,美女', 0),
(41, 'SHIPPRICE', 0, '运费', 5, '', '低于一定金额的运费', 1414001070, 1414001482, 1, '10', 0),
(42, 'LOWWEST', 0, '最低消费金额', 5, '', '用户最低消费的金额，低于该金额，则增加运费', 1414001165, 1414001495, 1, '50', 0),
(43, 'RATIO', 0, '积分现金兑换比', 5, '', '1000表示1000积分可兑换成1元', 1414153401, 1414153401, 1, '1000', 0),
(44, 'DEADTIME', 0, '退货有效期', 5, '', '从订单签收完成多少天内可以退货', 1414164561, 1414164642, 1, '7', 0),
(45, 'CHANGETIME', 0, '换货期', 5, '', '订单签收多少天内后可以换货', 1414164627, 1414164654, 1, '15', 0),
(46, 'QQ', 1, 'QQ客服', 5, '', '网站客服的qq代码', 1414183635, 1414183635, 1, '1010422715', 0),
(47, 'ALWW', 0, '阿里旺旺号', 5, '', '网站阿里旺旺客服', 1414183716, 1414183716, 1, '', 0),
(48, 'IP_TONGJI', 4, '开启ip访问统计', 3, '0:关闭,1:开启', '开启后追踪用户的访问页面，访问明细，访问地域', 1414244159, 1414244270, 1, '1', 0),
(49, 'LAG', 0, '统计时间间隔（小时）', 0, '', '重复访问的会员每隔多少时间统计，小于这一时间，不统计', 1414258358, 1414258358, 1, '6', 21);

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
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `onethink_document`
--

INSERT INTO `onethink_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(12, 1, '', '肯德基电子优惠券', 68, '1236589443679', 0, 0, 2, 2, 0, 0, 11, 1, 0, 0, 5, 0, 0, 0, 1413988167, 1413988167, 1),
(5, 1, '', '新鲜胡萝卜 蔬菜 水果 同城 送菜 到家 货到付款 只售珠三角地区', 45, '', 0, 0, 5, 2, 4, 0, 4, 1, 0, 0, 815, 0, 0, 0, 1411380420, 1413909051, 1),
(8, 1, '', '【天天果园】智利青苹果12个', 57, '酸爽多汁，肉质细嫩，高品质新鲜保证', 0, 0, 5, 2, 4, 0, 7, 1, 0, 0, 500, 0, 0, 0, 1411927620, 1414093868, 1),
(9, 1, '', '常鲜生 正宗菲律宾进口香蕉', 57, '', 0, 0, 5, 2, 4, 0, 9, 1, 0, 0, 162, 0, 0, 0, 1411928400, 1414093842, 1);

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
(12, 0, '1236589443679', '', 0);

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
  `num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `onethink_document_product`
--

INSERT INTO `onethink_document_product` (`id`, `price`, `content`, `weight`, `totalsales`, `area`, `ads_pic_id`, `adtitle`, `yprice`, `mark`, `unionid`, `num`) VALUES
(5, '2.98', '<p style="background:white;text-align:left;" align="left">\r\n	<b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;">营养成份</span></b><b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:arial sans-serif;"></span></b> \r\n</p>\r\n<p style="text-indent:-35.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-size:14.0pt;font-family:宋体;">每</span><span style="font-size:14.0pt;"><span>100</span></span><span style="font-size:14.0pt;font-family:宋体;">克胡萝卜中，约含</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>蛋白质</span></span></a></span><span style="font-size:14.0pt;"><span>0.6</span></span><span style="font-size:14.0pt;font-family:宋体;">克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>脂肪</span></span></a></span><span style="font-size:14.0pt;"><span>0.3</span></span><span style="font-size:14.0pt;font-family:宋体;">克，糖类</span><span style="font-size:14.0pt;"><span>7.6</span></span><span style="font-size:14.0pt;font-family:宋体;">～</span><span style="font-size:14.0pt;"><span>8.3</span></span><span style="font-size:14.0pt;font-family:宋体;">克，铁</span><span style="font-size:14.0pt;"><span>0.6</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>维生素</span></span><span style="color:windowtext;text-decoration:none;">A</span><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>原</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">（胡萝卜素）</span><span style="font-size:14.0pt;"><span>1.35</span></span><span style="font-size:14.0pt;font-family:宋体;">～</span><span style="font-size:14.0pt;"><span>17.25</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>维生素</span></span><span style="color:windowtext;text-decoration:none;">B1</span></a></span><span style="font-size:14.0pt;"><span>0.02</span></span><span style="font-size:14.0pt;font-family:宋体;">～</span><span style="font-size:14.0pt;"><span>0.04</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>维生素</span></span><span style="color:windowtext;text-decoration:none;">B2</span></a></span><span style="font-size:14.0pt;"><span>0.04</span></span><span style="font-size:14.0pt;font-family:宋体;">～</span><span style="font-size:14.0pt;"><span>0.05</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，维生素</span><span style="font-size:14.0pt;"><span>C12</span></span><span style="font-size:14.0pt;font-family:宋体;">毫克，热量</span><span style="font-size:14.0pt;"><span>150.7</span></span><span style="font-size:14.0pt;font-family:宋体;">千焦，另含果胶、淀粉、无机盐和多种氨基酸。各类品种中尤以深橘红色胡萝卜素含量最高，各种胡萝卜所含能量在</span><span style="font-size:14.0pt;"><span>79.5</span></span><span style="font-size:14.0pt;font-family:宋体;">干焦～</span><span style="font-size:14.0pt;"><span>1339.8</span></span><span style="font-size:14.0pt;font-family:宋体;">千焦之间。胡萝卜是一种质脆味美、营养丰富的家常蔬菜，素有</span><span style="font-size:14.0pt;"><span>“</span></span><span style="font-size:14.0pt;font-family:宋体;">小人参</span><span style="font-size:14.0pt;"><span>”</span></span><span style="font-size:14.0pt;font-family:宋体;">之称。胡萝卜富含糖类、脂肪、挥发油、胡萝卜素、维生素</span><span style="font-size:14.0pt;"><span>A</span></span><span style="font-size:14.0pt;font-family:宋体;">、维生素</span><span style="font-size:14.0pt;"><span>B1</span></span><span style="font-size:14.0pt;font-family:宋体;">、维生素</span><span style="font-size:14.0pt;"><span>B2</span></span><span style="font-size:14.0pt;font-family:宋体;">、</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>花青素</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">、钙、铁等营养成分。</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="background:white;text-align:left;" align="left">\r\n	<b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;">饮食宜忌</span></b><span style="font-size:14.0pt;"></span> \r\n</p>\r\n<ul>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">胡萝卜也适宜于</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>皮肤干燥</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">、粗糙，或患毛发苔藓、黑头粉刺、角化型</span><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"><a><span style="color:windowtext;font-family:宋体;text-decoration:none;"><span>湿疹</span></span></a></span><span style="font-size:14.0pt;font-family:宋体;">者食用。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">适宜癌症、高血压、夜盲症、干眼症患者、营养不良、食欲不振者、皮肤粗糙者。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">烹调胡萝卜时，不要加醋，以免胡萝卜素损失。另外不要过量食用。大量摄入胡萝卜素会令皮肤的色素产生变化，变成橙黄色。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;</span></span></span></span><span><span style="font-size:14.0pt;font-family:宋体;">不宜食用切碎后水洗或久浸泡于水中的萝卜。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">服用双氢克尿塞时不宜食用。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">食时咀嚼时间不宜过短。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">不可与白萝卜同时食用。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">不宜与富含维生素</span><span style="font-size:14.0pt;"><span>C</span></span><span style="font-size:14.0pt;font-family:宋体;">的蔬菜（如菠菜、油菜、花菜、番茄、辣椒等），水果（如柑橘、柠檬、草莓、枣子等）同食破坏维生素</span><span style="font-size:14.0pt;"><span>C</span></span><span style="font-size:14.0pt;font-family:宋体;">，降低营养价值。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">禁忌生食。胡萝卜虽是蔬菜，但只有烹调，其所含的类萝卜素才较稳定。按照我们的炒菜方法，营养可保存</span><span style="font-size:14.0pt;"><span>76%</span></span><span style="font-size:14.0pt;font-family:宋体;">至</span><span style="font-size:14.0pt;"><span>94%</span></span><span style="font-size:14.0pt;font-family:宋体;">。因此生吃胡萝卜，类萝卜素因没有脂肪而很难被吸收，从而造成浪费。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n	<li>\r\n		<span style="font-size:14.0pt;"></span><span><span style="font-size:14.0pt;font-family:宋体;">研究发现，妇女过多吃胡萝卜后，摄入的大量胡萝卜素会引起闭经和抑制卵巢的正常排卵功能。因此</span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">欲怀孕的妇女不宜多吃胡萝卜</span></b><span style="font-size:14.0pt;font-family:宋体;">。</span><span style="font-size:14.0pt;"></span></span> \r\n	</li>\r\n</ul>\r\n<p style="background:white;">\r\n	<a name="3_1"></a><a name="sub17967_3_1"></a><b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:宋体;">作用</span></b><b><span style="font-size:15.0pt;background:white;color:#0000cc;font-family:arial sans-serif;"></span></b> \r\n</p>\r\n<p>\r\n	<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;</span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、益肝明目；</span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、利膈宽肠；</span><span style="font-size:14.0pt;"><span><span>3</span></span></span><span style="font-size:14.0pt;font-family:宋体;">、健脾除疳；</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:42.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">、增强免疫功能；</span><span style="font-size:14.0pt;"><span><span>5</span></span></span><span style="font-size:14.0pt;font-family:宋体;">、降糖降脂。</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p>\r\n	<a name="3_2"></a><a name="sub17967_3_2"></a><a name="8_1"></a><a name="sub17967_8_1"></a><b><span style="font-size:15.0pt;color:#0000cc;font-family:宋体;">推荐食谱</span></b><b><span style="font-size:15.0pt;color:#0000cc;"></span></b> \r\n</p>\r\n<p style="background:white;text-indent:29.1pt;">\r\n	<a name="8_3"></a><a name="sub17967_8_3"></a><a name="8_4"></a><a name="sub17967_8_4"></a><span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">胡萝卜蛋饼</span></b><b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"></span></b></span> \r\n</p>\r\n<p style="text-indent:55.6pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【原料】：胡萝卜、苦瓜、鸡蛋、葱花　</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:55.6pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【调料】：盐、胡椒粉、油</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:55.6pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、胡萝卜切小丁、苦瓜切小丁，</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、鸡蛋打散，放入，苦瓜、胡萝卜、加盐、胡椒粉、拌匀，</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:7.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">、锅中放油，</span><span style="font-size:14.0pt;"><span>5</span></span><span style="font-size:14.0pt;font-family:宋体;">成油温时放入蛋液两面煎熟即可。</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="background:white;text-indent:29.1pt;">\r\n	<a name="8_5"></a><a name="sub17967_8_5"></a><span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">香烧胡萝卜</span></b><b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"></span></b></span> \r\n</p>\r\n<p style="text-indent:-119.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-size:14.0pt;font-family:宋体;">【原料】：胡萝卜</span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">根、生抽</span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">小勺、白糖</span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">小勺、老抽</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">小勺（用家里的白瓷汤勺就行）、盐少许。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:56.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、胡萝卜去皮，切滚刀块，不宜太大。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、两小勺生抽，一小勺老抽，两小勺白糖，少许的盐，混合调成汁。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">、平底锅倒油烧热，下入胡萝卜块，中小火慢慢的烧，中间不加水，也不用盖锅盖，将胡萝卜烧软；</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">、待胡萝卜的棱角变圆，变得绵软并且没有一点生味。胡萝卜烧透后倒入调味汁，待汤汁烧至略干，香味渗入胡萝卜就可以关火了。</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="background:white;text-indent:29.1pt;">\r\n	<a name="8_6"></a><a name="sub17967_8_6"></a><a name="8_7"></a><a name="sub17967_8_7"></a><span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">炝炒胡萝卜片</span></b><b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"></span></b></span> \r\n</p>\r\n<p style="text-indent:-133.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-size:14.0pt;font-family:宋体;">【原料】：胡萝卜</span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">根约</span><span style="font-size:14.0pt;"><span>300</span></span><span style="font-size:14.0pt;font-family:宋体;">克、蒜苗（青蒜）</span><span style="font-size:14.0pt;"><span>50</span></span><span style="font-size:14.0pt;font-family:宋体;">克、干辣椒</span><span style="font-size:14.0pt;"><span>15</span></span><span style="font-size:14.0pt;font-family:宋体;">克、盐适量、油。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-84.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">、将胡萝卜洗净去皮，切成菱形片（先斜切成段，在纵切成片）；</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>2</span></span><span style="font-size:14.0pt;font-family:宋体;">、锅中放入适量水和少量油，将胡萝卜片放入煮熟，捞出沥干待用；</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>3</span></span><span style="font-size:14.0pt;font-family:宋体;">、蒜苗洗净拍松切成段，干辣椒去籽切段或者丝；</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>4</span></span><span style="font-size:14.0pt;font-family:宋体;">、炒锅烧热，放入少量油，放入干辣椒炒香；</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>5</span></span><span style="font-size:14.0pt;font-family:宋体;">、再放入蒜苗炒香；</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-21.0pt;">\r\n	<span><span style="font-size:14.0pt;"><span>6</span></span><span style="font-size:14.0pt;font-family:宋体;">、最后加入胡萝卜片炒匀，加盐调味即可。</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="background:white;text-indent:28.95pt;">\r\n	<a name="8_8"></a><a name="sub17967_8_8"></a><a name="9_1"></a><a name="sub17967_9_1"></a><a name="9_2"></a><a name="sub17967_9_2"></a><a name="9_3"></a><a name="sub17967_9_3"></a><span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">胡萝卜白米香粥</span></b><span style="font-size:14.0pt;background:white;font-family:宋体;">（</span><span style="font-size:14.0pt;font-family:宋体;">适合</span><span style="font-size:14.0pt;"><span>5</span></span><span style="font-size:14.0pt;font-family:宋体;">个月以上的宝宝）</span><b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"></span></b></span> \r\n</p>\r\n<p style="text-indent:56.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【原料】：胡萝卜</span><span style="font-size:14.0pt;"><span>1</span></span><span style="font-size:14.0pt;font-family:宋体;">根，煮到烂熟的白米粥半小碗。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-63.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：把胡萝卜清洗干净后，去皮煮熟，然后和白米粥一起压成泥状，也可采用果汁机打成泥状，经过加热就可以喂宝贝了。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-63.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【贴心小提醒】：也可以把胡萝卜和白米饭一起煮到烂熟，再用勺子压碎，待放凉后就可喂宝贝了。</span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="background:white;text-indent:29.1pt;">\r\n	<a name="8_2"></a><a name="sub17967_8_2"></a><span><b><span style="font-size:14.0pt;background:white;font-family:宋体;">胡萝卜香泥</span></b><b><span style="font-size:14.0pt;background:white;font-family:arial sans-serif;"></span></b></span> \r\n</p>\r\n<p>\r\n	<span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"><span><span>&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-size:14.0pt;font-family:宋体;">【原料】：新鲜胡萝卜半根。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<p style="text-indent:-63.0pt;">\r\n	<span><span style="font-size:14.0pt;font-family:宋体;">【做法】：先把胡萝卜清洗干净，煮熟或蒸熟，然后将其放凉后去皮，再用压泥器压成碎泥状，就可以喂宝贝吃了。</span><span style="font-size:14.0pt;"></span><span style="font-size:14.0pt;font-family:宋体;"></span><span style="font-size:14.0pt;"></span></span> \r\n</p>\r\n<span><span style="font-size:14.0pt;font-family:宋体;">【贴心小提醒】：胡萝卜虽然富有营养，但吃得适量最好。如果给宝贝吃得过多，容易使皮肤变黄。</span></span><br />', '500', 15, '中国大陆', 8, 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', '', '2', '8,9', 1),
(8, '10.00', '<div id="J_DcTopRightWrap" style="margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;">\r\n	<div id="J_DcTopRight" class="J_DcAsyn tb-shop" style="margin:0px;padding:0px;">\r\n		<div class="J_TModule" id="shop8751140001" style="margin:0px;padding:0px;">\r\n			<div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined" style="margin:0px;padding:0px;">\r\n				<div class="skin-box-bd clear-fix" style="margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;">\r\n					<span> \r\n					<p>\r\n						<img src="http://img03.taobaocdn.com/imgextra/i3/738580955/TB2oT.ZapXXXXaxXXXXXXXXXXXX-738580955.jpg_.webp" /> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class="skin-box-bt"><b></b></s> \r\n			</div>\r\n		</div>\r\n		<div class="J_TModule" id="shop8825085575" style="margin:0px;padding:0px;">\r\n			<div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined" style="margin:0px;padding:0px;">\r\n				<s class="skin-box-tp"><b></b></s> \r\n				<div class="skin-box-bd clear-fix" style="margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;">\r\n					<span> \r\n					<p>\r\n						<a href="http://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.UoC3cM&id=35904185523&scene=taobao_shop" target="_blank"><img src="http://img03.taobaocdn.com/imgextra/i3/738580955/TB2AEVlaFXXXXbOXXXXXXXXXXXX-738580955.jpg_.webp" /></a> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class="skin-box-bt"><b></b></s> \r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div id="description" class="J_DetailSection tshop-psm tshop-psm-bdetaildes" style="margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;">\r\n	<div class="content ke-post" style="margin:10px 0px 0px;padding:0px;font-size:14px;font-family:tahoma, arial, 宋体, sans-serif;">\r\n		<div style="margin:0px;padding:0px;">\r\n			<span><span style="font-weight:700;"><span style="font-size:18px;">智利青苹果</span></span><br />\r\n</span> \r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<p>\r\n				<span><span style="font-weight:700;"><img class="ke_anchor" id="ids-tag-m-35171" src="http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif" style="height:1px;" />产品简介</span><br />\r\n智利苹果色泽艳丽，颜色从青绿到浅绿都有，也可能会略带粉红色。口感上则相当酸，是喜欢酸味朋友们的大爱，爽脆多汁，口味鲜美，吃法较多。&nbsp;</span> \r\n			</p>\r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<span><span style="font-weight:700;">温馨提示</span><br />\r\n</span> \r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<span>此款产地为智利。</span> \r\n		</div>\r\n		<div style="margin:0px;padding:0px;">\r\n			<span>冰箱冷藏保存时间会更久，保存时表皮不要沾水。苹果皮中含有丰富营养素，建议连皮一起吃。</span> \r\n			<p>\r\n				<img align="absmiddle" src="http://img02.taobaocdn.com/imgextra/i2/738580955/T2zOhCXfdOXXXXXXXX-738580955.jpg" /><img align="absmiddle" src="http://img04.taobaocdn.com/imgextra/i4/738580955/T2Zz1aXXtdXXXXXXXX-738580955.jpg" /><img align="absmiddle" src="http://img01.taobaocdn.com/imgextra/i1/738580955/T2VPCuXc4cXXXXXXXX-738580955.jpg" /><img align="absmiddle" src="http://img04.taobaocdn.com/imgextra/i4/738580955/T2ZwXBXl8NXXXXXXXX-738580955.jpg" /> \r\n			</p>\r\n			<p>\r\n				<img align="absmiddle" src="http://img04.taobaocdn.com/imgextra/i4/738580955/T2MmJyXi0OXXXXXXXX-738580955.jpg_.webp" /><img class="ke_anchor" id="ids-tag-m-35173" src="http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif" style="height:1px;" /><img align="absmiddle" src="http://img01.taobaocdn.com/imgextra/i1/738580955/T2yn4DXj8OXXXXXXXX-738580955.jpg_.webp" /> \r\n			</p>\r\n		</div>\r\n		<p>\r\n			<img class="ke_anchor" id="ids-tag-m-35176" src="http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif" style="height:1px;" /><img align="absmiddle" src="http://img03.taobaocdn.com/imgextra/i3/738580955/T28tdGXd0OXXXXXXXX-738580955.jpg_.webp" /> \r\n		</p>\r\n	</div>\r\n</div>', '500', 11, '中国大陆', 8, '正宗进口青苹果水果酸甜新鲜水果', '', '', '', 1),
(9, '5.00', '<h2 align="center" style="font-family:tahoma, arial, 宋体, sans-serif;background-color:#FFFFFF;">\r\n	配送范围：目前江浙沪（其他城市或者偏远乡镇村目前不配送，谢谢）\r\n</h2>\r\n<p align="center" style="font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<img src="http://gd1.alicdn.com/imgextra/i1/595478579/T2gtbxXINaXXXXXXXX_!!595478579.jpg" /> \r\n</p>\r\n<p align="center" style="font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<img src="http://gd2.alicdn.com/imgextra/i2/595478579/T2yOPCXKFaXXXXXXXX_!!595478579.jpg" /><img src="http://gd3.alicdn.com/imgextra/i3/595478579/T2S52CXMlaXXXXXXXX_!!595478579.jpg" /><img src="http://gd3.alicdn.com/imgextra/i3/595478579/T2XmrCXLNaXXXXXXXX_!!595478579.jpg" /> \r\n</p>\r\n<p align="center" style="font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">\r\n	<img src="http://gd3.alicdn.com/imgextra/i3/595478579/T2poTvXMpaXXXXXXXX_!!595478579.jpg" /> \r\n</p>', '500', 0, '中国大陆', 10, '常鲜生 菲律宾进口香蕉 都乐香蕉 新鲜水果 整箱批发', '', '', '', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `onethink_favortable`
--

INSERT INTO `onethink_favortable` (`ID`, `uid`, `goodid`, `time`, `num`) VALUES
(13, 1, 8, '2014-10-22 19:14:47', 1),
(14, 1, 9, '2014-10-25 01:16:34', 1);

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
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
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
  UNIQUE KEY `uk_md5` (`md5`)
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
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `onethink_hooks`
--

INSERT INTO `onethink_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1),
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
(24, 'checkin', '签到', 1, 1395371353, '', 1),
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

--
-- 转存表中的数据 `onethink_listtmp`
--


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
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `onethink_login`
--


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
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_member`
--

INSERT INTO `onethink_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `address`, `cellphone`, `position`, `realname`, `youbian`, `lever`, `iswors`) VALUES
(1, '123', 30, '1900-00-00', '1010422715', 330, 76, 2130706433, 1413206453, 2130706433, 1414264315, 1, '5656', '56546', '5564', '5456', '', 'lv1', NULL);

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
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=151 ;

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
(150, '浏览统计', 146, 20, 'Lookup/index', 0, '', '访问统计', 0, 1),
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
(134, '优惠券', 131, 4, 'Fcoupon/index', 0, '', '优惠券管理', 0, 1),
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
(149, '每月统计', 146, 18, 'Report/month', 0, '', '报表统计', 0, 1);

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
(5, 'product', '商品', 1, '', 1, '{"1":["3","12","36","46","44","43","37","35","39"],"2":["2","41","40","9","10","42","13","14","5","16","20","38","11","17","19"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:', 10, '', '', 1411375498, 1414177267, 1, 'MyISAM'),
(7, 'coupon', '优惠券', 1, '', 1, '{"1":["3","45","12","5","13"],"2":["2","11","10","19","20","17","9","14","16"]}', '1:基础,2:扩展', '', '', '', '', 'id：主键', 10, '', '', 1414002884, 1414003271, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_order`
--

CREATE TABLE IF NOT EXISTS `onethink_order` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(225) DEFAULT NULL,
  `pricetotal` decimal(50,2) NOT NULL DEFAULT '0.00',
  `ptime` int(225) DEFAULT NULL,
  `status` varchar(225) NOT NULL DEFAULT '0' COMMENT '0-系统生成完成1-用户已提交订单2-3系统处理进入物流配送',
  `assistant` varchar(225) DEFAULT '无' COMMENT '操作人',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(225) DEFAULT NULL,
  `shipprice` varchar(225) DEFAULT NULL,
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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=873 ;

--
-- 转存表中的数据 `onethink_order`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

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
(14, '/Uploads/Picture/2014-10-25/544a994e1e338.jpg', '', 'ad1a25faa262cf395b42b4aa4aead8cf', 'e08dc9cbab906cbeea1e036deaf3b791d6db4f9e', 1, 1414175054);

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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `onethink_records`
--

INSERT INTO `onethink_records` (`ID`, `ip`, `url`, `country`, `time`, `uid`, `info`, `province`, `city`, `referer`, `tag`) VALUES
(4, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248450, 1, '', '5', '5', NULL, NULL),
(5, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248526, 1, '', '5', '5', NULL, NULL),
(6, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248528, 1, '', '5', '5', NULL, NULL),
(7, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248536, 1, '', '5', '5', NULL, NULL),
(8, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248537, 1, '', '5', '5', NULL, NULL),
(9, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248579, 1, '', '5', '5', NULL, NULL),
(10, '5', 'localhost/111/index.php?s=/Home/pay/', '5', 1414248581, 1, '', '5', '5', NULL, NULL);

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

--
-- 转存表中的数据 `onethink_shaddress`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `onethink_shopcart`
--


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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=828 ;

--
-- 转存表中的数据 `onethink_shoplist`
--

INSERT INTO `onethink_shoplist` (`ID`, `goodid`, `num`, `orderid`, `uid`, `status`, `time`) VALUES
(816, 5, 1, '848', NULL, NULL, NULL),
(817, 8, 1, '852', NULL, NULL, NULL),
(818, 8, 1, '854', NULL, NULL, NULL),
(819, 8, 1, '855', NULL, NULL, NULL),
(820, 8, 4, '858', NULL, NULL, NULL),
(821, 8, 1, '860', NULL, NULL, NULL),
(822, 8, 1, '862', NULL, 1, NULL),
(823, 8, 1, '864', NULL, 1, NULL),
(824, 8, 1, '866', NULL, 1, NULL),
(825, 8, 4, '868', NULL, 1, NULL),
(826, 9, 2, '868', NULL, 1, NULL),
(827, 8, 1, '870', NULL, 1, NULL);

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

--
-- 转存表中的数据 `onethink_sync_login`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `onethink_transport`
--

INSERT INTO `onethink_transport` (`ID`, `orderid`, `cellphone`, `address`, `realname`, `time`, `status`, `uid`) VALUES
(31, 731, '4564', '12345645', '456', 1414078290, 1, 1),
(32, 731, '4564', '12399999999999', '456', NULL, NULL, 1),
(33, 731, '4564', '12399999999999', '456', NULL, NULL, 1),
(34, 731, '4564', '12399999999999', '456', NULL, NULL, 1),
(35, 731, '4564', '12399999999999', '456', 1414079477, NULL, NULL),
(36, 731, '4564', '12399999999999', '456', 1414079805, NULL, NULL),
(37, 731, '4564', '12399999999999', '456', 1414079926, NULL, NULL),
(38, 731, '4564', '12399999999999', '456', 1414079936, NULL, NULL),
(39, 0, '', '999999', '', 1414080046, 1, NULL),
(40, 0, '654654', '999999', '564654654', 1414080095, 1, NULL),
(41, 0, '654654', '999999', '564654654', 1414080127, 1, NULL),
(42, 0, '654654', '999999', '564654654', 1414080136, 1, NULL),
(43, 0, '654654', '999999', '564654654', 1414080189, 1, NULL),
(44, 733, '654654', '999999', '564654654', 1414080277, 1, NULL),
(45, 735, '546464', '4564', '564', 1414080382, 1, NULL),
(46, 735, '546464', '4564', '564', 1414080384, 1, NULL),
(47, 735, '546464', '4564', '564', 1414080387, NULL, NULL),
(48, 735, '546464', '4564', '564', 1414080614, NULL, NULL),
(49, 735, '546464', '4564', '564', 1414080657, 1, NULL),
(50, 737, '', '9+99898', '99999999', 1414080707, 1, NULL),
(51, 737, '', '5555555555555', '99999999', 1414080736, NULL, NULL),
(52, 740, '56546', '5656', '5456', 1414087498, 1, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `onethink_turnover`
--

INSERT INTO `onethink_turnover` (`ID`, `uid`, `sales`, `back`, `change`, `profits`, `time`, `update_time`, `status`, `info`) VALUES
(24, 1, '430.36', '30.00', '17.88', '382.48', 1414104925, 1414254513, 2, '43'),
(27, 1, '133.34', '20.00', '17.88', '95.46', 1414104975, 1414166156, 1, '20141024'),
(33, 1, NULL, NULL, NULL, '0.00', 1414254313, 1414255880, 1, '20141026'),
(31, 1, '11.00', '30.00', '17.88', '-36.88', 1414137480, 1414137480, 3, '201410'),
(32, 1, '210.00', NULL, NULL, '210.00', 1414177041, 1414251851, 1, '20141025');

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

--
-- 转存表中的数据 `onethink_ucenter_admin`
--


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
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `onethink_ucenter_app`
--


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
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_ucenter_member`
--

INSERT INTO `onethink_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, '123', '46db58210048e61766852b1842cb4f0d', '14@qq.com', '1010422715', 1409671058, 2130706433, 1414264315, 2130706433, 1409671058, 1);

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

--
-- 转存表中的数据 `onethink_ucenter_setting`
--


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
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `onethink_url`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `onethink_usercoupon`
--

INSERT INTO `onethink_usercoupon` (`ID`, `uid`, `couponid`, `time`, `status`, `cover_id`, `info`) VALUES
(7, '1', '5', 1414176060, 1, NULL, '未使用'),
(8, '1', '2', 1414176205, 1, NULL, '未使用');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_userdata`
--

CREATE TABLE IF NOT EXISTS `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `onethink_userdata`
--

