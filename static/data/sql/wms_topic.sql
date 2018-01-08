/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qogis

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-30 20:36:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `url` longtext CHARACTER SET utf8,
  `Title` text CHARACTER SET utf8,
  `Abstract` text CHARACTER SET utf8,
  `Keywords` text CHARACTER SET utf8,
  `Core_Topic` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Topic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Relevance` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IP` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `StateOrProvince` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  `Version` text CHARACTER SET utf8,
  `Continent` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `crs` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47624 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of test1
-- ----------------------------
INSERT INTO `test1` VALUES ('1', 'http://mrdata.usgs.gov/services/ngs?request=getcapabilities&service=wms', 'National_Geochemical_Survey', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('2', 'http://mrdata.usgs.gov/services/ree?request=getcapabilities&service=wms', 'Rare_Earth_Element_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('3', 'http://mrdata.usgs.gov/services/nuresed?request=getcapabilities&service=wms', 'NURE_Sediment_Geochemistry', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('4', 'http://mrdata.usgs.gov/services/laterite?request=getcapabilities&service=wms', 'Laterite_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('5', 'http://mrdata.usgs.gov/services/asbestos?request=getcapabilities&service=wms', 'MRDS', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('6', 'http://mrdata.usgs.gov/services/nurewtr?request=getcapabilities&service=wms', 'NURE_Water_Geochemistry', '', '', 'water', 'water,geology', '0.5,0.5', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('7', 'http://mrdata.usgs.gov/services/phosphate?request=getcapabilities&service=wms', 'Phosphate_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('8', 'http://mrdata.usgs.gov/services/podchrome?request=getcapabilities&service=wms', 'Podiform_chromite_deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('9', 'http://mrdata.usgs.gov/services/surveys?request=getcapabilities&service=wms', 'surveys', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('10', 'http://mrdata.usgs.gov/services/sedau?request=getcapabilities&service=wms', 'Sed_Au_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('11', 'http://mrdata.usgs.gov/services/potash?request=getcapabilities&service=wms', 'Potash_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('12', 'http://mrdata.usgs.gov/services/potash-tract?request=getcapabilities&service=wms', 'Potash_Tracts', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('13', 'http://mrdata.usgs.gov/services/active-mines?request=getcapabilities&service=wms', 'US_Active_Mines', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('14', 'http://mrdata.usgs.gov/services/copper-smelters?request=getcapabilities&service=wms', 'World_Copper_Smelters', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('15', 'http://mrdata.usgs.gov/services/minfac?request=getcapabilities&service=wms', 'Mineral_Operations_nonUS', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('16', 'http://mrdata.usgs.gov/services/gravity?request=getcapabilities&service=wms', 'Gravity anomaly map of the United States', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('17', 'http://mrdata.usgs.gov/services/claim-us?request=getcapabilities&service=wms', 'US_Mine_Claim_Activity', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('18', 'http://mrdata.usgs.gov/services/aerorad?request=getcapabilities&service=wms', 'Aeroradiometric surveys of North America', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('19', 'http://mrdata.usgs.gov/services/ds898?request=getcapabilities&service=wms', 'Basement Domain map of the US', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('20', 'http://mrdata.usgs.gov/services/kb?request=getcapabilities&service=wms', 'KB_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('21', 'http://mrdata.usgs.gov/services/pr?request=getcapabilities&service=wms', 'PuertoRico_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('22', 'http://mrdata.usgs.gov/services/alteration?request=getcapabilities&service=wms', 'Hydrothermal alteration in the Basin and Range', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('23', 'http://mrdata.usgs.gov/services/geochron?request=getcapabilities&service=wms', 'National_Geochronological_Database', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('24', 'http://mrdata.usgs.gov/services/akages?request=getcapabilities&service=wms', 'Radiometric ages of rocks from Alaska', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('25', 'http://mrdata.usgs.gov/services/nmra?request=getcapabilities&service=wms', '1998 Assessment of Undiscovered Deposits of Gold, Silver, Copper, Lead, and Zinc in the United States', 'Estimates of the number and size of undiscovered mineral deposits containing gold, silver, copper, lead, and zinc in the US, by type of deposit.', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('26', 'http://mrdata.usgs.gov/services/akages-geo?request=getcapabilities&service=wms', 'Radiometric ages of rocks from Alaska', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('27', 'http://mrdata.usgs.gov/services/ardf?request=getcapabilities&service=wms', 'Alaska Resource Data File', '', '', 'ecosystems', 'ecosystems', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('28', 'http://mrdata.usgs.gov/services/ds801?request=getcapabilities&service=wms', 'Soil_Geochemical_Landscape', 'Systematic survey of soil geochemistry and mineralogy in the conterminous US', '', 'geology', 'agriculture,geology', '0.4,0.6', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('29', 'http://mrdata.usgs.gov/services/soils?request=getcapabilities&service=wms', 'Geochemistry of soils calculated from DS-801 data', '', '', 'agriculture', 'agriculture,geology', '0.666666666667,0.333333333333', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('30', 'http://mrdata.usgs.gov/services/sgmc?request=getcapabilities&service=wms', 'Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('31', 'http://mrdata.usgs.gov/services/mrds?request=getcapabilities&service=wms', 'MRDS', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('32', 'http://mrdata.usgs.gov/services/ngdbrock?request=getcapabilities&service=wms', 'NGDB_Rock_Geochemistry', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('33', 'http://mrdata.usgs.gov/services/agdb2?request=getcapabilities&service=wms', 'Alaska Geochemical Database', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('34', 'http://mrdata.usgs.gov/services/vms?request=getcapabilities&service=wms', 'VMS_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('35', 'http://mrdata.usgs.gov/services/sedznpb?request=getcapabilities&service=wms', 'Sed_ZnPb_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('36', 'http://mrdata.usgs.gov/services/sedexmvt?request=getcapabilities&service=wms', 'SedExMVT_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('37', 'http://mrdata.usgs.gov/services/porcu?request=getcapabilities&service=wms', 'Porphyry_Cu_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('38', 'http://mrdata.usgs.gov/services/sedcu?request=getcapabilities&service=wms', 'Sed_Cu_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('39', 'http://mrdata.usgs.gov/services/nicrpge?request=getcapabilities&service=wms', 'NiCrPGE_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('40', 'http://mrdata.usgs.gov/services/carbonatite?request=getcapabilities&service=wms', 'Nb_REE_Carbonatite_Deposits', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('41', 'http://mrdata.usgs.gov/services/digitized?request=getcapabilities&service=wms', 'surveys', '', '', 'No Topic', 'No Topic', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('42', 'http://mrdata.usgs.gov/services/al?request=getcapabilities&service=wms', 'Alabama_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('43', 'http://mrdata.usgs.gov/services/akgeol?request=getcapabilities&service=wms', 'AK_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('44', 'http://mrdata.usgs.gov/services/ar?request=getcapabilities&service=wms', 'Arkansas_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('45', 'http://mrdata.usgs.gov/services/az?request=getcapabilities&service=wms', 'Arizona_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('46', 'http://mrdata.usgs.gov/services/ca?request=getcapabilities&service=wms', 'California_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('47', 'http://mrdata.usgs.gov/services/co?request=getcapabilities&service=wms', 'Colorado_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('48', 'http://mrdata.usgs.gov/services/ct?request=getcapabilities&service=wms', 'Connecticut_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('49', 'http://mrdata.usgs.gov/services/de?request=getcapabilities&service=wms', 'Delaware_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
INSERT INTO `test1` VALUES ('50', 'http://mrdata.usgs.gov/services/fl?request=getcapabilities&service=wms', 'Florida_Geology', '', '', 'geology', 'geology', '1.0', '137.227.242.58', 'United States', 'Virginia', 'Reston', '38.9466', '-77.3659', '1.3.0', null, 'EPSG:4326');
