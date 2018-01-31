-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?01 �?04 �?02:26
-- 服务器版本: 5.5.53
-- PHP 版本: 5.6.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `smart_store`
--

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memberId` int(10) NOT NULL COMMENT '会员id',
  `name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '收货人姓名',
  `phone` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '收货人电话',
  `areaId` int(10) NOT NULL COMMENT '区域id',
  `address` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '地址',
  `postCode` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `createTime` int(10) NOT NULL COMMENT '创建',
  PRIMARY KEY (`id`),
  UNIQUE KEY `memberId` (`memberId`,`areaId`,`address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址簿' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`id`, `memberId`, `name`, `phone`, `areaId`, `address`, `postCode`, `createTime`) VALUES
(1, 1, '蒋深', '13402155751', 110103, 'address1', '', 1514171351),
(2, 1, '蒋深', '13402155751', 110103, 'address2', '', 1514171553),
(3, 2, '孙佳瑜', '13764882106', 310104, 'xl码哦来了哦无聊', '', 1514517844),
(5, 2, '空调', '13764882106', 110101, '通用', '', 1514518074),
(6, 2, '孙佳瑜2', '13764882407', 310106, '三门路353弄50号302', '2000000', 1514518538);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `pid` int(10) DEFAULT NULL COMMENT '父分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `nickName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `wechatUnionID` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '微信UnionID',
  `wechatOpenID` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '微信OpenID',
  `initTime` int(10) NOT NULL COMMENT '注册时间',
  `locked` int(10) NOT NULL COMMENT '锁定(0=正常/1=锁定)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `wechatUnionID` (`wechatUnionID`),
  UNIQUE KEY `wechatOpenID` (`wechatOpenID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会员主表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `member`
--

INSERT INTO `member` (`id`, `phone`, `nickName`, `wechatUnionID`, `wechatOpenID`, `initTime`, `locked`) VALUES
(1, '13402155751', '蒋深', NULL, 'o2OSC09-ma0l6ZlYpIRAa9za0zRw', 1514178125, 0),
(2, '13764882106', '孙佳瑜', NULL, 'o2OSC0wWwpZmvH-H1A3TWsYg3q4k', 1514178205, 0),
(3, '18721231406', NULL, NULL, 'o2OSC08Ai2i1ryfpeXQcQ2xbbCcM', 1514184571, 0),
(4, '13918317673', NULL, NULL, 'o2OSC0wypknkRSLaAMzz06ggg15w', 1514271211, 0),
(5, '17717902713', NULL, NULL, 'o2OSC08ki1anqVTSVREC0AnPXCpU', 1514271520, 0),
(7, '15901754535', '', NULL, 'o2OSC00BGNC1akYIw0VDllppomYg', 1514890707, 0),
(8, '13761264048', '', NULL, 'o2OSC0zslwjpoOarxi8gnTftU39M', 1514890802, 0);

-- --------------------------------------------------------

--
-- 表的结构 `shopping_cart_record`
--

CREATE TABLE IF NOT EXISTS `shopping_cart_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memberId` int(10) NOT NULL COMMENT '会员id',
  `salesUnitType` int(10) NOT NULL COMMENT '售卖单元类型',
  `salesUnitId` int(10) NOT NULL COMMENT '售卖单元id',
  `count` int(10) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `memberId` (`memberId`,`salesUnitType`,`salesUnitId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车记录' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `shopping_cart_record`
--

INSERT INTO `shopping_cart_record` (`id`, `memberId`, `salesUnitType`, `salesUnitId`, `count`) VALUES
(1, 1, 1, 1, 11),
(2, 1, 1, 2, 2),
(3, 1, 1, 3, 3),
(4, 1, 1, 4, 4),
(5, 1, 1, 5, 5),
(6, 1, 1, 6, 6),
(7, 2, 1, 1, 5),
(8, 2, 1, 2, 2),
(9, 2, 1, 3, 2),
(10, 2, 1, 4, 4),
(11, 2, 1, 5, 2),
(12, 2, 1, 6, 1),
(13, 3, 1, 2, 1),
(14, 3, 1, 3, 1),
(15, 3, 1, 4, 1),
(16, 3, 1, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sku`
--

CREATE TABLE IF NOT EXISTS `sku` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spuId` int(10) NOT NULL COMMENT '所属商品id',
  `title` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `price` int(10) NOT NULL COMMENT '价格',
  `count` int(10) NOT NULL COMMENT '库存数量',
  `closed` int(10) NOT NULL COMMENT '是否下架(0=上架/1=下架)',
  `locked` int(10) NOT NULL COMMENT '锁定(0=正常/1=锁定)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spuId` (`spuId`,`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='库存量单位' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `sku`
--

INSERT INTO `sku` (`id`, `spuId`, `title`, `price`, `count`, `closed`, `locked`) VALUES
(1, 1, '测试商品1型号A', 100, 180, 0, 0),
(2, 1, '测试商品1型号B', 200, 100, 0, 0),
(3, 2, '测试商品2型号A', 150, 100, 0, 0),
(4, 2, '测试商品2型号B', 250, 100, 0, 0),
(5, 3, '测试商品3型号A', 400, 100, 0, 0),
(6, 4, '测试商品4型号A', 300, 100, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sku_count_log`
--

CREATE TABLE IF NOT EXISTS `sku_count_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(10) NOT NULL COMMENT '记录类型',
  `skuId` int(10) NOT NULL COMMENT '库存量单位id',
  `count` int(10) NOT NULL COMMENT '库存改变量',
  `detail` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '详情',
  `createTime` int(10) NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='库存变动记录' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sku_count_log`
--

INSERT INTO `sku_count_log` (`id`, `type`, `skuId`, `count`, `detail`, `createTime`) VALUES
(1, 1, 1, 100, '{"staffId":1}', 1514192466),
(2, 1, 1, 10, '{"staffId":1}', 1514192504),
(3, 1, 1, 10, '{"staffId":1}', 1514193013),
(4, 1, 1, 10, '{"staffId":1}', 1514193036),
(5, 1, 1, 10, '{"staffId":1}', 1514193058),
(6, 1, 1, 10, '{"staffId":1}', 1514517075),
(7, 1, 1, 10, '{"staffId":1}', 1514517108),
(8, 1, 1, 10, '{"staffId":1}', 1514517145),
(9, 1, 1, 10, '{"staffId":1}', 1514534102),
(10, 1, 2, 100, '{"staffId":1}', 1514961886),
(11, 1, 3, 100, '{"staffId":1}', 1514961894),
(12, 1, 4, 100, '{"staffId":1}', 1514961909),
(13, 1, 5, 100, '{"staffId":1}', 1514961917),
(14, 1, 6, 100, '{"staffId":1}', 1514961935);

-- --------------------------------------------------------

--
-- 表的结构 `smart_identifying_code_order`
--

CREATE TABLE IF NOT EXISTS `smart_identifying_code_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `identifyingCode` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '验证码',
  `type` int(10) NOT NULL COMMENT '验证码订单类型',
  `data` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '保留域数据',
  `createTime` int(10) NOT NULL COMMENT '创建时间戳',
  `state` int(10) NOT NULL COMMENT '0=待验证/1=验证成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='验证码校验' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `smart_identifying_code_order`
--

INSERT INTO `smart_identifying_code_order` (`id`, `identifyingCode`, `type`, `data`, `createTime`, `state`) VALUES
(1, '555691', 1, '{"phone":"13402155751","wechatOpenID":"o2OSC09-ma0l6ZlYpIRAa9za0zRw"}', 1514178111, 1),
(2, '427652', 1, '{"phone":"13764882106","wechatOpenID":"o2OSC0wWwpZmvH-H1A3TWsYg3q4k"}', 1514178184, 1),
(3, '301839', 1, '{"phone":"18721231406","wechatOpenID":"o2OSC08Ai2i1ryfpeXQcQ2xbbCcM"}', 1514184554, 1),
(4, '802137', 2, '{"id":1}', 1514185756, 0),
(5, '624213', 2, '{"id":1}', 1514186479, 1),
(6, '482367', 1, '{"phone":"13918317673","wechatOpenID":"o2OSC0wypknkRSLaAMzz06ggg15w"}', 1514270932, 0),
(7, '604112', 1, '{"phone":"13918317673","wechatOpenID":"o2OSC0wypknkRSLaAMzz06ggg15w"}', 1514271100, 1),
(8, '691053', 1, '{"phone":"17717902713","wechatOpenID":"o2OSC08ki1anqVTSVREC0AnPXCpU"}', 1514271500, 1),
(9, '908799', 2, '{"id":1}', 1514457070, 0),
(10, '865424', 2, '{"id":1}', 1514514815, 1),
(11, '153971', 1, '{"phone":"13761264048","wechatOpenID":"o2OSC0zslwjpoOarxi8gnTftU39M"}', 1514888384, 0),
(12, '859429', 1, '{"phone":"13764882106","wechatOpenID":"o2OSC0wWwpZmvH-H1A3TWsYg3q4k"}', 1514888566, 0),
(13, '412814', 1, '{"phone":"13764882106","wechatOpenID":"o2OSC0wWwpZmvH-H1A3TWsYg3q4k"}', 1514888649, 0),
(14, '607204', 1, '{"phone":"13764882106","wechatOpenID":"o2OSC0wWwpZmvH-H1A3TWsYg3q4k"}', 1514888761, 0),
(15, '762613', 1, '{"phone":"13764882106","wechatOpenID":"o2OSC0wWwpZmvH-H1A3TWsYg3q4k"}', 1514888850, 1),
(16, '800889', 1, '{"phone":"15901754535","wechatOpenID":"o2OSC00BGNC1akYIw0VDllppomYg"}', 1514890517, 1),
(17, '598524', 1, '{"phone":"13761264048","wechatOpenID":"o2OSC0zslwjpoOarxi8gnTftU39M"}', 1514890788, 1),
(18, '690049', 2, '{"id":1}', 1514961807, 1);

-- --------------------------------------------------------

--
-- 表的结构 `smart_token_record`
--

CREATE TABLE IF NOT EXISTS `smart_token_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(10) NOT NULL COMMENT '类型令牌类型',
  `token` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '令牌',
  `data` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '保留域数据',
  `createTime` int(10) NOT NULL COMMENT '创建令牌时间戳',
  `isTimeOut` int(10) NOT NULL COMMENT '是否超时(0=未超时/1=超时)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='令牌' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `smart_token_record`
--

INSERT INTO `smart_token_record` (`id`, `type`, `token`, `data`, `createTime`, `isTimeOut`) VALUES
(1, 1, '5a408a1b025ae991807', '1', 1514179099, 1),
(2, 1, '5a40972e11d7f198811', '2', 1514182446, 1),
(3, 1, '5a409f7b13edf864881', '3', 1514184571, 1),
(4, 2, '5a40a73490f4a381347', '1', 1514186548, 1),
(5, 1, '5a41a809930fe300482', '2', 1514252297, 1),
(6, 1, '5a41d6710786f847249', '1', 1514264177, 1),
(7, 1, '5a41e4508b26f634928', '3', 1514267728, 1),
(8, 1, '5a41f1ebd4f09965277', '4', 1514271211, 0),
(9, 1, '5a41f3205f6bf642957', '5', 1514271520, 0),
(10, 1, '5a421f5b1654c636745', '2', 1514282843, 1),
(11, 1, '5a430388f34c9767279', '2', 1514341256, 1),
(12, 1, '5a430431ee172242295', '1', 1514341425, 1),
(13, 1, '5a44530f62018269341', '2', 1514427151, 1),
(14, 1, '5a449fc3f09ec537868', '3', 1514446787, 1),
(15, 1, '5a44c733a8765781955', '1', 1514456883, 1),
(16, 1, '5a44c7efe282c475585', '2', 1514457071, 1),
(17, 1, '5a45a8a2a292c778917', '2', 1514514594, 1),
(18, 2, '5a45a9b46a94f751030', '1', 1514514868, 1),
(19, 1, '5a45f2795ad69632486', '1', 1514533497, 1),
(20, 1, '5a4b38e64fee9845730', '1', 1514879206, 1),
(21, 1, '5a4b39aeda3b1742919', '2', 1514879406, 1),
(22, 1, '5a4b5ea6962fe439371', '6', 1514888870, 0),
(23, 1, '5a4b62c99ceb3920925', '3', 1514889929, 1),
(24, 1, '5a4b65d395f5d238281', '7', 1514890707, 0),
(25, 1, '5a4b66326ec1d468695', '8', 1514890802, 0),
(26, 1, '5a4c3b48d68af114067', '2', 1514945352, 0),
(27, 2, '5a4c7bbb58f8a744873', '1', 1514961851, 0),
(28, 1, '5a4c7c4364a30841688', '1', 1514961987, 0),
(29, 1, '5a4ca8f3a0c79661566', '3', 1514973427, 0);

-- --------------------------------------------------------

--
-- 表的结构 `spu`
--

CREATE TABLE IF NOT EXISTS `spu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `cover` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '封面图',
  `freight` int(10) NOT NULL COMMENT '运费',
  `detail` text COLLATE utf8_bin COMMENT '商品详情',
  `uri` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品页uri',
  `memberId` int(10) NOT NULL COMMENT '推荐人id',
  `closed` int(10) NOT NULL COMMENT '是否下架(0=上架/1=下架)',
  `locked` int(10) NOT NULL COMMENT '锁定(0=正常/1=锁定)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`,`uri`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='产品' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `spu`
--

INSERT INTO `spu` (`id`, `title`, `desc`, `cover`, `freight`, `detail`, `uri`, `memberId`, `closed`, `locked`) VALUES
(1, '测试商品1', '测试商品1的描述', 'https://www.baidu.com/', 10, '测试商品1的详情', NULL, 1, 0, 0),
(2, '测试商品2', '测试商品2的描述', 'https://www.baidu.com/', 20, '测试商品2的详情', NULL, 1, 0, 0),
(3, '测试商品3', '测试商品3的描述', 'https://www.baidu.com/', 15, '测试商品3的详情', NULL, 2, 0, 0),
(4, '测试商品4', '测试商品4的描述', 'https://www.baidu.com/', 25, '测试商品4的详情', NULL, 2, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `locked` int(10) NOT NULL COMMENT '锁定(0=正常/1=锁定)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `staff`
--

INSERT INTO `staff` (`id`, `phone`, `name`, `locked`) VALUES
(1, '13402155751', '蒋深', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
