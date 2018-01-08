/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qogis

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-13 10:26:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for grid_zoom2
-- ----------------------------
DROP TABLE IF EXISTS `grid_zoom2`;
CREATE TABLE `grid_zoom2` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `BoundingBox` varchar(100) DEFAULT NULL,
  `Core_Topic` varchar(20) DEFAULT NULL,
  `disaster` varchar(20) DEFAULT NULL,
  `health` varchar(20) DEFAULT NULL,
  `energy` varchar(20) DEFAULT NULL,
  `climate` varchar(20) DEFAULT NULL,
  `water` varchar(20) DEFAULT NULL,
  `weather` varchar(20) DEFAULT NULL,
  `ecosystems` varchar(20) DEFAULT NULL,
  `agriculture` varchar(20) DEFAULT NULL,
  `biodiversity` varchar(20) DEFAULT NULL,
  `geology` varchar(20) DEFAULT NULL,
  `polygon` polygon DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grid_zoom2
-- ----------------------------
INSERT INTO `grid_zoom2` VALUES ('(2,0,0)', '-180.0 45.0,-135.0 90.0', 'water', '628', '649', '565', '1557', '4815', '3048', '1493', '1373', '513', '1219', GeomFromText('POLYGON((-180 45, -180 90, -135 90, -135 45, -180 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,1)', '-135.0 45.0,-90.0 90.0', 'water', '1068', '1085', '791', '1805', '6914', '4117', '5854', '2593', '762', '2573', GeomFromText('POLYGON((-135 45, -135 90, -90 90, -90 45, -135 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,2)', '-90.0 45.0,-45.0 90.0', 'water', '971', '1015', '891', '1798', '6654', '4247', '6217', '2697', '748', '2560', GeomFromText('POLYGON((-90 45, -90 90, -45 90, -45 45, -90 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,3)', '-45.0 45.0,0.0 90.0', 'water', '994', '949', '758', '1974', '6156', '4273', '5653', '2911', '1029', '1565', GeomFromText('POLYGON((-45 45, -45 90, 0 90, 0 45, -45 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,4)', '0.0 45.0,45.0 90.0', 'water', '1174', '1101', '789', '2180', '7204', '4813', '5904', '2850', '1019', '3115', GeomFromText('POLYGON((0 45, 0 90, 45 90, 45 45, 0 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,5)', '45.0 45.0,90.0 90.0', 'ecosystems', '828', '827', '419', '1782', '4920', '4195', '5110', '1773', '626', '1146', GeomFromText('POLYGON((45 45, 45 90, 90 90, 90 45, 45 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,6)', '90.0 45.0,135.0 90.0', 'ecosystems', '673', '765', '326', '1638', '4501', '3973', '4924', '1616', '646', '934', GeomFromText('POLYGON((90 45, 90 90, 135 90, 135 45, 90 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,0,7)', '135.0 45.0,180.0 90.0', 'water', '510', '698', '297', '1544', '3726', '2933', '1119', '644', '647', '812', GeomFromText('POLYGON((135 45, 135 90, 180 90, 180 45, 135 45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,0)', '-180.0 0.0,-135.0 45.0', 'water', '705', '632', '422', '1705', '4573', '3256', '1533', '1297', '517', '1118', GeomFromText('POLYGON((-180 0, -180 45, -135 45, -135 0, -180 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,1)', '-135.0 0.0,-90.0 45.0', 'water', '3246', '2784', '1215', '1981', '8349', '4544', '6816', '2859', '1074', '3686', GeomFromText('POLYGON((-135 0, -135 45, -90 45, -90 0, -135 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,2)', '-90.0 0.0,-45.0 45.0', 'water', '1428', '1221', '2469', '1862', '8227', '4878', '6459', '2666', '993', '3471', GeomFromText('POLYGON((-90 0, -90 45, -45 45, -45 0, -90 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,3)', '-45.0 0.0,0.0 45.0', 'water', '1135', '914', '613', '1997', '6493', '4350', '5387', '3091', '1103', '1281', GeomFromText('POLYGON((-45 0, -45 45, 0 45, 0 0, -45 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,4)', '0.0 0.0,45.0 45.0', 'water', '1816', '939', '653', '2931', '6459', '5118', '5889', '3023', '1176', '1443', GeomFromText('POLYGON((0 0, 0 45, 45 45, 45 0, 0 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,5)', '45.0 0.0,90.0 45.0', 'ecosystems', '931', '838', '811', '1811', '5460', '4457', '5462', '1912', '830', '1787', GeomFromText('POLYGON((45 0, 45 45, 90 45, 90 0, 45 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,6)', '90.0 0.0,135.0 45.0', 'ecosystems', '996', '777', '436', '1637', '4713', '4187', '4990', '1689', '946', '972', GeomFromText('POLYGON((90 0, 90 45, 135 45, 135 0, 90 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,1,7)', '135.0 0.0,180.0 45.0', 'water', '567', '702', '418', '1594', '3986', '3149', '1313', '655', '852', '810', GeomFromText('POLYGON((135 0, 135 45, 180 45, 180 0, 135 0))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,0)', '-180.0 -45.0,-135.0 0.0', 'water', '529', '426', '263', '1514', '3471', '3022', '1030', '559', '442', '601', GeomFromText('POLYGON((-180 -45, -180 0, -135 0, -135 -45, -180 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,1)', '-135.0 -45.0,-90.0 0.0', 'ecosystems', '704', '670', '295', '1625', '4200', '3924', '4861', '1555', '628', '873', GeomFromText('POLYGON((-135 -45, -135 0, -90 0, -90 -45, -135 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,2)', '-90.0 -45.0,-45.0 0.0', 'ecosystems', '844', '710', '404', '1725', '4562', '4143', '5024', '1668', '749', '1023', GeomFromText('POLYGON((-90 -45, -90 0, -45 0, -45 -45, -90 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,3)', '-45.0 -45.0,0.0 0.0', 'ecosystems', '848', '711', '377', '1795', '4643', '4105', '5021', '1936', '791', '1137', GeomFromText('POLYGON((-45 -45, -45 0, 0 0, 0 -45, -45 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,4)', '0.0 -45.0,45.0 0.0', 'ecosystems', '871', '724', '422', '1863', '4951', '4367', '5087', '1988', '879', '1220', GeomFromText('POLYGON((0 -45, 0 0, 45 0, 45 -45, 0 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,5)', '45.0 -45.0,90.0 0.0', 'ecosystems', '906', '693', '384', '1761', '4843', '4275', '5012', '1746', '734', '1038', GeomFromText('POLYGON((45 -45, 45 0, 90 0, 90 -45, 45 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,6)', '90.0 -45.0,135.0 0.0', 'ecosystems', '708', '705', '356', '1655', '4471', '4116', '4946', '1577', '864', '952', GeomFromText('POLYGON((90 -45, 90 0, 135 0, 135 -45, 90 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,2,7)', '135.0 -45.0,180.0 0.0', 'water', '709', '746', '515', '1593', '4459', '3191', '1478', '1017', '1555', '1376', GeomFromText('POLYGON((135 -45, 135 0, 180 0, 180 -45, 135 -45))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,0)', '-180.0 -90.0,-135.0 -45.0', 'water', '472', '204', '178', '1505', '3030', '2740', '785', '503', '413', '500', GeomFromText('POLYGON((-180 -90, -180 -45, -135 -45, -135 -90, -180 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,1)', '-135.0 -90.0,-90.0 -45.0', 'ecosystems', '648', '446', '215', '1617', '3797', '3638', '4646', '1496', '453', '764', GeomFromText('POLYGON((-135 -90, -135 -45, -90 -45, -90 -90, -135 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,2)', '-90.0 -90.0,-45.0 -45.0', 'ecosystems', '760', '464', '253', '1710', '4079', '3867', '4787', '1558', '499', '901', GeomFromText('POLYGON((-90 -90, -90 -45, -45 -45, -45 -90, -90 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,3)', '-45.0 -90.0,0.0 -45.0', 'ecosystems', '770', '476', '254', '1769', '4050', '3811', '4749', '1630', '479', '998', GeomFromText('POLYGON((-45 -90, -45 -45, 0 -45, 0 -90, -45 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,4)', '0.0 -90.0,45.0 -45.0', 'ecosystems', '885', '499', '764', '1857', '4602', '4143', '5117', '1717', '475', '1093', GeomFromText('POLYGON((0 -90, 0 -45, 45 -45, 45 -90, 0 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,5)', '45.0 -90.0,90.0 -45.0', 'ecosystems', '873', '479', '345', '1740', '4723', '4002', '5033', '1651', '467', '979', GeomFromText('POLYGON((45 -90, 45 -45, 90 -45, 90 -90, 45 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,6)', '90.0 -90.0,135.0 -45.0', 'ecosystems', '646', '446', '218', '1615', '3881', '3778', '4633', '1524', '477', '785', GeomFromText('POLYGON((90 -90, 90 -45, 135 -45, 135 -90, 90 -90))'));
INSERT INTO `grid_zoom2` VALUES ('(2,3,7)', '135.0 -90.0,180.0 -45.0', 'water', '500', '407', '197', '1534', '3282', '2767', '877', '561', '484', '1030', GeomFromText('POLYGON((135 -90, 135 -45, 180 -45, 180 -90, 135 -90))'));
