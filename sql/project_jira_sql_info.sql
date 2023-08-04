-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.32 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para project_jira
CREATE DATABASE IF NOT EXISTS `project_jira` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_jira`;

-- Copiando estrutura para tabela project_jira.aspnetroleclaims
CREATE TABLE IF NOT EXISTS `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetroleclaims: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela project_jira.aspnetroles
CREATE TABLE IF NOT EXISTS `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetroles: ~2 rows (aproximadamente)
INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
	('64ecf039-bf42-4d2d-a2b0-65e6282658da', 'Reporter', 'REPORTER', '1a3b3f8a-c790-4d1a-8832-9bb58d0ab3ad'),
	('87a76ab1-4031-47d8-8be9-ff97855a7bb4', 'Admin', 'ADMIN', '40087460-b9b5-4e01-9131-933f292fae70');

-- Copiando estrutura para tabela project_jira.aspnetuserclaims
CREATE TABLE IF NOT EXISTS `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetuserclaims: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela project_jira.aspnetuserlogins
CREATE TABLE IF NOT EXISTS `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetuserlogins: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela project_jira.aspnetuserroles
CREATE TABLE IF NOT EXISTS `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetuserroles: ~6 rows (aproximadamente)
INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
	('06adae1d-09c9-4916-a682-9ae487d997e7', '64ecf039-bf42-4d2d-a2b0-65e6282658da'),
	('398ac802-7cce-4e9a-bfdf-e30084e508a1', '64ecf039-bf42-4d2d-a2b0-65e6282658da'),
	('0ccc582e-c5ca-4fac-ade0-139acaade2e4', '87a76ab1-4031-47d8-8be9-ff97855a7bb4'),
	('3012b813-99be-4063-8a73-ba624c7d3395', '87a76ab1-4031-47d8-8be9-ff97855a7bb4'),
	('5845af75-fc4e-4794-99e4-6e34dd30d9d0', '87a76ab1-4031-47d8-8be9-ff97855a7bb4'),
	('f7ad1a46-2a68-42f9-914e-2b8ff29db57a', '87a76ab1-4031-47d8-8be9-ff97855a7bb4');

-- Copiando estrutura para tabela project_jira.aspnetusers
CREATE TABLE IF NOT EXISTS `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetusers: ~6 rows (aproximadamente)
INSERT INTO `aspnetusers` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
	('06adae1d-09c9-4916-a682-9ae487d997e7', 'rim5ca', 'RIM5CA', 'michael@br.bosch.com', 'MICHAEL@BR.BOSCH.COM', 1, 'AQAAAAEAACcQAAAAEP7+Y6nPQvx7301jvM9b0nkVo22oLtcDgv7kjMHE0mLuUc8fPLKP94c5BNqLgtH6tg==', 'Y6ZTZU5VCT4IMYBC4L75WZU3RDYQLJRW', 'cfd6691d-1ffa-4c25-9803-f9bc3361ebb5', NULL, 0, 0, NULL, 1, 0),
	('0ccc582e-c5ca-4fac-ade0-139acaade2e4', 'WY81CA', 'WY81CA', 'willian.sacchi@br.bosch.com', 'WILLIAN.SACCHI@BR.BOSCH.COM', 1, 'AQAAAAEAACcQAAAAECwusa6qXaKYignqMp7rQZtJWbpADfd15TCf2SsoToV+LlWyzGPYCnhv4oSbwYf1HQ==', 'CHXVRTDTNDSRPF3XLY7FFC4ZTWOO4Z26', 'ad4b6e94-9e14-42f5-8c54-53fdf9283c89', NULL, 0, 0, NULL, 1, 0),
	('3012b813-99be-4063-8a73-ba624c7d3395', 'abc1de', 'ABC1DE', 'testeadmin@br.bosch.com', 'TESTEADMIN@BR.BOSCH.COM', 1, 'AQAAAAEAACcQAAAAEBZ5GGH1PNHlQXKjTlvu8z9hHDapUhHzhny9D9pj5LrbDPIkXuE+IlBCmBSRcWCP8A==', '6U6HXBT6JADZQKI2EAMYVV33R3HZFSL2', 'cadd78b8-8ed4-4a95-8511-2c372c779ff2', NULL, 0, 0, NULL, 1, 0),
	('398ac802-7cce-4e9a-bfdf-e30084e508a1', 'mta6ca', 'MTA6CA', 'thiago@br.bosch.br', 'THIAGO@BR.BOSCH.BR', 1, 'AQAAAAEAACcQAAAAEOYaVC5Y1uCgUaF+7r/ejmM5LMsmXxZD4D20LMlhRX19il9STPOyqziYC/64BEYbwg==', 'Z2A3R5FX2ICW2VOPPC7ADVB3UWVAUSZB', '2584a2e7-d612-4009-a108-8a1bae613e22', NULL, 0, 0, NULL, 1, 0),
	('5845af75-fc4e-4794-99e4-6e34dd30d9d0', 'ang7ca', 'ANG7CA', 'gustavo.anacleto@br.bosch.com', 'GUSTAVO.ANACLETO@BR.BOSCH.COM', 1, 'AQAAAAEAACcQAAAAEBd40gZDpfm8L0EeGo2x5vNuSrcC7MBE462Z7R01/kusG5TrTBJ9UKTDvt9r8WvguQ==', 'Q5NRTF2PPOVNVLBHFCGVPTBUEK3DZZAX', '75011dbc-7e7c-48d3-a622-cbe981f1bcc5', NULL, 0, 0, NULL, 1, 0),
	('f7ad1a46-2a68-42f9-914e-2b8ff29db57a', 'asa1ca', 'ASA1CA', 'amanda.sa@br.bosch.com', 'AMANDA.SA@BR.BOSCH.COM', 1, 'AQAAAAEAACcQAAAAEF4CIoHHP7J3UoBBnYpZF2yhjeW/1DnQwTBdjuMao1x35YeWD2j95tFwJMIy2WWBvw==', '4WFIRKBEI6M37MTQH6BLJU5HT6HK6QDL', 'a6f30c81-bc98-4ef4-b58a-31ddb824c476', NULL, 0, 0, NULL, 1, 0);

-- Copiando estrutura para tabela project_jira.aspnetusertokens
CREATE TABLE IF NOT EXISTS `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.aspnetusertokens: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela project_jira.costcenters
CREATE TABLE IF NOT EXISTS `costcenters` (
  `CostCenterId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CostCenterId`),
  UNIQUE KEY `IX_CostCenters_Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.costcenters: ~21 rows (aproximadamente)
INSERT INTO `costcenters` (`CostCenterId`, `Code`) VALUES
	('be562710-1b4e-43b1-9222-216e0087c478', '37C920'),
	('c3de8cba-5b17-4562-ac38-dd37a8b552a1', '660920'),
	('ef10bdb5-3f00-440a-983b-9c844fe58a73', '908057'),
	('65f8b40d-7b49-4f36-bb39-58922ebd481a', '908160'),
	('d6327d30-39ac-4c43-b794-ad5fd30aa281', '908215'),
	('22dcd4b9-2768-46c5-88d4-96c516d7a104', '908220'),
	('33be1b60-b9d1-4d6d-9153-bb6b9c36d049', '908240'),
	('1a5363b0-21fe-4548-8507-82853078ad10', '908242'),
	('ace0eb9e-6e9b-457a-b9a1-4a1034e9636e', '908245'),
	('75178acb-d414-465c-8d14-9cbfed947624', '908261'),
	('ccb38996-f399-477c-be62-63df2744defe', '908275'),
	('198c2719-53c0-495f-a49a-17278f41c24d', '908277'),
	('bc1f5388-3426-40de-a3ca-36e68ef4217c', '908278'),
	('a27e7a3b-a48d-468b-84ab-d13cb45a71eb', '908281'),
	('88993e68-202e-4a90-b6c8-75b767fa43ac', '908537'),
	('9c8fe52b-e26e-4c63-addc-51c6f58ffdcf', '908539'),
	('10e1a171-b7e2-4c40-824e-780410487f7f', '908557'),
	('27050c15-3b22-4591-b035-b304f2075311', '908782'),
	('ecf51298-02a4-4b74-87b5-0da5bdabbc63', '908871'),
	('53075575-660a-4482-81de-cba294f2e3e3', '909222'),
	('e6d8383e-2beb-4c17-a285-2bd7420ed6b7', '909700');

-- Copiando estrutura para tabela project_jira.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `CountryId` bigint NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.countries: ~0 rows (aproximadamente)
INSERT INTO `countries` (`CountryId`, `Name`) VALUES
	(1, 'BR');

-- Copiando estrutura para tabela project_jira.currentorganizations
CREATE TABLE IF NOT EXISTS `currentorganizations` (
  `CurrentOrganizationId` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CurrentOrganizationId`),
  UNIQUE KEY `IX_CurrentOrganizations_Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.currentorganizations: ~2 rows (aproximadamente)
INSERT INTO `currentorganizations` (`CurrentOrganizationId`, `Name`) VALUES
	(2, 'GS/HRS-LA'),
	(1, 'GS/OR-LA'),
	(3, 'GS/PUI-LA');

-- Copiando estrutura para tabela project_jira.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `DepartmentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CostCenterId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CurrentOrganizationId` bigint NOT NULL DEFAULT '0',
  `ProcessId` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`DepartmentId`),
  KEY `IX_Departments_CostCenterId` (`CostCenterId`),
  KEY `IX_Departments_CurrentOrganizationId` (`CurrentOrganizationId`),
  KEY `IX_Departments_ProcessId` (`ProcessId`),
  CONSTRAINT `FK_Departments_CostCenters_CostCenterId` FOREIGN KEY (`CostCenterId`) REFERENCES `costcenters` (`CostCenterId`),
  CONSTRAINT `FK_Departments_CurrentOrganizations_CurrentOrganizationId` FOREIGN KEY (`CurrentOrganizationId`) REFERENCES `currentorganizations` (`CurrentOrganizationId`) ON DELETE CASCADE,
  CONSTRAINT `FK_Departments_Processes_ProcessId` FOREIGN KEY (`ProcessId`) REFERENCES `processes` (`ProcessId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.departments: ~32 rows (aproximadamente)
INSERT INTO `departments` (`DepartmentId`, `Name`, `CostCenterId`, `CurrentOrganizationId`, `ProcessId`) VALUES
	('000bb0d4-3f7c-4bf7-92e8-0b8b814a8e2b', 'GS/OSD43-LA1', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('019ceba7-7250-446d-89fa-9dc423c251b9', 'GS/OBR22-LA1', '1a5363b0-21fe-4548-8507-82853078ad10', 1, 4),
	('04d7f272-fe2c-4771-80de-c5d3db77f6bd', 'GS/OSP13', '75178acb-d414-465c-8d14-9cbfed947624', 1, 1),
	('09cbd9d8-18e7-49e2-b70a-0dfee9e0802f', 'GS/OBR21-LA1', 'bc1f5388-3426-40de-a3ca-36e68ef4217c', 1, 4),
	('0c382942-0273-45b0-a4ff-08858a4d2508', 'GS/OSD41-LA1', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('1084217d-59da-4422-a228-5f46e47cf69e', 'GS/OIS-LA', '1a5363b0-21fe-4548-8507-82853078ad10', 1, 7),
	('19236772-8362-4c10-85d6-b344122e6b78', 'GS/OBR1-LA3', 'e6d8383e-2beb-4c17-a285-2bd7420ed6b7', 1, 4),
	('1abfcab1-b7a7-4638-b04d-419faf40068b', 'GS/HRS2-LA', 'ef10bdb5-3f00-440a-983b-9c844fe58a73', 2, 2),
	('1c03fa70-284b-4782-85c7-b0ca103ad397', 'GS/OSD-LA', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('227950fc-0747-4859-a247-241cc8c78180', 'GS/HRS9-LA', 'ecf51298-02a4-4b74-87b5-0da5bdabbc63', 2, 2),
	('331365f2-aa57-474c-9abd-24f9d479e76c', 'GS/OBC-LA2', 'ccb38996-f399-477c-be62-63df2744defe', 1, 5),
	('35330731-dee4-408b-b139-f79f9e218fe6', 'GS/OBR2-LA3', '53075575-660a-4482-81de-cba294f2e3e3', 1, 4),
	('48b3ae32-84a7-443c-bced-cd0c9be53356', 'GS/OSD4-LA', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('4da92bc3-3d93-4396-83dd-e4c1e6d03d17', 'GS/HRS-LA', 'ef10bdb5-3f00-440a-983b-9c844fe58a73', 2, 2),
	('5143d411-9a3f-4033-b03c-c4068be9108a', 'GS/HRS3-LA', 'ef10bdb5-3f00-440a-983b-9c844fe58a73', 2, 2),
	('5d51fd7c-3086-482c-a16e-c2205bf457e5', 'GS/OSD31-LA1', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('614a03fe-0e30-4ef2-8bef-c01201c82020', 'GS/PUI11-LA1', '9c8fe52b-e26e-4c63-addc-51c6f58ffdcf', 3, 6),
	('6e24b85e-02ea-4498-9784-99dd7307029b', 'GS/OBR13-LA1', 'd6327d30-39ac-4c43-b794-ad5fd30aa281', 1, 4),
	('75ef73b1-87c0-4850-b067-025fce55d018', 'GS/OBR-LA31', 'c3de8cba-5b17-4562-ac38-dd37a8b552a1', 1, 4),
	('765e623a-3b19-4fc0-91cf-6ac2d795e528', 'GS/OBC-LA3', 'ccb38996-f399-477c-be62-63df2744defe', 1, 5),
	('93563170-b713-47b7-82de-bdabf065b929', 'GS/PUI6-SDM', '88993e68-202e-4a90-b6c8-75b767fa43ac', 3, 6),
	('aece2ce4-aa68-4d56-8cfd-88c9ad2b26b1', 'GS/OSD42-LA1', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('b1259e96-d0c8-45e0-b9fd-e8ed82d5659d', 'GS/OSD3-LA', '27050c15-3b22-4591-b035-b304f2075311', 1, 3),
	('c5bb52cc-3833-4c98-b185-3c7aff7d21c1', 'GS/PUI1-LA', '9c8fe52b-e26e-4c63-addc-51c6f58ffdcf', 3, 6),
	('c932bab8-4652-47ff-a7bd-c1b73410b8c6', 'GS/OBR12-LA1', '10e1a171-b7e2-4c40-824e-780410487f7f', 1, 4),
	('c9bee315-31bb-4e12-be21-2ceb353544e1', 'GS/OBC-LA1', 'ccb38996-f399-477c-be62-63df2744defe', 1, 5),
	('cd6c093b-1082-42f2-8e1b-e08b952cc908', 'GS/HRX-LA', '65f8b40d-7b49-4f36-bb39-58922ebd481a', 1, 7),
	('d577b8a1-a841-42b6-acfc-011c6b5a7305', 'GS/OBR11-LA', '22dcd4b9-2768-46c5-88d4-96c516d7a104', 1, 4),
	('e732f4a3-fd8c-4b46-99e0-6b61de3e74f0', 'GS/OSP21-LA', 'a27e7a3b-a48d-468b-84ab-d13cb45a71eb', 1, 1),
	('e8e95978-d42a-4271-bc94-774d4391178a', 'GS/TET-LA', 'ace0eb9e-6e9b-457a-b9a1-4a1034e9636e', 1, 7),
	('eb73024b-31c3-48e1-b6ae-7e07aefb0446', 'GS/OBR1-LA2', 'be562710-1b4e-43b1-9222-216e0087c478', 1, 4),
	('f54f4ffd-750a-46be-8fab-1b87ed8c0d18', 'GS/OSP22-LA', '198c2719-53c0-495f-a49a-17278f41c24d', 1, 1);

-- Copiando estrutura para tabela project_jira.ideasources
CREATE TABLE IF NOT EXISTS `ideasources` (
  `IdeaSourceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `InternallySolvable` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdeaSourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.ideasources: ~7 rows (aproximadamente)
INSERT INTO `ideasources` (`IdeaSourceId`, `Name`, `InternallySolvable`) VALUES
	('35a0a595-4a69-4c81-a738-092d8ad5cee0', 'Process Change / Adjustment', 1),
	('5e63f9d2-7cc2-485b-aba5-77fd12ca5d19', 'IT Roadmap', 0),
	('7065320d-57c2-4dab-8c28-a386ca5a9574', 'Global Solution', 0),
	('81edd4e8-29d7-41e0-8222-78711837db59', 'DTA (ETS)', 0),
	('9565c9a2-eaa9-4dc1-b8d9-058ecaf94c29', 'Sprint Cycle', 0),
	('d45eb7f3-5c44-48b4-b6c3-28a2afe3f321', 'Internal automation', 0),
	('d925a42f-9724-45ac-8b1e-bac9ca2c0d5f', 'TET-LA', 0);

-- Copiando estrutura para tabela project_jira.improvements
CREATE TABLE IF NOT EXISTS `improvements` (
  `ImprovementId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Assignee` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DepartmentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MajorBenefitsId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EstimatedHours` int DEFAULT NULL,
  `EstimatedSaving` double DEFAULT NULL,
  `MonetaryBenefit` double DEFAULT NULL,
  `DueDate` datetime(6) NOT NULL,
  `AffectEntities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SourceTypeId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdeaSourceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Components` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Region` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CipPex` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Currency` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Priority` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StatusImprovement` tinyint(1) NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ImprovementId`),
  KEY `IX_Improvements_DepartmentId` (`DepartmentId`),
  KEY `IX_Improvements_IdeaSourceId` (`IdeaSourceId`),
  KEY `IX_Improvements_MajorBenefitsId` (`MajorBenefitsId`),
  KEY `IX_Improvements_SourceTypeId` (`SourceTypeId`),
  KEY `IX_Improvements_UserId` (`UserId`),
  CONSTRAINT `FK_Improvements_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `FK_Improvements_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`DepartmentId`),
  CONSTRAINT `FK_Improvements_IdeaSources_IdeaSourceId` FOREIGN KEY (`IdeaSourceId`) REFERENCES `ideasources` (`IdeaSourceId`),
  CONSTRAINT `FK_Improvements_MajorBenefits_MajorBenefitsId` FOREIGN KEY (`MajorBenefitsId`) REFERENCES `majorbenefits` (`MajorBenefitsId`),
  CONSTRAINT `FK_Improvements_SourceTypes_SourceTypeId` FOREIGN KEY (`SourceTypeId`) REFERENCES `sourcetypes` (`SourceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.improvements: ~2 rows (aproximadamente)
INSERT INTO `improvements` (`ImprovementId`, `Assignee`, `DepartmentId`, `Summary`, `Description`, `MajorBenefitsId`, `EstimatedHours`, `EstimatedSaving`, `MonetaryBenefit`, `DueDate`, `AffectEntities`, `SourceTypeId`, `IdeaSourceId`, `Components`, `Region`, `CipPex`, `Currency`, `Priority`, `StatusImprovement`, `UserId`) VALUES
	('1361339b-1539-4fcc-a7ef-18f92de6a3e5', 'ang7ca', '227950fc-0747-4859-a247-241cc8c78180', 'teste', 'teste', '151b5e71-65d0-4e68-a6e9-b4207c4113b2', NULL, NULL, 1300, '2023-08-03 03:00:00.000000', 'teste', '1066b1d5-d099-4a0d-8c30-1827280acf68', '7065320d-57c2-4dab-8c28-a386ca5a9574', 'teste', 'LA', 'asa1ca', 'BRL', 'Minor', 1, '398ac802-7cce-4e9a-bfdf-e30084e508a1'),
	('5a12de6f-216c-4e40-ba55-c8cf9f4fc2c8', 'rim5ca', '4da92bc3-3d93-4396-83dd-e4c1e6d03d17', 'teste', 'teste', 'bc4d78f1-63ca-43d3-8eea-57ed3cb5d020', NULL, NULL, NULL, '2023-08-03 03:00:00.000000', 'RBLA', '48b25d99-b8f2-4278-bfc0-b9a56a90c06c', '81edd4e8-29d7-41e0-8222-78711837db59', 'CIP POINT', 'LA', 'asa1ca', 'BRL', 'Medium', 1, '5845af75-fc4e-4794-99e4-6e34dd30d9d0');

-- Copiando estrutura para tabela project_jira.infofinantials
CREATE TABLE IF NOT EXISTS `infofinantials` (
  `InfoFinantialId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DepartmentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CostCenterId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CCtrSO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AvaragePrice` double NOT NULL,
  `PriceHour` double NOT NULL,
  `SMT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CountryId` bigint DEFAULT NULL,
  `OrgLevel` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `InitialValidity` datetime(6) NOT NULL,
  `FinalValidity` datetime(6) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`InfoFinantialId`),
  KEY `IX_InfoFinantials_CostCenterId` (`CostCenterId`),
  KEY `IX_InfoFinantials_DepartmentId` (`DepartmentId`),
  KEY `IX_InfoFinantials_CountryId` (`CountryId`),
  CONSTRAINT `FK_InfoFinantials_CostCenters_CostCenterId` FOREIGN KEY (`CostCenterId`) REFERENCES `costcenters` (`CostCenterId`),
  CONSTRAINT `FK_InfoFinantials_Countries_CountryId` FOREIGN KEY (`CountryId`) REFERENCES `countries` (`CountryId`),
  CONSTRAINT `FK_InfoFinantials_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`DepartmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.infofinantials: ~0 rows (aproximadamente)
INSERT INTO `infofinantials` (`InfoFinantialId`, `DepartmentId`, `CostCenterId`, `CCtrSO`, `AvaragePrice`, `PriceHour`, `SMT`, `CountryId`, `OrgLevel`, `InitialValidity`, `FinalValidity`, `Status`) VALUES
	('dfb7f9e2-c2ef-4cb0-99f1-761645069e81', '4da92bc3-3d93-4396-83dd-e4c1e6d03d17', 'ef10bdb5-3f00-440a-983b-9c844fe58a73', '908858', 18596.11968, 105.6597709, 'Core Budget', 1, 'GS/P', '2023-07-06 16:03:30.000000', '2023-08-06 16:03:32.000000', 1);

-- Copiando estrutura para tabela project_jira.majorbenefits
CREATE TABLE IF NOT EXISTS `majorbenefits` (
  `MajorBenefitsId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`MajorBenefitsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.majorbenefits: ~5 rows (aproximadamente)
INSERT INTO `majorbenefits` (`MajorBenefitsId`, `Name`) VALUES
	('11527ad8-5fed-4e6e-befe-f7e2be9137be', 'Time'),
	('151b5e71-65d0-4e68-a6e9-b4207c4113b2', 'Cost reduction'),
	('18f6314c-095f-481c-aa76-25a28cb3b2d3', 'Standardization/Harmonization'),
	('32604af2-1403-4610-8a18-f7c4c2ad295b', 'Legal requirements'),
	('bc4d78f1-63ca-43d3-8eea-57ed3cb5d020', 'Quality');

-- Copiando estrutura para tabela project_jira.processes
CREATE TABLE IF NOT EXISTS `processes` (
  `ProcessId` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ProcessId`),
  UNIQUE KEY `IX_Processes_Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.processes: ~6 rows (aproximadamente)
INSERT INTO `processes` (`ProcessId`, `Name`) VALUES
	(5, 'B2C - Bill to Cash'),
	(4, 'B2R - Book to Report'),
	(7, 'Enabling and support'),
	(2, 'H2R - Hire to Retire, incl. Hr Services'),
	(1, 'P2P - Procure to Pay'),
	(6, 'S2C - Source to Contract, incl. Purchasing expert services'),
	(3, 'S2D - Source to delivery');

-- Copiando estrutura para tabela project_jira.sourcetypes
CREATE TABLE IF NOT EXISTS `sourcetypes` (
  `SourceTypeId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`SourceTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.sourcetypes: ~4 rows (aproximadamente)
INSERT INTO `sourcetypes` (`SourceTypeId`, `Name`) VALUES
	('1066b1d5-d099-4a0d-8c30-1827280acf68', 'Workshop'),
	('31cec0cc-61f3-4f13-bc9e-552183ae1a89', 'Point CIP'),
	('48b25d99-b8f2-4278-bfc0-b9a56a90c06c', 'Customer Satisfaction'),
	('85688a45-4b7c-40ca-9f09-6ee6cf072877', 'Global Solution');

-- Copiando estrutura para tabela project_jira.__efmigrationshistory
CREATE TABLE IF NOT EXISTS `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela project_jira.__efmigrationshistory: ~4 rows (aproximadamente)
INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
	('20230728182424_FirstM', '7.0.5'),
	('20230731112815_CurrentOrganizationAndProcessM', '7.0.5'),
	('20230731114847_CountryChangeIdM', '7.0.5'),
	('20230801153655_ImproveUserM', '7.0.5');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
