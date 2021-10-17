-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2021 at 06:56 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verse-task`
--

-- --------------------------------------------------------

--
-- Table structure for table `vtannouncements`
--

CREATE TABLE `vtannouncements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtassetindexdata`
--

CREATE TABLE `vtassetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtassets`
--

CREATE TABLE `vtassets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtassettransformindex`
--

CREATE TABLE `vtassettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtassettransforms`
--

CREATE TABLE `vtassettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtcategories`
--

CREATE TABLE `vtcategories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtcategorygroups`
--

CREATE TABLE `vtcategorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtcategorygroups_sites`
--

CREATE TABLE `vtcategorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtchangedattributes`
--

CREATE TABLE `vtchangedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtchangedfields`
--

CREATE TABLE `vtchangedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtcontent`
--

CREATE TABLE `vtcontent` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtcontent`
--

INSERT INTO `vtcontent` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2021-10-15 16:42:46', '2021-10-15 16:42:46', '3c82fb0a-c2db-4da7-98be-715fc76cf154');

-- --------------------------------------------------------

--
-- Table structure for table `vtcraftidtokens`
--

CREATE TABLE `vtcraftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtdeprecationerrors`
--

CREATE TABLE `vtdeprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtdrafts`
--

CREATE TABLE `vtdrafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtelementindexsettings`
--

CREATE TABLE `vtelementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtelements`
--

CREATE TABLE `vtelements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtelements`
--

INSERT INTO `vtelements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-10-15 16:42:46', '2021-10-15 16:42:46', NULL, NULL, '3aaaefe3-1c31-4729-b30e-3473ac6911e0');

-- --------------------------------------------------------

--
-- Table structure for table `vtelements_sites`
--

CREATE TABLE `vtelements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtelements_sites`
--

INSERT INTO `vtelements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-10-15 16:42:46', '2021-10-15 16:42:46', 'f9899261-8fa0-4bba-ba35-b6377d3cdca4');

-- --------------------------------------------------------

--
-- Table structure for table `vtentries`
--

CREATE TABLE `vtentries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtentrytypes`
--

CREATE TABLE `vtentrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtfieldgroups`
--

CREATE TABLE `vtfieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtfieldgroups`
--

INSERT INTO `vtfieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-10-15 16:42:46', '2021-10-15 16:42:46', NULL, 'daa2e738-b5aa-483e-88d3-5ddee8af7f56');

-- --------------------------------------------------------

--
-- Table structure for table `vtfieldlayoutfields`
--

CREATE TABLE `vtfieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtfieldlayouts`
--

CREATE TABLE `vtfieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtfieldlayouttabs`
--

CREATE TABLE `vtfieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtfields`
--

CREATE TABLE `vtfields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtglobalsets`
--

CREATE TABLE `vtglobalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtgqlschemas`
--

CREATE TABLE `vtgqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtgqltokens`
--

CREATE TABLE `vtgqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtinfo`
--

CREATE TABLE `vtinfo` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtinfo`
--

INSERT INTO `vtinfo` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.16', '3.7.8', 0, 'hspgsfgrtiej', 'nyjekmvgeuus', '2021-10-15 16:42:46', '2021-10-15 16:42:48', 'c7b0c803-cbf8-45ba-8a3e-398f8cdc203d');

-- --------------------------------------------------------

--
-- Table structure for table `vtmatrixblocks`
--

CREATE TABLE `vtmatrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtmatrixblocktypes`
--

CREATE TABLE `vtmatrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtmigrations`
--

CREATE TABLE `vtmigrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtmigrations`
--

INSERT INTO `vtmigrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '65ee5a31-9f44-4997-a420-0fc2f6ea817e'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '3788983e-5925-464b-b1bf-dcb567c8cc10'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'b6d47bc3-6a9c-4959-b8da-ec0ef2e590c7'),
(4, 'craft', 'm150403_184533_field_version', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'e9d80f15-8192-4d59-bf5d-759668c153ac'),
(5, 'craft', 'm150403_184729_type_columns', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '32584c78-c1bd-43ac-8394-a0a82d77ff49'),
(6, 'craft', 'm150403_185142_volumes', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '52572b20-46f4-4d12-b536-a75c5c99823f'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'c77cf7aa-7c0b-4502-ab72-d6594d7f685b'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '66fb7177-f5ef-4f2b-9490-f61243f2c156'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'fc27f7ba-995e-48ce-a26a-8666b2fce3c1'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'f6444564-5b77-4a5a-9194-89e0e5cba2be'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '966b99e4-90ed-49b1-b379-b27e7aed6464'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '8b47f2c3-b3f8-4799-95b6-8d31a24de2a5'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '37a801eb-85e1-4671-a929-d2b28ce9c543'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2bf40ca6-a978-4c70-b98b-ac25508b3a34'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'e48c4861-47cc-4478-aff8-acedff7d23de'),
(16, 'craft', 'm151209_000000_move_logo', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'a4fc10a8-1934-45c1-bede-9ff252720e1a'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-10-15 16:42:47', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'ef31baa5-bb57-4d6a-a490-42562436e6fc'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b39dd04e-aba6-4b10-a8f2-34cdc0c2ea3d'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'c3b5d7bc-f86e-43c8-b6bd-52b9da8f7b81'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b00998bd-a4d4-48b3-9bc2-42b01a59434f'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0b7e8a23-2225-44ee-b4dd-db5248730ef1'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '31cc6097-70fd-4d09-a271-c5b0b262f882'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '4fee4242-8420-4e21-bb03-4745ab7aa7b3'),
(24, 'craft', 'm160807_144858_sites', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'bea13d7f-8c2a-4735-bbe1-cff312da51f7'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '1c69b0eb-906b-47a8-9094-c544852050a8'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'cf573b0c-b52b-48c0-b92c-d05d9b90af35'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '30648212-b11d-4f05-8c6b-e3837cb07ed5'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'c0ddacae-4c9c-4bdc-ba26-1a827f8ed4a2'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '23ba33b7-875a-49ac-8198-79749d2a4ca3'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'ff96f7c0-1e2c-4a32-8bec-5ce90b1cca3e'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '94591cac-ebc1-4b57-8920-90125b0a12ad'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '10e8552d-fce1-4632-a43f-5ad98b0e971e'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '76d57bcf-95d4-4eea-a34d-5ed42184bcbe'),
(34, 'craft', 'm161013_175052_newParentId', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'cf823e8e-da47-4539-ab28-b32244d2cb4f'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'fdd5ffb1-bc72-47b3-a6af-e55542a589fb'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '8fb69926-1b65-4993-a801-23e53d69a493'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'efb0d476-e40b-4e4c-829f-50ee89a6422e'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a0f06957-6cf9-4b81-b503-9b29603e4d8a'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2ec81135-2ed8-4ded-aaee-99359b2584df'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '21b92a46-1a2a-41af-952c-5b50acfd59b6'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'cd6eefde-55c3-4e11-95e1-5d6c98762b57'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f4afdf94-e2b9-4aa7-b4ea-66d861c68816'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'dc50ac0f-d7f9-4e6c-9260-fb5cabb0df2a'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '123cdbf0-afc2-4e8d-8ab4-b47d2c03af63'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '97006bc2-db57-42dd-9f98-575e624c8c31'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '77ef7184-b192-47a9-9c64-2af5bfcf4b1f'),
(47, 'craft', 'm170206_142126_system_name', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0f0c7d58-dc60-458e-ae82-50617e03cba0'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '860e569e-19f6-4470-be8f-6ce4900064ca'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '12514e15-e051-4c4d-8ffc-e969ed702493'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '084f4b25-c154-4b22-853d-f42c52ebc90f'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0089d120-8805-46c3-95ae-5c7fb8bd48e1'),
(52, 'craft', 'm170228_171113_system_messages', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '98cb2d89-948d-4838-98b1-fdb50dd84e33'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '32ffa0ba-a81e-41fa-b04c-e706b10a6f93'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '211c3d4b-ddfd-47c9-a060-b40dbe379f59'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'c181b521-7152-4ac3-ba61-c4615a3b51ec'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '75baa921-d5a5-4555-a558-b80bedb0d601'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '6218babe-49fe-4752-9857-4555f99a75f7'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '1a499b5c-c528-49e3-8114-a00aa414adb4'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '088e7933-bd73-45a6-9d1d-93f0299730c6'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '9704975c-df72-4630-adad-18cac3bb23aa'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '8dd8e205-8f1b-444a-9b3c-27da14310f02'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd89209fd-0148-4d26-b199-9bb19841484b'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a0daf766-0c5c-4dc4-9d97-cc7a69e72333'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a2b9a372-1da1-4263-b4ba-9e97b3ad6dfe'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3d2f9b8a-751f-4361-ad19-0950dc382ddd'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2efd7d09-4629-4fa5-be1e-066f7e513057'),
(67, 'craft', 'm171011_214115_site_groups', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '7958625d-e789-48ab-bbde-0f17dace6546'),
(68, 'craft', 'm171012_151440_primary_site', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'afaa9a35-a07c-4365-a741-d99ae8b75e95'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '10c7060e-afe7-4680-83d2-392127602a98'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'bb0dd25a-e9fd-45db-9d37-cc1717996fef'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '7c85a1b3-bdb2-487d-b6dd-1a7102841db9'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '29225456-ddb1-48d3-bd59-2999358f06b6'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '363b81f5-1bc6-4008-8e41-a36b3ec68ba0'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'c69a3919-5fcc-4dde-a43d-21d1bd2d90a7'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '38ac61ec-18d6-4d25-a875-5227c13ac2a6'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '88e69cb1-8f59-4f12-9d6f-03cb72cb279b'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd835d1bd-2bc6-4c00-ba55-7c403f8834f0'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2a930705-29f6-4348-8a6c-0ec8824594da'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f521a649-0693-4465-833d-63ffd479b03e'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd8c3c018-efc6-4a35-b8b3-c192e2aa9ea7'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '845552e3-00bb-49a2-9936-1af4d88278de'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '071c5444-e593-40ab-9178-2fb1f333ea84'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0ccd004a-1ede-42ac-a0b0-ba6c3def1c79'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'fdc8e542-d58d-419d-98c3-ece4d1a1de5b'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '92398671-94f0-4fa1-8e38-a7e7b14d8b21'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3704d990-302c-40fe-a1e6-5a9e88ffb52a'),
(87, 'craft', 'm180321_233505_small_ints', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2ccde310-979d-4406-8116-ed915fac7562'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b463a83e-1bfc-4c7a-a07a-828919c218d5'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'ba46eaca-cde8-43d2-8c64-d45741527f12'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '386ca418-4690-4464-89ee-c4a34c31763d'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '79ba31e1-9486-4993-8792-dc41cee0c73f'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b99c723d-e07c-42d2-bb65-5ef36f99ec6a'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '735176e0-833f-4149-9fad-86bf10746bf3'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '503c895c-a183-4e51-a516-b8525103b37a'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd36de92d-597b-48ec-9af1-fdf2535d1fd9'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b0a3c4e4-805f-47af-865b-2bed3a046d5f'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f4cbe5bd-f57f-4483-8aef-96d55c3c438b'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '939b2fe8-caa7-45c4-b385-f06655ea98eb'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a2533880-adf4-47cc-9397-985f76cdb254'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b99b72f0-e43d-45be-849c-ace1e7606892'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '842f3ccd-757e-4cae-88bd-a42226cf65c3'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f3897d74-5b31-43c2-8d38-05828838f4b1'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'beba0adf-1282-4df2-b3da-d9ec7c576600'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '215c3854-5523-4f24-addd-5bb51bed210c'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a2705d97-6a33-4e24-babc-bfa99d5fad6f'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '9fd43627-ef62-4033-ad7a-559c58309d8d'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3a53f61e-b530-4f99-9f30-3c0cfa086b72'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b04227cc-ac63-4cd9-8983-26736da565af'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '76568548-b668-4120-9b4c-bcd0ef37a880'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '7713a9e1-1c04-490b-be56-89559f312020'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0fe74e08-5246-429c-968d-92664ae58aa4'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'daa67380-e5ca-4c7e-949a-66325399e28f'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'c3e38522-b07b-4999-a0bc-3a02e65b5a54'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '5945b712-4bd0-46b1-87f1-6e9361315f87'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd9b1f7a4-9a9b-4cf1-8e5f-4846c948130a'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd34df32a-4d7f-46a6-ab9e-99e3d9696fa9'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '7cf2ee8f-dd91-4ddf-b1ba-c2064c80fea7'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a9c9337d-789a-4334-b846-d169100f6b37'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '615912c3-24af-4e87-92a8-21d945c5cfed'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'c5dd2c7f-9bdb-45f3-abee-9037eed89a04'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b3463980-afde-41e7-875a-a9d6848c89fb'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'ab148c6f-8bc9-4739-b3c4-a51e62673012'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0f872ca9-94b8-4ea7-a6fe-3005890c7e45'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3798ab36-7f6b-4768-9aea-8fb918373d95'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '200ff854-3642-4639-be49-88be6fada504'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'bd9fde3c-affd-4995-8ca2-12f498b2524d'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'accc4f2a-42fe-4dd3-9aed-33b046d71335'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '517422b7-ea6b-49d6-bfa6-670b90945125'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '24eb249d-b12a-4bed-8f4c-d556b3671ed4'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '4b2079ba-475e-4088-b971-65e8ae76eade'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '198c5fe8-4d88-48c7-9d8f-beeb43f33b55'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'e2cff351-5e04-4919-901e-29a80d7558c4'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f99ff746-3c32-4d6d-afe1-7de57a02aa6d'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '97f03336-9087-4367-be66-ad7c3d11ebf6'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'e751ed39-1d0e-42f1-9ad2-faf03f091fe6'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'e3805b76-7089-4625-938b-79e8ff3620b3'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '580e38a5-92a6-49b4-99a2-585fd8ad205b'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3669310c-8f03-47db-bfe0-d7015acef7b8'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd1de7202-50c4-4a96-a2f1-a7f1b0935671'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '8bfb684c-2afe-4b20-8d4d-5efd5e33c7d9'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '8299f420-9dc8-4426-beef-b87f30337908'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '804d3506-156d-460e-87e9-9a6d5c20c602'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '87305275-6fa8-49ed-9584-71326d5b18ad'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '89904059-e117-4170-a698-95da9f1f998d'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'd5f23ac3-c5bd-4a9f-9fc6-6d4a6d33e7d1'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '11e5e2e9-5d6f-4d7f-a2d2-30133440eed9'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '21997760-1998-44fe-99ee-e49239fe0e5b'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '8b7acffb-e792-48bb-a7f5-ffd7636d693e'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '6c2c8757-3b9b-4bd3-8180-fb7c0c4e1007'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'ce20efbb-fce2-400f-b0f9-f2f824e83b20'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '24d4a068-5ef5-43eb-97da-74119f90f505'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'addca5a4-0e2c-4310-8283-d1d5dae504cf'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f97d5e8e-2a0a-4313-a857-a7ddc7588be8'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2c91b380-8fac-403f-85b0-f594af0f3515'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '6a785417-3106-42bf-ab23-3bfd86a60e93'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '7ce4e885-d3be-4de0-87f2-0f27a11c7772'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '554b42f7-dc49-488d-a6b7-bd0b9c2cf2db'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '6089c5e6-ab44-4c9b-a6f3-1c1d1820c194'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '33c8138f-ac4d-4407-bbfb-dd6e6dc65542'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '4df2110e-6510-4176-a633-629e7387eb07'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'aa927a5b-0183-49dc-8775-2848bf70b482'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b8d9e2b7-ec90-45a6-a291-0c5e210d99fc'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a35295ae-48f4-411c-8927-52fcb5f72e24'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '8dd03715-68d0-4245-9a12-16f63390ef3b'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'ad90b5ae-0a08-4db5-bd52-09ac722f1622'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f05773bc-ad9e-4844-aadf-0ce0222faab6'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3e9f64fa-1da3-4585-8fa0-e1d9b75ba239'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '5e728eb5-6590-4f18-be24-0df46732112b'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b418e3fa-3ed8-4431-bc2d-68908b924b4e'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '6c2f4f87-adab-4302-9bd0-5a43727e4de4'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'afaba9a6-9b5a-4897-8432-9515d2a60b46'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a311226d-f2c7-4c35-9dd1-d87047ac03e8'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '4641af83-2fd9-4580-9a40-a8f1f50c514c'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'afd25985-0fc0-45ad-a8aa-4ca0c851322b'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0ba1823b-d9c9-4584-a68f-3fbde5097d33'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '3dbff718-25a4-4ada-abad-5257b7513ce8'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2468fe49-9e9a-43bd-81f5-5cd0710b7bb4'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'e42a1633-13cb-487c-bb77-9629fe9b1e60'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '0fe7aa1d-9b07-4219-bf31-91dd3f0fe343'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'b2fcefc6-63c1-49ed-977a-12c8c6cbbe9c'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'efa7244d-de43-4e9d-806c-3790bb4f1429'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '30b95eb2-9acf-416b-9abc-897af341e8cc'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a50ff624-6332-44f9-89d7-7941f42cefe5'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'a78dd923-dfde-4d21-9635-1e1585475541'),
(185, 'craft', 'm210331_220322_null_author', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'bfa5f35d-ca77-4416-bcdc-0b5a3aa26301'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '591bee7e-0c34-4941-bf0d-a8fac463c771'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '335f3e3a-7e06-4b95-b9f4-f4c5fb45eb31'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', 'f5f4820a-622c-4796-8f25-286a80234b33'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '79bdd938-6301-46d3-9b33-a273bfe811d9'),
(190, 'craft', 'm210613_184103_announcements', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '382e23be-8ad7-45fa-955e-4b702075fef8'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '2021-10-15 16:42:48', '76ec88eb-f9f9-4b33-9dc5-66a302ec4fc4');

-- --------------------------------------------------------

--
-- Table structure for table `vtplugins`
--

CREATE TABLE `vtplugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtprojectconfig`
--

CREATE TABLE `vtprojectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtprojectconfig`
--

INSERT INTO `vtprojectconfig` (`path`, `value`) VALUES
('dateModified', '1634316168'),
('email.fromEmail', '\"rasheedsaidi@gmail.com\"'),
('email.fromName', '\"Tech Task\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.daa2e738-b5aa-483e-88d3-5ddee8af7f56.name', '\"Common\"'),
('meta.__names__.62b6628f-db05-4628-96ab-4b76671ce74b', '\"Tech Task\"'),
('meta.__names__.daa2e738-b5aa-483e-88d3-5ddee8af7f56', '\"Common\"'),
('meta.__names__.edce792e-a29d-46e6-9de5-3e063b13487d', '\"Tech Task\"'),
('siteGroups.edce792e-a29d-46e6-9de5-3e063b13487d.name', '\"Tech Task\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.handle', '\"default\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.hasUrls', 'true'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.language', '\"en-US\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.name', '\"Tech Task\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.primary', 'true'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.siteGroup', '\"edce792e-a29d-46e6-9de5-3e063b13487d\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Tech Task\"'),
('system.schemaVersion', '\"3.7.8\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `vtqueue`
--

CREATE TABLE `vtqueue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtqueue`
--

INSERT INTO `vtqueue` (`id`, `channel`, `job`, `description`, `timePushed`, `ttr`, `delay`, `priority`, `dateReserved`, `timeUpdated`, `progress`, `progressLabel`, `attempt`, `fail`, `dateFailed`, `error`) VALUES
(1, 'queue', 0x4f3a33343a2263726166745c71756575655c6a6f62735c557064617465536561726368496e646578223a373a7b733a31313a22656c656d656e7454797065223b733a31393a2263726166745c656c656d656e74735c55736572223b733a393a22656c656d656e744964223b693a313b733a363a22736974654964223b693a313b733a31323a226669656c6448616e646c6573223b613a303a7b7d733a31313a226465736372697074696f6e223b4e3b733a33303a220063726166745c71756575655c426173654a6f62005f70726f6772657373223b693a303b733a33353a220063726166745c71756575655c426173654a6f62005f70726f67726573734c6162656c223b4e3b7d, 'Updating search indexes', 1634316167, 300, 0, 2048, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtrelations`
--

CREATE TABLE `vtrelations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtresourcepaths`
--

CREATE TABLE `vtresourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtrevisions`
--

CREATE TABLE `vtrevisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsearchindex`
--

CREATE TABLE `vtsearchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsections`
--

CREATE TABLE `vtsections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsections_sites`
--

CREATE TABLE `vtsections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsequences`
--

CREATE TABLE `vtsequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsessions`
--

CREATE TABLE `vtsessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtsessions`
--

INSERT INTO `vtsessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'QdCy8s6eADgmQMV2IpmpYo_Yd-RiiNFIBcFEyXJZWSbiXsE5rvXy-LakzS2Kd49P2FR3u5F8Cws5042eRvmG42kcp7ClAnP8agYI', '2021-10-15 16:42:47', '2021-10-15 16:42:47', 'd1fcc9b9-9a02-485d-93cd-3b80e381d503');

-- --------------------------------------------------------

--
-- Table structure for table `vtshunnedmessages`
--

CREATE TABLE `vtshunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsitegroups`
--

CREATE TABLE `vtsitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtsitegroups`
--

INSERT INTO `vtsitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Tech Task', '2021-10-15 16:42:46', '2021-10-15 16:42:46', NULL, 'edce792e-a29d-46e6-9de5-3e063b13487d');

-- --------------------------------------------------------

--
-- Table structure for table `vtsites`
--

CREATE TABLE `vtsites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtsites`
--

INSERT INTO `vtsites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Tech Task', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-10-15 16:42:46', '2021-10-15 16:42:46', NULL, '62b6628f-db05-4628-96ab-4b76671ce74b');

-- --------------------------------------------------------

--
-- Table structure for table `vtstructureelements`
--

CREATE TABLE `vtstructureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtstructures`
--

CREATE TABLE `vtstructures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtsystemmessages`
--

CREATE TABLE `vtsystemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vttaggroups`
--

CREATE TABLE `vttaggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vttags`
--

CREATE TABLE `vttags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vttemplatecacheelements`
--

CREATE TABLE `vttemplatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vttemplatecachequeries`
--

CREATE TABLE `vttemplatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vttemplatecaches`
--

CREATE TABLE `vttemplatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vttokens`
--

CREATE TABLE `vttokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtusergroups`
--

CREATE TABLE `vtusergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtusergroups_users`
--

CREATE TABLE `vtusergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtuserpermissions`
--

CREATE TABLE `vtuserpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtuserpermissions_usergroups`
--

CREATE TABLE `vtuserpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtuserpermissions_users`
--

CREATE TABLE `vtuserpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtuserpreferences`
--

CREATE TABLE `vtuserpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtuserpreferences`
--

INSERT INTO `vtuserpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `vtusers`
--

CREATE TABLE `vtusers` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vtusers`
--

INSERT INTO `vtusers` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'verse-admin', NULL, NULL, NULL, 'rasheedsaidi@gmail.com', '$2y$13$yUq6eEEkV1radyy8zmIOX.pv00EKJqoeI1NXWRanFIPQDbdBlev.S', 1, 0, 0, 0, '2021-10-15 16:42:47', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-10-15 16:42:47', '2021-10-15 16:42:47', '2021-10-15 16:42:47', '1e61ae60-a4e9-4cf5-868d-95c64f984c26');

-- --------------------------------------------------------

--
-- Table structure for table `vtvolumefolders`
--

CREATE TABLE `vtvolumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtvolumes`
--

CREATE TABLE `vtvolumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtwidgets`
--

CREATE TABLE `vtwidgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_announcements`
--

CREATE TABLE `vt_announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_assetindexdata`
--

CREATE TABLE `vt_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_assets`
--

CREATE TABLE `vt_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_assets`
--

INSERT INTO `vt_assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 4, 1, 'icon-logo.png', 'image', 76, 76, 23293, NULL, NULL, NULL, '2021-10-17 17:38:38', '2021-10-17 17:38:38', '2021-10-17 17:38:38', '6d66c599-96ba-4488-bdb7-5f7870f05bdf'),
(20, 1, 1, 1, 'banner-image.png', 'image', 1440, 720, 926996, NULL, NULL, NULL, '2021-10-17 17:46:37', '2021-10-17 17:46:37', '2021-10-17 17:46:37', 'ba579f51-f1c5-48fb-8caa-eb140ed2e35a'),
(27, 1, 1, 1, 'hero-image.png', 'image', 580, 418, 379818, NULL, NULL, NULL, '2021-10-17 18:11:37', '2021-10-17 18:11:37', '2021-10-17 18:11:37', '8eb5105f-5207-48f5-a784-7028a8496fb3'),
(31, 1, 1, 1, 'entry-item-img-1.png', 'image', 373, 240, 173780, NULL, NULL, NULL, '2021-10-17 18:12:46', '2021-10-17 18:12:47', '2021-10-17 18:12:47', '3c370967-d7fe-4c29-acb4-9dd5798a24fb'),
(34, 1, 1, 1, 'entry-item-img-2.png', 'image', 373, 240, 154183, NULL, NULL, NULL, '2021-10-17 18:13:45', '2021-10-17 18:13:45', '2021-10-17 18:13:45', 'e3a93db7-ce40-458d-ba8a-bf73ead717be'),
(37, 1, 1, 1, 'entry-item-img-3.png', 'image', 373, 240, 133824, NULL, NULL, NULL, '2021-10-17 18:14:12', '2021-10-17 18:14:12', '2021-10-17 18:14:12', 'd59ad83f-dbb7-4498-b162-f4349dde826c');

-- --------------------------------------------------------

--
-- Table structure for table `vt_assettransformindex`
--

CREATE TABLE `vt_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_assettransforms`
--

CREATE TABLE `vt_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_categories`
--

CREATE TABLE `vt_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_categorygroups`
--

CREATE TABLE `vt_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_categorygroups_sites`
--

CREATE TABLE `vt_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_changedattributes`
--

CREATE TABLE `vt_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_changedattributes`
--

INSERT INTO `vt_changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(11, 1, 'slug', '2021-10-17 17:39:58', 0, 1),
(11, 1, 'title', '2021-10-17 18:13:04', 0, 1),
(11, 1, 'uri', '2021-10-17 17:39:58', 0, 1),
(16, 1, 'title', '2021-10-17 17:46:50', 0, 1),
(22, 1, 'title', '2021-10-17 18:11:42', 0, 1),
(33, 1, 'slug', '2021-10-17 18:13:42', 0, 1),
(33, 1, 'title', '2021-10-17 18:13:42', 0, 1),
(33, 1, 'uri', '2021-10-17 18:13:42', 0, 1),
(36, 1, 'slug', '2021-10-17 18:14:06', 0, 1),
(36, 1, 'title', '2021-10-17 18:14:06', 0, 1),
(36, 1, 'uri', '2021-10-17 18:14:06', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vt_changedfields`
--

CREATE TABLE `vt_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_changedfields`
--

INSERT INTO `vt_changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(11, 1, 1, '2021-10-17 18:13:04', 0, 1),
(11, 1, 2, '2021-10-17 18:13:04', 0, 1),
(16, 1, 1, '2021-10-17 17:46:50', 0, 1),
(16, 1, 2, '2021-10-17 17:46:50', 0, 1),
(22, 1, 1, '2021-10-17 18:11:42', 0, 1),
(22, 1, 2, '2021-10-17 18:11:42', 0, 1),
(33, 1, 1, '2021-10-17 18:13:47', 0, 1),
(33, 1, 2, '2021-10-17 18:13:35', 0, 1),
(36, 1, 1, '2021-10-17 18:14:14', 0, 1),
(36, 1, 2, '2021-10-17 18:14:21', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vt_content`
--

CREATE TABLE `vt_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_redactorContent_isxssiwm` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_content`
--

INSERT INTO `vt_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_redactorContent_isxssiwm`) VALUES
(1, 1, 1, NULL, '2021-10-15 16:48:20', '2021-10-15 16:48:20', '7b33b21d-a79b-427b-8184-752ef1ed0fcd', NULL),
(2, 2, 1, NULL, '2021-10-17 17:28:02', '2021-10-17 17:39:13', '2a11a0e7-bc00-4e55-aecf-1b4399d2ec7d', NULL),
(3, 3, 1, 'Icon logo', '2021-10-17 17:38:37', '2021-10-17 17:38:37', '7ae080a0-3ef6-4678-872d-fbf93467b0ad', NULL),
(4, 11, 1, 'This is a wide container title stretching two lines.', '2021-10-17 17:39:33', '2021-10-17 18:13:04', '4d3b2903-4fac-4ca8-8b65-3eab8e863167', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur \nadipiscing.</p>'),
(5, 12, 1, 'Home - Required', '2021-10-17 17:40:00', '2021-10-17 17:40:00', 'dee14848-04a6-4ee4-b9d5-f07f00239b5b', NULL),
(6, 13, 1, 'Homepage', '2021-10-17 17:42:49', '2021-10-17 17:42:50', '662b6a00-edf3-4b41-b346-cfe7ae5be842', NULL),
(7, 14, 1, 'Homepage', '2021-10-17 17:42:49', '2021-10-17 17:42:49', '47e4acb5-c555-4e71-8f5f-b4230b6e52fb', NULL),
(8, 15, 1, 'Homepage', '2021-10-17 17:42:50', '2021-10-17 17:42:50', 'c68f2c85-c88e-434c-9d31-edd875fbd151', NULL),
(9, 16, 1, 'Here we have a two line display intro.', '2021-10-17 17:45:08', '2021-10-17 17:46:50', '9f95a275-b9a8-4b93-8312-2c75721edd2b', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \nex ea commodo consequat.</p>'),
(10, 17, 1, 'Banner', '2021-10-17 17:45:08', '2021-10-17 17:45:08', '88f36dc4-ced3-4002-b154-c3bdab8a7513', NULL),
(11, 18, 1, 'Banner', '2021-10-17 17:45:35', '2021-10-17 17:45:35', 'e938a979-58a4-466e-b94a-cd9daaa3de2f', NULL),
(13, 20, 1, 'Banner image', '2021-10-17 17:46:37', '2021-10-17 17:46:37', '6233977b-601d-411d-ac94-a2c1dad35300', NULL),
(14, 21, 1, 'Here we have a two line display intro.', '2021-10-17 17:46:50', '2021-10-17 17:46:50', 'b2f5a5b9-a17a-4ad9-9512-1a7414b6b27d', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \nex ea commodo consequat.</p>'),
(15, 22, 1, 'Here we have a two line display.', '2021-10-17 18:08:54', '2021-10-17 18:11:42', '8085fae3-9ea8-4324-9bb0-c9677450ecfa', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \nex ea commodo consequat.</p>'),
(16, 23, 1, 'Hero', '2021-10-17 18:08:54', '2021-10-17 18:08:54', '40691be4-963e-4a1b-a445-77c93d038d69', NULL),
(17, 24, 1, 'Hero', '2021-10-17 18:08:55', '2021-10-17 18:08:55', '634807b7-02bc-4008-9578-11cfbfd8bfdd', NULL),
(18, 25, 1, 'Hero', '2021-10-17 18:09:23', '2021-10-17 18:09:23', 'aa8a20df-3605-4329-b10a-1e43ed3158ca', NULL),
(20, 27, 1, 'Hero image', '2021-10-17 18:11:37', '2021-10-17 18:11:37', '56f78d5b-7fbd-4d36-a8cc-06606fb024f5', NULL),
(21, 28, 1, 'Here we have a two line display.', '2021-10-17 18:11:42', '2021-10-17 18:11:42', '9b14afb4-a83f-4901-b81d-61cb01bca790', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \nex ea commodo consequat.</p>'),
(22, 29, 1, NULL, '2021-10-17 18:11:58', '2021-10-17 18:11:58', '58f501df-11de-43f5-811b-02753eff321b', NULL),
(24, 31, 1, 'Entry item img 1', '2021-10-17 18:12:46', '2021-10-17 18:12:46', 'b0cc6e83-e918-47b1-a1a1-4331520ea4cf', NULL),
(25, 32, 1, 'This is a wide container title stretching two lines.', '2021-10-17 18:13:04', '2021-10-17 18:13:04', 'd7a8abde-cb48-4365-bb5b-c24c5685dc7d', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur \nadipiscing.</p>'),
(26, 33, 1, 'This is a wide container title stretching two lines.', '2021-10-17 18:13:12', '2021-10-17 18:13:49', '4a457ba7-8e84-4804-ac88-565fdb07e3f9', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur \nadipiscing.</p>'),
(27, 34, 1, 'Entry item img 2', '2021-10-17 18:13:45', '2021-10-17 18:13:45', 'b1079002-bd77-49ca-98ba-1728ebf3301c', NULL),
(28, 35, 1, 'This is a wide container title stretching two lines.', '2021-10-17 18:13:49', '2021-10-17 18:13:49', '0ee2506a-e525-4cf3-895f-0902c6e18582', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur \nadipiscing.</p>'),
(29, 36, 1, 'This is a wide container title stretching two lines.', '2021-10-17 18:14:02', '2021-10-17 18:14:24', '3541d60b-a958-4d72-9ad1-1047c92e9020', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur \nadipiscing.</p>'),
(30, 37, 1, 'Entry item img 3', '2021-10-17 18:14:12', '2021-10-17 18:14:12', 'fd36e32c-f4d1-46cc-83e1-c23c17dd6956', NULL),
(31, 38, 1, 'This is a wide container title stretching two lines.', '2021-10-17 18:14:24', '2021-10-17 18:14:24', 'cd54ac2e-7004-49bb-9fb4-34229f767353', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur \nadipiscing.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `vt_craftidtokens`
--

CREATE TABLE `vt_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_deprecationerrors`
--

CREATE TABLE `vt_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_drafts`
--

CREATE TABLE `vt_drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_drafts`
--

INSERT INTO `vt_drafts` (`id`, `sourceId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(4, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vt_elementindexsettings`
--

CREATE TABLE `vt_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_elements`
--

CREATE TABLE `vt_elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_elements`
--

INSERT INTO `vt_elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-10-15 16:48:19', '2021-10-15 16:48:19', NULL, NULL, 'd5f13de9-1105-463c-bcac-458849cd70d2'),
(2, NULL, NULL, NULL, 6, 'craft\\elements\\GlobalSet', 1, 0, '2021-10-17 17:28:01', '2021-10-17 17:39:13', NULL, NULL, '14dd5e06-b590-4c77-8dd4-f2441b8b15a0'),
(3, NULL, NULL, NULL, 5, 'craft\\elements\\Asset', 1, 0, '2021-10-17 17:38:37', '2021-10-17 17:38:37', NULL, NULL, '97807fdc-78fd-4b59-b49b-09680ec35c38'),
(4, NULL, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, '0f49dfb7-af0d-4686-8dac-869a999ab90d'),
(5, NULL, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, 'd81c769f-f9ca-4aa4-aae3-12527c353903'),
(6, NULL, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, '7b4f17a7-73e7-4af8-b6ad-dbb8bab60061'),
(7, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, 'eba640fa-2f70-4a35-b31f-0967353d479f'),
(8, NULL, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, '20f54873-e21c-41fe-a27a-bba6d08a374c'),
(9, NULL, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, '0449a4f1-fb1b-4ccb-8053-aa4ca1bc7018'),
(10, NULL, NULL, NULL, 3, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-17 17:39:13', '2021-10-17 17:39:13', NULL, NULL, '193c75f9-d793-4e32-bc26-6968a5ff81fe'),
(11, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:39:33', '2021-10-17 18:13:04', NULL, NULL, 'ea0a2e72-4d2a-4f71-afc4-2335a71e3b80'),
(12, 11, NULL, 1, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:40:00', '2021-10-17 17:40:00', NULL, NULL, 'd756a04d-5b00-4eeb-a0ae-37f027d3c61c'),
(13, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:42:49', '2021-10-17 17:42:50', NULL, NULL, 'e17b4300-95e3-408a-b75a-f938bfa82daa'),
(14, 13, NULL, 2, 7, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:42:49', '2021-10-17 17:42:49', NULL, NULL, '8fb78fad-6980-4c53-860e-bc1d1a02a8db'),
(15, 13, NULL, 3, 7, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:42:50', '2021-10-17 17:42:50', NULL, NULL, '989dedd2-80f5-4d54-9cc4-87e85b1ada0b'),
(16, NULL, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:45:08', '2021-10-17 17:46:50', NULL, NULL, 'c5c06289-d68e-4d85-a4a4-02ed14939fda'),
(17, 16, NULL, 4, 8, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:45:08', '2021-10-17 17:45:08', NULL, NULL, 'c13aa14f-0bc6-4623-94d7-d3074162c11e'),
(18, 16, NULL, 5, 8, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:45:34', '2021-10-17 17:45:35', NULL, NULL, 'd36082b0-9da9-41d4-b6ed-444f374a5d4d'),
(20, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-10-17 17:46:37', '2021-10-17 17:46:37', NULL, NULL, 'ed5848fb-0e9c-4a28-a34e-e7d2f0ee07c0'),
(21, 16, NULL, 6, 8, 'craft\\elements\\Entry', 1, 0, '2021-10-17 17:46:50', '2021-10-17 17:46:50', NULL, NULL, '85d4eeaf-b8b4-4ce4-bf93-dd664f8dcad4'),
(22, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:08:54', '2021-10-17 18:11:42', NULL, NULL, 'c7959454-b290-41af-9dee-129d62e1ff16'),
(23, 22, NULL, 7, 9, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:08:54', '2021-10-17 18:08:54', NULL, NULL, 'd6af5267-3efa-4b40-bea9-92432cef07d6'),
(24, 22, NULL, 8, 9, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:08:55', '2021-10-17 18:08:55', NULL, NULL, 'f82a493b-727b-42bd-bb01-11b8e455758a'),
(25, 22, NULL, 9, 9, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:09:23', '2021-10-17 18:09:23', NULL, NULL, 'f9444bc1-cd72-4886-bcfa-1618a59487bb'),
(27, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-10-17 18:11:36', '2021-10-17 18:11:36', NULL, NULL, 'eab91bdf-330d-4474-b2c5-ebd67d6dbc53'),
(28, 22, NULL, 10, 9, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:11:42', '2021-10-17 18:11:42', NULL, NULL, 'cbaa5a1d-cb48-4a65-81bf-b3161bd82fe7'),
(29, NULL, 4, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:11:58', '2021-10-17 18:11:58', NULL, NULL, '6bf8f546-6c08-4633-b3c5-75b5722a8032'),
(31, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-10-17 18:12:46', '2021-10-17 18:12:46', NULL, NULL, 'b67d3d07-0e3b-4b7a-baed-ae985ad77b0d'),
(32, 11, NULL, 11, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:13:04', '2021-10-17 18:13:04', NULL, NULL, '689c9448-6e02-4caf-8231-3e4ceda25d97'),
(33, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:13:12', '2021-10-17 18:13:49', NULL, NULL, '2de0e96f-1754-4911-aa73-b0bb676b3253'),
(34, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-10-17 18:13:45', '2021-10-17 18:13:45', NULL, NULL, '5e005903-f732-41fe-826f-edb5ecc44e4d'),
(35, 33, NULL, 12, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:13:49', '2021-10-17 18:13:49', NULL, NULL, '884870d3-6271-4798-b69f-97a6a5155a67'),
(36, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:14:01', '2021-10-17 18:14:24', NULL, NULL, '534aefdf-5f5f-445d-87da-7b476d32ae30'),
(37, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-10-17 18:14:12', '2021-10-17 18:14:12', NULL, NULL, '72d139e9-da1f-42fd-936a-c43d1cd16eca'),
(38, 36, NULL, 13, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-17 18:14:24', '2021-10-17 18:14:24', NULL, NULL, '7316b83b-26c8-4348-9595-cbbdb4be0a3f');

-- --------------------------------------------------------

--
-- Table structure for table `vt_elements_sites`
--

CREATE TABLE `vt_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_elements_sites`
--

INSERT INTO `vt_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-10-15 16:48:20', '2021-10-15 16:48:20', '2c715620-e00c-4768-bca7-249530750b2c'),
(2, 2, 1, NULL, NULL, 1, '2021-10-17 17:28:02', '2021-10-17 17:28:02', '914cc02d-c3f7-4be5-9c26-193905e68cfc'),
(3, 3, 1, NULL, NULL, 1, '2021-10-17 17:38:37', '2021-10-17 17:38:37', '89de67a2-1edd-4e96-b260-e2987034620b'),
(4, 4, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '49219847-24f6-4ec5-af8d-7404a1ee1995'),
(5, 5, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '6253f06f-ebce-408b-a037-68b0acec4685'),
(6, 6, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', 'e2cf293c-cffa-4bf3-b6fa-bbe8b1426f5d'),
(7, 7, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '88672f0a-e706-4091-a204-87f3613df310'),
(8, 8, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '49b41429-afee-47ea-aaec-bf1e60ab6b24'),
(9, 9, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', 'a93d771a-01eb-4eaf-8ad1-380096f946f7'),
(10, 10, 1, NULL, NULL, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', 'f8c7c5bf-e9aa-4c7c-80c6-8da11bd9f87b'),
(11, 11, 1, 'home-required', 'entries/home-required', 1, '2021-10-17 17:39:33', '2021-10-17 17:39:57', '7464fefb-168f-49ce-8252-1682249deb8e'),
(12, 12, 1, 'home-required', 'entries/home-required', 1, '2021-10-17 17:40:00', '2021-10-17 17:40:00', '15b8b6a9-942f-47db-91c6-3f08620c1675'),
(13, 13, 1, 'homepage', '__home__', 1, '2021-10-17 17:42:49', '2021-10-17 17:42:49', '4c1f668c-8c1c-438f-96eb-595261cf67f4'),
(14, 14, 1, 'homepage', '__home__', 1, '2021-10-17 17:42:49', '2021-10-17 17:42:49', 'fab717c4-89df-431c-86d3-a703ca70afd8'),
(15, 15, 1, 'homepage', '__home__', 1, '2021-10-17 17:42:50', '2021-10-17 17:42:50', '6a54fa66-e297-4d1c-a49a-9b5fdae4d5cc'),
(16, 16, 1, 'banner', 'banner', 1, '2021-10-17 17:45:08', '2021-10-17 17:45:08', 'adc9dc6d-9610-42d3-aa07-05272a65ba52'),
(17, 17, 1, 'banner', 'banner', 1, '2021-10-17 17:45:08', '2021-10-17 17:45:08', '5488fba0-0bef-4dfe-894e-c77ec7221d7e'),
(18, 18, 1, 'banner', 'banner', 1, '2021-10-17 17:45:35', '2021-10-17 17:45:35', 'eadee443-3a7e-4315-b364-488f45dcf0ef'),
(20, 20, 1, NULL, NULL, 1, '2021-10-17 17:46:37', '2021-10-17 17:46:37', 'e69644ff-6ebc-4f1c-b117-7d0baf6d2916'),
(21, 21, 1, 'banner', 'banner', 1, '2021-10-17 17:46:50', '2021-10-17 17:46:50', '2b8f66db-9fc0-49c8-92d2-8e1f368fd51c'),
(22, 22, 1, 'hero', 'hero', 1, '2021-10-17 18:08:54', '2021-10-17 18:08:54', '3fd1fa79-8ffc-4983-9bea-34667007f5a4'),
(23, 23, 1, 'hero', 'hero', 1, '2021-10-17 18:08:54', '2021-10-17 18:08:54', '6901453b-f23d-4440-b33e-95b66c574acc'),
(24, 24, 1, 'hero', 'hero', 1, '2021-10-17 18:08:55', '2021-10-17 18:08:55', '57299677-bf0d-4a4d-882c-5e7a8a5d4c3c'),
(25, 25, 1, 'hero', 'hero', 1, '2021-10-17 18:09:23', '2021-10-17 18:09:23', '6af5f0c4-6c9d-499f-b949-51572f388ffa'),
(27, 27, 1, NULL, NULL, 1, '2021-10-17 18:11:37', '2021-10-17 18:11:37', '3f1be62b-0749-4374-b528-67b3c04fd560'),
(28, 28, 1, 'hero', 'hero', 1, '2021-10-17 18:11:42', '2021-10-17 18:11:42', 'e54f2e5e-1fe2-4327-b631-c96c2e8f672a'),
(29, 29, 1, '__temp_vteblylmoqcndbwmltwjzkdewuaaoqddeobu', 'entries/__temp_vteblylmoqcndbwmltwjzkdewuaaoqddeobu', 1, '2021-10-17 18:11:58', '2021-10-17 18:11:58', '82d40c50-c225-41dc-9c75-c5bddd40ef04'),
(31, 31, 1, NULL, NULL, 1, '2021-10-17 18:12:46', '2021-10-17 18:12:46', '299c70f8-1c2e-4b67-bafc-d361625998ef'),
(32, 32, 1, 'home-required', 'entries/home-required', 1, '2021-10-17 18:13:04', '2021-10-17 18:13:04', '78cd9804-7017-4056-ab1b-59c80f24d2e2'),
(33, 33, 1, 'this-is-a-wide-container-title-stretching-two-lines', 'entries/this-is-a-wide-container-title-stretching-two-lines', 1, '2021-10-17 18:13:12', '2021-10-17 18:13:42', 'bf568969-6853-442a-a5f6-a3029a4901c7'),
(34, 34, 1, NULL, NULL, 1, '2021-10-17 18:13:45', '2021-10-17 18:13:45', '8cf0e822-fe05-4ebb-aba1-c0f19ca3313f'),
(35, 35, 1, 'this-is-a-wide-container-title-stretching-two-lines', 'entries/this-is-a-wide-container-title-stretching-two-lines', 1, '2021-10-17 18:13:49', '2021-10-17 18:13:49', '5b968bd6-3eba-4b2b-bf85-0d8569e7ae17'),
(36, 36, 1, 'this-is-a-wide-container-title-stretching-two-lines-2', 'entries/this-is-a-wide-container-title-stretching-two-lines-2', 1, '2021-10-17 18:14:02', '2021-10-17 18:14:06', '5ecdbd96-0cbb-4551-b13b-fcdf1439d68e'),
(37, 37, 1, NULL, NULL, 1, '2021-10-17 18:14:12', '2021-10-17 18:14:12', '7dd66e8c-547b-43eb-a0d8-3b2e5cb3bd33'),
(38, 38, 1, 'this-is-a-wide-container-title-stretching-two-lines-2', 'entries/this-is-a-wide-container-title-stretching-two-lines-2', 1, '2021-10-17 18:14:24', '2021-10-17 18:14:24', '08b12134-a466-4664-bc9f-78ef13e8a82f');

-- --------------------------------------------------------

--
-- Table structure for table `vt_entries`
--

CREATE TABLE `vt_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_entries`
--

INSERT INTO `vt_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(11, 1, NULL, 1, 1, '2021-10-17 17:39:00', NULL, NULL, '2021-10-17 17:39:34', '2021-10-17 17:39:34', '0db93cf2-0bee-4c1a-8788-a951180673f5'),
(12, 1, NULL, 1, 1, '2021-10-17 17:39:00', NULL, NULL, '2021-10-17 17:40:00', '2021-10-17 17:40:00', '32c1d270-b06f-4912-975e-c35752d3e3d6'),
(13, 2, NULL, 2, NULL, '2021-10-17 17:42:00', NULL, NULL, '2021-10-17 17:42:49', '2021-10-17 17:42:49', '229353d6-e241-4f91-9414-71d415b45f01'),
(14, 2, NULL, 2, NULL, '2021-10-17 17:42:00', NULL, NULL, '2021-10-17 17:42:49', '2021-10-17 17:42:49', 'e4bc6f8c-4ed0-412c-a3df-32a4be17e451'),
(15, 2, NULL, 2, NULL, '2021-10-17 17:42:00', NULL, NULL, '2021-10-17 17:42:50', '2021-10-17 17:42:50', '692bfd9b-fe9d-461c-a655-3047c7c58d58'),
(16, 3, NULL, 3, NULL, '2021-10-17 17:45:00', NULL, NULL, '2021-10-17 17:45:08', '2021-10-17 17:45:08', '73b0dc70-bc90-4f5c-85dd-48adb3550aff'),
(17, 3, NULL, 3, NULL, '2021-10-17 17:45:00', NULL, NULL, '2021-10-17 17:45:08', '2021-10-17 17:45:08', '7d0b60e4-5fa6-4919-aaea-e7420bd5149d'),
(18, 3, NULL, 3, NULL, '2021-10-17 17:45:00', NULL, NULL, '2021-10-17 17:45:35', '2021-10-17 17:45:35', 'ba3d5b56-7097-4049-93c7-0b846e8670e2'),
(21, 3, NULL, 3, NULL, '2021-10-17 17:45:00', NULL, NULL, '2021-10-17 17:46:50', '2021-10-17 17:46:50', '49819651-bc6d-4513-a16e-ca8ee52c3e26'),
(22, 4, NULL, 4, NULL, '2021-10-17 18:08:00', NULL, NULL, '2021-10-17 18:08:54', '2021-10-17 18:08:54', '0232861e-0cca-4b0c-9930-37f4c99597b0'),
(23, 4, NULL, 4, NULL, '2021-10-17 18:08:00', NULL, NULL, '2021-10-17 18:08:54', '2021-10-17 18:08:54', '2646c733-99c5-49fd-be0b-2ed64f004ae7'),
(24, 4, NULL, 4, NULL, '2021-10-17 18:08:00', NULL, NULL, '2021-10-17 18:08:55', '2021-10-17 18:08:55', 'cf7d8645-e217-4c29-af4d-07186f0c3565'),
(25, 4, NULL, 4, NULL, '2021-10-17 18:08:00', NULL, NULL, '2021-10-17 18:09:23', '2021-10-17 18:09:23', '8e0f0749-7852-4530-bfe3-e8bc814bb5cd'),
(28, 4, NULL, 4, NULL, '2021-10-17 18:08:00', NULL, NULL, '2021-10-17 18:11:42', '2021-10-17 18:11:42', '7fba5b78-662d-49bb-b9d2-bb4bfd3ef686'),
(29, 1, NULL, 1, 1, '2021-10-17 18:11:00', NULL, NULL, '2021-10-17 18:11:58', '2021-10-17 18:11:58', '8468bf66-90e8-4743-b6d6-8d59f6bc3557'),
(32, 1, NULL, 1, 1, '2021-10-17 17:39:00', NULL, NULL, '2021-10-17 18:13:04', '2021-10-17 18:13:04', '5e9b5f5a-f812-4af6-aae1-8fa4884d7c47'),
(33, 1, NULL, 1, 1, '2021-10-17 18:13:00', NULL, NULL, '2021-10-17 18:13:12', '2021-10-17 18:13:12', '971fd952-56bc-459a-bf72-832fb43eef62'),
(35, 1, NULL, 1, 1, '2021-10-17 18:13:00', NULL, NULL, '2021-10-17 18:13:49', '2021-10-17 18:13:49', 'fdc741ef-f245-43e7-8286-ea775690a930'),
(36, 1, NULL, 1, 1, '2021-10-17 18:14:00', NULL, NULL, '2021-10-17 18:14:02', '2021-10-17 18:14:02', '78b0a636-6e25-4043-b7e3-cc0463937c3d'),
(38, 1, NULL, 1, 1, '2021-10-17 18:14:00', NULL, NULL, '2021-10-17 18:14:24', '2021-10-17 18:14:24', 'c7adac55-0a4d-446b-b2c0-8fc09ea3393c');

-- --------------------------------------------------------

--
-- Table structure for table `vt_entrytypes`
--

CREATE TABLE `vt_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_entrytypes`
--

INSERT INTO `vt_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 2, 'EntryContent', 'entryContent', 1, 'site', NULL, NULL, 1, '2021-10-17 17:16:39', '2021-10-17 18:10:41', NULL, '8c2393d4-a13d-460b-9a7b-8e64e6f85ca0'),
(2, 2, 7, 'Homepage', 'homepage', 0, 'site', NULL, '{section.name|raw}', 1, '2021-10-17 17:42:49', '2021-10-17 17:42:49', NULL, 'eaf0e5b9-282c-4882-9ee2-20f2d2999559'),
(3, 3, 8, 'Banner', 'banner', 1, 'site', NULL, '{section.name|raw}', 1, '2021-10-17 17:45:08', '2021-10-17 17:45:34', NULL, '4c5538a0-58a3-41b4-8f7a-d92adbdd0f20'),
(4, 4, 9, 'Hero', 'hero', 1, 'site', NULL, '{section.name|raw}', 1, '2021-10-17 18:08:54', '2021-10-17 18:09:23', NULL, '9508267f-c357-4054-942b-5c20f66372d4');

-- --------------------------------------------------------

--
-- Table structure for table `vt_fieldgroups`
--

CREATE TABLE `vt_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_fieldgroups`
--

INSERT INTO `vt_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-10-15 16:48:19', '2021-10-15 16:48:19', NULL, 'daa2e738-b5aa-483e-88d3-5ddee8af7f56'),
(2, 'Entry Fields', '2021-10-17 17:18:41', '2021-10-17 17:18:41', NULL, '917431a5-6e7c-4bac-82cc-6ed8acdaec51');

-- --------------------------------------------------------

--
-- Table structure for table `vt_fieldlayoutfields`
--

CREATE TABLE `vt_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_fieldlayoutfields`
--

INSERT INTO `vt_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 3, 8, 5, 0, 0, '2021-10-17 17:36:29', '2021-10-17 17:36:29', '2bb2fab6-18b8-4ff4-951e-c4dcc79775d0'),
(5, 3, 8, 4, 0, 1, '2021-10-17 17:36:29', '2021-10-17 17:36:29', '5e7d13aa-a3ed-4ef8-8efc-4b4b03d0eaff'),
(6, 4, 9, 6, 0, 0, '2021-10-17 17:36:30', '2021-10-17 17:36:30', '0c9995e7-e0af-402d-8399-507c73a7ab64'),
(7, 6, 10, 3, 0, 0, '2021-10-17 17:37:35', '2021-10-17 17:37:35', '069c0969-8acd-4d50-9ca5-0e4102e6a431'),
(8, 8, 13, 1, 0, 1, '2021-10-17 17:45:34', '2021-10-17 17:45:34', '24b0b519-e466-47ac-81d2-dde628c3d7cf'),
(9, 8, 13, 2, 0, 2, '2021-10-17 17:45:34', '2021-10-17 17:45:34', '6b799ef4-6bac-4c52-8147-8a27fc91d3b9'),
(10, 9, 15, 1, 0, 1, '2021-10-17 18:09:23', '2021-10-17 18:09:23', 'ccd00fce-b00d-4830-a1ce-e04e7b0365ba'),
(11, 9, 15, 2, 0, 2, '2021-10-17 18:09:23', '2021-10-17 18:09:23', '9ad90bf0-9278-4778-9fb0-48488de72ca1'),
(12, 2, 16, 1, 0, 1, '2021-10-17 18:10:41', '2021-10-17 18:10:41', '52a589d8-3395-45ef-b2bb-3ca716ec7718'),
(13, 2, 16, 2, 0, 2, '2021-10-17 18:10:41', '2021-10-17 18:10:41', '97f7e83e-cf67-48bd-a1dc-cfe466e4a826');

-- --------------------------------------------------------

--
-- Table structure for table `vt_fieldlayouts`
--

CREATE TABLE `vt_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_fieldlayouts`
--

INSERT INTO `vt_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Asset', '2021-10-17 17:13:05', '2021-10-17 17:13:05', NULL, '6b2b109c-2fcf-4394-9a6e-82e70ccf1a08'),
(2, 'craft\\elements\\Entry', '2021-10-17 17:16:39', '2021-10-17 17:16:39', NULL, '3e69e193-b42b-4beb-984d-90c7f2eeefea'),
(3, 'craft\\elements\\MatrixBlock', '2021-10-17 17:34:03', '2021-10-17 17:34:03', NULL, '3eb1a1a8-59ad-447d-9284-b711acf15af0'),
(4, 'craft\\elements\\MatrixBlock', '2021-10-17 17:34:04', '2021-10-17 17:34:04', NULL, '28123133-158b-42b9-8f6c-49fce8ae554e'),
(5, 'craft\\elements\\Asset', '2021-10-17 17:35:20', '2021-10-17 17:35:20', NULL, 'ae583df8-d75a-4dec-b0bb-c6ed9e4b577a'),
(6, 'craft\\elements\\GlobalSet', '2021-10-17 17:37:34', '2021-10-17 17:37:34', NULL, '371087b3-0dce-4bdc-8053-c41be8dff8ff'),
(7, 'craft\\elements\\Entry', '2021-10-17 17:42:49', '2021-10-17 17:42:49', NULL, 'c709fbff-3590-4b57-85af-90a26c48b87c'),
(8, 'craft\\elements\\Entry', '2021-10-17 17:45:07', '2021-10-17 17:45:07', NULL, '51d5aa4c-3888-4fc1-aebc-445c22fc0309'),
(9, 'craft\\elements\\Entry', '2021-10-17 18:08:54', '2021-10-17 18:08:54', NULL, '9f88d1a5-8a76-4241-b47b-50d50858f8c9');

-- --------------------------------------------------------

--
-- Table structure for table `vt_fieldlayouttabs`
--

CREATE TABLE `vt_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_fieldlayouttabs`
--

INSERT INTO `vt_fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-10-17 17:14:22', '2021-10-17 17:14:22', '79412959-8ee7-4870-87bf-4e1befb0c0e2'),
(7, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-10-17 17:35:48', '2021-10-17 17:35:48', 'da538668-932f-46b9-b8d3-1bef493dadcf'),
(8, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"71c89165-9bcd-4f42-9b24-ba5a34bc3342\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8d9df68f-eb65-4862-9a85-f6c36b14e5a6\"}]', 1, '2021-10-17 17:36:29', '2021-10-17 17:36:29', '2c79c014-162a-4d70-8fe8-651f5ec55ce6'),
(9, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"976b73a6-9c2f-4d42-b7a4-27477d68133c\"}]', 1, '2021-10-17 17:36:29', '2021-10-17 17:36:29', 'ac377281-b183-46df-a4b4-c2a965f95254'),
(10, 6, 'Nav Item', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"984b744a-c73a-4d47-b429-e5a9b311a18d\"}]', 1, '2021-10-17 17:37:35', '2021-10-17 17:37:35', 'c9ff1115-182b-4d09-8848-4a27ad123edd'),
(11, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-10-17 17:42:49', '2021-10-17 17:42:49', '9720d9e4-eccf-4db5-a92c-2f12ffde0a97'),
(13, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c9df0165-79e7-4f94-9094-259a8d4559d9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bfceefd6-3148-456c-bd4e-249539cff7ec\"}]', 1, '2021-10-17 17:45:34', '2021-10-17 17:45:34', '5bd2d520-d666-4117-a0b5-9c43e79ba56f'),
(15, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c9df0165-79e7-4f94-9094-259a8d4559d9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bfceefd6-3148-456c-bd4e-249539cff7ec\"}]', 1, '2021-10-17 18:09:23', '2021-10-17 18:09:23', '0a243d5c-aeba-4a94-a597-4a6f70ccd9be'),
(16, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c9df0165-79e7-4f94-9094-259a8d4559d9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bfceefd6-3148-456c-bd4e-249539cff7ec\"}]', 1, '2021-10-17 18:10:41', '2021-10-17 18:10:41', 'f3d20080-9560-47b7-bddc-051f6fe141b9');

-- --------------------------------------------------------

--
-- Table structure for table `vt_fields`
--

CREATE TABLE `vt_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_fields`
--

INSERT INTO `vt_fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'Image Data', 'imageData', 'global', NULL, '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:245afdaf-6be5-47e9-b0f0-00f2e1bfbf64\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:245afdaf-6be5-47e9-b0f0-00f2e1bfbf64\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2021-10-17 17:19:36', '2021-10-17 17:19:36', 'c9df0165-79e7-4f94-9094-259a8d4559d9'),
(2, 2, 'Redactor Content', 'redactorContent', 'global', 'isxssiwm', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2021-10-17 17:25:52', '2021-10-17 17:25:52', 'bfceefd6-3148-456c-bd4e-249539cff7ec'),
(3, 1, 'Nav Link', 'navLink', 'global', NULL, '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_navlink}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}', '2021-10-17 17:34:02', '2021-10-17 17:34:02', '984b744a-c73a-4d47-b429-e5a9b311a18d'),
(4, NULL, 'Link Url', 'linkUrl', 'matrixBlockType:cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d', NULL, '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-10-17 17:34:03', '2021-10-17 17:36:28', '8d9df68f-eb65-4862-9a85-f6c36b14e5a6'),
(5, NULL, 'Link Label', 'linkLabel', 'matrixBlockType:cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d', NULL, '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":50,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-10-17 17:34:03', '2021-10-17 17:36:29', '71c89165-9bcd-4f42-9b24-ba5a34bc3342'),
(6, NULL, 'Link Logo', 'linkLogo', 'matrixBlockType:44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954', NULL, '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:e9100a30-3277-403d-81f2-a15eb8a37fe2\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:245afdaf-6be5-47e9-b0f0-00f2e1bfbf64\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2021-10-17 17:34:04', '2021-10-17 17:36:29', '976b73a6-9c2f-4d42-b7a4-27477d68133c');

-- --------------------------------------------------------

--
-- Table structure for table `vt_globalsets`
--

CREATE TABLE `vt_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_globalsets`
--

INSERT INTO `vt_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 'Navigation', 'navigation', 6, 1, '2021-10-17 17:28:02', '2021-10-17 17:37:35', '14dd5e06-b590-4c77-8dd4-f2441b8b15a0');

-- --------------------------------------------------------

--
-- Table structure for table `vt_gqlschemas`
--

CREATE TABLE `vt_gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_gqltokens`
--

CREATE TABLE `vt_gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_info`
--

CREATE TABLE `vt_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_info`
--

INSERT INTO `vt_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.16', '3.7.8', 0, 'ktbyhokbgqsz', 'foucwgthjqmo', '2021-10-15 16:48:19', '2021-10-17 18:10:41', '2756548c-8b25-4191-8e4e-31593b8dd635');

-- --------------------------------------------------------

--
-- Table structure for table `vt_matrixblocks`
--

CREATE TABLE `vt_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_matrixblocks`
--

INSERT INTO `vt_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 2, 3, 1, 1, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '5e386f70-6cc7-4532-b765-2c0bff970ebe'),
(5, 2, 3, 1, 2, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '3c848e34-dfdd-4459-a5ad-5d6257e86ee8'),
(6, 2, 3, 1, 3, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '09f6c871-4033-4f53-aae5-010c873d3ae9'),
(7, 2, 3, 2, 4, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '153a2ac6-8f99-49e6-95ae-9e5c5d2b2e3a'),
(8, 2, 3, 1, 5, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', 'c2a8745b-d70e-49e1-860a-ca0a820a00a3'),
(9, 2, 3, 1, 6, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '0ded3294-6e27-4482-8dc4-3eb308b6d35c'),
(10, 2, 3, 1, 7, NULL, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '778fd2a0-5cac-4f3d-aad7-16e7f97a60dc');

-- --------------------------------------------------------

--
-- Table structure for table `vt_matrixblocktypes`
--

CREATE TABLE `vt_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_matrixblocktypes`
--

INSERT INTO `vt_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 3, 'Link', 'link', 1, '2021-10-17 17:34:04', '2021-10-17 17:34:04', 'cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d'),
(2, 3, 4, 'Logo Icon', 'logoIcon', 2, '2021-10-17 17:34:04', '2021-10-17 17:34:04', '44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954');

-- --------------------------------------------------------

--
-- Table structure for table `vt_matrixcontent_navlink`
--

CREATE TABLE `vt_matrixcontent_navlink` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_link_linkUrl` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `field_link_linkLabel` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_matrixcontent_navlink`
--

INSERT INTO `vt_matrixcontent_navlink` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_link_linkUrl`, `field_link_linkLabel`) VALUES
(1, 4, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', 'aa349624-ec85-404d-8a30-502a7ddb7758', '#nav1', 'Navigation 1'),
(2, 5, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '4247fe4e-40ad-49bf-9e13-4b6f87b2964b', '#nav2', 'Navigation 2'),
(3, 6, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '640d6bdd-6d7a-4d26-9854-142a3d6547da', '#nav3', 'Navigation 3'),
(4, 7, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '699780df-b46d-44e7-b664-5de63f2c946e', NULL, NULL),
(5, 8, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '90e95970-4443-4383-b3d7-7938b0385157', '#nav4', 'Navigation 4'),
(6, 9, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', 'c1ff0b28-1bc2-47a6-ad56-92eee29d85c3', '#nav5', 'Navigation 5'),
(7, 10, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '16d74abb-c943-40ff-b8b2-9c183660affb', '#nav6', 'Navigation 6');

-- --------------------------------------------------------

--
-- Table structure for table `vt_migrations`
--

CREATE TABLE `vt_migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_migrations`
--

INSERT INTO `vt_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '95e4db7d-3d29-469c-8897-85f265fb2971'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '6ee4dfcc-45cc-4ead-8d06-fdfc30a290f3'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '33df8b3e-3498-489a-b922-f5a3d45bc2b0'),
(4, 'craft', 'm150403_184533_field_version', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '73608e83-dd32-435f-8eb4-ff8431d033c2'),
(5, 'craft', 'm150403_184729_type_columns', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '475794e1-d0a1-422d-9552-83cbf73e8582'),
(6, 'craft', 'm150403_185142_volumes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '540c43aa-2131-4d71-8f53-439772551723'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f47bae97-8283-4ede-9308-2149d41e67e6'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '8c5c7d74-0ff1-464b-90dd-1260853da9bd'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '87fcc17b-309c-4cf8-b023-7671df083050'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '3af1c3aa-a5e4-4c37-8bff-aea000988431'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '64ea2b2c-7561-478b-89c3-ddd1a1762aa3'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f8f6195c-6732-4a45-a30b-35907c7be18d'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9d274320-a1ea-43fe-b6a8-4009f9107341'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a69766a5-88d9-4c44-a585-a632f7b8b31c'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '24e1f435-96db-4e1b-bbc0-18c21470d4ee'),
(16, 'craft', 'm151209_000000_move_logo', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '6411b24b-9c4e-4211-b30d-d0fdda2ee2dd'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '74922b38-7aa5-4a16-a4c1-a73768ab76a7'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '1c0a4167-6442-48f2-9966-60a1382dd253'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'bcef4926-8ad8-43b0-b2e4-42a3730abb97'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '24a6c628-e5c7-4748-8159-20fc06d9b374'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2be62638-4e46-4004-a0b0-65d98b60c54a'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '669edc95-2e24-40c2-b0a6-aa3fcd5aa59c'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '80a79d90-d65b-4933-bb6f-29ed709a479f'),
(24, 'craft', 'm160807_144858_sites', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '37ed7f55-1df9-49ca-9dbb-c6c55c11ea22'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '8c458220-5355-4c4e-b8d2-4969efd508f8'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'fdd618a7-9aa2-4638-8034-b88e95693948'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '5659a1c4-3883-4603-8224-2d18e67e14e7'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9f7cea86-2377-4dbb-abc5-09d0622b4299'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0ebce080-aefb-4b2d-9024-fa3b9998d66f'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c11e966e-361c-4a89-9355-1784117ca0fd'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '71c4d752-9879-4db0-a5f2-d95d19d6ec9c'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '5d6d2850-4463-432f-aefd-e999c68d8dac'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'd1a5f79e-fcab-4dbd-aacf-119bcdf6b96b'),
(34, 'craft', 'm161013_175052_newParentId', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '8fd57294-5955-4e67-8563-28e9867ac12f'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '4ef65fdd-76a8-4b0f-886c-ae06e27e6dab'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'af74663f-02c3-41b8-a2ee-7906594fe7da'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '10cfdf33-2fd5-409b-bada-47f8166e396a'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '5984c4ac-d593-49fc-882a-2d5502851207'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '10e5218c-f85f-43df-84b3-d4df2b1968da'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '472c794a-0dab-44c5-afca-730c9588c831'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '73d9807b-ac04-4570-8ec3-3d7117aa78a6'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '4cee4502-a6a5-44a2-a521-ac999f79b672'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2e579141-19a2-4d53-b501-2021bd5333cf'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '395242ab-d0f7-416c-bc23-89b81ae4ae2d'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7281f760-0b0d-431c-a389-9c7625e55f7e'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '56b289ac-e3a0-456f-a82d-112c321e7017'),
(47, 'craft', 'm170206_142126_system_name', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'fa1131c9-8bbf-49f8-aa56-5e15b194b310'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '04f7ae78-e345-426e-b78b-ac4b85e56313'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '3814e561-88b0-4381-a48e-fe2e6e4b0c30'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'd8693b21-c4be-450b-a685-ffdba0998c64'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7560ef2b-919f-466f-9471-d68cebba3fdb'),
(52, 'craft', 'm170228_171113_system_messages', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'dfe6d702-83c9-4b91-bdb1-a1cac74c494f'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'de66b427-118a-482f-b952-d8b44730420b'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c13a8bff-11d4-40f0-8aac-21ca934650f0'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9d9a3a6b-cc1a-4bb7-879b-92e57b1e6346'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '1a2e3c46-5365-4860-9fe9-b9c6368655d7'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '17039122-b37a-42b6-a58b-c2839a54daa6'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '63f648fb-2cbf-4605-ab9f-6065fda7b01c'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0d0cf69d-aa28-458d-928a-99ffbeece5ef'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '891a7e9d-19b0-4b3c-8797-582d4194a8a7'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '058893e8-a70b-4968-9dbd-e715792a9020'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f6c72cf2-a8d2-4b5a-80be-5386d1d8aba1'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '09364dfe-d6b2-4493-97d2-a4de3e8753ea'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c2ae619a-8bab-46e4-a2d8-2c08489e33b2'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7c223263-d740-4b02-8021-41106daf567d'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7d7a5be2-60d2-4811-b68d-b4d0077b508e'),
(67, 'craft', 'm171011_214115_site_groups', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '93bca62f-d90d-4ee3-a302-7bb7844abedc'),
(68, 'craft', 'm171012_151440_primary_site', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7b355058-4b7f-481b-a764-52b6f0c56be4'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2238bcf6-371c-47fc-9f87-0a98e01564cb'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '344fbec3-4fbe-4782-8ac8-60af9c53fef2'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '238f8481-ea15-4362-ab48-b742db0ef1c8'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'cbff68da-a131-4d80-8b6a-59ab471439a5'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'ee230af5-fc2f-4060-bdb4-a99ad12f8804'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'd51ae1dc-8211-44ef-975b-e92d9bc620ac'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9a5ccd65-dc11-4d7b-867a-82bfab51cce1'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '404dc09d-7481-4611-9749-3da13d71bcd3'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'b6165d03-5954-4cef-9e1a-fde46b045f95'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a990509a-6f68-4ef5-835a-68495b4ee34c'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c4d4d806-c1c9-4f6e-af2b-9653a657aa2e'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'b57cefa7-1a6b-4fad-93dd-4e04916ca649'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '990a386b-d5b2-49e0-9b46-c52bc8081a1a'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f2269641-650d-48bb-911a-29f01a6a3b5c'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'aa2b6413-b11e-45c1-8242-9e359c57eb6e'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '6820b3a0-00bf-4294-9361-174f8e32e757'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0480d3a4-e09d-4a11-abc8-c47b02777c30'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '088a7b24-db16-4316-8b09-8a4345680923'),
(87, 'craft', 'm180321_233505_small_ints', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '3a61a78c-96e8-46f7-83d4-df6b91e80102'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9d99bc9f-76d5-465b-8982-18b6aef91524'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '967418d4-0ae4-4de4-bc52-63e377447931'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '26cf179a-5680-4273-a905-1d8ceb6f3f1d'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '603a92c5-d611-49c4-95bd-8f44504a5aa3'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'b8d2cffe-a536-4198-aa0c-e13adb5fdd68'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '84edc195-2237-4b19-b934-fc4c23a08449'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '193c61cc-c376-4406-afc9-37dd60064812'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a085bffa-2fbc-4e50-815f-d029584dc3a5'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'afc00e5e-c2d6-4513-a2e0-864ad58e6ce0'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'ee1de7b5-2c0d-4c28-ac11-5c51416fd37c'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'db454c15-f8ea-4e4a-8718-b098ae56d42b'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '35c506db-33e7-4d9e-bc8c-06da63b3e569'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '647237c9-dc38-4f56-9357-0eefe6908d13'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '1d7e092d-e461-4668-bfa1-8e5bb1c19842'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f5a5ef9c-fff3-443e-a860-08de6dbfe33a'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'bc8cb264-ec25-4573-bf9e-0e3d817a4223'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '1ab99f4a-954b-49ea-bc0d-f950e95f89ed'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'ec1dc2b4-2f20-4a89-a316-ab05b894b20c'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '4ab7ae31-1738-4ab4-9116-a0ff8fb7c67f'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f8d9995d-4610-4e99-8a84-ef9d9a30adb1'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '03f569cb-727a-4502-baca-14ab91e193b4'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7ed8f4ae-471e-45f6-b7c6-5bc317d3766d'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '85eb9cf5-0993-45a6-94ca-12b1f905f36e'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '31992cd3-bccf-4b22-92ac-447eb55fd612'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '8dbc98c8-789a-49b4-8b74-95c7a4d045bd'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9c239e6b-fcea-48e1-ae23-28e99b3d8d2c'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '3f125152-281f-44e1-81bc-e6c0ba59c1eb'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'e5e18059-9a51-4392-a392-dc6868b3329e'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '8218567b-7e95-4639-b6d9-ba3697e22e3d'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '98fbc965-40ab-4da2-8120-166a30227d1c'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'd46eb91b-ed3d-4f61-be0e-97876e096e0c'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '513ba698-f339-4c51-a1bb-b39e48a29e58'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '68d21db0-a5ea-428a-85e9-56bc195176ff'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'fb230c62-6d84-471d-9cca-cf20a2606285'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '07f5745c-357a-45bc-ad33-a1d02ff12c13'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0fff3cfa-68b3-495e-a5b4-31e9944cfbd7'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'e1d07589-1ae2-4c22-af77-70b0c1e707ba'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '6f062b59-3aef-4951-ba13-45e9dca090c0'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '283133fb-9e03-4020-8ee1-10bd849ca9d0'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0bcb750d-0874-4c50-89b8-1622dcd5bb60'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f8314461-40b4-42b8-bad1-6a69bc64011e'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '75b193dd-371f-49c4-8c89-8e1eda67a4ac'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7035abb3-107e-4242-b6e0-2973834bbe9a'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'df55f3db-9297-4617-b37f-51eaf9d35d90'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '842b519c-29dc-4b93-a3a5-eebfa326f336'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0f768f82-d724-4ea8-8119-b9c1e1afa6d4'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'b6807dfa-ea2b-4440-9e75-356177962778'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0ca4ae61-553a-474a-88d7-2f1d0c3fabc4'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '53d32d0e-e072-48e9-af5b-b429e3be9ea4'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'd76d7e67-342c-483a-a5e4-3da9de83b22d'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'fbf96256-f266-4430-aebe-e656f1838d8a'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '17085880-d1c4-48c0-a0d8-d2c6a004c6b4'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'dfed1915-5c83-4932-bb50-3878a889feac'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '46597e67-c63b-47f3-9c45-4a6199bb9b3e'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '293cf146-e8f5-473a-8233-c74966135fee'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f5967254-4171-424f-afc5-5d5942eb470a'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'd24de2cf-06b6-483b-a031-25fe23ddd67a'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'cbf0e10a-36de-452a-9a0d-b80c3f04481e'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '20cafd59-38df-4fcf-a452-c532e749bc92'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c6d289bf-1264-40dc-92e2-04b5f6b64e44'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'cb71cdac-f8f3-4ed2-9d64-51bca08d50bd'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '262b3ec8-7ef7-4c07-939a-4ef491f07939'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c6b53ca1-9b93-499e-9153-218ed45197fb'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'e46a7484-2b3b-4c64-93ae-a9832931346f'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '6b727f8a-01c8-46b0-9b99-4dad6a1dd6d3'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'e5e2c21d-a993-415c-b97a-dc416bd244c4'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '819aad9f-c03f-419c-bda8-cfe7a5394999'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a4090bd7-595e-4a20-b99b-6b385998196e'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '280432ae-52e1-4e88-a755-f17ef630c730'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'c466ed3e-8107-46e3-9eb0-588f1104ee65'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'caa869e0-9a37-4db3-b811-3bff513e8b9d'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '3bef04b5-2c8e-45c5-bfce-aa7d526cdd58'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '70b2487b-f51c-4c11-b7bb-0b79c6b938f8'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'acbf8511-45b6-4458-ace3-6dab84763ec9'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'bb8360cb-a2e4-4e3a-ac31-6229c33be963'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0d2b4747-1bbc-4661-93b5-1421f7fb8394'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0930b92b-dc83-4b7f-857b-db9776775d85'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '20075ec1-66cb-425a-ae1d-198cd9994489'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'b80e058d-83d9-4697-b526-851b30d3bb92'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '402fa48e-100b-496b-bffb-bf54160dc477'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '208dbd0c-995a-4394-be55-ffc721bc275e'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'dfca5645-f954-443a-9063-a5038f5b8a21'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '27fbdd27-0a4d-492b-b88f-41b8f558f631'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2dd8b0b1-f9cb-4a8e-835f-6a23e5fbf4cb'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '9e9f3683-f719-4ab7-81f5-ebbd5a545635'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '93a00244-402d-433e-8ee4-ce1eec45e3d6'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a93163ee-5267-4290-b3f0-e355382e8275'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'b7b18854-0762-4de2-95ff-c091680618eb'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '96dcc50f-6436-4a30-bbd5-ba33558748a7'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'ab6b56d3-bb42-4b24-b99e-bd47db565e98'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'fa0ff86b-7f19-42ae-8301-e47d14cb4b72'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '95443bc4-416d-427b-b672-dd56ebeead49'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'f598c79a-4e5a-458c-ad0a-3b7760dc26c2'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a56dd434-384b-419a-bc18-78fbb0b5d818'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '0923c133-d60d-435f-bbd1-f330263598b5'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '37d0ce8e-b713-40c8-a84a-8d6d5b7ae619'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '35f02c3f-1f6f-40b5-a188-c4317e54af9e'),
(185, 'craft', 'm210331_220322_null_author', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '261f5367-3b5a-42c6-ba58-a9038060edee'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '1d1ebeaa-e0d6-4abd-8c5d-07a91bbe04ca'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '443ae80b-69ae-421a-9dab-928aee02c157'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '4c269ad2-488c-444d-8153-1540b3de7d14'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '5fd375d8-13d6-4d72-ad8e-59eca7ad9974'),
(190, 'craft', 'm210613_184103_announcements', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '7a6b72b1-6a2a-428e-9c69-1d5307ed8a61'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2021-10-15 16:48:21', '2021-10-15 16:48:21', '2021-10-15 16:48:21', 'a834f04e-0180-4c9b-9cd9-69b55dd8faf9'),
(192, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2021-10-17 17:20:47', '2021-10-17 17:20:47', '2021-10-17 17:20:47', 'fb8cf72c-546e-4b66-9cd9-3771cdbad321'),
(193, 'plugin:redactor', 'Install', '2021-10-17 17:20:47', '2021-10-17 17:20:47', '2021-10-17 17:20:47', '683f314a-af45-4c8a-a880-1b13f94f0466'),
(194, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2021-10-17 17:20:48', '2021-10-17 17:20:48', '2021-10-17 17:20:48', '8b0993b4-38e2-4c37-b2b1-41f8e35f7d74');

-- --------------------------------------------------------

--
-- Table structure for table `vt_plugins`
--

CREATE TABLE `vt_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_plugins`
--

INSERT INTO `vt_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.8', '2.3.0', 'unknown', NULL, '2021-10-17 17:20:47', '2021-10-17 17:20:47', '2021-10-17 17:28:51', '5ce01396-c7e3-493f-bcf0-b6729478b22d'),
(2, 'element-api', '2.8.3', '1.0.0', 'unknown', NULL, '2021-10-17 17:21:28', '2021-10-17 17:21:28', '2021-10-17 17:28:50', '4a0e8063-cc32-49f3-8601-c644316e438e');

-- --------------------------------------------------------

--
-- Table structure for table `vt_projectconfig`
--

CREATE TABLE `vt_projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_projectconfig`
--

INSERT INTO `vt_projectconfig` (`path`, `value`) VALUES
('dateModified', '1634494241'),
('email.fromEmail', '\"rasheedsaidi@gmail.com\"'),
('email.fromName', '\"Tech Task\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.class', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.disabled', 'false'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.id', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.instructions', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.label', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.max', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.min', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.name', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.orientation', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.readonly', 'false'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.requirable', 'false'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.size', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.step', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.tip', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.title', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.warning', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.0.width', '100'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.fieldUid', '\"c9df0165-79e7-4f94-9094-259a8d4559d9\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.instructions', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.label', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.required', 'false'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.tip', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.warning', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.1.width', '100'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.fieldUid', '\"bfceefd6-3148-456c-bd4e-249539cff7ec\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.instructions', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.label', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.required', 'false'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.tip', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.warning', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.elements.2.width', '100'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.name', '\"Content\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.fieldLayouts.51d5aa4c-3888-4fc1-aebc-445c22fc0309.tabs.0.sortOrder', '1'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.handle', '\"banner\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.hasTitleField', 'true'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.name', '\"Banner\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.section', '\"a6ce5709-494e-4189-b371-d461cab04188\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.sortOrder', '1'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.titleTranslationKeyFormat', 'null'),
('entryTypes.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20.titleTranslationMethod', '\"site\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.class', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.disabled', 'false'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.id', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.instructions', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.label', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.max', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.min', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.name', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.orientation', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.readonly', 'false'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.requirable', 'false'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.size', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.step', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.tip', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.title', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.warning', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.0.width', '100'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.fieldUid', '\"c9df0165-79e7-4f94-9094-259a8d4559d9\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.instructions', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.label', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.required', 'false'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.tip', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.warning', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.1.width', '100'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.fieldUid', '\"bfceefd6-3148-456c-bd4e-249539cff7ec\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.instructions', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.label', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.required', 'false'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.tip', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.warning', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.elements.2.width', '100'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.name', '\"Content\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.fieldLayouts.3e69e193-b42b-4beb-984d-90c7f2eeefea.tabs.0.sortOrder', '1'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.handle', '\"entryContent\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.hasTitleField', 'true'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.name', '\"EntryContent\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.section', '\"6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf\"'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.sortOrder', '1'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.titleFormat', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.titleTranslationKeyFormat', 'null'),
('entryTypes.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0.titleTranslationMethod', '\"site\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.class', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.disabled', 'false'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.id', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.instructions', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.label', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.max', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.min', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.name', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.orientation', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.readonly', 'false'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.requirable', 'false'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.size', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.step', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.tip', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.title', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.warning', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.0.width', '100'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.fieldUid', '\"c9df0165-79e7-4f94-9094-259a8d4559d9\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.instructions', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.label', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.required', 'false'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.tip', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.warning', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.1.width', '100'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.fieldUid', '\"bfceefd6-3148-456c-bd4e-249539cff7ec\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.instructions', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.label', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.required', 'false'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.tip', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.warning', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.elements.2.width', '100'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.name', '\"Content\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.fieldLayouts.9f88d1a5-8a76-4241-b47b-50d50858f8c9.tabs.0.sortOrder', '1'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.handle', '\"hero\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.hasTitleField', 'true'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.name', '\"Hero\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.section', '\"e9b967f6-fd19-4724-9ec8-72c84279cbc6\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.sortOrder', '1'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.titleTranslationKeyFormat', 'null'),
('entryTypes.9508267f-c357-4054-942b-5c20f66372d4.titleTranslationMethod', '\"site\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.class', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.disabled', 'false'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.id', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.instructions', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.label', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.max', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.min', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.name', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.orientation', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.readonly', 'false'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.requirable', 'false'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.size', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.step', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.tip', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.title', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.warning', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.elements.0.width', '100'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.name', '\"Content\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.fieldLayouts.c709fbff-3590-4b57-85af-90a26c48b87c.tabs.0.sortOrder', '1'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.handle', '\"homepage\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.hasTitleField', 'false'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.name', '\"Homepage\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.section', '\"a1adae4b-f87a-4e73-b571-36a462a77f58\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.sortOrder', '1'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.titleTranslationKeyFormat', 'null'),
('entryTypes.eaf0e5b9-282c-4882-9ee2-20f2d2999559.titleTranslationMethod', '\"site\"'),
('fieldGroups.917431a5-6e7c-4bac-82cc-6ed8acdaec51.name', '\"Entry Fields\"'),
('fieldGroups.daa2e738-b5aa-483e-88d3-5ddee8af7f56.name', '\"Common\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.columnSuffix', 'null'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.contentColumnType', '\"string\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.fieldGroup', '\"daa2e738-b5aa-483e-88d3-5ddee8af7f56\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.handle', '\"navLink\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.instructions', '\"\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.name', '\"Nav Link\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.searchable', 'false'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.settings.contentTable', '\"{{%matrixcontent_navlink}}\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.settings.maxBlocks', '\"\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.settings.minBlocks', '\"\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.settings.propagationKeyFormat', 'null'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.settings.propagationMethod', '\"all\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.translationKeyFormat', 'null'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.translationMethod', '\"site\"'),
('fields.984b744a-c73a-4d47-b429-e5a9b311a18d.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.columnSuffix', '\"isxssiwm\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.contentColumnType', '\"text\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.fieldGroup', '\"917431a5-6e7c-4bac-82cc-6ed8acdaec51\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.handle', '\"redactorContent\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.instructions', '\"\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.name', '\"Redactor Content\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.searchable', 'false'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.availableTransforms', '\"*\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.availableVolumes', '\"*\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.cleanupHtml', 'true'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.columnType', '\"text\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.configSelectionMode', '\"choose\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.defaultTransform', '\"\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.manualConfig', '\"\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.purifierConfig', '\"\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.purifyHtml', '\"1\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.redactorConfig', '\"\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.removeEmptyTags', '\"1\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.removeInlineStyles', '\"1\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.removeNbsp', '\"1\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.showHtmlButtonForNonAdmins', '\"\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.showUnpermittedFiles', 'false'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.showUnpermittedVolumes', 'false'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.settings.uiMode', '\"enlarged\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.translationKeyFormat', 'null'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.translationMethod', '\"none\"'),
('fields.bfceefd6-3148-456c-bd4e-249539cff7ec.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.columnSuffix', 'null'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.contentColumnType', '\"string\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.fieldGroup', '\"917431a5-6e7c-4bac-82cc-6ed8acdaec51\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.handle', '\"imageData\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.instructions', '\"\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.name', '\"Image Data\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.searchable', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.allowedKinds', 'null'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.allowSelfRelations', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.allowUploads', 'true'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.defaultUploadLocationSource', '\"volume:245afdaf-6be5-47e9-b0f0-00f2e1bfbf64\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.limit', '\"1\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.localizeRelations', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.previewMode', '\"full\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.restrictFiles', '\"\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.selectionLabel', '\"\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.showSiteMenu', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.showUnpermittedFiles', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.showUnpermittedVolumes', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.singleUploadLocationSource', '\"volume:245afdaf-6be5-47e9-b0f0-00f2e1bfbf64\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.singleUploadLocationSubpath', '\"\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.source', 'null'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.sources', '\"*\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.targetSiteId', 'null'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.useSingleFolder', 'true'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.validateRelatedElements', 'false'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.settings.viewMode', '\"list\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.translationKeyFormat', 'null'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.translationMethod', '\"site\"'),
('fields.c9df0165-79e7-4f94-9094-259a8d4559d9.type', '\"craft\\\\fields\\\\Assets\"'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.fieldUid', '\"984b744a-c73a-4d47-b429-e5a9b311a18d\"'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.instructions', 'null'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.label', 'null'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.required', 'false'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.tip', 'null'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.warning', 'null'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.elements.0.width', '100'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.name', '\"Nav Item\"'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.fieldLayouts.371087b3-0dce-4bdc-8053-c41be8dff8ff.tabs.0.sortOrder', '1'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.handle', '\"navigation\"'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.name', '\"Navigation\"'),
('globalSets.14dd5e06-b590-4c77-8dd4-f2441b8b15a0.sortOrder', '1'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.field', '\"984b744a-c73a-4d47-b429-e5a9b311a18d\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.fieldUid', '\"976b73a6-9c2f-4d42-b7a4-27477d68133c\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fieldLayouts.28123133-158b-42b9-8f6c-49fce8ae554e.tabs.0.sortOrder', '1'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.columnSuffix', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.contentColumnType', '\"string\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.fieldGroup', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.handle', '\"linkLogo\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.instructions', '\"\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.name', '\"Link Logo\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.searchable', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.allowedKinds', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.allowUploads', 'true'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.defaultUploadLocationSource', '\"volume:e9100a30-3277-403d-81f2-a15eb8a37fe2\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.defaultUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.limit', '\"1\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.localizeRelations', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.previewMode', '\"full\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.restrictFiles', '\"\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.showSiteMenu', 'true'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.singleUploadLocationSource', '\"volume:245afdaf-6be5-47e9-b0f0-00f2e1bfbf64\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.singleUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.source', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.sources', '\"*\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.targetSiteId', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.useSingleFolder', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.settings.viewMode', '\"list\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.translationKeyFormat', 'null'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.translationMethod', '\"site\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.fields.976b73a6-9c2f-4d42-b7a4-27477d68133c.type', '\"craft\\\\fields\\\\Assets\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.handle', '\"logoIcon\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.name', '\"Logo Icon\"'),
('matrixBlockTypes.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954.sortOrder', '2'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.field', '\"984b744a-c73a-4d47-b429-e5a9b311a18d\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.fieldUid', '\"71c89165-9bcd-4f42-9b24-ba5a34bc3342\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.fieldUid', '\"8d9df68f-eb65-4862-9a85-f6c36b14e5a6\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fieldLayouts.3eb1a1a8-59ad-447d-9284-b711acf15af0.tabs.0.sortOrder', '1'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.columnSuffix', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.contentColumnType', '\"string(200)\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.fieldGroup', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.handle', '\"linkLabel\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.instructions', '\"\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.name', '\"Link Label\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.searchable', 'false'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.byteLimit', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.charLimit', '50'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.code', '\"\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.columnType', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.initialRows', '\"4\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.multiline', '\"\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.placeholder', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.translationKeyFormat', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.translationMethod', '\"none\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.71c89165-9bcd-4f42-9b24-ba5a34bc3342.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.columnSuffix', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.contentColumnType', '\"text\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.fieldGroup', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.handle', '\"linkUrl\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.instructions', '\"\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.name', '\"Link Url\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.searchable', 'false'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.byteLimit', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.charLimit', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.code', '\"\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.columnType', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.initialRows', '\"4\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.multiline', '\"\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.placeholder', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.translationKeyFormat', 'null'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.translationMethod', '\"none\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.fields.8d9df68f-eb65-4862-9a85-f6c36b14e5a6.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.handle', '\"link\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.name', '\"Link\"'),
('matrixBlockTypes.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d.sortOrder', '1'),
('meta.__names__.14dd5e06-b590-4c77-8dd4-f2441b8b15a0', '\"Navigation\"'),
('meta.__names__.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64', '\"Entries\"'),
('meta.__names__.44dacfcb-d5b7-42a4-bfe7-7ee67e8ba954', '\"Logo Icon\"'),
('meta.__names__.4c5538a0-58a3-41b4-8f7a-d92adbdd0f20', '\"Banner\"'),
('meta.__names__.62b6628f-db05-4628-96ab-4b76671ce74b', '\"Tech Task\"'),
('meta.__names__.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf', '\"Entries\"'),
('meta.__names__.71c89165-9bcd-4f42-9b24-ba5a34bc3342', '\"Link Label\"'),
('meta.__names__.8c2393d4-a13d-460b-9a7b-8e64e6f85ca0', '\"EntryContent\"'),
('meta.__names__.8d9df68f-eb65-4862-9a85-f6c36b14e5a6', '\"Link Url\"'),
('meta.__names__.917431a5-6e7c-4bac-82cc-6ed8acdaec51', '\"Entry Fields\"'),
('meta.__names__.9508267f-c357-4054-942b-5c20f66372d4', '\"Hero\"'),
('meta.__names__.976b73a6-9c2f-4d42-b7a4-27477d68133c', '\"Link Logo\"'),
('meta.__names__.984b744a-c73a-4d47-b429-e5a9b311a18d', '\"Nav Link\"'),
('meta.__names__.a1adae4b-f87a-4e73-b571-36a462a77f58', '\"Homepage\"'),
('meta.__names__.a6ce5709-494e-4189-b371-d461cab04188', '\"Banner\"'),
('meta.__names__.bfceefd6-3148-456c-bd4e-249539cff7ec', '\"Redactor Content\"'),
('meta.__names__.c9df0165-79e7-4f94-9094-259a8d4559d9', '\"Image Data\"'),
('meta.__names__.cf5c4c68-f9a9-4b16-b246-b7cf836d4d1d', '\"Link\"'),
('meta.__names__.daa2e738-b5aa-483e-88d3-5ddee8af7f56', '\"Common\"'),
('meta.__names__.e9100a30-3277-403d-81f2-a15eb8a37fe2', '\"General\"'),
('meta.__names__.e9b967f6-fd19-4724-9ec8-72c84279cbc6', '\"Hero\"'),
('meta.__names__.eaf0e5b9-282c-4882-9ee2-20f2d2999559', '\"Homepage\"'),
('meta.__names__.edce792e-a29d-46e6-9de5-3e063b13487d', '\"Tech Task\"'),
('plugins.element-api.edition', '\"standard\"'),
('plugins.element-api.enabled', 'true'),
('plugins.element-api.schemaVersion', '\"1.0.0\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.defaultPlacement', '\"end\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.enableVersioning', 'true'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.handle', '\"entries\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.name', '\"Entries\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.propagationMethod', '\"all\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.enabledByDefault', 'true'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.hasUrls', 'true'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.template', '\"entries/_entry\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.uriFormat', '\"entries/{slug}\"'),
('sections.6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf.type', '\"channel\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.defaultPlacement', '\"end\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.enableVersioning', 'true'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.handle', '\"homepage\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.name', '\"Homepage\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.propagationMethod', '\"all\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.enabledByDefault', 'true'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.hasUrls', 'true'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.template', '\"index\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.uriFormat', '\"__home__\"'),
('sections.a1adae4b-f87a-4e73-b571-36a462a77f58.type', '\"single\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.defaultPlacement', '\"end\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.enableVersioning', 'true'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.handle', '\"banner\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.name', '\"Banner\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.propagationMethod', '\"all\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.enabledByDefault', 'true'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.hasUrls', 'true'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.template', '\"banner/_entry\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.uriFormat', '\"banner\"'),
('sections.a6ce5709-494e-4189-b371-d461cab04188.type', '\"single\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.defaultPlacement', '\"end\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.enableVersioning', 'true'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.handle', '\"hero\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.name', '\"Hero\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.propagationMethod', '\"all\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.enabledByDefault', 'true'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.hasUrls', 'true'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.template', '\"hero/_entry\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.siteSettings.62b6628f-db05-4628-96ab-4b76671ce74b.uriFormat', '\"hero\"'),
('sections.e9b967f6-fd19-4724-9ec8-72c84279cbc6.type', '\"single\"'),
('siteGroups.edce792e-a29d-46e6-9de5-3e063b13487d.name', '\"Tech Task\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.enabled', 'true'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.handle', '\"default\"');
INSERT INTO `vt_projectconfig` (`path`, `value`) VALUES
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.hasUrls', 'true'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.language', '\"en-US\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.name', '\"Tech Task\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.primary', 'true'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.siteGroup', '\"edce792e-a29d-46e6-9de5-3e063b13487d\"'),
('sites.62b6628f-db05-4628-96ab-4b76671ce74b.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Tech Task\"'),
('system.schemaVersion', '\"3.7.8\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.autocomplete', 'false'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.autocorrect', 'true'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.class', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.disabled', 'false'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.id', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.instructions', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.label', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.max', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.min', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.name', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.orientation', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.placeholder', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.readonly', 'false'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.requirable', 'false'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.size', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.step', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.tip', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.title', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.warning', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.elements.0.width', '100'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.name', '\"Content\"'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.fieldLayouts.6b2b109c-2fcf-4394-9a6e-82e70ccf1a08.tabs.0.sortOrder', '1'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.handle', '\"entries\"'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.hasUrls', 'true'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.name', '\"Entries\"'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.settings.path', '\"@webroot/assets/entries\"'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.sortOrder', '1'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.titleTranslationKeyFormat', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.titleTranslationMethod', 'null'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.245afdaf-6be5-47e9-b0f0-00f2e1bfbf64.url', '\"@web/assets/entries\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.autocomplete', 'false'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.autocorrect', 'true'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.class', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.disabled', 'false'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.id', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.instructions', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.label', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.max', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.min', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.name', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.orientation', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.placeholder', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.readonly', 'false'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.requirable', 'false'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.size', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.step', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.tip', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.title', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.warning', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.elements.0.width', '100'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.name', '\"Content\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.fieldLayouts.ae583df8-d75a-4dec-b0bb-c6ed9e4b577a.tabs.0.sortOrder', '1'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.handle', '\"general\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.hasUrls', 'true'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.name', '\"General\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.settings.path', '\"@webroot/assets/common\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.sortOrder', '2'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.titleTranslationKeyFormat', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.titleTranslationMethod', 'null'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.e9100a30-3277-403d-81f2-a15eb8a37fe2.url', '\"@web/assets/common\"');

-- --------------------------------------------------------

--
-- Table structure for table `vt_queue`
--

CREATE TABLE `vt_queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_relations`
--

CREATE TABLE `vt_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_relations`
--

INSERT INTO `vt_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 6, 7, NULL, 3, 1, '2021-10-17 17:39:13', '2021-10-17 17:39:13', '1590eaea-e161-4991-b202-561b29d6263c'),
(3, 1, 16, NULL, 20, 1, '2021-10-17 17:46:50', '2021-10-17 17:46:50', '3ce17d6e-de8a-4ac1-ab88-6a8957784928'),
(4, 1, 21, NULL, 20, 1, '2021-10-17 17:46:50', '2021-10-17 17:46:50', 'b38d6167-f6e6-4651-8811-98e680f236cb'),
(6, 1, 22, NULL, 27, 1, '2021-10-17 18:11:42', '2021-10-17 18:11:42', '5ff7d78e-e6ed-43d1-ae8d-a91f2dd483f3'),
(7, 1, 28, NULL, 27, 1, '2021-10-17 18:11:42', '2021-10-17 18:11:42', '64df8396-85f9-434e-a823-6f75aec3ae33'),
(9, 1, 11, NULL, 31, 1, '2021-10-17 18:13:04', '2021-10-17 18:13:04', '58006da6-42a6-40c3-936b-2a61bd27c856'),
(10, 1, 32, NULL, 31, 1, '2021-10-17 18:13:04', '2021-10-17 18:13:04', 'd1736697-cc25-43ab-a221-aac0c095b67e'),
(11, 1, 33, NULL, 34, 1, '2021-10-17 18:13:47', '2021-10-17 18:13:47', '8801fdac-5157-4d9a-a05e-4760fcbc249b'),
(12, 1, 35, NULL, 34, 1, '2021-10-17 18:13:49', '2021-10-17 18:13:49', 'f9dd23b9-07ad-49bb-ba8d-c625ab1d3c4e'),
(13, 1, 36, NULL, 37, 1, '2021-10-17 18:14:14', '2021-10-17 18:14:14', 'ab920cbc-e20f-4d18-840f-315f13895eac'),
(14, 1, 38, NULL, 37, 1, '2021-10-17 18:14:24', '2021-10-17 18:14:24', '49c6da54-cc4d-419a-a8c2-081e79333cc9');

-- --------------------------------------------------------

--
-- Table structure for table `vt_resourcepaths`
--

CREATE TABLE `vt_resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_resourcepaths`
--

INSERT INTO `vt_resourcepaths` (`hash`, `path`) VALUES
('1255e802', '@craft/web/assets/dashboard/dist'),
('18ba43aa', '@lib/element-resize-detector'),
('26a51f22', '@lib/velocity'),
('32f32a02', '@craft/web/assets/editentry/dist'),
('372ae85f', '@bower/jquery/dist'),
('3a82b0ca', '@lib/jquery.payment'),
('4b2c2d3', '@craft/redactor/assets/redactor-plugins/dist/video'),
('4f3067bb', '@lib/vue'),
('5403f38d', '@craft/web/assets/craftsupport/dist'),
('5c054440', '@craft/web/assets/login/dist'),
('62dbc4ce', '@lib/axios'),
('680c8487', '@lib/jquery-ui'),
('6b16cec9', '@craft/web/assets/feed/dist'),
('6e7d170', '@craft/redactor/assets/redactor/dist'),
('706b6924', '@craft/web/assets/editsection/dist'),
('8698e30f', '@lib/garnishjs'),
('931bfedc', '@craft/web/assets/fields/dist'),
('93de3731', '@lib/fabric'),
('93ebfae9', '@craft/redactor/assets/field/dist'),
('9a350609', '@craft/web/assets/admintable/dist'),
('a368d526', '@lib/fileupload'),
('ab639d3a', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('afcbea31', '@lib/iframe-resizer'),
('b525f489', '@lib/d3'),
('bb80d4d8', '@lib/picturefill'),
('bbf830a6', '@craft/web/assets/matrix/dist'),
('bc24e81a', '@lib/jquery-touch-events'),
('bea2e293', '@lib/prismjs'),
('c4d601b5', '@craft/web/assets/updater/dist'),
('cd1547ea', '@craft/web/assets/recententries/dist'),
('d9f0b6e', '@craft/web/assets/matrixsettings/dist'),
('da6de5a3', '@lib/timepicker'),
('e0aaec68', '@craft/web/assets/pluginstore/dist'),
('e592bdd6', '@lib/xregexp'),
('e9d1dc15', '@craft/web/assets/cp/dist'),
('effef95c', '@lib/selectize'),
('f3af0584', '@craft/web/assets/updateswidget/dist'),
('feec26dd', '@craft/web/assets/fieldsettings/dist');

-- --------------------------------------------------------

--
-- Table structure for table `vt_revisions`
--

CREATE TABLE `vt_revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_revisions`
--

INSERT INTO `vt_revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 11, 1, 1, ''),
(2, 13, 1, 1, NULL),
(3, 13, 1, 2, NULL),
(4, 16, 1, 1, NULL),
(5, 16, 1, 2, NULL),
(6, 16, 1, 3, 'Applied “Draft 1”'),
(7, 22, 1, 1, NULL),
(8, 22, 1, 2, NULL),
(9, 22, 1, 3, NULL),
(10, 22, 1, 4, 'Applied “Draft 1”'),
(11, 11, 1, 2, 'Applied “Draft 1”'),
(12, 33, 1, 1, ''),
(13, 36, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `vt_searchindex`
--

CREATE TABLE `vt_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_searchindex`
--

INSERT INTO `vt_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' verse user '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' rasheedsaidi gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ''),
(3, 'filename', 0, 1, ' icon logo png '),
(3, 'extension', 0, 1, ' png '),
(3, 'kind', 0, 1, ' image '),
(3, 'slug', 0, 1, ''),
(3, 'title', 0, 1, ' icon logo '),
(4, 'slug', 0, 1, ''),
(5, 'slug', 0, 1, ''),
(6, 'slug', 0, 1, ''),
(7, 'slug', 0, 1, ''),
(8, 'slug', 0, 1, ''),
(9, 'slug', 0, 1, ''),
(10, 'slug', 0, 1, ''),
(11, 'slug', 0, 1, ' home required '),
(11, 'title', 0, 1, ' this is a wide container title stretching two lines '),
(13, 'title', 0, 1, ' homepage '),
(13, 'slug', 0, 1, ' homepage '),
(22, 'slug', 0, 1, ' hero '),
(16, 'slug', 0, 1, ' banner '),
(16, 'title', 0, 1, ' here we have a two line display intro '),
(22, 'title', 0, 1, ' here we have a two line display '),
(20, 'filename', 0, 1, ' banner image png '),
(20, 'extension', 0, 1, ' png '),
(20, 'kind', 0, 1, ' image '),
(20, 'slug', 0, 1, ''),
(20, 'title', 0, 1, ' banner image '),
(29, 'slug', 0, 1, ' temp vteblylmoqcndbwmltwjzkdewuaaoqddeobu '),
(27, 'filename', 0, 1, ' hero image png '),
(27, 'extension', 0, 1, ' png '),
(27, 'kind', 0, 1, ' image '),
(27, 'slug', 0, 1, ''),
(27, 'title', 0, 1, ' hero image '),
(29, 'title', 0, 1, ''),
(33, 'slug', 0, 1, ' this is a wide container title stretching two lines '),
(31, 'filename', 0, 1, ' entry item img 1 png '),
(31, 'extension', 0, 1, ' png '),
(31, 'kind', 0, 1, ' image '),
(31, 'slug', 0, 1, ''),
(31, 'title', 0, 1, ' entry item img 1 '),
(33, 'title', 0, 1, ' this is a wide container title stretching two lines '),
(34, 'filename', 0, 1, ' entry item img 2 png '),
(34, 'extension', 0, 1, ' png '),
(34, 'kind', 0, 1, ' image '),
(34, 'slug', 0, 1, ''),
(34, 'title', 0, 1, ' entry item img 2 '),
(36, 'slug', 0, 1, ' this is a wide container title stretching two lines 2 '),
(36, 'title', 0, 1, ' this is a wide container title stretching two lines '),
(37, 'filename', 0, 1, ' entry item img 3 png '),
(37, 'extension', 0, 1, ' png '),
(37, 'kind', 0, 1, ' image '),
(37, 'slug', 0, 1, ''),
(37, 'title', 0, 1, ' entry item img 3 ');

-- --------------------------------------------------------

--
-- Table structure for table `vt_sections`
--

CREATE TABLE `vt_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_sections`
--

INSERT INTO `vt_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Entries', 'entries', 'channel', 1, 'all', 'end', NULL, '2021-10-17 17:16:39', '2021-10-17 17:16:39', NULL, '6e9e8a5d-a9ad-46f0-afc8-bbb8cd21ebcf'),
(2, NULL, 'Homepage', 'homepage', 'single', 1, 'all', 'end', NULL, '2021-10-17 17:42:49', '2021-10-17 17:42:49', NULL, 'a1adae4b-f87a-4e73-b571-36a462a77f58'),
(3, NULL, 'Banner', 'banner', 'single', 1, 'all', 'end', NULL, '2021-10-17 17:45:07', '2021-10-17 17:45:07', NULL, 'a6ce5709-494e-4189-b371-d461cab04188'),
(4, NULL, 'Hero', 'hero', 'single', 1, 'all', 'end', NULL, '2021-10-17 18:08:54', '2021-10-17 18:08:54', NULL, 'e9b967f6-fd19-4724-9ec8-72c84279cbc6');

-- --------------------------------------------------------

--
-- Table structure for table `vt_sections_sites`
--

CREATE TABLE `vt_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_sections_sites`
--

INSERT INTO `vt_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'entries/{slug}', 'entries/_entry', 1, '2021-10-17 17:16:39', '2021-10-17 17:16:39', '813368fd-4707-43fb-af32-de5bd5ee9225'),
(2, 2, 1, 1, '__home__', 'index', 1, '2021-10-17 17:42:49', '2021-10-17 17:42:49', '8b7625ce-1edf-4123-8300-9d079be6ecb1'),
(3, 3, 1, 1, 'banner', 'banner/_entry', 1, '2021-10-17 17:45:07', '2021-10-17 17:45:07', '3acd8ae1-84e7-4bea-9609-f984d7259361'),
(4, 4, 1, 1, 'hero', 'hero/_entry', 1, '2021-10-17 18:08:54', '2021-10-17 18:08:54', '3ea492cb-5371-4f4e-aa71-97dbdc633c53');

-- --------------------------------------------------------

--
-- Table structure for table `vt_sequences`
--

CREATE TABLE `vt_sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_sessions`
--

CREATE TABLE `vt_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_sessions`
--

INSERT INTO `vt_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 'FFQnpqZCB-I_4urQSmInhnBWjzapLo2cN-x7TKnI-Ep_N-vAAYJVfPl_240VKVRkJbCgOlI_9z6pZa4lQLdi6X8ll4g3ROsV84Cp', '2021-10-17 17:06:43', '2021-10-17 18:55:51', '7aaef3b3-d0ab-49bb-9b69-245d58a3f400');

-- --------------------------------------------------------

--
-- Table structure for table `vt_shunnedmessages`
--

CREATE TABLE `vt_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_sitegroups`
--

CREATE TABLE `vt_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_sitegroups`
--

INSERT INTO `vt_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Tech Task', '2021-10-15 16:48:19', '2021-10-15 16:48:19', NULL, 'edce792e-a29d-46e6-9de5-3e063b13487d');

-- --------------------------------------------------------

--
-- Table structure for table `vt_sites`
--

CREATE TABLE `vt_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_sites`
--

INSERT INTO `vt_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Tech Task', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-10-15 16:48:19', '2021-10-15 16:48:19', NULL, '62b6628f-db05-4628-96ab-4b76671ce74b');

-- --------------------------------------------------------

--
-- Table structure for table `vt_structureelements`
--

CREATE TABLE `vt_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_structures`
--

CREATE TABLE `vt_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_systemmessages`
--

CREATE TABLE `vt_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_taggroups`
--

CREATE TABLE `vt_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_tags`
--

CREATE TABLE `vt_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_templatecacheelements`
--

CREATE TABLE `vt_templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_templatecachequeries`
--

CREATE TABLE `vt_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_templatecaches`
--

CREATE TABLE `vt_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_tokens`
--

CREATE TABLE `vt_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_usergroups`
--

CREATE TABLE `vt_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_usergroups_users`
--

CREATE TABLE `vt_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_userpermissions`
--

CREATE TABLE `vt_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_userpermissions_usergroups`
--

CREATE TABLE `vt_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_userpermissions_users`
--

CREATE TABLE `vt_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vt_userpreferences`
--

CREATE TABLE `vt_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_userpreferences`
--

INSERT INTO `vt_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `vt_users`
--

CREATE TABLE `vt_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_users`
--

INSERT INTO `vt_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'verse-user', NULL, NULL, NULL, 'rasheedsaidi@gmail.com', '$2y$13$F6ZDbmBeIDm1f17PWEsaUeY9MNpayz1Ee2pTHEwL5ySl2x3edLtWC', 1, 0, 0, 0, '2021-10-17 17:06:44', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-10-15 16:48:20', '2021-10-15 16:48:20', '2021-10-17 17:06:44', 'ede7129d-f55d-4d26-8c35-35eb8b9cca2a');

-- --------------------------------------------------------

--
-- Table structure for table `vt_volumefolders`
--

CREATE TABLE `vt_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_volumefolders`
--

INSERT INTO `vt_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Entries', '', '2021-10-17 17:13:05', '2021-10-17 17:13:05', '4470b691-5d89-48a5-983d-41a473b8bd9e'),
(2, NULL, NULL, 'Temporary source', NULL, '2021-10-17 17:34:09', '2021-10-17 17:34:09', '8ce2c009-bfff-48b4-a230-31663ddad806'),
(3, 2, NULL, 'user_1', 'user_1/', '2021-10-17 17:34:09', '2021-10-17 17:34:09', '60e294f5-4f96-4641-bdc9-435eb00c6087'),
(4, NULL, 2, 'General', '', '2021-10-17 17:35:20', '2021-10-17 17:35:20', '2b54013f-5bcd-40cf-b447-70991363434d');

-- --------------------------------------------------------

--
-- Table structure for table `vt_volumes`
--

CREATE TABLE `vt_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_volumes`
--

INSERT INTO `vt_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'Entries', 'entries', 'craft\\volumes\\Local', 1, '@web/assets/entries', 'site', NULL, '{\"path\":\"@webroot/assets/entries\"}', 1, '2021-10-17 17:13:05', '2021-10-17 17:13:05', NULL, '245afdaf-6be5-47e9-b0f0-00f2e1bfbf64'),
(2, 5, 'General', 'general', 'craft\\volumes\\Local', 1, '@web/assets/common', 'site', NULL, '{\"path\":\"@webroot/assets/common\"}', 2, '2021-10-17 17:35:20', '2021-10-17 17:35:48', NULL, 'e9100a30-3277-403d-81f2-a15eb8a37fe2');

-- --------------------------------------------------------

--
-- Table structure for table `vt_widgets`
--

CREATE TABLE `vt_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vt_widgets`
--

INSERT INTO `vt_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-10-15 16:48:23', '2021-10-15 16:48:23', '7bc8ccc6-1e88-46eb-81df-3868da99ba53'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-10-15 16:48:23', '2021-10-15 16:48:23', 'b9f118b4-4a49-44a9-b3c4-d46345a129ae'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-10-15 16:48:23', '2021-10-15 16:48:23', 'fd622367-f301-4a44-801d-4eb85c846a91'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-10-15 16:48:23', '2021-10-15 16:48:23', 'a3e584c2-d6db-425f-ad52-fa9b92e51f4f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vtannouncements`
--
ALTER TABLE `vtannouncements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_dihsclozsnbpdyhuhdvcmuzgibswlkcxszmc` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `vtidx_ahthvjltiicdlxjcyyhrtoprdwigoeagexbw` (`dateRead`),
  ADD KEY `vtfk_sbomtrkqapgvvzshkcgqjvbzzwgtabxgerfp` (`pluginId`);

--
-- Indexes for table `vtassetindexdata`
--
ALTER TABLE `vtassetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_kakbeepsitalswupdexzybgcgslzggcguiyq` (`sessionId`,`volumeId`),
  ADD KEY `vtidx_khavqpofnfixmgmzuvzhmecwmlflsolwqusr` (`volumeId`);

--
-- Indexes for table `vtassets`
--
ALTER TABLE `vtassets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_pzowmwubwokrtrwdadiktskiporfojcsnghl` (`filename`,`folderId`),
  ADD KEY `vtidx_nwaxvhqjwqwnoeplgwupqxeimgxvmdjexiii` (`folderId`),
  ADD KEY `vtidx_ygsqiulgfopzjlotfqqqxiowkmysyphtguqe` (`volumeId`),
  ADD KEY `vtfk_vtwddbadnmkvedhcazgnszripwcxlliunehz` (`uploaderId`);

--
-- Indexes for table `vtassettransformindex`
--
ALTER TABLE `vtassettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_wdpjsjubriydvgyjyyodiaaadxizpkfhpfpp` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `vtassettransforms`
--
ALTER TABLE `vtassettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_wlpnsfdipttdejvlgjocgdjoaatzsqopdweo` (`name`),
  ADD KEY `vtidx_rxocrkammvtlumoifcqixzheibusktjqfsgp` (`handle`);

--
-- Indexes for table `vtcategories`
--
ALTER TABLE `vtcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_biqiedzalqtshlmimrynhezqxiymztydmzol` (`groupId`),
  ADD KEY `vtfk_uiygkdcvqiuhmtjcxedfbovndmjwazgkwmce` (`parentId`);

--
-- Indexes for table `vtcategorygroups`
--
ALTER TABLE `vtcategorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_bvebdjtffekybsvblkknaouynfezrpalwaep` (`name`),
  ADD KEY `vtidx_bjcdnrlgloucmqcaaohckfxkxvkrdwklixlw` (`handle`),
  ADD KEY `vtidx_zbmrxajthemkcyawfnvfxjsrcgkzgqpqpnzp` (`structureId`),
  ADD KEY `vtidx_tkmemkuvistadrsioegqawgdqxmovmnjaevf` (`fieldLayoutId`),
  ADD KEY `vtidx_ykondicycoebewqgzeuimffeetquljvgtbnx` (`dateDeleted`);

--
-- Indexes for table `vtcategorygroups_sites`
--
ALTER TABLE `vtcategorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_jbecuqzdxgdbunfqbvhhdojeyyqyejunyogr` (`groupId`,`siteId`),
  ADD KEY `vtidx_ykxztjwxtsciysgjqusbuvoaxytjafcxezrq` (`siteId`);

--
-- Indexes for table `vtchangedattributes`
--
ALTER TABLE `vtchangedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `vtidx_rfpqoltlcvergzzfodkcxjcoymloejkzqelv` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `vtfk_nisotkattkpiigaertqmpodyzwikyheoipub` (`siteId`),
  ADD KEY `vtfk_eqmwrylpfnakksgryrglzncsvrrfkjbzauhk` (`userId`);

--
-- Indexes for table `vtchangedfields`
--
ALTER TABLE `vtchangedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `vtidx_hrwcnagkcjctxipvsjocdrsadpwnrjvxnfcc` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `vtfk_yyhochumjzgzsitehrinafvslvfxmlypxeoc` (`siteId`),
  ADD KEY `vtfk_smaqlxnzrncwpbcnldprxphsvqbimxvttxlf` (`fieldId`),
  ADD KEY `vtfk_kcctozxfwuxakktemgqopvaxzrxzyzfxxxvi` (`userId`);

--
-- Indexes for table `vtcontent`
--
ALTER TABLE `vtcontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_vzxmpfuvmszfdmzsnfrpoatzfxmiadyusyka` (`elementId`,`siteId`),
  ADD KEY `vtidx_vteqmcmosbmwsifsqckmzpvhvuvagxtaefks` (`siteId`),
  ADD KEY `vtidx_xwepfjemjxezbnkuoaheidchlmdjrkcuntov` (`title`);

--
-- Indexes for table `vtcraftidtokens`
--
ALTER TABLE `vtcraftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtfk_mabznmlwpzpghrhoalsypfbpnwpbnbjkbewe` (`userId`);

--
-- Indexes for table `vtdeprecationerrors`
--
ALTER TABLE `vtdeprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_ukjetllwlvmrsumueqcetmswsufvtssnwmxg` (`key`,`fingerprint`);

--
-- Indexes for table `vtdrafts`
--
ALTER TABLE `vtdrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_pfshvrfsgrbmmueekmvnwosrkrqctpvftjil` (`creatorId`,`provisional`),
  ADD KEY `vtidx_vowdzmdyksotcrnrmyidlynriiadujieoatb` (`saved`),
  ADD KEY `vtfk_ctrdafkknoymdplqompnodktrksqszouszdn` (`sourceId`);

--
-- Indexes for table `vtelementindexsettings`
--
ALTER TABLE `vtelementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_rbofdqjezkxbcxoqnoonzzndcgewfwfrvvxb` (`type`);

--
-- Indexes for table `vtelements`
--
ALTER TABLE `vtelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_urztrhndfrybqhaldvoelzltgtgafcimrqhc` (`dateDeleted`),
  ADD KEY `vtidx_tcqnyflhuzkenrqiefnjrlpwzzdkygeafjrb` (`fieldLayoutId`),
  ADD KEY `vtidx_upbvphgynpzsywmqxnyqmjicuybdnxympfih` (`type`),
  ADD KEY `vtidx_exmsqttjkmnjxytiaobxphmevltjifbbbpxs` (`enabled`),
  ADD KEY `vtidx_igpuohbicvscmfuuayvebslwjyrchcphlrpj` (`archived`,`dateCreated`),
  ADD KEY `vtidx_oyzisyymwnnuzgphsegytvgtoglsffujuwvj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `vtfk_iojutmucohzhkvitfmgbsnmvgblpsfuxdvbn` (`canonicalId`),
  ADD KEY `vtfk_qmqszaxicpdvssvowheecbofrfftumxcjiwg` (`draftId`),
  ADD KEY `vtfk_jcartmmoyputrcmlzgjfnyqnvqhwjlsekvqd` (`revisionId`);

--
-- Indexes for table `vtelements_sites`
--
ALTER TABLE `vtelements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_rdmkcilyvxxwnpqpsitwxjgpebttlymygrna` (`elementId`,`siteId`),
  ADD KEY `vtidx_cbiulymdnnxyzwxvkmegtuvzeookreqyimyj` (`siteId`),
  ADD KEY `vtidx_kixdfauusogpyvijjffwmemqsvbinbretykw` (`slug`,`siteId`),
  ADD KEY `vtidx_nexamyrjnnciwluinsqaucuirfbeovzqhiqv` (`enabled`),
  ADD KEY `vtidx_mfwfsxkaqymcvrqsdymaaqhmqhoosqkwqyus` (`uri`,`siteId`);

--
-- Indexes for table `vtentries`
--
ALTER TABLE `vtentries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_vdrsbomwleoovxkellieipthujybddrwokns` (`postDate`),
  ADD KEY `vtidx_dnkfdnezjryvqzpcupjdobfgxhxyochqgdve` (`expiryDate`),
  ADD KEY `vtidx_jkpoqlovbtcawwsuigllzkrrwnaexsjzoatj` (`authorId`),
  ADD KEY `vtidx_vqoiamsctbtbdoxybwcfscgkztwaagaecqkh` (`sectionId`),
  ADD KEY `vtidx_snbpswtzjifnadftrtldyrubxuxgdpzxefgt` (`typeId`),
  ADD KEY `vtfk_qchfsmtyyetqacfzlllcvrdsmnbquzuyeylm` (`parentId`);

--
-- Indexes for table `vtentrytypes`
--
ALTER TABLE `vtentrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_qjducsugeuwozbmmnewromtxiwkfcchtbivk` (`name`,`sectionId`),
  ADD KEY `vtidx_yqhsfqwajeyyjfvvohkmiqmksjwypwwolkbk` (`handle`,`sectionId`),
  ADD KEY `vtidx_zztiyugfqqxndkxnpyltdbslfcitzqmkzxuu` (`sectionId`),
  ADD KEY `vtidx_peslaxwabwrrvfemlxeaylkuevrdpvlbzcns` (`fieldLayoutId`),
  ADD KEY `vtidx_gjnousonagzrasjcssbacwhsfwfapftexvqo` (`dateDeleted`);

--
-- Indexes for table `vtfieldgroups`
--
ALTER TABLE `vtfieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_xxpjpkafjcfxoutxfetzyuxrmewbqmjhcvgx` (`name`),
  ADD KEY `vtidx_ycclphdwivokpdsmvwgjxlyjnszcjnglolno` (`dateDeleted`,`name`);

--
-- Indexes for table `vtfieldlayoutfields`
--
ALTER TABLE `vtfieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_vzokocwyvfaxdivqleakjmjftnyoeghlkwxe` (`layoutId`,`fieldId`),
  ADD KEY `vtidx_vcwjmhpdywxwlonxcdvnpwmvfimgkvpuebtl` (`sortOrder`),
  ADD KEY `vtidx_mrxdiptuvqhlufrkwhenaxlwnvbdzxdgcovl` (`tabId`),
  ADD KEY `vtidx_hajkuxltfoecyfetvvnmawtlxomnszzzibdl` (`fieldId`);

--
-- Indexes for table `vtfieldlayouts`
--
ALTER TABLE `vtfieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_thuezquudjdcansqiguwwirjpitnpsuatiei` (`dateDeleted`),
  ADD KEY `vtidx_pzcsxgzuojwwnuzytwrqrssxxutvdhoacgyg` (`type`);

--
-- Indexes for table `vtfieldlayouttabs`
--
ALTER TABLE `vtfieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_saisbexvcianmbywgetumtoybfeldzajjdcw` (`sortOrder`),
  ADD KEY `vtidx_wdgdqasyndzmstsfojjjgmcojrdagtpkugzv` (`layoutId`);

--
-- Indexes for table `vtfields`
--
ALTER TABLE `vtfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_yvilxpgqgqxdatsdapfomsztqfxxmccjtszo` (`handle`,`context`),
  ADD KEY `vtidx_btgghqmojjbklljshepsqxhsmjjyapmjnqbq` (`groupId`),
  ADD KEY `vtidx_tkuxcoyvwtskumsdlrkajrmvzazdrcciznob` (`context`);

--
-- Indexes for table `vtglobalsets`
--
ALTER TABLE `vtglobalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_npesmppksohrlxfaxigawmtiydwxatcqjfiu` (`name`),
  ADD KEY `vtidx_lthftulfjapqynmzlyxtblxtvelqavobolcn` (`handle`),
  ADD KEY `vtidx_ywargvxvhibaakpvuqwrrmtrktmrsnmhsqtf` (`fieldLayoutId`),
  ADD KEY `vtidx_rapaegnusxqfugfetagehgsxvpjvhgorirkl` (`sortOrder`);

--
-- Indexes for table `vtgqlschemas`
--
ALTER TABLE `vtgqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtgqltokens`
--
ALTER TABLE `vtgqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_ephzqyuzweiwjxrnctxevabwwdzawzyukhlp` (`accessToken`),
  ADD UNIQUE KEY `vtidx_yxoegikiqfosxxnwogasybivaepbfcbnuxub` (`name`),
  ADD KEY `vtfk_khqvduaibnvppyqdrolqbntndyuofpwbncvh` (`schemaId`);

--
-- Indexes for table `vtinfo`
--
ALTER TABLE `vtinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtmatrixblocks`
--
ALTER TABLE `vtmatrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_txssvepugjcbarxakrsaxnfqqqxrnfvgqmdt` (`ownerId`),
  ADD KEY `vtidx_layhzlsyodydbpdfnztojqobdynypsmccmyd` (`fieldId`),
  ADD KEY `vtidx_rvgmmoznuicigtckyibepihodlizjgovxnhs` (`typeId`),
  ADD KEY `vtidx_lkppbzuacywjggjgipbzyfqvdewtsmhlccda` (`sortOrder`);

--
-- Indexes for table `vtmatrixblocktypes`
--
ALTER TABLE `vtmatrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_ehoerdedzisswwttrvgmgtmpakzyvwuhbjbe` (`name`,`fieldId`),
  ADD KEY `vtidx_ehnecelfmxusdgvrrjchldhvmqlhjiiubqhm` (`handle`,`fieldId`),
  ADD KEY `vtidx_gfyhygcnhskzdmuvrqjcwjksmlatnyapjaei` (`fieldId`),
  ADD KEY `vtidx_ecasvvgeucpanmsvrvqcxrzbklzebhusmrws` (`fieldLayoutId`);

--
-- Indexes for table `vtmigrations`
--
ALTER TABLE `vtmigrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_osihorlhgczenfufiyzjtivmpsashwdxhhym` (`track`,`name`);

--
-- Indexes for table `vtplugins`
--
ALTER TABLE `vtplugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_ylwlgxpjijmlidadygmaicgkluqyyhdnztmr` (`handle`);

--
-- Indexes for table `vtprojectconfig`
--
ALTER TABLE `vtprojectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `vtqueue`
--
ALTER TABLE `vtqueue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_rgvwiiylfxnwwtdobjulcmtolcpwiseiyezm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `vtidx_qyjncwihvcvjchrczzapvvjcmebhifyetaev` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `vtrelations`
--
ALTER TABLE `vtrelations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_uzodsiqeuzjlhlcwnepgpbotjghjtzdptcep` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `vtidx_cqilfwgwtbizgqpmpfmzqcykkcabmxfbuwow` (`sourceId`),
  ADD KEY `vtidx_nlmwkwxkbkqvsbflxavocaoadtbdsqjjanxp` (`targetId`),
  ADD KEY `vtidx_mrbhaonjiuibjmihavkvncadxiofxdlrtuvw` (`sourceSiteId`);

--
-- Indexes for table `vtresourcepaths`
--
ALTER TABLE `vtresourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `vtrevisions`
--
ALTER TABLE `vtrevisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_mkfxxdtlozhqdlozkpamxhsddtjqyoiazeuw` (`sourceId`,`num`),
  ADD KEY `vtfk_zfhaenuladyhhbmqzcsritnjhpmqwhpdzyki` (`creatorId`);

--
-- Indexes for table `vtsearchindex`
--
ALTER TABLE `vtsearchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `vtsearchindex` ADD FULLTEXT KEY `vtidx_icqjlhuifuwywfpkyfzifvbiawcrosaxvkwf` (`keywords`);

--
-- Indexes for table `vtsections`
--
ALTER TABLE `vtsections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_grejnxqxqeicvroaqzhekzvlmdbmjqytvkfi` (`handle`),
  ADD KEY `vtidx_dscyuqoygmuioxlzhzshkurstnmwrdaxbfeo` (`name`),
  ADD KEY `vtidx_ryvljhowcvylbylqkapzwlhtitiamqxmoeyt` (`structureId`),
  ADD KEY `vtidx_eeyrjewxqszujgelctpqbeeobdiwtigfuafb` (`dateDeleted`);

--
-- Indexes for table `vtsections_sites`
--
ALTER TABLE `vtsections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_syndykupoypjkzuqrfouomoofcwqndeunhav` (`sectionId`,`siteId`),
  ADD KEY `vtidx_nagqwzoolyypqkljkywhndsubowkbnmtsgga` (`siteId`);

--
-- Indexes for table `vtsequences`
--
ALTER TABLE `vtsequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vtsessions`
--
ALTER TABLE `vtsessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_spcxzzxfxdrscmtyeessowihvjpgnhlqpbuh` (`uid`),
  ADD KEY `vtidx_qhxwrbmyldaeamhmgeyaausvvgmqhqkkawqy` (`token`),
  ADD KEY `vtidx_vpphjfeqbabnuxddjsnplojqbyvkjzgnvovj` (`dateUpdated`),
  ADD KEY `vtidx_qsyglhppwoigmcpxqwbzwoomofhcurzfmnuk` (`userId`);

--
-- Indexes for table `vtshunnedmessages`
--
ALTER TABLE `vtshunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_rbpasktstighimheowloxnfmzwkfledorlcx` (`userId`,`message`);

--
-- Indexes for table `vtsitegroups`
--
ALTER TABLE `vtsitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_xiftuncnmsfzthoehtgaqfgbufskhwvdvrjo` (`name`);

--
-- Indexes for table `vtsites`
--
ALTER TABLE `vtsites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_ojwdhtoxfrmhinikiuzwwrplmcovimmxkyiu` (`dateDeleted`),
  ADD KEY `vtidx_slzwwvhcsnqmhxpwjuivmeuexyihtwvceabi` (`handle`),
  ADD KEY `vtidx_dbinkehhlwnycuzkfadzbvhdajoiljegrccn` (`sortOrder`),
  ADD KEY `vtfk_rzfbyktawovyvbufvblrklqjkodbcgaxtbmd` (`groupId`);

--
-- Indexes for table `vtstructureelements`
--
ALTER TABLE `vtstructureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_igycdrobhifitxhmlvgrfmrpbrculimqnsdm` (`structureId`,`elementId`),
  ADD KEY `vtidx_tqlryvpqaexwdpabhogbfrogvetkqxodexmf` (`root`),
  ADD KEY `vtidx_zpepnhzzfvbourbxnayyodssndulockehctd` (`lft`),
  ADD KEY `vtidx_pdntbvzggftioxgtywtiopxntyitvdsqynyj` (`rgt`),
  ADD KEY `vtidx_wwdltzunwvtymrlzuzrorjizpgfbrgjmjmwm` (`level`),
  ADD KEY `vtidx_znftxgjmqgrugnjposibduohzhvfyizvselp` (`elementId`);

--
-- Indexes for table `vtstructures`
--
ALTER TABLE `vtstructures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_pyhoxlxicjnjldwnnxdxsznpebmzkvftiiez` (`dateDeleted`);

--
-- Indexes for table `vtsystemmessages`
--
ALTER TABLE `vtsystemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_zhqulstkbghfjlirgmtyezjffjfxaqhlupkq` (`key`,`language`),
  ADD KEY `vtidx_zuphxkmxgtpqnaakhfgzqvqubleffsvplxoe` (`language`);

--
-- Indexes for table `vttaggroups`
--
ALTER TABLE `vttaggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_fzqgvmlfmxgiteytqmaizeftofeuhvqxjknq` (`name`),
  ADD KEY `vtidx_rahbpbmdxqcekuxmcpuidedzivilwpvhnhgi` (`handle`),
  ADD KEY `vtidx_pjmznntptnocartdmuspwdikrnrrjxjcgypd` (`dateDeleted`),
  ADD KEY `vtfk_fasgoquoxqqztoukrcirrryhisbgvugrahya` (`fieldLayoutId`);

--
-- Indexes for table `vttags`
--
ALTER TABLE `vttags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_tsylcqrytvrscevcgwkjbbiqxmivmutgzexo` (`groupId`);

--
-- Indexes for table `vttemplatecacheelements`
--
ALTER TABLE `vttemplatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_uvoppvfenblhlxowkmdbufvzzxzitkxmzhbq` (`cacheId`),
  ADD KEY `vtidx_gwvjwufcmkhqrcnwqwczcujoisvypicvmykg` (`elementId`);

--
-- Indexes for table `vttemplatecachequeries`
--
ALTER TABLE `vttemplatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_wqnzwnaeutrzlziymywlgpccikdncqoblojb` (`cacheId`),
  ADD KEY `vtidx_gmrojovuqdcdydlylelcbxeeetblpfzgnnzt` (`type`);

--
-- Indexes for table `vttemplatecaches`
--
ALTER TABLE `vttemplatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_yjjiarubfmcvbgatljrkzdmyuctjmruemrao` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `vtidx_cwqomttioviajjplvcsmusuvcwoudpshapfs` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `vtidx_puglgsulriciivpdcgcyzncikchtauwmiinu` (`siteId`);

--
-- Indexes for table `vttokens`
--
ALTER TABLE `vttokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_uuuhoxjdjoyzgdturabotpjpzfugtziyxybt` (`token`),
  ADD KEY `vtidx_gypikcxehtwpfjgiiznjixtvmeaozubjeyku` (`expiryDate`);

--
-- Indexes for table `vtusergroups`
--
ALTER TABLE `vtusergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_ewgkvreiboffitlzhrglzkhtcalynolljchc` (`handle`),
  ADD KEY `vtidx_zndwqollfibhgurklfeqlwgoeyjwybtmpweh` (`name`);

--
-- Indexes for table `vtusergroups_users`
--
ALTER TABLE `vtusergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_ibpzsayndqygphfxyhfytmnghvbocbqipajl` (`groupId`,`userId`),
  ADD KEY `vtidx_ufcapxfnrzkzctmzcplrkkqlydsjgfbxueek` (`userId`);

--
-- Indexes for table `vtuserpermissions`
--
ALTER TABLE `vtuserpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_suakdqqdwfidpnkuhcjognexkihmratggzrn` (`name`);

--
-- Indexes for table `vtuserpermissions_usergroups`
--
ALTER TABLE `vtuserpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_hyrezbjigjsevdfzbzmdndubbnopddhxkxvd` (`permissionId`,`groupId`),
  ADD KEY `vtidx_lsbycjlcualslmdsvhdercxsqjctluuuvnpt` (`groupId`);

--
-- Indexes for table `vtuserpermissions_users`
--
ALTER TABLE `vtuserpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_qsolpjtavfrhqhpltkdjoxfhhtuiqvuehmef` (`permissionId`,`userId`),
  ADD KEY `vtidx_xduefyhfdzwyfmvycdyjybyfjyvgjvuetpcz` (`userId`);

--
-- Indexes for table `vtuserpreferences`
--
ALTER TABLE `vtuserpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `vtusers`
--
ALTER TABLE `vtusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_rhjmdosbeqicpdwqguywvfyrqywljoafkomm` (`uid`),
  ADD KEY `vtidx_nvmtpfemskguxlheidmzqotvdfnqyxwlwyhg` (`verificationCode`),
  ADD KEY `vtidx_jmlutctlrkbkiuunkbyatfyrtufrpgfbppqc` (`email`),
  ADD KEY `vtidx_narzkpmgyoafhyfegagkilbnffurhebicixk` (`username`),
  ADD KEY `vtfk_kvqltwconsbdldxulnceqabfaldqwxwdefyq` (`photoId`);

--
-- Indexes for table `vtvolumefolders`
--
ALTER TABLE `vtvolumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtidx_wpbaaouuaarpswzuzezwhuzawzbuykvaxpyi` (`name`,`parentId`,`volumeId`),
  ADD KEY `vtidx_nxsmmgeeatwvvsmqirruosixvxycxhrnbxfh` (`parentId`),
  ADD KEY `vtidx_hslhsmknssosuvpdontttulmrcdfwodgwxqi` (`volumeId`);

--
-- Indexes for table `vtvolumes`
--
ALTER TABLE `vtvolumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_requelcihujwxjbfxhlwjrawtqqyhzluysoj` (`name`),
  ADD KEY `vtidx_ejvuenoqztqgmiucxnlrgkjwidsurlqszqpq` (`handle`),
  ADD KEY `vtidx_cmcmgegmumkbhnktwnwkczlfyamqbfgvscao` (`fieldLayoutId`),
  ADD KEY `vtidx_rnlizxndphzkpvevenfforcwknlnxiclxuqy` (`dateDeleted`);

--
-- Indexes for table `vtwidgets`
--
ALTER TABLE `vtwidgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vtidx_vjahasxlaeytzwldvteyhddrypmodrkaxhpv` (`userId`);

--
-- Indexes for table `vt_announcements`
--
ALTER TABLE `vt_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_zfphurtriscmkoiawkgavcqqjcpwvmunsdwj` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `vt_idx_qswjwaaqgduhnqydcgjaiofgjzvgiigwegwp` (`dateRead`),
  ADD KEY `vt_fk_lzguyisvmllokybwlzywrtquoppcenyupuke` (`pluginId`);

--
-- Indexes for table `vt_assetindexdata`
--
ALTER TABLE `vt_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_cybyssbipiphtnplesqwwbcfobzmmihisfxo` (`sessionId`,`volumeId`),
  ADD KEY `vt_idx_vbjsjysygeccrjeadoaruhrtcnmkzcbxflis` (`volumeId`);

--
-- Indexes for table `vt_assets`
--
ALTER TABLE `vt_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_gpvvvyxlhmntiymhygqjlxrpbgeccvqjwzhd` (`filename`,`folderId`),
  ADD KEY `vt_idx_gxudjsafxvkxkxmrwpwbflpjpfxncrntsggs` (`folderId`),
  ADD KEY `vt_idx_sougjsaifyotqxkprunwvsrhmgljusqwikaz` (`volumeId`),
  ADD KEY `vt_fk_wnseviakoroxwsvgcsuqpyrmyjoulwklpdoy` (`uploaderId`);

--
-- Indexes for table `vt_assettransformindex`
--
ALTER TABLE `vt_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_xycfwbzpbavyqrvlecqpnebwebhvoufxmupv` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `vt_assettransforms`
--
ALTER TABLE `vt_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_thlfenfckzjwtkmiieenemplrkspswoyxhpv` (`name`),
  ADD KEY `vt_idx_qbaaewdounsrqtyvhikwfzcaunagxwkapmsq` (`handle`);

--
-- Indexes for table `vt_categories`
--
ALTER TABLE `vt_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_mpsnfmhjhlcoqsqwzaoqylyzmvcwkkjidmer` (`groupId`),
  ADD KEY `vt_fk_fqewdcespzulsoeetdtbfsiqujrdylyzdkzo` (`parentId`);

--
-- Indexes for table `vt_categorygroups`
--
ALTER TABLE `vt_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_taefxyxuhcgbskyfgtibthvwvmhwxjgzjhtc` (`name`),
  ADD KEY `vt_idx_jicdotutopvodkljjuthwcnzisrkkllipeqm` (`handle`),
  ADD KEY `vt_idx_gckwcrmhrjlkpfmutsmkopjjipigaxwkkmnu` (`structureId`),
  ADD KEY `vt_idx_hcpcdnasupyigsqfjlenbkhroxlnljkbzdyu` (`fieldLayoutId`),
  ADD KEY `vt_idx_enxmmuuskqhbuqrjhrieapzierxerqmyrbip` (`dateDeleted`);

--
-- Indexes for table `vt_categorygroups_sites`
--
ALTER TABLE `vt_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_eudapxxtmwqjgsywjtgzazzzxkzleplbygzp` (`groupId`,`siteId`),
  ADD KEY `vt_idx_txtfpibmhimrbvrhbmcioijjhjrqsbyukgwf` (`siteId`);

--
-- Indexes for table `vt_changedattributes`
--
ALTER TABLE `vt_changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `vt_idx_llrtzeuwdadjczdwpkxofahftvrghywguipc` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `vt_fk_pshhgqcauulqigrcbnjieteetioyzrzfszzy` (`siteId`),
  ADD KEY `vt_fk_qfhwktehowxnjwwqurjcwcblptenvrherddo` (`userId`);

--
-- Indexes for table `vt_changedfields`
--
ALTER TABLE `vt_changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `vt_idx_dgbaxxldmhqgeaajssxsjgkevpxnebzrdxrw` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `vt_fk_mxbxpnxvoipewobfaqcectzgrwqibjepcbdm` (`siteId`),
  ADD KEY `vt_fk_rrdhxamxgsxlzqmgrblmxtomenuuxoerfjob` (`fieldId`),
  ADD KEY `vt_fk_bmgjttxtwdkygqbeylndrvqptfjcqzgzbefj` (`userId`);

--
-- Indexes for table `vt_content`
--
ALTER TABLE `vt_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_gjazxegskighxdppifiheedmyfvejwcuscec` (`elementId`,`siteId`),
  ADD KEY `vt_idx_nzvaqbnvsbcfzdddpcocwdpmfiexmdiiootk` (`siteId`),
  ADD KEY `vt_idx_lbtefwqihkyszmzoodazzrradsubmnbgqefe` (`title`);

--
-- Indexes for table `vt_craftidtokens`
--
ALTER TABLE `vt_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_fk_xmpmjvsninehjowezrwqbeyisvwentqbprdc` (`userId`);

--
-- Indexes for table `vt_deprecationerrors`
--
ALTER TABLE `vt_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_qdhjzhtutzwzhmrmnevdzyixasfofbhvmfqd` (`key`,`fingerprint`);

--
-- Indexes for table `vt_drafts`
--
ALTER TABLE `vt_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_fkiwrltfhgeotgjyidgdxesgaliwgvmtxfbn` (`creatorId`,`provisional`),
  ADD KEY `vt_idx_wezodloalfcvifavayjvmwgsetcveiyekqac` (`saved`),
  ADD KEY `vt_fk_djwndczymipzkomepqhicfmconddllqaplpf` (`sourceId`);

--
-- Indexes for table `vt_elementindexsettings`
--
ALTER TABLE `vt_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_rgpnecwfvuuawtlmeezhhyqcotbjjbzfvuhx` (`type`);

--
-- Indexes for table `vt_elements`
--
ALTER TABLE `vt_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_vctgmxerlmcyhuvlfnsmlonwrpylnilvhiok` (`dateDeleted`),
  ADD KEY `vt_idx_yousxtixoiqpwanvmirdwronwziipmnovvng` (`fieldLayoutId`),
  ADD KEY `vt_idx_ugvvvdsxrctiulazcifpfwheyldsmjcyaeeb` (`type`),
  ADD KEY `vt_idx_pgahtrkpimeciylsbnxaznghjpywtplnqqab` (`enabled`),
  ADD KEY `vt_idx_nglmozavarxjfoblrkqlopsynvcqrrsgtfis` (`archived`,`dateCreated`),
  ADD KEY `vt_idx_rvknajxhxrexznhfzkvobffcymunotropalq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `vt_fk_yjepwbdjvszlxnxxfygcqiknfahvlxzhsiov` (`canonicalId`),
  ADD KEY `vt_fk_yrcvmrpaqqrvzxovcbnjcywauavfwoomcvqy` (`draftId`),
  ADD KEY `vt_fk_ngwclnjswjwkwwkspyvdkofdekvqfiplmupv` (`revisionId`);

--
-- Indexes for table `vt_elements_sites`
--
ALTER TABLE `vt_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_fursuklneppangwqcdrnpxfhnoxzrupequxn` (`elementId`,`siteId`),
  ADD KEY `vt_idx_qhmzirdzpelcngioxdkwqpskvumqtldtelcz` (`siteId`),
  ADD KEY `vt_idx_ogwlpiyfjenqmigxkikgaydmoixiezbidrsm` (`slug`,`siteId`),
  ADD KEY `vt_idx_uwvihmvgtbdoccxpzeazyrkikdpcqwjhwimn` (`enabled`),
  ADD KEY `vt_idx_wrckdtpqrdrllxarxzhqlhtxcmupxnsogcuq` (`uri`,`siteId`);

--
-- Indexes for table `vt_entries`
--
ALTER TABLE `vt_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_xnwmzmocfpakmsyxloblkbuvnqgxvsethibq` (`postDate`),
  ADD KEY `vt_idx_tadrbzfpgxpabhcsnhqacipnmovkvahglozf` (`expiryDate`),
  ADD KEY `vt_idx_amydxwwyuxvcimpjraupugjmcrnvuidylous` (`authorId`),
  ADD KEY `vt_idx_dysxjslpwijejsbniqtgunedqyetusnvnvvw` (`sectionId`),
  ADD KEY `vt_idx_xuczajxwamcpdkzjcoetonbfwhvkdrrgiiff` (`typeId`),
  ADD KEY `vt_fk_rpstdllqvbdyiqamnzyykxigdijylsucgbnh` (`parentId`);

--
-- Indexes for table `vt_entrytypes`
--
ALTER TABLE `vt_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_cqvssoitjwdpnpewizyirfzunbprdohqczwg` (`name`,`sectionId`),
  ADD KEY `vt_idx_mgbfytaalnitiwozhzfvxtbqkkmzbcvwxkxr` (`handle`,`sectionId`),
  ADD KEY `vt_idx_rdnvljvmdaifxyvmmgeewtrhzjvnuspvwctp` (`sectionId`),
  ADD KEY `vt_idx_gphzuzhjpcjbbidpdkrlqzrdblfijnhionmc` (`fieldLayoutId`),
  ADD KEY `vt_idx_sopgivfrmnksyuotdthchuwyyysbseyqthrn` (`dateDeleted`);

--
-- Indexes for table `vt_fieldgroups`
--
ALTER TABLE `vt_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_wvrlkkrskcnezqjtqiqtwhruarrberucydvk` (`name`),
  ADD KEY `vt_idx_zidthcpmrhsxfczycbwuduxzyzprmhonrizl` (`dateDeleted`,`name`);

--
-- Indexes for table `vt_fieldlayoutfields`
--
ALTER TABLE `vt_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_aqnjwwrvmppggkrsmkudjwqzjxlaqzlbbmug` (`layoutId`,`fieldId`),
  ADD KEY `vt_idx_eirhqnilcurbkujruelcjezqymztqixslszb` (`sortOrder`),
  ADD KEY `vt_idx_nmmkgmgtfpizdzsiomxvkckizkqtdtxijaus` (`tabId`),
  ADD KEY `vt_idx_uyorpdptkpelkewbihtialslulrzibpsgvnl` (`fieldId`);

--
-- Indexes for table `vt_fieldlayouts`
--
ALTER TABLE `vt_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_mjxvcelxhwypbhamulpbowxoatoyxmjipzov` (`dateDeleted`),
  ADD KEY `vt_idx_uuinhvajoqojkfusysherjvtbbrvfqwcmwye` (`type`);

--
-- Indexes for table `vt_fieldlayouttabs`
--
ALTER TABLE `vt_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_bmtlcdjpwchmogvdhynwvroqcobognaldqhw` (`sortOrder`),
  ADD KEY `vt_idx_joxrovvvnvhzctcvibvvdgsmiakahuydwgbn` (`layoutId`);

--
-- Indexes for table `vt_fields`
--
ALTER TABLE `vt_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_mfinryyvaplbhpqbehhrvbommaglvofrhcpz` (`handle`,`context`),
  ADD KEY `vt_idx_lruyruxvixbweyedzdjqdimvxydjglykexch` (`groupId`),
  ADD KEY `vt_idx_mgdieosdwjoywtlcyuidinfilpkptwmwexja` (`context`);

--
-- Indexes for table `vt_globalsets`
--
ALTER TABLE `vt_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_dutlzvhgdycnrwepsopcmcdhwvtvfwikwisw` (`name`),
  ADD KEY `vt_idx_dweqkvpfqljmcxopbmakstlqchbbafqkjrsw` (`handle`),
  ADD KEY `vt_idx_tkvjqvmeezaizdbhuwknazgcvojpmpmpizpr` (`fieldLayoutId`),
  ADD KEY `vt_idx_izfdzwxnannafvxtyjjmfdtqhkzvheduicae` (`sortOrder`);

--
-- Indexes for table `vt_gqlschemas`
--
ALTER TABLE `vt_gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vt_gqltokens`
--
ALTER TABLE `vt_gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_etjznudzauffwpbllcmcoadvalfuhagztfvj` (`accessToken`),
  ADD UNIQUE KEY `vt_idx_hzdnentjbpqmqkbhvltckdkcutgfevjylcfk` (`name`),
  ADD KEY `vt_fk_ahqblohmnbvhnnyjledkefvhhglgqovhivuw` (`schemaId`);

--
-- Indexes for table `vt_info`
--
ALTER TABLE `vt_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vt_matrixblocks`
--
ALTER TABLE `vt_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_afismsdhmxvdtsbjyzdunmwfdfxwzqbyelmw` (`ownerId`),
  ADD KEY `vt_idx_nzygebaywplfxrzxircltuhqekuzuzzmehoz` (`fieldId`),
  ADD KEY `vt_idx_fyjqrspfhuztawyzfidiftumwmbbsksnwdwg` (`typeId`),
  ADD KEY `vt_idx_qtfaojaosdflbxxlyyyaexljxfshxvixdvhf` (`sortOrder`);

--
-- Indexes for table `vt_matrixblocktypes`
--
ALTER TABLE `vt_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_dnjthhbyozrexokjqnsxsomnvzvjourwytlt` (`name`,`fieldId`),
  ADD KEY `vt_idx_ljzzzhgqvzzwpgblwcxsvpxjvtppkfyzsrkm` (`handle`,`fieldId`),
  ADD KEY `vt_idx_bhttngzltuolfbuqknkjgfwlgyrfxeuccdgw` (`fieldId`),
  ADD KEY `vt_idx_krungqyiisyaozkzlryfvwsqarfzybrlxnzz` (`fieldLayoutId`);

--
-- Indexes for table `vt_matrixcontent_navlink`
--
ALTER TABLE `vt_matrixcontent_navlink`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_tjzcsswbykixwohpxkpdltbfutxxnmcpbdji` (`elementId`,`siteId`),
  ADD KEY `vt_fk_qwvudlkpotwurygumsprhlhowcephxplpjhb` (`siteId`);

--
-- Indexes for table `vt_migrations`
--
ALTER TABLE `vt_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_aomdpjodbncjzhbxvivjdurwwoaplkmuewrw` (`track`,`name`);

--
-- Indexes for table `vt_plugins`
--
ALTER TABLE `vt_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_phvjpgdzleoufuxftwhcniueblhtmwophlhz` (`handle`);

--
-- Indexes for table `vt_projectconfig`
--
ALTER TABLE `vt_projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `vt_queue`
--
ALTER TABLE `vt_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_xlxchchjwnuopzbigfdmpeiwxilcmnolswtw` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `vt_idx_uvmlmdewhbeajlkkrjymndhzxrrruzirexiu` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `vt_relations`
--
ALTER TABLE `vt_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_oxyfzdrlhyqzalbchhwejydqcvpuqzmkzqkw` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `vt_idx_ccerfdhavvrcrhahhuxxdatsjjxogwbvtyfj` (`sourceId`),
  ADD KEY `vt_idx_ngoeodnkhspahthchxdxdsahcyuylsirkhhh` (`targetId`),
  ADD KEY `vt_idx_jczezuxzqfcchjarzivtojznhzuhazrlwyde` (`sourceSiteId`);

--
-- Indexes for table `vt_resourcepaths`
--
ALTER TABLE `vt_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `vt_revisions`
--
ALTER TABLE `vt_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_sdsplgjmhujluymwwhfwpvsujsnsukzfccib` (`sourceId`,`num`),
  ADD KEY `vt_fk_cnkdptalfkmovdpzcztusreulxvlqecrtuqk` (`creatorId`);

--
-- Indexes for table `vt_searchindex`
--
ALTER TABLE `vt_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `vt_searchindex` ADD FULLTEXT KEY `vt_idx_vtrvgcclmwsmgxgpyjonqwxpuliiqvzgosww` (`keywords`);

--
-- Indexes for table `vt_sections`
--
ALTER TABLE `vt_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_simjhbefroqwewuiqftgqsfugmowwixpawmr` (`handle`),
  ADD KEY `vt_idx_iiebupbhmislfnrprsbnzgnzqgjkfyrfpdda` (`name`),
  ADD KEY `vt_idx_tqhbpjqhdwzncadjrukwpkhyfqitzpdyiqqe` (`structureId`),
  ADD KEY `vt_idx_odmlyertkuekullbgwualtmkvlbdssbkqhgj` (`dateDeleted`);

--
-- Indexes for table `vt_sections_sites`
--
ALTER TABLE `vt_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_vzcjkviznttrvmxpdahkxypqztlbovxtdeuo` (`sectionId`,`siteId`),
  ADD KEY `vt_idx_imjsvkvppeijxgwudfajaddckzqahpanzbpy` (`siteId`);

--
-- Indexes for table `vt_sequences`
--
ALTER TABLE `vt_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vt_sessions`
--
ALTER TABLE `vt_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_igfklpnxyaoxspsqdcjzhuzuqpobcglebtex` (`uid`),
  ADD KEY `vt_idx_xmpvnlvuqfxvrjcuhulqvxcbjewouvkyhaqh` (`token`),
  ADD KEY `vt_idx_igydtdfvraestrhrihzpvnhcsppdahscyzqn` (`dateUpdated`),
  ADD KEY `vt_idx_qgazwtkhmzqsyeigeyagdwvfgkxjgijyivnh` (`userId`);

--
-- Indexes for table `vt_shunnedmessages`
--
ALTER TABLE `vt_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_couzifsbcwqjtamfyrrlnocxfnciymvpkora` (`userId`,`message`);

--
-- Indexes for table `vt_sitegroups`
--
ALTER TABLE `vt_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_mwcnxuevbloklrglekukaecgjenbfzksznpd` (`name`);

--
-- Indexes for table `vt_sites`
--
ALTER TABLE `vt_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_fnnemjivdxpmjvmrqhvyupczvmynjjvzoubg` (`dateDeleted`),
  ADD KEY `vt_idx_xcuqiszswcydbfbmhxgxynvtbtwrvvqfexfk` (`handle`),
  ADD KEY `vt_idx_zmypqpvmzduniiogynwfqmdmgnjhqrxjgayf` (`sortOrder`),
  ADD KEY `vt_fk_ugugpxhcsterddkpnxoyuuqejiuninluvcem` (`groupId`);

--
-- Indexes for table `vt_structureelements`
--
ALTER TABLE `vt_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_mylxipcjycnyjhjszzaesebpnzajjdhnuzrl` (`structureId`,`elementId`),
  ADD KEY `vt_idx_pufxzeuhasnerzrgtjlzqhjurpchxgpqhmxm` (`root`),
  ADD KEY `vt_idx_cnkcjabctdfuhoipaflvexcxgcsvxopwjjmb` (`lft`),
  ADD KEY `vt_idx_xaehjaubensxyrcwttfdgvndsaxacplzlfuv` (`rgt`),
  ADD KEY `vt_idx_tylmnkuckjdytoghuomylrrnyawhyjdkcerm` (`level`),
  ADD KEY `vt_idx_qtsgoxcnnczkflfewpepizutyqazzgtrcwuf` (`elementId`);

--
-- Indexes for table `vt_structures`
--
ALTER TABLE `vt_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_bzhbnqaeirjrcitavgbypsdavcfcpwurtsoj` (`dateDeleted`);

--
-- Indexes for table `vt_systemmessages`
--
ALTER TABLE `vt_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_rnqgbklczyxoasrizupawhmnogrgjzvtvmvd` (`key`,`language`),
  ADD KEY `vt_idx_seeemitvawvgtrjeqjveqwmkrlpmdegxypep` (`language`);

--
-- Indexes for table `vt_taggroups`
--
ALTER TABLE `vt_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_fwdsfhidohtsydxhadoofgejercdiqquocnn` (`name`),
  ADD KEY `vt_idx_ysfxapdscbagokozramoqdjkrljsmwbvrbze` (`handle`),
  ADD KEY `vt_idx_grfayoeltzoeduglpzmbcnkiebjcetheevsw` (`dateDeleted`),
  ADD KEY `vt_fk_bdqosrcskjfukbtyjsuxqjdnqguobkgheohc` (`fieldLayoutId`);

--
-- Indexes for table `vt_tags`
--
ALTER TABLE `vt_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_msduqkgtcdmhcmewuyhpkmpyfstuidvtnndu` (`groupId`);

--
-- Indexes for table `vt_templatecacheelements`
--
ALTER TABLE `vt_templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_iazvgfhycnudljqretmtbkseredxjdwhvcsh` (`cacheId`),
  ADD KEY `vt_idx_sxqidrpbiedccvwqkgxjfvebrkfvmmebtwcu` (`elementId`);

--
-- Indexes for table `vt_templatecachequeries`
--
ALTER TABLE `vt_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_cprxbwcyquskdthkevudpjfymzatarjfhhqv` (`cacheId`),
  ADD KEY `vt_idx_jgokgchmtfsdboqtzitiubhraxyeqyavilzy` (`type`);

--
-- Indexes for table `vt_templatecaches`
--
ALTER TABLE `vt_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_eesqnsiepkhznwkuixyuupdqfwitqvmpkyiw` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `vt_idx_swjybyhlfozizeevavyxcnwkafhwcturmkis` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `vt_idx_fatkqpiqeekxztlxsmjdbefjptmripvsktyk` (`siteId`);

--
-- Indexes for table `vt_tokens`
--
ALTER TABLE `vt_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_hhfcqhfsvlkzoiernbewzcbyiodtqatwmlqw` (`token`),
  ADD KEY `vt_idx_bikgnrxedizslngcutwfwyixlzmzilplzddp` (`expiryDate`);

--
-- Indexes for table `vt_usergroups`
--
ALTER TABLE `vt_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_lgkwfyhrgarytsxcwaeyiczsgshiznfxkyfa` (`handle`),
  ADD KEY `vt_idx_bkwaiiuqnhnxhntegkytrergvoqcfwgkapyi` (`name`);

--
-- Indexes for table `vt_usergroups_users`
--
ALTER TABLE `vt_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_gyrgpgagudltgtpetigpwpyienubtnjemaac` (`groupId`,`userId`),
  ADD KEY `vt_idx_wviczhgvpvluupqnlxnophbngrjhvorkpaoz` (`userId`);

--
-- Indexes for table `vt_userpermissions`
--
ALTER TABLE `vt_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_jfeyfkodkxynrbjanuzlnulolvlzhybevreq` (`name`);

--
-- Indexes for table `vt_userpermissions_usergroups`
--
ALTER TABLE `vt_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_imjhuseuhomkjrrowdotsfidqwoznzabzlcz` (`permissionId`,`groupId`),
  ADD KEY `vt_idx_tgtpwdchypmzhvxosdphbziuzgltgitrqkev` (`groupId`);

--
-- Indexes for table `vt_userpermissions_users`
--
ALTER TABLE `vt_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_xfsmdnhqddqzsweajpptsrjtrdoltvbylcbx` (`permissionId`,`userId`),
  ADD KEY `vt_idx_mvvywplebmezefebwphmswdmpvhywmjgvchv` (`userId`);

--
-- Indexes for table `vt_userpreferences`
--
ALTER TABLE `vt_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `vt_users`
--
ALTER TABLE `vt_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_tynynwtqhhbplltbpbklrytioocazqwlhnlk` (`uid`),
  ADD KEY `vt_idx_wxirwecyuevtmhgvdaocvnfawgnzykukewlb` (`verificationCode`),
  ADD KEY `vt_idx_vpdisumyxzdisqwmhiyszlfpunxezdvsqkdt` (`email`),
  ADD KEY `vt_idx_kyevlnuredzoncqbkchwbhzarmchjtvbeojy` (`username`),
  ADD KEY `vt_fk_rmfrybcpuduugkjnkflfjjigsylgjzupchrb` (`photoId`);

--
-- Indexes for table `vt_volumefolders`
--
ALTER TABLE `vt_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vt_idx_ilmgusmmhdzzfbjliaqpnozwverqyubsdbbf` (`name`,`parentId`,`volumeId`),
  ADD KEY `vt_idx_rushuniijyclobmtkrnelbyhpxwwuybqfque` (`parentId`),
  ADD KEY `vt_idx_ytvrdcflotlypqvctrffketaqigcicvqyewt` (`volumeId`);

--
-- Indexes for table `vt_volumes`
--
ALTER TABLE `vt_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_svumgeutorpzoixnosdyivjpfsvwkxqnicyd` (`name`),
  ADD KEY `vt_idx_iuglbwvivpubrrdzrrohwrcigczaosdzqghe` (`handle`),
  ADD KEY `vt_idx_unaoqtytvplnecinmnublommzndwdmebidbj` (`fieldLayoutId`),
  ADD KEY `vt_idx_zefxccrnadopzvgniwxbejjaiotueqnlsecl` (`dateDeleted`);

--
-- Indexes for table `vt_widgets`
--
ALTER TABLE `vt_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vt_idx_xkgudkyxamnsxuhrayibopkydmelofbuazxr` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vtannouncements`
--
ALTER TABLE `vtannouncements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtassetindexdata`
--
ALTER TABLE `vtassetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtassettransformindex`
--
ALTER TABLE `vtassettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtassettransforms`
--
ALTER TABLE `vtassettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtcategorygroups`
--
ALTER TABLE `vtcategorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtcategorygroups_sites`
--
ALTER TABLE `vtcategorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtcontent`
--
ALTER TABLE `vtcontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtcraftidtokens`
--
ALTER TABLE `vtcraftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtdeprecationerrors`
--
ALTER TABLE `vtdeprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtdrafts`
--
ALTER TABLE `vtdrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtelementindexsettings`
--
ALTER TABLE `vtelementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtelements`
--
ALTER TABLE `vtelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtelements_sites`
--
ALTER TABLE `vtelements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtentrytypes`
--
ALTER TABLE `vtentrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtfieldgroups`
--
ALTER TABLE `vtfieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtfieldlayoutfields`
--
ALTER TABLE `vtfieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtfieldlayouts`
--
ALTER TABLE `vtfieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtfieldlayouttabs`
--
ALTER TABLE `vtfieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtfields`
--
ALTER TABLE `vtfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtglobalsets`
--
ALTER TABLE `vtglobalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtgqlschemas`
--
ALTER TABLE `vtgqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtgqltokens`
--
ALTER TABLE `vtgqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtinfo`
--
ALTER TABLE `vtinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtmatrixblocktypes`
--
ALTER TABLE `vtmatrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtmigrations`
--
ALTER TABLE `vtmigrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `vtplugins`
--
ALTER TABLE `vtplugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtqueue`
--
ALTER TABLE `vtqueue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtrelations`
--
ALTER TABLE `vtrelations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtrevisions`
--
ALTER TABLE `vtrevisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtsections`
--
ALTER TABLE `vtsections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtsections_sites`
--
ALTER TABLE `vtsections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtsessions`
--
ALTER TABLE `vtsessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtshunnedmessages`
--
ALTER TABLE `vtshunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtsitegroups`
--
ALTER TABLE `vtsitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtsites`
--
ALTER TABLE `vtsites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtstructureelements`
--
ALTER TABLE `vtstructureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtstructures`
--
ALTER TABLE `vtstructures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtsystemmessages`
--
ALTER TABLE `vtsystemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vttaggroups`
--
ALTER TABLE `vttaggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vttemplatecacheelements`
--
ALTER TABLE `vttemplatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vttemplatecachequeries`
--
ALTER TABLE `vttemplatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vttemplatecaches`
--
ALTER TABLE `vttemplatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vttokens`
--
ALTER TABLE `vttokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtusergroups`
--
ALTER TABLE `vtusergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtusergroups_users`
--
ALTER TABLE `vtusergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtuserpermissions`
--
ALTER TABLE `vtuserpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtuserpermissions_usergroups`
--
ALTER TABLE `vtuserpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtuserpermissions_users`
--
ALTER TABLE `vtuserpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtuserpreferences`
--
ALTER TABLE `vtuserpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vtvolumefolders`
--
ALTER TABLE `vtvolumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtvolumes`
--
ALTER TABLE `vtvolumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtwidgets`
--
ALTER TABLE `vtwidgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_announcements`
--
ALTER TABLE `vt_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_assetindexdata`
--
ALTER TABLE `vt_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_assettransformindex`
--
ALTER TABLE `vt_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_assettransforms`
--
ALTER TABLE `vt_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_categorygroups`
--
ALTER TABLE `vt_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_categorygroups_sites`
--
ALTER TABLE `vt_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_content`
--
ALTER TABLE `vt_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `vt_craftidtokens`
--
ALTER TABLE `vt_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_deprecationerrors`
--
ALTER TABLE `vt_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_drafts`
--
ALTER TABLE `vt_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vt_elementindexsettings`
--
ALTER TABLE `vt_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_elements`
--
ALTER TABLE `vt_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `vt_elements_sites`
--
ALTER TABLE `vt_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `vt_entrytypes`
--
ALTER TABLE `vt_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vt_fieldgroups`
--
ALTER TABLE `vt_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vt_fieldlayoutfields`
--
ALTER TABLE `vt_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vt_fieldlayouts`
--
ALTER TABLE `vt_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vt_fieldlayouttabs`
--
ALTER TABLE `vt_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `vt_fields`
--
ALTER TABLE `vt_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vt_globalsets`
--
ALTER TABLE `vt_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vt_gqlschemas`
--
ALTER TABLE `vt_gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_gqltokens`
--
ALTER TABLE `vt_gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_info`
--
ALTER TABLE `vt_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vt_matrixblocktypes`
--
ALTER TABLE `vt_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vt_matrixcontent_navlink`
--
ALTER TABLE `vt_matrixcontent_navlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vt_migrations`
--
ALTER TABLE `vt_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `vt_plugins`
--
ALTER TABLE `vt_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vt_queue`
--
ALTER TABLE `vt_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `vt_relations`
--
ALTER TABLE `vt_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vt_revisions`
--
ALTER TABLE `vt_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vt_sections`
--
ALTER TABLE `vt_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vt_sections_sites`
--
ALTER TABLE `vt_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vt_sessions`
--
ALTER TABLE `vt_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vt_shunnedmessages`
--
ALTER TABLE `vt_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_sitegroups`
--
ALTER TABLE `vt_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vt_sites`
--
ALTER TABLE `vt_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vt_structureelements`
--
ALTER TABLE `vt_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_structures`
--
ALTER TABLE `vt_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_systemmessages`
--
ALTER TABLE `vt_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_taggroups`
--
ALTER TABLE `vt_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_templatecacheelements`
--
ALTER TABLE `vt_templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_templatecachequeries`
--
ALTER TABLE `vt_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_templatecaches`
--
ALTER TABLE `vt_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_tokens`
--
ALTER TABLE `vt_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_usergroups`
--
ALTER TABLE `vt_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_usergroups_users`
--
ALTER TABLE `vt_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_userpermissions`
--
ALTER TABLE `vt_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_userpermissions_usergroups`
--
ALTER TABLE `vt_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_userpermissions_users`
--
ALTER TABLE `vt_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vt_userpreferences`
--
ALTER TABLE `vt_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vt_volumefolders`
--
ALTER TABLE `vt_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vt_volumes`
--
ALTER TABLE `vt_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vt_widgets`
--
ALTER TABLE `vt_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vtannouncements`
--
ALTER TABLE `vtannouncements`
  ADD CONSTRAINT `vtfk_rlyemdasgzbnsawfdexvwetljaookzsmwmxc` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_sbomtrkqapgvvzshkcgqjvbzzwgtabxgerfp` FOREIGN KEY (`pluginId`) REFERENCES `vtplugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtassetindexdata`
--
ALTER TABLE `vtassetindexdata`
  ADD CONSTRAINT `vtfk_hqvonadnvxgncnsryvqnrjvpysmnftuaknls` FOREIGN KEY (`volumeId`) REFERENCES `vtvolumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtassets`
--
ALTER TABLE `vtassets`
  ADD CONSTRAINT `vtfk_bsdvllcajudqpgrdfeznkbkupvgpggbiphnt` FOREIGN KEY (`folderId`) REFERENCES `vtvolumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_lclovqyruaxrkcmsdtpuliccyvftwpqdsbtq` FOREIGN KEY (`volumeId`) REFERENCES `vtvolumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_vtwddbadnmkvedhcazgnszripwcxlliunehz` FOREIGN KEY (`uploaderId`) REFERENCES `vtusers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_yxieuktgwigioslybxkocwscixwwcshvdmmp` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtcategories`
--
ALTER TABLE `vtcategories`
  ADD CONSTRAINT `vtfk_dsysouneektbsiwjjaoqlnjjzkifoqyndpfp` FOREIGN KEY (`groupId`) REFERENCES `vtcategorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_ljvcgtlbgttalqmchyuxoqchihcrcyongyzm` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_uiygkdcvqiuhmtjcxedfbovndmjwazgkwmce` FOREIGN KEY (`parentId`) REFERENCES `vtcategories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtcategorygroups`
--
ALTER TABLE `vtcategorygroups`
  ADD CONSTRAINT `vtfk_caizoknmnxhdqrzfywytqfgprptkhwowwatv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_itjisqysngdfvqtptxawyjnowazdgtepbimh` FOREIGN KEY (`structureId`) REFERENCES `vtstructures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtcategorygroups_sites`
--
ALTER TABLE `vtcategorygroups_sites`
  ADD CONSTRAINT `vtfk_behfhqaajwwcbwmzsqyvdppdsosjlqudifvo` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_kkcgyvpxlzxymgphojqjtuspblrvsmaaulov` FOREIGN KEY (`groupId`) REFERENCES `vtcategorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtchangedattributes`
--
ALTER TABLE `vtchangedattributes`
  ADD CONSTRAINT `vtfk_bwitjpzisfxqaornfmqdbjlornmivmmtffpd` FOREIGN KEY (`elementId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_eqmwrylpfnakksgryrglzncsvrrfkjbzauhk` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_nisotkattkpiigaertqmpodyzwikyheoipub` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtchangedfields`
--
ALTER TABLE `vtchangedfields`
  ADD CONSTRAINT `vtfk_kcctozxfwuxakktemgqopvaxzrxzyzfxxxvi` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_mhgjrljwodlzmyunbxzzcqhlnqlownvbvvwk` FOREIGN KEY (`elementId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_smaqlxnzrncwpbcnldprxphsvqbimxvttxlf` FOREIGN KEY (`fieldId`) REFERENCES `vtfields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_yyhochumjzgzsitehrinafvslvfxmlypxeoc` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtcontent`
--
ALTER TABLE `vtcontent`
  ADD CONSTRAINT `vtfk_bwnzyqpkoqafmunswuxluudgdjinzfpkwbjv` FOREIGN KEY (`elementId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_sdpgkqcfrpugpcqcushuxtlyrwnvwhxduxwp` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtcraftidtokens`
--
ALTER TABLE `vtcraftidtokens`
  ADD CONSTRAINT `vtfk_mabznmlwpzpghrhoalsypfbpnwpbnbjkbewe` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtdrafts`
--
ALTER TABLE `vtdrafts`
  ADD CONSTRAINT `vtfk_ctrdafkknoymdplqompnodktrksqszouszdn` FOREIGN KEY (`sourceId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_icmprxfefhblpqmdsxjrzczckdbzysmuhiog` FOREIGN KEY (`creatorId`) REFERENCES `vtusers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtelements`
--
ALTER TABLE `vtelements`
  ADD CONSTRAINT `vtfk_evbovxnuepyepsmfygihrymykkrqzdrntcio` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_iojutmucohzhkvitfmgbsnmvgblpsfuxdvbn` FOREIGN KEY (`canonicalId`) REFERENCES `vtelements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_jcartmmoyputrcmlzgjfnyqnvqhwjlsekvqd` FOREIGN KEY (`revisionId`) REFERENCES `vtrevisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_qmqszaxicpdvssvowheecbofrfftumxcjiwg` FOREIGN KEY (`draftId`) REFERENCES `vtdrafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtelements_sites`
--
ALTER TABLE `vtelements_sites`
  ADD CONSTRAINT `vtfk_tohypobvxlktlbzpcbzlzgsyubysclgbcgdt` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_wylzziuitolpqjaflihmdvpvwzvdmpduknzp` FOREIGN KEY (`elementId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtentries`
--
ALTER TABLE `vtentries`
  ADD CONSTRAINT `vtfk_ejdtylnnxazbvvmzjezrwdckxjmwqmppoaat` FOREIGN KEY (`typeId`) REFERENCES `vtentrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_kpshxsjjorpqpxerejivvjngiyateoeivssk` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_qchfsmtyyetqacfzlllcvrdsmnbquzuyeylm` FOREIGN KEY (`parentId`) REFERENCES `vtentries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_qmorwocraojbarddmxnqghbyadcdwexkqddc` FOREIGN KEY (`sectionId`) REFERENCES `vtsections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_zgwbndvvafnaonrzstajloosbvipckfttafm` FOREIGN KEY (`authorId`) REFERENCES `vtusers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtentrytypes`
--
ALTER TABLE `vtentrytypes`
  ADD CONSTRAINT `vtfk_hkgfclqakyweuulmunxbfirmdfirdepwkrsh` FOREIGN KEY (`sectionId`) REFERENCES `vtsections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_zseeatjxuklahuxtbvosajpgityfcssadepg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtfieldlayoutfields`
--
ALTER TABLE `vtfieldlayoutfields`
  ADD CONSTRAINT `vtfk_arnpaonjayjkwrqkuqfexhphdxcufehxxztu` FOREIGN KEY (`tabId`) REFERENCES `vtfieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_kseocdpbddjegtvqhmnpbtohactrpdkyxyse` FOREIGN KEY (`fieldId`) REFERENCES `vtfields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_mfjfraxjdcldjnupmmzfvfaztnpndfyzwsqz` FOREIGN KEY (`layoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtfieldlayouttabs`
--
ALTER TABLE `vtfieldlayouttabs`
  ADD CONSTRAINT `vtfk_icxbqawtppksjibdzbpxvpwywwlatruvmjbv` FOREIGN KEY (`layoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtfields`
--
ALTER TABLE `vtfields`
  ADD CONSTRAINT `vtfk_gvuyotnlolepkndpbroiuoduhgtnzgkzapxb` FOREIGN KEY (`groupId`) REFERENCES `vtfieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtglobalsets`
--
ALTER TABLE `vtglobalsets`
  ADD CONSTRAINT `vtfk_brioyevwxjztgueciiinbncrollnsgiqotwc` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_vnyqlcddwugiaqvkwldwssngpbdwlqqtozow` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtgqltokens`
--
ALTER TABLE `vtgqltokens`
  ADD CONSTRAINT `vtfk_khqvduaibnvppyqdrolqbntndyuofpwbncvh` FOREIGN KEY (`schemaId`) REFERENCES `vtgqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtmatrixblocks`
--
ALTER TABLE `vtmatrixblocks`
  ADD CONSTRAINT `vtfk_chqfoetrdisjifduiatquxvjfzljaeancfpw` FOREIGN KEY (`typeId`) REFERENCES `vtmatrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_eycmhuykcbxbiqpepxswtqphmlwakwpuxmdc` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_moqbkxxeumrlcyjmzdtkjpnqtvozaooxeeoj` FOREIGN KEY (`fieldId`) REFERENCES `vtfields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_zdknftxedzkvannvvlxvupmxuzvnzkwegtmx` FOREIGN KEY (`ownerId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtmatrixblocktypes`
--
ALTER TABLE `vtmatrixblocktypes`
  ADD CONSTRAINT `vtfk_uqempjysjkdotuiuxptfknxcswrfuttyocyb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_ytizcupeaszqbzztfsdttbcvwsboylfqebni` FOREIGN KEY (`fieldId`) REFERENCES `vtfields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtrelations`
--
ALTER TABLE `vtrelations`
  ADD CONSTRAINT `vtfk_ikrgwqhajbemkdjfoshourhblqeyguumnjrh` FOREIGN KEY (`targetId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_jrzdcjgrljxwjmrvaezlmcdzabaqbxvkcdzb` FOREIGN KEY (`sourceSiteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_ltrdlhhfkvkmhfmzupwwoxvkonuweaknqftg` FOREIGN KEY (`fieldId`) REFERENCES `vtfields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_luyffgllqlpjubbrldikmnybuyuailnohpqa` FOREIGN KEY (`sourceId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtrevisions`
--
ALTER TABLE `vtrevisions`
  ADD CONSTRAINT `vtfk_ccbjiyssnupmsqqsnkuqbmkgmjfzkttxzqez` FOREIGN KEY (`sourceId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_zfhaenuladyhhbmqzcsritnjhpmqwhpdzyki` FOREIGN KEY (`creatorId`) REFERENCES `vtusers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtsections`
--
ALTER TABLE `vtsections`
  ADD CONSTRAINT `vtfk_ytjyqjshcgqbgrnejutsnwgkivklnyxowzex` FOREIGN KEY (`structureId`) REFERENCES `vtstructures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtsections_sites`
--
ALTER TABLE `vtsections_sites`
  ADD CONSTRAINT `vtfk_licytnecegkiqntwrzflccppuhhqfkgxupdh` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vtfk_pseigsftlaqorxhygknktyetpcxzddzhnyig` FOREIGN KEY (`sectionId`) REFERENCES `vtsections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtsessions`
--
ALTER TABLE `vtsessions`
  ADD CONSTRAINT `vtfk_ixmgyhcvefvrdxshtgkhhjicprfifybzsdbm` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtshunnedmessages`
--
ALTER TABLE `vtshunnedmessages`
  ADD CONSTRAINT `vtfk_vrgiastqnjxcejkoivzuijaaocjvuwfddczg` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtsites`
--
ALTER TABLE `vtsites`
  ADD CONSTRAINT `vtfk_rzfbyktawovyvbufvblrklqjkodbcgaxtbmd` FOREIGN KEY (`groupId`) REFERENCES `vtsitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtstructureelements`
--
ALTER TABLE `vtstructureelements`
  ADD CONSTRAINT `vtfk_irhqzofpngrnixahyowxeejoyojnrbqrrblp` FOREIGN KEY (`elementId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_olprwrprhqvzxppdpdejcmgildqvcgjdxgcw` FOREIGN KEY (`structureId`) REFERENCES `vtstructures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vttaggroups`
--
ALTER TABLE `vttaggroups`
  ADD CONSTRAINT `vtfk_fasgoquoxqqztoukrcirrryhisbgvugrahya` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vttags`
--
ALTER TABLE `vttags`
  ADD CONSTRAINT `vtfk_axgjihrutmxiycbfnigskaveoobyejfwnspw` FOREIGN KEY (`groupId`) REFERENCES `vttaggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_hxcmitzjfkkuewyfvocmetulwydsowdinvic` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vttemplatecacheelements`
--
ALTER TABLE `vttemplatecacheelements`
  ADD CONSTRAINT `vtfk_cgoteffoxpnbzmwaqbcsedzizkjcaqlvycin` FOREIGN KEY (`cacheId`) REFERENCES `vttemplatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_hozavwcptkugfneoxfnkqedfwjtynnquwxet` FOREIGN KEY (`elementId`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vttemplatecachequeries`
--
ALTER TABLE `vttemplatecachequeries`
  ADD CONSTRAINT `vtfk_hofeblgiduzcjouxfqaigijwitcgfvfwnket` FOREIGN KEY (`cacheId`) REFERENCES `vttemplatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vttemplatecaches`
--
ALTER TABLE `vttemplatecaches`
  ADD CONSTRAINT `vtfk_ipfonfswmeiazxtyegqxuliigvlqaamabppj` FOREIGN KEY (`siteId`) REFERENCES `vtsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vtusergroups_users`
--
ALTER TABLE `vtusergroups_users`
  ADD CONSTRAINT `vtfk_ceqhgetapyiaflwugnyzbbpkeudhlxdyvbsk` FOREIGN KEY (`groupId`) REFERENCES `vtusergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_hlzgqhatrnfuopnvwexfqfmeqgjlqiezpney` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtuserpermissions_usergroups`
--
ALTER TABLE `vtuserpermissions_usergroups`
  ADD CONSTRAINT `vtfk_sppvqupujszaqruxwvbswzzdddjclfywhlqr` FOREIGN KEY (`groupId`) REFERENCES `vtusergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_ztnjubzkvhwckyeajbcaizcjdcwzezvkurhd` FOREIGN KEY (`permissionId`) REFERENCES `vtuserpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtuserpermissions_users`
--
ALTER TABLE `vtuserpermissions_users`
  ADD CONSTRAINT `vtfk_kgnhawpykaeowkylmpjpsltbjebwjlhhvcps` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_ucztquyvpegqohvhocfrvnkrbvsjtlqlbxki` FOREIGN KEY (`permissionId`) REFERENCES `vtuserpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtuserpreferences`
--
ALTER TABLE `vtuserpreferences`
  ADD CONSTRAINT `vtfk_xgaqvtjvlzgsqqcfcfnqmdsnseizmehgutdf` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtusers`
--
ALTER TABLE `vtusers`
  ADD CONSTRAINT `vtfk_kvqltwconsbdldxulnceqabfaldqwxwdefyq` FOREIGN KEY (`photoId`) REFERENCES `vtassets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vtfk_qbrsrvvpdynxakapygudpzwgtklpxpzorceo` FOREIGN KEY (`id`) REFERENCES `vtelements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtvolumefolders`
--
ALTER TABLE `vtvolumefolders`
  ADD CONSTRAINT `vtfk_necjodyvuqsniukwopsyqkknlhmriywmibnd` FOREIGN KEY (`volumeId`) REFERENCES `vtvolumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vtfk_srsqctxfrkbshirvixrkjkquhgdzfojwaupg` FOREIGN KEY (`parentId`) REFERENCES `vtvolumefolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtvolumes`
--
ALTER TABLE `vtvolumes`
  ADD CONSTRAINT `vtfk_qxahgxmddethykldcdblxzcojkaqehjmktob` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vtfieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vtwidgets`
--
ALTER TABLE `vtwidgets`
  ADD CONSTRAINT `vtfk_hfncafwlqijodbtypjfbgreslmmndmejniyu` FOREIGN KEY (`userId`) REFERENCES `vtusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_announcements`
--
ALTER TABLE `vt_announcements`
  ADD CONSTRAINT `vt_fk_anyswbqbprrkepoufwuzwaylokbmjwbgdoys` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_lzguyisvmllokybwlzywrtquoppcenyupuke` FOREIGN KEY (`pluginId`) REFERENCES `vt_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_assetindexdata`
--
ALTER TABLE `vt_assetindexdata`
  ADD CONSTRAINT `vt_fk_btjitchuzznutxqwvdnwdehavdqvcqbrvgbs` FOREIGN KEY (`volumeId`) REFERENCES `vt_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_assets`
--
ALTER TABLE `vt_assets`
  ADD CONSTRAINT `vt_fk_fcguemgdweuhlsunqdoweszknajwhcibddiu` FOREIGN KEY (`folderId`) REFERENCES `vt_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_lrnwiaancwqxdposlfkumxkzpcepcdmqdwrw` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_sshkqdxxefvainugivjxdtlxpihgfiwvbdlj` FOREIGN KEY (`volumeId`) REFERENCES `vt_volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_wnseviakoroxwsvgcsuqpyrmyjoulwklpdoy` FOREIGN KEY (`uploaderId`) REFERENCES `vt_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_categories`
--
ALTER TABLE `vt_categories`
  ADD CONSTRAINT `vt_fk_fqewdcespzulsoeetdtbfsiqujrdylyzdkzo` FOREIGN KEY (`parentId`) REFERENCES `vt_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vt_fk_gwpddypmpujjkaijgugnjoqqhdbqrqlzizzt` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_nbpgiabnvzansrjpynqwugxwzwyjeuubmmwv` FOREIGN KEY (`groupId`) REFERENCES `vt_categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_categorygroups`
--
ALTER TABLE `vt_categorygroups`
  ADD CONSTRAINT `vt_fk_lkjbfnpcpgjnvqusydhkjpwnuuhzyptidupr` FOREIGN KEY (`structureId`) REFERENCES `vt_structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_lotvumxkdmkmywvgrhajgbapcfxmhztqtlrr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_categorygroups_sites`
--
ALTER TABLE `vt_categorygroups_sites`
  ADD CONSTRAINT `vt_fk_mhctyslrurtimvfkqwfcnssmerwzpqipdzhg` FOREIGN KEY (`groupId`) REFERENCES `vt_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_yxmkwwuzdifxhmojychpwwtwelrnpafovlon` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vt_changedattributes`
--
ALTER TABLE `vt_changedattributes`
  ADD CONSTRAINT `vt_fk_pshhgqcauulqigrcbnjieteetioyzrzfszzy` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_qfhwktehowxnjwwqurjcwcblptenvrherddo` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_tfwckqctdldieweojkholvewystmidhkykue` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vt_changedfields`
--
ALTER TABLE `vt_changedfields`
  ADD CONSTRAINT `vt_fk_aaxgqawfjeiwqxxqnbtjwhuqdumrzjketzcq` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_bmgjttxtwdkygqbeylndrvqptfjcqzgzbefj` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_mxbxpnxvoipewobfaqcectzgrwqibjepcbdm` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_rrdhxamxgsxlzqmgrblmxtomenuuxoerfjob` FOREIGN KEY (`fieldId`) REFERENCES `vt_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vt_content`
--
ALTER TABLE `vt_content`
  ADD CONSTRAINT `vt_fk_cpmcsccdzwkpfxrywcxticzjwblzkuadttme` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_nrrfimlvlasslykpyjelabwvcqjodsrtdhig` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_craftidtokens`
--
ALTER TABLE `vt_craftidtokens`
  ADD CONSTRAINT `vt_fk_xmpmjvsninehjowezrwqbeyisvwentqbprdc` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_drafts`
--
ALTER TABLE `vt_drafts`
  ADD CONSTRAINT `vt_fk_djwndczymipzkomepqhicfmconddllqaplpf` FOREIGN KEY (`sourceId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_wtazsarmwwyhpphdbvneypwwrgzbqxrcftln` FOREIGN KEY (`creatorId`) REFERENCES `vt_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_elements`
--
ALTER TABLE `vt_elements`
  ADD CONSTRAINT `vt_fk_cyycstaayxwsdddenemekqjochjolkrffysk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vt_fk_ngwclnjswjwkwwkspyvdkofdekvqfiplmupv` FOREIGN KEY (`revisionId`) REFERENCES `vt_revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_yjepwbdjvszlxnxxfygcqiknfahvlxzhsiov` FOREIGN KEY (`canonicalId`) REFERENCES `vt_elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vt_fk_yrcvmrpaqqrvzxovcbnjcywauavfwoomcvqy` FOREIGN KEY (`draftId`) REFERENCES `vt_drafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_elements_sites`
--
ALTER TABLE `vt_elements_sites`
  ADD CONSTRAINT `vt_fk_fxmcavzeqrbpypgzbvksgefyvzpgmcgftxdz` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_kzioadcteztaikdzkwfydbosvhjsombgnvpi` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_entries`
--
ALTER TABLE `vt_entries`
  ADD CONSTRAINT `vt_fk_bydfwlapzdkslurfxyfrpuzymksopivguopi` FOREIGN KEY (`authorId`) REFERENCES `vt_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vt_fk_eveurzyfyvqosffphjrwsmfvlupbssdygayb` FOREIGN KEY (`sectionId`) REFERENCES `vt_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_hqztjdjkivkyusmvtaoclexchizunzxvvenu` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_hxdwuydxhromrynboybelrvqpnixctowohig` FOREIGN KEY (`typeId`) REFERENCES `vt_entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_rpstdllqvbdyiqamnzyykxigdijylsucgbnh` FOREIGN KEY (`parentId`) REFERENCES `vt_entries` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_entrytypes`
--
ALTER TABLE `vt_entrytypes`
  ADD CONSTRAINT `vt_fk_qzonwgcfayahanqxwejwzkqfzdijzjnmimrs` FOREIGN KEY (`sectionId`) REFERENCES `vt_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_yiioicakrxuronlmduvyfhyaslupossnoudu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_fieldlayoutfields`
--
ALTER TABLE `vt_fieldlayoutfields`
  ADD CONSTRAINT `vt_fk_cfstzvuvwwlrlfsmvtuxzezdpeyycydrlkzy` FOREIGN KEY (`fieldId`) REFERENCES `vt_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_qinuviifxvxjpfxqdqypicnushcbkbjrppqu` FOREIGN KEY (`layoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_qypqytuylyixxxqgilmiynokpfemschuelam` FOREIGN KEY (`tabId`) REFERENCES `vt_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_fieldlayouttabs`
--
ALTER TABLE `vt_fieldlayouttabs`
  ADD CONSTRAINT `vt_fk_wjimqzjdvplhgpcnormfcedfmugcpwaragpq` FOREIGN KEY (`layoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_fields`
--
ALTER TABLE `vt_fields`
  ADD CONSTRAINT `vt_fk_hqwvfbfqjvgcdeptsogngdueqkqfodtpzimr` FOREIGN KEY (`groupId`) REFERENCES `vt_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_globalsets`
--
ALTER TABLE `vt_globalsets`
  ADD CONSTRAINT `vt_fk_hnkburkwltqulnodbxjgjasytbapolmpacyj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vt_fk_vshjvnteypkzxrxduwjavvynqqykrjtflqjc` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_gqltokens`
--
ALTER TABLE `vt_gqltokens`
  ADD CONSTRAINT `vt_fk_ahqblohmnbvhnnyjledkefvhhglgqovhivuw` FOREIGN KEY (`schemaId`) REFERENCES `vt_gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_matrixblocks`
--
ALTER TABLE `vt_matrixblocks`
  ADD CONSTRAINT `vt_fk_kasbpikgmmpdokrlmyiwezfurnkrhfkzhcdj` FOREIGN KEY (`fieldId`) REFERENCES `vt_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_ocrfpdogyysencxbahxkposjgwlbdomfjaxa` FOREIGN KEY (`ownerId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_wpnxouridoqhowfixpuasoxmrqigrnfvfdlo` FOREIGN KEY (`typeId`) REFERENCES `vt_matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_xhqwodubiirczuwjokzfkkicryjoysjkuofe` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_matrixblocktypes`
--
ALTER TABLE `vt_matrixblocktypes`
  ADD CONSTRAINT `vt_fk_pjisndhjaujkafdgwrkusfaqresekuiiymme` FOREIGN KEY (`fieldId`) REFERENCES `vt_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_umzzvqcsphrtbjrnquympvgwsggbmjtptlrp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_matrixcontent_navlink`
--
ALTER TABLE `vt_matrixcontent_navlink`
  ADD CONSTRAINT `vt_fk_bcaeftirzpzexrxjkrlusezriydbitbwumam` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_qwvudlkpotwurygumsprhlhowcephxplpjhb` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vt_relations`
--
ALTER TABLE `vt_relations`
  ADD CONSTRAINT `vt_fk_baktzjsuehepdrnxdauhnduppsfympkqcuks` FOREIGN KEY (`sourceId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_cdhwsqsttvppzwxepbdneffpoofmuvtbtgyy` FOREIGN KEY (`targetId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_ritvjihdmoebgzgqsaariewhrqbbnebxyouw` FOREIGN KEY (`sourceSiteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vt_fk_xkgkjqnthcjsgcizoubxtlytvkmqvgrghuhw` FOREIGN KEY (`fieldId`) REFERENCES `vt_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_revisions`
--
ALTER TABLE `vt_revisions`
  ADD CONSTRAINT `vt_fk_cnkdptalfkmovdpzcztusreulxvlqecrtuqk` FOREIGN KEY (`creatorId`) REFERENCES `vt_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vt_fk_swxljmcmidooykworvkfnrcipnztiksnamjn` FOREIGN KEY (`sourceId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_sections`
--
ALTER TABLE `vt_sections`
  ADD CONSTRAINT `vt_fk_vgmytnfylyosfsmirsurmgkcjitmnhrkhntg` FOREIGN KEY (`structureId`) REFERENCES `vt_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_sections_sites`
--
ALTER TABLE `vt_sections_sites`
  ADD CONSTRAINT `vt_fk_gexpuauleezlhopjdbusdlaadioxmzmttwfl` FOREIGN KEY (`sectionId`) REFERENCES `vt_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_sohejquqsrusafkurhkzbiwykwupmmywpxlk` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vt_sessions`
--
ALTER TABLE `vt_sessions`
  ADD CONSTRAINT `vt_fk_vbasnemlqfunapirdaliqwmrouvdavradsfa` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_shunnedmessages`
--
ALTER TABLE `vt_shunnedmessages`
  ADD CONSTRAINT `vt_fk_nlqjwmabqoxrbcneyacmfhqhrmiegoqxuzzg` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_sites`
--
ALTER TABLE `vt_sites`
  ADD CONSTRAINT `vt_fk_ugugpxhcsterddkpnxoyuuqejiuninluvcem` FOREIGN KEY (`groupId`) REFERENCES `vt_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_structureelements`
--
ALTER TABLE `vt_structureelements`
  ADD CONSTRAINT `vt_fk_mdwmblapujfecheqrlydbpnscobqptobupqa` FOREIGN KEY (`structureId`) REFERENCES `vt_structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_tnyintgfefxbjvxljgeolltmvqvpuvkvlthp` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_taggroups`
--
ALTER TABLE `vt_taggroups`
  ADD CONSTRAINT `vt_fk_bdqosrcskjfukbtyjsuxqjdnqguobkgheohc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_tags`
--
ALTER TABLE `vt_tags`
  ADD CONSTRAINT `vt_fk_hkihntebrbxhmobjovidkjbrxkovehchuhrf` FOREIGN KEY (`groupId`) REFERENCES `vt_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_rhrwgzueynnxjcdqqggarwhazmvaxsambxpk` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_templatecacheelements`
--
ALTER TABLE `vt_templatecacheelements`
  ADD CONSTRAINT `vt_fk_qfemdnnsmyofhimpxcssdboekarmijmciflg` FOREIGN KEY (`elementId`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_uaopmsmtfibpdwzibrqjdrbvxhflwxmwvlfq` FOREIGN KEY (`cacheId`) REFERENCES `vt_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_templatecachequeries`
--
ALTER TABLE `vt_templatecachequeries`
  ADD CONSTRAINT `vt_fk_wzrnajnxlqiojckczjekrhiutkjtxuuhwxso` FOREIGN KEY (`cacheId`) REFERENCES `vt_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_templatecaches`
--
ALTER TABLE `vt_templatecaches`
  ADD CONSTRAINT `vt_fk_aswbxbjfvvbquwlzdatnndvkdxmqoxutqyhz` FOREIGN KEY (`siteId`) REFERENCES `vt_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vt_usergroups_users`
--
ALTER TABLE `vt_usergroups_users`
  ADD CONSTRAINT `vt_fk_cxqggdfikeukebbqrtmxrpsfvprvrxrryrjk` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_yjqipxqwrmjwnhdgrottmpupchocvctwbuva` FOREIGN KEY (`groupId`) REFERENCES `vt_usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_userpermissions_usergroups`
--
ALTER TABLE `vt_userpermissions_usergroups`
  ADD CONSTRAINT `vt_fk_grshccqxrgbqimzloltueimlxzdufexythkj` FOREIGN KEY (`permissionId`) REFERENCES `vt_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_ynkasuibwohpuxxebaoytzqgvsfswgvvpzhy` FOREIGN KEY (`groupId`) REFERENCES `vt_usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_userpermissions_users`
--
ALTER TABLE `vt_userpermissions_users`
  ADD CONSTRAINT `vt_fk_mkszjduxochvwujpjdshksanxtusmihkkqiv` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_wiluhjvhebfxwiaenrnywbfjeoibhnzwzugk` FOREIGN KEY (`permissionId`) REFERENCES `vt_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_userpreferences`
--
ALTER TABLE `vt_userpreferences`
  ADD CONSTRAINT `vt_fk_ovhvmdjatoronosbveoilwqhvxvqmugmqhuo` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_users`
--
ALTER TABLE `vt_users`
  ADD CONSTRAINT `vt_fk_hczigivbtusrbakzgmfbdmmeyakxpqlrmajn` FOREIGN KEY (`id`) REFERENCES `vt_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_rmfrybcpuduugkjnkflfjjigsylgjzupchrb` FOREIGN KEY (`photoId`) REFERENCES `vt_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_volumefolders`
--
ALTER TABLE `vt_volumefolders`
  ADD CONSTRAINT `vt_fk_uekzdxzjbzmkqxrppdewqctzopetytkdegnu` FOREIGN KEY (`parentId`) REFERENCES `vt_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vt_fk_xdhqmapiywbsqbrdmhlldcioyojorknbxtqs` FOREIGN KEY (`volumeId`) REFERENCES `vt_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vt_volumes`
--
ALTER TABLE `vt_volumes`
  ADD CONSTRAINT `vt_fk_ljrblqcngzvucqxqxprqlbwlvcsgnxmkxzoo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `vt_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vt_widgets`
--
ALTER TABLE `vt_widgets`
  ADD CONSTRAINT `vt_fk_jexbyurdadefeamawjtkfnkzkegmotksnmin` FOREIGN KEY (`userId`) REFERENCES `vt_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
