-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2018 at 09:58 AM
-- Server version: 5.7.14
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
-- Table structure for table `authassignment`
--

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authassignment`
--

INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', '12', NULL, 'N;'),
('member', '10', 'return isset($params["project"]) &&$params["project"]->isUserInRole("member");', 'N;'),
('member', '16', 'return isset($params["project"]) &&$params["project"]->isUserInRole("member");', 'N;'),
('owner', '13', 'return isset($params["project"]) &&$params["project"]->isUserInRole("owner");', 'N;'),
('owner', '17', 'return isset($params["project"]) &&$params["project"]->isUserInRole("owner");', 'N;'),
('reader', '14', 'return isset($params["project"]) &&$params["project"]->isUserInRole("reader");', 'N;'),
('reader', '15', 'return isset($params["project"]) &&$params["project"]->isUserInRole("reader");', 'N;'),
('reader', '5', 'return isset($params["project"]) &&$params["project"]->isUserInRole("admin");', 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('admin', 2, '', NULL, 'N;'),
('adminManagement', 1, 'access to the application administration functionality', NULL, 'N;'),
('createIssue', 0, 'create a new issue', NULL, 'N;'),
('createProject', 0, 'create a new project', NULL, 'N;'),
('createUser', 0, 'create a new user', NULL, 'N;'),
('deleteIssue', 0, 'delete an issue from a project', NULL, 'N;'),
('deleteProject', 0, 'delete a project', NULL, 'N;'),
('deleteUser', 0, 'remove a user from a project', NULL, 'N;'),
('member', 2, '', NULL, 'N;'),
('owner', 2, '', NULL, 'N;'),
('reader', 2, '', NULL, 'N;'),
('readIssue', 0, 'read issue information', NULL, 'N;'),
('readProject', 0, 'read project information', NULL, 'N;'),
('readUser', 0, 'read user profile information', NULL, 'N;'),
('updateIssue', 0, 'update issue information', NULL, 'N;'),
('updateProject', 0, 'up date project information', NULL, 'N;'),
('updateUser', 0, 'update a users information', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('admin', 'adminManagement'),
('member', 'createIssue'),
('owner', 'createProject'),
('owner', 'createUser'),
('member', 'deleteIssue'),
('owner', 'deleteProject'),
('owner', 'deleteUser'),
('admin', 'member'),
('owner', 'member'),
('admin', 'owner'),
('admin', 'reader'),
('member', 'reader'),
('owner', 'reader'),
('reader', 'readIssue'),
('reader', 'readProject'),
('reader', 'readUser'),
('member', 'updateIssue'),
('owner', 'updateProject'),
('owner', 'updateUser');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_issue`
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
-- Dumping data for table `tbl_issue`
--

INSERT INTO `tbl_issue` (`id`, `name`, `description`, `project_id`, `type_id`, `status_id`, `owner_id`, `requester_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(8, 'issue belong to project3', 'issue belong to project3', NULL, 0, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(9, 'issue belong to project3', '', NULL, 0, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(15, 'issue belong to project1', '123', 1, 0, 4, 2, 1, NULL, NULL, NULL, NULL),
(16, 'test issue belong to project1', '', 1, 0, 4, 1, 1, NULL, NULL, '2018-12-09 23:01:19', 0),
(17, 'test issue belong to project1', '', 1, 3, NULL, 1, 1, NULL, NULL, NULL, NULL),
(32, 'test issue belong to project2', '', 2, 0, 3, 5, 5, '2018-12-19 17:36:19', 16, '2018-12-19 17:36:33', 16),
(33, 'test issue belong to project2', '1', 2, 0, 3, 5, 5, '2018-12-19 17:38:48', 16, '2018-12-19 17:38:57', 16);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
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
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `description`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'project1', 'project111', NULL, NULL, '2018-12-17 22:13:56', 12),
(2, 'Test Project15', 'testtesttesttest', '2018-12-16 13:56:34', 5, '2018-12-16 14:38:28', 12),
(3, 'Test Project15', '$model=$this->loadModel($id);	\r\n		$project=$this->loadProject($model->project_id);\r\n		$params=array(\'project\'=>$project);', '2018-12-19 15:57:14', 12, '2018-12-19 15:57:14', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_user_assignment`
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
-- Dumping data for table `tbl_project_user_assignment`
--

INSERT INTO `tbl_project_user_assignment` (`project_id`, `user_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL, NULL),
(1, 5, NULL, NULL, NULL, NULL),
(1, 7, NULL, NULL, NULL, NULL),
(1, 8, NULL, NULL, NULL, NULL),
(1, 10, NULL, NULL, NULL, NULL),
(1, 11, NULL, NULL, NULL, NULL),
(2, 5, NULL, NULL, NULL, NULL),
(2, 13, NULL, NULL, NULL, NULL),
(2, 14, NULL, NULL, NULL, NULL),
(2, 15, NULL, NULL, NULL, NULL),
(2, 16, NULL, NULL, NULL, NULL),
(3, 17, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_user_role`
--

CREATE TABLE `tbl_project_user_role` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project_user_role`
--

INSERT INTO `tbl_project_user_role` (`project_id`, `user_id`, `role`) VALUES
(2, 5, 'admin'),
(1, 8, 'reader'),
(1, 10, 'member'),
(1, 11, 'owner'),
(2, 13, 'owner'),
(2, 14, 'reader'),
(2, 15, 'reader'),
(2, 16, 'member'),
(3, 17, 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sys_message`
--

CREATE TABLE `tbl_sys_message` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sys_message`
--

INSERT INTO `tbl_sys_message` (`id`, `message`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'This is a test news. ', '2018-12-15 18:08:43', 12, '2018-12-16 16:12:56', 12),
(2, 'test', '2018-12-16 16:35:24', 5, '2018-12-16 16:35:24', 5),
(3, 'testhttps://stackoverflow.com/questions/43902485/php-mailer-warning-trim-expects-parameter-1-to-be-string', '2018-12-16 17:32:48', 5, '2018-12-16 17:32:59', 5),
(4, 'test123', '2018-12-16 17:56:17', 5, '2018-12-16 17:56:26', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
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
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `email`, `username`, `password`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'test1@notanaddress.com', 'Test_User_One', '5a105e8b9d40e1329780d62ea2265d8a', '2018-12-16 15:32:05', NULL, NULL, '2018-12-09 23:11:14', 0),
(2, 'test2@notanaddress.com', 'Test_User_Two', 'ad0234829205b9033196ba818f7a872b', NULL, NULL, NULL, NULL, NULL),
(5, '7777@123.com', '777', 'f1c1592588411002af340cbaedd6fc33', '2018-12-17 22:04:47', '2018-12-09 14:00:33', 0, '2018-12-09 23:08:30', 0),
(7, '999@1923.com', '999', 'b706835de79a2b4e80506f582af3676a', '2018-12-17 16:00:21', '2018-12-10 10:14:50', 0, '2018-12-10 10:16:24', 0),
(8, '123@123.com', '000', 'c6f057b86584942e415435ffb1fa93d4', '2018-12-17 22:12:58', '2018-12-10 10:40:50', 0, '2018-12-10 10:40:50', 0),
(9, '123@1238.com', 'Test_for_project1', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2018-12-13 15:15:03', 1, '2018-12-13 15:15:03', 1),
(10, '123@12388888.com', '1010', '1e48c4420b7073bc11916c6c1de226bb', '2018-12-17 22:18:38', '2018-12-13 16:00:54', 1, '2018-12-13 16:00:54', 1),
(11, '7777@1288888888883.com', 'project1_owner', '628efa8405a560c875b75f35058c49ba', '2018-12-17 22:19:46', '2018-12-13 16:16:37', 1, '2018-12-13 16:16:37', 1),
(12, '123@823.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-12-19 17:39:33', '2018-12-14 00:17:47', 1, '2018-12-14 00:17:47', 1),
(13, '7777@123.c66', 'project2_owner', '2c73b4abc6f013e6d9de6e07785ff993', '2018-12-19 17:55:33', '2018-12-18 14:17:40', 12, '2018-12-18 14:17:40', 12),
(14, '188823@123.com', 'project2_reader', '27213f66a2f978e3c22725cf5bad464d', '2018-12-19 17:53:28', '2018-12-18 14:24:45', 12, '2018-12-18 14:24:45', 12),
(15, '778777@123.com', 'reader_for_project2', '5f7b6924814e7f20f64d3b1021d47ec6', '2018-12-18 16:50:17', '2018-12-18 16:49:45', 12, '2018-12-18 16:49:45', 12),
(16, '887777@123.com', 'project2_member', 'a8148bc9183e5d025d15408105ccc479', '2018-12-19 17:38:38', '2018-12-19 09:50:22', 12, '2018-12-19 09:50:22', 12),
(17, '770077@123.com', 'project15_owner', '9792fe1265704ff5dcf9f14b77dd728e', '2018-12-19 16:47:45', '2018-12-19 15:58:17', 12, '2018-12-19 15:58:17', 12);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_sys_message`
--
ALTER TABLE `tbl_sys_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT `FK_issue_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT `FK_project_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_user_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_project_user_role`
--
ALTER TABLE `tbl_project_user_role`
  ADD CONSTRAINT `tbl_project_user_role_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`),
  ADD CONSTRAINT `tbl_project_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `tbl_project_user_role_ibfk_3` FOREIGN KEY (`role`) REFERENCES `authitem` (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
