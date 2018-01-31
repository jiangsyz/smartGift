-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?01 �?04 �?02:27
-- 服务器版本: 5.5.53
-- PHP 版本: 5.6.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `smart_store_log`
--

-- --------------------------------------------------------

--
-- 表的结构 `smart_area_record`
--

CREATE TABLE IF NOT EXISTS `smart_area_record` (
  `area_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL COMMENT '上一级的id值',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `sortnum` int(10) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `level` int(10) NOT NULL COMMENT '层级',
  `full_area_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '从根区域开始的完整id链',
  `full_area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '从根区域开始的完整name链',
  PRIMARY KEY (`area_id`),
  KEY `parent_id` (`parent_id`),
  KEY `sort` (`sortnum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='地区信息' AUTO_INCREMENT=659004403 ;

-- --------------------------------------------------------

--
-- 表的结构 `smart_log_record`
--

CREATE TABLE IF NOT EXISTS `smart_log_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `runningId` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '本次php脚本运行的唯一编号',
  `logType` int(10) NOT NULL COMMENT '日志类型',
  `data` text COLLATE utf8_bin NOT NULL COMMENT '日志内容',
  `time` int(10) NOT NULL COMMENT '日志记录时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='smartLog日志' AUTO_INCREMENT=914 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
