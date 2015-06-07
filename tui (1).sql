-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-06-07 03:00:39
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tui`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_article`
--
-- 创建时间： 2015-06-05 03:14:17
--

CREATE TABLE IF NOT EXISTS `t_article` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_book`
--
-- 创建时间： 2015-06-05 04:01:58
--

CREATE TABLE IF NOT EXISTS `t_book` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL COMMENT '浏览次数',
  `daid` varchar(62) NOT NULL COMMENT 'data id',
  `comment` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_book`
--

INSERT INTO `t_book` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `daid`, `comment`) VALUES
(2, 'dddd', '自控力', 'http://book.douban.com/subject/10786473/', '2015-06-05 04:05:08', 'me', 0, 'curDate', '自控也是可以学习的');

-- --------------------------------------------------------

--
-- 表的结构 `t_cate`
--
-- 创建时间： 2015-06-02 12:05:20
--

CREATE TABLE IF NOT EXISTS `t_cate` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `cate` varchar(32) NOT NULL,
  `level` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `t_cate`
--

INSERT INTO `t_cate` (`id`, `cate`, `level`) VALUES
(1, '电影', 1),
(2, '书籍', 1),
(3, '歌词', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_movie`
--
-- 创建时间： 2015-06-05 08:16:10
--

CREATE TABLE IF NOT EXISTS `t_movie` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_movie`
--

INSERT INTO `t_movie` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `comment`, `content`, `daid`) VALUES
(2, 'dddd', '布达佩斯大饭店', 'http://movie.douban.com/subject/11525673/', '2015-06-05 08:16:13', 'me', 0, '第87届奥斯卡金像奖 最佳影片(提名),永远看不腻的影片', NULL, 'curDate');

-- --------------------------------------------------------

--
-- 表的结构 `t_music`
--
-- 创建时间： 2015-06-05 04:04:22
--

CREATE TABLE IF NOT EXISTS `t_music` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `play_url` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  `comment` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_music`
--

INSERT INTO `t_music` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `play_url`, `content`, `daid`, `comment`) VALUES
(1, 'dddd', '单身情歌', 'http://play.baidu.com/?__m=mboxCtrl.playSong&__a=7277793&__o=song/s||playBtn&fr=-1||-1#', '2015-06-05 06:38:20', 'me', 0, '', NULL, 'curDate', '在爱中失落的人到处有\n而我不是最后一个');

-- --------------------------------------------------------

--
-- 表的结构 `t_news`
--
-- 创建时间： 2015-06-05 03:14:17
--

CREATE TABLE IF NOT EXISTS `t_news` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_news`
--

INSERT INTO `t_news` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `comment`, `content`, `daid`) VALUES
(2, 'dddd', '刘嘉玲出柜了？搬离梁朝伟居所 与同性友人同居', 'http://news.163.com/15/0604/12/AR92P8IM00014AED.html', '2015-06-05 07:57:40', 'me', 0, '亮瞎眼', NULL, 'curDate');

-- --------------------------------------------------------

--
-- 表的结构 `t_os`
--
-- 创建时间： 2015-06-05 03:14:17
--

CREATE TABLE IF NOT EXISTS `t_os` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_os`
--

INSERT INTO `t_os` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `comment`, `content`, `daid`) VALUES
(2, 'dddd', 'D3.js', 'https://github.com/mbostock/d3', '2015-06-05 07:49:47', 'me', 0, 'D3 helps you bring data to life using HTML, SVG, and CSS.', NULL, 'curDate');

-- --------------------------------------------------------

--
-- 表的结构 `t_people`
--
-- 创建时间： 2015-06-05 03:14:17
--

CREATE TABLE IF NOT EXISTS `t_people` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_people`
--

INSERT INTO `t_people` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `comment`, `content`, `daid`) VALUES
(2, 'dddd', '冯大辉', 'http://dbanotes.net/siteinfo.html', '2015-06-05 06:56:25', 'me', 0, '唯有小道消息方可拯救中国互联网', NULL, 'curDate');

-- --------------------------------------------------------

--
-- 表的结构 `t_website`
--
-- 创建时间： 2015-06-05 08:02:35
--

CREATE TABLE IF NOT EXISTS `t_website` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_website`
--

INSERT INTO `t_website` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `comment`, `content`, `daid`) VALUES
(2, 'dddd', 'reddit', 'http://www.reddit.com/', '2015-06-05 08:04:06', 'me', 0, '一个令人惊叹的网站', NULL, 'curDate');

-- --------------------------------------------------------

--
-- 表的结构 `t_zhihu`
--
-- 创建时间： 2015-06-05 03:33:50
--

CREATE TABLE IF NOT EXISTS `t_zhihu` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(32) NOT NULL DEFAULT 'me',
  `browse` int(32) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `content` text,
  `daid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `t_zhihu`
--

INSERT INTO `t_zhihu` (`id`, `sid`, `title`, `url`, `date`, `uname`, `browse`, `comment`, `content`, `daid`) VALUES
(3, 'dddd', '为什么很多香港电影要设定主角吃饭聊天的场景？', 'http://www.zhihu.com/question/25117345', '2015-06-05 03:50:36', 'me', 0, '', NULL, 'curDate');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
