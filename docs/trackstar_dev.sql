-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-12-17 08:08:48
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackstar_dev`
--

-- --------------------------------------------------------

--
-- 表的结构 `authassignment`
--

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `authassignment`
--

INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', '12', NULL, 'N;'),
('reader', '5', 'return isset($params["project"]) &&$params["project"]->isUserInRole("admin");', 'N;');

-- --------------------------------------------------------

--
-- 表的结构 `authitem`
--

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('createUser', 0, 'create a new user', NULL, 'N;'),
('readUser', 0, 'read user profile information', NULL, 'N;'),
('updateUser', 0, 'update a users information', NULL, 'N;'),
('deleteUser', 0, 'remove a user from a project', NULL, 'N;'),
('createProject', 0, 'create a new project', NULL, 'N;'),
('readProject', 0, 'read project information', NULL, 'N;'),
('updateProject', 0, 'up date project information', NULL, 'N;'),
('deleteProject', 0, 'delete a project', NULL, 'N;'),
('createIssue', 0, 'create a new issue', NULL, 'N;'),
('readIssue', 0, 'read issue information', NULL, 'N;'),
('updateIssue', 0, 'update issue information', NULL, 'N;'),
('deleteIssue', 0, 'delete an issue from a project', NULL, 'N;'),
('reader', 2, '', NULL, 'N;'),
('member', 2, '', NULL, 'N;'),
('owner', 2, '', NULL, 'N;'),
('adminManagement', 1, 'access to the application administration functionality', NULL, 'N;'),
('admin', 2, '', NULL, 'N;');

-- --------------------------------------------------------

--
-- 表的结构 `authitemchild`
--

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('admin', 'adminManagement'),
('admin', 'member'),
('admin', 'owner'),
('admin', 'reader'),
('member', 'createIssue'),
('member', 'deleteIssue'),
('member', 'reader'),
('member', 'updateIssue'),
('owner', 'createProject'),
('owner', 'createUser'),
('owner', 'deleteProject'),
('owner', 'deleteUser'),
('owner', 'member'),
('owner', 'reader'),
('owner', 'updateProject'),
('owner', 'updateUser'),
('reader', 'readIssue'),
('reader', 'readProject'),
('reader', 'readUser');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_issue`
--

CREATE TABLE `tbl_issue` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tbl_issue`
--

INSERT INTO `tbl_issue` (`id`, `name`, `description`, `project_id`, `type_id`, `status_id`, `owner_id`, `requester_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(8, 'issue belong to project3', 'issue belong to project3', NULL, 0, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(9, 'issue belong to project3', '', NULL, 0, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(15, 'issue belong to project1', '123', 1, 0, 4, 2, 1, NULL, NULL, NULL, NULL),
(16, 'test issue belong to project1', '', 1, 0, 4, 1, 1, NULL, NULL, '2018-12-09 23:01:19', 0),
(17, 'test issue belong to project1', '', 1, 3, NULL, 1, 1, NULL, NULL, NULL, NULL),
(18, 'test issue belong to project1', '', 1, 0, 5, 1, 1, NULL, NULL, NULL, NULL),
(19, 'test issue belong to project1', 'test', 1, 0, 3, 1, 1, '2018-12-16 12:05:11', 5, '2018-12-16 12:06:08', 5);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_project`
--

CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `description`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'project1', 'project111', NULL, NULL, '2018-12-16 18:16:47', 5),
(2, 'Test Project15', 'testtesttesttest', '2018-12-16 13:56:34', 5, '2018-12-16 14:38:28', 12);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_project_user_assignment`
--

CREATE TABLE `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tbl_project_user_assignment`
--

INSERT INTO `tbl_project_user_assignment` (`project_id`, `user_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL, NULL),
(1, 5, NULL, NULL, NULL, NULL),
(1, 7, NULL, NULL, NULL, NULL),
(1, 8, NULL, NULL, NULL, NULL),
(1, 11, NULL, NULL, NULL, NULL),
(2, 5, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_project_user_role`
--

CREATE TABLE `tbl_project_user_role` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tbl_project_user_role`
--

INSERT INTO `tbl_project_user_role` (`project_id`, `user_id`, `role`) VALUES
(1, 8, 'reader'),
(1, 11, 'owner'),
(2, 5, 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_message`
--

CREATE TABLE `tbl_sys_message` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tbl_sys_message`
--

INSERT INTO `tbl_sys_message` (`id`, `message`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'This is a test news. ', '2018-12-15 18:08:43', 12, '2018-12-16 16:12:56', 12),
(2, 'test', '2018-12-16 16:35:24', 5, '2018-12-16 16:35:24', 5),
(3, 'testhttps://stackoverflow.com/questions/43902485/php-mailer-warning-trim-expects-parameter-1-to-be-string', '2018-12-16 17:32:48', 5, '2018-12-16 17:32:59', 5),
(4, 'test123', '2018-12-16 17:56:17', 5, '2018-12-16 17:56:26', 5);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `email`, `username`, `password`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'test1@notanaddress.com', 'Test_User_One', '5a105e8b9d40e1329780d62ea2265d8a', '2018-12-16 15:32:05', NULL, NULL, '2018-12-09 23:11:14', 0),
(2, 'test2@notanaddress.com', 'Test_User_Two', 'ad0234829205b9033196ba818f7a872b', NULL, NULL, NULL, NULL, NULL),
(5, '7777@123.com', '777', 'f1c1592588411002af340cbaedd6fc33', '2018-12-17 16:01:50', '2018-12-09 14:00:33', 0, '2018-12-09 23:08:30', 0),
(7, '999@1923.com', '999', 'b706835de79a2b4e80506f582af3676a', '2018-12-17 16:00:21', '2018-12-10 10:14:50', 0, '2018-12-10 10:16:24', 0),
(8, '123@123.com', '000', 'c6f057b86584942e415435ffb1fa93d4', '2018-12-16 20:48:28', '2018-12-10 10:40:50', 0, '2018-12-10 10:40:50', 0),
(9, '123@1238.com', 'Test_for_project1', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2018-12-13 15:15:03', 1, '2018-12-13 15:15:03', 1),
(10, '123@12388888.com', '1010', '1e48c4420b7073bc11916c6c1de226bb', '2018-12-13 16:02:02', '2018-12-13 16:00:54', 1, '2018-12-13 16:00:54', 1),
(11, '7777@1288888888883.com', 'project1_owner', '628efa8405a560c875b75f35058c49ba', '2018-12-13 17:31:58', '2018-12-13 16:16:37', 1, '2018-12-13 16:16:37', 1),
(12, '123@823.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-12-16 20:36:13', '2018-12-14 00:17:47', 1, '2018-12-14 00:17:47', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD PRIMARY KEY (`itemname`,`userid`);

--
-- Indexes for table `authitem`
--
ALTER TABLE `authitem`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_issue_project` (`project_id`),
  ADD KEY `FK_issue_owner` (`owner_id`),
  ADD KEY `FK_issue_requester` (`requester_id`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD PRIMARY KEY (`project_id`,`user_id`),
  ADD KEY `FK_user_project` (`user_id`);

--
-- Indexes for table `tbl_project_user_role`
--
ALTER TABLE `tbl_project_user_role`
  ADD PRIMARY KEY (`project_id`,`user_id`,`role`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `tbl_sys_message`
--
ALTER TABLE `tbl_sys_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tbl_issue`
--
ALTER TABLE `tbl_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_sys_message`
--
ALTER TABLE `tbl_sys_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 限制导出的表
--

--
-- 限制表 `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT `FK_issue_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- 限制表 `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT `FK_project_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_user_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
