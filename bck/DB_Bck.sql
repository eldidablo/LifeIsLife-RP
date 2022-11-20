-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lifeislifedev1
CREATE DATABASE IF NOT EXISTS `lifeislifedev1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lifeislifedev1`;

-- Dumping structure for table lifeislifedev1.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.apartments: ~0 rows (approximately)
REPLACE INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment19095', 'apartment1', 'South Rockford Drive 9095', 'RAA48121');

-- Dumping structure for table lifeislifedev1.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table lifeislifedev1.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.bank_cards
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table lifeislifedev1.bank_cards: ~0 rows (approximately)
REPLACE INTO `bank_cards` (`record_id`, `citizenid`, `cardNumber`, `cardPin`, `cardActive`, `cardLocked`, `cardType`) VALUES
	(1, 'RAA48121', '2488054524229405', '0', 1, 0, 'mastercard');

-- Dumping structure for table lifeislifedev1.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table lifeislifedev1.bank_statements: ~0 rows (approximately)
REPLACE INTO `bank_statements` (`record_id`, `citizenid`, `account`, `business`, `businessid`, `gangid`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES
	(1, 'RAA48121', 'Bank', NULL, NULL, NULL, 0, 1000, 1050, '2022-11-13 03:55:20', 'Withdraw $1000 from Current Account');

-- Dumping structure for table lifeislifedev1.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.bans: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.crypto: ~0 rows (approximately)
REPLACE INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1013, '[{"PreviousWorth":1007,"NewWorth":1016},{"PreviousWorth":1007,"NewWorth":1016},{"PreviousWorth":1007,"NewWorth":1016},{"PreviousWorth":1016,"NewWorth":1013}]');

-- Dumping structure for table lifeislifedev1.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.dealers: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.gloveboxitems: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.houselocations: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.house_plants: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.lapraces: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.management_funds: ~12 rows (approximately)
REPLACE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 4000, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- Dumping structure for table lifeislifedev1.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table lifeislifedev1.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.phone_messages: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.players: ~1 rows (approximately)
REPLACE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(1, 'RAA48121', 1, 'license:adec882cb4ed6bc4d335c5c3fb2fe46f2df40824', 'Tremoco O Salgadinho Imperial', '{"cash":489,"crypto":0,"bank":770}', '{"phone":"2122644864","cid":1,"card":2488054524229405,"birthdate":"2022-11-13","gender":0,"firstname":"Tremotxo","nationality":"Portuguese","lastname":"dev","backstory":"placeholder backstory","account":"US07QBCore5855563744"}', '{"type":"none","payment":50,"onduty":true,"label":"Reporter","name":"reporter","grade":{"level":0,"name":"Journalist"},"isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":1795.6614990234376,"y":3284.545166015625,"z":41.9677734375}', '{"isdead":false,"stress":0,"inside":{"apartment":[]},"craftingrep":0,"armor":0,"thirst":96.2,"dealerrep":0,"status":[],"attachmentcraftingrep":0,"commandbinds":[],"bloodtype":"AB-","criminalrecord":{"hasRecord":false},"tracker":false,"fitbit":[],"hunger":95.8,"jailitems":[],"inlaststand":false,"callsign":"NO CALLSIGN","jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"phone":[],"injail":0,"phonedata":{"InstalledApps":[],"SerialNumber":83158568},"ishandcuffed":false,"licences":{"driver":true,"business":false,"weapon":false},"walletid":"QB-59537654","fingerprint":"pM085f53LyN9642"}', '[{"info":[],"name":"phone","amount":1,"slot":1,"type":"item"},{"info":{"birthdate":"2022-11-13","lastname":"dev","type":"Class C Driver License","firstname":"Tremotxo"},"name":"driver_license","amount":1,"slot":2,"type":"item"},{"info":{"birthdate":"2022-11-13","lastname":"dev","gender":0,"firstname":"Tremotxo","citizenid":"RAA48121","nationality":"Portuguese"},"name":"id_card","amount":1,"slot":3,"type":"item"},{"info":{"cardPin":0,"name":"Tremotxo dev","cardNumber":2488054524229405,"cardType":"mastercard","citizenid":"RAA48121","cardActive":true},"name":"mastercard","amount":1,"slot":4,"type":"item"},{"info":{"quality":80.64999999999927,"ammo":12,"serie":"58UAC6Tc040zrye","attachments":[{"component":"COMPONENT_AT_AR_FLSH","label":"Flashlight"},{"component":"COMPONENT_AT_SCOPE_MEDIUM","label":"3x Scope"}]},"name":"weapon_carbinerifle","amount":1,"slot":5,"type":"weapon"}]', '2022-11-19 18:00:17');

-- Dumping structure for table lifeislifedev1.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.playerskins: ~1 rows (approximately)
REPLACE INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(4, 'RAA48121', '1681385341', '{"watch":{"defaultItem":-1,"item":-1,"texture":0,"defaultTexture":0},"shoes":{"defaultItem":1,"item":24,"texture":0,"defaultTexture":0},"glass":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"ear":{"defaultItem":-1,"item":-1,"texture":0,"defaultTexture":0},"nose_1":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"vest":{"defaultItem":0,"item":15,"texture":2,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"makeup":{"defaultItem":-1,"item":-1,"texture":1,"defaultTexture":1},"chimp_bone_lowering":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"accessory":{"defaultItem":0,"item":133,"texture":0,"defaultTexture":0},"lipstick":{"defaultItem":-1,"item":-1,"texture":1,"defaultTexture":1},"jaw_bone_back_lenght":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"blush":{"defaultItem":-1,"item":-1,"texture":1,"defaultTexture":1},"neck_thikness":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"hair":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"bag":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"facemix":{"defaultShapeMix":0.0,"skinMix":0,"shapeMix":0,"defaultSkinMix":0.0},"nose_2":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"t-shirt":{"defaultItem":1,"item":15,"texture":0,"defaultTexture":0},"face2":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"hat":{"defaultItem":-1,"item":150,"texture":0,"defaultTexture":0},"mask":{"defaultItem":0,"item":52,"texture":0,"defaultTexture":0},"ageing":{"defaultItem":-1,"item":-1,"texture":0,"defaultTexture":0},"torso2":{"defaultItem":0,"item":336,"texture":3,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"decals":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"bracelet":{"defaultItem":-1,"item":-1,"texture":0,"defaultTexture":0},"arms":{"defaultItem":0,"item":172,"texture":0,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"item":-1,"texture":1,"defaultTexture":1},"eye_color":{"defaultItem":-1,"item":-1,"texture":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"face":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"moles":{"defaultItem":-1,"item":-1,"texture":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"pants":{"defaultItem":0,"item":130,"texture":1,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"beard":{"defaultItem":-1,"item":-1,"texture":1,"defaultTexture":1}}', 1);

-- Dumping structure for table lifeislifedev1.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.player_contacts: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.player_houses: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.player_mails: ~0 rows (approximately)
REPLACE INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(2, 'RAA48121', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. dev, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!', 0, 453331, '2022-11-13 03:42:37', '[]');

-- Dumping structure for table lifeislifedev1.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.player_outfits: ~0 rows (approximately)
REPLACE INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
	(1, 'RAA48121', '', '1681385341', '{"lips_thickness":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_lowering":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_4":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_3":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"face2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"vest":{"texture":2,"defaultItem":0,"item":15,"defaultTexture":0},"nose_2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_1":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"blush":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"eyebrown_high":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"torso2":{"texture":3,"defaultItem":0,"item":336,"defaultTexture":0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"beard":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"pants":{"texture":1,"defaultItem":0,"item":130,"defaultTexture":0},"cheek_3":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eye_opening":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"moles":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"mask":{"texture":0,"defaultItem":0,"item":52,"defaultTexture":0},"chimp_hole":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_1":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"hair":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"bracelet":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":15,"defaultTexture":0},"neck_thikness":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"shoes":{"texture":0,"defaultItem":1,"item":24,"defaultTexture":0},"eyebrows":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"jaw_bone_width":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"face":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_width":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_5":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eye_color":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":172,"defaultTexture":0},"jaw_bone_back_lenght":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"makeup":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"watch":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"lipstick":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"accessory":{"texture":0,"defaultItem":0,"item":133,"defaultTexture":0},"ear":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"glass":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"hat":{"texture":0,"defaultItem":-1,"item":150,"defaultTexture":0},"facemix":{"defaultSkinMix":0.0,"skinMix":0,"shapeMix":0,"defaultShapeMix":0.0},"bag":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_0":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"ageing":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0}}', 'outfit-7-4711');

-- Dumping structure for table lifeislifedev1.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.player_vehicles: ~3 rows (approximately)
REPLACE INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
	(1, 'license:adec882cb4ed6bc4d335c5c3fb2fe46f2df40824', 'RAA48121', 'ratbike', '1873600305', '{"modPlateHolder":-1,"modSideSkirt":-1,"modArchCover":-1,"modTransmission":-1,"modKit21":-1,"modFrame":-1,"modFender":-1,"tankHealth":1000.0592475178704,"modFrontBumper":-1,"modSmokeEnabled":false,"modXenon":false,"plate":"4XQ512ZB","pearlescentColor":0,"modSpoilers":-1,"liveryRoof":-1,"plateIndex":0,"modTrimA":-1,"neonEnabled":[false,false,false,false],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpeakers":-1,"modDashboard":-1,"modAerials":-1,"dirtLevel":7.14895411251853,"modRightFender":-1,"model":1873600305,"modEngine":-1,"color2":132,"color1":131,"modCustomTiresR":false,"bodyHealth":1000.0592475178704,"tyreSmokeColor":[255,255,255],"modOrnaments":-1,"modTurbo":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"extras":[],"modKit47":-1,"modKit19":-1,"modShifterLeavers":-1,"modTrunk":-1,"modAirFilter":-1,"engineHealth":1000.0592475178704,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"dashboardColor":111,"modHood":-1,"wheels":6,"wheelSize":0.0,"modArmor":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"xenonColor":255,"modBrakes":-1,"modStruts":-1,"modEngineBlock":-1,"modKit17":-1,"modDial":-1,"modGrille":-1,"windowTint":-1,"modVanityPlate":-1,"wheelColor":0,"modTrimB":-1,"modBackWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"modHydrolic":-1,"oilLevel":4.76596940834568,"modAPlate":-1,"modKit49":-1,"modRearBumper":-1,"modSuspension":-1,"modRoof":-1,"interiorColor":111,"fuelLevel":100.08535757525947,"headlightColor":255,"modExhaust":-1,"modCustomTiresF":false,"modSeats":-1,"modSteeringWheel":-1,"modTank":-1,"modLivery":-1,"modWindows":-1,"modHorns":-1,"neonColor":[255,0,255],"modDoorSpeaker":-1,"wheelWidth":0.0}', '4XQ512ZB', NULL, 'pillboxgarage', 97, 1000, 992, 0, 0, 22755, NULL, 2000, 83, 24, 1322),
	(2, 'license:adec882cb4ed6bc4d335c5c3fb2fe46f2df40824', 'RAA48121', 'f620', '-591610296', '{"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"headlightColor":255,"modSuspension":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonColor":[255,0,255],"modHydrolic":-1,"modFrame":-1,"modFender":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"windowTint":-1,"modTransmission":-1,"modTrunk":-1,"modFrontWheels":-1,"modSideSkirt":-1,"dirtLevel":0.0,"tyreSmokeColor":[255,255,255],"model":-591610296,"modArchCover":-1,"modRearBumper":-1,"modHood":-1,"modVanityPlate":-1,"modSeats":-1,"modRoof":-1,"modSteeringWheel":-1,"modXenon":false,"modTank":-1,"modSpoilers":-1,"modExhaust":-1,"color1":52,"modStruts":-1,"modCustomTiresF":false,"modDial":-1,"liveryRoof":-1,"fuelLevel":20.65253410283131,"modDashboard":-1,"modOrnaments":-1,"interiorColor":0,"modKit49":-1,"modSmokeEnabled":false,"modSpeakers":-1,"tankHealth":1000.0592475178704,"modTrimB":-1,"modWindows":-1,"plateIndex":0,"oilLevel":4.76596940834568,"modArmor":-1,"wheels":7,"modTurbo":false,"modDoorSpeaker":-1,"plate":"09GCH414","modPlateHolder":-1,"wheelWidth":0.0,"modAirFilter":-1,"wheelSize":0.0,"color2":52,"neonEnabled":[false,false,false,false],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHorns":-1,"wheelColor":156,"bodyHealth":1000.0592475178704,"modLivery":-1,"modBrakes":-1,"modKit17":-1,"modShifterLeavers":-1,"modKit47":-1,"modGrille":-1,"engineHealth":1000.0592475178704,"modCustomTiresR":false,"modKit21":-1,"modFrontBumper":-1,"dashboardColor":0,"pearlescentColor":60,"modEngineBlock":-1,"modTrimA":-1,"modRightFender":-1,"modBackWheels":-1,"modAPlate":-1,"modKit19":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngine":-1,"xenonColor":255,"modAerials":-1,"extras":{"10":false,"12":false}}', '09GCH414', NULL, NULL, 100, 1000, 1000, 0, 0, 383360, NULL, 0, 0, 0, 0),
	(3, 'license:adec882cb4ed6bc4d335c5c3fb2fe46f2df40824', 'RAA48121', 'voltic', '-1622444098', '{"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"headlightColor":255,"modSuspension":3,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonColor":[255,0,255],"modHydrolic":-1,"modFrame":-1,"modFender":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"windowTint":-1,"modTransmission":-1,"modTrunk":-1,"modFrontWheels":-1,"modSideSkirt":-1,"dirtLevel":0.0,"tyreSmokeColor":[255,255,255],"model":-1622444098,"modArchCover":-1,"modRearBumper":-1,"modHood":-1,"modVanityPlate":-1,"modSeats":-1,"modRoof":-1,"modSteeringWheel":-1,"modXenon":false,"modTank":-1,"modSpoilers":-1,"modExhaust":-1,"color1":0,"modStruts":-1,"modCustomTiresF":false,"modDial":-1,"liveryRoof":-1,"fuelLevel":0.0,"modDashboard":-1,"modOrnaments":-1,"interiorColor":0,"modKit49":-1,"modSmokeEnabled":false,"modSpeakers":-1,"tankHealth":1000.0592475178704,"modTrimB":-1,"modWindows":-1,"plateIndex":0,"oilLevel":0.0,"modArmor":4,"wheels":0,"modTurbo":1,"modDoorSpeaker":-1,"plate":"68CSR313","modPlateHolder":-1,"wheelWidth":0.0,"modAirFilter":-1,"wheelSize":0.0,"color2":0,"neonEnabled":[false,false,false,false],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHorns":-1,"wheelColor":156,"bodyHealth":1000.0592475178704,"modLivery":-1,"modBrakes":2,"modKit17":-1,"modShifterLeavers":-1,"modKit47":-1,"modGrille":-1,"engineHealth":1000.0592475178704,"modCustomTiresR":false,"modKit21":-1,"modFrontBumper":-1,"dashboardColor":0,"pearlescentColor":0,"modEngineBlock":-1,"modTrimA":-1,"modRightFender":-1,"modBackWheels":-1,"modAPlate":-1,"modKit19":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngine":3,"xenonColor":255,"modAerials":-1,"extras":{"12":true,"10":false,"1":false,"2":false,"3":true}}', '68CSR313', NULL, NULL, 100, 1000, 1000, 0, 0, 972199, NULL, 0, 0, 0, 0);

-- Dumping structure for table lifeislifedev1.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.player_warns: ~0 rows (approximately)

-- Dumping structure for table lifeislifedev1.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.stashitems: ~5 rows (approximately)
REPLACE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(2, '2 | Drawer 1', '[]'),
	(5, '2 | Drawer 10', '[]'),
	(1, 'apartment19095', '[]'),
	(4, 'boss_police', '[]'),
	(3, 'policestash_RAA48121', '[]');

-- Dumping structure for table lifeislifedev1.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lifeislifedev1.trunkitems: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
