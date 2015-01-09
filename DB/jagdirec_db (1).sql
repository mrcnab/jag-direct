-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2013 at 11:15 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jagdirec_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_admin_permissions`
--

CREATE TABLE IF NOT EXISTS `cubecart_admin_permissions` (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `sectId` int(11) NOT NULL DEFAULT '0',
  `adminId` int(11) NOT NULL DEFAULT '0',
  `read` int(11) NOT NULL DEFAULT '0',
  `write` int(11) NOT NULL DEFAULT '0',
  `edit` int(11) NOT NULL DEFAULT '0',
  `delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_admin_sections`
--

CREATE TABLE IF NOT EXISTS `cubecart_admin_sections` (
  `sectId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  KEY `sectId` (`sectId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `cubecart_admin_sections`
--

INSERT INTO `cubecart_admin_sections` (`sectId`, `name`, `description`) VALUES
(1, 'users', 'For the administration of admin users and their permissions.'),
(2, 'products', 'For the administration of products.'),
(3, 'categories', 'For the administration of categories.'),
(4, 'documents', 'For the administration of site documents.'),
(5, 'customers', 'For the administration of customers details.'),
(6, 'shipping', 'For the administration of shipping methods.'),
(7, 'filemanager', 'For the administration of the website images.'),
(8, 'statistics', 'This section displays store statistics.'),
(9, 'settings', 'For the administration of the code store settings.'),
(10, 'orders', 'Access rights for the orders section.');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_admin_sessions`
--

CREATE TABLE IF NOT EXISTS `cubecart_admin_sessions` (
  `loginId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `ipAddress` varchar(20) NOT NULL DEFAULT '',
  `success` int(11) NOT NULL DEFAULT '0',
  KEY `loginId` (`loginId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=476 ;

--
-- Dumping data for table `cubecart_admin_sessions`
--

INSERT INTO `cubecart_admin_sessions` (`loginId`, `username`, `time`, `ipAddress`, `success`) VALUES
(252, 'admin', 1266828956, '82.35.203.215', 1),
(253, 'admin', 1266830507, '203.215.176.245', 1),
(254, 'admin', 1266842002, '82.35.203.215', 1),
(255, 'admin', 1266842692, '82.35.203.215', 1),
(256, 'admin', 1266870778, '82.35.203.215', 1),
(257, 'admin', 1266959695, '82.35.203.215', 1),
(258, 'admin', 1267135864, '82.35.203.215', 1),
(259, 'admin', 1267209728, '91.104.169.63', 1),
(260, 'admin', 1267384475, '91.104.169.63', 1),
(261, 'admin', 1267566108, '82.35.203.215', 1),
(262, 'admin', 1268048761, '119.152.140.55', 0),
(263, 'admin', 1268139448, '82.35.203.215', 1),
(264, 'admin', 1268167097, '82.35.203.215', 1),
(265, 'admin', 1268214765, '82.35.203.215', 1),
(266, 'admin', 1268301862, '82.35.203.215', 1),
(267, 'admin', 1268595535, '82.35.203.215', 1),
(268, 'admin', 1268913907, '203.215.176.245', 1),
(269, 'admin', 1269002594, '203.215.176.245', 1),
(271, 'admin', 1269514055, '192.168.1.109', 0),
(272, 'admin', 1269514060, '192.168.1.109', 0),
(273, 'admin', 1269514070, '192.168.1.109', 0),
(274, 'admin', 1269515227, '192.168.1.109', 0),
(275, 'admin', 1269515406, '192.168.1.109', 1),
(276, 'admin', 1269519195, '192.168.1.109', 1),
(277, 'admin', 1269534844, '192.168.1.121', 1),
(278, 'admin', 1269856096, '192.168.1.121', 1),
(279, 'admin', 1269949825, '192.168.1.121', 1),
(280, 'admin', 1269950239, '192.168.1.121', 1),
(281, 'admin', 1269964587, '192.168.1.121', 1),
(282, 'admin', 1270110620, '192.168.1.142', 1),
(283, 'admin', 1270806142, '192.168.1.121', 1),
(284, 'admin', 1270811816, '192.168.1.213', 1),
(285, 'admin', 1270826071, '192.168.1.20', 1),
(286, 'admin', 1270833495, '192.168.1.142', 1),
(287, 'admin', 1270833942, '192.168.1.123', 1),
(288, 'admin', 1270835417, '192.168.1.142', 1),
(290, 'admin', 1271061290, '203.215.176.245', 1),
(291, 'admin', 1271061656, '203.215.176.245', 1),
(292, 'admin', 1271070628, '203.215.176.245', 1),
(293, 'admin', 1271079142, '203.215.176.245', 1),
(294, 'admin', 1271084620, '203.215.176.245', 1),
(295, 'admin', 1271085728, '203.215.176.245', 1),
(296, 'admin', 1271165568, '203.215.176.245', 1),
(297, 'admin', 1271241096, '203.215.176.245', 1),
(298, 'admin', 1271330597, '203.215.176.245', 1),
(299, 'admin', 1271331086, '86.178.150.96', 1),
(300, 'admin', 1271338285, '86.178.150.96', 1),
(301, 'admin', 1271343041, '86.178.150.96', 1),
(302, 'admin', 1271441735, '91.104.23.19', 1),
(303, 'admin', 1271537029, '91.104.23.19', 0),
(304, 'admin', 1271537034, '91.104.23.19', 0),
(305, 'ADMIN', 1271537060, '91.104.23.19', 0),
(306, 'admin', 1271537066, '91.104.23.19', 1),
(307, 'admin', 1271544556, '91.104.23.19', 1),
(308, 'admin', 1271658098, '203.215.177.225', 1),
(309, 'admin', 1271659566, '203.215.176.245', 1),
(310, 'admin', 1271661879, '203.215.176.245', 1),
(311, 'admin', 1271670692, '86.178.150.96', 1),
(312, 'admin', 1271670716, '203.215.177.225', 1),
(313, 'admin', 1271672156, '203.215.176.245', 1),
(314, 'admin', 1271673182, '203.215.176.245', 1),
(315, 'admin', 1271759099, '86.178.150.96', 1),
(316, 'admin', 1271759122, '203.215.176.245', 1),
(317, 'admin', 1271759276, '203.215.176.245', 1),
(318, 'admin', 1271845087, '86.178.150.96', 1),
(319, 'admin', 1271845136, '203.215.176.245', 1),
(320, 'admin', 1271858484, '203.215.177.225', 1),
(321, 'admin', 1271859985, '86.178.150.96', 1),
(322, 'admin', 1271929917, '203.215.176.245', 1),
(323, 'admin', 1271933448, '203.215.176.245', 1),
(324, 'admin', 1271933516, '203.215.176.245', 1),
(325, 'jag', 1271944307, '86.178.150.96', 0),
(326, 'admin', 1271944314, '86.178.150.96', 1),
(327, 'admin', 1272033237, '203.215.176.245', 1),
(328, 'admin', 1272293984, '86.181.22.199', 1),
(329, 'admin', 1272359526, '86.178.145.15', 1),
(330, 'admin', 1272534998, '203.215.176.245', 1),
(331, 'admin', 1272626023, '203.215.176.245', 1),
(332, 'admin', 1272626319, '203.215.176.245', 1),
(333, 'admin', 1272628397, '203.215.176.245', 1),
(334, 'admin', 1273069176, '203.215.177.225', 1),
(335, 'admin', 1273070771, '203.215.177.225', 1),
(336, 'admin', 1273149283, '203.215.176.245', 1),
(337, 'admin', 1273153888, '203.215.176.245', 1),
(338, 'admin', 1273161184, '203.215.176.245', 1),
(339, 'admin', 1273231423, '203.215.176.245', 1),
(340, 'admin', 1273238170, '203.215.176.245', 1),
(341, 'admin', 1273246129, '203.215.176.245', 1),
(342, 'admin', 1273246534, '86.182.175.104', 1),
(343, 'admin', 1273251167, '86.182.175.104', 1),
(344, 'admin', 1273346742, '91.106.63.220', 1),
(345, 'admin', 1273401067, '91.106.63.220', 1),
(346, 'admin', 1273487423, '86.180.93.89', 1),
(347, 'admin', 1273927258, '91.104.15.61', 1),
(348, 'admin', 1274350392, '86.182.12.207', 1),
(349, 'admin', 1274791721, '86.182.12.207', 1),
(350, 'admin', 1275153152, '91.104.25.31', 1),
(351, 'admin', 1277479417, '86.183.132.84', 1),
(352, 'admin', 1278503216, '203.215.176.245', 1),
(353, 'admin', 1278522644, '203.215.176.245', 1),
(354, 'admin', 1278593681, '109.155.104.54', 1),
(355, 'admin', 1278674192, '109.155.104.54', 1),
(356, 'admin', 1278677197, '203.215.176.245', 1),
(357, 'admin', 1278680995, '203.215.176.245', 1),
(358, 'admin', 1278946486, '86.162.45.69', 1),
(359, 'admin', 1279029768, '86.162.45.69', 1),
(360, 'admin', 1279289712, '86.162.45.248', 1),
(361, 'admin', 1279290870, '203.215.177.225', 1),
(362, 'admin', 1279315542, '91.104.62.124', 1),
(363, 'admin', 1279548490, '86.162.45.248', 1),
(365, 'admin', 1279712554, '203.215.177.225', 1),
(366, 'admin', 1279716312, '92.48.119.92', 1),
(367, 'admin', 1279726442, '86.162.45.248', 1),
(368, 'admin', 1279750689, '91.106.20.105', 1),
(369, 'admin', 1279757500, '91.106.20.105', 1),
(370, 'admin', 1279786575, '86.162.45.248', 1),
(371, 'admin', 1279799647, '86.162.45.248', 1),
(372, 'admin', 1279804735, '86.162.45.248', 1),
(373, 'admin', 1279810652, '86.162.45.248', 1),
(374, 'admin', 1279822806, '91.106.20.105', 1),
(375, 'admin', 1279836484, '91.106.20.105', 0),
(376, 'admin', 1279836489, '91.106.20.105', 1),
(377, 'admin', 1279875564, '86.162.45.248', 1),
(378, 'admin', 1279884348, '86.162.45.248', 1),
(379, 'admin', 1279929430, '91.106.38.136', 1),
(380, 'admin', 1279958829, '91.104.26.185', 1),
(381, 'admin', 1279999761, '91.106.37.56', 1),
(382, 'admin', 1280138709, '86.162.45.248', 1),
(383, 'admin', 1280254144, '92.234.72.139', 1),
(384, 'admin', 1280706130, '91.104.46.252', 1),
(385, 'admin', 1280843124, '203.215.176.245', 1),
(386, 'admin', 1280843126, '86.163.69.22', 1),
(387, 'admin', 1280929715, '86.162.45.78', 1),
(388, 'admin', 1280930196, '203.215.176.245', 1),
(389, 'admin', 1281021197, '86.162.45.78', 1),
(390, 'admin', 1281129917, '91.106.51.221', 1),
(391, 'admin', 1281222523, '91.104.24.47', 1),
(392, 'admin', 1281613532, '91.104.24.47', 1),
(393, 'admin', 1281628228, '203.215.177.225', 1),
(394, 'admin', 1281963838, '86.161.113.137', 1),
(395, 'admin', 1281993711, '91.106.57.83', 1),
(396, 'admin', 1282078086, '91.106.57.83', 1),
(397, 'admin', 1283335360, '86.166.108.169', 1),
(398, 'admin', 1283682669, '91.104.40.79', 1),
(399, 'admin', 1283764665, '86.164.16.164', 1),
(400, 'admin', 1283862105, '109.155.108.243', 1),
(401, 'ad', 1283874186, '109.155.108.243', 0),
(402, 'admin', 1283874191, '109.155.108.243', 1),
(403, 'admin', 1283947784, '86.166.140.55', 1),
(404, 'admin', 1283979747, '91.104.0.39', 1),
(405, 'admin', 1284106535, '86.162.47.172', 1),
(406, 'admin', 1284146753, '90.220.210.226', 1),
(407, 'admin', 1284207892, '90.220.210.226', 1),
(408, 'admin', 1284373368, '86.166.109.253', 1),
(409, 'admin', 1284542579, '86.166.109.253', 1),
(410, 'admin', 1284559315, '203.215.176.245', 1),
(411, 'admin', 1284569142, '203.215.176.245', 1),
(412, 'admin', 1284631933, '203.215.176.245', 1),
(413, 'admin', 1284972951, '203.215.176.245', 1),
(414, 'admin', 1285060343, '86.166.110.47', 1),
(415, 'admin', 1285245600, '109.155.121.24', 1),
(416, 'admin', 1285345985, '91.104.39.228', 1),
(417, 'admin', 1285354427, '91.104.39.228', 1),
(418, 'adminADMIN', 1285539109, '91.104.41.138', 0),
(419, 'admin', 1285539122, '91.104.41.138', 1),
(420, 'admin', 1285599666, '109.157.54.26', 1),
(421, 'admin', 1285762080, '109.157.54.26', 1),
(422, 'admin', 1285834723, '109.157.54.26', 1),
(423, 'admin', 1285851251, '109.157.54.26', 1),
(424, 'admin', 1285877463, '91.106.33.3', 1),
(425, 'admin', 1285881651, '91.106.33.3', 1),
(426, 'admin', 1285920884, '203.215.176.245', 1),
(427, 'admin', 1285921606, '203.215.176.245', 1),
(428, 'admin', 1285924055, '109.157.54.26', 1),
(429, 'adminADMIN', 1285931268, '109.157.54.26', 0),
(430, 'ADMIN=================admin', 1285931281, '109.157.54.26', 0),
(431, 'admin', 1285931292, '109.157.54.26', 1),
(432, 'admin', 1286022145, '91.106.33.3', 1),
(433, 'admin', 1286060882, '91.106.46.75', 1),
(434, 'admin', 1286108476, '91.106.46.75', 1),
(435, 'admin', 1286127074, '91.106.46.75', 1),
(436, 'admin', 1286211539, '91.106.46.75', 1),
(437, 'admin', 1286287986, '109.157.54.26', 1),
(438, 'admin', 1286295418, '109.157.54.26', 1),
(439, 'admin', 1286442873, '83.217.105.194', 1),
(440, 'admin', 1286469484, '91.104.2.174', 1),
(441, 'admin', 1286542588, '109.157.54.26', 1),
(442, 'admin', 1287475726, '83.217.105.194', 1),
(443, 'admin', 1288089842, '83.217.105.194', 1),
(444, 'admin', 1290439567, '91.104.58.247', 1),
(447, 'admin', 1306782904, '95.150.185.201', 1),
(448, 'admin', 1310040106, '86.179.187.163', 1),
(449, 'admin', 1310040381, '109.75.162.166', 1),
(450, 'admin', 1329147737, '109.75.162.166', 1),
(451, 'admin', 1329260082, '95.145.13.147', 1),
(452, 'admin', 1329309938, '109.75.162.166', 1),
(453, 'admin', 1329310099, '217.41.2.46', 1),
(454, 'admin', 1329484608, '217.41.2.46', 0),
(455, 'admin', 1329484608, '217.41.2.46', 1),
(456, 'admin', 1329488939, '109.75.162.166', 1),
(457, 'admin', 1329925416, '217.41.2.46', 1),
(458, 'admin', 1329929416, '217.41.2.46', 1),
(459, 'admin', 1330010226, '217.41.2.46', 1),
(460, 'admin', 1330087209, '217.41.2.46', 1),
(461, 'admin', 1330616290, '217.41.2.46', 1),
(462, 'admin', 1330879656, '94.197.127.225', 1),
(463, 'admin', 1331130077, '217.41.2.46', 1),
(464, 'admin', 1331212417, '109.75.162.166', 1),
(465, 'admin', 1331302558, '217.41.2.46', 1),
(466, 'admin', 1331553597, '217.41.2.46', 1),
(467, 'admin', 1331652369, '217.41.2.46', 1),
(468, 'admin', 1331996648, '95.145.12.39', 1),
(469, 'admin', 1332329348, '217.41.2.46', 1),
(470, 'admin', 1333028509, '217.41.2.46', 1),
(471, 'admin', 1333543178, '217.41.2.46', 0),
(472, 'admin', 1333543182, '217.41.2.46', 1),
(473, 'admin', 1334574872, '217.41.2.46', 1),
(474, 'admin', 1334755683, '109.75.162.166', 1),
(475, 'admin', 1334791572, '182.186.89.219', 1),
(226, 'admin', 1265717903, '82.35.203.215', 1),
(227, 'admin', 1265737301, '82.35.203.215', 1),
(228, 'admin', 1265799773, '82.35.203.215', 1),
(229, 'admin', 1265843180, '82.35.203.215', 1),
(230, 'admin', 1265932653, '82.35.203.215', 1),
(231, 'admin', 1266014101, '82.35.203.215', 1),
(232, 'admin', 1266146209, '82.35.203.215', 1),
(233, 'admin', 1266183491, '82.35.203.215', 1),
(234, 'admin', 1266226972, '82.35.203.215', 1),
(235, 'admin', 1266261770, '82.35.203.215', 1),
(236, 'admin', 1266323685, '82.35.203.215', 1),
(237, 'admin', 1266324149, '203.215.176.245', 1),
(238, 'admin', 1266334327, '82.35.203.215', 1),
(239, 'admin', 1266340475, '203.215.176.245', 1),
(240, 'admin', 1266450038, '82.35.203.215', 1),
(241, 'admin', 1266500631, '203.215.176.245', 0),
(242, 'admin', 1266500652, '203.215.176.245', 1),
(243, 'admin', 1266522095, '82.35.203.215', 1),
(244, 'admin', 1266582939, '203.215.176.245', 0),
(245, 'admin', 1266583110, '203.215.176.245', 1),
(246, 'admin', 1266583190, '203.215.176.245', 1),
(247, 'admin', 1266583348, '203.215.176.245', 1),
(248, 'admin', 1266583957, '203.215.176.245', 1),
(249, 'admin', 1266604463, '82.35.203.215', 1),
(250, 'admin', 1266666652, '82.35.203.215', 1),
(251, 'admin', 1266696137, '82.35.203.215', 1),
(270, 'admin', 1269514016, '192.168.1.109', 0),
(289, 'admin', 1270838629, '203.215.176.245', 1),
(364, 'admin', 1279631883, '203.215.176.245', 1),
(445, 'admin', 1297158468, '210.2.154.54', 1),
(446, 'admin', 1305843401, '91.104.19.181', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_admin_users`
--

CREATE TABLE IF NOT EXISTS `cubecart_admin_users` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `noLogins` int(11) NOT NULL DEFAULT '0',
  `isSuper` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `failLevel` int(1) NOT NULL DEFAULT '0',
  `blockTime` int(10) NOT NULL DEFAULT '0',
  `lastTime` int(10) NOT NULL DEFAULT '0',
  KEY `adminId` (`adminId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cubecart_admin_users`
--

INSERT INTO `cubecart_admin_users` (`adminId`, `name`, `username`, `password`, `email`, `noLogins`, `isSuper`, `notes`, `failLevel`, `blockTime`, `lastTime`) VALUES
(1, 'Alpha Glow', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'alphaglow@hotmail.co.uk', 434, 1, 'This user was setup during after live.', 0, 0, 1333543178);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_banner`
--

CREATE TABLE IF NOT EXISTS `cubecart_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagePath` text NOT NULL,
  `status` int(11) NOT NULL,
  `imageName` varchar(500) NOT NULL,
  `isGallery` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `cubecart_banner`
--

INSERT INTO `cubecart_banner` (`id`, `imagePath`, `status`, `imageName`, `isGallery`) VALUES
(52, '25712_381376195317_696305317_4303210_3906053_n.jpg', 1, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_banner2`
--

CREATE TABLE IF NOT EXISTS `cubecart_banner2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagePath` text NOT NULL,
  `status` int(11) NOT NULL,
  `imageName` varchar(500) NOT NULL,
  `isGallery` int(11) NOT NULL,
  `loc` tinyint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=138 ;

--
-- Dumping data for table `cubecart_banner2`
--

INSERT INTO `cubecart_banner2` (`id`, `imagePath`, `status`, `imageName`, `isGallery`, `loc`) VALUES
(137, 'banner.png', 1, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_blocker`
--

CREATE TABLE IF NOT EXISTS `cubecart_blocker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `browser` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `blockTime` int(10) NOT NULL DEFAULT '0',
  `blockLevel` int(1) NOT NULL DEFAULT '0',
  `loc` char(1) NOT NULL,
  `lastTime` int(10) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_boxs`
--

CREATE TABLE IF NOT EXISTS `cubecart_boxs` (
  `box_id` int(11) NOT NULL AUTO_INCREMENT,
  `box_title` varchar(255) NOT NULL,
  PRIMARY KEY (`box_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `cubecart_boxs`
--

INSERT INTO `cubecart_boxs` (`box_id`, `box_title`) VALUES
(32, 'Blankets'),
(35, 'Cushion Covers'),
(36, 'Candles'),
(37, 'Kitchenware');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_category`
--

CREATE TABLE IF NOT EXISTS `cubecart_category` (
  `cat_name` text NOT NULL,
  `cat_id` int(16) NOT NULL AUTO_INCREMENT,
  `cat_father_id` int(16) NOT NULL DEFAULT '0',
  `cat_image` varchar(250) NOT NULL DEFAULT '',
  `per_ship` decimal(20,2) NOT NULL DEFAULT '0.00',
  `item_ship` decimal(20,2) NOT NULL DEFAULT '0.00',
  `item_int_ship` decimal(20,2) NOT NULL DEFAULT '0.00',
  `per_int_ship` decimal(20,2) NOT NULL DEFAULT '0.00',
  `noProducts` int(11) DEFAULT '0',
  `box_id` int(11) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=178 ;

--
-- Dumping data for table `cubecart_category`
--

INSERT INTO `cubecart_category` (`cat_name`, `cat_id`, `cat_father_id`, `cat_image`, `per_ship`, `item_ship`, `item_int_ship`, `per_int_ship`, `noProducts`, `box_id`) VALUES
('Large Blankets', 174, 0, '', 0.00, 0.00, 0.00, 0.00, 1, 32),
('Small Blankets', 175, 0, '', 0.00, 0.00, 0.00, 0.00, 1, 32),
('Silk Cushion Covers', 176, 0, '', 0.00, 0.00, 0.00, 0.00, 1, 35),
('Tealight Candles', 177, 0, '', 0.00, 0.00, 0.00, 0.00, 1, 36);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_cats_idx`
--

CREATE TABLE IF NOT EXISTS `cubecart_cats_idx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=385 ;

--
-- Dumping data for table `cubecart_cats_idx`
--

INSERT INTO `cubecart_cats_idx` (`id`, `cat_id`, `productId`) VALUES
(383, 176, 252),
(384, 177, 253),
(382, 175, 251),
(380, 174, 250);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_cats_lang`
--

CREATE TABLE IF NOT EXISTS `cubecart_cats_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_master_id` int(11) NOT NULL DEFAULT '0',
  `cat_lang` varchar(20) NOT NULL DEFAULT '',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_config`
--

CREATE TABLE IF NOT EXISTS `cubecart_config` (
  `name` varchar(100) NOT NULL DEFAULT '',
  `array` text NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubecart_config`
--

INSERT INTO `cubecart_config` (`name`, `array`) VALUES
('config', 'a:59:{s:12:"ZmlsZVBlcm1z";s:4:"MA==";s:16:"cm9vdERpcl9TU0w=";s:0:"";s:16:"aW5zdGFsbFRpbWU=";s:16:"MTI0MzU5MzQ5MA==";s:4:"bGt2";s:4:"MQ==";s:16:"dGF4Q291bnRyeQ==";s:4:"MjI1";s:12:"dGF4Q291bnR5";s:0:"";s:4:"bGs=";s:24:"MDkwODIxLTE2NDUxOC01OTYx";s:20:"b2ZmTGluZUNvbnRlbnQ=";s:168:"PGgxPjxmb250IGZhY2U9XCJWZXJkYW5hXCI+VGhpcyB3ZWIgc2l0ZSBpcyB1bmRlciBjb25zdHJ1Y3Rpb24uJm5ic3A7UGxlYXNlIHZpc2l0IGFnYWluIHNvb24uIEphZyBEaXJlY3QgVGVhbS4uLi48L2ZvbnQ+PC9oMT4=";s:12:"b2ZmTGluZQ==";s:4:"MA==";s:12:"c2l0ZVRpdGxl";s:108:"V2VsY29tZSB0byBKQUcgRGlyZWN0fCBQQyBBY2Nlc3NvcmllcyB8IE1vYmlsZSBBY2Nlc3NvcmllcyB8IGlQaG9uZSBBY2Nlc3Nvcmllcw==";s:20:"bWV0YURlc2NyaXB0aW9u";s:256:"SkFHIERpcmVjdCBpcyBvbmxpbmUgc2hvcHBpbmcgc3RvcmUuIEl0IGRlYWxzIGluIGNvbXB1dGVyLCBtb2JpbGUgcGhvbmUgYW5kIGlQaG9uZSBhY2Nlc3Nvcmllcy4gSkFHIERpcmVjdCBtYWpvciBmb2N1cyBpcyBvbiBOb2tpYSwgU2Ftc3VuZywgU29ueSBFcmljc3NvbiBhbmQgaVBob25lIG1vYmlsZSBwaG9uZSBhY2Nlc3Nvcmllcy4=";s:16:"bWV0YUtleVdvcmRz";s:176:"T25saW5lIHNob3BwaW5nIFBDIEFjY2Vzc29yaWVzLCBPbmxpbmUgc2hvcHBpbmcgTW9iaWxlIFBob25lIEFjY2Vzc29yaWVzLCBpUGhvbmUgQWNjZXNzb3JpZXMgaW4gVUssIE1vYmlsZSBQaG9uZSBBY2Nlc3NvcmllcyBpbiBVSw==";s:12:"c3RvcmVOYW1l";s:16:"SmFnIERpcmVjdA==";s:16:"c3RvcmVBZGRyZXNz";s:0:"";s:16:"c2l0ZUNvdW50cnk=";s:4:"MjI1";s:16:"c2l0ZUNvdW50eQ==";s:4:"Mjc4";s:16:"cm9vdFJlbF9TU0w=";s:0:"";s:16:"c3RvcmVVUkxfU1NM";s:0:"";s:4:"c3Ns";s:4:"MA==";s:16:"ZG5Mb2FkRXhwaXJl";s:8:"MTcyODAw";s:16:"ZG5Mb2FkVGltZXM=";s:4:"Mw==";s:16:"ZGVmYXVsdExhbmc=";s:4:"ZW4=";s:12:"c2tpbkRpcg==";s:12:"amFnRGlyZWN0";s:20:"c2hvd0xhdGVzdFByb2Rz";s:4:"MQ==";s:20:"bm9MYXRlc3RQcm9kcw==";s:4:"NA==";s:20:"ZGlzcGxheWNhdFJvd3M=";s:4:"Mg==";s:12:"ZGlyU3ltYm9s";s:4:"Lw==";s:16:"cHJvZHVjdFBhZ2Vz";s:4:"MjA=";s:20:"cHJvZHVjdFByZWNpcw==";s:4:"MTIw";s:20:"bm9TYWxlQm94SXRlbXM=";s:4:"MTA=";s:24:"bm9Qb3B1bGFyQm94SXRlbXM=";s:4:"MTA=";s:16:"bWFzdGVyTmFtZQ==";s:16:"SmFnIERpcmVjdA==";s:16:"bWFzdGVyRW1haWw=";s:0:"";s:16:"bWFpbE1ldGhvZA==";s:8:"bWFpbA==";s:12:"c210cEhvc3Q=";s:0:"";s:12:"c210cFBvcnQ=";s:0:"";s:12:"c210cEF1dGg=";s:8:"VFJVRQ==";s:16:"c210cFVzZXJuYW1l";s:0:"";s:16:"c210cFBhc3N3b3Jk";s:0:"";s:24:"bWF4SW1hZ2VVcGxvYWRTaXpl";s:8:"NTI0Mjg4";s:24:"c3FsU2Vzc2lvbkV4cGlyeQ==";s:8:"MTcyODAw";s:16:"Zmxvb2RDb250cm9s";s:4:"MQ==";s:12:"Z2R2ZXJzaW9u";s:4:"Mg==";s:16:"Z2RHaWZTdXBwb3J0";s:4:"MQ==";s:16:"Z2R0aHVtYlNpemU=";s:4:"MjU1";s:16:"Z2RtYXhJbWdTaXpl";s:4:"Mzkw";s:12:"Z2RxdWFsaXR5";s:4:"ODA=";s:16:"c3RvY2tMZXZlbA==";s:4:"MQ==";s:24:"b3V0b2ZzdG9ja1B1cmNoYXNl";s:4:"MQ==";s:16:"d2VpZ2h0VW5pdA==";s:4:"S2c=";s:16:"dGltZUZvcm1hdA==";s:24:"JWIgJWQgJVksICVIOiVNICVw";s:16:"dGltZU9mZnNldA==";s:4:"MA==";s:16:"ZGF0ZUZvcm1hdA==";s:12:"bCBqUyBGIFk=";s:20:"ZGVmYXVsdEN1cnJlbmN5";s:4:"R0JQ";s:16:"cHJpY2VJbmNUYXg=";s:4:"MA==";s:12:"c2FsZU1vZGU=";s:4:"MQ==";s:20:"c2FsZVBlcmNlbnRPZmY=";s:0:"";s:20:"c2hpcEFkZHJlc3NMb2Nr";s:4:"MA==";s:24:"b2ZmTGluZUFsbG93QWRtaW4=";s:4:"MQ==";}'),
('By_Weight', 'a:18:{s:8:"c3RhdHVz";s:4:"MA==";s:20:"em9uZTFDb3VudHJpZXM=";s:20:"VW5pdGVkIEtpbmdkb20=";s:20:"em9uZTFIYW5kbGluZw==";s:8:"MC4wMA==";s:24:"em9uZTFSYXRlc0NsYXNzMQ==";s:104:"MDoxLjUwLDAuMTA6MS43NSwwLjI1OjIuNzUsMC41MDo1LjAwLDAuNzU6OC41MCwxLjUwOjEwLjAwLDIuMDA6MTIuMDAsMTAwLjAwOjE0";s:24:"em9uZTFSYXRlc0NsYXNzMg==";s:0:"";s:20:"em9uZTJDb3VudHJpZXM=";s:0:"";s:20:"em9uZTJIYW5kbGluZw==";s:0:"";s:24:"em9uZTJSYXRlc0NsYXNzMQ==";s:0:"";s:24:"em9uZTJSYXRlc0NsYXNzMg==";s:0:"";s:20:"em9uZTNDb3VudHJpZXM=";s:0:"";s:20:"em9uZTNIYW5kbGluZw==";s:0:"";s:24:"em9uZTNSYXRlc0NsYXNzMQ==";s:0:"";s:24:"em9uZTNSYXRlc0NsYXNzMg==";s:0:"";s:20:"em9uZTRDb3VudHJpZXM=";s:0:"";s:20:"em9uZTRIYW5kbGluZw==";s:0:"";s:24:"em9uZTRSYXRlc0NsYXNzMQ==";s:0:"";s:24:"em9uZTRSYXRlc0NsYXNzMg==";s:0:"";s:4:"dGF4";s:4:"MQ==";}'),
('Free_Shipping', 'a:1:{s:8:"c3RhdHVz";s:4:"MQ==";}'),
('Print_Order_Form', 'a:17:{s:12:"YWRkcmVzcw==";s:96:"QWRkcmVzcyBMaW5lIDENCkFkZHJlc3MgTGluZSAyDQpBZGRyZXNzIExpbmUgMw0KQWRkcmVzcyBMaW5lIDQNCnh4eHh4eA==";s:8:"Y2hlY2s=";s:4:"MQ==";s:8:"c3RhdHVz";s:4:"MA==";s:12:"ZGVmYXVsdA==";s:4:"MQ==";s:20:"bXVsdGlDdXJyZW5jeQ==";s:4:"MA==";s:8:"ZGVzYw==";s:24:"UG9zdGFsIE9yZGVyIEZvcm0=";s:8:"Y2hlcXVl";s:4:"MA==";s:12:"cGF5YWJsZVRv";s:24:"Q29tcGFueSBOYW1lIEx0ZA==";s:8:"Y2FyZA==";s:4:"MQ==";s:8:"Y2FyZHM=";s:68:"TWFzdGVyY2FyZCwgVmlzYSwgU3dpdGNoLCBNYWVzdHJvLCBBbWVyaWNhbiBFeHByZXNz";s:8:"YmFuaw==";s:4:"MQ==";s:12:"YmFua05hbWU=";s:20:"WW91ciBCYW5rIFBsYw==";s:12:"YWNjTmFtZQ==";s:16:"Q29tcGFueSBOYW1l";s:12:"c29ydENvZGU=";s:12:"eHgteHgteHg=";s:8:"YWNObw==";s:12:"eHh4eHh4eHg=";s:12:"c3dpZnRDb2Rl";s:12:"eHh4eHh4eHg=";s:8:"bm90ZXM=";s:60:"V2UgY2FuIG9ubHkgYWNjZXB0IHBheW1lbnRzIGluIHh4eCBjdXJyZW5jeS4=";}'),
('DirectPayment', 'a:7:{s:8:"c3RhdHVz";s:4:"MQ==";s:8:"ZGVzYw==";s:20:"UGF5UGFsIERpcmVjdA==";s:12:"Z2F0ZXdheQ==";s:4:"MA==";s:12:"dXNlcm5hbWU=";s:36:"amFnZGlyZWN0X2FwaTEuaG90bWFpbC5jb20=";s:12:"cGFzc3dvcmQ=";s:24:"Q05CUlE4UUZMTFlQQUhENQ==";s:8:"ZGVidWc=";s:4:"MA==";s:12:"ZGVmYXVsdA==";s:4:"MQ==";}'),
('moneybookers', 'a:4:{s:8:"c3RhdHVz";s:4:"MA==";s:8:"ZGVzYw==";s:0:"";s:8:"ZW1haWw=";s:0:"";s:12:"ZGVmYXVsdA==";s:4:"MA==";}'),
('PayPal', 'a:6:{s:8:"c3RhdHVz";s:4:"MA==";s:8:"ZGVzYw==";s:8:"UGF5UGFs";s:8:"ZW1haWw=";s:28:"amFnZGlyZWN0QGhvdG1haWwuY29t";s:8:"bWV0aG9k";s:4:"aXBu";s:12:"ZGVmYXVsdA==";s:4:"MQ==";s:12:"dGVzdE1vZGU=";s:4:"MA==";}'),
('WorldPay', 'a:5:{s:8:"c3RhdHVz";s:4:"MA==";s:8:"ZGVzYw==";s:0:"";s:8:"YWNObw==";s:0:"";s:12:"dGVzdE1vZGU=";s:4:"MA==";s:12:"ZGVmYXVsdA==";s:4:"MA==";}'),
('By_Price', 'a:10:{s:8:"bGV2ZWw=";s:4:"Mg==";s:8:"YW1vdW50";s:8:"My45OQ==";s:16:"em9uZTFjbGFzczI=";s:4:"Ti9B";s:16:"em9uZTJjbGFzczI=";s:4:"Ti9B";s:16:"em9uZTNjbGFzczI=";s:4:"Ti9B";s:8:"c3RhdHVz";s:4:"MA==";s:16:"em9uZTFjbGFzczE=";s:8:"MC45OQ==";s:16:"em9uZTJjbGFzczE=";s:8:"MS40OQ==";s:16:"em9uZTNjbGFzczE=";s:8:"MS45OQ==";s:4:"dGF4";s:4:"MQ==";}'),
('Flat_Rate', 'a:3:{s:8:"c3RhdHVz";s:4:"MA==";s:8:"Y29zdA==";s:8:"MS45OQ==";s:4:"dGF4";s:4:"MQ==";}'),
('Royal_Mail', 'a:13:{s:8:"c3RhdHVz";s:4:"MA==";s:20:"em9uZTFDb3VudHJpZXM=";s:4:"ODI2";s:20:"em9uZTFIYW5kbGluZw==";s:4:"MQ==";s:16:"em9uZTFSYXRlcw==";s:0:"";s:20:"em9uZTJDb3VudHJpZXM=";s:0:"";s:20:"em9uZTJIYW5kbGluZw==";s:0:"";s:16:"em9uZTJSYXRlcw==";s:0:"";s:20:"em9uZTNDb3VudHJpZXM=";s:0:"";s:20:"em9uZTNIYW5kbGluZw==";s:0:"";s:16:"em9uZTNSYXRlcw==";s:0:"";s:20:"em9uZTRDb3VudHJpZXM=";s:0:"";s:20:"em9uZTRIYW5kbGluZw==";s:0:"";s:16:"em9uZTRSYXRlcw==";s:0:"";}'),
('Per_Item', 'a:4:{s:8:"c3RhdHVz";s:4:"MA==";s:8:"Y29zdA==";s:8:"MC45OQ==";s:12:"aGFuZGxpbmc=";s:0:"";s:4:"dGF4";s:4:"MQ==";}'),
('ExpressCheckout', 'a:7:{s:8:"c3RhdHVz";s:4:"MA==";s:8:"ZGVzYw==";s:0:"";s:12:"Z2F0ZXdheQ==";s:4:"MA==";s:12:"dXNlcm5hbWU=";s:0:"";s:12:"cGFzc3dvcmQ=";s:0:"";s:8:"ZGVidWc=";s:4:"MA==";s:12:"ZGVmYXVsdA==";s:4:"MQ==";}');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_currencies`
--

CREATE TABLE IF NOT EXISTS `cubecart_currencies` (
  `currencyId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(5) NOT NULL DEFAULT '',
  `symbolLeft` varchar(10) DEFAULT NULL,
  `symbolRight` varchar(10) DEFAULT NULL,
  `value` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `decimalPlaces` int(11) NOT NULL DEFAULT '0',
  `lastUpdated` int(10) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  KEY `curencyId` (`currencyId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `cubecart_currencies`
--

INSERT INTO `cubecart_currencies` (`currencyId`, `name`, `code`, `symbolLeft`, `symbolRight`, `value`, `decimalPlaces`, `lastUpdated`, `active`) VALUES
(1, 'British Pounds', 'GBP', '£', '', 1.00000, 2, 1271331234, 1),
(2, 'US Dollars', 'USD', '$', '', 1.80209, 2, 1123759040, 0),
(3, 'Euro', 'EUR', '€', '', 1.45161, 2, 1255513112, 0),
(4, 'Japanese Yen', 'JPY', '?', '', 198.95500, 0, 1123759040, 0),
(5, 'Canadian Dollars', 'CAD', 'CAD', '', 2.17642, 2, 1253207453, 0),
(6, 'Australian Dollars', 'AUD', '$', '', 2.33844, 2, 1123759040, 0),
(7, 'Swiss Francs', 'CHF', 'CHF', '', 2.25431, 2, 1123759040, 0),
(8, 'Russian Rubles', 'RUB', '', 'R', 51.11620, 0, 1123759040, 0),
(9, 'Chinese Yuan', 'CNY', '', 'Yuan', 14.59770, 2, 1123759040, 0),
(10, 'South African Rand', 'ZAR', 'R', '', 11.53110, 0, 1123759040, 0),
(11, 'Mexican Peso', 'MXN', '', 'MXP', 19.06320, 2, 1123759040, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_customer`
--

CREATE TABLE IF NOT EXISTS `cubecart_customer` (
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(10) DEFAULT NULL,
  `firstName` varchar(255) NOT NULL DEFAULT '',
  `lastName` varchar(255) NOT NULL DEFAULT '',
  `add_1` varchar(100) NOT NULL DEFAULT '',
  `add_2` varchar(100) NOT NULL DEFAULT '',
  `town` varchar(100) NOT NULL DEFAULT '',
  `county` varchar(100) NOT NULL DEFAULT '',
  `zoneId` int(3) NOT NULL DEFAULT '0',
  `postcode` varchar(15) NOT NULL DEFAULT '',
  `country` char(3) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(50) DEFAULT NULL,
  `comments` text NOT NULL,
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `regTime` int(10) NOT NULL DEFAULT '0',
  `ipAddress` varchar(30) NOT NULL DEFAULT '',
  `noOrders` int(11) DEFAULT '0',
  `optIn1st` int(11) NOT NULL DEFAULT '0',
  `htmlEmail` int(11) NOT NULL DEFAULT '1',
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `cubecart_customer`
--

INSERT INTO `cubecart_customer` (`email`, `password`, `title`, `firstName`, `lastName`, `add_1`, `add_2`, `town`, `county`, `zoneId`, `postcode`, `country`, `phone`, `mobile`, `comments`, `customer_id`, `regTime`, `ipAddress`, `noOrders`, `optIn1st`, `htmlEmail`, `type`) VALUES
('johny3219@hotmail.com', '', NULL, '', '', '', '', '', '', 0, '', '', '', NULL, '', 13, 1264632305, '91.107.53.205', 0, 1, 1, 0),
('t.mark.john@gmail.com', '202cb962ac59075b964b07152d234b70', 'Mr', 'Mark', 'Johnson', 'Regus House, Victory Way, Admirals Park, Crossways', '', 'Dartford', 'Kent', 289, 'DA2 6QD', '225', '02088198584', '02088198584', '', 33, 1284569384, '203.215.176.245', 0, 0, 1, 1),
('nasghar@titlewebsolutions.com', '0cc175b9c0f1b6a831c399e269772661', 'Mr', 'Naveed', 'Asghar', 'aa', '', 'aa', 'aa', 7, 'aa', '225', '343434343434', '', '', 34, 1284632425, '203.215.176.245', 1, 0, 1, 1),
('jagtejjuneja@hotmail.co.uk', 'c8793522adb1455363b330db7a10bc3a', 'Mr', 'Jagtej', 'Juneja', '6 garrod house', '', 'southall', 'middlesex', 0, 'ub1 1pl', '225', '07980874703', '', '', 35, 1285924573, '109.157.54.26', 6, 1, 1, 1),
('m.hayes.title@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mr', 'Mike', 'Hayes', 'ABC', '', 'ABCC', 'ABBC', 0, 'UB4 0Na', '225', '0245646546', '078797565', '', 36, 1310041324, '109.75.162.166', 1, 0, 1, 1),
('b_1@hotmail.com', '', NULL, '', '', '', '', '', '', 0, '', '', '', NULL, '', 37, 1329929526, '217.41.2.46', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_docs`
--

CREATE TABLE IF NOT EXISTS `cubecart_docs` (
  `doc_name` varchar(255) NOT NULL DEFAULT '',
  `doc_content` text NOT NULL,
  `doc_id` int(16) NOT NULL AUTO_INCREMENT,
  KEY `doc_id` (`doc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `cubecart_docs`
--

INSERT INTO `cubecart_docs` (`doc_name`, `doc_content`, `doc_id`) VALUES
('About Us', '', 2),
('Products', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"><span class="navTitle"></span></span>', 3),
('Terms & Conditions', '<p>We hope you are fully satisfied with our products. However, at times you may decide to change your mind and want to return the products. We are happy to return all items, which is being purchased within 14 days with original packaging. This does not affect your satutory rights.</p>', 10),
('Services', '<p>Services coming soon</p>', 8),
('Contact Us', 'Contact Details:\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 13),
('Home', 'Home Page Content Goes........<br/>', 1),
('Header Top Text', '<br/>', 14);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_docs_lang`
--

CREATE TABLE IF NOT EXISTS `cubecart_docs_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_master_id` int(11) NOT NULL DEFAULT '0',
  `doc_lang` varchar(20) NOT NULL DEFAULT '',
  `doc_name` varchar(255) NOT NULL DEFAULT '',
  `doc_content` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `cubecart_docs_lang`
--

INSERT INTO `cubecart_docs_lang` (`id`, `doc_master_id`, `doc_lang`, `doc_name`, `doc_content`) VALUES
(1, 1, 'it', 'Chi siamo', 'Ho impostato la mia attivit&agrave; nel 2002, perch&eacute; credevo che ci fosse una mancanza di buona qualit&agrave;, posti sperimentato nella mia zona per comprare vestiti Santa Cresima e Comunione - spero che il mio sito colma questa lacuna nel mercato per l&#39;abbigliamento di lusso unica qualit&agrave; a prezzi accessibili . Dal 2002 ho esteso il mio raggio di includere sera, indossare abiti e accessori prom I hope you enjoy. <br/>\r\n<br/>\r\nNegli ultimi anni ho acquistato nuovi designer provenienti dalla Francia l&#39;Italia a New York e tutti i miei indumenti possono essere spediti entro 24 ore. Cercher&ograve; di continuare a espandere la mia troppo vasta e in cerca di nuovi progetti, alcuni dei quali sono in esclusiva per me. <br/>\r\n<br/>\r\nSe avete domande o volete semplicemente parlare con me di uno stile di abbigliamento o poi e-mail mi enqiires@christinasofclarkston.co.uk o telefono mi 0141 644 3556 in qualsiasi momento.'),
(2, 1, 'fr', 'À propos de', 'J&#39;ai mis mes affaires en 2002 parce que j&#39;ai cru qu&#39;il y avait un manque de bonne qualit&eacute;, les lieux exp&eacute;riment&eacute; dans ma r&eacute;gion pour acheter des v&ecirc;tements et du Saint Bapt&ecirc;me Communion - j&#39;esp&egrave;re que mon site vient combler cette lacune dans le march&eacute; unique et de qualit&eacute; pour les v&ecirc;tements de luxe &agrave; prix abordables . Depuis 2002, j&#39;ai &eacute;largi ma gamme pour inclure soir, porter des robes de bal et accessoires I hope you enjoy. <br/>\r\n<br/>\r\nAu cours des derni&egrave;res ann&eacute;es, j&#39;ai pu acheter de nouveaux designers de la France Italie New York et tous mes v&ecirc;tements peuvent &ecirc;tre exp&eacute;di&eacute;s dans les 24 heures. Je vais essayer de continuer &agrave; trop &eacute;largir ma gamme et la recherche de nouveaux mod&egrave;les dont certains sont exclusifs &agrave; moi. <br/>\r\n<br/>\r\nSi vous avez des questions ou voulez juste me parler d&#39;un style ou un v&ecirc;tement, puis envoyez-moi un mail sur enqiires@christinasofclarkston.co.uk ou t&eacute;l&eacute;phonez-moi au 0141 644 3556 tout moment.'),
(3, 8, 'it', 'Termini e condizioni', 'SI PREGA DI LEGGERE I TERMINI E CONDIZIONI D&#39;USO PRIMA DI UTILIZZARE QUESTO SITO. Di gestione di questo sito web come un servizio ai nostri clienti, e utilizzando il nostro sito l&#39;utente accetta di rispettare e di essere vincolato dai seguenti termini di utilizzo. Si prega di leggere le seguenti termini e condizioni con attenzione, e controllarli periodicamente. Se non si accettano i termini e le condizioni, non si deve esaminare le informazioni o per ottenere beni, servizi o prodotti da questo sito. <br/>\r\n<br/>\r\n1. L&#39;accettazione di accordo. Si accettano i termini e le condizioni di cui al presente Termini e condizioni di utilizzo accordo ( &quot;Accordo&quot;) con riferimento al nostro sito (il &quot;Sito&quot;). Il presente accordo costituisce l&#39;intero accordo, e solo tra noi e voi, e sostituisce tutti gli accordi precedenti o contemporanee, rappresentazioni, le garanzie e le intese per quanto riguarda il sito, i contenuti, prodotti o servizi forniti da o attraverso il sito, e l&#39;oggetto del presente accordo. Il presente accordo pu&ograve; essere modificato da noi in qualsiasi momento e di volta in volta senza preavviso specifico per voi. L&#39;ultimo accordo sar&agrave; pubblicato sul sito, e si dovrebbe riesaminare il presente accordo prima di utilizzare il sito. <br/>\r\n<br/>\r\n2. Diritto d&#39;autore. Il contenuto, l&#39;organizzazione, la grafica, la progettazione, l&#39;elaborazione, la traduzione magnetica, conversione digitale e su altre questioni legate al sito sono protetti dal copyright, marchi, marchi registrati e gli altri proprietari (incluso ma non limitato alla propriet&agrave; intellettuale) dei diritti. La copia, la ridistribuzione, l&#39;uso o la pubblicazione da parte vostra di qualsiasi materia o qualsiasi parte del sito, ad eccezione di quanto consentito dalla sezione 4, &egrave; severamente proibito. Tu non acquisire diritti di propriet&agrave; di qualsiasi contenuto, documento o altro materiale visto attraverso il sito. Distacco di informazione o materiale sul Sito non costituisce una rinuncia di qualsiasi diritto a tali informazioni e materiali L&#39;. <br/>\r\n<br/>\r\n3. Frodi: Diventando un membro, si conferma che le informazioni contenute nel presente modulo &egrave; vero e che si impegna a rispettare i termini e condizioni di utilizzo di questo sito. Si prega di notare che la vostra adesione possono essere cancellati senza preavviso se &egrave; accertato che le informazioni false o fuorvianti sono state fornite, i termini e le condizioni d&#39;uso sono stati violati, o altri abusi si sono verificati, come determinato dal &quot;Christinas di Clarkston&quot; a sua unica discrezione . Se l&#39;adesione &egrave; stata revocata, &quot;Christinas di Clarkston&quot; si riserva il diritto di rifiutare la domanda o di riammissione al programma di appartenenza. <br/>\r\n<br/>\r\n4. Limitato diritto di utilizzare. La visualizzazione, la stampa o il download di qualsiasi contenuto, grafica, la forma o il documento dal sito vi concede solo una licenza limitata e non esclusiva per l&#39;utilizzo esclusivamente da voi per il vostro uso personale e non per la distribuzione ripubblicazione,, l&#39;assegnazione, concedere in licenza, la vendita, la preparazione di opere derivate o altro uso. Nessuna parte di qualsiasi contenuto, forma o documento pu&ograve; essere riprodotta in qualsiasi forma o incorporate in qualsiasi sistema di reperimento delle informazioni, elettronico o meccanico, diversi da quelli per uso personale (ma non per la rivendita o la ridistribuzione). <br/>\r\n<br/>\r\n5. Modifica, l&#39;eliminazione e la modifica. Ci riserviamo il diritto, a nostra esclusiva discrezione, di modificare o cancellare tutti i documenti, le informazioni o altri contenuti che appaiono sul sito, tra cui questo accordo, senza ulteriore avviso agli utenti del sito. <br/>\r\n<br/>\r\n6. Indennizzo. L&#39;utente accetta di indennizzare, difendere e proteggere noi ei nostri partner, avvocati, personale e affiliati (collettivamente, &quot;soggetti affiliati&quot;) da qualsiasi responsabilit&agrave;, perdita, reclamo e spesa, incluse le ragionevoli spese legali, relative al vostro violazione del presente Contratto o l&#39;uso del sito. <br/>\r\n<br/>\r\n7. Non trasferibile. Il diritto di utilizzare il sito non &egrave; trasferibile. Qualsiasi password o diritto dato a voi per ottenere informazioni o documenti non &egrave; trasferibile e pu&ograve; essere utilizzato solo da voi. <br/>\r\n<br/>\r\n8. Disclaimer. LE INFORMAZIONI O TRAMITE IL SITO SONO FORNITI &quot;AS-IS&quot;, &quot;COME DISPONIBILI&quot; E TUTTE LE GARANZIE, ESPRESSE O IMPLICITE, NON SONO RICONOSCIUTE (COMPRESI, MA NON LIMITATA ALLA ESCLUSIONE DI QUALSIASI GARANZIA DI COMMERCIABILIT&Agrave; E IDONEIT&Agrave; PER UN PARTICOLARE SCOPO ). LE INFORMAZIONI E SERVIZI POSSONO CONTENERE BUGS, ERRORI, PROBLEMI o altre limitazioni. NOI EI NOSTRI AFFILIATI PARTI HANNO ALCUN TIPO DI RESPONSABILITA &#39;PER L&#39;UTILIZZO DI QUALSIASI INFORMAZIONE O SERVIZIO. IN particolare, ma non come un limite, noi ei nostri soggetti affiliati NON SONO RESPONSABILI PER DANNI INDIRETTI, SPECIALI, INCIDENTALI O CONSEQUENZIALI (INCLUSI I DANNI PER PERDITA DI AFFARI, PERDITA DI PROFITTI, CONTENZIOSO, O SIMILI), SIA BASATO SU VIOLAZIONE DEL CONTRATTO, LA VIOLAZIONE DI GARANZIA, ILLECITO (INCLUSA LA NEGLIGENZA), RESPONSABILIT&Agrave; DI PRODOTTO O ALTRO, ANCHE SE INFORMATI DELLA POSSIBILITA &#39;DI TALI DANNI. La negazione della DANNI SOPRA INDICATI SONO ELEMENTI FONDAMENTALI DELLA BASE del patto tra Stati Uniti. QUESTO SITO E LE INFORMAZIONI NON DEVE FORNIRE senza tali limitazioni. NESSUN AVVISO O INFORMAZIONE, ORALE O SCRITTA, OTTENUTA DA VOI A NOI TRAMITE IL SITO NON COSTITUISCONO ALCUNA GARANZIA, DICHIARAZIONE O GARANZIA NON ESPRESSAMENTE NEL PRESENTE ACCORDO. <br/>\r\n<br/>\r\n9. Limiti. Tutte le responsabilit&agrave; per eventuali danni causati da virus contenuto nel documento elettronico contenente il modulo o documento &egrave; disconosciuta. NOI NON SAR&Agrave; RESPONSABILE PER DANNI INCIDENTALI, SPECIALI O CONSEQUENZIALI DI QUALSIASI TIPO che possono derivare da UTILIZZO DI O INCAPACITA &#39;DI UTILIZZARE IL NOSTRO SITO. La nostra responsabilit&agrave; massimo per voi in ogni caso sar&agrave; pari al prezzo d&#39;acquisto che si paga per tutti i beni, servizi o informazioni. <br/>\r\n<br/>\r\n10. Uso delle informazioni. Ci riserviamo il diritto, e ci autorizzate, per l&#39;uso e la cessione di tutte le informazioni relative sito utilizza da voi e tutte le informazioni fornite da voi in alcun modo coerente con la nostra Privacy Policy. <br/>\r\n<br/>\r\n11. Servizi di terze parti. Noi consentire l&#39;accesso a terzi o pubblicizzare siti commerciali di terze parti ( &quot;Mercanti&quot;) da cui si possono acquistare o comunque di ottenere determinati beni o servizi. Capisci che non funzionano o il controllo dei prodotti o dei servizi offerti dai commercianti. Commercianti sono responsabili di tutti gli aspetti di elaborazione degli ordini, la realizzazione, fatturazione e customer service. Noi non siamo un partito per le operazioni effettuate tra te e mercanti. L&#39;UTENTE ACCETTA CHE L&#39;USO DI TALI COMMERCIANTI E &#39;A RISCHIO AVRA&#39; COME UNICO ED E SENZA ALCUN TIPO DI GARANZIA DA NOI, espressa, implicita o esplicita COMPRESE LE GARANZIE DI TITOLO, idoneit&agrave; allo scopo, COMMERCIABILIT&Agrave; O NON VIOLAZIONE IN NESSUN CASO SIAMO RESPONSABILI PER EVENTUALI DANNI derivante dalle operazioni TRA TE E COMMERCIANTI O PER delle informazioni contenute in MERCHANT SITI O QUALSIASI ALTRO SITO collegati al nostro sito. <br/>\r\n<br/>\r\n12. Terzo politiche commerciali di terze parti. Tutte le regole, le politiche (tra cui le politiche sulla privacy) e le procedure operative dei Mercanti si applica a voi, mentre su tali siti. Noi non siamo responsabili per le informazioni fornite da voi per i commercianti. Noi ed i mercanti sono contraenti indipendenti e nessuna delle parti ha il potere di fare alcuna dichiarazione o impegni per conto degli altri. <br/>\r\n<br/>\r\n13. Tutela della privacy. Consulta la nostra, in quanto possono cambiare di volta in volta, &egrave; una parte del presente accordo.  <br/>\r\n<br/>\r\n14. Pagamenti. Lei dichiara e garantisce che se si sta acquistando qualcosa da noi o dai nostri commercianti che (i) qualsiasi carta di credito di fornitura &egrave; vero, corrette e complete, (i) le spese sostenute da voi saranno onorati dalla vostra carta di credito, e (iii) si pagheranno le spese sostenute da voi ai prezzi in trasferta, comprese le eventuali spese di spedizione e tasse applicabili. <br/>\r\n<br/>\r\n15. Securities Laws. Questo sito pu&ograve; contenere affermazioni riguardanti le nostre attivit&agrave;, le prospettive, le strategie, le condizioni finanziarie, il futuro andamento economico e la domanda per i nostri prodotti o servizi, cos&igrave; come le nostre intenzioni, piani e obiettivi che sono forward-looking statements. Tali dichiarazioni sono basate su una serie di stime e le ipotesi che sono soggette a notevoli incertezze, molti dei quali esulano dal nostro controllo. Quando viene utilizzato sul nostro sito, parole come &quot;anticipa&quot;, &quot;prevede&quot;, &quot;ritiene&quot;, &quot;stima&quot;, &quot;cerca&quot;, &quot;piani&quot;, &quot;intende&quot; ed espressioni simili sono destinati a identificare forward-looking statements destinati a rientrare nel titoli sicuri per i porti del diritto forward-looking statements. Il Sito e le informazioni contenute nel presente documento non costituisce un&#39;offerta o una sollecitazione di un&#39;offerta di vendita di titoli. Nessuna delle informazioni contenute nel presente documento &egrave; destinato ad essere, e non deve essere considerata, incorporati in uno qualsiasi dei nostri titoli legati limatura o documenti. <br/>\r\n<br/>\r\n16. Osservazioni. Tutti i suggerimenti, le idee, le note, i concetti e le altre informazioni si possono di volta in volta inviarci (collettivamente &quot;Materiale Presentato&quot;), sono considerati e restano di nostra propriet&agrave; esclusiva e non sono soggetti ad alcun obbligo di fiducia da parte nostra. Senza limitare quanto sopra, ci si considera che proprio tutti conosciuto e seguito i diritti esistenti di qualsiasi tipo e natura dei mezzi e per quanto riguarda il diritto di uso illimitato delle osservazioni per qualsiasi scopo, senza compenso, il fornitore delle osservazioni.'),
(4, 2, 'it', 'Prodotti', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"><span class="navTitle"></span></span>'),
(5, 6, 'it', 'FAQs', 'D. Avete un negozio dove &egrave; possibile visitare?  <br/>\r\n<br/>\r\nR. Io certamente ho una apertura di nuova boutique nella mia zona in Clarkston questo negozio sar&agrave; stock gamma pi&ugrave; grande della Scozia di battesimo e la comunione di usura con una selezione sempre crescente di sera e abiti da ballo e accessori della boutique si trova a 126 Main street Clarkston . Noi chiediamo solo che ti telefono avanti se siete interessati a uno specifico elemento o uno stile o l&#39;intervallo in modo che possiamo garantire &egrave; tutto pronto per le nomine sono normalmente adottate per essere sicuri di ricevere la nostra migliore attenzione. <br/>\r\n<br/>\r\n<br/>\r\nD. Posso cambiare il mio ordine, se &egrave; troppo piccolo o troppo grande o se proprio non mi piace?  <br/>\r\n<br/>\r\nR. Certamente si pu&ograve; In conformit&agrave; con la nostra politica di rimpatrio.  <br/>\r\n<br/>\r\n<br/>\r\nD. Ricever&ograve; il mio ordine in modo sicuro?  <br/>\r\n<br/>\r\nR. Noi spedizione la maggior parte dei nostri UK USA. Europee e d&#39;oltremare ordini tramite Royal Mail / consegna all&#39;ufficio postale speciale. Questo &egrave; un sicuro completamente monitorato metodo di spedizione e consegna agli indirizzi del Regno Unito &egrave; di solito 2-3 giorni per la consegna ulteriori informazioni si prega di consultare la nostra pagina di trasporto. <br/>\r\n<br/>\r\n<br/>\r\nD. Qual &egrave; il costo dei miei ordini in Euro / $ US / $ Aus?  <br/>\r\n<br/>\r\nA. Tutti i tassi di cambio sono in costante cambiamento ti consigliamo di utilizzare un sito web aggiornato regolarmente conversione di valuta, come www.xe.com <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nRestituisce: Siamo sicuri che sarete soddisfatti del vostro acquisto qui, ma se qualcosa non &egrave; corretta con il vostro capo poi: -- <br/>\r\nTutti i ritorni devono essere indossati e l&#39;indumento deve essere ancora identificato - si prega di compilare il modulo di ritorno dopo che sarete contattati entro un giorno lavorativo di lavoro e ad un numero RRN che &egrave; necessario scrivere sulla parte esterna della scatola. Si prega di non mandare indietro gli oggetti senza contatto con noi. Tutti i ritorni devono includere le grucce e nella confezione originaria altrimenti ci sar&agrave; una tassa &pound; 10,00. Noi non restituire il costo della spedizione a meno che il ritorno &egrave; il nostro errore. <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nScambi: Tutti gli scambi vi preghiamo di contattarci telefonicamente al numero 0141 644 3556 o via e-mail su enquiries@christinasofclarkston.co.uk e ci sar&agrave; posto un nuovo ordine per te subito come sappiamo il tempo pu&ograve; essere una questione importante. Nella maggior parte dei casi dopo aver contatto con noi ci sar&agrave; un nuovo ordine per voi immediatamente e non &egrave; responsabile solo per la spedizione degli oggetti per gli elementi stessi. In questo modo &egrave; possibile ricevere gli elementi molto pi&ugrave; rapidamente di tutti gli scambi devono includere l&#39;appendiabiti e nella confezione originaria o ci sar&agrave; una tassa &pound; 10,00. Noi non restituire il costo della spedizione a meno che il ritorno &egrave; il nostro errore. <br/>\r\n<br/>\r\n<br/>\r\nDISTACCO  <br/>\r\n<br/>\r\nTutti gli ordini internazionali sono spediti entro le 24/48 ore spediamo tramite Lunedi a Venerd&igrave;. Quando il pacchetto viene spedito fuori noi e-mail con un numero di tracking in modo da poter controllare lo stato del tuo articolo. Se hai bisogno del vostro ordine entro una certa data fatecelo sapere, mettendo queste informazioni sugli ordini. <br/>\r\n&bull; Si prega di essere a conoscenza di tutti i tipi di servizio o le spese, nonch&eacute; IVA o paese tasse specifiche che si possono applicare queste saranno le responsabilit&agrave; del compratore. <br/>\r\nTutti gli ordini del Regno Unito sono spediti via posta / mail Royal o tramite corriere registrati e possono essere consegnati entro le 24 ore (costi aggiuntivi possono essere a pagamento).'),
(6, 7, 'it', 'Contattaci', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"></span>'),
(7, 7, 'fr', 'Contactez-nous', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"></span>'),
(8, 1, 'es', 'Quiénes somos', 'Me puse mi negocio en 2002 porque cre&iacute;a que hab&iacute;a una falta de buena calidad, lugares de experiencia en mi &aacute;rea local para comprar ropa de Bautismo y la Santa Comuni&oacute;n - Espero que mi p&aacute;gina web llena este vac&iacute;o en el mercado &uacute;nico para la ropa de calidad de lujo a precios asequibles . Desde 2002 he ampliado mi alcance para incluir la noche llevar vestidos de fiesta y accesorios I hope you enjoy. <br/>\r\n<br/>\r\nEn los &uacute;ltimos a&ntilde;os he de origen nuevos dise&ntilde;adores de Italia, Francia, Nueva York y todos mis vestidos pueden ser enviados dentro de 24 horas. Me esforzar&eacute; por seguir tambi&eacute;n ampliar mi rango y la b&uacute;squeda de nuevos dise&ntilde;os de algunos de los cuales son exclusivos para m&iacute;. <br/>\r\n<br/>\r\nSi usted tiene alguna pregunta o simplemente quiere hablar conmigo sobre un estilo o de prendas de vestir a continuaci&oacute;n, e-mail me enqiires@christinasofclarkston.co.uk o llamarme 0141 644 3556 en cualquier momento.'),
(9, 2, 'fr', 'Produits', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"><span class="navTitle"></span></span>'),
(10, 2, 'es', 'Productos', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"><span class="navTitle"></span></span>'),
(11, 6, 'fr', 'FAQs', 'Q. Avez-vous un magasin je peux visiter?  <br/>\r\n<br/>\r\nR. Je n&#39;ai certes a ouvert une nouvelle boutique dans ma r&eacute;gion en Clarkston ce petit magasin d&#39;actions plus large gamme d&#39;Ecosse du bapt&ecirc;me et la communion usure le long d&#39;une s&eacute;lection grandissante de soir&eacute;e et robes de bal et accessoires de la boutique est situ&eacute;e au 126, rue Main Clarkston . Nous demandons seulement que vous t&eacute;l&eacute;phonez &agrave; l&#39;avance si vous &ecirc;tes int&eacute;ress&eacute; par un article sp&eacute;cifique ou le style ou la gamme de sorte que nous pouvons vous assurer que tout est pr&ecirc;t pour vous, comme les nominations sont normalement prises pour vous assurer de recevoir notre meilleure attention. <br/>\r\n<br/>\r\n<br/>\r\nQ. Puis-je &eacute;changer ma commande si elle est trop petite ou trop grosse ou si je ne l&#39;aime pas?  <br/>\r\n<br/>\r\nR. Bien s&ucirc;r vous pouvez Conform&eacute;ment &agrave; notre politique de retour.  <br/>\r\n<br/>\r\n<br/>\r\nQ. Vais-je recevoir ma commande en toute s&eacute;curit&eacute;?  <br/>\r\n<br/>\r\nA. Nous envoyons la plupart de nos Etats-Unis Royaume-Uni. Europ&eacute;enne et d&#39;outre-mer commandes en utilisant Royal Mail / livraison bureau de poste sp&eacute;cial. Il s&#39;agit d&#39;une m&eacute;thode enti&egrave;rement s&eacute;curis&eacute; et suivi de l&#39;envoi postal et la livraison &agrave; des adresses au Royaume-Uni est normalement 2-3 jours pour d&eacute;livrer une information plus s&#39;il vous pla&icirc;t vous r&eacute;f&eacute;rer &agrave; notre page d&#39;exp&eacute;dition. <br/>\r\n<br/>\r\n<br/>\r\nQ. Quel est le co&ucirc;t de mes commandes en euros / US $ / $ Aus?  <br/>\r\n<br/>\r\nA. Tous les taux de change sont en constante &eacute;volution, nous vous recommandons d&#39;utiliser un site web r&eacute;guli&egrave;rement mis &agrave; jour tels que la conversion de devises www.xe.com <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nRetours: Nous sommes confiants que vous serez satisfait de votre achat ici, mais si quelque chose n&#39;est pas correct avec vos v&ecirc;tements alors: -- <br/>\r\nTous les retours doivent &ecirc;tre non port&eacute;, et le v&ecirc;tement doit toujours &ecirc;tre &eacute;tiquet&eacute; - s&#39;il vous pla&icirc;t remplir notre formulaire de retour, apr&egrave;s quoi vous serez contact&eacute; dans un d&eacute;lai d&#39;un jour ouvrable entreprise et l&#39;octroi d&#39;un certain nombre RRN que vous devez &eacute;crire &agrave; l&#39;ext&eacute;rieur de la bo&icirc;te. S&#39;il vous pla&icirc;t ne pas envoyer de retour de certaines pi&egrave;ces sans nous contacter. Tous les retours doivent inclure les cintres et emballage d&#39;origine sinon il y aura une charge &pound; 10.00. Nous ne retournons pas les frais de port sauf si le retour est notre erreur. <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nEchanges: Tous les &eacute;changes s&#39;il vous pla&icirc;t contactez-nous par t&eacute;l&eacute;phone au 0141 644 3556 ou par e-mail sur enquiries@christinasofclarkston.co.uk et nous allons passer une nouvelle commande pour vous tout de suite car nous savons que le temps peut &ecirc;tre une question importante. Dans la plupart des cas, apr&egrave;s vous nous contactez, nous allons placer une nouvelle commande pour vous imm&eacute;diatement et vous seul frais pour l&#39;exp&eacute;dition des articles non pour les articles eux-m&ecirc;mes. De cette fa&ccedil;on vous pouvez recevoir vos articles beaucoup plus rapide tous les &eacute;changes doivent inclure le cintre et emballage d&#39;origine ou il y aura une charge &pound; 10.00. Nous ne retournons pas les frais de port sauf si le retour est notre erreur. <br/>\r\n<br/>\r\n<br/>\r\nAFFICHAGE  <br/>\r\n<br/>\r\nToutes les commandes internationales sont exp&eacute;di&eacute;s dans les 24/48 heures, nous navire lundi au vendredi. Lorsque votre colis est exp&eacute;di&eacute; nous e-mail un num&eacute;ro de suivi afin que vous puissiez v&eacute;rifier l&#39;&eacute;tat de votre article. Si vous avez besoin de votre commande dans un d&eacute;lai d&eacute;termin&eacute; s&#39;il vous pla&icirc;t nous le faire savoir en mettant cette information sur vos commandes. <br/>\r\n&bull; S&#39;il vous pla&icirc;t &ecirc;tre conscient de tout custom / taxes ou charges ainsi que la TVA ou le pays des taxes sp&eacute;cifiques qui s&#39;appliquent mai puisque ces activit&eacute;s seront la responsabilit&eacute; de l&#39;acheteur. <br/>\r\nRoyaume-Uni Toutes les commandes sont exp&eacute;di&eacute;es par la poste / mail royale ou par courrier enregistr&eacute; et peut &ecirc;tre livr&eacute;e dans les 24 heures (frais suppl&eacute;mentaires s&#39;appliquent mai).'),
(12, 6, 'es', 'FAQs', 'P. &iquest;Tiene usted una tienda que pueda visitar?  <br/>\r\n<br/>\r\nA. Sin duda tengo una apertura nueva boutique en mi &aacute;rea local en Clarkston esta tienda se rango de valores m&aacute;s grande de Escocia de bautizo y la comuni&oacute;n de desgaste junto con una selecci&oacute;n cada vez mayor de la noche y vestidos de fiesta y accesorios de la boutique se encuentra ubicado en 126 Main Street Clarkston . S&oacute;lo pedimos que antes de tel&eacute;fono si usted est&aacute; interesado en un tema espec&iacute;fico, estilo o nivel a fin de que podamos asegurar que todo est&aacute; listo para que los nombramientos se suelen tomar para asegurarse de recibir nuestra mejor atenci&oacute;n. <br/>\r\n<br/>\r\n<br/>\r\nP. &iquest;Puedo cambiar mi orden si es demasiado peque&ntilde;o o demasiado grande o si simplemente no te gusta?  <br/>\r\n<br/>\r\nR: Por supuesto que puede de acuerdo con nuestra pol&iacute;tica de retorno.  <br/>\r\n<br/>\r\n<br/>\r\nP. &iquest;Puedo recibir mi pedido de manera segura?  <br/>\r\n<br/>\r\nA. Enviamos la mayor&iacute;a de nuestros Reino Unido EE.UU.. De los requerimientos europeos y de ultramar con Royal Mail / entrega de la oficina de correos especial. Se trata de un seguro de un seguimiento completo m&eacute;todo de env&iacute;o y entrega a las direcciones de Reino Unido es normalmente de 2-3 d&iacute;as para la entrega de informaci&oacute;n, por favor consulte nuestra p&aacute;gina de env&iacute;o. <br/>\r\n<br/>\r\n<br/>\r\nP. &iquest;Cu&aacute;l es el costo de mis pedidos en Euros / $ EE.UU. / $ AUS?  <br/>\r\n<br/>\r\nA. Todos los tipos de cambio est&aacute;n en constante cambio le recomendamos que utilice un sitio web peri&oacute;dicamente actualizado de conversi&oacute;n de moneda, como www.xe.com <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nDevoluciones: Estamos seguros de que usted ser&aacute; feliz con su compra aqu&iacute;, pero si algo no es correcto con sus prendas de vestir a continuaci&oacute;n: -- <br/>\r\nTodas las devoluciones deben ser la prenda de vestir sin estrenar y todav&iacute;a deben estar etiquetados - por favor llene nuestro formulario de retorno despu&eacute;s de que usted ser&aacute; contactado en un d&iacute;a laborable de trabajo y dar un n&uacute;mero RRN que debe escribir en el exterior de la caja. Favor de no enviar de vuelta art&iacute;culos sin ponerse en contacto con nosotros. Todas las devoluciones deben incluir los soportes originales y el embalaje de otra manera habr&aacute; un &pound; 10.00 cargo. No se devolver&aacute;n los gastos de env&iacute;o a menos que el retorno es nuestro error. <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nCambios: Todos los intercambios p&oacute;ngase en contacto con nosotros por tel&eacute;fono 0141 644 3556 o por e-mail en enquiries@christinasofclarkston.co.uk y vamos a realizar un nuevo pedido para que de inmediato como se sabe el tiempo puede ser una cuesti&oacute;n importante. En la mayor&iacute;a de los casos despu&eacute;s de ponerse en contacto con nosotros vamos a realizar un nuevo pedido de inmediato y no s&oacute;lo cobran por el env&iacute;o de las partidas para los elementos de s&iacute; mismos. De esta manera usted puede recibir sus productos mucho m&aacute;s r&aacute;pido de todos los intercambios debe incluir la suspensi&oacute;n original y los envases o habr&aacute; un &pound; 10.00 cargo. No se devolver&aacute;n los gastos de env&iacute;o a menos que el retorno es nuestro error. <br/>\r\n<br/>\r\n<br/>\r\nDESPLAZAMIENTO  <br/>\r\n<br/>\r\nTodos los pedidos internacionales se env&iacute;an dentro de las 24/48 horas que se env&iacute;an de lunes a viernes. Cuando el paquete es enviado a nosotros por e-mail que un n&uacute;mero de seguimiento para que pueda comprobar el estado de tu art&iacute;culo. Si necesita su solicitud en una fecha determinada por favor h&aacute;ganoslo saber por poner esta informaci&oacute;n en sus pedidos. <br/>\r\n&bull; Tenga en cuenta de ninguna costumbre / de derechos o tarifas, as&iacute; como el IVA o los impuestos espec&iacute;ficos de los pa&iacute;ses que pueden aplicarse, ya que estar&aacute;n a cargo del comprador. <br/>\r\nTodos los pedidos de Reino Unido se env&iacute;an a trav&eacute;s de la oficina de correos / mail real o por correo registrado y puede ser entregado dentro de 24 horas (los costes adicionales pueden aplicarse).'),
(13, 7, 'es', 'Contáctenos', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<br/>\r\n<br/>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.<span class="navTitle"></span>'),
(14, 8, 'fr', 'Termes', 'S&#39;IL VOUS PLA&Icirc;T LIRE ATTENTIVEMENT LES MODALIT&Eacute;S ET CONDITIONS D&#39;UTILISATION ATTENTIVEMENT AVANT D&#39;UTILISER CE SITE. Nous maintenons ce site Web comme un service &agrave; nos clients, et en utilisant notre site, vous acceptez de respecter et d&#39;&ecirc;tre li&eacute; par les modalit&eacute;s d&#39;utilisation suivantes. S&#39;il vous pla&icirc;t lire les modalit&eacute;s et conditions suivantes soigneusement, et v&eacute;rifiez-les r&eacute;guli&egrave;rement pour des changements. Si vous n&#39;acceptez pas les termes et conditions, vous ne devriez pas examiner les renseignements ou obtenir des biens, services ou produits &agrave; partir de ce site. <br/>\r\n<br/>\r\n1. Acceptation d&#39;accord. Vous acceptez les termes et conditions d&eacute;crits dans le pr&eacute;sent Termes et Conditions de l&#39;entente d&#39;utilisation ( &quot;Contrat&quot;) &agrave; l&#39;&eacute;gard de notre site (le &laquo;Site&raquo;). Le pr&eacute;sent Accord constitue l&#39;accord entier et seul entre nous et vous, et remplace tous les accords ant&eacute;rieurs ou contemporains, les repr&eacute;sentations, garanties et ententes &agrave; l&#39;&eacute;gard du site, du contenu, des produits ou des services fournis par ou via le Site, et l&#39;objet de pr&eacute;sent accord. Le pr&eacute;sent Accord mai soit modifi&eacute; par nous &agrave; tout moment et de temps en temps, sans pr&eacute;avis particulier pour vous. La plus r&eacute;cente entente sera affich&eacute; sur le site, et vous devriez en revue cet accord avant d&#39;utiliser le Site. <br/>\r\n<br/>\r\n2. Droit d&#39;auteur. Le contenu, l&#39;organisation, le graphisme, la conception, la compilation, la traduction magn&eacute;tique, la conversion num&eacute;rique et autres questions li&eacute;es au site sont prot&eacute;g&eacute;s par droits d&#39;auteur, marques, marques d&eacute;pos&eacute;es et d&#39;autres sp&eacute;cialit&eacute;s (y compris mais non limit&eacute; &agrave; la propri&eacute;t&eacute; intellectuelle). La copie, la redistribution, l&#39;utilisation ou la publication de votre part de ces m&ecirc;mes questions &agrave; tout ou partie du Site, sauf dans les cas autoris&eacute;s par la section 4, est strictement interdite. Vous n&#39;obtenez pas les droits de propri&eacute;t&eacute; sur le contenu, un document ou d&#39;autres mat&eacute;riaux consult&eacute;s par l&#39;interm&eacute;diaire du Site. L&#39;affichage d&#39;informations ou de documents sur le Site ne constitue pas une renonciation de tout droit sur ces informations et mat&eacute;riaux. <br/>\r\n<br/>\r\n3. Fraude: En devenant membre, vous confirmez que les renseignements fournis dans ce formulaire sont vraies et que vous vous engagez &agrave; respecter les Termes et Conditions d&#39;utilisation de ce site. S&#39;il vous pla&icirc;t noter que votre adh&eacute;sion peut &ecirc;tre annul&eacute;e sans pr&eacute;avis, s&#39;il est &eacute;tabli que l&#39;information fausse ou trompeuse a &eacute;t&eacute; fournie, les Termes et Conditions d&#39;utilisation ont &eacute;t&eacute; viol&eacute;es, ou d&#39;autres abus ont &eacute;t&eacute; &eacute;tablies par &laquo;Christinas de Clarkston&quot; &agrave; sa seule discr&eacute;tion . Si l&#39;adh&eacute;sion a &eacute;t&eacute; r&eacute;voqu&eacute;e &quot;, Christinas de Clarkston&quot; se r&eacute;serve le droit de refuser une demande ou sa r&eacute;admission au programme d&#39;adh&eacute;sion. <br/>\r\n<br/>\r\n4. Limited droit d&#39;utiliser. La visualisation, l&#39;impression ou le t&eacute;l&eacute;chargement de tout contenu, graphisme, formulaire ou document &agrave; partir du Site ne vous accorde une licence, non exclusif limit&eacute; pour une utilisation uniquement par vous pour votre propre usage personnel et non pour distribution republication, la cession, sous-licence, la vente, la pr&eacute;paration d&#39;&oelig;uvres d&eacute;riv&eacute;es ou autres utilisations. Aucune partie de tout contenu, la forme ou le document de mai &ecirc;tre reproduite sous quelque forme ou int&eacute;gr&eacute;e &agrave; un syst&egrave;me de recherche d&#39;information, &eacute;lectronique ou m&eacute;canique, autres que pour votre usage personnel (mais pas pour la revente ou la redistribution). <br/>\r\n<br/>\r\n5. &Eacute;dition, suppression et modification. Nous nous r&eacute;servons le droit, &agrave; notre seule discr&eacute;tion, de modifier ou supprimer tous documents, informations ou autres contenus figurant sur le Site, y compris le pr&eacute;sent Contrat, sans pr&eacute;avis aux utilisateurs du site. <br/>\r\n<br/>\r\n6. Indemnisation. Vous acceptez d&#39;indemniser, d&eacute;fendre et tenir nous et nos partenaires, les avou&eacute;s, le personnel et les soci&eacute;t&eacute;s affili&eacute;es (collectivement, les &quot;parties affili&eacute;es&quot;) contre toute responsabilit&eacute;, perte, r&eacute;clamation et d&eacute;pense, y compris les frais d&#39;avocats raisonnables, li&eacute;s &agrave; la violation du pr&eacute;sent Accord ou l&#39;utilisation du Site. <br/>\r\n<br/>\r\n7. Non transf&eacute;rables. Votre droit d&#39;utiliser le site n&#39;est pas transf&eacute;rable. Tout mot de passe ou &agrave; droite qui vous est donn&eacute; pour obtenir des renseignements ou des documents n&#39;est pas transf&eacute;rable et mai seulement &ecirc;tre utilis&eacute; par vous. <br/>\r\n<br/>\r\n8. Disclaimer. LES INFORMATIONS PROVENANT DE OU PAR LE SITE SONT FOURNIS &laquo;EN L&#39;&Eacute;TAT&raquo;, &laquo;SELON LA DISPONIBILIT&Eacute;&raquo;, ET TOUTE GARANTIE, EXPLICITE OU IMPLICITE, SONT EXCLUES (Y COMPRIS, MAIS SANS S&#39;Y LIMITER LA RESPONSABILIT&Eacute; DE TOUTE GARANTIE IMPLICITE DE QUALITE MARCHANDE ET D&#39;ADEQUATION A UN USAGE PARTICULIER ). LES INFORMATIONS ET LES SERVICES PEUVENT CONTENIR DES BOGUES, DES ERREURS, DES PROBL&Egrave;MES OU D&#39;AUTRES RESTRICTIONS. NOUS ET NOS PARTIES AFFILIE N&#39;ASSUME AUCUNE RESPONSABILIT&Eacute; POUR VOTRE UTILISATION DE TOUTE INFORMATION OU SERVICE. EN PARTICULIER, MAIS NON COMME UNE LIMITATION, NOUS ET NOS PARTIES AFFILI&Eacute;ES NE SONT PAS TENUS RESPONSABLES DES DOMMAGES INDIRECTS, SP&Eacute;CIAUX, ACCESSOIRES OU CONSECUTIFS (Y COMPRIS LES DOMMAGES POUR PERTE D&#39;AFFAIRES, PERTE DE PROFITS, LITIGE OU AUTRES), QUE CE SOIT SUR LA BASE D&#39;UNE VIOLATION DE CONTRAT, RUPTURE DE GARANTIE, TORT (Y COMPRIS LA N&Eacute;GLIGENCE), RESPONSABILIT&Eacute; DU PRODUIT OU AUTREMENT, M&Ecirc;ME EN CAS D&#39;AVERTISSEMENT DE LA POSSIBILIT&Eacute; DE TELS DOMMAGES. La n&eacute;gation du DOMMAGES ci-dessus sont ELEMENTS FONDAMENTAUX DE LA BASE DE LA BONNE AFFAIRE ENTRE NOUS. CE SITE ET LES INFORMATIONS ne serait pas assur&eacute; sans ces limitations. AUCUN AVIS NI AUCUNE INFORMATION, QU&#39;ILS SOIENT ORAUX OU ECRITS, OBTENUS PAR VOUS CHEZ NOUS PAR LE SITE NE CONSTITUE UNE GARANTIE, REPR&Eacute;SENTATION OU GARANTIE PAS EXPRESS&Eacute;MENT INDIQU&Eacute;E DANS CET ACCORD. <br/>\r\n<br/>\r\n9. Limites. Toute responsabilit&eacute; ou obligation pour tout dommage caus&eacute; par des virus contenus dans le fichier &eacute;lectronique contenant le formulaire ou document est d&eacute;ni&eacute;e. NOUS NE SERONS PAS TENU RESPONSABLE ENVERS VOUS DE DOMMAGES DIRECTS, SP&Eacute;CIAUX OU CONS&Eacute;CUTIFS DE QUELQUE NATURE QUE PEUT PROVOQUER DE L&#39;UTILISATION DE OU L&#39;INCAPACITE A UTILISER NOTRE SITE. Notre responsabilit&eacute; maximale envers vous, en toutes circonstances sera &eacute;gal au prix d&#39;achat que vous payez pour des biens, services ou informations. <br/>\r\n<br/>\r\n10. Utilisation des renseignements. Nous nous r&eacute;servons le droit, et vous nous y autorisez, &agrave; l&#39;utilisation et l&#39;affectation de toutes les informations concernant les utilisations du site par vous et toutes les informations fournies par vous dans toute autre mani&egrave;re conforme &agrave; notre politique de confidentialit&eacute;. <br/>\r\n<br/>\r\n11. Third-Party Services. Nous autorisons l&#39;acc&egrave;s ou la publicit&eacute; pour les sites marchands de troisi&egrave;me partie ( &laquo;commer&ccedil;ants&raquo;) &agrave; partir duquel vous mai acheter ou autrement obtenir certains biens ou services. Vous comprenez que nous ne g&eacute;rons ni ne contr&ocirc;le les produits ou services offerts par Merchants. Les commer&ccedil;ants sont responsables de tous les aspects du traitement des commandes, la r&eacute;alisation, la facturation et le service &agrave; la client&egrave;le. Nous ne sommes pas partie &agrave; la transaction conclue entre vous et les commer&ccedil;ants. VOUS RECONNAISSEZ QUE L&#39;UTILISATION DE CES COMMER&Ccedil;ANTS SE FAIT &Agrave; VOS PROPRES RISQUES ET EST SANS AUCUNE GARANTIE DE QUELQUE NATURE QUE CE SOIT PAR LES USA, EXPRESSE, IMPLICITE OU AUTRE, Y COMPRIS LES GARANTIES DE TITRE, D&#39;ADEQUATION A UN BESOIN, DE QUALITE MARCHANDE OU DE NON VIOLATION EN AUCUN CAS NOUS SOMMES PAS RESPONSABLES DES DOMMAGES DECOULANT DES TRANSACTIONS ENTRE VOUS ET MARCHANDS OU POUR TOUTE INFORMATION FIGURANT SUR LES SITES DE COMMERCE OU DE TOUT AUTRE SITE LIE A NOTRE SITE. <br/>\r\n<br/>\r\n12. Third-Party Politiques marchande. Toutes les r&egrave;gles, les politiques (y compris la vie priv&eacute;e des politiques) et les proc&eacute;dures d&#39;exploitation des Marchands s&#39;appliqueront &agrave; vous tandis que sur ces sites. Nous ne sommes pas responsable des renseignements fournis par vous aux n&eacute;gociants. Nous et les commer&ccedil;ants sont des entrepreneurs ind&eacute;pendants et aucune des parties a le pouvoir de faire des repr&eacute;sentations ou des engagements au nom de l&#39;autre. <br/>\r\n<br/>\r\n13. Politique de confidentialit&eacute;. S&#39;il vous pla&icirc;t consulter notre, comme elle mai changer de temps en temps, fait partie du pr&eacute;sent accord. <br/>\r\n<br/>\r\n14. Paiements. Vous d&eacute;clarez et garantissez que si vous achetez quelque chose par nous ou de nos marchands que (i) toute information de carte de cr&eacute;dit que vous fournissez sont v&eacute;ridiques, exacts et complets, (i) les frais encourus par vous seront honor&eacute;s par votre compagnie de carte de cr&eacute;dit, et (iii) vous paierez les frais encourus par vous aux prix affich&eacute;s, y compris les frais d&#39;exp&eacute;dition et taxes applicables. <br/>\r\n<br/>\r\n15. Mobili&egrave;res applicables. Mai sur ce site incluent des d&eacute;clarations concernant nos activit&eacute;s, les perspectives, les strat&eacute;gies, la situation financi&egrave;re, la performance &eacute;conomique future et de la demande pour nos produits ou services, ainsi que de nos intentions, les plans et les objectifs qui sont des &eacute;nonc&eacute;s prospectifs. Ces d&eacute;clarations sont fond&eacute;es sur un certain nombre d&#39;hypoth&egrave;ses et estimations qui sont soumis &agrave; d&#39;importantes incertitudes, dont bon nombre sont ind&eacute;pendants de notre contr&ocirc;le. Lorsqu&#39;il est utilis&eacute; sur notre site, des mots comme &laquo;anticiper&raquo;, &laquo;s&#39;attend &agrave;&raquo;, &laquo;croit&raquo;, &laquo;estime&raquo;, &laquo;cherche&raquo;, &laquo;pr&eacute;voit&raquo;, &laquo;projette&raquo; et autres expressions similaires visent &agrave; identifier des &eacute;nonc&eacute;s prospectifs visant &agrave; relever valeurs mobili&egrave;res havres s&ucirc;rs pour le droit des &eacute;nonc&eacute;s prospectifs. Le Site et les informations qu&#39;il contient ne constituent ni une offre ni une sollicitation d&#39;une offre de vente de titres. Aucune des informations contenues dans ce document est destin&eacute; &agrave; &ecirc;tre, et ne sont pas r&eacute;put&eacute;s &ecirc;tre, incorpor&eacute;e dans l&#39;un de nos titres li&eacute;s &agrave; des d&eacute;p&ocirc;ts ou des documents. <br/>\r\n<br/>\r\n16. Soumissions. Toutes les suggestions, des id&eacute;es, des notes, des concepts et des autres informations que vous mai de temps &agrave; envoyer pour nous (collectivement, les &laquo;soumissions&raquo;) doivent &ecirc;tre jug&eacute;s et restent notre propri&eacute;t&eacute; exclusive et ne doivent pas &ecirc;tre soumis &agrave; aucune obligation de confidentialit&eacute; de notre part. Sans limiter ce qui pr&eacute;c&egrave;de, on est r&eacute;put&eacute; propri&eacute;taire de tous connu et ci-apr&egrave;s les droits existants de chaque type et la nature en ce qui concerne les soumissions et a le droit d&#39;utilisation sans restriction des soumissions &agrave; toute fin, sans compensation au fournisseur des Soumissions.');
INSERT INTO `cubecart_docs_lang` (`id`, `doc_master_id`, `doc_lang`, `doc_name`, `doc_content`) VALUES
(15, 8, 'es', 'Términos', 'POR FAVOR LEA LOS T&Eacute;RMINOS Y CONDICIONES DE USO CUIDADOSAMENTE ANTES DE UTILIZAR ESTE SITIO. Mantenemos este sitio web como un servicio a nuestros clientes, y al uso de nuestro sitio usted acepta cumplir y estar obligado por los t&eacute;rminos de uso. Por favor, revise los siguientes t&eacute;rminos y condiciones cuidadosamente, y revisarlas peri&oacute;dicamente para los cambios. Si usted no est&aacute; de acuerdo con los t&eacute;rminos y condiciones, usted no debe revisar la informaci&oacute;n o la obtenci&oacute;n de bienes, servicios o productos de este sitio. <br/>\r\n<br/>\r\n1. Aceptaci&oacute;n del acuerdo. Usted acepta los t&eacute;rminos y condiciones descritos en estos T&eacute;rminos y Condiciones de Uso ( &quot;Acuerdo&quot;) con respecto a nuestro sitio (el &quot;Sitio&quot;). Este Acuerdo constituye el &uacute;nico acuerdo entre nosotros y vosotros, y reemplaza todos los acuerdos anteriores o contempor&aacute;neas, las representaciones, garant&iacute;as y entendimientos con respecto al Sitio, el contenido, productos o servicios suministrados por oa trav&eacute;s del Sitio, y el tema de el presente Acuerdo. El presente Acuerdo podr&aacute; ser enmendado por nosotros en cualquier momento y de vez en cuando sin necesidad de preaviso a usted. El &uacute;ltimo acuerdo se publicar&aacute; en el sitio, y usted debe revisar este acuerdo antes de utilizar el sitio. <br/>\r\n<br/>\r\n2. Derechos de autor. El contenido, organizaci&oacute;n, gr&aacute;ficos, dise&ntilde;o, compilaci&oacute;n, traducci&oacute;n magn&eacute;tica, conversi&oacute;n digital y otros asuntos relacionados con el Sitio est&aacute;n protegidos por derechos de autor, marcas comerciales, marcas registradas y otros derechos de propiedad (incluyendo pero no limitado a la propiedad intelectual). La copia, redistribuci&oacute;n, uso o publicaci&oacute;n por usted de cualquier material o cualquier parte del Sitio, excepto seg&uacute;n lo permitido por la Secci&oacute;n 4, est&aacute; estrictamente prohibido. Usted no adquiere derechos de propiedad de cualquier contenido, documento u otro material se ve a trav&eacute;s del Sitio. La publicaci&oacute;n de informaci&oacute;n o materiales en el Sitio no constituye una renuncia a cualquier derecho sobre dicha informaci&oacute;n y materiales. <br/>\r\n<br/>\r\n3. Fraude: Al convertirse en miembro, usted confirma que la informaci&oacute;n proporcionada en este formulario es verdadera y que usted acepta cumplir con los T&eacute;rminos y Condiciones de uso de este sitio. Tenga en cuenta que su membres&iacute;a puede ser cancelada sin previo aviso si se determina que la informaci&oacute;n falsa o enga&ntilde;osa, se ha previsto, los t&eacute;rminos y condiciones de uso han sido violados, o los abusos que han ocurrido otros, determinado por &quot;Christinas de Clarkston&quot; a su entera discreci&oacute;n . Si la adhesi&oacute;n ha sido revocado, &quot;Christinas de Clarkston&quot; se reserva el derecho a rechazar la solicitud o la readmisi&oacute;n en el programa de afiliaci&oacute;n. <br/>\r\n<br/>\r\n4. Limitado derecho de uso. El ver, imprimir o descargar cualquier contenido, gr&aacute;fico, forma o documento en el sitio le concede solamente una licencia limitada, no exclusiva para su uso exclusivamente por usted para su uso personal y no para la distribuci&oacute;n de republicaci&oacute;n, cesi&oacute;n, sublicencia, venta, preparaci&oacute;n de trabajos derivados o utilizar otros. Ninguna parte de ning&uacute;n contenido, forma o documento puede ser reproducida en cualquier forma o incorporar en cualquier sistema de recuperaci&oacute;n de informaci&oacute;n, electr&oacute;nico o mec&aacute;nico, excepto para su uso personal (pero no para reventa o redistribuci&oacute;n). <br/>\r\n<br/>\r\n5. Edici&oacute;n, borrado y modificaci&oacute;n. Nos reservamos el derecho a nuestra discreci&oacute;n de editar o borrar cualquier documento, informaci&oacute;n u otro contenido que aparezca en el Sitio, incluyendo el presente Acuerdo, sin previo aviso a los usuarios del sitio. <br/>\r\n<br/>\r\n6. Indemnizaci&oacute;n. Usted accede a indemnizar, defender y mantener a nosotros ya nuestros socios, abogados, personal y afiliados (colectivamente, &quot;Partes Afiliadas&quot;) de cualquier responsabilidad, p&eacute;rdida, reclamo y gasto, incluyendo honorarios razonables de abogados, relacionados con su violaci&oacute;n de este Acuerdo o el uso del sitio. <br/>\r\n<br/>\r\n7. Intransferible. Su derecho a utilizar el sitio no es transferible. Cualquier contrase&ntilde;a o derecho dado a usted para obtener informaci&oacute;n o documentos no es transferible y s&oacute;lo podr&aacute;n ser utilizados por usted. <br/>\r\n<br/>\r\n8. Descargo de responsabilidad. LA INFORMACI&Oacute;N O DE A TRAV&Eacute;S DEL SITIO SE SUMINISTRA &quot;TAL COMO EST&Aacute;&quot; Y &quot;COMO EST&Aacute; DISPONIBLE&quot;, Y CUALQUIER GARANT&Iacute;A, EXPRESA O IMPL&Iacute;CITA, SE RENUNCIA (INCLUYENDO PERO NO LIMITADA A LA EXCLUSI&Oacute;N DE GARANT&Iacute;AS IMPLICITAS DE COMERCIALIZACI&Oacute;N Y APTITUD PARA UN PROP&Oacute;SITO PARTICULAR ). LA INFORMACI&Oacute;N Y LOS SERVICIOS que puede contener virus, errores, problemas U OTRAS LIMITACIONES. NOSOTROS Y NUESTRAS PARTES AFILIADAS NO TIENE NINGUNA RESPONSABILIDAD POR EL USO DE CUALQUIER INFORMACI&Oacute;N O SERVICIO. EN PARTICULAR, AUNQUE NO COMO OTROS, NOSOTROS Y NUESTRAS PARTES AFILIADAS NO SON RESPONSABLES DE NING&Uacute;N DA&Ntilde;O INDIRECTO, ESPECIAL, ACCIDENTAL O CONSECUENTE (INCLUYENDO DA&Ntilde;OS POR P&Eacute;RDIDA DE NEGOCIO, P&Eacute;RDIDA DE BENEFICIOS, LITIGIO O SIMILARES), YA SEA POR INCUMPLIMIENTO DE CONTRATO, INCUMPLIMIENTO DE GARANT&Iacute;A, AGRAVIO (INCLUYENDO NEGLIGENCIA), RESPONSABILIDAD POR LOS PRODUCTOS O DE OTRO TIPO, INCLUSO SI SE HA ADVERTIDO DE LA POSIBILIDAD DE TALES DA&Ntilde;OS. LA NEGACI&Oacute;N DE DA&Ntilde;OS ESTABLECIDOS ANTERIORMENTE SON ELEMENTOS FUNDAMENTALES DE LA BASE DE EE.UU. entre OPORTUNIDAD. ESTE SITIO Y LA INFORMACION que no se ofrecer&iacute;a SIN TALES LIMITACIONES. NING&Uacute;N CONSEJO O INFORMACI&Oacute;N, YA SEA ORAL O ESCRITO, OBTENIDO POR USTED DE EE.UU. A TRAV&Eacute;S DEL SITIO CREAR&Aacute; NING&Uacute;N TIPO DE GARANT&Iacute;A, REPRESENTACI&Oacute;N O GARANT&Iacute;A NO EXPRESAMENTE EN ESTE ACUERDO. <br/>\r\n<br/>\r\n9. L&iacute;mites. Toda responsabilidad por los da&ntilde;os causados por los virus contenidos en el archivo electr&oacute;nico que contiene el formulario o documento es RENUNCIAR. NO SEREMOS RESPONSABLES ANTE USTED POR DA&Ntilde;OS INCIDENTALES, ESPECIALES O CONSECUENTES DE CUALQUIER TIPO QUE PUEDA RESULTAR DEL USO O IMPOSIBILIDAD DE USO DE NUESTRO SITIO. Nuestra m&aacute;xima responsabilidad ante usted en todas las circunstancias ser&aacute; igual al precio de compra que paga por todos los bienes, servicios o informaci&oacute;n. <br/>\r\n<br/>\r\n10. Uso de la Informaci&oacute;n. Nos reservamos el derecho de, y usted nos autoriza, a la utilizaci&oacute;n y cesi&oacute;n de toda la informaci&oacute;n sobre los usos de la web por usted y toda la informaci&oacute;n proporcionada por usted en cualquier forma coherente con nuestra pol&iacute;tica de privacidad. <br/>\r\n<br/>\r\n11. Los servicios de terceros. Nos permiten el acceso o la publicidad de terceros sitios comerciales de terceros ( &quot;mercaderes&quot;) de la que usted puede comprar u obtener determinados bienes o servicios. Usted entiende que no operan o controlan los productos o servicios ofrecidos por los comerciantes. Los comerciantes son responsables de todos los aspectos de procesamiento de pedidos, cumplimiento, facturaci&oacute;n y servicio al cliente. No somos una parte de las operaciones en que entre usted y los comerciantes. USTED ACEPTA QUE EL USO DE DICHOS ESTABLECIMIENTOS QUE EST&Aacute; EN SU PROPIO RIESGO Y EST&Aacute; SIN GARANT&Iacute;A DE NING&Uacute;N TIPO POR EE.UU., EXPRESA, IMPL&Iacute;CITA O DE OTRO TIPO INCLUYENDO GARANT&Iacute;AS DE T&Iacute;TULO, su car&aacute;cter, COMERCIABILIDAD O NO INFRACCI&Oacute;N BAJO NINGUNA CIRCUNSTANCIA SOMOS RESPONSABLES DE NING&Uacute;N DA&Ntilde;O DERIVADOS DE LAS TRANSACCIONES ENTRE USTED Y COMERCIANTES O POR CUALQUIER INFORMACI&Oacute;N QUE FIGURA EN MERCANTE SITIOS O CUALQUIER OTRO SITIO ENLAZADO a nuestro sitio. <br/>\r\n<br/>\r\n12. De terceros Pol&iacute;ticas comerciales de terceros. Todas las reglas, pol&iacute;ticas (incluidas las pol&iacute;ticas de privacidad) y procedimientos operativos de los comerciantes se aplicar&aacute;n a usted mientras que en tales sitios. No somos responsables de la informaci&oacute;n proporcionada por usted a los comerciantes. Nosotros y los comerciantes son contratistas independientes y ninguna de las partes tiene la autoridad para hacer ninguna representaci&oacute;n o compromisos en nombre de la otra. <br/>\r\n<br/>\r\n13. Pol&iacute;tica de privacidad. Por favor, consulte nuestra, ya que puede cambiar de vez en cuando, es una parte de este Acuerdo.  <br/>\r\n<br/>\r\n14. Pagos. Usted manifiesta y garantiza que si usted est&aacute; comprando algo de nosotros o de nuestros comerciantes que (i) cualquier informaci&oacute;n de la tarjeta de cr&eacute;dito que la oferta es cierta, correcta y completa, (i) los costos incurridos por usted ser&aacute; homenajeado por su compa&ntilde;&iacute;a de tarjeta de cr&eacute;dito, y (iii) usted pagar&aacute; los gastos incurridos por usted a los precios publicados, incluidos los gastos de env&iacute;o e impuestos aplicables. <br/>\r\n<br/>\r\n15. Leyes de Valores. Este sitio puede incluir declaraciones relativas a nuestras operaciones, las perspectivas, estrategias, situaci&oacute;n financiera, rendimiento econ&oacute;mico futuro y la demanda de nuestros productos o servicios, as&iacute; como de nuestras intenciones, planes y objetivos que son declaraciones prospectivas. Estas declaraciones se basan en una serie de supuestos y estimaciones que est&aacute;n sujetas a importantes incertidumbres, muchos de los cuales est&aacute;n fuera de nuestro control. Cuando se utiliza en nuestro Sitio, palabras como &quot;anticipa&quot;, &quot;espera&quot;, &quot;cree&quot;, &quot;estima&quot;, &quot;busca&quot;, &quot;planea&quot;, &quot;pretende&quot; y expresiones similares tienen la intenci&oacute;n de identificar declaraciones a futuro dise&ntilde;ado para entrar en la ley de valores puertos seguros para las declaraciones prospectivas. El Sitio y la informaci&oacute;n aqu&iacute; contenida no constituye una oferta o una solicitud de una oferta de venta de valores. Ninguna de la informaci&oacute;n contenida aqu&iacute; est&aacute; destinada a ser, y no se considerar&aacute; incorporada en cualquiera de nuestros valores relacionados con solicitudes o documentos. <br/>\r\n<br/>\r\n16. Env&iacute;os. Todas las sugerencias, ideas, notas, conceptos y otra informaci&oacute;n que de vez en cuando nos env&iacute;e (colectivamente, &quot;Env&iacute;os&quot;) ser&aacute; considerada y seguir&aacute; siendo de nuestra propiedad y no estar&aacute;n sujetos a ninguna obligaci&oacute;n de confidencialidad por nuestra parte. Sin limitar lo anterior, se considerar&aacute; que son propietarios de todos conocido y en lo sucesivo, los derechos existentes de cualquier tipo y naturaleza en relaci&oacute;n con los motivos y tendr&aacute;n derecho al uso irrestricto de los Env&iacute;os para cualquier prop&oacute;sito, sin compensaci&oacute;n al proveedor de los Env&iacute;os.'),
(16, 9, 'it', 'Privacy', 'Siamo impegnati a proteggere la tua privacy e dei dati personali. Useremo solo le informazioni che raccogliamo su di te legalmente (in conformit&agrave; con il Data Protection Act 1998) e in base alla quale? Web Trader Code of Practice. <br/>\r\n<br/>\r\nRaccogliamo informazioni su di voi per 2 motivi: in primo luogo, per evadere l&#39;ordine e la seconda, per offrire il miglior servizio possibile. nkn <br/>\r\n<br/>\r\nNoi non e-mail in futuro, a meno che non ci hai dato il tuo consenso o in connessione con il vostro ordine o problemi di customer care. <br/>\r\n<br/>\r\nVi daremo la possibilit&agrave; di rifiutare qualsiasi e-mail marketing da noi o da un altro operatore in futuro.  <br/>\r\n<br/>\r\nIl tipo di informazioni che saranno raccolte su di te in genere include: il tuo indirizzo nome di numero di telefono indirizzo e-mail di credito / carta di debito di monitoraggio il vostro indirizzo IP per la carta di credito di prevenzione delle frodi solo <br/>\r\n<br/>\r\nnon riusciremo mai a raccogliere dati sensibili su di te, senza il tuo esplicito consenso.  <br/>\r\n<br/>\r\nLe informazioni in nostro possesso sono accurate e aggiornate.  <br/>\r\n<br/>\r\n&Egrave; possibile verificare le informazioni in nostro possesso inviando una email.  <br/>\r\n<br/>\r\nSe trovate inesattezze saremo eliminare o correggere prontamente.  <br/>\r\n<br/>\r\nI dati personali in nostro possesso, che sar&agrave; custodito in conformit&agrave; con la nostra politica di sicurezza interna (le informazioni sono sempre memorizzate in un formato crittografato quando sul nostro server o PC) e la legge e quali? Web Trader Code. <br/>\r\n<br/>\r\nSe abbiamo intenzione di trasferire le vostre informazioni al di fuori della CEE (Spazio economico europeo), saremo sempre di ottenere il vostro consenso prima. <br/>\r\n<br/>\r\nPossiamo usare la tecnologia per seguire i modelli di comportamento dei visitatori del nostro sito. Ci&ograve; pu&ograve; includere utilizzando un &quot;cookie&quot; che sarebbe memorizzati sul vostro browser. Di solito &egrave; possibile modificare il vostro browser per evitare che ci&ograve; accada. Le informazioni raccolte in questo modo pu&ograve; essere utilizzato per identificare l&#39;utente a meno che non si modificano le impostazioni del browser. Siamo in grado di fare e di numeri IP traccia dei computer che utilizzano il nostro server sicuro come un modo per rintracciare e prevenire possibili frodi con carta di credito. <br/>\r\n<br/>\r\nSe avete domande / commenti sulla privacy, &egrave; necessario contattarci via email.  <br/>\r\n<br/>\r\nEmail: enquiries@christinasofclarkston.co.uk  <br/>\r\n<br/>\r\nPurchasing Gift Vouchers  <br/>\r\nBuoni Regalo si comprano come qualsiasi altro prodotto venduto nel nostro negozio. &Egrave; possibile pagare utilizzando i sistemi di pagamento standard (s). Dopo l&#39;acquisto il valore dei Buono Regalo verr&agrave; accreditato sul tuo Account BUONI REGALO. Se disponi di fondi sul tuo Account BUONI REGALO, si noter&agrave; che l&#39;importo viene indicato nel box del Carrello, e fornisce anche un link a una pagina dove &egrave; possibile inviare il Buono Regalo a qualcuno via e-mail.'),
(17, 9, 'fr', 'Confidentialité', 'Nous nous engageons &agrave; prot&eacute;ger votre vie priv&eacute;e et donn&eacute;es personnelles. Nous n&#39;utiliserons les renseignements que nous recueillons &agrave; votre sujet l&eacute;galement (conform&eacute;ment &agrave; la Loi sur la protection des donn&eacute;es de 1998) et selon la laquelle? Web Trader Code de pratique. <br/>\r\n<br/>\r\nNous recueillons des informations sur vous pour 2 raisons: premi&egrave;rement, pour traiter votre commande et le deuxi&egrave;me, pour vous offrir le meilleur service possible. nkn <br/>\r\n<br/>\r\nNous ne serons pas e-mail &agrave; l&#39;avenir &agrave; moins que vous nous avez donn&eacute; votre accord ou en rapport avec votre commande ou les questions de soins &agrave; la client&egrave;le. <br/>\r\n<br/>\r\nNous vous donnerons la possibilit&eacute; de refuser tout e-mail marketing de notre part ou d&#39;un autre op&eacute;rateur dans l&#39;avenir.  <br/>\r\n<br/>\r\nLe type de renseignements que nous recueillons &agrave; votre sujet en g&eacute;n&eacute;ral: votre nom adresse num&eacute;ro de t&eacute;l&eacute;phone de cr&eacute;dit adresse email d&eacute;tails de carte de suivi de votre adresse IP pour la pr&eacute;vention de la fraude de carte de cr&eacute;dit seulement <br/>\r\n<br/>\r\nnous ne serons jamais recueillir des renseignements confidentiels &agrave; votre sujet sans votre consentement explicite.  <br/>\r\n<br/>\r\nLes informations que nous d&eacute;tenons seront exactes et &agrave; jour.  <br/>\r\n<br/>\r\nVous pouvez v&eacute;rifier les informations que nous d&eacute;tenons sur vous en nous envoyant un courriel.  <br/>\r\n<br/>\r\nSi vous trouvez des inexactitudes que nous puissions supprimer ou de corriger promptement.  <br/>\r\n<br/>\r\nLes informations personnelles que nous d&eacute;tenons seront conserv&eacute;es en toute s&eacute;curit&eacute;, conform&eacute;ment &agrave; notre politique de s&eacute;curit&eacute; int&eacute;rieure (l&#39;information est toujours stock&eacute;e dans un format crypt&eacute; lors sur notre serveur ou PC) et de la loi et le lequel? Web Trader Code. <br/>\r\n<br/>\r\nSi nous avons l&#39;intention de transf&eacute;rer vos informations en dehors de la CEE (Espace &eacute;conomique europ&eacute;en), nous obtiendrons toujours votre consentement pr&eacute;alable. <br/>\r\n<br/>\r\nNous mai utiliser la technologie pour suivre les sch&eacute;mas de comportement des visiteurs de notre site. Cela peut inclure l&#39;aide d&#39;un &laquo;cookie&raquo; qui serait stock&eacute; sur votre navigateur. Vous pouvez g&eacute;n&eacute;ralement modifier votre navigateur pour emp&ecirc;cher cela. Les informations ainsi recueillies peuvent &ecirc;tre utilis&eacute;s pour vous identifier, sauf si vous modifiez les param&egrave;tres de votre navigateur. Nous pouvons et nous ne la trace des num&eacute;ros IP des ordinateurs utilisant notre serveur s&eacute;curis&eacute; comme un moyen de d&eacute;pistage et d&#39;&eacute;viter de possibles fraudes par carte de cr&eacute;dit. <br/>\r\n<br/>\r\nSi vous avez des questions ou commentaires &agrave; propos de confidentialit&eacute;, vous devez nous envoyer un courriel.  <br/>\r\n<br/>\r\nCourrier &eacute;lectronique: enquiries@christinasofclarkston.co.uk  <br/>\r\n<br/>\r\nAcheter des ch&egrave;ques cadeaux  <br/>\r\nCh&egrave;ques-cadeaux sont achet&eacute;s comme n&#39;importe quel autre article dans notre magasin. Vous pouvez les r&eacute;gler en utilisant les modes de paiement standard (s). Une fois l&#39;achat de la valeur du ch&egrave;que-cadeau sera ajout&eacute; &agrave; votre propre compte Gift Voucher. Si vous avez des fonds dans votre compte de ch&egrave;ques-cadeau, vous noterez que le montant s&#39;affiche alors dans le bloc du Panier, et fournit &eacute;galement un lien vers une page o&ugrave; vous pouvez envoyer le ch&egrave;que cadeau &agrave; quelqu&#39;un par e-mail.'),
(18, 9, 'es', 'Confidencialidad', 'Estamos comprometidos a proteger su privacidad y datos personales. S&oacute;lo utilizaremos la informaci&oacute;n que recopilamos sobre usted legalmente (de conformidad con la Ley de Protecci&oacute;n de Datos de 1998) y seg&uacute;n la cual? Web Trader C&oacute;digo de Pr&aacute;cticas. <br/>\r\n<br/>\r\nNosotros recopilamos informaci&oacute;n sobre usted por 2 razones: en primer lugar, para procesar su solicitud y en segundo lugar, para ofrecerle el mejor servicio posible. nkn <br/>\r\n<br/>\r\nNo vamos a e-mail que en el futuro a menos que usted nos ha dado su consentimiento o en relaci&oacute;n con su solicitud o problemas de atenci&oacute;n al cliente. <br/>\r\n<br/>\r\nLe daremos la oportunidad de rechazar cualquier correo electr&oacute;nico de marketing de nosotros o de otro operador en el futuro.  <br/>\r\n<br/>\r\nEl tipo de informaci&oacute;n recopilada sobre usted incluye: su nombre, direcci&oacute;n n&uacute;mero de tel&eacute;fono direcci&oacute;n de correo electr&oacute;nico de cr&eacute;dito / d&eacute;bito, el seguimiento de su direcci&oacute;n IP para la prevenci&oacute;n del fraude de tarjetas de cr&eacute;dito s&oacute;lo <br/>\r\n<br/>\r\nnunca podremos recopilar informaci&oacute;n acerca de usted sin su consentimiento expl&iacute;cito.  <br/>\r\n<br/>\r\nLa informaci&oacute;n que tenemos que ser precisos y actualizados.  <br/>\r\n<br/>\r\nPuede comprobar la informaci&oacute;n que tenemos sobre usted por correo electr&oacute;nico.  <br/>\r\n<br/>\r\nSi encuentra cualquier inexactitud vamos a suprimir o corregir de inmediato.  <br/>\r\n<br/>\r\nLa informaci&oacute;n personal que tenemos se mantendr&aacute; segura de acuerdo con nuestra pol&iacute;tica de seguridad interna (la informaci&oacute;n se almacena siempre en un formato cifrado, cuando en nuestro servidor o PC) y la ley y los que? Web Trader C&oacute;digo. <br/>\r\n<br/>\r\nSi tenemos la intenci&oacute;n de transferir su informaci&oacute;n fuera de la CEE (Espacio Econ&oacute;mico Europeo) s&oacute;lo ser&aacute; bajo su consentimiento. <br/>\r\n<br/>\r\nPodemos utilizar la tecnolog&iacute;a para rastrear los patrones de comportamiento de los visitantes de nuestro sitio. Esto puede incluir el uso de &quot;cookies&quot;, que se almacenan en su navegador. Generalmente, usted puede modificar su navegador para impedir que esto suceda. La informaci&oacute;n recopilada de esta manera puede ser utilizada para identificar a menos que modificar la configuraci&oacute;n del navegador. Podemos y hacer un seguimiento de n&uacute;meros de IP de los ordenadores que utilizan nuestro servidor seguro como una manera de localizar y evitar posibles fraudes de tarjetas de cr&eacute;dito. <br/>\r\n<br/>\r\nSi usted tiene cualquier pregunta o comentario acerca de la privacidad, puede enviarnos un email.  <br/>\r\n<br/>\r\nCorreo electr&oacute;nico: enquiries@christinasofclarkston.co.uk  <br/>\r\n<br/>\r\nCompra de vales de regalo  <br/>\r\nVales de regalo se compran como cualquier otro art&iacute;culo de nuestra tienda. Usted puede pagar por ellos utilizando cualquier m&eacute;todo de pago est&aacute;ndar (s). Una vez adquirido, el valor del cup&oacute;n de regalo se sumar&aacute; a su propia cuenta de vales de regalo personal. Si usted tiene fondos en su cuenta de vales de regalo, notar&aacute; que la cantidad ahora se muestra en el carro de la compra, y tambi&eacute;n proporciona un enlace a una p&aacute;gina donde usted puede enviar el vale de regalo a alguien por correo electr&oacute;nico.'),
(19, 10, 'es', 'Asistente de tallas', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>\r\n<meta name="ProgId" content="Word.Document"/>\r\n<meta name="Generator" content="Microsoft Word 11"/>\r\n<meta name="Originator" content="Microsoft Word 11"/>\r\n<link rel="File-List" href="file:///C:\\DOCUME~1\\amehmood\\LOCALS~1\\Temp\\msohtml1\\09\\clip_filelist.xml"/>\r\n<link rel="Edit-Time-Data" href="file:///C:\\DOCUME~1\\amehmood\\LOCALS~1\\Temp\\msohtml1\\09\\clip_editdata.mso"/><!--[if !mso]>\r\n<style>\r\nv\\:* {behavior:url(#default#VML);}\r\no\\:* {behavior:url(#default#VML);}\r\nw\\:* {behavior:url(#default#VML);}\r\n.shape {behavior:url(#default#VML);}\r\n</style>\r\n<![endif]--><!--[if gte mso 9]><xml>\r\n<w:WordDocument>\r\n<w:View>Normal</w:View>\r\n<w:Zoom>0</w:Zoom>\r\n<w:PunctuationKerning/>\r\n<w:ValidateAgainstSchemas/>\r\n<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n<w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n<w:Compatibility>\r\n<w:BreakWrappedTables/>\r\n<w:SnapToGridInCell/>\r\n<w:WrapTextWithPunct/>\r\n<w:UseAsianBreakRules/>\r\n<w:DontGrowAutofit/>\r\n<w:UseFELayout/>\r\n</w:Compatibility>\r\n<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n</w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n<w:LatentStyles DefLockedState="false" LatentStyleCount="156">\r\n</w:LatentStyles>\r\n</xml><![endif]--><style type="text/css">\r\n<!--\r\n/* Font Definitions */\r\n@font-face\r\n{font-family:Calibri;\r\npanose-1:2 15 5 2 2 2 4 3 2 4;\r\nmso-font-charset:0;\r\nmso-generic-font-family:swiss;\r\nmso-font-pitch:variable;\r\nmso-font-signature:-1610611985 1073750139 0 0 159 0;}\r\n@font-face\r\n{font-family:Verdana;\r\npanose-1:2 11 6 4 3 5 4 4 2 4;\r\nmso-font-charset:0;\r\nmso-generic-font-family:swiss;\r\nmso-font-pitch:variable;\r\nmso-font-signature:536871559 0 0 0 415 0;}\r\n/* Style Definitions */\r\np.MsoNormal, li.MsoNormal, div.MsoNormal\r\n{mso-style-parent:"";\r\nmargin:0in;\r\nmargin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:12.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:Calibri;\r\nmso-fareast-language:EN-US;}\r\np.bodytxt, li.bodytxt, div.bodytxt\r\n{mso-style-name:bodytxt;\r\nmso-margin-top-alt:auto;\r\nmargin-right:0in;\r\nmso-margin-bottom-alt:auto;\r\nmargin-left:0in;\r\nmso-pagination:widow-orphan;\r\nfont-size:12.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:Calibri;\r\nmso-fareast-language:EN-US;}\r\n@page Section1\r\n{size:8.5in 11.0in;\r\nmargin:1.0in 1.25in 1.0in 1.25in;\r\nmso-header-margin:.5in;\r\nmso-footer-margin:.5in;\r\nmso-paper-source:0;}\r\ndiv.Section1\r\n{page:Section1;}\r\n-->\r\n</style><!--[if gte mso 10]>\r\n<style>\r\n/* Style Definitions */\r\ntable.MsoNormalTable\r\n{mso-style-name:"Table Normal";\r\nmso-tstyle-rowband-size:0;\r\nmso-tstyle-colband-size:0;\r\nmso-style-noshow:yes;\r\nmso-style-parent:"";\r\nmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\nmso-para-margin:0in;\r\nmso-para-margin-bottom:.0001pt;\r\nmso-pagination:widow-orphan;\r\nfont-size:10.0pt;\r\nfont-family:"Times New Roman";\r\nmso-fareast-font-family:"Times New Roman";\r\nmso-ansi-language:#0400;\r\nmso-fareast-language:#0400;\r\nmso-bidi-language:#0400;}\r\n</style>\r\n<![endif]-->\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%" class="MsoNormalTable" style="width: 100%;">\r\n    <tbody>\r\n        <tr style="">\r\n            <td width="561" style="padding: 0in; width: 420.65pt;">\r\n            <p align="center" class="bodytxt" style="text-align: center;"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><span style="">&nbsp;</span><b><span style="color: rgb(192, 192, 192);">Children&rsquo;s Size Chart</span></b></span><b style="color: rgb(192, 192, 192);"><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></b></p>\r\n            <p style="color: rgb(192, 192, 192);" class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">These measurements are approximate and   useful only as a guide. </span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: rgb(192, 192, 192);">Sizings can differ from designer to   designer so if in doubt please just telephone us&nbsp;on 0141 644 3556 or by   e.mail on enquiries@christinasofclarkston.com . <span style="">&nbsp;</span>Our friendly &amp; experienced team will be   happy to advise you.</span></p>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: rgb(192, 192, 192);"></span></p>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: rgb(192, 192, 192);"><br/>\r\n            </span></p>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: rgb(192, 192, 192);"></span><span style="font-size: 9pt; font-family: Verdana; color: navy;"><o:p></o:p></span></p>\r\n            <table cellpadding="0" border="1" width="100%" class="MsoNormalTable" style="width: 100%;">\r\n                <tbody>\r\n                    <tr style="color: rgb(192, 192, 192);">\r\n                        <td width="100%" valign="top" colspan="5" style="padding: 0.75pt; width: 100%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Garments</span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Age</span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">3-6 mths<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">6-12 mths<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">12-18 mths<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">18-24 mths<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Chest</span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">43 cm<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">46 cm<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">48 cm<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">50 cm<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Weight </span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">5.5 kg<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">8 kg<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">11 kg<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">n/a<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Overall Height</span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><span style="color: rgb(192, 192, 192);">n/a</span><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">n/a<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">n/a<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">86 cm<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><o:p>&nbsp;</o:p></span></p>\r\n            <table cellpadding="0" border="1" width="100%" class="MsoNormalTable" style="width: 100%;">\r\n                <tbody>\r\n                    <tr style="color: rgb(192, 192, 192);">\r\n                        <td width="100%" valign="top" colspan="7" style="padding: 0.75pt; width: 100%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Shoes</span><span style="font-size: 9pt; font-family: Verdana;"> (Along the length of the sole)<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="21%" valign="top" style="padding: 0.75pt; width: 21%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Sizes</span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">0<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="12%" valign="top" style="padding: 0.75pt; width: 12%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">1<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">2<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="12%" valign="top" style="padding: 0.75pt; width: 12%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">3<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">4<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">5<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="21%" valign="top" style="padding: 0.75pt; width: 21%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><!--[if gte vml 1]><v:shapetype\r\n                        id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t"\r\n                        path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">\r\n                        <v:stroke joinstyle="miter"/>\r\n                        <v:formulas>\r\n                        <v:f eqn="if lineDrawn pixelLineWidth 0"/>\r\n                        <v:f eqn="sum @0 1 0"/>\r\n                        <v:f eqn="sum 0 0 @1"/>\r\n                        <v:f eqn="prod @2 1 2"/>\r\n                        <v:f eqn="prod @3 21600 pixelWidth"/>\r\n                        <v:f eqn="prod @3 21600 pixelHeight"/>\r\n                        <v:f eqn="sum @0 0 1"/>\r\n                        <v:f eqn="prod @6 1 2"/>\r\n                        <v:f eqn="prod @7 21600 pixelWidth"/>\r\n                        <v:f eqn="sum @8 21600 0"/>\r\n                        <v:f eqn="prod @7 21600 pixelHeight"/>\r\n                        <v:f eqn="sum @10 21600 0"/>\r\n                        </v:formulas>\r\n                        <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>\r\n                        <o:lock v:ext="edit" aspectratio="t"/>\r\n                        </v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_i1025" type="#_x0000_t75"\r\n                        style=&#39;width:2.25pt;height:2.25pt;visibility:visible&#39;>\r\n                        <v:imagedata src="file:///C:\\DOCUME~1\\amehmood\\LOCALS~1\\Temp\\msohtml1\\09\\clip_image001.wmz"\r\n                        o:title=""/>\r\n                        </v:shape><![endif]--><!--[if !vml]--><img height="3" width="3" alt="" src="file:///C:/DOCUME~1/amehmood/LOCALS~1/Temp/msohtml1/09/clip_image002.gif" v:shapes="Picture_x0020_1"/><!--[endif]--></span><span style="font-size: 9pt; font-family: Verdana; color: navy;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">birth-3m<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="12%" valign="top" style="padding: 0.75pt; width: 12%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">3-6m<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">6-12m<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="12%" valign="top" style="padding: 0.75pt; width: 12%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">12-18m<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">18-24m<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="14%" valign="top" style="padding: 0.75pt; width: 14%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">2yrs<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><o:p>&nbsp;</o:p></span></p>\r\n            <table cellpadding="0" border="1" width="100%" class="MsoNormalTable" style="width: 100%;">\r\n                <tbody>\r\n                    <tr style="color: rgb(192, 192, 192);">\r\n                        <td width="100%" valign="top" colspan="5" style="padding: 0.75pt; width: 100%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Hats</span><span style="font-size: 9pt; font-family: Verdana;"> (circumference of head)<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Sizes</span><span style="font-size: 9pt; font-family: Verdana;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">XXS<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">X/S<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Small<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">Medium<o:p></o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr style="">\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><!--[if gte vml 1]><v:shape\r\n                        id="Picture_x0020_2" o:spid="_x0000_i1026" type="#_x0000_t75" style=&#39;width:2.25pt;\r\n                        height:2.25pt;visibility:visible&#39;>\r\n                        <v:imagedata src="file:///C:\\DOCUME~1\\amehmood\\LOCALS~1\\Temp\\msohtml1\\09\\clip_image003.wmz"\r\n                        o:title=""/>\r\n                        </v:shape><![endif]--><!--[if !vml]--><img height="3" width="3" alt="" src="file:///C:/DOCUME~1/amehmood/LOCALS~1/Temp/msohtml1/09/clip_image002.gif" v:shapes="Picture_x0020_2"/><!--[endif]--></span><span style="font-size: 9pt; font-family: Verdana; color: navy;"><o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%;">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><span style="color: rgb(192, 192, 192);">42 cm</span> <o:p></o:p></span></p>\r\n                        </td>\r\n                        <td width="20%" valign="top" style="padding: 0.75pt; width: 20%; color: rgb(192, 192, 192);">\r\n                        <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana;">45 cm<o:p></o:p></span></p>\r\n                        </td>\r\n                        <td valign="top" style="border-style: none none inset; border-color: -moz-use-text-color; border-width: medium medium 1pt; padding: 0.75pt;">\r\n                        <p class="MsoNormal"><span style="font-size: 10pt; font-family: Verdana; color: navy;"><o:p>&nbsp;</o:p></span></p>\r\n                        </td>\r\n                        <td valign="top" style="border-style: none inset inset none; border-color: -moz-use-text-color; border-width: medium 1pt 1pt medium; padding: 0.75pt;">\r\n                        <p class="MsoNormal"><span style="font-size: 10pt; font-family: Verdana; color: navy;"><o:p>&nbsp;</o:p></span></p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            <p class="MsoNormal"><span style="font-size: 9pt; font-family: Verdana; color: navy;"><o:p></o:p></span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_downloads`
--

CREATE TABLE IF NOT EXISTS `cubecart_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL DEFAULT '0',
  `cart_order_id` varchar(32) NOT NULL DEFAULT '',
  `noDownloads` int(11) NOT NULL DEFAULT '0',
  `expire` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) NOT NULL DEFAULT '0',
  `accessKey` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cubecart_downloads`
--

INSERT INTO `cubecart_downloads` (`id`, `customerId`, `cart_order_id`, `noDownloads`, `expire`, `productId`, `accessKey`) VALUES
(4, 29, '100419-101233-1608', 0, 1271842329, 142, 'H5IeQd0Z');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_img_idx`
--

CREATE TABLE IF NOT EXISTS `cubecart_img_idx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cubecart_img_idx`
--

INSERT INTO `cubecart_img_idx` (`id`, `productId`, `img`) VALUES
(6, 95, '1264973887.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_inventory`
--

CREATE TABLE IF NOT EXISTS `cubecart_inventory` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(60) NOT NULL DEFAULT '',
  `quantity` int(16) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  `overview` longtext NOT NULL,
  `feature` longtext NOT NULL,
  `image` varchar(250) NOT NULL DEFAULT '',
  `noImages` int(11) NOT NULL DEFAULT '0',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00',
  `name` varchar(250) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL,
  `cat_id` int(16) NOT NULL DEFAULT '0',
  `popularity` bigint(64) NOT NULL DEFAULT '0',
  `sale_price` decimal(30,2) NOT NULL DEFAULT '0.00',
  `stock_level` int(11) DEFAULT '0',
  `useStockLevel` int(11) DEFAULT '1',
  `digital` int(11) NOT NULL DEFAULT '0',
  `digitalDir` varchar(255) DEFAULT NULL,
  `prodWeight` decimal(10,3) DEFAULT NULL,
  `taxType` int(11) DEFAULT NULL,
  `showFeatured` int(11) NOT NULL DEFAULT '1',
  `bestAccessories` tinyint(1) NOT NULL,
  `productMonth` int(11) NOT NULL,
  `friend_email` varchar(255) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=254 ;

--
-- Dumping data for table `cubecart_inventory`
--

INSERT INTO `cubecart_inventory` (`productId`, `productCode`, `quantity`, `description`, `overview`, `feature`, `image`, `noImages`, `price`, `name`, `id`, `cat_id`, `popularity`, `sale_price`, `stock_level`, `useStockLevel`, `digital`, `digitalDir`, `prodWeight`, `taxType`, `showFeatured`, `bestAccessories`, `productMonth`, `friend_email`) VALUES
(250, 'RED6174', 1, '<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><span style="FONT-FAMILY: &quot;Times&quot;, &quot;serif&quot;; FONT-SIZE: 18pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-fareast-language: EN-GB"><font size="3" face="Arial">This Throw Blanket is made from a wonderful 100% Polyester Fleece&nbsp;</font></span></span> </li>\r\n<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><font size="3">These fleece blankets / throws are light, warm and snuggly</font></span> </li>\r\n<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><font size="3">You will not be disappointed</font></span> </li>\r\n<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><font size="3">Comes in a zipped carry handled bag</font></span> </li>', '', '', '1329926308.jpg', 0, 15.99, 'Red Blanket', 0, 174, 27, 0.00, 5, 1, 0, '', 0.000, 1, 0, 0, 0, ''),
(251, 'BLUE174', 1, '<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><span style="FONT-FAMILY: &quot;Times&quot;, &quot;serif&quot;; FONT-SIZE: 18pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-fareast-language: EN-GB"><font size="3" face="Arial">This Throw Blanket is made from a wonderful 100% Polyester Fleece&nbsp;</font></span></span> </li>\r\n<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><font size="3">These fleece blankets / throws are light, warm and snuggly</font></span> </li>\r\n<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><font size="3">You will not be disappointed</font></span> </li>\r\n<li><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 10pt"><font size="3">Comes in a zipped carry handled bag</font></span> </li>', '', '', '1329926721.jpg', 0, 11.99, 'Blue Blanket', 0, 175, 13, 0.00, 0, 1, 0, '', 0.000, 1, 0, 1, 0, ''),
(252, 'PINH176', 1, '<p style="LINE-HEIGHT: normal; MARGIN-BOTTOM: 0pt" class="MsoNormal"><font face="Arial"><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 14pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-bidi-font-size: 11.0pt" lang="EN-US">Nice quality faux silk&nbsp;luxury&nbsp;decorative cushion covers.</span></font></p>\r\n<p style="LINE-HEIGHT: normal; MARGIN-BOTTOM: 0pt" class="MsoNormal"><span style="FONT-FAMILY: &quot;Arial&quot;, &quot;sans-serif&quot;; COLOR: black; FONT-SIZE: 14pt; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-bidi-font-size: 10.0pt" lang="EN-US"><font face="Arial">Size 45x45 cm (18x18&quot;)\r\n<p>&nbsp;</p>\r\n</font></span></p>', '', '', '1329927066.jpg', 0, 2.99, 'Pink Pattern Cushion Cover', 0, 176, 11, 0.00, 0, 1, 0, '', 0.000, 1, 0, 0, 0, ''),
(253, '25 7177', 1, '<p>&nbsp; </p>\r\n<p>25 Tealight Candles.</p>', '', '', '1330010738.png', 0, 3.99, '25 Tealight Candles', 0, 177, 16, 3.49, 0, 1, 0, '', 0.000, 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_inv_lang`
--

CREATE TABLE IF NOT EXISTS `cubecart_inv_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `prod_lang` varchar(20) NOT NULL DEFAULT '',
  `prod_master_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_iso_counties`
--

CREATE TABLE IF NOT EXISTS `cubecart_iso_counties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(4) NOT NULL DEFAULT '0',
  `abbrev` varchar(4) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=441 ;

--
-- Dumping data for table `cubecart_iso_counties`
--

INSERT INTO `cubecart_iso_counties` (`id`, `countryId`, `abbrev`, `name`) VALUES
(1, 226, 'AL', 'Alabama'),
(2, 226, 'AK', 'Alaska'),
(3, 226, 'AS', 'American Samoa'),
(4, 226, 'AZ', 'Arizona'),
(5, 226, 'AR', 'Arkansas'),
(6, 226, 'AF', 'Armed Forces Africa'),
(7, 226, 'AA', 'Armed Forces Americas'),
(8, 226, 'AC', 'Armed Forces Canada'),
(9, 226, 'AE', 'Armed Forces Europe'),
(10, 226, 'AM', 'Armed Forces Middle East'),
(11, 226, 'AP', 'Armed Forces Pacific'),
(12, 226, 'CA', 'California'),
(13, 226, 'CO', 'Colorado'),
(14, 226, 'CT', 'Connecticut'),
(15, 226, 'DE', 'Delaware'),
(16, 226, 'DC', 'District of Columbia'),
(17, 226, 'FM', 'Federated States Of Micronesia'),
(18, 226, 'FL', 'Florida'),
(19, 226, 'GA', 'Georgia'),
(20, 226, 'GU', 'Guam'),
(21, 226, 'HI', 'Hawaii'),
(22, 226, 'ID', 'Idaho'),
(23, 226, 'IL', 'Illinois'),
(24, 226, 'IN', 'Indiana'),
(25, 226, 'IA', 'Iowa'),
(26, 226, 'KS', 'Kansas'),
(27, 226, 'KY', 'Kentucky'),
(28, 226, 'LA', 'Louisiana'),
(29, 226, 'ME', 'Maine'),
(30, 226, 'MH', 'Marshall Islands'),
(31, 226, 'MD', 'Maryland'),
(32, 226, 'MA', 'Massachusetts'),
(33, 226, 'MI', 'Michigan'),
(34, 226, 'MN', 'Minnesota'),
(35, 226, 'MS', 'Mississippi'),
(36, 226, 'MO', 'Missouri'),
(37, 226, 'MT', 'Montana'),
(38, 226, 'NE', 'Nebraska'),
(39, 226, 'NV', 'Nevada'),
(40, 226, 'NH', 'New Hampshire'),
(41, 226, 'NJ', 'New Jersey'),
(42, 226, 'NM', 'New Mexico'),
(43, 226, 'NY', 'New York'),
(44, 226, 'NC', 'North Carolina'),
(45, 226, 'ND', 'North Dakota'),
(46, 226, 'MP', 'Northern Mariana Islands'),
(47, 226, 'OH', 'Ohio'),
(48, 226, 'OK', 'Oklahoma'),
(49, 226, 'OR', 'Oregon'),
(50, 226, 'PW', 'Palau'),
(51, 226, 'PA', 'Pennsylvania'),
(52, 226, 'PR', 'Puerto Rico'),
(53, 226, 'RI', 'Rhode Island'),
(54, 226, 'SC', 'South Carolina'),
(55, 226, 'SD', 'South Dakota'),
(56, 226, 'TN', 'Tennessee'),
(57, 226, 'TX', 'Texas'),
(58, 226, 'UT', 'Utah'),
(59, 226, 'VT', 'Vermont'),
(60, 226, 'VI', 'Virgin Islands'),
(61, 226, 'VA', 'Virginia'),
(62, 226, 'WA', 'Washington'),
(63, 226, 'WV', 'West Virginia'),
(64, 226, 'WI', 'Wisconsin'),
(65, 226, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NF', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 80, 'NDS', 'Niedersachsen'),
(80, 80, 'BAW', 'Baden-W?rttemberg'),
(81, 80, 'BAY', 'Bayern'),
(82, 80, 'BER', 'Berlin'),
(83, 80, 'BRG', 'Brandenburg'),
(84, 80, 'BRE', 'Bremen'),
(85, 80, 'HAM', 'Hamburg'),
(86, 80, 'HES', 'Hessen'),
(87, 80, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 80, 'NRW', 'Nordrhein-Westfalen'),
(89, 80, 'RHE', 'Rheinland-Pfalz'),
(90, 80, 'SAR', 'Saarland'),
(91, 80, 'SAS', 'Sachsen'),
(92, 80, 'SAC', 'Sachsen-Anhalt'),
(93, 80, 'SCN', 'Schleswig-Holstein'),
(94, 80, 'THE', 'Th?ringen'),
(95, 14, 'WIE', 'Wien'),
(96, 14, 'NO', 'Nieder?sterreich'),
(97, 14, 'OO', 'Ober?sterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'K?rnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 206, 'AG', 'Aargau'),
(105, 206, 'AI', 'Appenzell Innerrhoden'),
(106, 206, 'APP', 'Appenzell Ausserrhoden'),
(107, 206, 'BE', 'Bern'),
(108, 206, 'BLA', 'Basel-Landschaft'),
(109, 206, 'BS', 'Basel-Stadt'),
(110, 206, 'FR', 'Freiburg'),
(111, 206, 'GE', 'Genf'),
(112, 206, 'GL', 'Glarus'),
(113, 206, 'JUB', 'Graub?nden'),
(114, 206, 'JU', 'Jura'),
(115, 206, 'LU', 'Luzern'),
(116, 206, 'NEU', 'Neuenburg'),
(117, 206, 'NW', 'Nidwalden'),
(118, 206, 'OW', 'Obwalden'),
(119, 206, 'SG', 'St. Gallen'),
(120, 206, 'SH', 'Schaffhausen'),
(121, 206, 'SO', 'Solothurn'),
(122, 206, 'SZ', 'Schwyz'),
(123, 206, 'TG', 'Thurgau'),
(124, 206, 'TE', 'Tessin'),
(125, 206, 'UR', 'Uri'),
(126, 206, 'VD', 'Waadt'),
(127, 206, 'VS', 'Wallis'),
(128, 206, 'ZG', 'Zug'),
(129, 206, 'ZH', 'Z?rich'),
(130, 199, 'ACOR', 'A Coru?a'),
(131, 199, 'ALAV', 'Alava'),
(132, 199, 'ALBA', 'Albacete'),
(133, 199, 'ALIC', 'Alicante'),
(134, 199, 'ALME', 'Almeria'),
(135, 199, 'ASTU', 'Asturias'),
(136, 199, 'AVIL', 'Avila'),
(137, 199, 'BADA', 'Badajoz'),
(138, 199, 'BALE', 'Baleares'),
(139, 199, 'BARC', 'Barcelona'),
(140, 199, 'BURG', 'Burgos'),
(141, 199, 'CACE', 'Caceres'),
(142, 199, 'CADI', 'Cadiz'),
(143, 199, 'CANT', 'Cantabria'),
(144, 199, 'CAST', 'Castellon'),
(145, 199, 'CEUT', 'Ceuta'),
(146, 199, 'CIUD', 'Ciudad Real'),
(147, 199, 'CORD', 'Cordoba'),
(148, 199, 'CUEN', 'Cuenca'),
(149, 199, 'GIRO', 'Girona'),
(150, 199, 'GRAN', 'Granada'),
(151, 199, 'GUAD', 'Guadalajara'),
(152, 199, 'GUIP', 'Guipuzcoa'),
(153, 199, 'HUEL', 'Huelva'),
(154, 199, 'HUES', 'Huesca'),
(155, 199, 'JAEN', 'Jaen'),
(156, 199, 'LAR', 'La Rioja'),
(157, 199, 'LAS', 'Las Palmas'),
(158, 199, 'LEON', 'Leon'),
(159, 199, 'LLEI', 'Lleida'),
(160, 199, 'LUGO', 'Lugo'),
(161, 199, 'MADR', 'Madrid'),
(162, 199, 'MALA', 'Malaga'),
(163, 199, 'MELI', 'Melilla'),
(164, 199, 'MURC', 'Murcia'),
(165, 199, 'NAVA', 'Navarra'),
(166, 199, 'OURE', 'Ourense'),
(167, 199, 'PALE', 'Palencia'),
(168, 199, 'PONT', 'Pontevedra'),
(169, 199, 'SALA', 'Salamanca'),
(170, 199, 'SANT', 'Santa Cruz de Tenerife'),
(171, 199, 'SEGO', 'Segovia'),
(172, 199, 'SEVI', 'Sevilla'),
(173, 199, 'SORI', 'Soria'),
(174, 199, 'TARR', 'Tarragona'),
(175, 199, 'TERU', 'Teruel'),
(176, 199, 'TOLE', 'Toledo'),
(177, 199, 'VALE', 'Valencia'),
(178, 199, 'VALL', 'Valladolid'),
(179, 199, 'VIZC', 'Vizcaya'),
(180, 199, 'ZAMO', 'Zamora'),
(181, 199, 'ZARA', 'Zaragoza'),
(182, 225, 'ABE', 'Aberdeen'),
(183, 225, 'ABD', 'Aberdeenshire'),
(184, 225, 'AGY', 'Anglesey'),
(185, 225, 'ANS', 'Angus'),
(186, 225, 'ANT', 'Antrim'),
(187, 225, 'ARD', 'Ards'),
(188, 225, 'AGB', 'Argyll and Bute'),
(189, 225, 'ARM', 'Armagh'),
(190, 225, 'BLA', 'Ballymena'),
(191, 225, 'BLY', 'Ballymoney'),
(192, 225, 'BNB', 'Banbridge'),
(193, 225, 'BDG', 'Barking and Dagenham'),
(194, 225, 'BNE', 'Barnet'),
(195, 225, 'BNS', 'Barnsley'),
(196, 225, 'BAS', 'Bath and North East Somerset'),
(197, 225, 'BDF', 'Bedfordshire'),
(198, 225, 'BFS', 'Belfast'),
(199, 225, 'BEX', 'Bexley'),
(200, 225, 'BIR', 'Birmingham'),
(201, 225, 'BBD', 'Blackburn with Darwen'),
(202, 225, 'BPL', 'Blackpool'),
(203, 225, 'BGW', 'Blaenau Gwent'),
(204, 225, 'BOL', 'Bolton'),
(205, 225, 'BMH', 'Bournemouth'),
(206, 225, 'BRC', 'Bracknell Forest'),
(207, 225, 'BRD', 'Bradford'),
(208, 225, 'BEN', 'Brent'),
(209, 225, 'BGE', 'Bridgend'),
(210, 225, 'BNH', 'Brighton and Hove'),
(211, 225, 'BST', 'Bristol'),
(212, 225, 'BRY', 'Bromley'),
(213, 225, 'BKM', 'Buckinghamshire'),
(214, 225, 'BUR', 'Bury'),
(215, 225, 'CAY', 'Caerphilly'),
(216, 225, 'CLD', 'Calderdale'),
(217, 225, 'CAM', 'Cambridgeshire'),
(218, 225, 'CMD', 'Camden'),
(219, 225, 'CRF', 'Cardiff'),
(220, 225, 'CMN', 'Carmarthenshire'),
(221, 225, 'CKF', 'Carrickfergus'),
(222, 225, 'CSR', 'Castlereagh'),
(223, 225, 'CGN', 'Ceredigion'),
(224, 225, 'CHS', 'Cheshire'),
(225, 225, 'CLK', 'Clackmannanshire'),
(226, 225, 'CLR', 'Coleraine'),
(227, 225, 'CWY', 'Conwy'),
(228, 225, 'CKT', 'Cookstown'),
(229, 225, 'CON', 'Cornwall'),
(230, 225, 'COV', 'Coventry'),
(231, 225, 'CGV', 'Craigavon'),
(232, 225, 'CRY', 'Croydon'),
(233, 225, 'CMA', 'Cumbria'),
(234, 225, 'DAL', 'Darlington'),
(235, 225, 'DEN', 'Denbighshire'),
(236, 225, 'DER', 'Derby'),
(237, 225, 'DBY', 'Derbyshire'),
(238, 225, 'DRY', 'Derry'),
(239, 225, 'DEV', 'Devon'),
(240, 225, 'DNC', 'Doncaster'),
(241, 225, 'DOR', 'Dorset'),
(242, 225, 'DOW', 'Down'),
(243, 225, 'DUD', 'Dudley'),
(244, 225, 'DGY', 'Dumfries and Galloway'),
(245, 225, 'DND', 'Dundee'),
(246, 225, 'DGN', 'Dungannon'),
(247, 225, 'DUR', 'Durham'),
(248, 225, 'EAL', 'Ealing'),
(249, 225, 'EAY', 'East Ayrshire'),
(250, 225, 'EDU', 'East Dunbartonshire'),
(251, 225, 'ELN', 'East Lothian'),
(252, 225, 'ERW', 'East Renfrewshire'),
(253, 225, 'ERY', 'East Riding of Yorkshire'),
(254, 225, 'ESX', 'East Sussex'),
(255, 225, 'EDH', 'Edinburgh'),
(256, 225, 'ELS', 'Eilean Siar'),
(257, 225, 'ENF', 'Enfield'),
(258, 225, 'ESS', 'Essex'),
(259, 225, 'FAL', 'Falkirk'),
(260, 225, 'FER', 'Fermanagh'),
(261, 225, 'FIF', 'Fife'),
(262, 225, 'FLN', 'Flintshire'),
(263, 225, 'GAT', 'Gateshead'),
(264, 225, 'GLG', 'Glasgow'),
(265, 225, 'GLS', 'Gloucestershire'),
(266, 225, 'GRE', 'Greenwich'),
(267, 225, 'GSY', 'Guernsey'),
(268, 225, 'GWN', 'Gwynedd'),
(269, 225, 'HCK', 'Hackney'),
(270, 225, 'HAL', 'Halton'),
(271, 225, 'HMF', 'Hammersmith and Fulham'),
(272, 225, 'HAM', 'Hampshire'),
(273, 225, 'HRY', 'Haringey'),
(274, 225, 'HRW', 'Harrow'),
(275, 225, 'HPL', 'Hartlepool'),
(276, 225, 'HAV', 'Havering'),
(277, 225, 'HEF', 'Herefordshire'),
(278, 225, 'HRT', 'Hertfordshire'),
(279, 225, 'HLD', 'Highland'),
(280, 225, 'HIL', 'Hillingdon'),
(281, 225, 'HNS', 'Hounslow'),
(282, 225, 'IVC', 'Inverclyde'),
(283, 225, 'IOM', 'Isle of Man'),
(284, 225, 'IOW', 'Isle of Wight'),
(285, 225, 'IOS', 'Isles of Scilly'),
(286, 225, 'ISL', 'Islington'),
(287, 225, 'JSY', 'Jersey'),
(288, 225, 'KEC', 'Kensington and Chelsea'),
(289, 225, 'KEN', 'Kent'),
(290, 225, 'KHL', 'Kingston upon Hull'),
(291, 225, 'KTT', 'Kingston upon Thames'),
(292, 225, 'KIR', 'Kirklees'),
(293, 225, 'KWL', 'Knowsley'),
(294, 225, 'LBH', 'Lambeth'),
(295, 225, 'LAN', 'Lancashire'),
(296, 225, 'LRN', 'Larne'),
(297, 225, 'LDS', 'Leeds'),
(298, 225, 'LCE', 'Leicester'),
(299, 225, 'LEC', 'Leicestershire'),
(300, 225, 'LEW', 'Lewisham'),
(301, 225, 'LMV', 'Limavady'),
(302, 225, 'LIN', 'Lincolnshire'),
(303, 225, 'LSB', 'Lisburn'),
(304, 225, 'LIV', 'Liverpool'),
(305, 225, 'LND', 'London'),
(306, 225, 'LUT', 'Luton'),
(307, 225, 'MFT', 'Magherafelt'),
(308, 225, 'MAN', 'Manchester'),
(309, 225, 'MDW', 'Medway'),
(310, 225, 'MTY', 'Merthyr Tydfil'),
(311, 225, 'MRT', 'Merton'),
(312, 225, 'MDB', 'Middlesbrough'),
(313, 225, 'MLN', 'Midlothian'),
(314, 225, 'MIK', 'Milton Keynes'),
(315, 225, 'MON', 'Monmouthshire'),
(316, 225, 'MRY', 'Moray'),
(317, 225, 'MYL', 'Moyle'),
(318, 225, 'NTL', 'Neath Port Talbot'),
(319, 225, 'NET', 'Newcastle upon Tyne'),
(320, 225, 'NWM', 'Newham'),
(321, 225, 'NWP', 'Newport'),
(322, 225, 'NYM', 'Newry and Mourne'),
(323, 225, 'NTA', 'Newtownabbey'),
(324, 225, 'NFK', 'Norfolk'),
(325, 225, 'NTH', 'Northamptonshire'),
(326, 225, 'NAY', 'North Ayrshire'),
(327, 225, 'NDN', 'North Down'),
(328, 225, 'NEL', 'North East Lincolnshire'),
(329, 225, 'NLK', 'North Lanarkshire'),
(330, 225, 'NLN', 'North Lincolnshire'),
(331, 225, 'NSM', 'North Somerset'),
(332, 225, 'NTY', 'North Tyneside'),
(333, 225, 'NBL', 'Northumberland'),
(334, 225, 'NYK', 'North Yorkshire'),
(335, 225, 'NGM', 'Nottingham'),
(336, 225, 'NTT', 'Nottinghamshire'),
(337, 225, 'OLD', 'Oldham'),
(338, 225, 'OMH', 'Omagh'),
(339, 225, 'ORK', 'Orkney Islands'),
(340, 225, 'OXF', 'Oxfordshire'),
(341, 225, 'PEM', 'Pembrokeshire'),
(342, 225, 'PKN', 'Perthshire and Kinross'),
(343, 225, 'PTE', 'Peterborough'),
(344, 225, 'PLY', 'Plymouth'),
(345, 225, 'POL', 'Poole'),
(346, 225, 'POR', 'Portsmouth'),
(347, 225, 'POW', 'Powys'),
(348, 225, 'RDG', 'Reading'),
(349, 225, 'RDB', 'Redbridge'),
(350, 225, 'RCC', 'Redcar and Cleveland'),
(351, 225, 'RFW', 'Renfrewshire'),
(352, 225, 'RCT', 'Rhondda, Cynon, Taff'),
(353, 225, 'RIC', 'Richmond upon Thames'),
(354, 225, 'RCH', 'Rochdale'),
(355, 225, 'ROT', 'Rotherham'),
(356, 225, 'RUT', 'Rutland'),
(357, 225, 'SHN', 'Saint Helens'),
(358, 225, 'SLF', 'Salford'),
(359, 225, 'SAW', 'Sandwell'),
(360, 225, 'SCB', 'Scottish Borders'),
(361, 225, 'SFT', 'Sefton'),
(362, 225, 'SHF', 'Sheffield'),
(363, 225, 'ZET', 'Shetland Islands'),
(364, 225, 'SHR', 'Shropshire'),
(365, 225, 'SLG', 'Slough'),
(366, 225, 'SOL', 'Solihull'),
(367, 225, 'SOM', 'Somerset'),
(368, 225, 'STH', 'Southampton'),
(369, 225, 'SAY', 'South Ayrshire'),
(370, 225, 'SOS', 'Southend-on-Sea'),
(371, 225, 'SGC', 'South Gloucestershire'),
(372, 225, 'SLK', 'South Lanarkshire'),
(373, 225, 'STY', 'South Tyneside'),
(374, 225, 'SWK', 'Southwark'),
(375, 225, 'STS', 'Staffordshire'),
(376, 225, 'STG', 'Stirling'),
(377, 225, 'SKP', 'Stockport'),
(378, 225, 'STT', 'Stockton-on-Tees'),
(379, 225, 'STE', 'Stoke-on-Trent'),
(380, 225, 'STB', 'Strabane'),
(381, 225, 'SFK', 'Suffolk'),
(382, 225, 'SND', 'Sunderland'),
(383, 225, 'SRY', 'Surrey'),
(384, 225, 'STN', 'Sutton'),
(385, 225, 'SWA', 'Swansea'),
(386, 225, 'SWD', 'Swindon'),
(387, 225, 'TAM', 'Tameside'),
(388, 225, 'TFW', 'Telford and Wrekin'),
(389, 225, 'THR', 'Thurrock'),
(390, 225, 'TOB', 'Torbay'),
(391, 225, 'TOF', 'Torfaen'),
(392, 225, 'TWH', 'Tower Hamlets'),
(393, 225, 'TRF', 'Trafford'),
(394, 225, 'VGL', 'Vale of Glamorgan'),
(395, 225, 'WKF', 'Wakefield'),
(396, 225, 'WLL', 'Walsall'),
(397, 225, 'WFT', 'Waltham Forest'),
(398, 225, 'WND', 'Wandsworth'),
(399, 225, 'WRT', 'Warrington'),
(400, 225, 'WAR', 'Warwickshire'),
(401, 225, 'WBK', 'West Berkshire'),
(402, 225, 'WDU', 'West Dunbartonshire'),
(403, 225, 'WLN', 'West Lothian'),
(404, 225, 'WSM', 'Westminster'),
(405, 225, 'WSX', 'West Sussex'),
(406, 225, 'WGN', 'Wigan'),
(407, 225, 'WIL', 'Wiltshire'),
(408, 225, 'WNM', 'Windsor and Maidenhead'),
(409, 225, 'WRL', 'Wirral'),
(410, 225, 'WOK', 'Wokingham'),
(411, 225, 'WLV', 'Wolverhampton'),
(412, 225, 'WOR', 'Worcestershire'),
(413, 225, 'WRX', 'Wrexham'),
(414, 225, 'YOR', 'York'),
(415, 103, 'CW', 'Carlow'),
(416, 103, 'CN', 'Cavan'),
(417, 103, 'CE', 'Clare'),
(418, 103, 'C', 'Cork'),
(419, 103, 'DL', 'Donegal'),
(420, 103, 'D', 'Dublin'),
(421, 103, 'G', 'Galway'),
(422, 103, 'KY', 'Kerry'),
(423, 103, 'KE', 'Kildare'),
(424, 103, 'KK', 'Kilkenny'),
(425, 103, 'LS', 'Laoighis'),
(426, 103, 'LM', 'Leitrim'),
(427, 103, 'LK', 'Limerick'),
(428, 103, 'LD', 'Longford'),
(429, 103, 'LH', 'Louth'),
(430, 103, 'MO', 'Mayo'),
(431, 103, 'MH', 'Meath'),
(432, 103, 'MN', 'Monaghan'),
(433, 103, 'OY', 'Offaly'),
(434, 103, 'RN', 'Roscommon'),
(435, 103, 'SO', 'Sligo'),
(436, 103, 'TA', 'Tipperary'),
(437, 103, 'WD', 'Waterford'),
(438, 103, 'WH', 'Westmeath'),
(439, 103, 'WX', 'Wexford'),
(440, 103, 'WW', 'Wicklow');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_iso_countries`
--

CREATE TABLE IF NOT EXISTS `cubecart_iso_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL DEFAULT '',
  `printable_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`iso`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=242 ;

--
-- Dumping data for table `cubecart_iso_countries`
--

INSERT INTO `cubecart_iso_countries` (`id`, `iso`, `printable_name`, `iso3`, `numcode`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', 4),
(2, 'AL', 'Albania', 'ALB', 8),
(3, 'DZ', 'Algeria', 'DZA', 12),
(4, 'AS', 'American Samoa', 'ASM', 16),
(5, 'AD', 'Andorra', 'AND', 20),
(6, 'AO', 'Angola', 'AGO', 24),
(7, 'AI', 'Anguilla', 'AIA', 660),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 'ATG', 28),
(10, 'AR', 'Argentina', 'ARG', 32),
(11, 'AM', 'Armenia', 'ARM', 51),
(12, 'AW', 'Aruba', 'ABW', 533),
(13, 'AU', 'Australia', 'AUS', 36),
(14, 'AT', 'Austria', 'AUT', 40),
(15, 'AZ', 'Azerbaijan', 'AZE', 31),
(16, 'BS', 'Bahamas', 'BHS', 44),
(17, 'BH', 'Bahrain', 'BHR', 48),
(18, 'BD', 'Bangladesh', 'BGD', 50),
(19, 'BB', 'Barbados', 'BRB', 52),
(20, 'BY', 'Belarus', 'BLR', 112),
(21, 'BE', 'Belgium', 'BEL', 56),
(22, 'BZ', 'Belize', 'BLZ', 84),
(23, 'BJ', 'Benin', 'BEN', 204),
(24, 'BM', 'Bermuda', 'BMU', 60),
(25, 'BT', 'Bhutan', 'BTN', 64),
(26, 'BO', 'Bolivia', 'BOL', 68),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', 70),
(28, 'BW', 'Botswana', 'BWA', 72),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', 'BRA', 76),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 'BRN', 96),
(33, 'BG', 'Bulgaria', 'BGR', 100),
(34, 'BF', 'Burkina Faso', 'BFA', 854),
(35, 'BI', 'Burundi', 'BDI', 108),
(36, 'KH', 'Cambodia', 'KHM', 116),
(37, 'CM', 'Cameroon', 'CMR', 120),
(38, 'CA', 'Canada', 'CAN', 124),
(39, 'CV', 'Cape Verde', 'CPV', 132),
(40, 'KY', 'Cayman Islands', 'CYM', 136),
(41, 'CF', 'Central African Republic', 'CAF', 140),
(42, 'TD', 'Chad', 'TCD', 148),
(43, 'CL', 'Chile', 'CHL', 152),
(44, 'CN', 'China', 'CHN', 156),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', 'COL', 170),
(48, 'KM', 'Comoros', 'COM', 174),
(49, 'CG', 'Congo', 'COG', 178),
(50, 'CD', 'Congo, the Democratic Republic of the', 'COD', 180),
(51, 'CK', 'Cook Islands', 'COK', 184),
(52, 'CR', 'Costa Rica', 'CRI', 188),
(53, 'CI', 'Cote D''Ivoire', 'CIV', 384),
(54, 'HR', 'Croatia', 'HRV', 191),
(55, 'CU', 'Cuba', 'CUB', 192),
(56, 'CY', 'Cyprus', 'CYP', 196),
(57, 'CZ', 'Czech Republic', 'CZE', 203),
(58, 'DK', 'Denmark', 'DNK', 208),
(59, 'DJ', 'Djibouti', 'DJI', 262),
(60, 'DM', 'Dominica', 'DMA', 212),
(61, 'DO', 'Dominican Republic', 'DOM', 214),
(62, 'EC', 'Ecuador', 'ECU', 218),
(63, 'EG', 'Egypt', 'EGY', 818),
(64, 'SV', 'El Salvador', 'SLV', 222),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', 226),
(66, 'ER', 'Eritrea', 'ERI', 232),
(67, 'EE', 'Estonia', 'EST', 233),
(68, 'ET', 'Ethiopia', 'ETH', 231),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', 238),
(70, 'FO', 'Faroe Islands', 'FRO', 234),
(71, 'FJ', 'Fiji', 'FJI', 242),
(72, 'FI', 'Finland', 'FIN', 246),
(73, 'FR', 'France', 'FRA', 250),
(74, 'GF', 'French Guiana', 'GUF', 254),
(75, 'PF', 'French Polynesia', 'PYF', 258),
(76, 'TF', 'French Southern Territories', NULL, NULL),
(77, 'GA', 'Gabon', 'GAB', 266),
(78, 'GM', 'Gambia', 'GMB', 270),
(79, 'GE', 'Georgia', 'GEO', 268),
(80, 'DE', 'Germany', 'DEU', 276),
(81, 'GH', 'Ghana', 'GHA', 288),
(82, 'GI', 'Gibraltar', 'GIB', 292),
(83, 'GR', 'Greece', 'GRC', 300),
(84, 'GL', 'Greenland', 'GRL', 304),
(85, 'GD', 'Grenada', 'GRD', 308),
(86, 'GP', 'Guadeloupe', 'GLP', 312),
(87, 'GU', 'Guam', 'GUM', 316),
(88, 'GT', 'Guatemala', 'GTM', 320),
(89, 'GN', 'Guinea', 'GIN', 324),
(90, 'GW', 'Guinea-Bissau', 'GNB', 624),
(91, 'GY', 'Guyana', 'GUY', 328),
(92, 'HT', 'Haiti', 'HTI', 332),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', 336),
(95, 'HN', 'Honduras', 'HND', 340),
(96, 'HK', 'Hong Kong', 'HKG', 344),
(97, 'HU', 'Hungary', 'HUN', 348),
(98, 'IS', 'Iceland', 'ISL', 352),
(99, 'IN', 'India', 'IND', 356),
(100, 'ID', 'Indonesia', 'IDN', 360),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', 364),
(102, 'IQ', 'Iraq', 'IRQ', 368),
(103, 'IE', 'Ireland', 'IRL', 372),
(104, 'IL', 'Israel', 'ISR', 376),
(105, 'IT', 'Italy', 'ITA', 380),
(106, 'JM', 'Jamaica', 'JAM', 388),
(107, 'JP', 'Japan', 'JPN', 392),
(108, 'JO', 'Jordan', 'JOR', 400),
(109, 'KZ', 'Kazakhstan', 'KAZ', 398),
(110, 'KE', 'Kenya', 'KEN', 404),
(111, 'KI', 'Kiribati', 'KIR', 296),
(112, 'KP', 'Korea, Democratic People''s Republic of', 'PRK', 408),
(113, 'KR', 'Korea, Republic of', 'KOR', 410),
(114, 'KW', 'Kuwait', 'KWT', 414),
(115, 'KG', 'Kyrgyzstan', 'KGZ', 417),
(116, 'LA', 'Lao People''s Democratic Republic', 'LAO', 418),
(117, 'LV', 'Latvia', 'LVA', 428),
(118, 'LB', 'Lebanon', 'LBN', 422),
(119, 'LS', 'Lesotho', 'LSO', 426),
(120, 'LR', 'Liberia', 'LBR', 430),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', 434),
(122, 'LI', 'Liechtenstein', 'LIE', 438),
(123, 'LT', 'Lithuania', 'LTU', 440),
(124, 'LU', 'Luxembourg', 'LUX', 442),
(125, 'MO', 'Macao', 'MAC', 446),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
(127, 'MG', 'Madagascar', 'MDG', 450),
(128, 'MW', 'Malawi', 'MWI', 454),
(129, 'MY', 'Malaysia', 'MYS', 458),
(130, 'MV', 'Maldives', 'MDV', 462),
(131, 'ML', 'Mali', 'MLI', 466),
(132, 'MT', 'Malta', 'MLT', 470),
(133, 'MH', 'Marshall Islands', 'MHL', 584),
(134, 'MQ', 'Martinique', 'MTQ', 474),
(135, 'MR', 'Mauritania', 'MRT', 478),
(136, 'MU', 'Mauritius', 'MUS', 480),
(137, 'YT', 'Mayotte', NULL, NULL),
(138, 'MX', 'Mexico', 'MEX', 484),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', 583),
(140, 'MD', 'Moldova, Republic of', 'MDA', 498),
(141, 'MC', 'Monaco', 'MCO', 492),
(142, 'MN', 'Mongolia', 'MNG', 496),
(143, 'MS', 'Montserrat', 'MSR', 500),
(144, 'MA', 'Morocco', 'MAR', 504),
(145, 'MZ', 'Mozambique', 'MOZ', 508),
(146, 'MM', 'Myanmar', 'MMR', 104),
(147, 'NA', 'Namibia', 'NAM', 516),
(148, 'NR', 'Nauru', 'NRU', 520),
(149, 'NP', 'Nepal', 'NPL', 524),
(150, 'NL', 'Netherlands', 'NLD', 528),
(151, 'AN', 'Netherlands Antilles', 'ANT', 530),
(152, 'NC', 'New Caledonia', 'NCL', 540),
(153, 'NZ', 'New Zealand', 'NZL', 554),
(154, 'NI', 'Nicaragua', 'NIC', 558),
(155, 'NE', 'Niger', 'NER', 562),
(156, 'NG', 'Nigeria', 'NGA', 566),
(157, 'NU', 'Niue', 'NIU', 570),
(158, 'NF', 'Norfolk Island', 'NFK', 574),
(159, 'MP', 'Northern Mariana Islands', 'MNP', 580),
(160, 'NO', 'Norway', 'NOR', 578),
(161, 'OM', 'Oman', 'OMN', 512),
(162, 'PK', 'Pakistan', 'PAK', 586),
(163, 'PW', 'Palau', 'PLW', 585),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL),
(165, 'PA', 'Panama', 'PAN', 591),
(166, 'PG', 'Papua New Guinea', 'PNG', 598),
(167, 'PY', 'Paraguay', 'PRY', 600),
(168, 'PE', 'Peru', 'PER', 604),
(169, 'PH', 'Philippines', 'PHL', 608),
(170, 'PN', 'Pitcairn', 'PCN', 612),
(171, 'PL', 'Poland', 'POL', 616),
(172, 'PT', 'Portugal', 'PRT', 620),
(173, 'PR', 'Puerto Rico', 'PRI', 630),
(174, 'QA', 'Qatar', 'QAT', 634),
(175, 'RE', 'Reunion', 'REU', 638),
(176, 'RO', 'Romania', 'ROM', 642),
(177, 'RU', 'Russian Federation', 'RUS', 643),
(178, 'RW', 'Rwanda', 'RWA', 646),
(179, 'SH', 'Saint Helena', 'SHN', 654),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', 659),
(181, 'LC', 'Saint Lucia', 'LCA', 662),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', 666),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', 670),
(184, 'WS', 'Samoa', 'WSM', 882),
(185, 'SM', 'San Marino', 'SMR', 674),
(186, 'ST', 'Sao Tome and Principe', 'STP', 678),
(187, 'SA', 'Saudi Arabia', 'SAU', 682),
(188, 'SN', 'Senegal', 'SEN', 686),
(189, 'CS', 'Serbia and Montenegro', NULL, NULL),
(190, 'SC', 'Seychelles', 'SYC', 690),
(191, 'SL', 'Sierra Leone', 'SLE', 694),
(192, 'SG', 'Singapore', 'SGP', 702),
(193, 'SK', 'Slovakia', 'SVK', 703),
(194, 'SI', 'Slovenia', 'SVN', 705),
(195, 'SB', 'Solomon Islands', 'SLB', 90),
(196, 'SO', 'Somalia', 'SOM', 706),
(197, 'ZA', 'South Africa', 'ZAF', 710),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
(199, 'ES', 'Spain', 'ESP', 724),
(200, 'LK', 'Sri Lanka', 'LKA', 144),
(201, 'SD', 'Sudan', 'SDN', 736),
(202, 'SR', 'Suriname', 'SUR', 740),
(203, 'SJ', 'Svalbard and Jan Mayen', 'SJM', 744),
(204, 'SZ', 'Swaziland', 'SWZ', 748),
(205, 'SE', 'Sweden', 'SWE', 752),
(206, 'CH', 'Switzerland', 'CHE', 756),
(207, 'SY', 'Syrian Arab Republic', 'SYR', 760),
(208, 'TW', 'Taiwan, Province of China', 'TWN', 158),
(209, 'TJ', 'Tajikistan', 'TJK', 762),
(210, 'TZ', 'Tanzania, United Republic of', 'TZA', 834),
(211, 'TH', 'Thailand', 'THA', 764),
(212, 'TL', 'Timor-Leste', NULL, NULL),
(213, 'TG', 'Togo', 'TGO', 768),
(214, 'TK', 'Tokelau', 'TKL', 772),
(215, 'TO', 'Tonga', 'TON', 776),
(216, 'TT', 'Trinidad and Tobago', 'TTO', 780),
(217, 'TN', 'Tunisia', 'TUN', 788),
(218, 'TR', 'Turkey', 'TUR', 792),
(219, 'TM', 'Turkmenistan', 'TKM', 795),
(220, 'TC', 'Turks and Caicos Islands', 'TCA', 796),
(221, 'TV', 'Tuvalu', 'TUV', 798),
(222, 'UG', 'Uganda', 'UGA', 800),
(223, 'UA', 'Ukraine', 'UKR', 804),
(224, 'AE', 'United Arab Emirates', 'ARE', 784),
(225, 'GB', 'United Kingdom', 'GBR', 826),
(226, 'US', 'United States', 'USA', 840),
(227, 'UM', 'United States Minor Outlying Islands', NULL, NULL),
(228, 'UY', 'Uruguay', 'URY', 858),
(229, 'UZ', 'Uzbekistan', 'UZB', 860),
(230, 'VU', 'Vanuatu', 'VUT', 548),
(231, 'VE', 'Venezuela', 'VEN', 862),
(232, 'VN', 'Viet Nam', 'VNM', 704),
(233, 'VG', 'Virgin Islands, British', 'VGB', 92),
(234, 'VI', 'Virgin Islands, U.s.', 'VIR', 850),
(235, 'WF', 'Wallis and Futuna', 'WLF', 876),
(236, 'EH', 'Western Sahara', 'ESH', 732),
(237, 'YE', 'Yemen', 'YEM', 887),
(238, 'ZM', 'Zambia', 'ZMB', 894),
(239, 'ZW', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_modules`
--

CREATE TABLE IF NOT EXISTS `cubecart_modules` (
  `moduleId` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(10) NOT NULL DEFAULT '',
  `folder` varchar(30) NOT NULL DEFAULT '',
  `status` smallint(1) NOT NULL DEFAULT '0',
  `default` int(1) NOT NULL DEFAULT '0',
  KEY `moduleId` (`moduleId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cubecart_modules`
--

INSERT INTO `cubecart_modules` (`moduleId`, `module`, `folder`, `status`, `default`) VALUES
(1, 'shipping', 'Free_Shipping', 1, 0),
(2, 'gateway', 'Print_Order_Form', 0, 0),
(3, 'gateway', 'DirectPayment', 1, 1),
(4, 'gateway', 'moneybookers', 0, 0),
(5, 'gateway', 'PayPal', 0, 0),
(6, 'gateway', 'WorldPay', 0, 0),
(7, 'shipping', 'By_Price', 0, 0),
(8, 'shipping', 'Flat_Rate', 0, 0),
(9, 'shipping', 'By_Weight', 0, 0),
(10, 'shipping', 'Royal_Mail', 0, 0),
(11, 'shipping', 'Per_Item', 0, 0),
(12, 'gateway', 'ExpressCheckout', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_month`
--

CREATE TABLE IF NOT EXISTS `cubecart_month` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(250) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_options_bot`
--

CREATE TABLE IF NOT EXISTS `cubecart_options_bot` (
  `assign_id` int(32) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL DEFAULT '0',
  `option_id` int(32) NOT NULL DEFAULT '0',
  `value_id` int(32) NOT NULL DEFAULT '0',
  `option_price` decimal(30,2) NOT NULL DEFAULT '0.00',
  `option_symbol` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`assign_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=185 ;

--
-- Dumping data for table `cubecart_options_bot`
--

INSERT INTO `cubecart_options_bot` (`assign_id`, `product`, `option_id`, `value_id`, `option_price`, `option_symbol`) VALUES
(170, 259, 6, 51, 0.00, '~'),
(169, 259, 6, 50, 0.00, '~'),
(168, 259, 6, 49, 0.00, '~'),
(174, 254, 6, 52, 0.00, '~'),
(152, 255, 6, 40, 0.00, '~'),
(151, 255, 6, 22, 0.00, '~'),
(150, 254, 10, 45, 0.00, '~'),
(149, 254, 10, 44, 0.00, '~'),
(148, 254, 10, 38, 0.00, '~'),
(147, 254, 10, 39, 0.00, '~'),
(141, 250, 6, 13, 0.00, '~'),
(142, 252, 6, 13, 0.00, '~'),
(143, 252, 6, 14, 0.00, '~'),
(144, 253, 6, 13, 0.00, '~'),
(145, 253, 6, 14, 0.00, '~'),
(146, 253, 6, 43, 0.00, '~'),
(153, 255, 6, 25, 0.00, '~'),
(154, 255, 11, 46, 0.00, '~'),
(155, 255, 11, 47, 0.00, '~'),
(156, 256, 11, 46, 0.00, '~'),
(157, 256, 8, 47, 0.00, '~'),
(158, 257, 8, 46, 0.00, '~'),
(159, 257, 8, 47, 0.00, '~'),
(160, 257, 6, 22, 0.00, '~'),
(161, 257, 6, 40, 0.00, '~'),
(162, 257, 6, 25, 0.00, '~'),
(163, 258, 8, 46, 0.00, '~'),
(164, 258, 8, 47, 0.00, '~'),
(165, 258, 6, 40, 0.00, '~'),
(166, 258, 6, 25, 0.00, '~'),
(171, 259, 10, 38, 0.00, '~'),
(172, 259, 10, 39, 0.00, '~'),
(173, 259, 6, 48, 0.00, '~'),
(175, 254, 6, 53, 0.00, '~'),
(176, 254, 8, 54, 0.00, '~'),
(177, 261, 10, 38, 0.00, '~'),
(178, 261, 10, 39, 0.00, '~'),
(179, 263, 6, 52, 0.00, '~'),
(180, 263, 6, 53, 0.00, '~'),
(181, 263, 6, 55, 0.00, '~'),
(182, 263, 6, 56, 0.00, '~');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_options_mid`
--

CREATE TABLE IF NOT EXISTS `cubecart_options_mid` (
  `value_id` int(16) NOT NULL AUTO_INCREMENT,
  `value_name` varchar(30) NOT NULL DEFAULT '',
  `father_id` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `cubecart_options_mid`
--

INSERT INTO `cubecart_options_mid` (`value_id`, `value_name`, `father_id`) VALUES
(16, 'AMBER', 8),
(15, '100w', 6),
(14, '60w', 6),
(19, 'BLUE', 8),
(18, 'YELLOW', 8),
(17, 'PINK', 8),
(13, '40w', 6),
(12, '25w', 6),
(20, 'GREEN', 8),
(21, 'RED', 8),
(22, '35w', 6),
(23, '110w', 6),
(24, '53w', 6),
(25, '150w', 6),
(26, '200w', 6),
(27, '300w', 6),
(28, '500w', 6),
(29, '20w', 6),
(30, '50w', 6),
(31, 'SPOT', 9),
(32, 'FLOOD', 9),
(33, 'PURPLE', 8),
(34, 'LILAC', 8),
(35, '15W', 6),
(52, '7W', 6),
(37, '12W', 6),
(38, 'ES', 10),
(39, 'BC', 10),
(40, '70w', 6),
(41, '250w', 6),
(42, '400w', 6),
(43, '75W', 6),
(44, 'SBC', 10),
(45, 'SES', 10),
(46, 'WDL(830)', 11),
(47, 'NDL(942)', 11),
(48, '8W', 6),
(49, '12W', 6),
(50, '16W', 6),
(51, '20W', 6),
(53, '9W', 6),
(54, 'WARM WHITE (827)', 8),
(55, '11W', 6),
(56, '14W', 6),
(57, '10Kg', 12),
(58, '15KG', 12);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_options_top`
--

CREATE TABLE IF NOT EXISTS `cubecart_options_top` (
  `option_id` int(16) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cubecart_options_top`
--

INSERT INTO `cubecart_options_top` (`option_id`, `option_name`) VALUES
(10, 'CAP TYPE'),
(8, 'COLOUR'),
(6, 'Watts'),
(9, 'LAMP TYPE'),
(11, 'COLOUR'),
(12, 'Weight');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_order_inv`
--

CREATE TABLE IF NOT EXISTS `cubecart_order_inv` (
  `productId` int(11) NOT NULL DEFAULT '0',
  `productCode` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(225) NOT NULL DEFAULT '',
  `quantity` int(32) NOT NULL DEFAULT '0',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00',
  `cart_order_id` varchar(30) NOT NULL DEFAULT '',
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `product_options` text NOT NULL,
  `digital` int(1) NOT NULL DEFAULT '0',
  `stockUpdated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=175 ;

--
-- Dumping data for table `cubecart_order_inv`
--

INSERT INTO `cubecart_order_inv` (`productId`, `productCode`, `name`, `quantity`, `price`, `cart_order_id`, `id`, `product_options`, `digital`, `stockUpdated`) VALUES
(3, 'PROY25', 'Product Name', 2, 50.00, '090601-164347-9486', 1, '', 0, 0),
(8, 'G21', 'Product Name', 2, 50.00, '090601-164347-9486', 2, '', 0, 0),
(9, 'PRO58', 'Product Name', 1, 25.00, '090601-174107-7441', 3, '', 0, 0),
(6, 'PROY25', 'Product Name', 1, 25.00, '090601-174107-7441', 4, '', 0, 0),
(9, 'PRO58', 'Product Name', 1, 25.00, '090601-175321-5214', 5, '', 0, 0),
(3, 'PROY25', 'Product Name', 1, 25.00, '090601-175422-4055', 6, '', 0, 0),
(6, 'PROY25', 'Product Name', 1, 25.00, '090601-175740-4789', 7, '', 0, 0),
(9, 'PRO58', 'Product Name', 1, 25.00, '090601-180341-1694', 8, '', 0, 0),
(3, 'PROY25', 'Product Name', 1, 25.00, '090601-180341-1694', 9, '', 0, 0),
(91, '3', 'Silver', 2, 24.00, '100129-115358-1698', 39, '', 0, 0),
(92, 'GU1144', 'GU10,20WATTS', 100, 900.00, '100128-113504-1815', 28, '', 0, 0),
(20, 'CHRP2', 'Abbie', 2, 24.00, '091016-055722-5883', 18, 'Large - Comfortable\r\n', 0, 0),
(91, '3', 'Silver', 2, 24.00, '100129-100854-2962', 38, '', 0, 0),
(20, 'CHRP2', 'Abbie', 1, 12.00, '091029-062227-7660', 20, 'Large - Comfortable\r\n', 0, 0),
(93, '90', 'Wall', 1, 100.00, '100129-093801-2137', 47, '', 0, 0),
(20, 'CHRP2', 'Abbie', 2, 20.00, '091030-130627-7856', 23, 'Colour - Pink\r\nSize Option - 3-6 months\r\n', 0, 0),
(84, '1', 'LAPTOP', 5, 1875.00, '100120-162254-5576', 25, '', 0, 0),
(83, 'MY 825', 'My ilver Bulb', 1, 90.00, '100125-115555-5379', 27, '', 0, 0),
(92, 'GU1144', 'GU10,20WATTS', 1, 9.00, '100129-115358-1698', 40, '', 0, 0),
(92, 'GU1144', 'GU10,20WATTS', 2, 18.00, '100129-123806-2898', 55, '', 0, 0),
(97, 'GLS5140', 'GLS CLEAR ES (SCREW) 60W', 50, 22.50, '100201-130447-9769', 58, '', 0, 0),
(106, 'GLST138', 'GLS CLEAR BC (BAYONET) 200W', 1, 1.10, '100201-140454-6728', 60, '', 0, 0),
(106, 'GLST138', 'GLS CLEAR BC (BAYONET) 200W', 1, 1.10, '100201-160457-1291', 61, '', 0, 0),
(104, 'GLSF140', 'GLS CLEAR BC (BAYONET) 100W', 150, 67.50, '100202-112820-3930', 63, '', 0, 0),
(185, '154M177', '154 T8 4ft 36W daylight fluorescent tube', 60, 432.00, '100211-133121-1152', 70, '', 0, 0),
(208, '2D S184', '2D 16W 2-pin GR8 827 warm white', 2, 14.40, '100216-090801-5284', 83, '', 0, 0),
(223, 'PYGX190', 'PYGMY LAMPS (SMALL BAYONET) 15W 110V', 10, 5.00, '100216-092549-3624', 80, '', 0, 0),
(9, 'CHAP12', 'Charger', 2, 866.00, '100409-184803-8032', 86, '', 0, 0),
(142, 'N97', 'Nokia N97', 1, 225.00, '100419-101233-1608', 90, '', 1, 0),
(146, 'N97', 'Nokia N97', 1, 275.00, '100421-153201-6279', 93, '', 0, 0),
(220, 'IPODC08', '3 x CLEAR LCD SCREEN PROTECTOR FOR IPHONE 3G/3Gs', 2, 3.98, '100905-113401-7453', 104, '', 0, 0),
(246, 'MainC-SA01-2T', 'Mains Charger for Samsung D520/ D840/ D900i/ E250/ E900', 1, 2.99, '101001-091552-5049', 156, '', 0, 0),
(249, 'IPOD03-2T', 'UK main+car charger+USB cable for iPOD/iPHONE/iTouch', 1, 3.99, '101001-101642-3087', 160, '', 0, 0),
(249, 'IPOD03-2T', 'UK main+car charger+USB cable for iPOD/iPHONE/iTouch', 1, 3.99, '101005-151429-1988', 163, '', 0, 0),
(248, 'CReasder01-2T', 'Memory Card Reader Mini SD MMC Mobile SDHC M2 TF XD CF', 1, 2.99, '101007-101603-3063', 166, '', 0, 0),
(249, 'IPOD03-2T', 'UK main+car charger+USB cable for iPOD/iPHONE/iTouch', 1, 3.99, '101007-173955-6533', 168, '', 0, 0),
(223, 'MOUSE02', 'USB WIRELESS Optical Mini Cordless MOUSE', 1, 5.99, '101008-135802-9585', 170, '', 0, 0),
(230, 'BASA03-2T', 'BATTERY FOR SAMSUNG E780/D900/E480/E490/E690', 1, 2.99, '110707-132242-4648', 173, '', 0, 0),
(253, '25 7177', '25 Tealight Candles', 1, 3.49, '120307-111806-3249', 174, 'Watts - 40w\r\n', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_order_sum`
--

CREATE TABLE IF NOT EXISTS `cubecart_order_sum` (
  `cart_order_id` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) NOT NULL DEFAULT '',
  `add_1` varchar(225) NOT NULL DEFAULT '',
  `add_2` varchar(225) NOT NULL DEFAULT '',
  `town` varchar(225) NOT NULL DEFAULT '',
  `county` varchar(225) NOT NULL DEFAULT '',
  `postcode` varchar(225) NOT NULL DEFAULT '',
  `country` varchar(225) NOT NULL DEFAULT '',
  `name_d` varchar(225) NOT NULL DEFAULT '',
  `add_1_d` varchar(225) NOT NULL DEFAULT '',
  `add_2_d` varchar(225) NOT NULL DEFAULT '',
  `town_d` varchar(225) NOT NULL DEFAULT '',
  `county_d` varchar(225) NOT NULL DEFAULT '',
  `postcode_d` varchar(225) NOT NULL DEFAULT '',
  `country_d` varchar(225) NOT NULL DEFAULT '',
  `phone` varchar(225) NOT NULL DEFAULT '',
  `mobile` varchar(255) DEFAULT NULL,
  `subtotal` decimal(30,2) NOT NULL DEFAULT '0.00',
  `prod_total` decimal(30,2) NOT NULL DEFAULT '0.00',
  `total_tax` decimal(30,2) NOT NULL DEFAULT '0.00',
  `total_ship` decimal(30,2) NOT NULL DEFAULT '0.00',
  `status` int(16) NOT NULL DEFAULT '1',
  `sec_order_id` varchar(30) DEFAULT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL DEFAULT '0',
  `email` varchar(225) NOT NULL DEFAULT '',
  `comments` text,
  `ship_date` varchar(50) DEFAULT NULL,
  `shipMethod` varchar(255) DEFAULT NULL,
  `gateway` varchar(50) NOT NULL DEFAULT '',
  `currency` varchar(5) NOT NULL DEFAULT '',
  `customer_comments` text,
  PRIMARY KEY (`cart_order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubecart_order_sum`
--

INSERT INTO `cubecart_order_sum` (`cart_order_id`, `customer_id`, `name`, `add_1`, `add_2`, `town`, `county`, `postcode`, `country`, `name_d`, `add_1_d`, `add_2_d`, `town_d`, `county_d`, `postcode_d`, `country_d`, `phone`, `mobile`, `subtotal`, `prod_total`, `total_tax`, `total_ship`, `status`, `sec_order_id`, `ip`, `time`, `email`, `comments`, `ship_date`, `shipMethod`, `gateway`, `currency`, `customer_comments`) VALUES
('090601-164347-9486', 2, 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', '000-000-0000', '00-000000-00', 100.00, 100.00, 0.00, 0.00, 1, NULL, '127.0.0.1', 1243856627, 'jiqbal@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'Print_Order_Form', '', ''),
('090601-174107-7441', 2, 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', '000-000-0000', '00-000000-00', 50.00, 50.00, 0.00, 0.00, 1, NULL, '127.0.0.1', 1243860067, 'jiqbal@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'Print_Order_Form', '', ''),
('090601-175321-5214', 2, 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', '000-000-0000', '00-000000-00', 25.00, 25.00, 0.00, 0.00, 1, NULL, '127.0.0.1', 1243860801, 'jiqbal@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'Print_Order_Form', '', 'ss'),
('090601-175422-4055', 2, 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', '000-000-0000', '00-000000-00', 25.00, 25.00, 0.00, 0.00, 1, NULL, '127.0.0.1', 1243860862, 'jiqbal@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'Print_Order_Form', '', ''),
('090601-175740-4789', 2, 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', '000-000-0000', '00-000000-00', 25.00, 25.00, 0.00, 0.00, 1, NULL, '127.0.0.1', 1243861060, 'jiqbal@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'Print_Order_Form', '', ''),
('090601-180341-1694', 2, 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', 'Mr Javed Iqbal', '-', '-', '-', '-', '54000', 'Pakistan', '000-000-0000', '00-000000-00', 50.00, 50.00, 0.00, 0.00, 1, NULL, '127.0.0.1', 1243861421, 'jiqbal@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'Print_Order_Form', '', ''),
('100129-115358-1698', 19, 'asdf test name', 'asdfsadfasdf', '', 'asdfasdf', 'asdfsadf', '234234', 'United Kingdom', 'asdf test name', 'asdfsadfasdf', '', 'asdfasdf', 'asdfsadf', '234234', 'United Kingdom', '234234234234', '234234234', 33.00, 37.07, 4.20, 3.99, 1, NULL, '203.215.176.245', 1264766038, 'test@testname.tes', NULL, NULL, 'Free for Orders Over 60', 'PayPal', '', ''),
('100128-113504-1815', 15, 'mr ari chara', '23 tottenham lane', '', 'london', 'london', 'n15 4uf', 'United Kingdom', 'MR AA AA', 'AAA', '', 'AAA', 'AAA', 'AAA', 'United Kingdom', '02081111234', '07526666798', 900.00, 900.00, 0.00, 0.00, 1, NULL, '82.35.203.215', 1264715452, 'hazzer_2004@hotmail.com', NULL, NULL, 'Free for Orders Over 60', 'PayPal', '', ''),
('091016-055722-5883', 4, 'Mr PAUL IANNIELLO', '42 RAVENNSCOURT', 'THORNTONHALL', 'GLASGOW', 'SCOTLAND', 'G74 5AZ', 'United Kingdom', 'Mr PAUL IANNIELLO', '42 RAVENNSCOURT', 'THORNTONHALL', 'GLASGOW', 'SCOTLAND', 'G74 5AZ', 'United Kingdom', '0141 644 3556', '07989304117', 24.00, 28.20, 4.20, 0.00, 1, NULL, '86.169.101.26', 1255669042, 'forte25@hotmail.com', NULL, NULL, 'Free Shipping', 'PayPal', '', ''),
('100129-100854-2962', 16, 'Mr usman butt', 'dfgdfg', '', 'dfgdfg', 'dfgdgdfg', '345345345', 'Zambia', 'Mr jeff mathew', 'a', 'a', 'a', 'a', '0000000', 'United Kingdom', '1234786178378123', '34534534534534534', 24.00, 25.19, 0.00, 3.99, 1, NULL, '203.215.176.245', 1264763673, 'bandesha@gmail.com', NULL, NULL, 'Free for Orders Over 60', 'PayPal', '', ''),
('091029-062227-7660', 4, 'Mr PAUL IANNIELLO', '42 RAVENNSCOURT', 'THORNTONHALL', 'GLASGOW', 'SCOTLAND', 'G74 5AZ', 'United Kingdom', 'Mr PAUL IANNIELLO', '42 RAVENNSCOURT', 'THORNTONHALL', 'GLASGOW', 'SCOTLAND', 'G74 5AZ', 'United Kingdom', '0141 644 3556', '07989304117', 12.00, 14.10, 2.10, 0.00, 1, NULL, '86.151.119.167', 1256797347, 'forte25@hotmail.com', NULL, NULL, 'Free Shipping', 'PayPal', '', ''),
('100129-093801-2137', 21, 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', 'Mr jeff mathew', 'a', 'a', 'a', 'a', '0000000', 'United Kingdom', '4476978998789897', '4479878998789983', 100.00, 105.75, 17.50, 0.00, 1, NULL, '203.215.176.245', 1264768855, 'buttumar1@gmail.com', NULL, NULL, 'Free for Orders Over 60', 'PayPal', '', ''),
('091030-130627-7856', 4, 'Mr PAUL IANNIELLO', 'FGFGFGHGFGG', 'THORNTONHALL', 'GLASGOW', 'SCOTLAND', 'G74 5AZ', 'United Kingdom', 'Mr PAUL IANNIELLO', 'FGFGFGHGFGG', 'THORNTONHALL', 'GLASGOW', 'SCOTLAND', 'G74 5AZ', 'United Kingdom', '0141 644 3556', '07989304117', 20.00, 23.50, 3.50, 0.00, 1, NULL, '81.137.253.182', 1256910300, 'forte25@hotmail.com', NULL, NULL, 'Free Shipping', 'PayPal', '', ''),
('100120-162254-5576', 10, 'Mr umar amaan', 'Middlesex', '', 'London', 'UB4 0NA', 'AB11', 'United Kingdom', 'Mr umar amaan', 'Middlesex', '', 'London', 'UB4 0NA', 'AB11', 'United Kingdom', '447872389789231', '', 1875.00, 2203.12, 328.12, 0.00, 1, NULL, '203.215.176.245', 1264004597, 'buttumar1@gmail.com', NULL, NULL, 'Free Shipping', 'PayPal', '', 'qweqeqwe'),
('100125-115555-5379', 11, 'dr h ca', '23 road', '', 'tottenham', 'london', 'n15 5ep', 'United Kingdom', 'dr h ca', '23 road', '', 'tottenham', 'london', 'n15 5ep', 'United Kingdom', '07526666798', '', 90.00, 105.75, 15.75, 0.00, 1, NULL, '82.35.203.215', 1264420565, 'hazzer_2004@hotmail.com', NULL, NULL, 'Free Shipping', 'PayPal', '', ''),
('100129-123806-2898', 23, 'Mr jeff Brown', 'q', 'q', 'q', 'qq', 'aa3bb2', 'United Kingdom', 'Mr jeff Brown', 'q', 'q', 'q', 'qq', 'aa3bb2', 'United Kingdom', '0000000000', '', 18.00, 21.99, 0.00, 3.99, 1, NULL, '203.215.176.245', 1264771848, 'jbrown@titlewebsolutions.com', NULL, NULL, 'Free for Orders Over 60', 'PayPal', '', 'Test Payment'),
('100201-130447-9769', 21, 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', '4476978998789897', '4479878998789983', 22.50, 26.49, 0.00, 3.99, 1, NULL, '203.215.176.245', 1265032793, 'buttumar1@gmail.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', 'bnmhjgh'),
('100201-140454-6728', 21, 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', '4476978998789897', '4479878998789983', 1.10, 5.09, 0.00, 3.99, 1, NULL, '203.215.176.245', 1265033113, 'buttumar1@gmail.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100201-160457-1291', 21, 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', '4476978998789897', '4479878998789983', 1.10, 5.09, 0.00, 3.99, 1, NULL, '203.215.176.245', 1265040297, 'buttumar1@gmail.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100202-112820-3930', 21, 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', 'Mr umar butt', 'London', '', 'Midd', 'Middlesex', '447239878239', 'United Kingdom', '4476978998789897', '4479878998789983', 67.50, 67.50, 0.00, 0.00, 1, NULL, '203.215.176.245', 1265110100, 'buttumar1@gmail.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100211-133121-1152', 25, 'Mr Naveed Asghar', 'adsfadsfasdf', '', 'asdfasdf', 'adsfasdf', 'adsf234', 'United Kingdom', 'Mr Naveed Asghar', 'adsfadsfasdf', '', 'asdfasdf', 'adsfasdf', 'adsf234', 'United Kingdom', '13248435184231', '', 432.00, 432.00, 0.00, 0.00, 1, NULL, '203.215.176.245', 1265895081, 'nasghar@titlewebsolutions.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100216-090801-5284', 26, 'Mr Naveed Asghar', 'address', '', 'adsf', 'adsf', '0123', 'United Kingdom', 'Mr Naveed Asghar', 'address', '', 'adsf', 'adsf', '0123', 'United Kingdom', '01276 804 808', '', 14.40, 18.39, 0.00, 3.99, 1, NULL, '203.215.176.245', 1266326664, 'nasghar@titlewebsolutions.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100216-092549-3624', 26, 'Mr Naveed Asghar', 'address', '', 'adsf', 'adsf', '0123', 'United Kingdom', 'Mr Naveed Asghar', 'address', '', 'adsf', 'adsf', '0123', 'United Kingdom', '01276 804 808', '', 5.00, 8.99, 0.00, 3.99, 1, NULL, '203.215.176.245', 1266312349, 'nasghar@titlewebsolutions.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100409-184803-8032', 28, 'Mr John Alex', 'Middlesex', '', 'Kent', 'Manchester', '562121', 'United Kingdom', 'Mr John Alex', 'Middlesex', '', 'Kent', 'Manchester', '562121', 'United Kingdom', '+44326589666345', '+44326589666345', 866.00, 1017.55, 151.55, 0.00, 3, NULL, '192.168.1.142', 1270835283, 'steve@hotmail.com', '', '', 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100419-101233-1608', 29, 'Mr Mark Johnson', 'Dartford', '', 'Admirals Park', 'London', 'DA2 6QD', 'United Kingdom', 'Mr Mark Johnson', 'Dartford', '', 'Admirals Park', 'London', 'DA2 6QD', 'United Kingdom', '02088198584', '', 225.00, 264.38, 39.38, 0.00, 1, NULL, '203.215.176.245', 1271669529, 't.mark.john@gmail.com', NULL, NULL, '', 'PayPal', '', ''),
('100421-153201-6279', 29, 'Mr Mark Johnson', 'Dartford', '', 'Admirals Park', 'London', 'DA2 6QD', 'United Kingdom', 'Mr Mark Johnson', 'Dartford', '', 'Admirals Park', 'London', 'DA2 6QD', 'United Kingdom', '02088198584', '', 275.00, 323.12, 48.12, 0.00, 1, NULL, '203.215.177.225', 1271860389, 't.mark.john@gmail.com', NULL, NULL, 'Free for Orders Over 60.00', 'PayPal', '', ''),
('100905-113401-7453', 32, 'Mr Jagtej Juneja', '6 Garrod House', 'The Broadway', 'Southall', 'Middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 Garrod House', 'The Broadway', 'Southall', 'Middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 3.98, 3.98, 0.00, 0.00, 1, NULL, '91.104.40.79', 1283682841, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'PayPal', '', ''),
('101001-101642-3087', 35, 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 3.99, 3.99, 0.00, 0.00, 1, NULL, '109.157.54.26', 1285924726, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('101005-151429-1988', 35, 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 3.99, 3.99, 0.00, 0.00, 1, NULL, '109.157.54.26', 1286288134, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('101001-091552-5049', 34, 'Mr Naveed Asghar', 'aa', '', 'aa', 'aa', 'aa', 'United Kingdom', 'Mr Naveed Asghar', 'aa', '', 'aa', 'aa', 'aa', 'United Kingdom', '343434343434', '', 2.99, 2.99, 0.00, 0.00, 1, NULL, '203.215.176.245', 1285920986, 'nasghar@titlewebsolutions.com', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('101007-101603-3063', 35, 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 2.99, 2.99, 0.00, 0.00, 1, NULL, '83.217.105.194', 1286442999, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('101007-173955-6533', 35, 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 3.99, 3.99, 0.00, 0.00, 1, NULL, '91.104.2.174', 1286469640, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('101008-135802-9585', 35, 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 5.99, 5.99, 0.00, 0.00, 1, NULL, '109.157.54.26', 1286542714, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('110707-132242-4648', 36, 'Mr Mike Hayes', 'ABC', '', 'ABCC', 'ABBC', 'UB4 0Na', 'United Kingdom', 'Mr Mike Hayes', 'ABC', '', 'ABCC', 'ABBC', 'UB4 0Na', 'United Kingdom', '0245646546', '078797565', 2.99, 2.99, 0.00, 0.00, 1, NULL, '109.75.162.166', 1310041379, 'm.hayes.title@gmail.com', NULL, NULL, 'Free Shipping', 'DirectPayment', '', ''),
('120307-111806-3249', 35, 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', 'Mr Jagtej Juneja', '6 garrod house', '', 'southall', 'middlesex', 'ub1 1pl', 'United Kingdom', '07980874703', '', 3.49, 4.19, 0.70, 0.00, 1, NULL, '217.41.2.46', 1331119086, 'jagtejjuneja@hotmail.co.uk', NULL, NULL, 'Free Shipping', 'DirectPayment', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_search`
--

CREATE TABLE IF NOT EXISTS `cubecart_search` (
  `searchstr` varchar(255) NOT NULL DEFAULT '',
  `hits` int(64) NOT NULL DEFAULT '0',
  `id` int(64) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `cubecart_search`
--

INSERT INTO `cubecart_search` (`searchstr`, `hits`, `id`) VALUES
('ABBIE', 1, 1),
('TEST', 12, 2),
('PRODUCT', 3, 3),
('NO', 1, 4),
('', 676, 5),
('TS', 4, 6),
('TEAT', 1, 7),
('ASDFLKJASDL;KFJA;LSKDJFLA;KSDJFLK;ASDJFLKA;SDJF', 3, 8),
('ASDFASDF', 1, 9),
('ASDFSADF', 1, 10),
('LEAH', 3, 11),
('SEARCH', 3, 12),
('ATE', 1, 13),
('ASDFASDFASDF', 1, 14),
('PR', 4, 15),
('1', 4, 16),
('2', 1, 17),
('PC', 2, 18),
('LAPTOP', 1, 19),
('ENTER', 2, 20),
('CODE', 2, 21),
('NAME...', 2, 22),
('ADSFASDF', 2, 23),
('GU10', 3, 24),
('SILVER', 1, 25),
('BULB', 1, 26),
('ADSF', 1, 27),
('ZXC', 1, 28),
('GLS', 4, 29),
('SPOTLIGHTS', 1, 30),
('GOLF', 2, 31),
('BALS', 1, 32),
('BALL', 1, 33),
('GLOBE', 1, 34),
('CANDLES', 1, 35),
('5FT', 1, 36),
('2D', 1, 37),
('S184', 1, 38),
('XT9NO15Q', 2, 39),
('ER0TYQPK', 2, 40),
('HERE...', 2, 41),
('DFGD', 1, 42),
('NOKIA', 1, 43),
('E71', 1, 44),
('PHONE', 2, 45),
('ASD', 1, 46),
('1200', 1, 47),
('MD', 1, 48),
('SD', 1, 49),
('LED', 1, 50),
('MOUSE', 2, 51),
('IPOD', 2, 52),
('TOUCH', 2, 53),
('HTC', 1, 54),
('DESIRE', 1, 55),
('BLACKBERRY', 1, 56),
('DSI', 1, 57),
('MOBILE', 1, 58),
('CUSHION', 1, 59),
('COVER', 1, 60),
('BLUE', 1, 61);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_sessions`
--

CREATE TABLE IF NOT EXISTS `cubecart_sessions` (
  `sessId` varchar(32) NOT NULL DEFAULT '',
  `basket` text,
  `timeStart` int(11) NOT NULL DEFAULT '0',
  `timeLast` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `location` varchar(255) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  PRIMARY KEY (`sessId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubecart_sessions`
--

INSERT INTO `cubecart_sessions` (`sessId`, `basket`, `timeStart`, `timeLast`, `customer_id`, `location`, `lang`, `currency`) VALUES
('503c3057d6ae00c358aa31c9d9e2af4d', NULL, 1355949806, 1355949806, 0, '/globalClothing/index.php', NULL, NULL),
('b1a4cbdbf78dedf25c962d2b21641bd4', 'a:3:{s:11:"currentStep";s:1:"1";s:9:"stepLimit";s:1:"2";s:5:"conts";a:1:{s:7:"253:144";a:1:{s:8:"quantity";d:1;}}}', 1355947976, 1355948105, 0, '/jag-direct/index.php?act=viewProd&amp;productId=253', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_spambot`
--

CREATE TABLE IF NOT EXISTS `cubecart_spambot` (
  `uniqueId` varchar(32) NOT NULL,
  `spamCode` varchar(5) NOT NULL,
  `userIp` varchar(15) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uniqueId`),
  UNIQUE KEY `uniqueId` (`uniqueId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubecart_spambot`
--

INSERT INTO `cubecart_spambot` (`uniqueId`, `spamCode`, `userIp`, `time`) VALUES
('08729f8769a5a6d9da1936a42d48a859', 'ZZNFY', '217.41.2.46', 1331213187),
('cb1d75d3d328821b1d5a63ddea3ea321', 'ZOXQW', '159.253.145.142', 1331792383),
('341d6484ce93b201ef2eb7d25791faa9', 'JCWIQ', '159.253.145.142', 1331792384),
('fa0c8039e653046bdb533d1faecfb03c', 'B5TJP', '159.253.145.142', 1331792386),
('8629f212d3e451c00e4d5301c67414fd', 'N8UCH', '159.253.145.142', 1331792387),
('b35a88adff13caabb06a57e6207fe7fd', 'ASLC0', '159.253.145.142', 1331792390),
('bd4ef3b8d9c4819620454168ecae9d47', 'FEQQB', '38.100.21.21', 1332866599),
('3dbe5fb0306585e3cdbc84d683a023ec', 'UJQL0', '66.249.66.170', 1333032742),
('821492a12dc08364e97ac20d7e239393', 'EEWRN', '66.249.66.170', 1333036773),
('96050037c266b742a523ba9f5992da3a', 'SEVID', '66.249.66.170', 1333036810),
('0009211e5dcaf5f965e5f81c21e56e28', 'XB1AN', '66.249.66.170', 1333036844),
('18e578e66b962330f319115130a91e4d', 'AGU1P', '66.249.68.167', 1333036879),
('1fbc8a7ef675f678c676b5fee151e261', 'GNGGU', '66.249.68.167', 1333078700),
('6d84ec563669d5cd2e5e9d72f86e8ba2', 'ITPWE', '66.249.66.202', 1333194104),
('7c37cb41c9d0f837cda6aa970a33848a', 'GS15E', '66.249.66.202', 1333199263),
('faf47269ace0769587efbdc9a75de460', 'OGRXW', '66.249.66.202', 1333199301),
('86277caf0b9fcb610725fb90b2a5b3f6', 'G7JL3', '66.249.66.202', 1333199340),
('fda93c20c171f569b4c6a08cccb50a03', 'PQUAY', '66.249.71.19', 1333199417),
('74436965c6f98744c6f764044766ffa0', 'FEIRG', '66.249.66.202', 1333271083),
('68dd038add9397c4d40542f545089134', 'OKAVR', '66.249.66.170', 1333374702),
('2f7eab08d2b98e6e1aaa97bd3af973e8', 'RR7PF', '217.41.2.46', 1333537278),
('898c8ca2fed9c32779e3d88636575fd6', 'K3DQQ', '66.249.66.170', 1333574079),
('3c7bac4d744287efa0ba8fc7fa9160e3', 'AXYDG', '66.249.66.170', 1333574506),
('0e58ff5628e3acfb48fde2d8063a7a54', 'ERGWL', '66.249.66.170', 1333576093),
('35f54ec31cd7290b2aed7e2ad5dc67cb', 'NEGIX', '66.249.66.170', 1333578335),
('aa2380e6ca77fc1b6fd6bc346e3d2834', 'YQKUH', '66.249.66.98', 1333892387),
('2db74fe297e81b32d63c1ef95c2660fc', 'DXGDB', '66.249.68.246', 1334077143),
('eb10a6a8165eae00eba8ef8179093be9', 'LGWG3', '66.249.68.246', 1334077316),
('1a52655eec28fb9a3f85b74e82f10f84', 'VECUX', '66.249.68.246', 1334077453),
('1908547b49780cc5910b2f0e9cc3b73e', 'SYNAM', '66.249.68.246', 1334077457),
('2862a5dd40ac0a05ddc5f002545af160', '99JHZ', '66.249.68.246', 1334251861),
('23465bb948f87fd80e333d722927491f', 'U0LCQ', '66.249.68.246', 1334275276),
('68839cce3a609dae2caabbaef7730784', 'AJJWS', '69.58.178.58', 1334722815);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_taf`
--

CREATE TABLE IF NOT EXISTS `cubecart_taf` (
  `taf_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`taf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `cubecart_taf`
--

INSERT INTO `cubecart_taf` (`taf_id`, `customer_id`, `status`) VALUES
(28, 23, 0),
(27, 21, 0),
(26, 22, 1),
(25, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_taxes`
--

CREATE TABLE IF NOT EXISTS `cubecart_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxName` varchar(50) NOT NULL DEFAULT '',
  `percent` decimal(7,4) NOT NULL DEFAULT '0.0000',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cubecart_taxes`
--

INSERT INTO `cubecart_taxes` (`id`, `taxName`, `percent`) VALUES
(1, 'Standard Tax', 20.0000),
(2, 'Tax Exempt', 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `cubecart_testimonial`
--

CREATE TABLE IF NOT EXISTS `cubecart_testimonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `question` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `cubecart_testimonial`
--

INSERT INTO `cubecart_testimonial` (`id`, `answer`, `question`, `status`) VALUES
(84, 'Coming soon', 'Service', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
