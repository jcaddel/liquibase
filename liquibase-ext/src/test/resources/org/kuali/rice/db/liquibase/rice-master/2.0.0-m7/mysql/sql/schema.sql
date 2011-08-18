-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml
-- Ran at: 8/18/11 2:32 PM
-- Against: LIQUIBASE@localhost@jdbc:mysql://localhost/LIQUIBASE
-- Liquibase version: 2.1.0-SNAPSHOT
-- *********************************************************************

-- Lock Database
-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-1::unit-test::(Checksum: 3:d48fdf4d5995d53d3bc84ee220e734ab)
CREATE TABLE `acct_dd_attr_doc` (`DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(14,0), `ACCT_NUM` DECIMAL(14,0) NOT NULL, `ACCT_OWNR` VARCHAR(50) NOT NULL, `ACCT_BAL` DECIMAL(16,2) NOT NULL, `ACCT_OPN_DAT` DATETIME NOT NULL, `ACCT_STAT` VARCHAR(30) NOT NULL, `ACCT_UPDATE_DT_TM` DATETIME, `ACCT_AWAKE` VARCHAR(1), CONSTRAINT `PK_ACCT_DD_ATTR_DOC` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-1', '2.1.0-SNP', '3:d48fdf4d5995d53d3bc84ee220e734ab', 770)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-2::unit-test::(Checksum: 3:84e6d7971d53bb66a712307705ca0aab)
CREATE TABLE `kr_kim_test_bo` (`PK` VARCHAR(40), `PRNCPL_ID` VARCHAR(40))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-2', '2.1.0-SNP', '3:84e6d7971d53bb66a712307705ca0aab', 771)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-3::unit-test::(Checksum: 3:d76606628e5f55258e1321c850c4e2a8)
CREATE TABLE `krcr_cmpnt_t` (`NMSPC_CD` VARCHAR(20) DEFAULT '' NOT NULL, `CMPNT_CD` VARCHAR(100) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(255), `ACTV_IND` CHAR(1) DEFAULT 'Y' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-3', '2.1.0-SNP', '3:d76606628e5f55258e1321c850c4e2a8', 772)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-4::unit-test::(Checksum: 3:64ec52aee96d7ee7e6a745826aff1fd1)
CREATE TABLE `krcr_nmspc_t` (`NMSPC_CD` VARCHAR(20) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` CHAR(1) DEFAULT 'Y' NOT NULL, `APPL_ID` VARCHAR(20), CONSTRAINT `PK_KRCR_NMSPC_T` PRIMARY KEY (`NMSPC_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-4', '2.1.0-SNP', '3:64ec52aee96d7ee7e6a745826aff1fd1', 773)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-5::unit-test::(Checksum: 3:7d30dcc830ce3e0aaa9de55867eec4e7)
CREATE TABLE `krcr_parm_t` (`NMSPC_CD` VARCHAR(20) DEFAULT '' NOT NULL, `CMPNT_CD` VARCHAR(100) DEFAULT '' NOT NULL, `PARM_NM` VARCHAR(255) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PARM_TYP_CD` VARCHAR(5) NOT NULL, `VAL` VARCHAR(4000), `PARM_DESC_TXT` VARCHAR(4000), `EVAL_OPRTR_CD` VARCHAR(1), `APPL_ID` VARCHAR(20) DEFAULT 'KUALI' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-5', '2.1.0-SNP', '3:7d30dcc830ce3e0aaa9de55867eec4e7', 774)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-6::unit-test::(Checksum: 3:63457c69951527fea30454c377ee4e4b)
CREATE TABLE `krcr_parm_typ_t` (`PARM_TYP_CD` VARCHAR(5) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` CHAR(1) DEFAULT 'Y' NOT NULL, CONSTRAINT `PK_KRCR_PARM_TYP_T` PRIMARY KEY (`PARM_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-6', '2.1.0-SNP', '3:63457c69951527fea30454c377ee4e4b', 775)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-7::unit-test::(Checksum: 3:e4012f45d86ce8411e6ddff4be798124)
CREATE TABLE `kren_chnl_prodcr_t` (`CHNL_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `PRODCR_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-7', '2.1.0-SNP', '3:e4012f45d86ce8411e6ddff4be798124', 776)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-8::unit-test::(Checksum: 3:cfedb760cad1157419f60420f81b7854)
CREATE TABLE `kren_chnl_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_CHNL_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-8', '2.1.0-SNP', '3:cfedb760cad1157419f60420f81b7854', 777)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-9::unit-test::(Checksum: 3:a13898c33d6171c577426234d1d815dc)
CREATE TABLE `kren_chnl_subscrp_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_CHNL_SUBSCRP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-9', '2.1.0-SNP', '3:a13898c33d6171c577426234d1d815dc', 778)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-10::unit-test::(Checksum: 3:6549a2e3ff86392c5c02785f885166f2)
CREATE TABLE `kren_chnl_subscrp_t` (`CHNL_SUBSCRP_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `CHNL_ID` DECIMAL(8,0) NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0), CONSTRAINT `PK_KREN_CHNL_SUBSCRP_T` PRIMARY KEY (`CHNL_SUBSCRP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-10', '2.1.0-SNP', '3:6549a2e3ff86392c5c02785f885166f2', 779)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-11::unit-test::(Checksum: 3:ecc0d7c92ffd53c7a0724122ba40378c)
CREATE TABLE `kren_chnl_t` (`CHNL_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NM` VARCHAR(200) NOT NULL, `DESC_TXT` VARCHAR(4000) NOT NULL, `SUBSCRB_IND` CHAR(1) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_CHNL_T` PRIMARY KEY (`CHNL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-11', '2.1.0-SNP', '3:ecc0d7c92ffd53c7a0724122ba40378c', 780)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-12::unit-test::(Checksum: 3:7c5920221804bf6fa76dcaa37a488281)
CREATE TABLE `kren_cntnt_typ_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_CNTNT_TYP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-12', '2.1.0-SNP', '3:7c5920221804bf6fa76dcaa37a488281', 781)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-13::unit-test::(Checksum: 3:744348462e53f827565b24c88149fdcb)
CREATE TABLE `kren_cntnt_typ_t` (`CNTNT_TYP_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NM` VARCHAR(200) NOT NULL, `CUR_IND` CHAR(1) DEFAULT 'T' NOT NULL, `CNTNT_TYP_VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `DESC_TXT` VARCHAR(1000) NOT NULL, `NMSPC_CD` VARCHAR(1000) NOT NULL, `XSD` LONGTEXT NOT NULL, `XSL` LONGTEXT NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_CNTNT_TYP_T` PRIMARY KEY (`CNTNT_TYP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-13', '2.1.0-SNP', '3:744348462e53f827565b24c88149fdcb', 782)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-14::unit-test::(Checksum: 3:18611c92cd9ecea82bfaa019f041fa0d)
CREATE TABLE `kren_msg_deliv_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_MSG_DELIV_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-14', '2.1.0-SNP', '3:18611c92cd9ecea82bfaa019f041fa0d', 783)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-15::unit-test::(Checksum: 3:0eda28237e1823132c6aff665c4a1c86)
CREATE TABLE `kren_msg_deliv_t` (`MSG_DELIV_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `MSG_ID` DECIMAL(8,0) NOT NULL, `TYP_NM` VARCHAR(200) NOT NULL, `SYS_ID` VARCHAR(300), `STAT_CD` VARCHAR(15) NOT NULL, `PROC_CNT` DECIMAL(4,0) DEFAULT 0 NOT NULL, `LOCKD_DTTM` DATETIME, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KREN_MSG_DELIV_T` PRIMARY KEY (`MSG_DELIV_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-15', '2.1.0-SNP', '3:0eda28237e1823132c6aff665c4a1c86', 784)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-16::unit-test::(Checksum: 3:51e0070435fc18cfd40d08f47c768699)
CREATE TABLE `kren_msg_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_MSG_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-16', '2.1.0-SNP', '3:51e0070435fc18cfd40d08f47c768699', 785)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-17::unit-test::(Checksum: 3:eb52f9fd0b84ef192c25894af0444b65)
CREATE TABLE `kren_msg_t` (`MSG_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `ORGN_ID` VARCHAR(128), `DELIV_TYP` VARCHAR(500) NOT NULL, `CRTE_DTTM` DATETIME NOT NULL, `TTL` VARCHAR(255), `CHNL` VARCHAR(300) NOT NULL, `PRODCR` VARCHAR(300), `CNTNT` LONGTEXT NOT NULL, `CNTNT_TYP` VARCHAR(128), `URL` VARCHAR(512), `RECIP_ID` VARCHAR(300) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KREN_MSG_T` PRIMARY KEY (`MSG_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-17', '2.1.0-SNP', '3:eb52f9fd0b84ef192c25894af0444b65', 786)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-18::unit-test::(Checksum: 3:e1f80879584dbbc75c7c68795a0c9849)
CREATE TABLE `kren_ntfctn_msg_deliv_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_NTFCTN_MSG_DELIV_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-18', '2.1.0-SNP', '3:e1f80879584dbbc75c7c68795a0c9849', 787)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-19::unit-test::(Checksum: 3:dffe370ae13d46168fbfcbfdd3cba6e8)
CREATE TABLE `kren_ntfctn_msg_deliv_t` (`NTFCTN_MSG_DELIV_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NTFCTN_ID` DECIMAL(8,0) NOT NULL, `RECIP_ID` VARCHAR(40) NOT NULL, `STAT_CD` VARCHAR(15) NOT NULL, `SYS_ID` VARCHAR(300), `LOCKD_DTTM` DATETIME, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_NTFCTN_MSG_DELIV_T` PRIMARY KEY (`NTFCTN_MSG_DELIV_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-19', '2.1.0-SNP', '3:dffe370ae13d46168fbfcbfdd3cba6e8', 788)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-20::unit-test::(Checksum: 3:fb68ade9d46bb16c78ede9ce1ac14d46)
CREATE TABLE `kren_ntfctn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_NTFCTN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-20', '2.1.0-SNP', '3:fb68ade9d46bb16c78ede9ce1ac14d46', 789)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-21::unit-test::(Checksum: 3:0d0542dd90f3e9d64b4a4a7136a2c55a)
CREATE TABLE `kren_ntfctn_t` (`NTFCTN_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `DELIV_TYP` VARCHAR(3) NOT NULL, `CRTE_DTTM` DATETIME NOT NULL, `SND_DTTM` DATETIME, `AUTO_RMV_DTTM` DATETIME, `PRIO_ID` DECIMAL(8,0) NOT NULL, `TTL` VARCHAR(255), `CNTNT` LONGTEXT NOT NULL, `CNTNT_TYP_ID` DECIMAL(8,0) NOT NULL, `CHNL_ID` DECIMAL(8,0) NOT NULL, `PRODCR_ID` DECIMAL(8,0) NOT NULL, `PROCESSING_FLAG` VARCHAR(15) NOT NULL, `LOCKD_DTTM` DATETIME, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_NTFCTN_T` PRIMARY KEY (`NTFCTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-21', '2.1.0-SNP', '3:0d0542dd90f3e9d64b4a4a7136a2c55a', 790)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-22::unit-test::(Checksum: 3:c8de048b7a57aa3cbe43100dc15d1037)
CREATE TABLE `kren_prio_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_PRIO_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-22', '2.1.0-SNP', '3:c8de048b7a57aa3cbe43100dc15d1037', 791)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-23::unit-test::(Checksum: 3:b9f6d28088bc7a4f17158860c0c95fa9)
CREATE TABLE `kren_prio_t` (`PRIO_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NM` VARCHAR(40) NOT NULL, `DESC_TXT` VARCHAR(500) NOT NULL, `PRIO_ORD` DECIMAL(4,0) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_PRIO_T` PRIMARY KEY (`PRIO_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-23', '2.1.0-SNP', '3:b9f6d28088bc7a4f17158860c0c95fa9', 792)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-24::unit-test::(Checksum: 3:0904ec8de86fe512a2c59b3473faf150)
CREATE TABLE `kren_prodcr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_PRODCR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-24', '2.1.0-SNP', '3:0904ec8de86fe512a2c59b3473faf150', 793)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-25::unit-test::(Checksum: 3:e1d9725c2101888f230cef0c788925ad)
CREATE TABLE `kren_prodcr_t` (`PRODCR_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NM` VARCHAR(200) NOT NULL, `DESC_TXT` VARCHAR(1000) NOT NULL, `CNTCT_INFO` VARCHAR(1000) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_PRODCR_T` PRIMARY KEY (`PRODCR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-25', '2.1.0-SNP', '3:e1d9725c2101888f230cef0c788925ad', 794)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-26::unit-test::(Checksum: 3:1a7b31ecd55656170a0b195bc34bd138)
CREATE TABLE `kren_recip_deliv_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_RECIP_DELIV_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-26', '2.1.0-SNP', '3:1a7b31ecd55656170a0b195bc34bd138', 795)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-27::unit-test::(Checksum: 3:2c34548b14440f39610a2f4a6be116a4)
CREATE TABLE `kren_recip_deliv_t` (`RECIP_DELIV_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `RECIP_ID` VARCHAR(40) NOT NULL, `CHNL` VARCHAR(300) NOT NULL, `NM` VARCHAR(200) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KREN_RECIP_DELIV_T` PRIMARY KEY (`RECIP_DELIV_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-27', '2.1.0-SNP', '3:2c34548b14440f39610a2f4a6be116a4', 796)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-28::unit-test::(Checksum: 3:837bdd5d2fd5d5f4f72f8fde905e4934)
CREATE TABLE `kren_recip_list_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_RECIP_LIST_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-28', '2.1.0-SNP', '3:837bdd5d2fd5d5f4f72f8fde905e4934', 797)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-29::unit-test::(Checksum: 3:6bf263d60a09210c962d7adce3f6989c)
CREATE TABLE `kren_recip_list_t` (`RECIP_LIST_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `CHNL_ID` DECIMAL(8,0) NOT NULL, `RECIP_TYP_CD` VARCHAR(10) NOT NULL, `RECIP_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0), CONSTRAINT `PK_KREN_RECIP_LIST_T` PRIMARY KEY (`RECIP_LIST_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-29', '2.1.0-SNP', '3:6bf263d60a09210c962d7adce3f6989c', 798)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-30::unit-test::(Checksum: 3:b55db03628f4651b80f6b2ded6235c52)
CREATE TABLE `kren_recip_pref_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_RECIP_PREF_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-30', '2.1.0-SNP', '3:b55db03628f4651b80f6b2ded6235c52', 799)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-31::unit-test::(Checksum: 3:15b6827b6e900751615d44ad15ee974d)
CREATE TABLE `kren_recip_prefs_t` (`RECIP_PREFS_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `RECIP_ID` VARCHAR(40) NOT NULL, `PROP` VARCHAR(200) NOT NULL, `VAL` VARCHAR(1000) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KREN_RECIP_PREFS_T` PRIMARY KEY (`RECIP_PREFS_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-31', '2.1.0-SNP', '3:15b6827b6e900751615d44ad15ee974d', 800)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-32::unit-test::(Checksum: 3:116a9c20749130fa6e37b89e845c21f8)
CREATE TABLE `kren_recip_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_RECIP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-32', '2.1.0-SNP', '3:116a9c20749130fa6e37b89e845c21f8', 801)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-33::unit-test::(Checksum: 3:f9277893d880b97f57ae33bb31ad152e)
CREATE TABLE `kren_recip_t` (`RECIP_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NTFCTN_ID` DECIMAL(8,0) NOT NULL, `RECIP_TYP_CD` VARCHAR(10) NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0), CONSTRAINT `PK_KREN_RECIP_T` PRIMARY KEY (`RECIP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-33', '2.1.0-SNP', '3:f9277893d880b97f57ae33bb31ad152e', 802)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-34::unit-test::(Checksum: 3:97fb4538db009e9d2ed94a262a5a8bd4)
CREATE TABLE `kren_rvwer_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_RVWER_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-34', '2.1.0-SNP', '3:97fb4538db009e9d2ed94a262a5a8bd4', 803)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-35::unit-test::(Checksum: 3:a125eef34fc5c34f09c47eee1e0e8bf1)
CREATE TABLE `kren_rvwer_t` (`RVWER_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `CHNL_ID` DECIMAL(8,0) NOT NULL, `TYP` VARCHAR(10) NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36), CONSTRAINT `PK_KREN_RVWER_T` PRIMARY KEY (`RVWER_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-35', '2.1.0-SNP', '3:a125eef34fc5c34f09c47eee1e0e8bf1', 804)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-36::unit-test::(Checksum: 3:f554325954dfb5df13d5a1de59ad2520)
CREATE TABLE `kren_sndr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREN_SNDR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-36', '2.1.0-SNP', '3:f554325954dfb5df13d5a1de59ad2520', 805)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-37::unit-test::(Checksum: 3:f64abbe82e8f68473be0972c13a7b3ff)
CREATE TABLE `kren_sndr_t` (`SNDR_ID` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NTFCTN_ID` DECIMAL(8,0) NOT NULL, `NM` VARCHAR(200) NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0), CONSTRAINT `PK_KREN_SNDR_T` PRIMARY KEY (`SNDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-37', '2.1.0-SNP', '3:f64abbe82e8f68473be0972c13a7b3ff', 806)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-38::unit-test::(Checksum: 3:f950e4d0a6ce7fbc6b0fa7d9dd6e9097)
CREATE TABLE `krew_actn_itm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_ACTN_ITM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-38', '2.1.0-SNP', '3:f950e4d0a6ce7fbc6b0fa7d9dd6e9097', 807)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-39::unit-test::(Checksum: 3:3b82d0ee4be76fcb39e951428018c4e4)
CREATE TABLE `krew_actn_itm_t` (`ACTN_ITM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `ASND_DT` DATETIME NOT NULL, `RQST_CD` CHAR(1) NOT NULL, `ACTN_RQST_ID` VARCHAR(40) NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `ROLE_NM` VARCHAR(2000), `DLGN_PRNCPL_ID` VARCHAR(40), `DOC_HDR_TTL` VARCHAR(255), `DOC_TYP_LBL` VARCHAR(128) NOT NULL, `DOC_HDLR_URL` VARCHAR(255) NOT NULL, `DOC_TYP_NM` VARCHAR(64) NOT NULL, `RSP_ID` VARCHAR(40) NOT NULL, `DLGN_TYP` VARCHAR(1), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `DTYPE` VARCHAR(50), `GRP_ID` VARCHAR(40), `DLGN_GRP_ID` VARCHAR(40), `RQST_LBL` VARCHAR(255), CONSTRAINT `PK_KREW_ACTN_ITM_T` PRIMARY KEY (`ACTN_ITM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-39', '2.1.0-SNP', '3:3b82d0ee4be76fcb39e951428018c4e4', 808)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-40::unit-test::(Checksum: 3:c318356eece0b03e18d888fe5ca28fda)
CREATE TABLE `krew_actn_list_optn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_ACTN_LIST_OPTN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-40', '2.1.0-SNP', '3:c318356eece0b03e18d888fe5ca28fda', 809)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-41::unit-test::(Checksum: 3:728b7020dd9ff9cb11ee2b62735828b0)
CREATE TABLE `krew_actn_rqst_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_ACTN_RQST_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-41', '2.1.0-SNP', '3:728b7020dd9ff9cb11ee2b62735828b0', 810)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-42::unit-test::(Checksum: 3:ca7c62710a191e4e9b9cb2e1bf9ea392)
CREATE TABLE `krew_actn_rqst_t` (`ACTN_RQST_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PARNT_ID` VARCHAR(40), `ACTN_RQST_CD` CHAR(1) NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `RULE_ID` VARCHAR(40), `STAT_CD` CHAR(1) NOT NULL, `RSP_ID` VARCHAR(40) NOT NULL, `PRNCPL_ID` VARCHAR(40), `ROLE_NM` VARCHAR(2000), `QUAL_ROLE_NM` VARCHAR(2000), `QUAL_ROLE_NM_LBL_TXT` VARCHAR(2000), `RECIP_TYP_CD` CHAR(1), `PRIO_NBR` DECIMAL(8,0) NOT NULL, `RTE_TYP_NM` VARCHAR(255), `RTE_LVL_NBR` DECIMAL(8,0) NOT NULL, `RTE_NODE_INSTN_ID` VARCHAR(40), `ACTN_TKN_ID` VARCHAR(40), `DOC_VER_NBR` DECIMAL(8,0) NOT NULL, `CRTE_DT` DATETIME NOT NULL, `RSP_DESC_TXT` VARCHAR(200), `FRC_ACTN` DECIMAL(1,0) DEFAULT 0, `ACTN_RQST_ANNOTN_TXT` VARCHAR(2000), `DLGN_TYP` CHAR(1), `APPR_PLCY` CHAR(1), `CUR_IND` DECIMAL(1,0) DEFAULT 1, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `GRP_ID` VARCHAR(40), `RQST_LBL` VARCHAR(255), CONSTRAINT `PK_KREW_ACTN_RQST_T` PRIMARY KEY (`ACTN_RQST_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-42', '2.1.0-SNP', '3:ca7c62710a191e4e9b9cb2e1bf9ea392', 811)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-43::unit-test::(Checksum: 3:2c3531bc92c940b9cd152947e6a9e9dd)
CREATE TABLE `krew_actn_tkn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_ACTN_TKN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-43', '2.1.0-SNP', '3:2c3531bc92c940b9cd152947e6a9e9dd', 812)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-44::unit-test::(Checksum: 3:a4ccc7ae27600215a8cc40e3ce1a03e9)
CREATE TABLE `krew_actn_tkn_t` (`ACTN_TKN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `DLGTR_PRNCPL_ID` VARCHAR(40), `ACTN_CD` CHAR(1) NOT NULL, `ACTN_DT` DATETIME NOT NULL, `DOC_VER_NBR` DECIMAL(8,0) NOT NULL, `ANNOTN` VARCHAR(2000), `CUR_IND` DECIMAL(1,0) DEFAULT 1, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `DLGTR_GRP_ID` VARCHAR(40), CONSTRAINT `PK_KREW_ACTN_TKN_T` PRIMARY KEY (`ACTN_TKN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-44', '2.1.0-SNP', '3:a4ccc7ae27600215a8cc40e3ce1a03e9', 813)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-45::unit-test::(Checksum: 3:d8910b01927479bb9d8033875e0e6c4c)
CREATE TABLE `krew_app_doc_stat_tran_t` (`APP_DOC_STAT_TRAN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40), `APP_DOC_STAT_FROM` VARCHAR(64), `APP_DOC_STAT_TO` VARCHAR(64), `STAT_TRANS_DATE` DATETIME, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_APP_DOC_STAT_TRAN_T` PRIMARY KEY (`APP_DOC_STAT_TRAN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-45', '2.1.0-SNP', '3:d8910b01927479bb9d8033875e0e6c4c', 814)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-46::unit-test::(Checksum: 3:3bfae8db70a123915567a29aec1f4df6)
CREATE TABLE `krew_att_t` (`ATTACHMENT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NTE_ID` VARCHAR(40), `FILE_NM` VARCHAR(255) NOT NULL, `FILE_LOC` VARCHAR(255) NOT NULL, `MIME_TYP` VARCHAR(255) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_ATT_T` PRIMARY KEY (`ATTACHMENT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-46', '2.1.0-SNP', '3:3bfae8db70a123915567a29aec1f4df6', 815)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-47::unit-test::(Checksum: 3:55958290999e415d80ac1aed6a8324b8)
CREATE TABLE `krew_dlgn_rsp_t` (`DLGN_RULE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RSP_ID` VARCHAR(40) NOT NULL, `DLGN_RULE_BASE_VAL_ID` VARCHAR(40) NOT NULL, `DLGN_TYP` VARCHAR(20) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_DLGN_RSP_T` PRIMARY KEY (`DLGN_RULE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-47', '2.1.0-SNP', '3:55958290999e415d80ac1aed6a8324b8', 816)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-48::unit-test::(Checksum: 3:2fa0ce1634feb24cd1afec7934584608)
CREATE TABLE `krew_doc_hdr_cntnt_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_CNTNT_TXT` LONGTEXT, CONSTRAINT `PK_KREW_DOC_HDR_CNTNT_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-48', '2.1.0-SNP', '3:2fa0ce1634feb24cd1afec7934584608', 817)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-49::unit-test::(Checksum: 3:13dc686142ee64327ce8313e5a2255c3)
CREATE TABLE `krew_doc_hdr_ext_dt_t` (`DOC_HDR_EXT_DT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(256) NOT NULL, `VAL` DATETIME, CONSTRAINT `PK_KREW_DOC_HDR_EXT_DT_T` PRIMARY KEY (`DOC_HDR_EXT_DT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-49', '2.1.0-SNP', '3:13dc686142ee64327ce8313e5a2255c3', 818)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-50::unit-test::(Checksum: 3:84c68e8fd772a57c0d0a61efe694fbca)
CREATE TABLE `krew_doc_hdr_ext_flt_t` (`DOC_HDR_EXT_FLT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(256) NOT NULL, `VAL` DECIMAL(30,15), CONSTRAINT `PK_KREW_DOC_HDR_EXT_FLT_T` PRIMARY KEY (`DOC_HDR_EXT_FLT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-50', '2.1.0-SNP', '3:84c68e8fd772a57c0d0a61efe694fbca', 819)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-51::unit-test::(Checksum: 3:318368e336b22cb96f3c54e2f45624d4)
CREATE TABLE `krew_doc_hdr_ext_long_t` (`DOC_HDR_EXT_LONG_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(256) NOT NULL, `VAL` DECIMAL(22,0), CONSTRAINT `PK_KREW_DOC_HDR_EXT_LONG_T` PRIMARY KEY (`DOC_HDR_EXT_LONG_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-51', '2.1.0-SNP', '3:318368e336b22cb96f3c54e2f45624d4', 820)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-52::unit-test::(Checksum: 3:9f92328ba3a1823a513c2efbd0164246)
CREATE TABLE `krew_doc_hdr_ext_t` (`DOC_HDR_EXT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(256) NOT NULL, `VAL` VARCHAR(2000), CONSTRAINT `PK_KREW_DOC_HDR_EXT_T` PRIMARY KEY (`DOC_HDR_EXT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-52', '2.1.0-SNP', '3:9f92328ba3a1823a513c2efbd0164246', 821)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-53::unit-test::(Checksum: 3:1dba62c47508245d210cc40c0bcc7910)
CREATE TABLE `krew_doc_hdr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_DOC_HDR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-53', '2.1.0-SNP', '3:1dba62c47508245d210cc40c0bcc7910', 822)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-54::unit-test::(Checksum: 3:4c0d6555230f45f90bc276a6dde4882f)
CREATE TABLE `krew_doc_hdr_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_TYP_ID` VARCHAR(40), `DOC_HDR_STAT_CD` CHAR(1) NOT NULL, `RTE_LVL` DECIMAL(8,0) NOT NULL, `STAT_MDFN_DT` DATETIME NOT NULL, `CRTE_DT` DATETIME NOT NULL, `APRV_DT` DATETIME, `FNL_DT` DATETIME, `RTE_STAT_MDFN_DT` DATETIME, `RTE_LVL_MDFN_DT` DATETIME, `TTL` VARCHAR(255), `APP_DOC_ID` VARCHAR(255), `DOC_VER_NBR` DECIMAL(8,0) NOT NULL, `INITR_PRNCPL_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `RTE_PRNCPL_ID` VARCHAR(40), `DTYPE` VARCHAR(50), `OBJ_ID` VARCHAR(36) NOT NULL, `APP_DOC_STAT` VARCHAR(64), `APP_DOC_STAT_MDFN_DT` DATETIME, CONSTRAINT `PK_KREW_DOC_HDR_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-54', '2.1.0-SNP', '3:4c0d6555230f45f90bc276a6dde4882f', 823)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-55::unit-test::(Checksum: 3:2413c0defdca3d0a9ed97405c104db6a)
CREATE TABLE `krew_doc_lnk_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_DOC_LNK_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-55', '2.1.0-SNP', '3:2413c0defdca3d0a9ed97405c104db6a', 824)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-56::unit-test::(Checksum: 3:f526622fcdb3f4244359d935fcf764dc)
CREATE TABLE `krew_doc_lnk_t` (`DOC_LNK_ID` VARCHAR(40) DEFAULT '' NOT NULL, `ORGN_DOC_ID` VARCHAR(40) NOT NULL, `DEST_DOC_ID` VARCHAR(40) NOT NULL, CONSTRAINT `PK_KREW_DOC_LNK_T` PRIMARY KEY (`DOC_LNK_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-56', '2.1.0-SNP', '3:f526622fcdb3f4244359d935fcf764dc', 825)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-57::unit-test::(Checksum: 3:07619d110867c6ce4f41d94513eeec2f)
CREATE TABLE `krew_doc_nte_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_DOC_NTE_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-57', '2.1.0-SNP', '3:07619d110867c6ce4f41d94513eeec2f', 826)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-58::unit-test::(Checksum: 3:3212f71df9b05754e553b884e1d5a949)
CREATE TABLE `krew_doc_nte_t` (`DOC_NTE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `AUTH_PRNCPL_ID` VARCHAR(40) NOT NULL, `CRT_DT` DATETIME NOT NULL, `TXT` VARCHAR(4000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_DOC_NTE_T` PRIMARY KEY (`DOC_NTE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-58', '2.1.0-SNP', '3:3212f71df9b05754e553b884e1d5a949', 827)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-59::unit-test::(Checksum: 3:77878167d3055788fe617ca9b9a4b17d)
CREATE TABLE `krew_doc_typ_app_doc_stat_t` (`DOC_TYP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_STAT_NM` VARCHAR(20) DEFAULT '' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-59', '2.1.0-SNP', '3:77878167d3055788fe617ca9b9a4b17d', 828)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-60::unit-test::(Checksum: 3:569a9770c0fc81cfc9c9778f3d52a5ef)
CREATE TABLE `krew_doc_typ_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_DOC_TYP_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-60', '2.1.0-SNP', '3:569a9770c0fc81cfc9c9778f3d52a5ef', 829)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-61::unit-test::(Checksum: 3:c4b00edf06557a1eb4e4aea56d79d3ba)
CREATE TABLE `krew_doc_typ_attr_t` (`DOC_TYP_ATTRIB_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_TYP_ID` VARCHAR(40) NOT NULL, `RULE_ATTR_ID` VARCHAR(40) NOT NULL, `ORD_INDX` DECIMAL(4,0) DEFAULT 0, CONSTRAINT `PK_KREW_DOC_TYP_ATTR_T` PRIMARY KEY (`DOC_TYP_ATTRIB_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-61', '2.1.0-SNP', '3:c4b00edf06557a1eb4e4aea56d79d3ba', 830)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-62::unit-test::(Checksum: 3:35fccbac5e992b81181c94b36c49e78a)
CREATE TABLE `krew_doc_typ_plcy_reln_t` (`DOC_TYP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_PLCY_NM` VARCHAR(255) DEFAULT '' NOT NULL, `PLCY_NM` DECIMAL(1,0) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, `PLCY_VAL` VARCHAR(64), `PLCY_DESC` VARCHAR(20))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-62', '2.1.0-SNP', '3:35fccbac5e992b81181c94b36c49e78a', 831)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-63::unit-test::(Checksum: 3:646b682bb6ac84dbd7d0e6fb539b4f2d)
CREATE TABLE `krew_doc_typ_proc_t` (`DOC_TYP_PROC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_TYP_ID` VARCHAR(40) NOT NULL, `INIT_RTE_NODE_ID` DECIMAL(22,0), `NM` VARCHAR(255) NOT NULL, `INIT_IND` DECIMAL(1,0) DEFAULT 0 NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_DOC_TYP_PROC_T` PRIMARY KEY (`DOC_TYP_PROC_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-63', '2.1.0-SNP', '3:646b682bb6ac84dbd7d0e6fb539b4f2d', 832)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-64::unit-test::(Checksum: 3:f2fa6052a42ff20dee002a8507cff247)
CREATE TABLE `krew_doc_typ_t` (`DOC_TYP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PARNT_ID` VARCHAR(40), `DOC_TYP_NM` VARCHAR(64), `DOC_TYP_VER_NBR` DECIMAL(10,0) DEFAULT 0, `ACTV_IND` DECIMAL(1,0), `CUR_IND` DECIMAL(1,0), `LBL` VARCHAR(128), `PREV_DOC_TYP_VER_NBR` VARCHAR(40), `DOC_TYP_DESC` VARCHAR(4000), `DOC_HDLR_URL` VARCHAR(255), `POST_PRCSR` VARCHAR(255), `JNDI_URL` VARCHAR(255), `BLNKT_APPR_PLCY` VARCHAR(10), `ADV_DOC_SRCH_URL` VARCHAR(255), `CSTM_ACTN_LIST_ATTRIB_CLS_NM` VARCHAR(255), `CSTM_ACTN_EMAIL_ATTRIB_CLS_NM` VARCHAR(255), `CSTM_DOC_NTE_ATTRIB_CLS_NM` VARCHAR(255), `RTE_VER_NBR` VARCHAR(2) DEFAULT '1', `NOTIFY_ADDR` VARCHAR(255), `APPL_ID` VARCHAR(255), `EMAIL_XSL` VARCHAR(255), `SEC_XML` LONGTEXT, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `BLNKT_APPR_GRP_ID` VARCHAR(40), `RPT_GRP_ID` VARCHAR(40), `GRP_ID` VARCHAR(40), `HELP_DEF_URL` VARCHAR(4000), `OBJ_ID` VARCHAR(36) NOT NULL, `DOC_SEARCH_HELP_URL` VARCHAR(4000), `DOC_HDR_ID` VARCHAR(40), CONSTRAINT `PK_KREW_DOC_TYP_T` PRIMARY KEY (`DOC_TYP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-64', '2.1.0-SNP', '3:f2fa6052a42ff20dee002a8507cff247', 833)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-65::unit-test::(Checksum: 3:3b4b973eaab4350e7f299958491a7397)
CREATE TABLE `krew_edl_assctn_t` (`EDOCLT_ASSOC_ID` DECIMAL(19,0) DEFAULT 0 NOT NULL, `DOC_TYP_NM` VARCHAR(64) NOT NULL, `EDL_DEF_NM` VARCHAR(200), `STYLE_NM` VARCHAR(200), `ACTV_IND` DECIMAL(1,0) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_EDL_ASSCTN_T` PRIMARY KEY (`EDOCLT_ASSOC_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-65', '2.1.0-SNP', '3:3b4b973eaab4350e7f299958491a7397', 834)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-66::unit-test::(Checksum: 3:16ba58bf7c08f0464463b59f1c34098a)
CREATE TABLE `krew_edl_def_t` (`EDOCLT_DEF_ID` DECIMAL(19,0) DEFAULT 0 NOT NULL, `NM` VARCHAR(200) NOT NULL, `XML` LONGTEXT NOT NULL, `ACTV_IND` DECIMAL(1,0) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_EDL_DEF_T` PRIMARY KEY (`EDOCLT_DEF_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-66', '2.1.0-SNP', '3:16ba58bf7c08f0464463b59f1c34098a', 835)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-67::unit-test::(Checksum: 3:539d46f61f6f897cd035de5b5b22c1cf)
CREATE TABLE `krew_edl_dmp_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_TYP_NM` VARCHAR(64) NOT NULL, `DOC_HDR_STAT_CD` CHAR(1) NOT NULL, `DOC_HDR_MDFN_DT` DATETIME NOT NULL, `DOC_HDR_CRTE_DT` DATETIME NOT NULL, `DOC_HDR_TTL` VARCHAR(255), `DOC_HDR_INITR_PRNCPL_ID` VARCHAR(40) NOT NULL, `CRNT_NODE_NM` VARCHAR(30) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_EDL_DMP_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-67', '2.1.0-SNP', '3:539d46f61f6f897cd035de5b5b22c1cf', 836)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-68::unit-test::(Checksum: 3:51517a9cbd8499d7d937deea4377d99b)
CREATE TABLE `krew_edl_fld_dmp_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_EDL_FLD_DMP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-68', '2.1.0-SNP', '3:51517a9cbd8499d7d937deea4377d99b', 837)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-69::unit-test::(Checksum: 3:edc1bb57357b05b2d1eb7d70b989d4ff)
CREATE TABLE `krew_edl_fld_dmp_t` (`EDL_FIELD_DMP_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `FLD_NM` VARCHAR(255) NOT NULL, `FLD_VAL` VARCHAR(4000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_EDL_FLD_DMP_T` PRIMARY KEY (`EDL_FIELD_DMP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-69', '2.1.0-SNP', '3:edc1bb57357b05b2d1eb7d70b989d4ff', 838)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-70::unit-test::(Checksum: 3:0e5a138195354f20f04ddc93c0adf93b)
CREATE TABLE `krew_edl_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_EDL_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-70', '2.1.0-SNP', '3:0e5a138195354f20f04ddc93c0adf93b', 839)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-71::unit-test::(Checksum: 3:5bcac382c618ae746b4972c0078b3dfa)
CREATE TABLE `krew_hlp_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_HLP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-71', '2.1.0-SNP', '3:5bcac382c618ae746b4972c0078b3dfa', 840)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-72::unit-test::(Checksum: 3:405c7e7f1cbbf5d954b91459f38ee30f)
CREATE TABLE `krew_hlp_t` (`HLP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(500) NOT NULL, `KEY_CD` VARCHAR(500) NOT NULL, `HLP_TXT` VARCHAR(4000) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_HLP_T` PRIMARY KEY (`HLP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-72', '2.1.0-SNP', '3:405c7e7f1cbbf5d954b91459f38ee30f', 841)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-73::unit-test::(Checksum: 3:9450c778bae50036bb30a72c36b103a2)
CREATE TABLE `krew_init_rte_node_instn_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RTE_NODE_INSTN_ID` VARCHAR(40) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-73', '2.1.0-SNP', '3:9450c778bae50036bb30a72c36b103a2', 842)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-74::unit-test::(Checksum: 3:d1f0f531b52c9768d98dce03ab9165d7)
CREATE TABLE `krew_out_box_itm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_OUT_BOX_ITM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-74', '2.1.0-SNP', '3:d1f0f531b52c9768d98dce03ab9165d7', 843)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-75::unit-test::(Checksum: 3:c27ab7516d88051c152ba002b992cbdb)
CREATE TABLE `krew_out_box_itm_t` (`ACTN_ITM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `ASND_DT` DATETIME NOT NULL, `RQST_CD` CHAR(1) NOT NULL, `ACTN_RQST_ID` VARCHAR(40) NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `ROLE_NM` VARCHAR(2000), `DLGN_PRNCPL_ID` VARCHAR(40), `DOC_HDR_TTL` VARCHAR(255), `DOC_TYP_LBL` VARCHAR(128) NOT NULL, `DOC_HDLR_URL` VARCHAR(255) NOT NULL, `DOC_TYP_NM` VARCHAR(64) NOT NULL, `RSP_ID` VARCHAR(40) NOT NULL, `DLGN_TYP` VARCHAR(1), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `GRP_ID` VARCHAR(40), `DLGN_GRP_ID` VARCHAR(40), `RQST_LBL` VARCHAR(255), CONSTRAINT `PK_KREW_OUT_BOX_ITM_T` PRIMARY KEY (`ACTN_ITM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-75', '2.1.0-SNP', '3:c27ab7516d88051c152ba002b992cbdb', 844)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-76::unit-test::(Checksum: 3:2f19d7cfe7d51261f36a80305cdb8dce)
CREATE TABLE `krew_ria_doc_t` (`RIA_ID` DECIMAL(22,0) DEFAULT 0 NOT NULL, `XML_CONTENT` VARCHAR(4000), `RIA_DOC_TYPE_NAME` VARCHAR(100), `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RIA_DOC_T` PRIMARY KEY (`RIA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-76', '2.1.0-SNP', '3:2f19d7cfe7d51261f36a80305cdb8dce', 845)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-77::unit-test::(Checksum: 3:a405bfa896154a4420a769e89f79b83c)
CREATE TABLE `krew_ria_doctype_map_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RIA_DOCTYPE_MAP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-77', '2.1.0-SNP', '3:a405bfa896154a4420a769e89f79b83c', 846)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-78::unit-test::(Checksum: 3:2753223a5bd0f156cbf14a35dddf4732)
CREATE TABLE `krew_ria_doctype_map_t` (`ID` DECIMAL(22,0) DEFAULT 0 NOT NULL, `RIA_DOC_TYPE_NAME` VARCHAR(100), `UPDATED_AT` DATETIME, `RIA_URL` VARCHAR(255), `HELP_URL` VARCHAR(255), `EDITABLE` CHAR(1), `INIT_GROUPS` VARCHAR(255), `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RIA_DOCTYPE_MAP_T` PRIMARY KEY (`ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-78', '2.1.0-SNP', '3:2753223a5bd0f156cbf14a35dddf4732', 847)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-79::unit-test::(Checksum: 3:aa7038e5b937bec5aa20fd8e54077402)
CREATE TABLE `krew_rmv_rplc_doc_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OPRN` CHAR(1) NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `RPLC_PRNCPL_ID` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RMV_RPLC_DOC_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-79', '2.1.0-SNP', '3:aa7038e5b937bec5aa20fd8e54077402', 848)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-80::unit-test::(Checksum: 3:d0b0e03315fbdd6964a5f760a6618f56)
CREATE TABLE `krew_rmv_rplc_grp_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `GRP_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-80', '2.1.0-SNP', '3:d0b0e03315fbdd6964a5f760a6618f56', 849)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-81::unit-test::(Checksum: 3:8f4596f43e554619b7763f0c28d6423e)
CREATE TABLE `krew_rmv_rplc_rule_t` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_ID` DECIMAL(19,0) DEFAULT 0 NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-81', '2.1.0-SNP', '3:8f4596f43e554619b7763f0c28d6423e', 850)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-82::unit-test::(Checksum: 3:045591dad92858e10462658161eb371a)
CREATE TABLE `krew_rsp_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RSP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-82', '2.1.0-SNP', '3:045591dad92858e10462658161eb371a', 851)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-83::unit-test::(Checksum: 3:7a8c73a578c059d3612d174dd259d3ed)
CREATE TABLE `krew_rte_brch_proto_t` (`RTE_BRCH_PROTO_ID` VARCHAR(40) DEFAULT '' NOT NULL, `BRCH_NM` VARCHAR(255) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RTE_BRCH_PROTO_T` PRIMARY KEY (`RTE_BRCH_PROTO_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-83', '2.1.0-SNP', '3:7a8c73a578c059d3612d174dd259d3ed', 852)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-84::unit-test::(Checksum: 3:120cacd36a867b64ada729c2fca6e1c7)
CREATE TABLE `krew_rte_brch_st_t` (`RTE_BRCH_ST_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RTE_BRCH_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(255) NOT NULL, `VAL` VARCHAR(2000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RTE_BRCH_ST_T` PRIMARY KEY (`RTE_BRCH_ST_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-84', '2.1.0-SNP', '3:120cacd36a867b64ada729c2fca6e1c7', 853)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-85::unit-test::(Checksum: 3:5d15e26f48c98ef84f5a27574b7bcfbd)
CREATE TABLE `krew_rte_brch_t` (`RTE_BRCH_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(255) NOT NULL, `PARNT_ID` VARCHAR(40), `INIT_RTE_NODE_INSTN_ID` VARCHAR(40), `SPLT_RTE_NODE_INSTN_ID` VARCHAR(40), `JOIN_RTE_NODE_INSTN_ID` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RTE_BRCH_T` PRIMARY KEY (`RTE_BRCH_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-85', '2.1.0-SNP', '3:5d15e26f48c98ef84f5a27574b7bcfbd', 854)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-86::unit-test::(Checksum: 3:f627e174d61b9bd6e0707bc54c2c9f49)
CREATE TABLE `krew_rte_node_cfg_parm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RTE_NODE_CFG_PARM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-86', '2.1.0-SNP', '3:f627e174d61b9bd6e0707bc54c2c9f49', 855)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-87::unit-test::(Checksum: 3:2b510d2583f1a77d5792b710043b5ee6)
CREATE TABLE `krew_rte_node_cfg_parm_t` (`RTE_NODE_CFG_PARM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RTE_NODE_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(255) NOT NULL, `VAL` VARCHAR(4000), CONSTRAINT `PK_KREW_RTE_NODE_CFG_PARM_T` PRIMARY KEY (`RTE_NODE_CFG_PARM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-87', '2.1.0-SNP', '3:2b510d2583f1a77d5792b710043b5ee6', 856)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-88::unit-test::(Checksum: 3:5632d5222e6bf039da990ec740fdcb7b)
CREATE TABLE `krew_rte_node_instn_lnk_t` (`FROM_RTE_NODE_INSTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TO_RTE_NODE_INSTN_ID` VARCHAR(40) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-88', '2.1.0-SNP', '3:5632d5222e6bf039da990ec740fdcb7b', 857)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-89::unit-test::(Checksum: 3:8bfd1aeb6660192f392b2b64247b5ed0)
CREATE TABLE `krew_rte_node_instn_st_t` (`RTE_NODE_INSTN_ST_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RTE_NODE_INSTN_ID` VARCHAR(40) NOT NULL, `KEY_CD` VARCHAR(255) NOT NULL, `VAL` VARCHAR(2000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RTE_NODE_INSTN_ST_T` PRIMARY KEY (`RTE_NODE_INSTN_ST_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-89', '2.1.0-SNP', '3:8bfd1aeb6660192f392b2b64247b5ed0', 858)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-90::unit-test::(Checksum: 3:8b298f64e987ef589bfce67873dd8caf)
CREATE TABLE `krew_rte_node_instn_t` (`RTE_NODE_INSTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(40) NOT NULL, `RTE_NODE_ID` VARCHAR(40) NOT NULL, `BRCH_ID` VARCHAR(40), `PROC_RTE_NODE_INSTN_ID` VARCHAR(40), `ACTV_IND` DECIMAL(1,0) DEFAULT 0 NOT NULL, `CMPLT_IND` DECIMAL(1,0) DEFAULT 0 NOT NULL, `INIT_IND` DECIMAL(1,0) DEFAULT 0 NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RTE_NODE_INSTN_T` PRIMARY KEY (`RTE_NODE_INSTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-90', '2.1.0-SNP', '3:8b298f64e987ef589bfce67873dd8caf', 859)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-91::unit-test::(Checksum: 3:136530f7f0978abc6b6d267b47d7eade)
CREATE TABLE `krew_rte_node_lnk_t` (`FROM_RTE_NODE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TO_RTE_NODE_ID` VARCHAR(40) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-91', '2.1.0-SNP', '3:136530f7f0978abc6b6d267b47d7eade', 860)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-92::unit-test::(Checksum: 3:266ceb591b83a1f53e7b3537cdf7f62a)
CREATE TABLE `krew_rte_node_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RTE_NODE_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-92', '2.1.0-SNP', '3:266ceb591b83a1f53e7b3537cdf7f62a', 861)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-93::unit-test::(Checksum: 3:a0674858326bd1ff2a9eda95aaaa8e24)
CREATE TABLE `krew_rte_node_t` (`RTE_NODE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_TYP_ID` DECIMAL(19,0), `NM` VARCHAR(255) NOT NULL, `TYP` VARCHAR(255) NOT NULL, `RTE_MTHD_NM` VARCHAR(255), `RTE_MTHD_CD` VARCHAR(2), `FNL_APRVR_IND` DECIMAL(1,0), `MNDTRY_RTE_IND` DECIMAL(1,0), `ACTVN_TYP` VARCHAR(250), `BRCH_PROTO_ID` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `CONTENT_FRAGMENT` VARCHAR(4000), `GRP_ID` VARCHAR(40), `NEXT_DOC_STAT` VARCHAR(64), CONSTRAINT `PK_KREW_RTE_NODE_T` PRIMARY KEY (`RTE_NODE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-93', '2.1.0-SNP', '3:a0674858326bd1ff2a9eda95aaaa8e24', 862)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-94::unit-test::(Checksum: 3:a369c90f9b6725fce5230d97d407a28c)
CREATE TABLE `krew_rte_tmpl_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RTE_TMPL_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-94', '2.1.0-SNP', '3:a369c90f9b6725fce5230d97d407a28c', 863)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-95::unit-test::(Checksum: 3:e15625697367b1b19cf76885b6aabe4a)
CREATE TABLE `krew_rule_attr_t` (`RULE_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(255) NOT NULL, `LBL` VARCHAR(2000) NOT NULL, `RULE_ATTR_TYP_CD` VARCHAR(2000) NOT NULL, `DESC_TXT` VARCHAR(2000), `CLS_NM` VARCHAR(2000), `XML` LONGTEXT, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `APPL_ID` VARCHAR(255), `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RULE_ATTR_T` PRIMARY KEY (`RULE_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-95', '2.1.0-SNP', '3:e15625697367b1b19cf76885b6aabe4a', 864)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-96::unit-test::(Checksum: 3:44c09d45dea3ba1929af518a33af7154)
CREATE TABLE `krew_rule_expr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RULE_EXPR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-96', '2.1.0-SNP', '3:44c09d45dea3ba1929af518a33af7154', 865)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-97::unit-test::(Checksum: 3:7054ced96b50c46ac7f09d3a2e34456f)
CREATE TABLE `krew_rule_expr_t` (`RULE_EXPR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TYP` VARCHAR(256) NOT NULL, `RULE_EXPR` VARCHAR(4000), `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RULE_EXPR_T` PRIMARY KEY (`RULE_EXPR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-97', '2.1.0-SNP', '3:7054ced96b50c46ac7f09d3a2e34456f', 866)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-98::unit-test::(Checksum: 3:d3e7a6f8fcf6b4ea54de92b4e8da63d7)
CREATE TABLE `krew_rule_ext_t` (`RULE_EXT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_TMPL_ATTR_ID` VARCHAR(40) NOT NULL, `RULE_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RULE_EXT_T` PRIMARY KEY (`RULE_EXT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-98', '2.1.0-SNP', '3:d3e7a6f8fcf6b4ea54de92b4e8da63d7', 867)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-99::unit-test::(Checksum: 3:fc9119f6bb365680ee49c0c7df66bca9)
CREATE TABLE `krew_rule_ext_val_t` (`RULE_EXT_VAL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_EXT_ID` VARCHAR(40) NOT NULL, `VAL` VARCHAR(2000) NOT NULL, `KEY_CD` VARCHAR(2000) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RULE_EXT_VAL_T` PRIMARY KEY (`RULE_EXT_VAL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-99', '2.1.0-SNP', '3:fc9119f6bb365680ee49c0c7df66bca9', 868)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-100::unit-test::(Checksum: 3:a3891140c41957e9a1544ec698f9eafd)
CREATE TABLE `krew_rule_rsp_t` (`RULE_RSP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RSP_ID` VARCHAR(40) NOT NULL, `RULE_ID` VARCHAR(40) NOT NULL, `PRIO` DECIMAL(5,0), `ACTN_RQST_CD` VARCHAR(2000), `NM` VARCHAR(200), `TYP` VARCHAR(1), `APPR_PLCY` CHAR(1), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RULE_RSP_T` PRIMARY KEY (`RULE_RSP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-100', '2.1.0-SNP', '3:a3891140c41957e9a1544ec698f9eafd', 869)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-101::unit-test::(Checksum: 3:a998b763b4e1d9b1ae693883001142b9)
CREATE TABLE `krew_rule_t` (`RULE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(256), `RULE_TMPL_ID` VARCHAR(40), `RULE_EXPR_ID` VARCHAR(40), `ACTV_IND` DECIMAL(1,0) NOT NULL, `RULE_BASE_VAL_DESC` VARCHAR(2000), `FRC_ACTN` DECIMAL(1,0) NOT NULL, `DOC_TYP_NM` VARCHAR(64) NOT NULL, `DOC_HDR_ID` VARCHAR(40), `TMPL_RULE_IND` DECIMAL(1,0), `FRM_DT` DATETIME, `TO_DT` DATETIME, `DACTVN_DT` DATETIME, `CUR_IND` DECIMAL(1,0) DEFAULT 0, `RULE_VER_NBR` DECIMAL(8,0) DEFAULT 0, `DLGN_IND` DECIMAL(1,0), `PREV_RULE_VER_NBR` VARCHAR(40), `ACTVN_DT` DATETIME, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RULE_T` PRIMARY KEY (`RULE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-101', '2.1.0-SNP', '3:a998b763b4e1d9b1ae693883001142b9', 870)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-102::unit-test::(Checksum: 3:d967c0d079e480e4c3953b2825b2404a)
CREATE TABLE `krew_rule_tmpl_attr_t` (`RULE_TMPL_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_TMPL_ID` VARCHAR(40) NOT NULL, `RULE_ATTR_ID` VARCHAR(40) NOT NULL, `REQ_IND` DECIMAL(1,0) NOT NULL, `ACTV_IND` DECIMAL(1,0) NOT NULL, `DSPL_ORD` DECIMAL(5,0) NOT NULL, `DFLT_VAL` VARCHAR(2000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RULE_TMPL_ATTR_T` PRIMARY KEY (`RULE_TMPL_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-102', '2.1.0-SNP', '3:d967c0d079e480e4c3953b2825b2404a', 871)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-103::unit-test::(Checksum: 3:4314b02e3b749dc34221c211348fbede)
CREATE TABLE `krew_rule_tmpl_optn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_RULE_TMPL_OPTN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-103', '2.1.0-SNP', '3:4314b02e3b749dc34221c211348fbede', 872)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-104::unit-test::(Checksum: 3:cd41ea2b6878ee7eed7ece658f811865)
CREATE TABLE `krew_rule_tmpl_optn_t` (`RULE_TMPL_OPTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_TMPL_ID` VARCHAR(40), `KEY_CD` VARCHAR(250), `VAL` VARCHAR(2000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KREW_RULE_TMPL_OPTN_T` PRIMARY KEY (`RULE_TMPL_OPTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-104', '2.1.0-SNP', '3:cd41ea2b6878ee7eed7ece658f811865', 873)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-105::unit-test::(Checksum: 3:944b57c08e6582340eaf7c683434b547)
CREATE TABLE `krew_rule_tmpl_t` (`RULE_TMPL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(250) NOT NULL, `RULE_TMPL_DESC` VARCHAR(2000), `DLGN_RULE_TMPL_ID` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_RULE_TMPL_T` PRIMARY KEY (`RULE_TMPL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-105', '2.1.0-SNP', '3:944b57c08e6582340eaf7c683434b547', 874)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-106::unit-test::(Checksum: 3:70cdbc7b220f24dc30572b799e9d3105)
CREATE TABLE `krew_srch_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_SRCH_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-106', '2.1.0-SNP', '3:70cdbc7b220f24dc30572b799e9d3105', 875)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-107::unit-test::(Checksum: 3:802eb3512e265b56369d6fec0d25df54)
CREATE TABLE `krew_style_t` (`STYLE_ID` DECIMAL(19,0) DEFAULT 0 NOT NULL, `NM` VARCHAR(200) NOT NULL, `XML` LONGTEXT NOT NULL, `ACTV_IND` DECIMAL(1,0) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KREW_STYLE_T` PRIMARY KEY (`STYLE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-107', '2.1.0-SNP', '3:802eb3512e265b56369d6fec0d25df54', 876)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-108::unit-test::(Checksum: 3:a033a6d85850f7c326d2156bafaad7e6)
CREATE TABLE `krew_usr_optn_t` (`PRNCPL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PRSN_OPTN_ID` VARCHAR(200) DEFAULT '' NOT NULL, `VAL` VARCHAR(2000), `VER_NBR` DECIMAL(8,0) DEFAULT 0)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-108', '2.1.0-SNP', '3:a033a6d85850f7c326d2156bafaad7e6', 877)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-109::unit-test::(Checksum: 3:6c905239f7c86d63a0bee1815b006636)
CREATE TABLE `krew_usr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KREW_USR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-109', '2.1.0-SNP', '3:6c905239f7c86d63a0bee1815b006636', 878)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-110::unit-test::(Checksum: 3:bb318736ab0e21e0277c688992a20e11)
CREATE TABLE `krim_addr_typ_t` (`ADDR_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ADDR_TYP_T` PRIMARY KEY (`ADDR_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-110', '2.1.0-SNP', '3:bb318736ab0e21e0277c688992a20e11', 879)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-111::unit-test::(Checksum: 3:1ee8d1ad4be87cb691932bd5413fab19)
CREATE TABLE `krim_afltn_typ_t` (`AFLTN_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `EMP_AFLTN_TYP_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_AFLTN_TYP_T` PRIMARY KEY (`AFLTN_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-111', '2.1.0-SNP', '3:1ee8d1ad4be87cb691932bd5413fab19', 880)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-112::unit-test::(Checksum: 3:7b31e4692c619328f50c643ef2dd600d)
CREATE TABLE `krim_attr_data_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ATTR_DATA_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-112', '2.1.0-SNP', '3:7b31e4692c619328f50c643ef2dd600d', 881)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-113::unit-test::(Checksum: 3:ea6fb5ed758febb9b6c0f40e79b699e0)
CREATE TABLE `krim_attr_defn_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ATTR_DEFN_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-113', '2.1.0-SNP', '3:ea6fb5ed758febb9b6c0f40e79b699e0', 882)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-114::unit-test::(Checksum: 3:ebb1612db567374d3922bd3e752d809f)
CREATE TABLE `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(100), `LBL` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `NMSPC_CD` VARCHAR(40), `CMPNT_NM` VARCHAR(100), CONSTRAINT `PK_KRIM_ATTR_DEFN_T` PRIMARY KEY (`KIM_ATTR_DEFN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-114', '2.1.0-SNP', '3:ebb1612db567374d3922bd3e752d809f', 883)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-115::unit-test::(Checksum: 3:b7443b7fda99899dd1d9af4256a71387)
CREATE TABLE `krim_ctznshp_stat_t` (`CTZNSHP_STAT_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_CTZNSHP_STAT_T` PRIMARY KEY (`CTZNSHP_STAT_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-115', '2.1.0-SNP', '3:b7443b7fda99899dd1d9af4256a71387', 884)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-116::unit-test::(Checksum: 3:f7a30da2591f3d479d0a594e7df6a7fd)
CREATE TABLE `krim_dlgn_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_DLGN_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-116', '2.1.0-SNP', '3:f7a30da2591f3d479d0a594e7df6a7fd', 885)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-117::unit-test::(Checksum: 3:47b3294aa076eed8e9d1064d5c19e554)
CREATE TABLE `krim_dlgn_mbr_attr_data_t` (`ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `DLGN_MBR_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), CONSTRAINT `PK_KRIM_DLGN_MBR_ATTR_DATA_T` PRIMARY KEY (`ATTR_DATA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-117', '2.1.0-SNP', '3:47b3294aa076eed8e9d1064d5c19e554', 886)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-118::unit-test::(Checksum: 3:84e1c23b8428490b7c732077ac4e9849)
CREATE TABLE `krim_dlgn_mbr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_DLGN_MBR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-118', '2.1.0-SNP', '3:84e1c23b8428490b7c732077ac4e9849', 887)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-119::unit-test::(Checksum: 3:7b081fc3fccdbd8e0a686fb9f61350aa)
CREATE TABLE `krim_dlgn_mbr_t` (`DLGN_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `DLGN_ID` VARCHAR(40), `MBR_ID` VARCHAR(40), `MBR_TYP_CD` CHAR(1) DEFAULT 'P', `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, `LAST_UPDT_DT` DATETIME, `ROLE_MBR_ID` VARCHAR(40), CONSTRAINT `PK_KRIM_DLGN_MBR_T` PRIMARY KEY (`DLGN_MBR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-119', '2.1.0-SNP', '3:7b081fc3fccdbd8e0a686fb9f61350aa', 888)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-120::unit-test::(Checksum: 3:c502f0e341a323c24262a433dd53715b)
CREATE TABLE `krim_dlgn_t` (`DLGN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `ROLE_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `KIM_TYP_ID` VARCHAR(40) NOT NULL, `DLGN_TYP_CD` VARCHAR(1), CONSTRAINT `PK_KRIM_DLGN_T` PRIMARY KEY (`DLGN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-120', '2.1.0-SNP', '3:c502f0e341a323c24262a433dd53715b', 889)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-121::unit-test::(Checksum: 3:9be3f279b561e6a95e45346ac3244911)
CREATE TABLE `krim_email_typ_t` (`EMAIL_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_EMAIL_TYP_T` PRIMARY KEY (`EMAIL_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-121', '2.1.0-SNP', '3:9be3f279b561e6a95e45346ac3244911', 890)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-122::unit-test::(Checksum: 3:4854141a05743d86fc9504f2ec111fa7)
CREATE TABLE `krim_emp_stat_t` (`EMP_STAT_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_EMP_STAT_T` PRIMARY KEY (`EMP_STAT_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-122', '2.1.0-SNP', '3:4854141a05743d86fc9504f2ec111fa7', 891)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-123::unit-test::(Checksum: 3:494defce114b72131a9c973f3862b613)
CREATE TABLE `krim_emp_typ_t` (`EMP_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_EMP_TYP_T` PRIMARY KEY (`EMP_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-123', '2.1.0-SNP', '3:494defce114b72131a9c973f3862b613', 892)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-124::unit-test::(Checksum: 3:c17e87a891f464a73d6447f9fcf3eccc)
CREATE TABLE `krim_ent_nm_typ_t` (`ENT_NM_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENT_NM_TYP_T` PRIMARY KEY (`ENT_NM_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-124', '2.1.0-SNP', '3:c17e87a891f464a73d6447f9fcf3eccc', 893)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-125::unit-test::(Checksum: 3:de74de55186a9dd53f725cccc2fac154)
CREATE TABLE `krim_ent_typ_t` (`ENT_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `DISPLAY_SORT_CD` VARCHAR(2), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_ENT_TYP_T` PRIMARY KEY (`ENT_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-125', '2.1.0-SNP', '3:de74de55186a9dd53f725cccc2fac154', 894)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-126::unit-test::(Checksum: 3:f93bced778c3297d34ebd55feec0b70e)
CREATE TABLE `krim_entity_addr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_ADDR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-126', '2.1.0-SNP', '3:f93bced778c3297d34ebd55feec0b70e', 895)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-127::unit-test::(Checksum: 3:0b06622a20e74482338441a8f1d6ce40)
CREATE TABLE `krim_entity_addr_t` (`ENTITY_ADDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `ENT_TYP_CD` VARCHAR(40), `ADDR_TYP_CD` VARCHAR(40), `ADDR_LINE_1` VARCHAR(45), `ADDR_LINE_2` VARCHAR(45), `ADDR_LINE_3` VARCHAR(45), `CITY_NM` VARCHAR(30), `POSTAL_STATE_CD` VARCHAR(2), `POSTAL_CD` VARCHAR(20), `POSTAL_CNTRY_CD` VARCHAR(2), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_ADDR_T` PRIMARY KEY (`ENTITY_ADDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-127', '2.1.0-SNP', '3:0b06622a20e74482338441a8f1d6ce40', 896)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-128::unit-test::(Checksum: 3:f104482bb9635b0c8e8b5bfdb924ddc7)
CREATE TABLE `krim_entity_afltn_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_AFLTN_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-128', '2.1.0-SNP', '3:f104482bb9635b0c8e8b5bfdb924ddc7', 897)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-129::unit-test::(Checksum: 3:dc2cd342e661e4293d06d7b382873b2f)
CREATE TABLE `krim_entity_afltn_t` (`ENTITY_AFLTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `AFLTN_TYP_CD` VARCHAR(40), `CAMPUS_CD` VARCHAR(2), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_AFLTN_T` PRIMARY KEY (`ENTITY_AFLTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-129', '2.1.0-SNP', '3:dc2cd342e661e4293d06d7b382873b2f', 898)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-130::unit-test::(Checksum: 3:e63e86931775bbaae51698e265a3b735)
CREATE TABLE `krim_entity_bio_t` (`ENTITY_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `BIRTH_DT` DATETIME, `GNDR_CD` VARCHAR(1) NOT NULL, `LAST_UPDT_DT` DATETIME, `DECEASED_DT` DATETIME, `MARITAL_STATUS` VARCHAR(40), `PRIM_LANG_CD` VARCHAR(40), `SEC_LANG_CD` VARCHAR(40), `BIRTH_CNTRY_CD` VARCHAR(2), `BIRTH_STATE_CD` VARCHAR(2), `BIRTH_CITY` VARCHAR(30), `GEO_ORIGIN` VARCHAR(100), CONSTRAINT `PK_KRIM_ENTITY_BIO_T` PRIMARY KEY (`ENTITY_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-130', '2.1.0-SNP', '3:e63e86931775bbaae51698e265a3b735', 899)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-131::unit-test::(Checksum: 3:7df340fecd49dcf1aa89185be3b82158)
CREATE TABLE `krim_entity_cache_t` (`ENTITY_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `PRNCPL_NM` VARCHAR(40), `ENTITY_TYP_CD` VARCHAR(40), `FIRST_NM` VARCHAR(40), `MIDDLE_NM` VARCHAR(40), `LAST_NM` VARCHAR(40), `PRSN_NM` VARCHAR(40), `CAMPUS_CD` VARCHAR(40), `PRMRY_DEPT_CD` VARCHAR(40), `EMP_ID` VARCHAR(40), `LAST_UPDT_TS` DATETIME, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_CACHE_T` PRIMARY KEY (`ENTITY_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-131', '2.1.0-SNP', '3:7df340fecd49dcf1aa89185be3b82158', 900)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-132::unit-test::(Checksum: 3:e8bd366ede94abe66c62d0ca76b8376a)
CREATE TABLE `krim_entity_ctznshp_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_CTZNSHP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-132', '2.1.0-SNP', '3:e8bd366ede94abe66c62d0ca76b8376a', 901)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-133::unit-test::(Checksum: 3:131adc8e67ea1a9c881f1b0935e3b127)
CREATE TABLE `krim_entity_ctznshp_t` (`ENTITY_CTZNSHP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `POSTAL_CNTRY_CD` VARCHAR(2), `CTZNSHP_STAT_CD` VARCHAR(40), `STRT_DT` DATETIME, `END_DT` DATETIME, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_CTZNSHP_T` PRIMARY KEY (`ENTITY_CTZNSHP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-133', '2.1.0-SNP', '3:131adc8e67ea1a9c881f1b0935e3b127', 902)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-134::unit-test::(Checksum: 3:2c9c0839476cc090edc5dde1a98ada47)
CREATE TABLE `krim_entity_email_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_EMAIL_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-134', '2.1.0-SNP', '3:2c9c0839476cc090edc5dde1a98ada47', 903)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-135::unit-test::(Checksum: 3:eccde359530276632b7774582e7e4d23)
CREATE TABLE `krim_entity_email_t` (`ENTITY_EMAIL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `ENT_TYP_CD` VARCHAR(40), `EMAIL_TYP_CD` VARCHAR(40), `EMAIL_ADDR` VARCHAR(200), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_EMAIL_T` PRIMARY KEY (`ENTITY_EMAIL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-135', '2.1.0-SNP', '3:eccde359530276632b7774582e7e4d23', 904)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-136::unit-test::(Checksum: 3:24b3dc66ddea5376a42ea0b6470511bb)
CREATE TABLE `krim_entity_emp_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_EMP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-136', '2.1.0-SNP', '3:24b3dc66ddea5376a42ea0b6470511bb', 905)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-137::unit-test::(Checksum: 3:b3b7900c81b034df9fd4e9dd55c85b35)
CREATE TABLE `krim_entity_emp_info_t` (`ENTITY_EMP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `ENTITY_AFLTN_ID` VARCHAR(40), `EMP_STAT_CD` VARCHAR(40), `EMP_TYP_CD` VARCHAR(40), `BASE_SLRY_AMT` DECIMAL(15,2), `PRMRY_IND` VARCHAR(1), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, `PRMRY_DEPT_CD` VARCHAR(40), `EMP_ID` VARCHAR(40), `EMP_REC_ID` VARCHAR(40), CONSTRAINT `PK_KRIM_ENTITY_EMP_INFO_T` PRIMARY KEY (`ENTITY_EMP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-137', '2.1.0-SNP', '3:b3b7900c81b034df9fd4e9dd55c85b35', 906)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-138::unit-test::(Checksum: 3:bb4d55843b5301675dd36ccf26629353)
CREATE TABLE `krim_entity_ent_typ_t` (`ENT_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `ENTITY_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-138', '2.1.0-SNP', '3:bb4d55843b5301675dd36ccf26629353', 907)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-139::unit-test::(Checksum: 3:3db148b17bd0a90f11a40d1b72cc1cc5)
CREATE TABLE `krim_entity_ethnic_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_ETHNIC_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-139', '2.1.0-SNP', '3:3db148b17bd0a90f11a40d1b72cc1cc5', 908)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-140::unit-test::(Checksum: 3:f86b9e95984fc40c1c23b26a974c143a)
CREATE TABLE `krim_entity_ethnic_t` (`ID` VARCHAR(40) DEFAULT '' NOT NULL, `ENTITY_ID` VARCHAR(40), `ETHNCTY_CD` VARCHAR(40), `SUB_ETHNCTY_CD` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_ETHNIC_T` PRIMARY KEY (`ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-140', '2.1.0-SNP', '3:f86b9e95984fc40c1c23b26a974c143a', 909)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-141::unit-test::(Checksum: 3:297c34b833852ce6697ab195e0794060)
CREATE TABLE `krim_entity_ext_id_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_EXT_ID_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-141', '2.1.0-SNP', '3:297c34b833852ce6697ab195e0794060', 910)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-142::unit-test::(Checksum: 3:b1beb91e98c900b8ec364e532ade98cd)
CREATE TABLE `krim_entity_ext_id_t` (`ENTITY_EXT_ID_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `EXT_ID_TYP_CD` VARCHAR(40), `EXT_ID` VARCHAR(100), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_EXT_ID_T` PRIMARY KEY (`ENTITY_EXT_ID_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-142', '2.1.0-SNP', '3:b1beb91e98c900b8ec364e532ade98cd', 911)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-143::unit-test::(Checksum: 3:294b7681a870568a51c53afc8d0fc14a)
CREATE TABLE `krim_entity_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-143', '2.1.0-SNP', '3:294b7681a870568a51c53afc8d0fc14a', 912)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-144::unit-test::(Checksum: 3:cea5bf1435dc6b20c7926098de0b3143)
CREATE TABLE `krim_entity_nm_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_NM_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-144', '2.1.0-SNP', '3:cea5bf1435dc6b20c7926098de0b3143', 913)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-145::unit-test::(Checksum: 3:28b341a414c6686cb9e1e402647bdedd)
CREATE TABLE `krim_entity_nm_t` (`ENTITY_NM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `NM_TYP_CD` VARCHAR(40), `FIRST_NM` VARCHAR(40), `MIDDLE_NM` VARCHAR(40), `LAST_NM` VARCHAR(80), `SUFFIX_NM` VARCHAR(20), `TITLE_NM` VARCHAR(20), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_NM_T` PRIMARY KEY (`ENTITY_NM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-145', '2.1.0-SNP', '3:28b341a414c6686cb9e1e402647bdedd', 914)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-146::unit-test::(Checksum: 3:4a4f0f732c658f468b153299ac44b366)
CREATE TABLE `krim_entity_phone_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_PHONE_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-146', '2.1.0-SNP', '3:4a4f0f732c658f468b153299ac44b366', 915)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-147::unit-test::(Checksum: 3:9ce4a955e31d8d3f16f6f9fb3b5c0420)
CREATE TABLE `krim_entity_phone_t` (`ENTITY_PHONE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_ID` VARCHAR(40), `ENT_TYP_CD` VARCHAR(40), `PHONE_TYP_CD` VARCHAR(40), `PHONE_NBR` VARCHAR(20), `PHONE_EXTN_NBR` VARCHAR(8), `POSTAL_CNTRY_CD` VARCHAR(2), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_PHONE_T` PRIMARY KEY (`ENTITY_PHONE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-147', '2.1.0-SNP', '3:9ce4a955e31d8d3f16f6f9fb3b5c0420', 916)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-148::unit-test::(Checksum: 3:7f8c20a2a7efa7b89925b1bf9f803b72)
CREATE TABLE `krim_entity_priv_pref_t` (`ENTITY_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `SUPPRESS_NM_IND` VARCHAR(1) DEFAULT 'N', `SUPPRESS_EMAIL_IND` VARCHAR(1) DEFAULT 'Y', `SUPPRESS_ADDR_IND` VARCHAR(1) DEFAULT 'Y', `SUPPRESS_PHONE_IND` VARCHAR(1) DEFAULT 'Y', `SUPPRESS_PRSNL_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_PRIV_PREF_T` PRIMARY KEY (`ENTITY_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-148', '2.1.0-SNP', '3:7f8c20a2a7efa7b89925b1bf9f803b72', 917)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-149::unit-test::(Checksum: 3:e83512316948b68064b07ac9c57e4b48)
CREATE TABLE `krim_entity_residency_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_RESIDENCY_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-149', '2.1.0-SNP', '3:e83512316948b68064b07ac9c57e4b48', 918)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-150::unit-test::(Checksum: 3:e0ee777d168be74a54920262bf1215e8)
CREATE TABLE `krim_entity_residency_t` (`ID` VARCHAR(40) DEFAULT '' NOT NULL, `ENTITY_ID` VARCHAR(40), `DETERMINATION_METHOD` VARCHAR(40), `IN_STATE` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_RESIDENCY_T` PRIMARY KEY (`ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-150', '2.1.0-SNP', '3:e0ee777d168be74a54920262bf1215e8', 919)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-151::unit-test::(Checksum: 3:a3a1647ceb0f994d925bf43ebd9b60b8)
CREATE TABLE `krim_entity_t` (`ENTITY_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ENTITY_T` PRIMARY KEY (`ENTITY_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-151', '2.1.0-SNP', '3:a3a1647ceb0f994d925bf43ebd9b60b8', 920)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-152::unit-test::(Checksum: 3:244f09dbccc6d2a6d17256f9c4269d9c)
CREATE TABLE `krim_entity_visa_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_VISA_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-152', '2.1.0-SNP', '3:244f09dbccc6d2a6d17256f9c4269d9c', 921)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-153::unit-test::(Checksum: 3:04725e7b42d5767d30c67fd7c5bdee9c)
CREATE TABLE `krim_entity_visa_t` (`ID` VARCHAR(40) DEFAULT '' NOT NULL, `ENTITY_ID` VARCHAR(40), `VISA_TYPE_KEY` VARCHAR(40), `VISA_ENTRY` VARCHAR(40), `VISA_ID` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, CONSTRAINT `PK_KRIM_ENTITY_VISA_T` PRIMARY KEY (`ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-153', '2.1.0-SNP', '3:04725e7b42d5767d30c67fd7c5bdee9c', 922)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-154::unit-test::(Checksum: 3:3abd9a280f9283baea208d9cdfa04015)
CREATE TABLE `krim_ext_id_typ_t` (`EXT_ID_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(40), `ENCR_REQ_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_EXT_ID_TYP_T` PRIMARY KEY (`EXT_ID_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-154', '2.1.0-SNP', '3:3abd9a280f9283baea208d9cdfa04015', 923)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-155::unit-test::(Checksum: 3:25c293fd7e21d233e97dfbfef13e37f8)
CREATE TABLE `krim_grp_attr_data_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_GRP_ATTR_DATA_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-155', '2.1.0-SNP', '3:25c293fd7e21d233e97dfbfef13e37f8', 924)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-156::unit-test::(Checksum: 3:6b847d496f18056e0ca55f4d511183e0)
CREATE TABLE `krim_grp_attr_data_t` (`ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `GRP_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), CONSTRAINT `PK_KRIM_GRP_ATTR_DATA_T` PRIMARY KEY (`ATTR_DATA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-156', '2.1.0-SNP', '3:6b847d496f18056e0ca55f4d511183e0', 925)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-157::unit-test::(Checksum: 3:a341640b1ad723f55135bb8de28a2376)
CREATE TABLE `krim_grp_document_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `GRP_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `KIM_TYP_ID` VARCHAR(40) NOT NULL, `GRP_NMSPC` VARCHAR(100) NOT NULL, `GRP_NM` VARCHAR(400), `GRP_DESC` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_GRP_DOCUMENT_T` PRIMARY KEY (`FDOC_NBR`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-157', '2.1.0-SNP', '3:a341640b1ad723f55135bb8de28a2376', 926)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-158::unit-test::(Checksum: 3:952da8a9822a4a6540915a7e4cb998b2)
CREATE TABLE `krim_grp_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_GRP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-158', '2.1.0-SNP', '3:952da8a9822a4a6540915a7e4cb998b2', 927)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-159::unit-test::(Checksum: 3:9a55188c4b0fb9749f279b1827c8ca37)
CREATE TABLE `krim_grp_mbr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_GRP_MBR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-159', '2.1.0-SNP', '3:9a55188c4b0fb9749f279b1827c8ca37', 928)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-160::unit-test::(Checksum: 3:622e0dadb586f5c09d23c67956b8e36d)
CREATE TABLE `krim_grp_mbr_t` (`GRP_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `GRP_ID` VARCHAR(40), `MBR_ID` VARCHAR(40), `MBR_TYP_CD` CHAR(1) DEFAULT 'P', `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_GRP_MBR_T` PRIMARY KEY (`GRP_MBR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-160', '2.1.0-SNP', '3:622e0dadb586f5c09d23c67956b8e36d', 929)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-161::unit-test::(Checksum: 3:d6bf4b77502c2d6a6abab9d77bdd7597)
CREATE TABLE `krim_grp_t` (`GRP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `GRP_NM` VARCHAR(80) NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `GRP_DESC` VARCHAR(4000), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_GRP_T` PRIMARY KEY (`GRP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-161', '2.1.0-SNP', '3:d6bf4b77502c2d6a6abab9d77bdd7597', 930)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-162::unit-test::(Checksum: 3:d66b6410648a057b3c95ba675355a633)
CREATE TABLE `krim_perm_attr_data_t` (`ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PERM_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), CONSTRAINT `PK_KRIM_PERM_ATTR_DATA_T` PRIMARY KEY (`ATTR_DATA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-162', '2.1.0-SNP', '3:d66b6410648a057b3c95ba675355a633', 931)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-163::unit-test::(Checksum: 3:1f4915f1276c80257198776bd53036cf)
CREATE TABLE `krim_perm_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_PERM_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-163', '2.1.0-SNP', '3:1f4915f1276c80257198776bd53036cf', 932)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-164::unit-test::(Checksum: 3:63df622aea42aad735f0fc6fc140809c)
CREATE TABLE `krim_perm_rqrd_attr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_PERM_RQRD_ATTR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-164', '2.1.0-SNP', '3:63df622aea42aad735f0fc6fc140809c', 933)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-165::unit-test::(Checksum: 3:16495a74f676484f3c2db140657cc3f6)
CREATE TABLE `krim_perm_t` (`PERM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PERM_TMPL_ID` VARCHAR(40), `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `DESC_TXT` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_PERM_T` PRIMARY KEY (`PERM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-165', '2.1.0-SNP', '3:16495a74f676484f3c2db140657cc3f6', 934)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-166::unit-test::(Checksum: 3:d60291296b5c54bbace35ae32916a6ac)
CREATE TABLE `krim_perm_tmpl_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_PERM_TMPL_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-166', '2.1.0-SNP', '3:d60291296b5c54bbace35ae32916a6ac', 935)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-167::unit-test::(Checksum: 3:e4e2a1266a5b275bef71ddc4b3bc4ba9)
CREATE TABLE `krim_perm_tmpl_t` (`PERM_TMPL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `DESC_TXT` VARCHAR(400), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_PERM_TMPL_T` PRIMARY KEY (`PERM_TMPL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-167', '2.1.0-SNP', '3:e4e2a1266a5b275bef71ddc4b3bc4ba9', 936)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-168::unit-test::(Checksum: 3:4ec60cada3aafb374f21096e06a2b524)
CREATE TABLE `krim_person_document_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ENTITY_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `PRNCPL_NM` VARCHAR(100) NOT NULL, `PRNCPL_PSWD` VARCHAR(400), `UNIV_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_PERSON_DOCUMENT_T` PRIMARY KEY (`FDOC_NBR`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-168', '2.1.0-SNP', '3:4ec60cada3aafb374f21096e06a2b524', 937)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-169::unit-test::(Checksum: 3:ca41e7e14569958282c705dcc933f097)
CREATE TABLE `krim_phone_typ_t` (`PHONE_TYP_CD` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PHONE_TYP_NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DISPLAY_SORT_CD` VARCHAR(2), `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_PHONE_TYP_T` PRIMARY KEY (`PHONE_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-169', '2.1.0-SNP', '3:ca41e7e14569958282c705dcc933f097', 938)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-170::unit-test::(Checksum: 3:01c1efeec8a62362f7d51489d28c354c)
CREATE TABLE `krim_pnd_addr_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ADDR_TYP_CD` VARCHAR(40), `ADDR_LINE_1` VARCHAR(50), `ADDR_LINE_2` VARCHAR(50), `ADDR_LINE_3` VARCHAR(50), `CITY_NM` VARCHAR(30), `POSTAL_STATE_CD` VARCHAR(2), `POSTAL_CD` VARCHAR(20), `POSTAL_CNTRY_CD` VARCHAR(2), `DISPLAY_SORT_CD` VARCHAR(2), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `ENTITY_ADDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-170', '2.1.0-SNP', '3:01c1efeec8a62362f7d51489d28c354c', 939)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-171::unit-test::(Checksum: 3:9f8603eb5ff5401e3ad7f42f068084f6)
CREATE TABLE `krim_pnd_afltn_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ENTITY_AFLTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `AFLTN_TYP_CD` VARCHAR(40), `CAMPUS_CD` VARCHAR(2), `EDIT_FLAG` VARCHAR(1) DEFAULT 'N', `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-171', '2.1.0-SNP', '3:9f8603eb5ff5401e3ad7f42f068084f6', 940)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-172::unit-test::(Checksum: 3:d2c445b94c1a9333d9de3549d6489de4)
CREATE TABLE `krim_pnd_ctznshp_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ENTITY_CTZNSHP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `POSTAL_CNTRY_CD` VARCHAR(2), `CTZNSHP_STAT_CD` VARCHAR(40), `STRT_DT` DATETIME, `END_DT` DATETIME, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-172', '2.1.0-SNP', '3:d2c445b94c1a9333d9de3549d6489de4', 941)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-173::unit-test::(Checksum: 3:f1d39378f0c0ed7d5e679e9b6a6f0db8)
CREATE TABLE `krim_pnd_dlgn_mbr_attr_data_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `DLGN_MBR_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40), `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-173', '2.1.0-SNP', '3:f1d39378f0c0ed7d5e679e9b6a6f0db8', 942)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-174::unit-test::(Checksum: 3:3d326d217d7314e5836bbc4d46535c32)
CREATE TABLE `krim_pnd_dlgn_mbr_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `DLGN_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `DLGN_ID` VARCHAR(40) NOT NULL, `MBR_ID` VARCHAR(40), `MBR_NM` VARCHAR(40), `MBR_TYP_CD` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, `ROLE_MBR_ID` VARCHAR(40))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-174', '2.1.0-SNP', '3:3d326d217d7314e5836bbc4d46535c32', 943)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-175::unit-test::(Checksum: 3:e507c332ead2bf924f64ed48a4acf5ef)
CREATE TABLE `krim_pnd_dlgn_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `DLGN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `ROLE_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `KIM_TYP_ID` VARCHAR(40), `DLGN_TYP_CD` VARCHAR(100) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-175', '2.1.0-SNP', '3:e507c332ead2bf924f64ed48a4acf5ef', 944)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-176::unit-test::(Checksum: 3:250c20654c9f32a6e15b114f10192f7f)
CREATE TABLE `krim_pnd_email_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ENTITY_EMAIL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENT_TYP_CD` VARCHAR(40), `EMAIL_TYP_CD` VARCHAR(40), `EMAIL_ADDR` VARCHAR(200), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-176', '2.1.0-SNP', '3:250c20654c9f32a6e15b114f10192f7f', 945)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-177::unit-test::(Checksum: 3:287cc6cc0d8b7a128a98b1a631acb46a)
CREATE TABLE `krim_pnd_emp_info_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `PRMRY_DEPT_CD` VARCHAR(40), `ENTITY_EMP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `EMP_ID` VARCHAR(40), `EMP_REC_ID` VARCHAR(40), `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENTITY_AFLTN_ID` VARCHAR(40), `EMP_STAT_CD` VARCHAR(40), `EMP_TYP_CD` VARCHAR(40), `BASE_SLRY_AMT` DECIMAL(15,2), `PRMRY_IND` VARCHAR(1), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-177', '2.1.0-SNP', '3:287cc6cc0d8b7a128a98b1a631acb46a', 946)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-178::unit-test::(Checksum: 3:8d1d3334ab1c4ac03a92e0aa9b312b91)
CREATE TABLE `krim_pnd_grp_attr_data_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `GRP_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40), `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-178', '2.1.0-SNP', '3:8d1d3334ab1c4ac03a92e0aa9b312b91', 947)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-179::unit-test::(Checksum: 3:603efee3f0afba12b8de18e1daa4765f)
CREATE TABLE `krim_pnd_grp_mbr_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `GRP_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `GRP_ID` VARCHAR(40) NOT NULL, `MBR_ID` VARCHAR(40), `MBR_NM` VARCHAR(40), `MBR_TYP_CD` VARCHAR(40) NOT NULL, `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-179', '2.1.0-SNP', '3:603efee3f0afba12b8de18e1daa4765f', 948)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-180::unit-test::(Checksum: 3:7f789f9549a19553c010631996063bc4)
CREATE TABLE `krim_pnd_grp_prncpl_mt` (`GRP_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `GRP_ID` VARCHAR(40) NOT NULL, `PRNCPL_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `GRP_NM` VARCHAR(80) NOT NULL, `GRP_TYPE` VARCHAR(80), `KIM_TYP_ID` VARCHAR(40), `NMSPC_CD` VARCHAR(40), `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-180', '2.1.0-SNP', '3:7f789f9549a19553c010631996063bc4', 949)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-181::unit-test::(Checksum: 3:7a6d5d19e9cf3cd1243085c56d812450)
CREATE TABLE `krim_pnd_nm_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ENTITY_NM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM_TYP_CD` VARCHAR(40), `FIRST_NM` VARCHAR(40), `MIDDLE_NM` VARCHAR(40), `LAST_NM` VARCHAR(80), `SUFFIX_NM` VARCHAR(20), `TITLE_NM` VARCHAR(20), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-181', '2.1.0-SNP', '3:7a6d5d19e9cf3cd1243085c56d812450', 950)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-182::unit-test::(Checksum: 3:1ad5b0ebc2a6ee76899d0f7bdd4753e9)
CREATE TABLE `krim_pnd_phone_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ENTITY_PHONE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ENT_TYP_CD` VARCHAR(40), `PHONE_TYP_CD` VARCHAR(40), `PHONE_NBR` VARCHAR(20), `PHONE_EXTN_NBR` VARCHAR(8), `POSTAL_CNTRY_CD` VARCHAR(2), `DFLT_IND` VARCHAR(1) DEFAULT 'N', `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-182', '2.1.0-SNP', '3:1ad5b0ebc2a6ee76899d0f7bdd4753e9', 951)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-183::unit-test::(Checksum: 3:9558c499fba59aa63dcac1626d21fbe0)
CREATE TABLE `krim_pnd_priv_pref_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `SUPPRESS_NM_IND` VARCHAR(1) DEFAULT 'N', `SUPPRESS_EMAIL_IND` VARCHAR(1) DEFAULT 'Y', `SUPPRESS_ADDR_IND` VARCHAR(1) DEFAULT 'Y', `SUPPRESS_PHONE_IND` VARCHAR(1) DEFAULT 'Y', `SUPPRESS_PRSNL_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N', CONSTRAINT `PK_KRIM_PND_PRIV_PREF_MT` PRIMARY KEY (`FDOC_NBR`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-183', '2.1.0-SNP', '3:9558c499fba59aa63dcac1626d21fbe0', 952)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-184::unit-test::(Checksum: 3:1814a5374388d7336210779f209a6396)
CREATE TABLE `krim_pnd_role_mbr_attr_data_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_MBR_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40), `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-184', '2.1.0-SNP', '3:1814a5374388d7336210779f209a6396', 953)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-185::unit-test::(Checksum: 3:ba46045b7c680061c00f5960bb6a29cf)
CREATE TABLE `krim_pnd_role_mbr_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ROLE_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_ID` VARCHAR(40) NOT NULL, `MBR_ID` VARCHAR(40), `MBR_TYP_CD` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-185', '2.1.0-SNP', '3:ba46045b7c680061c00f5960bb6a29cf', 954)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-186::unit-test::(Checksum: 3:038c54e1c9841c79440be9a776e470c1)
CREATE TABLE `krim_pnd_role_mt` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ROLE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_NM` VARCHAR(100) NOT NULL, `KIM_TYP_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `NMSPC_CD` VARCHAR(40), `EDIT_FLAG` VARCHAR(1) DEFAULT 'N')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-186', '2.1.0-SNP', '3:038c54e1c9841c79440be9a776e470c1', 955)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-187::unit-test::(Checksum: 3:6f73224f7660df31bd72b1eec51f8c0e)
CREATE TABLE `krim_pnd_role_perm_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ROLE_PERM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_ID` VARCHAR(40) NOT NULL, `PERM_ID` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-187', '2.1.0-SNP', '3:6f73224f7660df31bd72b1eec51f8c0e', 956)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-188::unit-test::(Checksum: 3:0879b95c97f589f7b29654fdbffecc99)
CREATE TABLE `krim_pnd_role_rsp_actn_mt` (`ROLE_RSP_ACTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ACTN_TYP_CD` VARCHAR(40), `PRIORITY_NBR` DECIMAL(3,0), `ACTN_PLCY_CD` VARCHAR(40), `ROLE_MBR_ID` VARCHAR(40), `ROLE_RSP_ID` VARCHAR(40), `EDIT_FLAG` VARCHAR(1) DEFAULT 'N', `FRC_ACTN` VARCHAR(1))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-188', '2.1.0-SNP', '3:0879b95c97f589f7b29654fdbffecc99', 957)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-189::unit-test::(Checksum: 3:864ef5239f3187bc6fe59865dfdae0ba)
CREATE TABLE `krim_pnd_role_rsp_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ROLE_RSP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_ID` VARCHAR(40) NOT NULL, `RSP_ID` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y')
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-189', '2.1.0-SNP', '3:864ef5239f3187bc6fe59865dfdae0ba', 958)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-190::unit-test::(Checksum: 3:04e92518080049d92a4f264c3c5ed64d)
CREATE TABLE `krim_prncpl_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_PRNCPL_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-190', '2.1.0-SNP', '3:04e92518080049d92a4f264c3c5ed64d', 959)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-191::unit-test::(Checksum: 3:b6200ed8a3a04bdde02d42023030acc5)
CREATE TABLE `krim_prncpl_t` (`PRNCPL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PRNCPL_NM` VARCHAR(100) NOT NULL, `ENTITY_ID` VARCHAR(40), `PRNCPL_PSWD` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_PRNCPL_T` PRIMARY KEY (`PRNCPL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-191', '2.1.0-SNP', '3:b6200ed8a3a04bdde02d42023030acc5', 960)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-192::unit-test::(Checksum: 3:42753146353d48cb6c1c2134b3044fff)
CREATE TABLE `krim_role_document_t` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ROLE_ID` VARCHAR(40) NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_TYP_ID` VARCHAR(40) NOT NULL, `ROLE_NMSPC` VARCHAR(100) NOT NULL, `ROLE_NM` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `DESC_TXT` VARCHAR(4000), CONSTRAINT `PK_KRIM_ROLE_DOCUMENT_T` PRIMARY KEY (`FDOC_NBR`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-192', '2.1.0-SNP', '3:42753146353d48cb6c1c2134b3044fff', 961)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-193::unit-test::(Checksum: 3:37f00f9fb4522b91d622d39d650ea255)
CREATE TABLE `krim_role_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ROLE_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-193', '2.1.0-SNP', '3:37f00f9fb4522b91d622d39d650ea255', 962)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-194::unit-test::(Checksum: 3:89d832741dd6c95956ca4b1b18a1954f)
CREATE TABLE `krim_role_mbr_attr_data_t` (`ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_MBR_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), CONSTRAINT `PK_KRIM_ROLE_MBR_ATTR_DATA_T` PRIMARY KEY (`ATTR_DATA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-194', '2.1.0-SNP', '3:89d832741dd6c95956ca4b1b18a1954f', 963)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-195::unit-test::(Checksum: 3:b093153764dc2dc80090a3e7da5fe7e4)
CREATE TABLE `krim_role_mbr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ROLE_MBR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-195', '2.1.0-SNP', '3:b093153764dc2dc80090a3e7da5fe7e4', 964)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-196::unit-test::(Checksum: 3:2a17e6ce3eff381d61e72c90da6d3a64)
CREATE TABLE `krim_role_mbr_t` (`ROLE_MBR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `ROLE_ID` VARCHAR(40), `MBR_ID` VARCHAR(40), `MBR_TYP_CD` CHAR(1) DEFAULT 'P', `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ROLE_MBR_T` PRIMARY KEY (`ROLE_MBR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-196', '2.1.0-SNP', '3:2a17e6ce3eff381d61e72c90da6d3a64', 965)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-197::unit-test::(Checksum: 3:4b5b24d4422f62a1484617393b6b2b26)
CREATE TABLE `krim_role_perm_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ROLE_PERM_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-197', '2.1.0-SNP', '3:4b5b24d4422f62a1484617393b6b2b26', 966)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-198::unit-test::(Checksum: 3:1667ac3b120049ca7c9f581a4f2ae752)
CREATE TABLE `krim_role_perm_t` (`ROLE_PERM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_ID` VARCHAR(40), `PERM_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_ROLE_PERM_T` PRIMARY KEY (`ROLE_PERM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-198', '2.1.0-SNP', '3:1667ac3b120049ca7c9f581a4f2ae752', 967)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-199::unit-test::(Checksum: 3:b4b467d5234fbe984597e355450cb2fc)
CREATE TABLE `krim_role_rsp_actn_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ROLE_RSP_ACTN_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-199', '2.1.0-SNP', '3:b4b467d5234fbe984597e355450cb2fc', 968)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-200::unit-test::(Checksum: 3:bc11d0c0ad960986a34a634bc387466e)
CREATE TABLE `krim_role_rsp_actn_t` (`ROLE_RSP_ACTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ACTN_TYP_CD` VARCHAR(40), `PRIORITY_NBR` DECIMAL(3,0), `ACTN_PLCY_CD` VARCHAR(40), `ROLE_MBR_ID` VARCHAR(40), `ROLE_RSP_ID` VARCHAR(40), `FRC_ACTN` VARCHAR(1) DEFAULT 'N', CONSTRAINT `PK_KRIM_ROLE_RSP_ACTN_T` PRIMARY KEY (`ROLE_RSP_ACTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-200', '2.1.0-SNP', '3:bc11d0c0ad960986a34a634bc387466e', 969)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-201::unit-test::(Checksum: 3:9aa82bc30b63846ccee470cbd1488f82)
CREATE TABLE `krim_role_rsp_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_ROLE_RSP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-201', '2.1.0-SNP', '3:9aa82bc30b63846ccee470cbd1488f82', 970)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-202::unit-test::(Checksum: 3:8e1403647ea4e4eaa6a7aa8d738084fe)
CREATE TABLE `krim_role_rsp_t` (`ROLE_RSP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_ID` VARCHAR(40), `RSP_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_ROLE_RSP_T` PRIMARY KEY (`ROLE_RSP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-202', '2.1.0-SNP', '3:8e1403647ea4e4eaa6a7aa8d738084fe', 971)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-203::unit-test::(Checksum: 3:0ec2fe3d7a5366dededf5bc6108b44a9)
CREATE TABLE `krim_role_t` (`ROLE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ROLE_NM` VARCHAR(80) NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `DESC_TXT` VARCHAR(4000), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `LAST_UPDT_DT` DATETIME, CONSTRAINT `PK_KRIM_ROLE_T` PRIMARY KEY (`ROLE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-203', '2.1.0-SNP', '3:0ec2fe3d7a5366dededf5bc6108b44a9', 972)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-204::unit-test::(Checksum: 3:401c884bf6af6b173cd77e3526ab0362)
CREATE TABLE `krim_rsp_attr_data_t` (`ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `RSP_ID` VARCHAR(40), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `KIM_ATTR_DEFN_ID` VARCHAR(40), `ATTR_VAL` VARCHAR(400), CONSTRAINT `PK_KRIM_RSP_ATTR_DATA_T` PRIMARY KEY (`ATTR_DATA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-204', '2.1.0-SNP', '3:401c884bf6af6b173cd77e3526ab0362', 973)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-205::unit-test::(Checksum: 3:836b9188d2def5e852c2668da19b9f46)
CREATE TABLE `krim_rsp_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_RSP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-205', '2.1.0-SNP', '3:836b9188d2def5e852c2668da19b9f46', 974)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-206::unit-test::(Checksum: 3:236fc60e870335c8ef2c10d065e3db1b)
CREATE TABLE `krim_rsp_rqrd_attr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_RSP_RQRD_ATTR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-206', '2.1.0-SNP', '3:236fc60e870335c8ef2c10d065e3db1b', 975)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-207::unit-test::(Checksum: 3:a42dfd4c77269c2796bbb4abcd09c2e7)
CREATE TABLE `krim_rsp_t` (`RSP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `RSP_TMPL_ID` VARCHAR(40), `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `DESC_TXT` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_RSP_T` PRIMARY KEY (`RSP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-207', '2.1.0-SNP', '3:a42dfd4c77269c2796bbb4abcd09c2e7', 976)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-208::unit-test::(Checksum: 3:1f3bfa69a567e5b5f762734330b41328)
CREATE TABLE `krim_rsp_tmpl_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_RSP_TMPL_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-208', '2.1.0-SNP', '3:1f3bfa69a567e5b5f762734330b41328', 977)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-209::unit-test::(Checksum: 3:60b3b215c7310f91951c59f62250e708)
CREATE TABLE `krim_rsp_tmpl_t` (`RSP_TMPL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `KIM_TYP_ID` VARCHAR(100) NOT NULL, `DESC_TXT` VARCHAR(400), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_RSP_TMPL_T` PRIMARY KEY (`RSP_TMPL_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-209', '2.1.0-SNP', '3:60b3b215c7310f91951c59f62250e708', 978)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-210::unit-test::(Checksum: 3:d5c3af2a6f68b11609fa7016b7cf8e54)
CREATE TABLE `krim_typ_attr_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_TYP_ATTR_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-210', '2.1.0-SNP', '3:d5c3af2a6f68b11609fa7016b7cf8e54', 979)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-211::unit-test::(Checksum: 3:5e843015a2f633b5be791cd8003eac34)
CREATE TABLE `krim_typ_attr_t` (`KIM_TYP_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `SORT_CD` VARCHAR(2), `KIM_TYP_ID` VARCHAR(40) NOT NULL, `KIM_ATTR_DEFN_ID` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', CONSTRAINT `PK_KRIM_TYP_ATTR_T` PRIMARY KEY (`KIM_TYP_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-211', '2.1.0-SNP', '3:5e843015a2f633b5be791cd8003eac34', 980)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-212::unit-test::(Checksum: 3:54934a605555aeea13cb4a58e0912a2b)
CREATE TABLE `krim_typ_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRIM_TYP_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-212', '2.1.0-SNP', '3:54934a605555aeea13cb4a58e0912a2b', 981)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-213::unit-test::(Checksum: 3:16309a2b869de1cc21dbb15deedcdd20)
CREATE TABLE `krim_typ_t` (`KIM_TYP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `NM` VARCHAR(100), `SRVC_NM` VARCHAR(200), `ACTV_IND` VARCHAR(1) DEFAULT 'Y', `NMSPC_CD` VARCHAR(40), CONSTRAINT `PK_KRIM_TYP_T` PRIMARY KEY (`KIM_TYP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-213', '2.1.0-SNP', '3:16309a2b869de1cc21dbb15deedcdd20', 982)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-214::unit-test::(Checksum: 3:42c6a7dfd8b420705f85807b483f426d)
CREATE TABLE `krlc_cmp_t` (`CAMPUS_CD` VARCHAR(2) DEFAULT '' NOT NULL, `CAMPUS_NM` VARCHAR(250), `CAMPUS_SHRT_NM` VARCHAR(250), `CAMPUS_TYP_CD` VARCHAR(1), `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y' NOT NULL, CONSTRAINT `PK_KRLC_CMP_T` PRIMARY KEY (`CAMPUS_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-214', '2.1.0-SNP', '3:42c6a7dfd8b420705f85807b483f426d', 983)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-215::unit-test::(Checksum: 3:0231b9958ab6daa9db81aeb7fe12ee03)
CREATE TABLE `krlc_cmp_typ_t` (`CAMPUS_TYP_CD` VARCHAR(1) DEFAULT '' NOT NULL, `CMP_TYP_NM` VARCHAR(250), `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y' NOT NULL, CONSTRAINT `PK_KRLC_CMP_TYP_T` PRIMARY KEY (`CAMPUS_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-215', '2.1.0-SNP', '3:0231b9958ab6daa9db81aeb7fe12ee03', 984)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-216::unit-test::(Checksum: 3:7444daab5a88cd7474b82564b4368d72)
CREATE TABLE `krlc_cntry_t` (`POSTAL_CNTRY_CD` VARCHAR(2) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `POSTAL_CNTRY_NM` VARCHAR(40), `PSTL_CNTRY_RSTRC_IND` VARCHAR(1) NOT NULL, `ACTV_IND` VARCHAR(1) DEFAULT 'Y' NOT NULL, `ALT_POSTAL_CNTRY_CD` VARCHAR(3), CONSTRAINT `PK_KRLC_CNTRY_T` PRIMARY KEY (`POSTAL_CNTRY_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-216', '2.1.0-SNP', '3:7444daab5a88cd7474b82564b4368d72', 985)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-217::unit-test::(Checksum: 3:548960e87e23cb72eea80230b38c1e0c)
CREATE TABLE `krlc_cnty_t` (`COUNTY_CD` VARCHAR(10) DEFAULT '' NOT NULL, `STATE_CD` VARCHAR(2) DEFAULT '' NOT NULL, `POSTAL_CNTRY_CD` VARCHAR(2) DEFAULT 'US' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `COUNTY_NM` VARCHAR(100), `ACTV_IND` VARCHAR(1))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-217', '2.1.0-SNP', '3:548960e87e23cb72eea80230b38c1e0c', 986)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-218::unit-test::(Checksum: 3:032b312282511dd7b85d231fc69ad62b)
CREATE TABLE `krlc_pstl_cd_t` (`POSTAL_CD` VARCHAR(20) DEFAULT '' NOT NULL, `POSTAL_CNTRY_CD` VARCHAR(2) DEFAULT 'US' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `POSTAL_STATE_CD` VARCHAR(2), `COUNTY_CD` VARCHAR(10), `POSTAL_CITY_NM` VARCHAR(30), `ACTV_IND` VARCHAR(1) DEFAULT 'Y' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-218', '2.1.0-SNP', '3:032b312282511dd7b85d231fc69ad62b', 987)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-219::unit-test::(Checksum: 3:812a589156589bea34b299edbb9a6270)
CREATE TABLE `krlc_st_t` (`POSTAL_STATE_CD` VARCHAR(2) DEFAULT '' NOT NULL, `POSTAL_CNTRY_CD` VARCHAR(2) DEFAULT 'US' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `POSTAL_STATE_NM` VARCHAR(40), `ACTV_IND` VARCHAR(1) DEFAULT 'Y' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-219', '2.1.0-SNP', '3:812a589156589bea34b299edbb9a6270', 988)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-220::unit-test::(Checksum: 3:9c3b4e7959448bc0c49f7ddffdedc584)
CREATE TABLE `krms_actn_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_ACTN_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-220', '2.1.0-SNP', '3:9c3b4e7959448bc0c49f7ddffdedc584', 989)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-221::unit-test::(Checksum: 3:fe3f1dc4f0c16786b12475a3d72ea813)
CREATE TABLE `krms_actn_attr_t` (`ACTN_ATTR_DATA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `ACTN_ID` VARCHAR(40) NOT NULL, `ATTR_DEFN_ID` VARCHAR(40) NOT NULL, `ATTR_VAL` VARCHAR(400), `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_ACTN_ATTR_T` PRIMARY KEY (`ACTN_ATTR_DATA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-221', '2.1.0-SNP', '3:fe3f1dc4f0c16786b12475a3d72ea813', 990)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-222::unit-test::(Checksum: 3:1f62fe7d2357be5ec8e715f3e487a458)
CREATE TABLE `krms_actn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_ACTN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-222', '2.1.0-SNP', '3:1f62fe7d2357be5ec8e715f3e487a458', 991)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-223::unit-test::(Checksum: 3:26bd9a71269c8a132ca332953b67651b)
CREATE TABLE `krms_actn_t` (`ACTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(40), `DESC_TXT` VARCHAR(4000), `TYP_ID` VARCHAR(40) NOT NULL, `RULE_ID` VARCHAR(40), `SEQ_NO` DECIMAL(5,0), `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, CONSTRAINT `PK_KRMS_ACTN_T` PRIMARY KEY (`ACTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-223', '2.1.0-SNP', '3:26bd9a71269c8a132ca332953b67651b', 992)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-224::unit-test::(Checksum: 3:1e209ad68d1e2e8ed653fb4f6fba9938)
CREATE TABLE `krms_agenda_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_AGENDA_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-224', '2.1.0-SNP', '3:1e209ad68d1e2e8ed653fb4f6fba9938', 993)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-225::unit-test::(Checksum: 3:5c6a0eaeefb0c26e7627cbd02e83d272)
CREATE TABLE `krms_agenda_attr_t` (`AGENDA_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `AGENDA_ID` VARCHAR(40) NOT NULL, `ATTR_VAL` VARCHAR(400), `ATTR_DEFN_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_AGENDA_ATTR_T` PRIMARY KEY (`AGENDA_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-225', '2.1.0-SNP', '3:5c6a0eaeefb0c26e7627cbd02e83d272', 994)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-226::unit-test::(Checksum: 3:67c6932c142fb7af38ee298e58b704c2)
CREATE TABLE `krms_agenda_itm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_AGENDA_ITM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-226', '2.1.0-SNP', '3:67c6932c142fb7af38ee298e58b704c2', 995)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-227::unit-test::(Checksum: 3:33d95d1b2a968b5095de3e4c8abe666b)
CREATE TABLE `krms_agenda_itm_t` (`AGENDA_ITM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_ID` VARCHAR(40), `SUB_AGENDA_ID` VARCHAR(40), `AGENDA_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `WHEN_TRUE` VARCHAR(40), `WHEN_FALSE` VARCHAR(40), `ALWAYS` VARCHAR(40), CONSTRAINT `PK_KRMS_AGENDA_ITM_T` PRIMARY KEY (`AGENDA_ITM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-227', '2.1.0-SNP', '3:33d95d1b2a968b5095de3e4c8abe666b', 996)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-228::unit-test::(Checksum: 3:6f523c0410e5e516d94049f9b6462463)
CREATE TABLE `krms_agenda_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_AGENDA_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-228', '2.1.0-SNP', '3:6f523c0410e5e516d94049f9b6462463', 997)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-229::unit-test::(Checksum: 3:d762ec77daed17f3a2df1ea81325277b)
CREATE TABLE `krms_agenda_t` (`AGENDA_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(100) NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `INIT_AGENDA_ITM_ID` VARCHAR(40), `TYP_ID` VARCHAR(40) NOT NULL, `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_AGENDA_T` PRIMARY KEY (`AGENDA_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-229', '2.1.0-SNP', '3:d762ec77daed17f3a2df1ea81325277b', 998)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-230::unit-test::(Checksum: 3:6aaf82e7bd59b7858676b48f263d3b56)
CREATE TABLE `krms_attr_defn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_ATTR_DEFN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-230', '2.1.0-SNP', '3:6aaf82e7bd59b7858676b48f263d3b56', 999)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-231::unit-test::(Checksum: 3:013a162d37c7c9171683504e76d1e0c1)
CREATE TABLE `krms_attr_defn_t` (`ATTR_DEFN_ID` VARCHAR(255) DEFAULT '' NOT NULL, `NM` VARCHAR(100) NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `LBL` VARCHAR(40), `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `CMPNT_NM` VARCHAR(100), `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `DESC_TXT` VARCHAR(255), CONSTRAINT `PK_KRMS_ATTR_DEFN_T` PRIMARY KEY (`ATTR_DEFN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-231', '2.1.0-SNP', '3:013a162d37c7c9171683504e76d1e0c1', 1000)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-232::unit-test::(Checksum: 3:a4e0526cd882cae8e2662ab6239a6e5a)
CREATE TABLE `krms_cmpnd_prop_props_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CMPND_PROP_PROPS_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-232', '2.1.0-SNP', '3:a4e0526cd882cae8e2662ab6239a6e5a', 1001)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-233::unit-test::(Checksum: 3:6a9d26a7b04eba33d57a734cbb50f115)
CREATE TABLE `krms_cmpnd_prop_props_t` (`CMPND_PROP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PROP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `SEQ_NO` DECIMAL(5,0) NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-233', '2.1.0-SNP', '3:6a9d26a7b04eba33d57a734cbb50f115', 1002)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-234::unit-test::(Checksum: 3:80d5cd83ebb37debfc1425c84b5094bc)
CREATE TABLE `krms_cntxt_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-234', '2.1.0-SNP', '3:80d5cd83ebb37debfc1425c84b5094bc', 1003)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-235::unit-test::(Checksum: 3:b19c082d732c861a432ac33477d15f43)
CREATE TABLE `krms_cntxt_attr_t` (`CNTXT_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `ATTR_VAL` VARCHAR(400), `ATTR_DEFN_ID` VARCHAR(40), `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_ATTR_T` PRIMARY KEY (`CNTXT_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-235', '2.1.0-SNP', '3:b19c082d732c861a432ac33477d15f43', 1004)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-236::unit-test::(Checksum: 3:c986ad25fa870a6ebfdd3e9756209bca)
CREATE TABLE `krms_cntxt_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-236', '2.1.0-SNP', '3:c986ad25fa870a6ebfdd3e9756209bca', 1005)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-237::unit-test::(Checksum: 3:25913563eddf32a7e609e99ab7da1aa7)
CREATE TABLE `krms_cntxt_t` (`CNTXT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `TYP_ID` VARCHAR(40) NOT NULL, `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `DESC_TXT` VARCHAR(255), CONSTRAINT `PK_KRMS_CNTXT_T` PRIMARY KEY (`CNTXT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-237', '2.1.0-SNP', '3:25913563eddf32a7e609e99ab7da1aa7', 1006)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-238::unit-test::(Checksum: 3:163864657c9697e75be674734beb5ab9)
CREATE TABLE `krms_cntxt_term_spec_prereq_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_TERM_SPEC_PREREQ_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-238', '2.1.0-SNP', '3:163864657c9697e75be674734beb5ab9', 1007)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-239::unit-test::(Checksum: 3:4093ee18c8b745f27cd117b4f4644fbf)
CREATE TABLE `krms_cntxt_vld_actn_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_ACTN_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-239', '2.1.0-SNP', '3:4093ee18c8b745f27cd117b4f4644fbf', 1008)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-240::unit-test::(Checksum: 3:b18a23335bd53245411041a166b9f607)
CREATE TABLE `krms_cntxt_vld_actn_t` (`CNTXT_VLD_ACTN_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `ACTN_TYP_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_ACTN_T` PRIMARY KEY (`CNTXT_VLD_ACTN_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-240', '2.1.0-SNP', '3:b18a23335bd53245411041a166b9f607', 1009)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-241::unit-test::(Checksum: 3:17b72f091e2cdd5820e99b7d29c455d9)
CREATE TABLE `krms_cntxt_vld_event_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_EVENT_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-241', '2.1.0-SNP', '3:17b72f091e2cdd5820e99b7d29c455d9', 1010)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-242::unit-test::(Checksum: 3:cadc49f7674495baa994a16e860609e3)
CREATE TABLE `krms_cntxt_vld_event_t` (`CNTXT_VLD_EVENT_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `EVENT_NM` VARCHAR(255) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_EVENT_T` PRIMARY KEY (`CNTXT_VLD_EVENT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-242', '2.1.0-SNP', '3:cadc49f7674495baa994a16e860609e3', 1011)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-243::unit-test::(Checksum: 3:adcb187ac66132f6c49d6f88c3a2f0fc)
CREATE TABLE `krms_cntxt_vld_func_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_FUNC_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-243', '2.1.0-SNP', '3:adcb187ac66132f6c49d6f88c3a2f0fc', 1012)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-244::unit-test::(Checksum: 3:a01e51327e1eb0cac3a49db8c682e65e)
CREATE TABLE `krms_cntxt_vld_func_t` (`CNTXT_VLD_FUNC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `FUNC_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_FUNC_T` PRIMARY KEY (`CNTXT_VLD_FUNC_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-244', '2.1.0-SNP', '3:a01e51327e1eb0cac3a49db8c682e65e', 1013)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-245::unit-test::(Checksum: 3:cd182fbe30e1a5b77094d77a6e1211a8)
CREATE TABLE `krms_cntxt_vld_rule_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_RULE_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-245', '2.1.0-SNP', '3:cd182fbe30e1a5b77094d77a6e1211a8', 1014)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-246::unit-test::(Checksum: 3:603f99e1b496952483e2417e076f175a)
CREATE TABLE `krms_cntxt_vld_rule_t` (`CNTXT_VLD_RULE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `RULE_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_CNTXT_VLD_RULE_T` PRIMARY KEY (`CNTXT_VLD_RULE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-246', '2.1.0-SNP', '3:603f99e1b496952483e2417e076f175a', 1015)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-247::unit-test::(Checksum: 3:321275be585a9a831006dbe6e16e597a)
CREATE TABLE `krms_cntxt_vld_term_spec_t` (`CNTXT_TERM_SPEC_PREREQ_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CNTXT_ID` VARCHAR(40) NOT NULL, `TERM_SPEC_ID` VARCHAR(40) NOT NULL, `PREREQ` VARCHAR(1) DEFAULT 'n', CONSTRAINT `PK_KRMS_CNTXT_VLD_TERM_SPEC_T` PRIMARY KEY (`CNTXT_TERM_SPEC_PREREQ_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-247', '2.1.0-SNP', '3:321275be585a9a831006dbe6e16e597a', 1016)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-248::unit-test::(Checksum: 3:d9ac641cb9d2bd8c630d97d914e06ed5)
CREATE TABLE `krms_ctgry_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_CTGRY_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-248', '2.1.0-SNP', '3:d9ac641cb9d2bd8c630d97d914e06ed5', 1017)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-249::unit-test::(Checksum: 3:b11484b32f4bc3097ae973291d15882c)
CREATE TABLE `krms_ctgry_t` (`CTGRY_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(255) NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KRMS_CTGRY_T` PRIMARY KEY (`CTGRY_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-249', '2.1.0-SNP', '3:b11484b32f4bc3097ae973291d15882c', 1018)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-250::unit-test::(Checksum: 3:344261546f9a7214417e50dc46533027)
CREATE TABLE `krms_func_ctgry_t` (`FUNC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CTGRY_ID` VARCHAR(40) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-250', '2.1.0-SNP', '3:344261546f9a7214417e50dc46533027', 1019)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-251::unit-test::(Checksum: 3:2161435700b003588853273fc3b32447)
CREATE TABLE `krms_func_parm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_FUNC_PARM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-251', '2.1.0-SNP', '3:2161435700b003588853273fc3b32447', 1020)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-252::unit-test::(Checksum: 3:a60a9acbd90002d67f533cc9f421d810)
CREATE TABLE `krms_func_parm_t` (`FUNC_PARM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(100) NOT NULL, `DESC_TXT` VARCHAR(255), `TYP` VARCHAR(255) NOT NULL, `FUNC_ID` VARCHAR(40) NOT NULL, `SEQ_NO` DECIMAL(5,0) NOT NULL, CONSTRAINT `PK_KRMS_FUNC_PARM_T` PRIMARY KEY (`FUNC_PARM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-252', '2.1.0-SNP', '3:a60a9acbd90002d67f533cc9f421d810', 1021)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-253::unit-test::(Checksum: 3:3830b98c621e6f21a1b70cbd2394e3d6)
CREATE TABLE `krms_func_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_FUNC_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-253', '2.1.0-SNP', '3:3830b98c621e6f21a1b70cbd2394e3d6', 1022)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-254::unit-test::(Checksum: 3:7e99f13a8ec4214233dca9ce41b86ff2)
CREATE TABLE `krms_func_t` (`FUNC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `DESC_TXT` VARCHAR(255), `RTRN_TYP` VARCHAR(255) NOT NULL, `TYP_ID` VARCHAR(40) NOT NULL, `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_FUNC_T` PRIMARY KEY (`FUNC_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-254', '2.1.0-SNP', '3:7e99f13a8ec4214233dca9ce41b86ff2', 1023)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-255::unit-test::(Checksum: 3:a65b2be6eb07ff80c04c88c52b60048e)
CREATE TABLE `krms_prop_parm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_PROP_PARM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-255', '2.1.0-SNP', '3:a65b2be6eb07ff80c04c88c52b60048e', 1024)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-256::unit-test::(Checksum: 3:6d5c1458ded614f20dd0292b7a560abe)
CREATE TABLE `krms_prop_parm_t` (`PROP_PARM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `PROP_ID` VARCHAR(40) NOT NULL, `PARM_VAL` VARCHAR(255), `PARM_TYP_CD` VARCHAR(1) NOT NULL, `SEQ_NO` DECIMAL(5,0) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_PROP_PARM_T` PRIMARY KEY (`PROP_PARM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-256', '2.1.0-SNP', '3:6d5c1458ded614f20dd0292b7a560abe', 1025)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-257::unit-test::(Checksum: 3:e369a6fb426f5f20d757233aaed8f87a)
CREATE TABLE `krms_prop_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_PROP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-257', '2.1.0-SNP', '3:e369a6fb426f5f20d757233aaed8f87a', 1026)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-258::unit-test::(Checksum: 3:22b078eeeed0d268d33798fe5952207f)
CREATE TABLE `krms_prop_t` (`PROP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DESC_TXT` VARCHAR(100), `TYP_ID` VARCHAR(40), `DSCRM_TYP_CD` VARCHAR(10) NOT NULL, `CMPND_OP_CD` VARCHAR(40), `RULE_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_PROP_T` PRIMARY KEY (`PROP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-258', '2.1.0-SNP', '3:22b078eeeed0d268d33798fe5952207f', 1027)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-259::unit-test::(Checksum: 3:87ba62d3811507a5850fb96c6a88d2a0)
CREATE TABLE `krms_rule_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_RULE_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-259', '2.1.0-SNP', '3:87ba62d3811507a5850fb96c6a88d2a0', 1028)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-260::unit-test::(Checksum: 3:2366b92c002eeec8fa07a831f284eb67)
CREATE TABLE `krms_rule_attr_t` (`RULE_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `RULE_ID` VARCHAR(40) NOT NULL, `ATTR_DEFN_ID` VARCHAR(40) NOT NULL, `ATTR_VAL` VARCHAR(400), `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_RULE_ATTR_T` PRIMARY KEY (`RULE_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-260', '2.1.0-SNP', '3:2366b92c002eeec8fa07a831f284eb67', 1029)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-261::unit-test::(Checksum: 3:44f259e4d744e838dd7ac7dc318ddc63)
CREATE TABLE `krms_rule_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_RULE_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-261', '2.1.0-SNP', '3:44f259e4d744e838dd7ac7dc318ddc63', 1030)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-262::unit-test::(Checksum: 3:53ba676f8f8cb04394b3e374203df6ad)
CREATE TABLE `krms_rule_t` (`RULE_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `TYP_ID` VARCHAR(40) NOT NULL, `PROP_ID` VARCHAR(40), `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, `DESC_TXT` VARCHAR(4000), CONSTRAINT `PK_KRMS_RULE_T` PRIMARY KEY (`RULE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-262', '2.1.0-SNP', '3:53ba676f8f8cb04394b3e374203df6ad', 1031)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-263::unit-test::(Checksum: 3:704b33ae2dd838a7d712c23839d17d20)
CREATE TABLE `krms_term_parm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_PARM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-263', '2.1.0-SNP', '3:704b33ae2dd838a7d712c23839d17d20', 1032)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-264::unit-test::(Checksum: 3:6cea95cb8a6557b05361daf6cb2cecb4)
CREATE TABLE `krms_term_parm_t` (`TERM_PARM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TERM_ID` VARCHAR(40) NOT NULL, `NM` VARCHAR(255) NOT NULL, `VAL` VARCHAR(255), `VER_NBR` DECIMAL(8,0) NOT NULL, CONSTRAINT `PK_KRMS_TERM_PARM_T` PRIMARY KEY (`TERM_PARM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-264', '2.1.0-SNP', '3:6cea95cb8a6557b05361daf6cb2cecb4', 1033)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-265::unit-test::(Checksum: 3:8b8061814f4e36db73f7c81e4acf4d8b)
CREATE TABLE `krms_term_rslvr_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-265', '2.1.0-SNP', '3:8b8061814f4e36db73f7c81e4acf4d8b', 1034)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-266::unit-test::(Checksum: 3:f7c68e7f7180dc049c0cf9cdfd319e4e)
CREATE TABLE `krms_term_rslvr_attr_t` (`TERM_RSLVR_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TERM_RSLVR_ID` VARCHAR(40) NOT NULL, `ATTR_DEFN_ID` VARCHAR(40) NOT NULL, `ATTR_VAL` VARCHAR(400), `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_ATTR_T` PRIMARY KEY (`TERM_RSLVR_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-266', '2.1.0-SNP', '3:f7c68e7f7180dc049c0cf9cdfd319e4e', 1035)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-267::unit-test::(Checksum: 3:59f8e7a6a7ee0117c4137be438d91b50)
CREATE TABLE `krms_term_rslvr_input_spec_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_INPUT_SPEC_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-267', '2.1.0-SNP', '3:59f8e7a6a7ee0117c4137be438d91b50', 1036)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-268::unit-test::(Checksum: 3:1f50cc66b13604b3fb398516ea68e4fb)
CREATE TABLE `krms_term_rslvr_input_spec_t` (`TERM_SPEC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TERM_RSLVR_ID` VARCHAR(40) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-268', '2.1.0-SNP', '3:1f50cc66b13604b3fb398516ea68e4fb', 1037)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-269::unit-test::(Checksum: 3:95fd029bd8036a7353e613cf413e599c)
CREATE TABLE `krms_term_rslvr_parm_spec_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_PARM_SPEC_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-269', '2.1.0-SNP', '3:95fd029bd8036a7353e613cf413e599c', 1038)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-270::unit-test::(Checksum: 3:a2eb7fbc0e810154c2bdbe40fc59781f)
CREATE TABLE `krms_term_rslvr_parm_spec_t` (`TERM_RSLVR_PARM_SPEC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TERM_RSLVR_ID` VARCHAR(40) NOT NULL, `NM` VARCHAR(45) NOT NULL, `VER_NBR` DECIMAL(8,0) NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_PARM_SPEC_T` PRIMARY KEY (`TERM_RSLVR_PARM_SPEC_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-270', '2.1.0-SNP', '3:a2eb7fbc0e810154c2bdbe40fc59781f', 1039)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-271::unit-test::(Checksum: 3:960aaf179389fbfb336881fd72f25157)
CREATE TABLE `krms_term_rslvr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-271', '2.1.0-SNP', '3:960aaf179389fbfb336881fd72f25157', 1040)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-272::unit-test::(Checksum: 3:44eb712ce103578ce110599c96f4bde9)
CREATE TABLE `krms_term_rslvr_t` (`TERM_RSLVR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `NM` VARCHAR(100) NOT NULL, `TYP_ID` VARCHAR(40) NOT NULL, `OUTPUT_TERM_SPEC_ID` VARCHAR(40) NOT NULL, `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_TERM_RSLVR_T` PRIMARY KEY (`TERM_RSLVR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-272', '2.1.0-SNP', '3:44eb712ce103578ce110599c96f4bde9', 1041)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-273::unit-test::(Checksum: 3:26a1a400644fd2f95155eaae9d7a2e41)
CREATE TABLE `krms_term_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-273', '2.1.0-SNP', '3:26a1a400644fd2f95155eaae9d7a2e41', 1042)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-274::unit-test::(Checksum: 3:669873b4c50c8ee40cb094e4adc01e9e)
CREATE TABLE `krms_term_spec_ctgry_t` (`TERM_SPEC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `CTGRY_ID` VARCHAR(40) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-274', '2.1.0-SNP', '3:669873b4c50c8ee40cb094e4adc01e9e', 1043)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-275::unit-test::(Checksum: 3:5921dabec5472f1c0b230cdc9e7d3b7a)
CREATE TABLE `krms_term_spec_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TERM_SPEC_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-275', '2.1.0-SNP', '3:5921dabec5472f1c0b230cdc9e7d3b7a', 1044)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-276::unit-test::(Checksum: 3:63b4bc6617fae6362399004b0e9a5454)
CREATE TABLE `krms_term_spec_t` (`TERM_SPEC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(255) NOT NULL, `TYP` VARCHAR(255) NOT NULL, `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) NOT NULL, `DESC_TXT` VARCHAR(255), `NMSPC_CD` VARCHAR(40) NOT NULL, CONSTRAINT `PK_KRMS_TERM_SPEC_T` PRIMARY KEY (`TERM_SPEC_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-276', '2.1.0-SNP', '3:63b4bc6617fae6362399004b0e9a5454', 1045)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-277::unit-test::(Checksum: 3:5e265ef3d6bedd678adbd37ba93e8d29)
CREATE TABLE `krms_term_t` (`TERM_ID` VARCHAR(40) DEFAULT '' NOT NULL, `TERM_SPEC_ID` VARCHAR(40) NOT NULL, `VER_NBR` DECIMAL(8,0) NOT NULL, `DESC_TXT` VARCHAR(255), CONSTRAINT `PK_KRMS_TERM_T` PRIMARY KEY (`TERM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-277', '2.1.0-SNP', '3:5e265ef3d6bedd678adbd37ba93e8d29', 1046)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-278::unit-test::(Checksum: 3:814271f2d0f0f10069a77483f45c00fe)
CREATE TABLE `krms_typ_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TYP_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-278', '2.1.0-SNP', '3:814271f2d0f0f10069a77483f45c00fe', 1047)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-279::unit-test::(Checksum: 3:822d7948b0994a3f236702cd1ca80660)
CREATE TABLE `krms_typ_attr_t` (`TYP_ATTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `SEQ_NO` DECIMAL(5,0) NOT NULL, `TYP_ID` VARCHAR(40) NOT NULL, `ATTR_DEFN_ID` VARCHAR(255) NOT NULL, `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_TYP_ATTR_T` PRIMARY KEY (`TYP_ATTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-279', '2.1.0-SNP', '3:822d7948b0994a3f236702cd1ca80660', 1048)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-280::unit-test::(Checksum: 3:19bb081f45f76268b29951feb378ca0a)
CREATE TABLE `krms_typ_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRMS_TYP_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-280', '2.1.0-SNP', '3:19bb081f45f76268b29951feb378ca0a', 1049)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-281::unit-test::(Checksum: 3:12def74a8cac601077f92e10119e4f8d)
CREATE TABLE `krms_typ_t` (`TYP_ID` VARCHAR(40) DEFAULT '' NOT NULL, `NM` VARCHAR(100) NOT NULL, `NMSPC_CD` VARCHAR(40) NOT NULL, `SRVC_NM` VARCHAR(200), `ACTV` VARCHAR(1) DEFAULT 'Y' NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRMS_TYP_T` PRIMARY KEY (`TYP_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-281', '2.1.0-SNP', '3:12def74a8cac601077f92e10119e4f8d', 1050)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-282::unit-test::(Checksum: 3:1c60e43b56192fcc12773bba5a8e3b13)
CREATE TABLE `krns_adhoc_rte_actn_recip_t` (`RECIP_TYP_CD` DECIMAL(1,0) DEFAULT 0 NOT NULL, `ACTN_RQST_CD` VARCHAR(30) DEFAULT '' NOT NULL, `ACTN_RQST_RECIP_ID` VARCHAR(70) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-282', '2.1.0-SNP', '3:1c60e43b56192fcc12773bba5a8e3b13', 1051)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-283::unit-test::(Checksum: 3:d7887989e88087e906593c2f83ed7374)
CREATE TABLE `krns_att_t` (`NTE_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `MIME_TYP` VARCHAR(255), `FILE_NM` VARCHAR(250), `ATT_ID` VARCHAR(36), `FILE_SZ` DECIMAL(14,0), `ATT_TYP_CD` VARCHAR(40), CONSTRAINT `PK_KRNS_ATT_T` PRIMARY KEY (`NTE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-283', '2.1.0-SNP', '3:d7887989e88087e906593c2f83ed7374', 1052)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-284::unit-test::(Checksum: 3:c21a8d18e7f46457af95b765ef2e318a)
CREATE TABLE `krns_doc_hdr_t` (`DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `FDOC_DESC` VARCHAR(40), `ORG_DOC_HDR_ID` VARCHAR(10), `TMPL_DOC_HDR_ID` VARCHAR(14), `EXPLANATION` VARCHAR(400), CONSTRAINT `PK_KRNS_DOC_HDR_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-284', '2.1.0-SNP', '3:c21a8d18e7f46457af95b765ef2e318a', 1053)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-285::unit-test::(Checksum: 3:9fc2d3a5a8017ae4f7ab0cb72446c885)
CREATE TABLE `krns_doc_typ_attr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRNS_DOC_TYP_ATTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-285', '2.1.0-SNP', '3:9fc2d3a5a8017ae4f7ab0cb72446c885', 1054)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-286::unit-test::(Checksum: 3:9ed7954f7f61c06a9c88f16a0f01c03f)
CREATE TABLE `krns_lock_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRNS_LOCK_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-286', '2.1.0-SNP', '3:9ed7954f7f61c06a9c88f16a0f01c03f', 1055)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-287::unit-test::(Checksum: 3:3907af8a025ffdede927c33bdbe8ac30)
CREATE TABLE `krns_lookup_rslt_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRNS_LOOKUP_RSLT_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-287', '2.1.0-SNP', '3:3907af8a025ffdede927c33bdbe8ac30', 1056)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-288::unit-test::(Checksum: 3:0a023942fec64a9c687f69d09e88e74b)
CREATE TABLE `krns_lookup_rslt_t` (`LOOKUP_RSLT_ID` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `LOOKUP_DT` DATETIME NOT NULL, `SERIALZD_RSLTS` LONGTEXT, CONSTRAINT `PK_KRNS_LOOKUP_RSLT_T` PRIMARY KEY (`LOOKUP_RSLT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-288', '2.1.0-SNP', '3:0a023942fec64a9c687f69d09e88e74b', 1057)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-289::unit-test::(Checksum: 3:4aa09a39ef4a6891c53ef36238f9a304)
CREATE TABLE `krns_lookup_sel_t` (`LOOKUP_RSLT_ID` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, `LOOKUP_DT` DATETIME NOT NULL, `SEL_OBJ_IDS` LONGTEXT, CONSTRAINT `PK_KRNS_LOOKUP_SEL_T` PRIMARY KEY (`LOOKUP_RSLT_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-289', '2.1.0-SNP', '3:4aa09a39ef4a6891c53ef36238f9a304', 1058)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-290::unit-test::(Checksum: 3:c9b009d8d9f58bc812decdff61d10972)
CREATE TABLE `krns_maint_doc_att_t` (`DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL, `ATT_CNTNT` LONGBLOB NOT NULL, `FILE_NM` VARCHAR(150), `CNTNT_TYP` VARCHAR(255), `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, CONSTRAINT `PK_KRNS_MAINT_DOC_ATT_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-290', '2.1.0-SNP', '3:c9b009d8d9f58bc812decdff61d10972', 1059)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-291::unit-test::(Checksum: 3:df1d6aa0271586f1a36073e34ce2148b)
CREATE TABLE `krns_maint_doc_t` (`DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `DOC_CNTNT` LONGTEXT, CONSTRAINT `PK_KRNS_MAINT_DOC_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-291', '2.1.0-SNP', '3:df1d6aa0271586f1a36073e34ce2148b', 1060)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-292::unit-test::(Checksum: 3:7d7ea87844176fa87caf5cb179d10340)
CREATE TABLE `krns_maint_lock_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRNS_MAINT_LOCK_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-292', '2.1.0-SNP', '3:7d7ea87844176fa87caf5cb179d10340', 1061)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-293::unit-test::(Checksum: 3:3fb4633080584e469e5173cc07d00a82)
CREATE TABLE `krns_maint_lock_t` (`MAINT_LOCK_REP_TXT` VARCHAR(500), `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `DOC_HDR_ID` VARCHAR(14) NOT NULL, `MAINT_LOCK_ID` VARCHAR(14) DEFAULT '' NOT NULL, CONSTRAINT `PK_KRNS_MAINT_LOCK_T` PRIMARY KEY (`MAINT_LOCK_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-293', '2.1.0-SNP', '3:3fb4633080584e469e5173cc07d00a82', 1062)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-294::unit-test::(Checksum: 3:ae0c62b599f6eead4588376808e23723)
CREATE TABLE `krns_nte_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRNS_NTE_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-294', '2.1.0-SNP', '3:ae0c62b599f6eead4588376808e23723', 1063)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-295::unit-test::(Checksum: 3:3ad6725d8f2a9e2a0c5cecd7c7efc86e)
CREATE TABLE `krns_nte_t` (`NTE_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `RMT_OBJ_ID` VARCHAR(36) NOT NULL, `AUTH_PRNCPL_ID` VARCHAR(40) NOT NULL, `POST_TS` DATETIME NOT NULL, `NTE_TYP_CD` VARCHAR(4) NOT NULL, `TXT` VARCHAR(800), `PRG_CD` VARCHAR(1), `TPC_TXT` VARCHAR(40), CONSTRAINT `PK_KRNS_NTE_T` PRIMARY KEY (`NTE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-295', '2.1.0-SNP', '3:3ad6725d8f2a9e2a0c5cecd7c7efc86e', 1064)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-296::unit-test::(Checksum: 3:ac955fb31baf8390e9d71e3599ec455c)
CREATE TABLE `krns_nte_typ_t` (`NTE_TYP_CD` VARCHAR(4) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `TYP_DESC_TXT` VARCHAR(100), `ACTV_IND` VARCHAR(1), CONSTRAINT `PK_KRNS_NTE_TYP_T` PRIMARY KEY (`NTE_TYP_CD`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-296', '2.1.0-SNP', '3:ac955fb31baf8390e9d71e3599ec455c', 1065)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-297::unit-test::(Checksum: 3:de456e6816a684544c6cabf8f54e57ee)
CREATE TABLE `krns_pessimistic_lock_t` (`PESSIMISTIC_LOCK_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `LOCK_DESC_TXT` VARCHAR(4000), `DOC_HDR_ID` VARCHAR(14) NOT NULL, `GNRT_DT` DATETIME NOT NULL, `PRNCPL_ID` VARCHAR(40) NOT NULL, CONSTRAINT `PK_KRNS_PESSIMISTIC_LOCK_T` PRIMARY KEY (`PESSIMISTIC_LOCK_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-297', '2.1.0-SNP', '3:de456e6816a684544c6cabf8f54e57ee', 1066)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-298::unit-test::(Checksum: 3:77ef92c6ccc68524629ac619832dcd4f)
CREATE TABLE `krns_sesn_doc_t` (`SESN_DOC_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL, `PRNCPL_ID` VARCHAR(40) DEFAULT '' NOT NULL, `IP_ADDR` VARCHAR(60) DEFAULT '' NOT NULL, `SERIALZD_DOC_FRM` LONGBLOB, `LAST_UPDT_DT` DATETIME, `CONTENT_ENCRYPTED_IND` CHAR(1) DEFAULT 'N', `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0) DEFAULT 0)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-298', '2.1.0-SNP', '3:77ef92c6ccc68524629ac619832dcd4f', 1067)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-299::unit-test::(Checksum: 3:35e8813d5cae3fe42f6ccd6451f4ab01)
CREATE TABLE `krsb_bam_parm_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRSB_BAM_PARM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-299', '2.1.0-SNP', '3:35e8813d5cae3fe42f6ccd6451f4ab01', 1068)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-300::unit-test::(Checksum: 3:b7d184d8de9b087490fabb214f275afa)
CREATE TABLE `krsb_bam_parm_t` (`BAM_PARM_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `BAM_ID` DECIMAL(14,0) NOT NULL, `PARM` LONGTEXT NOT NULL, CONSTRAINT `PK_KRSB_BAM_PARM_T` PRIMARY KEY (`BAM_PARM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-300', '2.1.0-SNP', '3:b7d184d8de9b087490fabb214f275afa', 1069)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-301::unit-test::(Checksum: 3:12c23c1dff43aa30a48e603592fde17b)
CREATE TABLE `krsb_bam_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRSB_BAM_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-301', '2.1.0-SNP', '3:12c23c1dff43aa30a48e603592fde17b', 1070)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-302::unit-test::(Checksum: 3:25ec79deb2fd0befd2977d0f779e7d70)
CREATE TABLE `krsb_bam_t` (`BAM_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `SVC_NM` VARCHAR(255) NOT NULL, `SVC_URL` VARCHAR(500) NOT NULL, `MTHD_NM` VARCHAR(2000) NOT NULL, `THRD_NM` VARCHAR(500) NOT NULL, `CALL_DT` DATETIME NOT NULL, `TGT_TO_STR` VARCHAR(2000) NOT NULL, `SRVR_IND` DECIMAL(1,0) NOT NULL, `EXCPN_TO_STR` VARCHAR(2000), `EXCPN_MSG` LONGTEXT, CONSTRAINT `PK_KRSB_BAM_T` PRIMARY KEY (`BAM_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-302', '2.1.0-SNP', '3:25ec79deb2fd0befd2977d0f779e7d70', 1071)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-303::unit-test::(Checksum: 3:7e90583d434b9947be749e902c6c04ba)
CREATE TABLE `krsb_msg_pyld_t` (`MSG_QUE_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `MSG_PYLD` LONGTEXT NOT NULL, CONSTRAINT `PK_KRSB_MSG_PYLD_T` PRIMARY KEY (`MSG_QUE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-303', '2.1.0-SNP', '3:7e90583d434b9947be749e902c6c04ba', 1072)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-304::unit-test::(Checksum: 3:b86170526db03a37f4be9206deb97733)
CREATE TABLE `krsb_msg_que_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRSB_MSG_QUE_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-304', '2.1.0-SNP', '3:b86170526db03a37f4be9206deb97733', 1073)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-305::unit-test::(Checksum: 3:4b5a101ea3f76a71a73ccdd416fab224)
CREATE TABLE `krsb_msg_que_t` (`MSG_QUE_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `DT` DATETIME NOT NULL, `EXP_DT` DATETIME, `PRIO` DECIMAL(8,0) NOT NULL, `STAT_CD` CHAR(1) NOT NULL, `RTRY_CNT` DECIMAL(8,0) NOT NULL, `IP_NBR` VARCHAR(2000) NOT NULL, `SVC_NM` VARCHAR(255), `APPL_ID` VARCHAR(255) NOT NULL, `SVC_MTHD_NM` VARCHAR(2000), `APP_VAL_ONE` VARCHAR(2000), `APP_VAL_TWO` VARCHAR(2000), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_KRSB_MSG_QUE_T` PRIMARY KEY (`MSG_QUE_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-305', '2.1.0-SNP', '3:4b5a101ea3f76a71a73ccdd416fab224', 1074)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-306::unit-test::(Checksum: 3:509266373572305dd43a74b097a4029b)
CREATE TABLE `krsb_qrtz_blob_triggers` (`TRIGGER_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `TRIGGER_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `BLOB_DATA` LONGBLOB)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-306', '2.1.0-SNP', '3:509266373572305dd43a74b097a4029b', 1075)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-307::unit-test::(Checksum: 3:cfeb71833b1dac5e998dfb336cf4a84c)
CREATE TABLE `krsb_qrtz_calendars` (`CALENDAR_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `CALENDAR` LONGBLOB NOT NULL, CONSTRAINT `PK_KRSB_QRTZ_CALENDARS` PRIMARY KEY (`CALENDAR_NAME`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-307', '2.1.0-SNP', '3:cfeb71833b1dac5e998dfb336cf4a84c', 1076)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-308::unit-test::(Checksum: 3:a1282f923fe22c3320aebb7da69e6f37)
CREATE TABLE `krsb_qrtz_cron_triggers` (`TRIGGER_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `TRIGGER_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `CRON_EXPRESSION` VARCHAR(80) NOT NULL, `TIME_ZONE_ID` VARCHAR(80))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-308', '2.1.0-SNP', '3:a1282f923fe22c3320aebb7da69e6f37', 1077)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-309::unit-test::(Checksum: 3:86c9dd09a2658e76d2a12339ea99ae34)
CREATE TABLE `krsb_qrtz_fired_triggers` (`ENTRY_ID` VARCHAR(95) DEFAULT '' NOT NULL, `TRIGGER_NAME` VARCHAR(80) NOT NULL, `TRIGGER_GROUP` VARCHAR(80) NOT NULL, `IS_VOLATILE` VARCHAR(1) NOT NULL, `INSTANCE_NAME` VARCHAR(80) NOT NULL, `FIRED_TIME` DECIMAL(13,0) NOT NULL, `PRIORITY` DECIMAL(13,0) NOT NULL, `STATE` VARCHAR(16) NOT NULL, `JOB_NAME` VARCHAR(80), `JOB_GROUP` VARCHAR(80), `IS_STATEFUL` VARCHAR(1), `REQUESTS_RECOVERY` VARCHAR(1), CONSTRAINT `PK_KRSB_QRTZ_FIRED_TRIGGERS` PRIMARY KEY (`ENTRY_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-309', '2.1.0-SNP', '3:86c9dd09a2658e76d2a12339ea99ae34', 1078)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-310::unit-test::(Checksum: 3:cafc879224318239253c35ba0668c337)
CREATE TABLE `krsb_qrtz_job_details` (`JOB_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `JOB_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `DESCRIPTION` VARCHAR(120), `JOB_CLASS_NAME` VARCHAR(128) NOT NULL, `IS_DURABLE` VARCHAR(1) NOT NULL, `IS_VOLATILE` VARCHAR(1) NOT NULL, `IS_STATEFUL` VARCHAR(1) NOT NULL, `REQUESTS_RECOVERY` VARCHAR(1) NOT NULL, `JOB_DATA` LONGBLOB)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-310', '2.1.0-SNP', '3:cafc879224318239253c35ba0668c337', 1079)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-311::unit-test::(Checksum: 3:211a6d20dd86e61849e0976f7402f670)
CREATE TABLE `krsb_qrtz_job_listeners` (`JOB_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `JOB_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `JOB_LISTENER` VARCHAR(80) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-311', '2.1.0-SNP', '3:211a6d20dd86e61849e0976f7402f670', 1080)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-312::unit-test::(Checksum: 3:e000791d7bfa7e50f3ef701b66bd82ff)
CREATE TABLE `krsb_qrtz_locks` (`LOCK_NAME` VARCHAR(40) DEFAULT '' NOT NULL, CONSTRAINT `PK_KRSB_QRTZ_LOCKS` PRIMARY KEY (`LOCK_NAME`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-312', '2.1.0-SNP', '3:e000791d7bfa7e50f3ef701b66bd82ff', 1081)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-313::unit-test::(Checksum: 3:4eb5e600d2bfab001515ac914a932844)
CREATE TABLE `krsb_qrtz_paused_trigger_grps` (`TRIGGER_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, CONSTRAINT `PK_KRSB_QRTZ_PAUSED_TRIGGER_GRPS` PRIMARY KEY (`TRIGGER_GROUP`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-313', '2.1.0-SNP', '3:4eb5e600d2bfab001515ac914a932844', 1082)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-314::unit-test::(Checksum: 3:ee5f74a4d10bb1a13cdf4167b65b1cf6)
CREATE TABLE `krsb_qrtz_scheduler_state` (`INSTANCE_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `LAST_CHECKIN_TIME` DECIMAL(13,0) NOT NULL, `CHECKIN_INTERVAL` DECIMAL(13,0) NOT NULL, CONSTRAINT `PK_KRSB_QRTZ_SCHEDULER_STATE` PRIMARY KEY (`INSTANCE_NAME`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-314', '2.1.0-SNP', '3:ee5f74a4d10bb1a13cdf4167b65b1cf6', 1083)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-315::unit-test::(Checksum: 3:6267041d0cd7c9e6d2433ae11a0ef2e7)
CREATE TABLE `krsb_qrtz_simple_triggers` (`TRIGGER_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `TRIGGER_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `REPEAT_COUNT` DECIMAL(7,0) NOT NULL, `REPEAT_INTERVAL` DECIMAL(12,0) NOT NULL, `TIMES_TRIGGERED` DECIMAL(7,0) NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-315', '2.1.0-SNP', '3:6267041d0cd7c9e6d2433ae11a0ef2e7', 1084)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-316::unit-test::(Checksum: 3:9d59ec7b1f9fc772687f405f7e808aab)
CREATE TABLE `krsb_qrtz_trigger_listeners` (`TRIGGER_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `TRIGGER_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `TRIGGER_LISTENER` VARCHAR(80) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-316', '2.1.0-SNP', '3:9d59ec7b1f9fc772687f405f7e808aab', 1085)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-317::unit-test::(Checksum: 3:d39136eac139238ba117226a7fced95e)
CREATE TABLE `krsb_qrtz_triggers` (`TRIGGER_NAME` VARCHAR(80) DEFAULT '' NOT NULL, `TRIGGER_GROUP` VARCHAR(80) DEFAULT '' NOT NULL, `JOB_NAME` VARCHAR(80) NOT NULL, `JOB_GROUP` VARCHAR(80) NOT NULL, `IS_VOLATILE` VARCHAR(1) NOT NULL, `DESCRIPTION` VARCHAR(120), `NEXT_FIRE_TIME` DECIMAL(13,0), `PREV_FIRE_TIME` DECIMAL(13,0), `PRIORITY` DECIMAL(13,0), `TRIGGER_STATE` VARCHAR(16) NOT NULL, `TRIGGER_TYPE` VARCHAR(8) NOT NULL, `START_TIME` DECIMAL(13,0) NOT NULL, `END_TIME` DECIMAL(13,0), `CALENDAR_NAME` VARCHAR(80), `MISFIRE_INSTR` DECIMAL(2,0), `JOB_DATA` LONGBLOB)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-317', '2.1.0-SNP', '3:d39136eac139238ba117226a7fced95e', 1086)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-318::unit-test::(Checksum: 3:f6e93a41a73982fc7851aa137f12c0d1)
CREATE TABLE `krsb_svc_def_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRSB_SVC_DEF_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-318', '2.1.0-SNP', '3:f6e93a41a73982fc7851aa137f12c0d1', 1087)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-319::unit-test::(Checksum: 3:8761a6c53439d876b4efa60626a3f4d3)
CREATE TABLE `krsb_svc_def_t` (`SVC_DEF_ID` VARCHAR(40) DEFAULT '' NOT NULL, `SVC_NM` VARCHAR(255) NOT NULL, `SVC_URL` VARCHAR(500) NOT NULL, `INSTN_ID` VARCHAR(255) NOT NULL, `APPL_ID` VARCHAR(255) NOT NULL, `SRVR_IP` VARCHAR(40) NOT NULL, `TYP_CD` VARCHAR(40) NOT NULL, `SVC_VER` VARCHAR(40) NOT NULL, `STAT_CD` VARCHAR(1) NOT NULL, `SVC_DSCRPTR_ID` VARCHAR(40) NOT NULL, `CHKSM` VARCHAR(30) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 0 NOT NULL, CONSTRAINT `PK_KRSB_SVC_DEF_T` PRIMARY KEY (`SVC_DEF_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-319', '2.1.0-SNP', '3:8761a6c53439d876b4efa60626a3f4d3', 1088)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-320::unit-test::(Checksum: 3:4369949a7f80cdcf163668d12eafe02b)
CREATE TABLE `krsb_svc_dscrptr_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_KRSB_SVC_DSCRPTR_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-320', '2.1.0-SNP', '3:4369949a7f80cdcf163668d12eafe02b', 1089)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-321::unit-test::(Checksum: 3:6feec14017d629c212a764c959a73bdd)
CREATE TABLE `krsb_svc_dscrptr_t` (`SVC_DSCRPTR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `DSCRPTR` LONGTEXT NOT NULL, CONSTRAINT `PK_KRSB_SVC_DSCRPTR_T` PRIMARY KEY (`SVC_DSCRPTR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-321', '2.1.0-SNP', '3:6feec14017d629c212a764c959a73bdd', 1090)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-322::unit-test::(Checksum: 3:85a7d4843bb4da1e3c0a84211e9c1309)
CREATE TABLE `trav_doc_2_accounts` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `ACCT_NUM` VARCHAR(10) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-322', '2.1.0-SNP', '3:85a7d4843bb4da1e3c0a84211e9c1309', 1091)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-323::unit-test::(Checksum: 3:044d6ab68eed331adff8b61376b3fcf6)
CREATE TABLE `trv_acct` (`ACCT_NUM` VARCHAR(10) DEFAULT '' NOT NULL, `ACCT_NAME` VARCHAR(50), `ACCT_TYPE` VARCHAR(100), `ACCT_FO_ID` DECIMAL(14,0), `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0) DEFAULT 0, `SUB_ACCT` VARCHAR(10), `SUB_ACCT_NAME` VARCHAR(50), `CREATE_DT` DATETIME, `SUBSIDIZED_PCT` FLOAT, CONSTRAINT `PK_TRV_ACCT` PRIMARY KEY (`ACCT_NUM`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-323', '2.1.0-SNP', '3:044d6ab68eed331adff8b61376b3fcf6', 1092)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-324::unit-test::(Checksum: 3:a51a35c82dc8e01203ab402743217d33)
CREATE TABLE `trv_acct_ext` (`ACCT_NUM` VARCHAR(10) DEFAULT '' NOT NULL, `ACCT_TYPE` VARCHAR(100) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0) DEFAULT 0)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-324', '2.1.0-SNP', '3:a51a35c82dc8e01203ab402743217d33', 1093)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-325::unit-test::(Checksum: 3:362b3ddfee1d9fc00da6223355300a15)
CREATE TABLE `trv_acct_fo` (`ACCT_FO_ID` DECIMAL(14,0) DEFAULT 0 NOT NULL, `ACCT_FO_USER_NAME` VARCHAR(50) NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_TRV_ACCT_FO` PRIMARY KEY (`ACCT_FO_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-325', '2.1.0-SNP', '3:362b3ddfee1d9fc00da6223355300a15', 1094)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-326::unit-test::(Checksum: 3:72b599a31d840b7e008ad6489d2596bc)
CREATE TABLE `trv_acct_type` (`ACCT_TYPE` VARCHAR(10) DEFAULT '' NOT NULL, `ACCT_TYPE_NAME` VARCHAR(50), `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(8,0) DEFAULT 0, CONSTRAINT `PK_TRV_ACCT_TYPE` PRIMARY KEY (`ACCT_TYPE`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-326', '2.1.0-SNP', '3:72b599a31d840b7e008ad6489d2596bc', 1095)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-327::unit-test::(Checksum: 3:77af30842300d382deb999a67f14ef65)
CREATE TABLE `trv_acct_use_rt_t` (`ID` VARCHAR(40) DEFAULT '' NOT NULL, `ACCT_NUM` VARCHAR(10) NOT NULL, `RATE` DECIMAL(8,0) NOT NULL, `ACTV_FRM_DT` DATETIME, `ACTV_TO_DT` DATETIME, CONSTRAINT `PK_TRV_ACCT_USE_RT_T` PRIMARY KEY (`ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-327', '2.1.0-SNP', '3:77af30842300d382deb999a67f14ef65', 1096)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-328::unit-test::(Checksum: 3:c928041c06d6490032fbe69c3c433ae7)
CREATE TABLE `trv_doc_2` (`FDOC_NBR` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36) NOT NULL, `VER_NBR` DECIMAL(8,0) DEFAULT 1 NOT NULL, `FDOC_EXPLAIN_TXT` VARCHAR(400), `REQUEST_TRAV` VARCHAR(30) NOT NULL, `TRAVELER` VARCHAR(200), `ORG` VARCHAR(60), `DEST` VARCHAR(60), CONSTRAINT `PK_TRV_DOC_2` PRIMARY KEY (`FDOC_NBR`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-328', '2.1.0-SNP', '3:c928041c06d6490032fbe69c3c433ae7', 1097)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-329::unit-test::(Checksum: 3:eef39a109aa9a2aa294fafaf6d5c6e8e)
CREATE TABLE `trv_doc_acct` (`DOC_HDR_ID` VARCHAR(40) DEFAULT '' NOT NULL, `ACCT_NUM` VARCHAR(10) DEFAULT '' NOT NULL)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-329', '2.1.0-SNP', '3:eef39a109aa9a2aa294fafaf6d5c6e8e', 1098)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-330::unit-test::(Checksum: 3:2026cee330b29b61c14edab04394c2bb)
CREATE TABLE `trv_fo_id_s` (`id` BIGINT AUTO_INCREMENT  NOT NULL, CONSTRAINT `PK_TRV_FO_ID_S` PRIMARY KEY (`id`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-330', '2.1.0-SNP', '3:2026cee330b29b61c14edab04394c2bb', 1099)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-331::unit-test::(Checksum: 3:5b3bb3ecb0ecb324d0cda7dc18f09bc0)
CREATE TABLE `tst_search_attr_indx_tst_doc_t` (`DOC_HDR_ID` VARCHAR(14) DEFAULT '' NOT NULL, `OBJ_ID` VARCHAR(36), `VER_NBR` DECIMAL(14,0), `RTE_LVL_CNT` DECIMAL(14,0), `CNSTNT_STR` VARCHAR(50), `RTD_STR` VARCHAR(50), `HLD_RTD_STR` VARCHAR(50), `RD_ACCS_CNT` DECIMAL(14,0), CONSTRAINT `PK_TST_SEARCH_ATTR_INDX_TST_DOC_T` PRIMARY KEY (`DOC_HDR_ID`))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Table', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-331', '2.1.0-SNP', '3:5b3bb3ecb0ecb324d0cda7dc18f09bc0', 1100)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-332::unit-test::(Checksum: 3:1644394ea66c57c6ea49c26dcfa1761f)
ALTER TABLE `krcr_cmpnt_t` ADD PRIMARY KEY (`NMSPC_CD`, `CMPNT_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-332', '2.1.0-SNP', '3:1644394ea66c57c6ea49c26dcfa1761f', 1101)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-333::unit-test::(Checksum: 3:d8c55237eb1e325684911e65c13b45d2)
ALTER TABLE `krcr_parm_t` ADD PRIMARY KEY (`NMSPC_CD`, `CMPNT_CD`, `PARM_NM`, `APPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-333', '2.1.0-SNP', '3:d8c55237eb1e325684911e65c13b45d2', 1102)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-334::unit-test::(Checksum: 3:a42b05c3e45ec362667024f0501fd5d2)
ALTER TABLE `kren_chnl_prodcr_t` ADD PRIMARY KEY (`CHNL_ID`, `PRODCR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-334', '2.1.0-SNP', '3:a42b05c3e45ec362667024f0501fd5d2', 1103)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-335::unit-test::(Checksum: 3:e498c3c61780c12fcc106eeff6ad7683)
ALTER TABLE `krew_doc_typ_app_doc_stat_t` ADD PRIMARY KEY (`DOC_TYP_ID`, `DOC_STAT_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-335', '2.1.0-SNP', '3:e498c3c61780c12fcc106eeff6ad7683', 1104)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-336::unit-test::(Checksum: 3:d1e2746ebef667014c81ed5d5ecd3547)
ALTER TABLE `krew_doc_typ_plcy_reln_t` ADD PRIMARY KEY (`DOC_TYP_ID`, `DOC_PLCY_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-336', '2.1.0-SNP', '3:d1e2746ebef667014c81ed5d5ecd3547', 1105)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-337::unit-test::(Checksum: 3:79a7b116758172ce474751b7f3f9741e)
ALTER TABLE `krew_init_rte_node_instn_t` ADD PRIMARY KEY (`DOC_HDR_ID`, `RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-337', '2.1.0-SNP', '3:79a7b116758172ce474751b7f3f9741e', 1106)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-338::unit-test::(Checksum: 3:dcc390e09ccb7edaf3bd0d72013ecdf2)
ALTER TABLE `krew_rmv_rplc_grp_t` ADD PRIMARY KEY (`DOC_HDR_ID`, `GRP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-338', '2.1.0-SNP', '3:dcc390e09ccb7edaf3bd0d72013ecdf2', 1107)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-339::unit-test::(Checksum: 3:52935a5bc7d4fb0759080a55dd9f4a6f)
ALTER TABLE `krew_rmv_rplc_rule_t` ADD PRIMARY KEY (`DOC_HDR_ID`, `RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-339', '2.1.0-SNP', '3:52935a5bc7d4fb0759080a55dd9f4a6f', 1108)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-340::unit-test::(Checksum: 3:6af73c4814787399e1d30fd584c00820)
ALTER TABLE `krew_rte_node_instn_lnk_t` ADD PRIMARY KEY (`FROM_RTE_NODE_INSTN_ID`, `TO_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-340', '2.1.0-SNP', '3:6af73c4814787399e1d30fd584c00820', 1109)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-341::unit-test::(Checksum: 3:a6ac7feb1c27f64c8564c45a93a00cb7)
ALTER TABLE `krew_rte_node_lnk_t` ADD PRIMARY KEY (`FROM_RTE_NODE_ID`, `TO_RTE_NODE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-341', '2.1.0-SNP', '3:a6ac7feb1c27f64c8564c45a93a00cb7', 1110)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-342::unit-test::(Checksum: 3:91aeacf2fef4c0e54402b3e45f3cbfda)
ALTER TABLE `krew_usr_optn_t` ADD PRIMARY KEY (`PRNCPL_ID`, `PRSN_OPTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-342', '2.1.0-SNP', '3:91aeacf2fef4c0e54402b3e45f3cbfda', 1111)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-343::unit-test::(Checksum: 3:43f3b467297d95b90998b047ed26144f)
ALTER TABLE `krim_entity_ent_typ_t` ADD PRIMARY KEY (`ENT_TYP_CD`, `ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-343', '2.1.0-SNP', '3:43f3b467297d95b90998b047ed26144f', 1112)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-344::unit-test::(Checksum: 3:f07e67689fb2898cc6f3ced80ea1646c)
ALTER TABLE `krim_pnd_addr_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_ADDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-344', '2.1.0-SNP', '3:f07e67689fb2898cc6f3ced80ea1646c', 1113)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-345::unit-test::(Checksum: 3:c2f4686a4ef07978a1d6ab63fddda53f)
ALTER TABLE `krim_pnd_afltn_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_AFLTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-345', '2.1.0-SNP', '3:c2f4686a4ef07978a1d6ab63fddda53f', 1114)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-346::unit-test::(Checksum: 3:366daa8ae92b3bb05c32f2cd4802cb57)
ALTER TABLE `krim_pnd_ctznshp_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_CTZNSHP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-346', '2.1.0-SNP', '3:366daa8ae92b3bb05c32f2cd4802cb57', 1115)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-347::unit-test::(Checksum: 3:e44199f37376b634cd4c5a0183e51900)
ALTER TABLE `krim_pnd_dlgn_mbr_attr_data_t` ADD PRIMARY KEY (`FDOC_NBR`, `ATTR_DATA_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-347', '2.1.0-SNP', '3:e44199f37376b634cd4c5a0183e51900', 1116)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-348::unit-test::(Checksum: 3:7a67ca7423c07ab2c3f9b4e30ac222a9)
ALTER TABLE `krim_pnd_dlgn_mbr_t` ADD PRIMARY KEY (`FDOC_NBR`, `DLGN_MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-348', '2.1.0-SNP', '3:7a67ca7423c07ab2c3f9b4e30ac222a9', 1117)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-349::unit-test::(Checksum: 3:017d58c5e9e03cbaa2265be22e5bca10)
ALTER TABLE `krim_pnd_dlgn_t` ADD PRIMARY KEY (`FDOC_NBR`, `DLGN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-349', '2.1.0-SNP', '3:017d58c5e9e03cbaa2265be22e5bca10', 1118)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-350::unit-test::(Checksum: 3:69f2a0eabfb7d62fd9b19b379d73e8d3)
ALTER TABLE `krim_pnd_email_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_EMAIL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-350', '2.1.0-SNP', '3:69f2a0eabfb7d62fd9b19b379d73e8d3', 1119)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-351::unit-test::(Checksum: 3:58f762a768a2490291f7c531f1aa05de)
ALTER TABLE `krim_pnd_emp_info_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_EMP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-351', '2.1.0-SNP', '3:58f762a768a2490291f7c531f1aa05de', 1120)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-352::unit-test::(Checksum: 3:01e5e1cd96e386084208b2ffe8edfbb5)
ALTER TABLE `krim_pnd_grp_attr_data_t` ADD PRIMARY KEY (`FDOC_NBR`, `ATTR_DATA_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-352', '2.1.0-SNP', '3:01e5e1cd96e386084208b2ffe8edfbb5', 1121)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-353::unit-test::(Checksum: 3:7a5eab88d85512649f150641c25e3fee)
ALTER TABLE `krim_pnd_grp_mbr_t` ADD PRIMARY KEY (`FDOC_NBR`, `GRP_MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-353', '2.1.0-SNP', '3:7a5eab88d85512649f150641c25e3fee', 1122)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-354::unit-test::(Checksum: 3:15d92e1f89d2bf1fa2a9a4e7f94115b4)
ALTER TABLE `krim_pnd_grp_prncpl_mt` ADD PRIMARY KEY (`GRP_MBR_ID`, `FDOC_NBR`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-354', '2.1.0-SNP', '3:15d92e1f89d2bf1fa2a9a4e7f94115b4', 1123)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-355::unit-test::(Checksum: 3:32fd83710b9ec8ecdf6d8f0c87d6c882)
ALTER TABLE `krim_pnd_nm_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_NM_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-355', '2.1.0-SNP', '3:32fd83710b9ec8ecdf6d8f0c87d6c882', 1124)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-356::unit-test::(Checksum: 3:680d00a738025cac4465af12b056e386)
ALTER TABLE `krim_pnd_phone_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ENTITY_PHONE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-356', '2.1.0-SNP', '3:680d00a738025cac4465af12b056e386', 1125)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-357::unit-test::(Checksum: 3:81fd1b767e7c2487fcf602d03a54cdcb)
ALTER TABLE `krim_pnd_role_mbr_attr_data_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ATTR_DATA_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-357', '2.1.0-SNP', '3:81fd1b767e7c2487fcf602d03a54cdcb', 1126)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-358::unit-test::(Checksum: 3:13267de667644a73a1f180586d3eb056)
ALTER TABLE `krim_pnd_role_mbr_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ROLE_MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-358', '2.1.0-SNP', '3:13267de667644a73a1f180586d3eb056', 1127)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-359::unit-test::(Checksum: 3:1de741829749ceb36c3f56e1cfb9469d)
ALTER TABLE `krim_pnd_role_mt` ADD PRIMARY KEY (`FDOC_NBR`, `ROLE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-359', '2.1.0-SNP', '3:1de741829749ceb36c3f56e1cfb9469d', 1128)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-360::unit-test::(Checksum: 3:a495050d0d2583904f696e83e04b4dea)
ALTER TABLE `krim_pnd_role_perm_t` ADD PRIMARY KEY (`FDOC_NBR`, `ROLE_PERM_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-360', '2.1.0-SNP', '3:a495050d0d2583904f696e83e04b4dea', 1129)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-361::unit-test::(Checksum: 3:92af01688679ac4570ba17293876da3c)
ALTER TABLE `krim_pnd_role_rsp_actn_mt` ADD PRIMARY KEY (`ROLE_RSP_ACTN_ID`, `FDOC_NBR`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-361', '2.1.0-SNP', '3:92af01688679ac4570ba17293876da3c', 1130)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-362::unit-test::(Checksum: 3:6b4a83fef325b63ecb389f1fafd61701)
ALTER TABLE `krim_pnd_role_rsp_t` ADD PRIMARY KEY (`FDOC_NBR`, `ROLE_RSP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-362', '2.1.0-SNP', '3:6b4a83fef325b63ecb389f1fafd61701', 1131)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-363::unit-test::(Checksum: 3:25fd5bec2cd50718f27f0d7ac276fe48)
ALTER TABLE `krlc_cnty_t` ADD PRIMARY KEY (`COUNTY_CD`, `STATE_CD`, `POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-363', '2.1.0-SNP', '3:25fd5bec2cd50718f27f0d7ac276fe48', 1132)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-364::unit-test::(Checksum: 3:368821ccc7ef17504cfe27c7e0531fa7)
ALTER TABLE `krlc_pstl_cd_t` ADD PRIMARY KEY (`POSTAL_CD`, `POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-364', '2.1.0-SNP', '3:368821ccc7ef17504cfe27c7e0531fa7', 1133)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-365::unit-test::(Checksum: 3:cd21a3a09dff206293225a4812f065fb)
ALTER TABLE `krlc_st_t` ADD PRIMARY KEY (`POSTAL_STATE_CD`, `POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-365', '2.1.0-SNP', '3:cd21a3a09dff206293225a4812f065fb', 1134)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-366::unit-test::(Checksum: 3:5c904659646a240054cd7843e2313d7b)
ALTER TABLE `krms_cmpnd_prop_props_t` ADD PRIMARY KEY (`CMPND_PROP_ID`, `PROP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-366', '2.1.0-SNP', '3:5c904659646a240054cd7843e2313d7b', 1135)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-367::unit-test::(Checksum: 3:debe80189d88ad9c20f883b5df5f33a2)
ALTER TABLE `krms_func_ctgry_t` ADD PRIMARY KEY (`FUNC_ID`, `CTGRY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-367', '2.1.0-SNP', '3:debe80189d88ad9c20f883b5df5f33a2', 1136)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-368::unit-test::(Checksum: 3:8301d3f6d289625c9b571ea9e0af29e0)
ALTER TABLE `krms_term_rslvr_input_spec_t` ADD PRIMARY KEY (`TERM_SPEC_ID`, `TERM_RSLVR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-368', '2.1.0-SNP', '3:8301d3f6d289625c9b571ea9e0af29e0', 1137)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-369::unit-test::(Checksum: 3:7a42ece28fff5cfeadd3fd15671de021)
ALTER TABLE `krms_term_spec_ctgry_t` ADD PRIMARY KEY (`TERM_SPEC_ID`, `CTGRY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-369', '2.1.0-SNP', '3:7a42ece28fff5cfeadd3fd15671de021', 1138)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-370::unit-test::(Checksum: 3:b70e5ada92683fef92ccb704d0f94dc6)
ALTER TABLE `krns_adhoc_rte_actn_recip_t` ADD PRIMARY KEY (`RECIP_TYP_CD`, `ACTN_RQST_CD`, `ACTN_RQST_RECIP_ID`, `DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-370', '2.1.0-SNP', '3:b70e5ada92683fef92ccb704d0f94dc6', 1139)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-371::unit-test::(Checksum: 3:59a7f21883399ef22c1ed7817fd9fdb3)
ALTER TABLE `krns_sesn_doc_t` ADD PRIMARY KEY (`SESN_DOC_ID`, `DOC_HDR_ID`, `PRNCPL_ID`, `IP_ADDR`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-371', '2.1.0-SNP', '3:59a7f21883399ef22c1ed7817fd9fdb3', 1140)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-372::unit-test::(Checksum: 3:bde6284954f5740357cb1c01123cf9c5)
ALTER TABLE `krsb_qrtz_blob_triggers` ADD PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-372', '2.1.0-SNP', '3:bde6284954f5740357cb1c01123cf9c5', 1141)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-373::unit-test::(Checksum: 3:2db00a9688814eebdc76af04c03ad307)
ALTER TABLE `krsb_qrtz_cron_triggers` ADD PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-373', '2.1.0-SNP', '3:2db00a9688814eebdc76af04c03ad307', 1142)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-374::unit-test::(Checksum: 3:f319e6fcc7654ac4fbc28d522093100d)
ALTER TABLE `krsb_qrtz_job_details` ADD PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-374', '2.1.0-SNP', '3:f319e6fcc7654ac4fbc28d522093100d', 1143)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-375::unit-test::(Checksum: 3:c1b2c801f3de28cdf07629e4e2785448)
ALTER TABLE `krsb_qrtz_job_listeners` ADD PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`, `JOB_LISTENER`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-375', '2.1.0-SNP', '3:c1b2c801f3de28cdf07629e4e2785448', 1144)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-376::unit-test::(Checksum: 3:b335d7517940900db9887bd5ef00ba85)
ALTER TABLE `krsb_qrtz_simple_triggers` ADD PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-376', '2.1.0-SNP', '3:b335d7517940900db9887bd5ef00ba85', 1145)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-377::unit-test::(Checksum: 3:e2c4254bfd474fb6d2a80b02e20964e2)
ALTER TABLE `krsb_qrtz_trigger_listeners` ADD PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_LISTENER`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-377', '2.1.0-SNP', '3:e2c4254bfd474fb6d2a80b02e20964e2', 1146)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-378::unit-test::(Checksum: 3:bdfba49086b70632271c3c13c6680798)
ALTER TABLE `krsb_qrtz_triggers` ADD PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-378', '2.1.0-SNP', '3:bdfba49086b70632271c3c13c6680798', 1147)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-379::unit-test::(Checksum: 3:3f02f5aa1a235f4e0abffcc54d9881b1)
ALTER TABLE `trav_doc_2_accounts` ADD PRIMARY KEY (`FDOC_NBR`, `ACCT_NUM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-379', '2.1.0-SNP', '3:3f02f5aa1a235f4e0abffcc54d9881b1', 1148)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-380::unit-test::(Checksum: 3:3a3d5464046d6ca3f1d46c070659eac2)
ALTER TABLE `trv_acct_ext` ADD PRIMARY KEY (`ACCT_NUM`, `ACCT_TYPE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-380', '2.1.0-SNP', '3:3a3d5464046d6ca3f1d46c070659eac2', 1149)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-381::unit-test::(Checksum: 3:94c4492fb17e1e836bf6afa30f4f4ef2)
ALTER TABLE `trv_doc_acct` ADD PRIMARY KEY (`DOC_HDR_ID`, `ACCT_NUM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Primary Key', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-381', '2.1.0-SNP', '3:94c4492fb17e1e836bf6afa30f4f4ef2', 1150)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-382::unit-test::(Checksum: 3:4114d3a1157b1654d396e32156cf09d8)
CREATE UNIQUE INDEX `KRNS_PARM_DTL_TYP_TC0` ON `krcr_cmpnt_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-382', '2.1.0-SNP', '3:4114d3a1157b1654d396e32156cf09d8', 1151)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-383::unit-test::(Checksum: 3:fbf891e1386d60a7a942d382e4ce0b1c)
CREATE UNIQUE INDEX `KRNS_NMSPC_TC0` ON `krcr_nmspc_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-383', '2.1.0-SNP', '3:fbf891e1386d60a7a942d382e4ce0b1c', 1152)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-384::unit-test::(Checksum: 3:f05dda90c5ef681ac11e199e71e25bfe)
CREATE UNIQUE INDEX `KRNS_PARM_TC0` ON `krcr_parm_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-384', '2.1.0-SNP', '3:f05dda90c5ef681ac11e199e71e25bfe', 1153)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-385::unit-test::(Checksum: 3:c6d0ecc9c7cfd04a71d81f608f1c2743)
CREATE INDEX `KRNS_PARM_TR2` ON `krcr_parm_t`(`PARM_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-385', '2.1.0-SNP', '3:c6d0ecc9c7cfd04a71d81f608f1c2743', 1154)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-386::unit-test::(Checksum: 3:d99b35cbd8f5b5e0fabe68a5ea54b147)
CREATE UNIQUE INDEX `KRNS_PARM_TYP_TC0` ON `krcr_parm_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-386', '2.1.0-SNP', '3:d99b35cbd8f5b5e0fabe68a5ea54b147', 1155)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-387::unit-test::(Checksum: 3:cdb9b8407692b6904965db4169a26736)
CREATE INDEX `KREN_CHNL_PRODCR_TI1` ON `kren_chnl_prodcr_t`(`CHNL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-387', '2.1.0-SNP', '3:cdb9b8407692b6904965db4169a26736', 1156)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-388::unit-test::(Checksum: 3:701654b7be0fc3515af46184b965c24e)
CREATE INDEX `KREN_CHNL_PRODCR_TI2` ON `kren_chnl_prodcr_t`(`PRODCR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-388', '2.1.0-SNP', '3:701654b7be0fc3515af46184b965c24e', 1157)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-389::unit-test::(Checksum: 3:59a9fe4daa464bb0c0ce0443a06dd81e)
CREATE UNIQUE INDEX `KREN_CHNL_SUBSCRP_TC0` ON `kren_chnl_subscrp_t`(`CHNL_ID`, `PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-389', '2.1.0-SNP', '3:59a9fe4daa464bb0c0ce0443a06dd81e', 1158)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-390::unit-test::(Checksum: 3:0cbcaa428b9b887f30200d06c448f5d7)
CREATE INDEX `KREN_CHNL_SUBSCRP_TI1` ON `kren_chnl_subscrp_t`(`CHNL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-390', '2.1.0-SNP', '3:0cbcaa428b9b887f30200d06c448f5d7', 1159)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-391::unit-test::(Checksum: 3:383ca836d4c39d39f7eec2e9d4203f7a)
CREATE UNIQUE INDEX `KREN_CHNL_TC0` ON `kren_chnl_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-391', '2.1.0-SNP', '3:383ca836d4c39d39f7eec2e9d4203f7a', 1160)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-392::unit-test::(Checksum: 3:b89d51dd6b0c4d43821bbc0a3476cd9c)
CREATE UNIQUE INDEX `KREN_CNTNT_TYP_TC0` ON `kren_cntnt_typ_t`(`NM`, `CNTNT_TYP_VER_NBR`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-392', '2.1.0-SNP', '3:b89d51dd6b0c4d43821bbc0a3476cd9c', 1161)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-393::unit-test::(Checksum: 3:67def80d81f2344573e839e9f82c0bb9)
CREATE UNIQUE INDEX `KREN_MSG_DELIV_TC0` ON `kren_msg_deliv_t`(`MSG_ID`, `TYP_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-393', '2.1.0-SNP', '3:67def80d81f2344573e839e9f82c0bb9', 1162)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-394::unit-test::(Checksum: 3:0c831080bac3a195755dda7ef65d01f9)
CREATE INDEX `KREN_MSG_DELIV_TI1` ON `kren_msg_deliv_t`(`MSG_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-394', '2.1.0-SNP', '3:0c831080bac3a195755dda7ef65d01f9', 1163)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-395::unit-test::(Checksum: 3:eba38fcdd5f9fc268382dd2be58da771)
CREATE UNIQUE INDEX `KREN_MSG_TC0` ON `kren_msg_t`(`ORGN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-395', '2.1.0-SNP', '3:eba38fcdd5f9fc268382dd2be58da771', 1164)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-396::unit-test::(Checksum: 3:fda829014290b8e8193ddc536018bdad)
CREATE INDEX `KREN_MSG_DELIVSI1` ON `kren_ntfctn_msg_deliv_t`(`NTFCTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-396', '2.1.0-SNP', '3:fda829014290b8e8193ddc536018bdad', 1165)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-397::unit-test::(Checksum: 3:c18cba77dac56a43dc56b8bd97b158e8)
CREATE UNIQUE INDEX `KREN_NTFCTN_MSG_DELIV_TC0` ON `kren_ntfctn_msg_deliv_t`(`NTFCTN_ID`, `RECIP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-397', '2.1.0-SNP', '3:c18cba77dac56a43dc56b8bd97b158e8', 1166)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-398::unit-test::(Checksum: 3:3758a791fe061542e437b7327ba71793)
CREATE INDEX `KREN_NTFCTN_FK1` ON `kren_ntfctn_t`(`CHNL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-398', '2.1.0-SNP', '3:3758a791fe061542e437b7327ba71793', 1167)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-399::unit-test::(Checksum: 3:f6102fcf2ca58b1ba2c550835ed0d383)
CREATE INDEX `KREN_NTFCTN_I1` ON `kren_ntfctn_t`(`CNTNT_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-399', '2.1.0-SNP', '3:f6102fcf2ca58b1ba2c550835ed0d383', 1168)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-400::unit-test::(Checksum: 3:554d64baf01d3e802981785e795a0b90)
CREATE INDEX `KREN_NTFCTN_I2` ON `kren_ntfctn_t`(`PRIO_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-400', '2.1.0-SNP', '3:554d64baf01d3e802981785e795a0b90', 1169)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-401::unit-test::(Checksum: 3:52fc5aaa37dd21a70d37aff2db6b119d)
CREATE INDEX `KREN_NTFCTN_I3` ON `kren_ntfctn_t`(`PRODCR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-401', '2.1.0-SNP', '3:52fc5aaa37dd21a70d37aff2db6b119d', 1170)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-402::unit-test::(Checksum: 3:8ce51c7ad3dcc6ad8d3603b42688cf88)
CREATE UNIQUE INDEX `KREN_PRIO_TC0` ON `kren_prio_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-402', '2.1.0-SNP', '3:8ce51c7ad3dcc6ad8d3603b42688cf88', 1171)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-403::unit-test::(Checksum: 3:6ced347ac4a005c4293cbff394aedd6a)
CREATE UNIQUE INDEX `KREN_PRODCR_TC0` ON `kren_prodcr_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-403', '2.1.0-SNP', '3:6ced347ac4a005c4293cbff394aedd6a', 1172)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-404::unit-test::(Checksum: 3:c72524f8234724e426611a5b912def10)
CREATE UNIQUE INDEX `KREN_RECIP_LIST_TC0` ON `kren_recip_list_t`(`CHNL_ID`, `RECIP_TYP_CD`, `RECIP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-404', '2.1.0-SNP', '3:c72524f8234724e426611a5b912def10', 1173)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-405::unit-test::(Checksum: 3:2ad4727845f72e12954b8642bc1688b2)
CREATE INDEX `KREN_RECIP_LIST_TI1` ON `kren_recip_list_t`(`CHNL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-405', '2.1.0-SNP', '3:2ad4727845f72e12954b8642bc1688b2', 1174)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-406::unit-test::(Checksum: 3:6f06afc77c121a2899c2c7c634e88f33)
CREATE UNIQUE INDEX `KREN_RECIP_PREFS_TC0` ON `kren_recip_prefs_t`(`RECIP_ID`, `PROP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-406', '2.1.0-SNP', '3:6f06afc77c121a2899c2c7c634e88f33', 1175)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-407::unit-test::(Checksum: 3:0b89153695b1226ed648a775a254b64c)
CREATE UNIQUE INDEX `KREN_RECIP_TC0` ON `kren_recip_t`(`NTFCTN_ID`, `RECIP_TYP_CD`, `PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-407', '2.1.0-SNP', '3:0b89153695b1226ed648a775a254b64c', 1176)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-408::unit-test::(Checksum: 3:2ecd4d0aa86df04ccfb1f521a68c9e76)
CREATE INDEX `KREN_RECIP_TI1` ON `kren_recip_t`(`NTFCTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-408', '2.1.0-SNP', '3:2ecd4d0aa86df04ccfb1f521a68c9e76', 1177)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-409::unit-test::(Checksum: 3:c1747d3a22fc7b3aa3675bb4d023456a)
CREATE UNIQUE INDEX `KREN_RVWER_TC0` ON `kren_rvwer_t`(`CHNL_ID`, `TYP`, `PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-409', '2.1.0-SNP', '3:c1747d3a22fc7b3aa3675bb4d023456a', 1178)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-410::unit-test::(Checksum: 3:c6d8fce9db1211c8eb319f9992ad58ed)
CREATE INDEX `KREN_RVWER_TI1` ON `kren_rvwer_t`(`CHNL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-410', '2.1.0-SNP', '3:c6d8fce9db1211c8eb319f9992ad58ed', 1179)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-411::unit-test::(Checksum: 3:72b2dab829a89bc87167817ec2ce64f7)
CREATE UNIQUE INDEX `KREN_SNDR_TC0` ON `kren_sndr_t`(`NTFCTN_ID`, `NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-411', '2.1.0-SNP', '3:72b2dab829a89bc87167817ec2ce64f7', 1180)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-412::unit-test::(Checksum: 3:c46e2ef07d02672e7fbb9f47cb303c2e)
CREATE INDEX `KREN_SNDR_TI1` ON `kren_sndr_t`(`NTFCTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-412', '2.1.0-SNP', '3:c46e2ef07d02672e7fbb9f47cb303c2e', 1181)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-413::unit-test::(Checksum: 3:c1478398f92a29ac61923e078ded82bf)
CREATE INDEX `KREW_ACTN_ITM_T1` ON `krew_actn_itm_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-413', '2.1.0-SNP', '3:c1478398f92a29ac61923e078ded82bf', 1182)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-414::unit-test::(Checksum: 3:8b31b2d17c227e82b0ca2e9b3aecf0de)
CREATE INDEX `KREW_ACTN_ITM_TI2` ON `krew_actn_itm_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-414', '2.1.0-SNP', '3:8b31b2d17c227e82b0ca2e9b3aecf0de', 1183)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-415::unit-test::(Checksum: 3:94afc3bd3c45d4c343e852ea382f27e6)
CREATE INDEX `KREW_ACTN_ITM_TI3` ON `krew_actn_itm_t`(`ACTN_RQST_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-415', '2.1.0-SNP', '3:94afc3bd3c45d4c343e852ea382f27e6', 1184)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-416::unit-test::(Checksum: 3:d270a6c207dbc43800f1b8e12b4fc653)
CREATE INDEX `KREW_ACTN_ITM_TI5` ON `krew_actn_itm_t`(`PRNCPL_ID`, `DLGN_TYP`, `DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-416', '2.1.0-SNP', '3:d270a6c207dbc43800f1b8e12b4fc653', 1185)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-417::unit-test::(Checksum: 3:8cd43ab10dcfd4946491289c76c1fcac)
CREATE INDEX `KREW_ACTN_RQST_T11` ON `krew_actn_rqst_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-417', '2.1.0-SNP', '3:8cd43ab10dcfd4946491289c76c1fcac', 1186)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-418::unit-test::(Checksum: 3:62b212eab3fdda06d504c1459c38729a)
CREATE INDEX `KREW_ACTN_RQST_T12` ON `krew_actn_rqst_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-418', '2.1.0-SNP', '3:62b212eab3fdda06d504c1459c38729a', 1187)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-419::unit-test::(Checksum: 3:2f3424afe8b497902f8f953519fb9a73)
CREATE INDEX `KREW_ACTN_RQST_T13` ON `krew_actn_rqst_t`(`ACTN_TKN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-419', '2.1.0-SNP', '3:2f3424afe8b497902f8f953519fb9a73', 1188)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-420::unit-test::(Checksum: 3:b92866720e04e8eadbe73d1c9197dfd3)
CREATE INDEX `KREW_ACTN_RQST_T14` ON `krew_actn_rqst_t`(`PARNT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-420', '2.1.0-SNP', '3:b92866720e04e8eadbe73d1c9197dfd3', 1189)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-421::unit-test::(Checksum: 3:834300492c9de103a18cb5cec416c1e6)
CREATE INDEX `KREW_ACTN_RQST_T15` ON `krew_actn_rqst_t`(`RSP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-421', '2.1.0-SNP', '3:834300492c9de103a18cb5cec416c1e6', 1190)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-422::unit-test::(Checksum: 3:d1f16636f6a8b4b417e6e1a97cf596f4)
CREATE INDEX `KREW_ACTN_RQST_T16` ON `krew_actn_rqst_t`(`STAT_CD`, `RSP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-422', '2.1.0-SNP', '3:d1f16636f6a8b4b417e6e1a97cf596f4', 1191)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-423::unit-test::(Checksum: 3:e120807313ad2c8d09af67395f0b4354)
CREATE INDEX `KREW_ACTN_RQST_T17` ON `krew_actn_rqst_t`(`RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-423', '2.1.0-SNP', '3:e120807313ad2c8d09af67395f0b4354', 1192)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-424::unit-test::(Checksum: 3:21b2ec598f58d8db1fae8bb2e8c8f72d)
CREATE INDEX `KREW_ACTN_RQST_T19` ON `krew_actn_rqst_t`(`STAT_CD`, `DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-424', '2.1.0-SNP', '3:21b2ec598f58d8db1fae8bb2e8c8f72d', 1193)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-425::unit-test::(Checksum: 3:f78433391f03f2da6450ec4e4672c25d)
CREATE INDEX `KREW_ACTN_TKN_TI1` ON `krew_actn_tkn_t`(`DOC_HDR_ID`, `PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-425', '2.1.0-SNP', '3:f78433391f03f2da6450ec4e4672c25d', 1194)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-426::unit-test::(Checksum: 3:1d3d01390b187f0049d596d214e8164b)
CREATE INDEX `KREW_ACTN_TKN_TI2` ON `krew_actn_tkn_t`(`DOC_HDR_ID`, `PRNCPL_ID`, `ACTN_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-426', '2.1.0-SNP', '3:1d3d01390b187f0049d596d214e8164b', 1195)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-427::unit-test::(Checksum: 3:660269b8a067487006e5f39e08d4ff9d)
CREATE INDEX `KREW_ACTN_TKN_TI3` ON `krew_actn_tkn_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-427', '2.1.0-SNP', '3:660269b8a067487006e5f39e08d4ff9d', 1196)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-428::unit-test::(Checksum: 3:f16eb8550a68dd162fc805025f3605f1)
CREATE INDEX `KREW_ACTN_TKN_TI4` ON `krew_actn_tkn_t`(`DLGTR_PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-428', '2.1.0-SNP', '3:f16eb8550a68dd162fc805025f3605f1', 1197)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-429::unit-test::(Checksum: 3:dc943575225f4e0209a36864f146fcdf)
CREATE INDEX `KREW_ACTN_TKN_TI5` ON `krew_actn_tkn_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-429', '2.1.0-SNP', '3:dc943575225f4e0209a36864f146fcdf', 1198)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-430::unit-test::(Checksum: 3:93a49113434313946d16c45aed85ef31)
CREATE INDEX `KREW_APP_DOC_STAT_TI1` ON `krew_app_doc_stat_tran_t`(`DOC_HDR_ID`, `STAT_TRANS_DATE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-430', '2.1.0-SNP', '3:93a49113434313946d16c45aed85ef31', 1199)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-431::unit-test::(Checksum: 3:ed43a87acdd245cd5b442a75f3e2b2be)
CREATE INDEX `KREW_APP_DOC_STAT_TI2` ON `krew_app_doc_stat_tran_t`(`DOC_HDR_ID`, `APP_DOC_STAT_FROM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-431', '2.1.0-SNP', '3:ed43a87acdd245cd5b442a75f3e2b2be', 1200)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-432::unit-test::(Checksum: 3:1f9e7d7eb0c30db49f2fbc5fd59e4e04)
CREATE INDEX `KREW_APP_DOC_STAT_TI3` ON `krew_app_doc_stat_tran_t`(`DOC_HDR_ID`, `APP_DOC_STAT_TO`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-432', '2.1.0-SNP', '3:1f9e7d7eb0c30db49f2fbc5fd59e4e04', 1201)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-433::unit-test::(Checksum: 3:ce4e0a4f79c168e92262052cb22eb999)
CREATE UNIQUE INDEX `KREW_APP_DOC_STAT_TRAN_TC0` ON `krew_app_doc_stat_tran_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-433', '2.1.0-SNP', '3:ce4e0a4f79c168e92262052cb22eb999', 1202)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-434::unit-test::(Checksum: 3:26c58a819221bb1c66aac100f4814cb2)
CREATE INDEX `KREW_ATT_TI1` ON `krew_att_t`(`NTE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-434', '2.1.0-SNP', '3:26c58a819221bb1c66aac100f4814cb2', 1203)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-435::unit-test::(Checksum: 3:5da9d6eb56b608cae68a69a764269ef0)
CREATE UNIQUE INDEX `KREW_DLGN_RSP_TC0` ON `krew_dlgn_rsp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-435', '2.1.0-SNP', '3:5da9d6eb56b608cae68a69a764269ef0', 1204)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-436::unit-test::(Checksum: 3:d28f23b5fc29c21f017f7bc608bc6ed2)
CREATE INDEX `KREW_DOC_HDR_EXT_DT_TI1` ON `krew_doc_hdr_ext_dt_t`(`KEY_CD`, `VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-436', '2.1.0-SNP', '3:d28f23b5fc29c21f017f7bc608bc6ed2', 1205)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-437::unit-test::(Checksum: 3:438ea12c13e5fe2a69f2c5ba0832d228)
CREATE INDEX `KREW_DOC_HDR_EXT_DT_TI2` ON `krew_doc_hdr_ext_dt_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-437', '2.1.0-SNP', '3:438ea12c13e5fe2a69f2c5ba0832d228', 1206)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-438::unit-test::(Checksum: 3:24eb18a21928cdda5bc2ef2e194d96f6)
CREATE INDEX `KREW_DOC_HDR_EXT_DT_TI3` ON `krew_doc_hdr_ext_dt_t`(`VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-438', '2.1.0-SNP', '3:24eb18a21928cdda5bc2ef2e194d96f6', 1207)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-439::unit-test::(Checksum: 3:553b79746b7376c83640c6ea841eadcd)
CREATE INDEX `KREW_DOC_HDR_EXT_FLT_TI1` ON `krew_doc_hdr_ext_flt_t`(`KEY_CD`, `VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-439', '2.1.0-SNP', '3:553b79746b7376c83640c6ea841eadcd', 1208)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-440::unit-test::(Checksum: 3:78aee53590f89a4c646c1c526964bbb0)
CREATE INDEX `KREW_DOC_HDR_EXT_FLT_TI2` ON `krew_doc_hdr_ext_flt_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-440', '2.1.0-SNP', '3:78aee53590f89a4c646c1c526964bbb0', 1209)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-441::unit-test::(Checksum: 3:b399f932658ff06c821b8f42bdab25f9)
CREATE INDEX `KREW_DOC_HDR_EXT_FLT_TI3` ON `krew_doc_hdr_ext_flt_t`(`VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-441', '2.1.0-SNP', '3:b399f932658ff06c821b8f42bdab25f9', 1210)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-442::unit-test::(Checksum: 3:bce65ad2a16031e486599e1eae722519)
CREATE INDEX `KREW_DOC_HDR_EXT_LONG_TI1` ON `krew_doc_hdr_ext_long_t`(`KEY_CD`, `VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-442', '2.1.0-SNP', '3:bce65ad2a16031e486599e1eae722519', 1211)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-443::unit-test::(Checksum: 3:f22357471f7261847b653b03ea62b21b)
CREATE INDEX `KREW_DOC_HDR_EXT_LONG_TI2` ON `krew_doc_hdr_ext_long_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-443', '2.1.0-SNP', '3:f22357471f7261847b653b03ea62b21b', 1212)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-444::unit-test::(Checksum: 3:d61db07f7ba65ab544a4d375a996e145)
CREATE INDEX `KREW_DOC_HDR_EXT_LONG_TI3` ON `krew_doc_hdr_ext_long_t`(`VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-444', '2.1.0-SNP', '3:d61db07f7ba65ab544a4d375a996e145', 1213)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-445::unit-test::(Checksum: 3:a11a34f493c48901473f97ad5a602233)
CREATE INDEX `KREW_DOC_HDR_EXT_TI1` ON `krew_doc_hdr_ext_t`(`KEY_CD`, `VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-445', '2.1.0-SNP', '3:a11a34f493c48901473f97ad5a602233', 1214)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-446::unit-test::(Checksum: 3:a3eca1a18a74cf2fafa5af2cf0ccca3b)
CREATE INDEX `KREW_DOC_HDR_EXT_TI2` ON `krew_doc_hdr_ext_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-446', '2.1.0-SNP', '3:a3eca1a18a74cf2fafa5af2cf0ccca3b', 1215)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-447::unit-test::(Checksum: 3:3377b426fc58e822575ff15f5345a62d)
CREATE INDEX `KREW_DOC_HDR_EXT_TI3` ON `krew_doc_hdr_ext_t`(`VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-447', '2.1.0-SNP', '3:3377b426fc58e822575ff15f5345a62d', 1216)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-448::unit-test::(Checksum: 3:67582a51cb95d11706dba81522c42e83)
CREATE INDEX `KREW_DOC_HDR_T10` ON `krew_doc_hdr_t`(`APP_DOC_STAT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-448', '2.1.0-SNP', '3:67582a51cb95d11706dba81522c42e83', 1217)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-449::unit-test::(Checksum: 3:3b2af0042dc8b99e7f9652112199f0af)
CREATE INDEX `KREW_DOC_HDR_T12` ON `krew_doc_hdr_t`(`APP_DOC_STAT_MDFN_DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-449', '2.1.0-SNP', '3:3b2af0042dc8b99e7f9652112199f0af', 1218)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-450::unit-test::(Checksum: 3:4188382300bf089dd96eadc0e8e2ad5c)
CREATE UNIQUE INDEX `KREW_DOC_HDR_TC0` ON `krew_doc_hdr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-450', '2.1.0-SNP', '3:4188382300bf089dd96eadc0e8e2ad5c', 1219)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-451::unit-test::(Checksum: 3:b7cd7d1653cf806b344fb550349d9700)
CREATE INDEX `KREW_DOC_HDR_TI1` ON `krew_doc_hdr_t`(`DOC_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-451', '2.1.0-SNP', '3:b7cd7d1653cf806b344fb550349d9700', 1220)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-452::unit-test::(Checksum: 3:8037dc034df99bc56317999ddd05c357)
CREATE INDEX `KREW_DOC_HDR_TI2` ON `krew_doc_hdr_t`(`INITR_PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-452', '2.1.0-SNP', '3:8037dc034df99bc56317999ddd05c357', 1221)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-453::unit-test::(Checksum: 3:1c5a3476aa6d5f80ddbee59ffecc5680)
CREATE INDEX `KREW_DOC_HDR_TI3` ON `krew_doc_hdr_t`(`DOC_HDR_STAT_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-453', '2.1.0-SNP', '3:1c5a3476aa6d5f80ddbee59ffecc5680', 1222)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-454::unit-test::(Checksum: 3:ef7de20fa031fa31215f6ac97cb61abe)
CREATE INDEX `KREW_DOC_HDR_TI4` ON `krew_doc_hdr_t`(`TTL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-454', '2.1.0-SNP', '3:ef7de20fa031fa31215f6ac97cb61abe', 1223)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-455::unit-test::(Checksum: 3:93a54d2f8fcf4c5fea98bf708e7ff3d5)
CREATE INDEX `KREW_DOC_HDR_TI5` ON `krew_doc_hdr_t`(`CRTE_DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-455', '2.1.0-SNP', '3:93a54d2f8fcf4c5fea98bf708e7ff3d5', 1224)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-456::unit-test::(Checksum: 3:d2a746a66de84d7006f62e6a9706c998)
CREATE INDEX `KREW_DOC_HDR_TI6` ON `krew_doc_hdr_t`(`RTE_STAT_MDFN_DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-456', '2.1.0-SNP', '3:d2a746a66de84d7006f62e6a9706c998', 1225)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-457::unit-test::(Checksum: 3:9c35ff6c73b2a0943919bbbb67d7d8be)
CREATE INDEX `KREW_DOC_HDR_TI7` ON `krew_doc_hdr_t`(`APRV_DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-457', '2.1.0-SNP', '3:9c35ff6c73b2a0943919bbbb67d7d8be', 1226)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-458::unit-test::(Checksum: 3:cfce23ce8631b257c07439b7b3aa8a67)
CREATE INDEX `KREW_DOC_HDR_TI8` ON `krew_doc_hdr_t`(`FNL_DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-458', '2.1.0-SNP', '3:cfce23ce8631b257c07439b7b3aa8a67', 1227)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-459::unit-test::(Checksum: 3:b945e677663338738603d554c5b9cba5)
CREATE INDEX `KREW_DOC_HDR_TI9` ON `krew_doc_hdr_t`(`APP_DOC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-459', '2.1.0-SNP', '3:b945e677663338738603d554c5b9cba5', 1228)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-460::unit-test::(Checksum: 3:8a9a256789d665e0c5ed00aea9714726)
CREATE INDEX `KREW_DOC_LNK_TI1` ON `krew_doc_lnk_t`(`ORGN_DOC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-460', '2.1.0-SNP', '3:8a9a256789d665e0c5ed00aea9714726', 1229)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-461::unit-test::(Checksum: 3:9c1cc30139a2f480ed0a5607423c5f13)
CREATE INDEX `KREW_DOC_NTE_TI1` ON `krew_doc_nte_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-461', '2.1.0-SNP', '3:9c1cc30139a2f480ed0a5607423c5f13', 1230)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-462::unit-test::(Checksum: 3:756c31a1fd72533a615064822accf76c)
CREATE INDEX `KREW_DOC_TYP_APP_DOC_STAT_T1` ON `krew_doc_typ_app_doc_stat_t`(`DOC_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-462', '2.1.0-SNP', '3:756c31a1fd72533a615064822accf76c', 1231)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-463::unit-test::(Checksum: 3:930b9bad64f48f16b0aac29a6ca129ac)
CREATE UNIQUE INDEX `KREW_DOC_TYP_APP_DOC_STAT_TC0` ON `krew_doc_typ_app_doc_stat_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-463', '2.1.0-SNP', '3:930b9bad64f48f16b0aac29a6ca129ac', 1232)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-464::unit-test::(Checksum: 3:438c194d8995baec8f7b8a478c64e744)
CREATE INDEX `KREW_DOC_TYP_ATTR_TI1` ON `krew_doc_typ_attr_t`(`DOC_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-464', '2.1.0-SNP', '3:438c194d8995baec8f7b8a478c64e744', 1233)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-465::unit-test::(Checksum: 3:96bd265c02bf5d6b1edf9ff8e77f6572)
CREATE UNIQUE INDEX `KREW_DOC_TYP_PLCY_RELN_TC0` ON `krew_doc_typ_plcy_reln_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-465', '2.1.0-SNP', '3:96bd265c02bf5d6b1edf9ff8e77f6572', 1234)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-466::unit-test::(Checksum: 3:2b36581bb9205c3f7a94fabfc6f960db)
CREATE INDEX `KREW_DOC_TYP_PROC_TI1` ON `krew_doc_typ_proc_t`(`DOC_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-466', '2.1.0-SNP', '3:2b36581bb9205c3f7a94fabfc6f960db', 1235)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-467::unit-test::(Checksum: 3:271bb8535ddb3743bf4265284ddfd7e8)
CREATE INDEX `KREW_DOC_TYP_PROC_TI2` ON `krew_doc_typ_proc_t`(`INIT_RTE_NODE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-467', '2.1.0-SNP', '3:271bb8535ddb3743bf4265284ddfd7e8', 1236)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-468::unit-test::(Checksum: 3:3560ab246c1c240cbd67b8ed725467f8)
CREATE INDEX `KREW_DOC_TYP_PROC_TI3` ON `krew_doc_typ_proc_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-468', '2.1.0-SNP', '3:3560ab246c1c240cbd67b8ed725467f8', 1237)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-469::unit-test::(Checksum: 3:2912fd46ea36ec639815453877d609f3)
CREATE UNIQUE INDEX `KREW_DOC_TYP_TC0` ON `krew_doc_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-469', '2.1.0-SNP', '3:2912fd46ea36ec639815453877d609f3', 1238)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-470::unit-test::(Checksum: 3:8daeafbd0c669e624ec9ea14398dc804)
CREATE UNIQUE INDEX `KREW_DOC_TYP_TI1` ON `krew_doc_typ_t`(`DOC_TYP_NM`, `DOC_TYP_VER_NBR`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-470', '2.1.0-SNP', '3:8daeafbd0c669e624ec9ea14398dc804', 1239)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-471::unit-test::(Checksum: 3:c9acc7edfd354b186ce6aba28676ddcd)
CREATE INDEX `KREW_DOC_TYP_TI2` ON `krew_doc_typ_t`(`PARNT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-471', '2.1.0-SNP', '3:c9acc7edfd354b186ce6aba28676ddcd', 1240)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-472::unit-test::(Checksum: 3:f4c677c2557ea756a14a1592452c18fa)
CREATE INDEX `KREW_DOC_TYP_TI3` ON `krew_doc_typ_t`(`DOC_TYP_ID`, `PARNT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-472', '2.1.0-SNP', '3:f4c677c2557ea756a14a1592452c18fa', 1241)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-473::unit-test::(Checksum: 3:1daa574cd080cc98b09e3868d356f263)
CREATE INDEX `KREW_DOC_TYP_TI4` ON `krew_doc_typ_t`(`PREV_DOC_TYP_VER_NBR`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-473', '2.1.0-SNP', '3:1daa574cd080cc98b09e3868d356f263', 1242)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-474::unit-test::(Checksum: 3:01afde24c8ed4cfa341df6bda8fc30a1)
CREATE INDEX `KREW_DOC_TYP_TI5` ON `krew_doc_typ_t`(`CUR_IND`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-474', '2.1.0-SNP', '3:01afde24c8ed4cfa341df6bda8fc30a1', 1243)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-475::unit-test::(Checksum: 3:42500c04a617213190c6e885f4c3471c)
CREATE INDEX `KREW_DOC_TYP_TI6` ON `krew_doc_typ_t`(`DOC_TYP_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-475', '2.1.0-SNP', '3:42500c04a617213190c6e885f4c3471c', 1244)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-476::unit-test::(Checksum: 3:c4c006ac74597c62c0ebc79964b3a33c)
CREATE UNIQUE INDEX `KREW_EDL_ASSCTN_TC0` ON `krew_edl_assctn_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-476', '2.1.0-SNP', '3:c4c006ac74597c62c0ebc79964b3a33c', 1245)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-477::unit-test::(Checksum: 3:04d76e257a3f62eca0a3a57f74c82d98)
CREATE UNIQUE INDEX `KREW_EDL_DEF_TC0` ON `krew_edl_def_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-477', '2.1.0-SNP', '3:04d76e257a3f62eca0a3a57f74c82d98', 1246)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-478::unit-test::(Checksum: 3:e2c6e0a2d5418edaa1740f2d8ef18812)
CREATE INDEX `KREW_EDL_DMP_TI1` ON `krew_edl_dmp_t`(`DOC_TYP_NM`, `DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-478', '2.1.0-SNP', '3:e2c6e0a2d5418edaa1740f2d8ef18812', 1247)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-479::unit-test::(Checksum: 3:2f6abd3a535bd2c39e5e621997ad9857)
CREATE INDEX `KREW_HLP_TI1` ON `krew_hlp_t`(`KEY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-479', '2.1.0-SNP', '3:2f6abd3a535bd2c39e5e621997ad9857', 1248)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-480::unit-test::(Checksum: 3:daba1b721d822cbf92ecf67b3e7d2df9)
CREATE INDEX `KREW_INIT_RTE_NODE_INSTN_TI1` ON `krew_init_rte_node_instn_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-480', '2.1.0-SNP', '3:daba1b721d822cbf92ecf67b3e7d2df9', 1249)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-481::unit-test::(Checksum: 3:47f7ef81b2967ccd0f677bebfa7af246)
CREATE INDEX `KREW_INIT_RTE_NODE_INSTN_TI2` ON `krew_init_rte_node_instn_t`(`RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-481', '2.1.0-SNP', '3:47f7ef81b2967ccd0f677bebfa7af246', 1250)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-482::unit-test::(Checksum: 3:284e0a89b613c5153ca5fc611745ed90)
CREATE INDEX `KREW_OUT_BOX_ITM_TI1` ON `krew_out_box_itm_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-482', '2.1.0-SNP', '3:284e0a89b613c5153ca5fc611745ed90', 1251)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-483::unit-test::(Checksum: 3:dbc0a9fc5b8a707d217f77e8a7cc6c51)
CREATE INDEX `KREW_OUT_BOX_ITM_TI2` ON `krew_out_box_itm_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-483', '2.1.0-SNP', '3:dbc0a9fc5b8a707d217f77e8a7cc6c51', 1252)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-484::unit-test::(Checksum: 3:2869b86ab1369fcd9a174598dbba2266)
CREATE INDEX `KREW_OUT_BOX_ITM_TI3` ON `krew_out_box_itm_t`(`ACTN_RQST_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-484', '2.1.0-SNP', '3:2869b86ab1369fcd9a174598dbba2266', 1253)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-485::unit-test::(Checksum: 3:13ffa3386a334c3533488c4f1d1acbd3)
CREATE INDEX `KREW_RTE_BRCH_PROTO_TI1` ON `krew_rte_brch_proto_t`(`BRCH_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-485', '2.1.0-SNP', '3:13ffa3386a334c3533488c4f1d1acbd3', 1254)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-486::unit-test::(Checksum: 3:a68ac2c4d210443bbe7fb74d295c3412)
CREATE INDEX `KREW_RTE_BRCH_ST_TI1` ON `krew_rte_brch_st_t`(`RTE_BRCH_ID`, `KEY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-486', '2.1.0-SNP', '3:a68ac2c4d210443bbe7fb74d295c3412', 1255)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-487::unit-test::(Checksum: 3:8d54aed8c249861ee05ed27cd9612b5e)
CREATE INDEX `KREW_RTE_BRCH_ST_TI2` ON `krew_rte_brch_st_t`(`RTE_BRCH_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-487', '2.1.0-SNP', '3:8d54aed8c249861ee05ed27cd9612b5e', 1256)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-488::unit-test::(Checksum: 3:c6c4fd3fecada163f78c11a8114c252e)
CREATE INDEX `KREW_RTE_BRCH_ST_TI3` ON `krew_rte_brch_st_t`(`KEY_CD`, `VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-488', '2.1.0-SNP', '3:c6c4fd3fecada163f78c11a8114c252e', 1257)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-489::unit-test::(Checksum: 3:18bfc79aed5b92237777a93c231a7e5c)
CREATE INDEX `KREW_RTE_BRCH_TI1` ON `krew_rte_brch_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-489', '2.1.0-SNP', '3:18bfc79aed5b92237777a93c231a7e5c', 1258)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-490::unit-test::(Checksum: 3:e2f9fde3bc0d4e3ea34c0bc2f22a834a)
CREATE INDEX `KREW_RTE_BRCH_TI2` ON `krew_rte_brch_t`(`PARNT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-490', '2.1.0-SNP', '3:e2f9fde3bc0d4e3ea34c0bc2f22a834a', 1259)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-491::unit-test::(Checksum: 3:3c2f44d90cd7e8b0e2c187f8d1d082d2)
CREATE INDEX `KREW_RTE_BRCH_TI3` ON `krew_rte_brch_t`(`INIT_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-491', '2.1.0-SNP', '3:3c2f44d90cd7e8b0e2c187f8d1d082d2', 1260)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-492::unit-test::(Checksum: 3:4fceb116555ebbe849a74aa30492b61f)
CREATE INDEX `KREW_RTE_BRCH_TI4` ON `krew_rte_brch_t`(`SPLT_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-492', '2.1.0-SNP', '3:4fceb116555ebbe849a74aa30492b61f', 1261)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-493::unit-test::(Checksum: 3:e832624fcb5e435c8bca80d353582ee3)
CREATE INDEX `KREW_RTE_BRCH_TI5` ON `krew_rte_brch_t`(`JOIN_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-493', '2.1.0-SNP', '3:e832624fcb5e435c8bca80d353582ee3', 1262)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-494::unit-test::(Checksum: 3:ba08f8950cc0f46840d881dbf50ccc0b)
CREATE INDEX `KREW_RTE_NODE_CFG_PARM_TI1` ON `krew_rte_node_cfg_parm_t`(`RTE_NODE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-494', '2.1.0-SNP', '3:ba08f8950cc0f46840d881dbf50ccc0b', 1263)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-495::unit-test::(Checksum: 3:87e2dcee4b6e2bb92ed1d81fbccae1d3)
CREATE INDEX `KREW_RTE_NODE_INSTN_LNK_TI1` ON `krew_rte_node_instn_lnk_t`(`FROM_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-495', '2.1.0-SNP', '3:87e2dcee4b6e2bb92ed1d81fbccae1d3', 1264)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-496::unit-test::(Checksum: 3:69f640429aa7d7c7fdfb91d1b31a4c09)
CREATE INDEX `KREW_RTE_NODE_INSTN_LNK_TI2` ON `krew_rte_node_instn_lnk_t`(`TO_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-496', '2.1.0-SNP', '3:69f640429aa7d7c7fdfb91d1b31a4c09', 1265)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-497::unit-test::(Checksum: 3:d1e2c71f9fcce6946250a77a0cc7ce66)
CREATE INDEX `KREW_RTE_NODE_INSTN_ST_TI1` ON `krew_rte_node_instn_st_t`(`RTE_NODE_INSTN_ID`, `KEY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-497', '2.1.0-SNP', '3:d1e2c71f9fcce6946250a77a0cc7ce66', 1266)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-498::unit-test::(Checksum: 3:b729c00dee30bba523870b0db7864672)
CREATE INDEX `KREW_RTE_NODE_INSTN_ST_TI2` ON `krew_rte_node_instn_st_t`(`RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-498', '2.1.0-SNP', '3:b729c00dee30bba523870b0db7864672', 1267)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-499::unit-test::(Checksum: 3:87bb5fa597e176be3ee29c40cf65ecb5)
CREATE INDEX `KREW_RTE_NODE_INSTN_ST_TI3` ON `krew_rte_node_instn_st_t`(`KEY_CD`, `VAL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-499', '2.1.0-SNP', '3:87bb5fa597e176be3ee29c40cf65ecb5', 1268)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-500::unit-test::(Checksum: 3:1915af24ef0d4b9cc0a34335d5e21c9d)
CREATE INDEX `KREW_RTE_NODE_INSTN_TI1` ON `krew_rte_node_instn_t`(`DOC_HDR_ID`, `ACTV_IND`, `CMPLT_IND`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-500', '2.1.0-SNP', '3:1915af24ef0d4b9cc0a34335d5e21c9d', 1269)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-501::unit-test::(Checksum: 3:0c841a2b543dcf56ca3d80946b97311c)
CREATE INDEX `KREW_RTE_NODE_INSTN_TI2` ON `krew_rte_node_instn_t`(`RTE_NODE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-501', '2.1.0-SNP', '3:0c841a2b543dcf56ca3d80946b97311c', 1270)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-502::unit-test::(Checksum: 3:2026fd85a18b82cb2dd907fc584f8843)
CREATE INDEX `KREW_RTE_NODE_INSTN_TI3` ON `krew_rte_node_instn_t`(`BRCH_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-502', '2.1.0-SNP', '3:2026fd85a18b82cb2dd907fc584f8843', 1271)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-503::unit-test::(Checksum: 3:ac53d8475e0c106e8c0eb30f0fe6d0fd)
CREATE INDEX `KREW_RTE_NODE_INSTN_TI4` ON `krew_rte_node_instn_t`(`PROC_RTE_NODE_INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-503', '2.1.0-SNP', '3:ac53d8475e0c106e8c0eb30f0fe6d0fd', 1272)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-504::unit-test::(Checksum: 3:bb89f3124c409d827775d8f0eb4da148)
CREATE INDEX `KREW_RTE_NODE_LNK_TI1` ON `krew_rte_node_lnk_t`(`FROM_RTE_NODE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-504', '2.1.0-SNP', '3:bb89f3124c409d827775d8f0eb4da148', 1273)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-505::unit-test::(Checksum: 3:453288cdd190f1d63470c05c9172bf42)
CREATE INDEX `KREW_RTE_NODE_LNK_TI2` ON `krew_rte_node_lnk_t`(`TO_RTE_NODE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-505', '2.1.0-SNP', '3:453288cdd190f1d63470c05c9172bf42', 1274)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-506::unit-test::(Checksum: 3:77668518e17d076c86ef860d101c3249)
CREATE INDEX `KREW_RTE_NODE_TI1` ON `krew_rte_node_t`(`NM`, `DOC_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-506', '2.1.0-SNP', '3:77668518e17d076c86ef860d101c3249', 1275)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-507::unit-test::(Checksum: 3:c847c7d24e6840fc57ae765308555ee6)
CREATE INDEX `KREW_RTE_NODE_TI2` ON `krew_rte_node_t`(`DOC_TYP_ID`, `FNL_APRVR_IND`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-507', '2.1.0-SNP', '3:c847c7d24e6840fc57ae765308555ee6', 1276)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-508::unit-test::(Checksum: 3:459495e7b4e4f0f061b4586aeca87c9c)
CREATE INDEX `KREW_RTE_NODE_TI3` ON `krew_rte_node_t`(`BRCH_PROTO_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-508', '2.1.0-SNP', '3:459495e7b4e4f0f061b4586aeca87c9c', 1277)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-509::unit-test::(Checksum: 3:7e69412955dd87e851a135fa4650fb04)
CREATE INDEX `KREW_RTE_NODE_TI4` ON `krew_rte_node_t`(`DOC_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-509', '2.1.0-SNP', '3:7e69412955dd87e851a135fa4650fb04', 1278)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-510::unit-test::(Checksum: 3:a0c71487e9457954baf49ce206fd2e91)
CREATE UNIQUE INDEX `KREW_RULE_ATTR_TC0` ON `krew_rule_attr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-510', '2.1.0-SNP', '3:a0c71487e9457954baf49ce206fd2e91', 1279)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-511::unit-test::(Checksum: 3:b968257d0e08aa62197e85475f6892de)
CREATE UNIQUE INDEX `KREW_RULE_EXPR_TC0` ON `krew_rule_expr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-511', '2.1.0-SNP', '3:b968257d0e08aa62197e85475f6892de', 1280)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-512::unit-test::(Checksum: 3:a661cba03e57e0dfa0e9ddd687acd4e6)
CREATE INDEX `KREW_RULE_EXT_T1` ON `krew_rule_ext_t`(`RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-512', '2.1.0-SNP', '3:a661cba03e57e0dfa0e9ddd687acd4e6', 1281)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-513::unit-test::(Checksum: 3:ad2c69ee8aa2c33d9d79a3378d906e05)
CREATE INDEX `KREW_RULE_EXT_VAL_T1` ON `krew_rule_ext_val_t`(`RULE_EXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-513', '2.1.0-SNP', '3:ad2c69ee8aa2c33d9d79a3378d906e05', 1282)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-514::unit-test::(Checksum: 3:6bfbd57c399249e190da2a13f2828019)
CREATE INDEX `KREW_RULE_EXT_VAL_T2` ON `krew_rule_ext_val_t`(`RULE_EXT_VAL_ID`, `KEY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-514', '2.1.0-SNP', '3:6bfbd57c399249e190da2a13f2828019', 1283)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-515::unit-test::(Checksum: 3:a74424cc87bce10137f84403705a9a69)
CREATE UNIQUE INDEX `KREW_RULE_RSP_TC0` ON `krew_rule_rsp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-515', '2.1.0-SNP', '3:a74424cc87bce10137f84403705a9a69', 1284)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-516::unit-test::(Checksum: 3:f03e403c20029751283a72899a93c7f9)
CREATE INDEX `KREW_RULE_RSP_TI1` ON `krew_rule_rsp_t`(`RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-516', '2.1.0-SNP', '3:f03e403c20029751283a72899a93c7f9', 1285)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-517::unit-test::(Checksum: 3:b1f2aac4bd6a63334a860ac4a298046b)
CREATE UNIQUE INDEX `KREW_RULE_TC0` ON `krew_rule_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-517', '2.1.0-SNP', '3:b1f2aac4bd6a63334a860ac4a298046b', 1286)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-518::unit-test::(Checksum: 3:190301ac6d5b6b7839922821a508387c)
CREATE INDEX `KREW_RULE_TR1` ON `krew_rule_t`(`RULE_EXPR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-518', '2.1.0-SNP', '3:190301ac6d5b6b7839922821a508387c', 1287)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-519::unit-test::(Checksum: 3:9dc9680c14f8304479bccfdf91266616)
CREATE UNIQUE INDEX `KREW_RULE_TMPL_ATTR_TC0` ON `krew_rule_tmpl_attr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-519', '2.1.0-SNP', '3:9dc9680c14f8304479bccfdf91266616', 1288)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-520::unit-test::(Checksum: 3:b3a8094f36e4e0cacfbd2eeb119a76a2)
CREATE INDEX `KREW_RULE_TMPL_ATTR_TI1` ON `krew_rule_tmpl_attr_t`(`RULE_TMPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-520', '2.1.0-SNP', '3:b3a8094f36e4e0cacfbd2eeb119a76a2', 1289)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-521::unit-test::(Checksum: 3:b4d3590c76a134a88f9122e488b853b4)
CREATE INDEX `KREW_RULE_TMPL_ATTR_TI2` ON `krew_rule_tmpl_attr_t`(`RULE_ATTR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-521', '2.1.0-SNP', '3:b4d3590c76a134a88f9122e488b853b4', 1290)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-522::unit-test::(Checksum: 3:5a14f6eeabbb05633c862f7e45ce6917)
CREATE UNIQUE INDEX `KREW_RULE_TMPL_TC0` ON `krew_rule_tmpl_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-522', '2.1.0-SNP', '3:5a14f6eeabbb05633c862f7e45ce6917', 1291)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-523::unit-test::(Checksum: 3:f19e2057be611ba1cc77f63895398c8b)
CREATE UNIQUE INDEX `KREW_RULE_TMPL_TI1` ON `krew_rule_tmpl_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-523', '2.1.0-SNP', '3:f19e2057be611ba1cc77f63895398c8b', 1292)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-524::unit-test::(Checksum: 3:89d640b56f3e83c11179b2d3c86427f4)
CREATE UNIQUE INDEX `KREW_STYLE_TC0` ON `krew_style_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-524', '2.1.0-SNP', '3:89d640b56f3e83c11179b2d3c86427f4', 1293)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-525::unit-test::(Checksum: 3:bdbd32691ce7e7f4f12643b7065a5b2c)
CREATE INDEX `KREW_USR_OPTN_TI1` ON `krew_usr_optn_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-525', '2.1.0-SNP', '3:bdbd32691ce7e7f4f12643b7065a5b2c', 1294)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-526::unit-test::(Checksum: 3:21aff4d33a94b41b5ed7d9a6e4263581)
CREATE UNIQUE INDEX `KRIM_ADDR_TYP_TC0` ON `krim_addr_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-526', '2.1.0-SNP', '3:21aff4d33a94b41b5ed7d9a6e4263581', 1295)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-527::unit-test::(Checksum: 3:2bb4a01e1bd59910fd62853d2a5eac17)
CREATE UNIQUE INDEX `KRIM_ADDR_TYP_TC1` ON `krim_addr_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-527', '2.1.0-SNP', '3:2bb4a01e1bd59910fd62853d2a5eac17', 1296)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-528::unit-test::(Checksum: 3:404fb89260c975e93994963b6aa76945)
CREATE UNIQUE INDEX `KRIM_AFLTN_TYP_TC0` ON `krim_afltn_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-528', '2.1.0-SNP', '3:404fb89260c975e93994963b6aa76945', 1297)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-529::unit-test::(Checksum: 3:f7c5b39173849012c124d4113e9e5928)
CREATE UNIQUE INDEX `KRIM_AFLTN_TYP_TC1` ON `krim_afltn_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-529', '2.1.0-SNP', '3:f7c5b39173849012c124d4113e9e5928', 1298)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-530::unit-test::(Checksum: 3:3c4ab005419b3996951a084d3058982c)
CREATE UNIQUE INDEX `KRIM_ATTR_DEFN_TC0` ON `krim_attr_defn_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-530', '2.1.0-SNP', '3:3c4ab005419b3996951a084d3058982c', 1299)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-531::unit-test::(Checksum: 3:6f8321f2cf75e8d11b12e3a4ac41f9fe)
CREATE UNIQUE INDEX `KRIM_CTZNSHP_STAT_TC0` ON `krim_ctznshp_stat_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-531', '2.1.0-SNP', '3:6f8321f2cf75e8d11b12e3a4ac41f9fe', 1300)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-532::unit-test::(Checksum: 3:b691a416de0985222e069b2165ac5967)
CREATE UNIQUE INDEX `KRIM_CTZNSHP_STAT_TC1` ON `krim_ctznshp_stat_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-532', '2.1.0-SNP', '3:b691a416de0985222e069b2165ac5967', 1301)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-533::unit-test::(Checksum: 3:5fb91276a4974fa5062a00c5bbd67922)
CREATE UNIQUE INDEX `KRIM_DLGN_MBR_ATTR_DATA_TC0` ON `krim_dlgn_mbr_attr_data_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-533', '2.1.0-SNP', '3:5fb91276a4974fa5062a00c5bbd67922', 1302)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-534::unit-test::(Checksum: 3:a7e9db902cab387c9bb7dca09f9df3de)
CREATE INDEX `KRIM_DLGN_MBR_ATTR_DATA_TR1` ON `krim_dlgn_mbr_attr_data_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-534', '2.1.0-SNP', '3:a7e9db902cab387c9bb7dca09f9df3de', 1303)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-535::unit-test::(Checksum: 3:cc1588af5c617b8e6c6f0ae9b60e5148)
CREATE INDEX `KRIM_DLGN_MBR_ATTR_DATA_TR2` ON `krim_dlgn_mbr_attr_data_t`(`KIM_ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-535', '2.1.0-SNP', '3:cc1588af5c617b8e6c6f0ae9b60e5148', 1304)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-536::unit-test::(Checksum: 3:c16fddcd1dae8f3dad6183e50f4d2f84)
CREATE UNIQUE INDEX `KRIM_DLGN_MBR_TC0` ON `krim_dlgn_mbr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-536', '2.1.0-SNP', '3:c16fddcd1dae8f3dad6183e50f4d2f84', 1305)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-537::unit-test::(Checksum: 3:fe3f2876174b44676a5a8afd0781ef80)
CREATE INDEX `KRIM_DLGN_MBR_TR2` ON `krim_dlgn_mbr_t`(`DLGN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-537', '2.1.0-SNP', '3:fe3f2876174b44676a5a8afd0781ef80', 1306)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-538::unit-test::(Checksum: 3:f3706f135f14ed14c3a26eee13d187cc)
CREATE UNIQUE INDEX `KRIM_DLGN_TC0` ON `krim_dlgn_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-538', '2.1.0-SNP', '3:f3706f135f14ed14c3a26eee13d187cc', 1307)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-539::unit-test::(Checksum: 3:ffbf73542154422839717abcc7a22990)
CREATE INDEX `KRIM_DLGN_TR1` ON `krim_dlgn_t`(`ROLE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-539', '2.1.0-SNP', '3:ffbf73542154422839717abcc7a22990', 1308)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-540::unit-test::(Checksum: 3:208a6e739544138a0f98b09b15249a37)
CREATE INDEX `KRIM_DLGN_TR2` ON `krim_dlgn_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-540', '2.1.0-SNP', '3:208a6e739544138a0f98b09b15249a37', 1309)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-541::unit-test::(Checksum: 3:435a2dba1f5d0995bdaab69a8fdf05e7)
CREATE UNIQUE INDEX `KRIM_EMAIL_TYP_TC0` ON `krim_email_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-541', '2.1.0-SNP', '3:435a2dba1f5d0995bdaab69a8fdf05e7', 1310)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-542::unit-test::(Checksum: 3:1d84b8551c98dbe38d2445fc8ff881e8)
CREATE UNIQUE INDEX `KRIM_EMAIL_TYP_TC1` ON `krim_email_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-542', '2.1.0-SNP', '3:1d84b8551c98dbe38d2445fc8ff881e8', 1311)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-543::unit-test::(Checksum: 3:c6b0ddf900c61ecb632d9be399555a70)
CREATE UNIQUE INDEX `KRIM_EMP_STAT_TC0` ON `krim_emp_stat_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-543', '2.1.0-SNP', '3:c6b0ddf900c61ecb632d9be399555a70', 1312)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-544::unit-test::(Checksum: 3:648d92db807f0de6a40e34b3c10f30de)
CREATE UNIQUE INDEX `KRIM_EMP_STAT_TC1` ON `krim_emp_stat_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-544', '2.1.0-SNP', '3:648d92db807f0de6a40e34b3c10f30de', 1313)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-545::unit-test::(Checksum: 3:348906f01c471b134233b11c27f16e56)
CREATE UNIQUE INDEX `KRIM_EMP_TYP_TC0` ON `krim_emp_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-545', '2.1.0-SNP', '3:348906f01c471b134233b11c27f16e56', 1314)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-546::unit-test::(Checksum: 3:4e48f0cb66db37572fb33d82d0d0606b)
CREATE UNIQUE INDEX `KRIM_EMP_TYP_TC1` ON `krim_emp_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-546', '2.1.0-SNP', '3:4e48f0cb66db37572fb33d82d0d0606b', 1315)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-547::unit-test::(Checksum: 3:61306a338a9f02108c353fafc9b2d9ae)
CREATE UNIQUE INDEX `KRIM_ENT_NM_TYP_TC0` ON `krim_ent_nm_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-547', '2.1.0-SNP', '3:61306a338a9f02108c353fafc9b2d9ae', 1316)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-548::unit-test::(Checksum: 3:040d2ed50bdea2156cb89ba1eec1c219)
CREATE UNIQUE INDEX `KRIM_ENT_NM_TYP_TC1` ON `krim_ent_nm_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-548', '2.1.0-SNP', '3:040d2ed50bdea2156cb89ba1eec1c219', 1317)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-549::unit-test::(Checksum: 3:8c8c37c2b191193c36138609588c1f19)
CREATE UNIQUE INDEX `KRIM_ENT_TYP_TC0` ON `krim_ent_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-549', '2.1.0-SNP', '3:8c8c37c2b191193c36138609588c1f19', 1318)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-550::unit-test::(Checksum: 3:08f8d794fe87eced2cf7b2510c74f0d7)
CREATE UNIQUE INDEX `KRIM_ENT_TYP_TC1` ON `krim_ent_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-550', '2.1.0-SNP', '3:08f8d794fe87eced2cf7b2510c74f0d7', 1319)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-551::unit-test::(Checksum: 3:6798a00b538736547cc5b12c6f37f52d)
CREATE UNIQUE INDEX `KRIM_ENTITY_ADDR_TC0` ON `krim_entity_addr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-551', '2.1.0-SNP', '3:6798a00b538736547cc5b12c6f37f52d', 1320)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-552::unit-test::(Checksum: 3:a808df69ca028954a04f1e5f2584ab58)
CREATE INDEX `KRIM_ENTITY_ADDR_TI1` ON `krim_entity_addr_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-552', '2.1.0-SNP', '3:a808df69ca028954a04f1e5f2584ab58', 1321)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-553::unit-test::(Checksum: 3:a22c04700a2addadf108534ff1f050a4)
CREATE INDEX `KRIM_ENTITY_ADDR_TR1` ON `krim_entity_addr_t`(`ENT_TYP_CD`, `ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-553', '2.1.0-SNP', '3:a22c04700a2addadf108534ff1f050a4', 1322)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-554::unit-test::(Checksum: 3:b9cd142cfce729b9db507eeb0754f524)
CREATE INDEX `KRIM_ENTITY_ADDR_TR2` ON `krim_entity_addr_t`(`ADDR_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-554', '2.1.0-SNP', '3:b9cd142cfce729b9db507eeb0754f524', 1323)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-555::unit-test::(Checksum: 3:11c72c28d68560566aaf2a9df382037f)
CREATE UNIQUE INDEX `KRIM_ENTITY_AFLTN_TC0` ON `krim_entity_afltn_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-555', '2.1.0-SNP', '3:11c72c28d68560566aaf2a9df382037f', 1324)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-556::unit-test::(Checksum: 3:9caa252dfaadf7def3e7435a6b7efa8e)
CREATE INDEX `KRIM_ENTITY_AFLTN_TI1` ON `krim_entity_afltn_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-556', '2.1.0-SNP', '3:9caa252dfaadf7def3e7435a6b7efa8e', 1325)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-557::unit-test::(Checksum: 3:1692fbfa6da088f2b2370a42d5cee270)
CREATE INDEX `KRIM_ENTITY_AFLTN_TR2` ON `krim_entity_afltn_t`(`AFLTN_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-557', '2.1.0-SNP', '3:1692fbfa6da088f2b2370a42d5cee270', 1326)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-558::unit-test::(Checksum: 3:65178857c1399a3411b2497eafb1bfcb)
CREATE UNIQUE INDEX `KRIM_ENTITY_BIO_TC0` ON `krim_entity_bio_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-558', '2.1.0-SNP', '3:65178857c1399a3411b2497eafb1bfcb', 1327)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-559::unit-test::(Checksum: 3:40e5393f17f307bb7e4bae488c71ff4c)
CREATE UNIQUE INDEX `KRIM_ENTITY_CACHE_TC0` ON `krim_entity_cache_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-559', '2.1.0-SNP', '3:40e5393f17f307bb7e4bae488c71ff4c', 1328)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-560::unit-test::(Checksum: 3:d6f8f1e6151f489f49259a4555e36343)
CREATE UNIQUE INDEX `KRIM_ENTITY_CACHE_TC1` ON `krim_entity_cache_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-560', '2.1.0-SNP', '3:d6f8f1e6151f489f49259a4555e36343', 1329)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-561::unit-test::(Checksum: 3:4d557d7bddfe053a203e1c767eff2391)
CREATE UNIQUE INDEX `KRIM_ENTITY_CTZNSHP_TC0` ON `krim_entity_ctznshp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-561', '2.1.0-SNP', '3:4d557d7bddfe053a203e1c767eff2391', 1330)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-562::unit-test::(Checksum: 3:d5500b0c2b3ecf0ccf99853245c2a8e0)
CREATE INDEX `KRIM_ENTITY_CTZNSHP_TR1` ON `krim_entity_ctznshp_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-562', '2.1.0-SNP', '3:d5500b0c2b3ecf0ccf99853245c2a8e0', 1331)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-563::unit-test::(Checksum: 3:f03a9409f861cd27808bc6ec6827419a)
CREATE INDEX `KRIM_ENTITY_CTZNSHP_TR2` ON `krim_entity_ctznshp_t`(`CTZNSHP_STAT_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-563', '2.1.0-SNP', '3:f03a9409f861cd27808bc6ec6827419a', 1332)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-564::unit-test::(Checksum: 3:64d8c52b271ef905fde5585347863f5b)
CREATE UNIQUE INDEX `KRIM_ENTITY_EMAIL_TC0` ON `krim_entity_email_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-564', '2.1.0-SNP', '3:64d8c52b271ef905fde5585347863f5b', 1333)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-565::unit-test::(Checksum: 3:79a7fe5980fc736b7cc0e5cb6c051544)
CREATE INDEX `KRIM_ENTITY_EMAIL_TI1` ON `krim_entity_email_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-565', '2.1.0-SNP', '3:79a7fe5980fc736b7cc0e5cb6c051544', 1334)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-566::unit-test::(Checksum: 3:dd39cd743a0fa7960cf72e48bb5483d7)
CREATE INDEX `KRIM_ENTITY_EMAIL_TR1` ON `krim_entity_email_t`(`ENT_TYP_CD`, `ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-566', '2.1.0-SNP', '3:dd39cd743a0fa7960cf72e48bb5483d7', 1335)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-567::unit-test::(Checksum: 3:71dbc5f97d57ce345e836dbb82759563)
CREATE UNIQUE INDEX `KRIM_ENTITY_EMP_INFO_TC0` ON `krim_entity_emp_info_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-567', '2.1.0-SNP', '3:71dbc5f97d57ce345e836dbb82759563', 1336)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-568::unit-test::(Checksum: 3:e79475cfc7608e424ce9c05aaea650f3)
CREATE INDEX `KRIM_ENTITY_EMP_INFO_TI1` ON `krim_entity_emp_info_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-568', '2.1.0-SNP', '3:e79475cfc7608e424ce9c05aaea650f3', 1337)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-569::unit-test::(Checksum: 3:469d6ab7b1c41a6984ab2d3732eae7aa)
CREATE INDEX `KRIM_ENTITY_EMP_INFO_TI2` ON `krim_entity_emp_info_t`(`ENTITY_AFLTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-569', '2.1.0-SNP', '3:469d6ab7b1c41a6984ab2d3732eae7aa', 1338)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-570::unit-test::(Checksum: 3:0550122db260000efbebe318d8a1f57d)
CREATE INDEX `KRIM_ENTITY_EMP_INFO_TR2` ON `krim_entity_emp_info_t`(`EMP_STAT_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-570', '2.1.0-SNP', '3:0550122db260000efbebe318d8a1f57d', 1339)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-571::unit-test::(Checksum: 3:dd942d73053d64396dd281d2ae4b00b4)
CREATE INDEX `KRIM_ENTITY_EMP_INFO_TR3` ON `krim_entity_emp_info_t`(`EMP_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-571', '2.1.0-SNP', '3:dd942d73053d64396dd281d2ae4b00b4', 1340)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-572::unit-test::(Checksum: 3:040f2d8d0e9a2775abb1a7b6243ec00c)
CREATE UNIQUE INDEX `KRIM_ENTITY_ENT_TYP_TC0` ON `krim_entity_ent_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-572', '2.1.0-SNP', '3:040f2d8d0e9a2775abb1a7b6243ec00c', 1341)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-573::unit-test::(Checksum: 3:031d5f7db5d6a8b0e2a20cc19eff4ac1)
CREATE INDEX `KRIM_ENTITY_ENT_TYP_TI1` ON `krim_entity_ent_typ_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-573', '2.1.0-SNP', '3:031d5f7db5d6a8b0e2a20cc19eff4ac1', 1342)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-574::unit-test::(Checksum: 3:9d1c53b554e76548b9638d0df766c250)
CREATE UNIQUE INDEX `KRIM_ENTITY_ETHNIC_TC0` ON `krim_entity_ethnic_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-574', '2.1.0-SNP', '3:9d1c53b554e76548b9638d0df766c250', 1343)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-575::unit-test::(Checksum: 3:ec1f307cec67d2f8f0960ebc5a91a72c)
CREATE INDEX `KRIM_ENTITY_ETHNIC_TR1` ON `krim_entity_ethnic_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-575', '2.1.0-SNP', '3:ec1f307cec67d2f8f0960ebc5a91a72c', 1344)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-576::unit-test::(Checksum: 3:d30d9eb936a56425f25e395af43ea67d)
CREATE UNIQUE INDEX `KRIM_ENTITY_EXT_ID_TC0` ON `krim_entity_ext_id_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-576', '2.1.0-SNP', '3:d30d9eb936a56425f25e395af43ea67d', 1345)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-577::unit-test::(Checksum: 3:81c34a0afe9666e87e9d2405aa4d9691)
CREATE INDEX `KRIM_ENTITY_EXT_ID_TI1` ON `krim_entity_ext_id_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-577', '2.1.0-SNP', '3:81c34a0afe9666e87e9d2405aa4d9691', 1346)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-578::unit-test::(Checksum: 3:8f268dc4bc02f62d8bf6c1bcd53d5255)
CREATE INDEX `KRIM_ENTITY_EXT_ID_TR2` ON `krim_entity_ext_id_t`(`EXT_ID_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-578', '2.1.0-SNP', '3:8f268dc4bc02f62d8bf6c1bcd53d5255', 1347)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-579::unit-test::(Checksum: 3:4f3830268a5af346bac4c704304039fe)
CREATE UNIQUE INDEX `KRIM_ENTITY_NM_TC0` ON `krim_entity_nm_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-579', '2.1.0-SNP', '3:4f3830268a5af346bac4c704304039fe', 1348)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-580::unit-test::(Checksum: 3:2de2d6ddf4b24e73d2d75de83bd477d1)
CREATE INDEX `KRIM_ENTITY_NM_TI1` ON `krim_entity_nm_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-580', '2.1.0-SNP', '3:2de2d6ddf4b24e73d2d75de83bd477d1', 1349)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-581::unit-test::(Checksum: 3:3a034a55ddf3770d09e972b1aae1b5bd)
CREATE UNIQUE INDEX `KRIM_ENTITY_PHONE_TC0` ON `krim_entity_phone_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-581', '2.1.0-SNP', '3:3a034a55ddf3770d09e972b1aae1b5bd', 1350)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-582::unit-test::(Checksum: 3:6670ede3b154db5993cbf5465495f59a)
CREATE INDEX `KRIM_ENTITY_PHONE_TI1` ON `krim_entity_phone_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-582', '2.1.0-SNP', '3:6670ede3b154db5993cbf5465495f59a', 1351)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-583::unit-test::(Checksum: 3:11b6d71b6c351992f426fd330dbf0ca6)
CREATE INDEX `KRIM_ENTITY_PHONE_TR1` ON `krim_entity_phone_t`(`ENT_TYP_CD`, `ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-583', '2.1.0-SNP', '3:11b6d71b6c351992f426fd330dbf0ca6', 1352)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-584::unit-test::(Checksum: 3:1f7dca0e0ee98353b758189d4708e9a1)
CREATE INDEX `KRIM_ENTITY_PHONE_TR2` ON `krim_entity_phone_t`(`PHONE_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-584', '2.1.0-SNP', '3:1f7dca0e0ee98353b758189d4708e9a1', 1353)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-585::unit-test::(Checksum: 3:b34ff3f6e4a7c7159546efc5aa932069)
CREATE UNIQUE INDEX `KRIM_ENTITY_PRIV_PREF_TC0` ON `krim_entity_priv_pref_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-585', '2.1.0-SNP', '3:b34ff3f6e4a7c7159546efc5aa932069', 1354)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-586::unit-test::(Checksum: 3:ccdea67a27b34775b46b2fba69056a9d)
CREATE UNIQUE INDEX `KRIM_ENTITY_RESIDENCY_TC0` ON `krim_entity_residency_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-586', '2.1.0-SNP', '3:ccdea67a27b34775b46b2fba69056a9d', 1355)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-587::unit-test::(Checksum: 3:76d7b3d840fd26f08ca0d062609f66f0)
CREATE INDEX `KRIM_ENTITY_RESIDENCY_TR1` ON `krim_entity_residency_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-587', '2.1.0-SNP', '3:76d7b3d840fd26f08ca0d062609f66f0', 1356)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-588::unit-test::(Checksum: 3:25e4c59a4e080296fac4c7701d3c6791)
CREATE UNIQUE INDEX `KRIM_ENTITY_TC0` ON `krim_entity_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-588', '2.1.0-SNP', '3:25e4c59a4e080296fac4c7701d3c6791', 1357)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-589::unit-test::(Checksum: 3:904a9eba2915f5535711f7ac9bbaa073)
CREATE UNIQUE INDEX `KRIM_ENTITY_VISA_TC0` ON `krim_entity_visa_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-589', '2.1.0-SNP', '3:904a9eba2915f5535711f7ac9bbaa073', 1358)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-590::unit-test::(Checksum: 3:442231102a945ecc491f52dd17eff803)
CREATE INDEX `KRIM_ENTITY_VISA_TR1` ON `krim_entity_visa_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-590', '2.1.0-SNP', '3:442231102a945ecc491f52dd17eff803', 1359)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-591::unit-test::(Checksum: 3:46d90e52247d846eb8f8af61d232a072)
CREATE UNIQUE INDEX `KRIM_EXT_ID_TYP_TC0` ON `krim_ext_id_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-591', '2.1.0-SNP', '3:46d90e52247d846eb8f8af61d232a072', 1360)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-592::unit-test::(Checksum: 3:7ab6d5afb8ddbb9495208cf19ab13faa)
CREATE UNIQUE INDEX `KRIM_EXT_ID_TYP_TC1` ON `krim_ext_id_typ_t`(`NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-592', '2.1.0-SNP', '3:7ab6d5afb8ddbb9495208cf19ab13faa', 1361)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-593::unit-test::(Checksum: 3:286aabe8e6fbccdaf67ad4b16434e72a)
CREATE UNIQUE INDEX `KRIM_GRP_ATTR_DATA_TC0` ON `krim_grp_attr_data_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-593', '2.1.0-SNP', '3:286aabe8e6fbccdaf67ad4b16434e72a', 1362)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-594::unit-test::(Checksum: 3:5ad78e24e29b8f7cf32d0a469c9f6dad)
CREATE INDEX `KRIM_GRP_ATTR_DATA_TR1` ON `krim_grp_attr_data_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-594', '2.1.0-SNP', '3:5ad78e24e29b8f7cf32d0a469c9f6dad', 1363)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-595::unit-test::(Checksum: 3:c9c09e02c12921b2a4b5042827636992)
CREATE INDEX `KRIM_GRP_ATTR_DATA_TR2` ON `krim_grp_attr_data_t`(`KIM_ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-595', '2.1.0-SNP', '3:c9c09e02c12921b2a4b5042827636992', 1364)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-596::unit-test::(Checksum: 3:c834aafa516605bd13bcf140703371ea)
CREATE INDEX `KRIM_GRP_ATTR_DATA_TR3` ON `krim_grp_attr_data_t`(`GRP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-596', '2.1.0-SNP', '3:c834aafa516605bd13bcf140703371ea', 1365)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-597::unit-test::(Checksum: 3:dc922d01c17860eb55159232ca0b4150)
CREATE UNIQUE INDEX `KRIM_GRP_MBR_TC0` ON `krim_grp_mbr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-597', '2.1.0-SNP', '3:dc922d01c17860eb55159232ca0b4150', 1366)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-598::unit-test::(Checksum: 3:f533c35d0e24b83e7d0fc55c262bf472)
CREATE INDEX `KRIM_GRP_MBR_TI1` ON `krim_grp_mbr_t`(`MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-598', '2.1.0-SNP', '3:f533c35d0e24b83e7d0fc55c262bf472', 1367)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-599::unit-test::(Checksum: 3:3d9c4efb5433451068cba853e49ddc21)
CREATE INDEX `KRIM_GRP_MBR_TR1` ON `krim_grp_mbr_t`(`GRP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-599', '2.1.0-SNP', '3:3d9c4efb5433451068cba853e49ddc21', 1368)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-600::unit-test::(Checksum: 3:87463dd9fbeaa2ba81e01fc01a740a3a)
CREATE UNIQUE INDEX `KRIM_GRP_TC0` ON `krim_grp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-600', '2.1.0-SNP', '3:87463dd9fbeaa2ba81e01fc01a740a3a', 1369)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-601::unit-test::(Checksum: 3:0848dd20b49392c9a8016fb484ded6f8)
CREATE UNIQUE INDEX `KRIM_GRP_TC1` ON `krim_grp_t`(`GRP_NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-601', '2.1.0-SNP', '3:0848dd20b49392c9a8016fb484ded6f8', 1370)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-602::unit-test::(Checksum: 3:8636ee86636aa3367e22dace79f716af)
CREATE INDEX `KRIM_GRP_TR1` ON `krim_grp_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-602', '2.1.0-SNP', '3:8636ee86636aa3367e22dace79f716af', 1371)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-603::unit-test::(Checksum: 3:61c69155530672c5e400ef65eee2b586)
CREATE UNIQUE INDEX `KRIM_PERM_ATTR_DATA_TC0` ON `krim_perm_attr_data_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-603', '2.1.0-SNP', '3:61c69155530672c5e400ef65eee2b586', 1372)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-604::unit-test::(Checksum: 3:584a05c075368ee1b7f6dc20f8030d3c)
CREATE INDEX `KRIM_PERM_ATTR_DATA_TI1` ON `krim_perm_attr_data_t`(`PERM_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-604', '2.1.0-SNP', '3:584a05c075368ee1b7f6dc20f8030d3c', 1373)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-605::unit-test::(Checksum: 3:376ce6b23fc695996edcca56bc1daf30)
CREATE INDEX `KRIM_PERM_ATTR_DATA_TR1` ON `krim_perm_attr_data_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-605', '2.1.0-SNP', '3:376ce6b23fc695996edcca56bc1daf30', 1374)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-606::unit-test::(Checksum: 3:6f206db660e57b006553d469bd6e0287)
CREATE INDEX `KRIM_PERM_ATTR_DATA_TR2` ON `krim_perm_attr_data_t`(`KIM_ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-606', '2.1.0-SNP', '3:6f206db660e57b006553d469bd6e0287', 1375)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-607::unit-test::(Checksum: 3:d50e9520736a7fe5d8b8c458055bd7cb)
CREATE UNIQUE INDEX `KRIM_PERM_TC0` ON `krim_perm_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-607', '2.1.0-SNP', '3:d50e9520736a7fe5d8b8c458055bd7cb', 1376)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-608::unit-test::(Checksum: 3:6b228b18e55a024a879f4399c6baa98e)
CREATE INDEX `KRIM_PERM_TR1` ON `krim_perm_t`(`PERM_TMPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-608', '2.1.0-SNP', '3:6b228b18e55a024a879f4399c6baa98e', 1377)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-609::unit-test::(Checksum: 3:d5c5769930c12d332fa48362884f60f0)
CREATE UNIQUE INDEX `KRIM_PERM_T_TC1` ON `krim_perm_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-609', '2.1.0-SNP', '3:d5c5769930c12d332fa48362884f60f0', 1378)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-610::unit-test::(Checksum: 3:872d08804c8cdd7d7660aabcfb8bfbc5)
CREATE UNIQUE INDEX `KRIM_PERM_TMPL_TC0` ON `krim_perm_tmpl_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-610', '2.1.0-SNP', '3:872d08804c8cdd7d7660aabcfb8bfbc5', 1379)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-611::unit-test::(Checksum: 3:5649d096f1ce6d618d770698034d258d)
CREATE UNIQUE INDEX `KRIM_PERM_TMPL_TC1` ON `krim_perm_tmpl_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-611', '2.1.0-SNP', '3:5649d096f1ce6d618d770698034d258d', 1380)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-612::unit-test::(Checksum: 3:e195d2261eade10e30e113d3bc100ad7)
CREATE INDEX `KRIM_PERM_TMPL_TR1` ON `krim_perm_tmpl_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-612', '2.1.0-SNP', '3:e195d2261eade10e30e113d3bc100ad7', 1381)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-613::unit-test::(Checksum: 3:9c2035ebac7a133ad168d02128ceaa3e)
CREATE UNIQUE INDEX `KRIM_PHONE_TYP_TC0` ON `krim_phone_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-613', '2.1.0-SNP', '3:9c2035ebac7a133ad168d02128ceaa3e', 1382)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-614::unit-test::(Checksum: 3:3e6006ff097a1c8d69fb858ea70b5bf4)
CREATE UNIQUE INDEX `KRIM_PHONE_TYP_TC1` ON `krim_phone_typ_t`(`PHONE_TYP_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-614', '2.1.0-SNP', '3:3e6006ff097a1c8d69fb858ea70b5bf4', 1383)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-615::unit-test::(Checksum: 3:ba84e6b39ee1db04bb0fafc11e9c8d18)
CREATE UNIQUE INDEX `KRIM_PRNCPL_TC0` ON `krim_prncpl_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-615', '2.1.0-SNP', '3:ba84e6b39ee1db04bb0fafc11e9c8d18', 1384)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-616::unit-test::(Checksum: 3:a57f6f1a9c0dc8a19a958cf52845ea26)
CREATE UNIQUE INDEX `KRIM_PRNCPL_TC1` ON `krim_prncpl_t`(`PRNCPL_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-616', '2.1.0-SNP', '3:a57f6f1a9c0dc8a19a958cf52845ea26', 1385)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-617::unit-test::(Checksum: 3:ef173cdfa5bdf0744f4d174e2d382782)
CREATE INDEX `KRIM_PRNCPL_TR1` ON `krim_prncpl_t`(`ENTITY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-617', '2.1.0-SNP', '3:ef173cdfa5bdf0744f4d174e2d382782', 1386)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-618::unit-test::(Checksum: 3:28a5fdb6d50fecc616cd1d3dd4534ff7)
CREATE UNIQUE INDEX `KRIM_ROLE_MBR_ATTR_DATA_TC0` ON `krim_role_mbr_attr_data_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-618', '2.1.0-SNP', '3:28a5fdb6d50fecc616cd1d3dd4534ff7', 1387)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-619::unit-test::(Checksum: 3:aba9501c5585f59b3dc2434e9e5a7828)
CREATE INDEX `KRIM_ROLE_MBR_ATTR_DATA_TI1` ON `krim_role_mbr_attr_data_t`(`ROLE_MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-619', '2.1.0-SNP', '3:aba9501c5585f59b3dc2434e9e5a7828', 1388)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-620::unit-test::(Checksum: 3:6fdf1ec1baed2d6bb829d4a6a9c35f47)
CREATE INDEX `KRIM_ROLE_MBR_ATTR_DATA_TR1` ON `krim_role_mbr_attr_data_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-620', '2.1.0-SNP', '3:6fdf1ec1baed2d6bb829d4a6a9c35f47', 1389)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-621::unit-test::(Checksum: 3:13638ec653edd97acc391bce1e3e62bf)
CREATE INDEX `KRIM_ROLE_MBR_ATTR_DATA_TR2` ON `krim_role_mbr_attr_data_t`(`KIM_ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-621', '2.1.0-SNP', '3:13638ec653edd97acc391bce1e3e62bf', 1390)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-622::unit-test::(Checksum: 3:77048db45b81c082ce6e20d011bb7bcc)
CREATE UNIQUE INDEX `KRIM_ROLE_MBR_TC0` ON `krim_role_mbr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-622', '2.1.0-SNP', '3:77048db45b81c082ce6e20d011bb7bcc', 1391)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-623::unit-test::(Checksum: 3:e63a7f4d60239ce477f3e49899dfd701)
CREATE INDEX `KRIM_ROLE_MBR_TI1` ON `krim_role_mbr_t`(`MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-623', '2.1.0-SNP', '3:e63a7f4d60239ce477f3e49899dfd701', 1392)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-624::unit-test::(Checksum: 3:dad183ecd94dbecb4b78e381a6c739b6)
CREATE INDEX `KRIM_ROLE_MBR_TR1` ON `krim_role_mbr_t`(`ROLE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-624', '2.1.0-SNP', '3:dad183ecd94dbecb4b78e381a6c739b6', 1393)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-625::unit-test::(Checksum: 3:856964cdf8f54c2ad31d04d18b15aed0)
CREATE UNIQUE INDEX `KRIM_ROLE_PERM_TC0` ON `krim_role_perm_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-625', '2.1.0-SNP', '3:856964cdf8f54c2ad31d04d18b15aed0', 1394)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-626::unit-test::(Checksum: 3:f763f009152eec208ebcb7af4cb09943)
CREATE INDEX `KRIM_ROLE_PERM_TI1` ON `krim_role_perm_t`(`PERM_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-626', '2.1.0-SNP', '3:f763f009152eec208ebcb7af4cb09943', 1395)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-627::unit-test::(Checksum: 3:d13d41185b1ebae9f730cd7e866ea08b)
CREATE UNIQUE INDEX `KRIM_ROLE_RSP_ACTN_TC0` ON `krim_role_rsp_actn_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-627', '2.1.0-SNP', '3:d13d41185b1ebae9f730cd7e866ea08b', 1396)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-628::unit-test::(Checksum: 3:5fc0779c5223b406f917c2e2f49a72ee)
CREATE UNIQUE INDEX `KRIM_ROLE_RSP_ACTN_TC1` ON `krim_role_rsp_actn_t`(`ROLE_RSP_ID`, `ROLE_MBR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-628', '2.1.0-SNP', '3:5fc0779c5223b406f917c2e2f49a72ee', 1397)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-629::unit-test::(Checksum: 3:61f899cf10e33bf4f0ffebf76f907ece)
CREATE UNIQUE INDEX `KRIM_ROLE_RSP_TC0` ON `krim_role_rsp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-629', '2.1.0-SNP', '3:61f899cf10e33bf4f0ffebf76f907ece', 1398)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-630::unit-test::(Checksum: 3:7778a29127339bf09db5f072b6c99082)
CREATE INDEX `KRIM_ROLE_RSP_TI1` ON `krim_role_rsp_t`(`RSP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-630', '2.1.0-SNP', '3:7778a29127339bf09db5f072b6c99082', 1399)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-631::unit-test::(Checksum: 3:3459b7b1c054a631b012cc332a2e67a1)
CREATE UNIQUE INDEX `KRIM_ROLE_TC0` ON `krim_role_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-631', '2.1.0-SNP', '3:3459b7b1c054a631b012cc332a2e67a1', 1400)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-632::unit-test::(Checksum: 3:b1d64c1e4364d2717ad7eb4eafbb3a91)
CREATE UNIQUE INDEX `KRIM_ROLE_TC1` ON `krim_role_t`(`ROLE_NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-632', '2.1.0-SNP', '3:b1d64c1e4364d2717ad7eb4eafbb3a91', 1401)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-633::unit-test::(Checksum: 3:1edd30641f6e80039753b19c509c88b3)
CREATE INDEX `KRIM_ROLE_TR1` ON `krim_role_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-633', '2.1.0-SNP', '3:1edd30641f6e80039753b19c509c88b3', 1402)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-634::unit-test::(Checksum: 3:389b3c2ae0ac62e3d09fe031067f5c5f)
CREATE UNIQUE INDEX `KRIM_RSP_ATTR_DATA_TC0` ON `krim_rsp_attr_data_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-634', '2.1.0-SNP', '3:389b3c2ae0ac62e3d09fe031067f5c5f', 1403)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-635::unit-test::(Checksum: 3:592f29381c445c51ce00b5fc58ed06db)
CREATE INDEX `KRIM_RSP_ATTR_DATA_TR1` ON `krim_rsp_attr_data_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-635', '2.1.0-SNP', '3:592f29381c445c51ce00b5fc58ed06db', 1404)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-636::unit-test::(Checksum: 3:3937a3e2629b96d5af1315cb61d4a087)
CREATE INDEX `KRIM_RSP_ATTR_DATA_TR2` ON `krim_rsp_attr_data_t`(`KIM_ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-636', '2.1.0-SNP', '3:3937a3e2629b96d5af1315cb61d4a087', 1405)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-637::unit-test::(Checksum: 3:e757a351824850f46c39af2bed8f3efa)
CREATE INDEX `KRIM_RSP_ATTR_DATA_TR3` ON `krim_rsp_attr_data_t`(`RSP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-637', '2.1.0-SNP', '3:e757a351824850f46c39af2bed8f3efa', 1406)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-638::unit-test::(Checksum: 3:8b6735bef7a2dd590e4e038e5d78dbab)
CREATE UNIQUE INDEX `KRIM_RSP_TC0` ON `krim_rsp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-638', '2.1.0-SNP', '3:8b6735bef7a2dd590e4e038e5d78dbab', 1407)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-639::unit-test::(Checksum: 3:ecc5fee0d4e115a41a522aad80843915)
CREATE INDEX `KRIM_RSP_TR1` ON `krim_rsp_t`(`RSP_TMPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-639', '2.1.0-SNP', '3:ecc5fee0d4e115a41a522aad80843915', 1408)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-640::unit-test::(Checksum: 3:e5308957ca4ba95597a203ee5bc3f1bd)
CREATE UNIQUE INDEX `KRIM_RSP_T_TC1` ON `krim_rsp_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-640', '2.1.0-SNP', '3:e5308957ca4ba95597a203ee5bc3f1bd', 1409)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-641::unit-test::(Checksum: 3:ed870e65a9378d624f791e1d5ba92a81)
CREATE UNIQUE INDEX `KRIM_RSP_TMPL_TC0` ON `krim_rsp_tmpl_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-641', '2.1.0-SNP', '3:ed870e65a9378d624f791e1d5ba92a81', 1410)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-642::unit-test::(Checksum: 3:bbb401057a0ea6a99931431d3d428071)
CREATE UNIQUE INDEX `KRIM_RSP_TMPL_TC1` ON `krim_rsp_tmpl_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-642', '2.1.0-SNP', '3:bbb401057a0ea6a99931431d3d428071', 1411)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-643::unit-test::(Checksum: 3:376c8b0054b84e029ed04e551f96aa7b)
CREATE INDEX `KRIM_RSP_TMPL_TR1` ON `krim_rsp_tmpl_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-643', '2.1.0-SNP', '3:376c8b0054b84e029ed04e551f96aa7b', 1412)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-644::unit-test::(Checksum: 3:498f46b20ce3dfe243dba4082ef988ba)
CREATE INDEX `KRIM_TYP_ATTRIBUTE_TI1` ON `krim_typ_attr_t`(`KIM_TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-644', '2.1.0-SNP', '3:498f46b20ce3dfe243dba4082ef988ba', 1413)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-645::unit-test::(Checksum: 3:990b19ec2b9578025eca52780f20e645)
CREATE UNIQUE INDEX `KRIM_TYP_ATTR_TC0` ON `krim_typ_attr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-645', '2.1.0-SNP', '3:990b19ec2b9578025eca52780f20e645', 1414)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-646::unit-test::(Checksum: 3:5481b367e4659d9f11a413ac7e6bbb48)
CREATE INDEX `KRIM_TYP_ATTR_TR2` ON `krim_typ_attr_t`(`KIM_ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-646', '2.1.0-SNP', '3:5481b367e4659d9f11a413ac7e6bbb48', 1415)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-647::unit-test::(Checksum: 3:be3a2b6a31426d1eb4e057b7b27cea98)
CREATE UNIQUE INDEX `KRIM_TYP_TC0` ON `krim_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-647', '2.1.0-SNP', '3:be3a2b6a31426d1eb4e057b7b27cea98', 1416)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-648::unit-test::(Checksum: 3:8f961a441246ca55aade55c775fd0abc)
CREATE UNIQUE INDEX `KRNS_CAMPUS_TC0` ON `krlc_cmp_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-648', '2.1.0-SNP', '3:8f961a441246ca55aade55c775fd0abc', 1417)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-649::unit-test::(Checksum: 3:be655d833791681c10468d4cc8715712)
CREATE INDEX `SH_CAMPUS_TR1` ON `krlc_cmp_t`(`CAMPUS_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-649', '2.1.0-SNP', '3:be655d833791681c10468d4cc8715712', 1418)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-650::unit-test::(Checksum: 3:72ea5ffbe416b2cbdab88163e5fa41ec)
CREATE UNIQUE INDEX `KRNS_CMP_TYP_TC0` ON `krlc_cmp_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-650', '2.1.0-SNP', '3:72ea5ffbe416b2cbdab88163e5fa41ec', 1419)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-651::unit-test::(Checksum: 3:ee6b1c2ceafaa8f1668e479e717df26c)
CREATE UNIQUE INDEX `KR_COUNTRY_TC0` ON `krlc_cntry_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-651', '2.1.0-SNP', '3:ee6b1c2ceafaa8f1668e479e717df26c', 1420)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-652::unit-test::(Checksum: 3:93d2d3db821a6956fce68773aa394924)
CREATE UNIQUE INDEX `KR_COUNTY_TC0` ON `krlc_cnty_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-652', '2.1.0-SNP', '3:93d2d3db821a6956fce68773aa394924', 1421)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-653::unit-test::(Checksum: 3:ddb3e93b81beb5995a8bbf232f1fa0f6)
CREATE UNIQUE INDEX `KR_POSTAL_CODE_TC0` ON `krlc_pstl_cd_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-653', '2.1.0-SNP', '3:ddb3e93b81beb5995a8bbf232f1fa0f6', 1422)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-654::unit-test::(Checksum: 3:55206e20cfc57e385794a6148e45a9fc)
CREATE INDEX `KR_POSTAL_CODE_TR1` ON `krlc_pstl_cd_t`(`POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-654', '2.1.0-SNP', '3:55206e20cfc57e385794a6148e45a9fc', 1423)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-655::unit-test::(Checksum: 3:cdea80fe6b3c94d3a7b5bca0da7a248f)
CREATE INDEX `KR_POSTAL_CODE_TR2` ON `krlc_pstl_cd_t`(`POSTAL_STATE_CD`, `POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-655', '2.1.0-SNP', '3:cdea80fe6b3c94d3a7b5bca0da7a248f', 1424)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-656::unit-test::(Checksum: 3:3841fdff62a286d2a4cf5e698231a060)
CREATE INDEX `KR_POSTAL_CODE_TR3` ON `krlc_pstl_cd_t`(`COUNTY_CD`, `POSTAL_STATE_CD`, `POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-656', '2.1.0-SNP', '3:3841fdff62a286d2a4cf5e698231a060', 1425)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-657::unit-test::(Checksum: 3:1051cf9aa2ce201cb9b9f8b45ddaa556)
CREATE UNIQUE INDEX `KR_STATE_TC0` ON `krlc_st_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-657', '2.1.0-SNP', '3:1051cf9aa2ce201cb9b9f8b45ddaa556', 1426)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-658::unit-test::(Checksum: 3:31c72b94a02d0c82f3cc7ac516709b80)
CREATE INDEX `KR_STATE_TR1` ON `krlc_st_t`(`POSTAL_CNTRY_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-658', '2.1.0-SNP', '3:31c72b94a02d0c82f3cc7ac516709b80', 1427)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-659::unit-test::(Checksum: 3:61dcf0837bb003b80be61b51b0d3e50a)
CREATE INDEX `KRMS_ACTN_ATTR_TI1` ON `krms_actn_attr_t`(`ACTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-659', '2.1.0-SNP', '3:61dcf0837bb003b80be61b51b0d3e50a', 1428)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-660::unit-test::(Checksum: 3:70c4c0cd62aba7faefddd314022a9b1e)
CREATE INDEX `KRMS_ACTN_ATTR_TI2` ON `krms_actn_attr_t`(`ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-660', '2.1.0-SNP', '3:70c4c0cd62aba7faefddd314022a9b1e', 1429)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-661::unit-test::(Checksum: 3:3447c8ed31f82e502cf3f176cd2d0784)
CREATE UNIQUE INDEX `KRMS_ACTN_TC2` ON `krms_actn_t`(`ACTN_ID`, `RULE_ID`, `SEQ_NO`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-661', '2.1.0-SNP', '3:3447c8ed31f82e502cf3f176cd2d0784', 1430)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-662::unit-test::(Checksum: 3:59d2ccc8d309308099f093a5141c2dd2)
CREATE INDEX `KRMS_ACTN_TI1` ON `krms_actn_t`(`TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-662', '2.1.0-SNP', '3:59d2ccc8d309308099f093a5141c2dd2', 1431)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-663::unit-test::(Checksum: 3:f69798df355fa1963c9216052e341241)
CREATE INDEX `KRMS_ACTN_TI2` ON `krms_actn_t`(`RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-663', '2.1.0-SNP', '3:f69798df355fa1963c9216052e341241', 1432)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-664::unit-test::(Checksum: 3:4d1f7fcccfc27e8ac677d863c3e5a7ba)
CREATE INDEX `KRMS_ACTN_TI3` ON `krms_actn_t`(`RULE_ID`, `SEQ_NO`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-664', '2.1.0-SNP', '3:4d1f7fcccfc27e8ac677d863c3e5a7ba', 1433)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-665::unit-test::(Checksum: 3:27046476046632b25c159d71139a4171)
CREATE INDEX `KRMS_AGENDA_ATTR_T12` ON `krms_agenda_attr_t`(`ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-665', '2.1.0-SNP', '3:27046476046632b25c159d71139a4171', 1434)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-666::unit-test::(Checksum: 3:e7973e721c63743ee9a8afa6af569894)
CREATE INDEX `KRMS_AGENDA_ATTR_TI1` ON `krms_agenda_attr_t`(`AGENDA_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-666', '2.1.0-SNP', '3:e7973e721c63743ee9a8afa6af569894', 1435)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-667::unit-test::(Checksum: 3:371ac091f1608843358d031d7624382d)
CREATE INDEX `KRMS_AGENDA_ITM_TI1` ON `krms_agenda_itm_t`(`RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-667', '2.1.0-SNP', '3:371ac091f1608843358d031d7624382d', 1436)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-668::unit-test::(Checksum: 3:335261a89e5165172e366ec234dee372)
CREATE INDEX `KRMS_AGENDA_ITM_TI2` ON `krms_agenda_itm_t`(`AGENDA_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-668', '2.1.0-SNP', '3:335261a89e5165172e366ec234dee372', 1437)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-669::unit-test::(Checksum: 3:caa016cd558d9bbee68774b93ab368d9)
CREATE INDEX `KRMS_AGENDA_ITM_TI3` ON `krms_agenda_itm_t`(`SUB_AGENDA_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-669', '2.1.0-SNP', '3:caa016cd558d9bbee68774b93ab368d9', 1438)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-670::unit-test::(Checksum: 3:0e0983fafab41f74fe8c4db5ec9b0d3d)
CREATE INDEX `KRMS_AGENDA_ITM_TI4` ON `krms_agenda_itm_t`(`WHEN_TRUE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-670', '2.1.0-SNP', '3:0e0983fafab41f74fe8c4db5ec9b0d3d', 1439)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-671::unit-test::(Checksum: 3:d66db086a5e9b7117e9a255160c33dff)
CREATE INDEX `KRMS_AGENDA_ITM_TI5` ON `krms_agenda_itm_t`(`WHEN_FALSE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-671', '2.1.0-SNP', '3:d66db086a5e9b7117e9a255160c33dff', 1440)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-672::unit-test::(Checksum: 3:608b12e914153af6926e91059c504c7f)
CREATE INDEX `KRMS_AGENDA_ITM_TI6` ON `krms_agenda_itm_t`(`ALWAYS`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-672', '2.1.0-SNP', '3:608b12e914153af6926e91059c504c7f', 1441)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-673::unit-test::(Checksum: 3:cb79af57029799c6cb697d0c88f11463)
CREATE UNIQUE INDEX `KRMS_AGENDA_TC1` ON `krms_agenda_t`(`NM`, `CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-673', '2.1.0-SNP', '3:cb79af57029799c6cb697d0c88f11463', 1442)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-674::unit-test::(Checksum: 3:936abe22bf1005e4266c3a0408eab445)
CREATE INDEX `KRMS_AGENDA_TI1` ON `krms_agenda_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-674', '2.1.0-SNP', '3:936abe22bf1005e4266c3a0408eab445', 1443)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-675::unit-test::(Checksum: 3:f0358b9dafb8ec9fe5b9e2ee34d86407)
CREATE UNIQUE INDEX `KRMS_ATTR_DEFN_TC1` ON `krms_attr_defn_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-675', '2.1.0-SNP', '3:f0358b9dafb8ec9fe5b9e2ee34d86407', 1444)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-676::unit-test::(Checksum: 3:e1f2f98a2c8853c946395c227fc216ae)
CREATE INDEX `KRMS_CMPND_PROP_PROPS_FK2` ON `krms_cmpnd_prop_props_t`(`CMPND_PROP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-676', '2.1.0-SNP', '3:e1f2f98a2c8853c946395c227fc216ae', 1445)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-677::unit-test::(Checksum: 3:c139663428ef7d593754f45136c3a681)
CREATE INDEX `KRMS_CMPND_PROP_PROPS_TI1` ON `krms_cmpnd_prop_props_t`(`PROP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-677', '2.1.0-SNP', '3:c139663428ef7d593754f45136c3a681', 1446)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-678::unit-test::(Checksum: 3:9ac41002d2d09b2ed1b5e57fc8da9399)
CREATE INDEX `KRMS_CNTXT_ATTR_TI1` ON `krms_cntxt_attr_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-678', '2.1.0-SNP', '3:9ac41002d2d09b2ed1b5e57fc8da9399', 1447)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-679::unit-test::(Checksum: 3:9d84924446601d5178f494a0b5996ef6)
CREATE INDEX `KRMS_CNTXT_ATTR_TI2` ON `krms_cntxt_attr_t`(`ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-679', '2.1.0-SNP', '3:9d84924446601d5178f494a0b5996ef6', 1448)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-680::unit-test::(Checksum: 3:a3c6ffeeff7aa0369e5c7996430978d8)
CREATE UNIQUE INDEX `KRMS_CNTXT_TC1` ON `krms_cntxt_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-680', '2.1.0-SNP', '3:a3c6ffeeff7aa0369e5c7996430978d8', 1449)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-681::unit-test::(Checksum: 3:949d5911f8acbd72c8eddc6c7cdee9d8)
CREATE INDEX `KRMS_CNTXT_VLD_ACTN_TI1` ON `krms_cntxt_vld_actn_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-681', '2.1.0-SNP', '3:949d5911f8acbd72c8eddc6c7cdee9d8', 1450)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-682::unit-test::(Checksum: 3:8549570e5e01ad07d99fd3d353930b41)
CREATE INDEX `KRMS_CNTXT_VLD_EVENT_TI1` ON `krms_cntxt_vld_event_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-682', '2.1.0-SNP', '3:8549570e5e01ad07d99fd3d353930b41', 1451)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-683::unit-test::(Checksum: 3:e25faafbcbceb3266061169b317b1bfc)
CREATE INDEX `KRMS_CNTXT_VLD_FUNC_TI1` ON `krms_cntxt_vld_func_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-683', '2.1.0-SNP', '3:e25faafbcbceb3266061169b317b1bfc', 1452)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-684::unit-test::(Checksum: 3:dc71a4c36a7ba3d7eeccd22d09fef47b)
CREATE INDEX `KRMS_CNTXT_VLD_RULE_TI1` ON `krms_cntxt_vld_rule_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-684', '2.1.0-SNP', '3:dc71a4c36a7ba3d7eeccd22d09fef47b', 1453)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-685::unit-test::(Checksum: 3:4bf210e3c392f8da1004a2575973a3d9)
CREATE INDEX `KRMS_CNTXT_VLD_TERM_SPEC_TI1` ON `krms_cntxt_vld_term_spec_t`(`CNTXT_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-685', '2.1.0-SNP', '3:4bf210e3c392f8da1004a2575973a3d9', 1454)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-686::unit-test::(Checksum: 3:bb38b70e528f8f1bf1fa415704a9be5c)
CREATE INDEX `KRMS_CNTXT_VLD_TERM_SPEC_TI2` ON `krms_cntxt_vld_term_spec_t`(`TERM_SPEC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-686', '2.1.0-SNP', '3:bb38b70e528f8f1bf1fa415704a9be5c', 1455)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-687::unit-test::(Checksum: 3:c8121d92fe74c35a6836cb320b75515b)
CREATE UNIQUE INDEX `KRMS_CTGRY_TC0` ON `krms_ctgry_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-687', '2.1.0-SNP', '3:c8121d92fe74c35a6836cb320b75515b', 1456)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-688::unit-test::(Checksum: 3:d216776b1cd4a880b900b2d08f8a95f0)
CREATE INDEX `KRMS_FUNC_CTGRY_FK2` ON `krms_func_ctgry_t`(`CTGRY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-688', '2.1.0-SNP', '3:d216776b1cd4a880b900b2d08f8a95f0', 1457)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-689::unit-test::(Checksum: 3:78b76ef624e32d7bfbab1a5e31075ca3)
CREATE INDEX `KRMS_FUNC_PARM_TI1` ON `krms_func_parm_t`(`FUNC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-689', '2.1.0-SNP', '3:78b76ef624e32d7bfbab1a5e31075ca3', 1458)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-690::unit-test::(Checksum: 3:174ad4264415f4616111bb6f2c6899da)
CREATE UNIQUE INDEX `KRMS_FUNC_TC1` ON `krms_func_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-690', '2.1.0-SNP', '3:174ad4264415f4616111bb6f2c6899da', 1459)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-691::unit-test::(Checksum: 3:448ccfe3f072330d5a1b053570fc4b39)
CREATE INDEX `KRMS_FUNC_TI1` ON `krms_func_t`(`TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-691', '2.1.0-SNP', '3:448ccfe3f072330d5a1b053570fc4b39', 1460)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-692::unit-test::(Checksum: 3:c6834e5d0ea5b677a372617397f9f378)
CREATE INDEX `KRMS_PROP_PARM_TI1` ON `krms_prop_parm_t`(`PROP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-692', '2.1.0-SNP', '3:c6834e5d0ea5b677a372617397f9f378', 1461)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-693::unit-test::(Checksum: 3:b417c48019bfdb4f61cb6d55a1bb02da)
CREATE INDEX `KRMS_PROP_FK2` ON `krms_prop_t`(`TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-693', '2.1.0-SNP', '3:b417c48019bfdb4f61cb6d55a1bb02da', 1462)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-694::unit-test::(Checksum: 3:f1c7ad794f892c9fbd25a77ddb99b317)
CREATE INDEX `KRMS_PROP_TI1` ON `krms_prop_t`(`RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-694', '2.1.0-SNP', '3:f1c7ad794f892c9fbd25a77ddb99b317', 1463)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-695::unit-test::(Checksum: 3:bd659f43dd11bf6af94845a13eee4fdf)
CREATE INDEX `KRMS_RULE_ATTR_TI1` ON `krms_rule_attr_t`(`RULE_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-695', '2.1.0-SNP', '3:bd659f43dd11bf6af94845a13eee4fdf', 1464)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-696::unit-test::(Checksum: 3:d2f83440a9c60b174a153674e3661e18)
CREATE INDEX `KRMS_RULE_ATTR_TI2` ON `krms_rule_attr_t`(`ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-696', '2.1.0-SNP', '3:d2f83440a9c60b174a153674e3661e18', 1465)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-697::unit-test::(Checksum: 3:c6a805a2dfe3542c68095077b27d5058)
CREATE UNIQUE INDEX `KRMS_RULE_TC1` ON `krms_rule_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-697', '2.1.0-SNP', '3:c6a805a2dfe3542c68095077b27d5058', 1466)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-698::unit-test::(Checksum: 3:6a27fbaac6fb8e53e9bb96da8282846b)
CREATE INDEX `KRMS_RULE_TI1` ON `krms_rule_t`(`PROP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-698', '2.1.0-SNP', '3:6a27fbaac6fb8e53e9bb96da8282846b', 1467)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-699::unit-test::(Checksum: 3:9a4cc711e7f77f001f4d8fb6d571d514)
CREATE INDEX `KRMS_TERM_PARM_TI1` ON `krms_term_parm_t`(`TERM_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-699', '2.1.0-SNP', '3:9a4cc711e7f77f001f4d8fb6d571d514', 1468)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-700::unit-test::(Checksum: 3:2f9c4c32398e546ddc3d19c0399691a9)
CREATE INDEX `KRMS_TERM_RSLVR_ATTR_TI1` ON `krms_term_rslvr_attr_t`(`TERM_RSLVR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-700', '2.1.0-SNP', '3:2f9c4c32398e546ddc3d19c0399691a9', 1469)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-701::unit-test::(Checksum: 3:d18a812be9a47ef48208cf0514a1b74a)
CREATE INDEX `KRMS_TERM_RSLVR_ATTR_TI2` ON `krms_term_rslvr_attr_t`(`ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-701', '2.1.0-SNP', '3:d18a812be9a47ef48208cf0514a1b74a', 1470)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-702::unit-test::(Checksum: 3:f4b38a43a4336ca2eda8815b1fff7664)
CREATE INDEX `KRMS_INPUT_ASSET_TI1` ON `krms_term_rslvr_input_spec_t`(`TERM_SPEC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-702', '2.1.0-SNP', '3:f4b38a43a4336ca2eda8815b1fff7664', 1471)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-703::unit-test::(Checksum: 3:7707f24d8b5ec719788f9263fb96a43a)
CREATE INDEX `KRMS_INPUT_ASSET_TI2` ON `krms_term_rslvr_input_spec_t`(`TERM_RSLVR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-703', '2.1.0-SNP', '3:7707f24d8b5ec719788f9263fb96a43a', 1472)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-704::unit-test::(Checksum: 3:f0cfdfadd131cfc52c71736035ba3255)
CREATE INDEX `KRMS_TERM_RESLV_PARM_FK1` ON `krms_term_rslvr_parm_spec_t`(`TERM_RSLVR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-704', '2.1.0-SNP', '3:f0cfdfadd131cfc52c71736035ba3255', 1473)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-705::unit-test::(Checksum: 3:ec5e72147d79e0b9cb2241fb7003ead3)
CREATE INDEX `KRMS_TERM_RSLVR_FK1` ON `krms_term_rslvr_t`(`OUTPUT_TERM_SPEC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-705', '2.1.0-SNP', '3:ec5e72147d79e0b9cb2241fb7003ead3', 1474)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-706::unit-test::(Checksum: 3:67bfb2499534481ba16edc664f787c8b)
CREATE UNIQUE INDEX `KRMS_TERM_RSLVR_TC1` ON `krms_term_rslvr_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-706', '2.1.0-SNP', '3:67bfb2499534481ba16edc664f787c8b', 1475)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-707::unit-test::(Checksum: 3:25ad1ea186bea7001634602f09a08169)
CREATE INDEX `KRMS_TERM_RSLVR_TI2` ON `krms_term_rslvr_t`(`TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-707', '2.1.0-SNP', '3:25ad1ea186bea7001634602f09a08169', 1476)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-708::unit-test::(Checksum: 3:08b6fba1a49c98b9589c393bd9f882fa)
CREATE INDEX `KRMS_TERM_SPEC_CTGRY_FK2` ON `krms_term_spec_ctgry_t`(`CTGRY_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-708', '2.1.0-SNP', '3:08b6fba1a49c98b9589c393bd9f882fa', 1477)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-709::unit-test::(Checksum: 3:70b8cbd4edafe89ec12479f1a05bf719)
CREATE UNIQUE INDEX `KRMS_TERM_SPEC_TC1` ON `krms_term_spec_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-709', '2.1.0-SNP', '3:70b8cbd4edafe89ec12479f1a05bf719', 1478)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-710::unit-test::(Checksum: 3:3931c5a2b6b7672281d3c009ee5bb792)
CREATE INDEX `KRMS_TERM_TI1` ON `krms_term_t`(`TERM_SPEC_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-710', '2.1.0-SNP', '3:3931c5a2b6b7672281d3c009ee5bb792', 1479)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-711::unit-test::(Checksum: 3:a00a0f0fa901afa4d18d3e7e922daef1)
CREATE UNIQUE INDEX `KRMS_TYP_ATTR_TC1` ON `krms_typ_attr_t`(`TYP_ID`, `ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-711', '2.1.0-SNP', '3:a00a0f0fa901afa4d18d3e7e922daef1', 1480)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-712::unit-test::(Checksum: 3:518cbbc5e1d295bc173bd2750f2bb9c8)
CREATE INDEX `KRMS_TYP_ATTR_TI1` ON `krms_typ_attr_t`(`ATTR_DEFN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-712', '2.1.0-SNP', '3:518cbbc5e1d295bc173bd2750f2bb9c8', 1481)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-713::unit-test::(Checksum: 3:afde6f084cc5f5dd8695cc6bdb4fae6c)
CREATE INDEX `KRMS_TYP_ATTR_TI2` ON `krms_typ_attr_t`(`TYP_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-713', '2.1.0-SNP', '3:afde6f084cc5f5dd8695cc6bdb4fae6c', 1482)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-714::unit-test::(Checksum: 3:de8ca3f1982494c801b1130cc987dae1)
CREATE UNIQUE INDEX `KRMS_TYP_TC1` ON `krms_typ_t`(`NM`, `NMSPC_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-714', '2.1.0-SNP', '3:de8ca3f1982494c801b1130cc987dae1', 1483)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-715::unit-test::(Checksum: 3:8ae8fca9de9eff25f802231b90b793b8)
CREATE INDEX `KRNS_ADHOC_RTE_ACTN_RECIP_T2` ON `krns_adhoc_rte_actn_recip_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-715', '2.1.0-SNP', '3:8ae8fca9de9eff25f802231b90b793b8', 1484)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-716::unit-test::(Checksum: 3:1880c11caf9695f24081897091b4fe13)
CREATE UNIQUE INDEX `KRNS_ADHOC_RTE_ACTN_RECIP_TC0` ON `krns_adhoc_rte_actn_recip_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-716', '2.1.0-SNP', '3:1880c11caf9695f24081897091b4fe13', 1485)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-717::unit-test::(Checksum: 3:3424e5c423577d07da3ff26ac45165f0)
CREATE UNIQUE INDEX `KRNS_ATT_TC0` ON `krns_att_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-717', '2.1.0-SNP', '3:3424e5c423577d07da3ff26ac45165f0', 1486)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-718::unit-test::(Checksum: 3:f0c24f532946f1d60bf939a01020d86c)
CREATE UNIQUE INDEX `KRNS_DOC_HDR_TC0` ON `krns_doc_hdr_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-718', '2.1.0-SNP', '3:f0c24f532946f1d60bf939a01020d86c', 1487)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-719::unit-test::(Checksum: 3:e4c942a8c46a6ee06505cdbd9ed82348)
CREATE INDEX `KRNS_DOC_HDR_TI3` ON `krns_doc_hdr_t`(`ORG_DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-719', '2.1.0-SNP', '3:e4c942a8c46a6ee06505cdbd9ed82348', 1488)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-720::unit-test::(Checksum: 3:43ce2acd482e2f7779359b5d2280cc17)
CREATE UNIQUE INDEX `KRNS_LOOKUP_RSLT_TC0` ON `krns_lookup_rslt_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-720', '2.1.0-SNP', '3:43ce2acd482e2f7779359b5d2280cc17', 1489)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-721::unit-test::(Checksum: 3:6b54e6beac8cac10a24cea8423c5aa5c)
CREATE UNIQUE INDEX `KRNS_LOOKUP_SEL_TC0` ON `krns_lookup_sel_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-721', '2.1.0-SNP', '3:6b54e6beac8cac10a24cea8423c5aa5c', 1490)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-722::unit-test::(Checksum: 3:5b0170f1ecd280cebc1aa5ebb071f966)
CREATE UNIQUE INDEX `KRNS_MAINT_DOC_ATT_TC0` ON `krns_maint_doc_att_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-722', '2.1.0-SNP', '3:5b0170f1ecd280cebc1aa5ebb071f966', 1491)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-723::unit-test::(Checksum: 3:e569a49397a9132c364bffd2c778ab33)
CREATE UNIQUE INDEX `KRNS_MAINT_DOC_TC0` ON `krns_maint_doc_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-723', '2.1.0-SNP', '3:e569a49397a9132c364bffd2c778ab33', 1492)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-724::unit-test::(Checksum: 3:0386987647ed8ccec89168c909409ce7)
CREATE UNIQUE INDEX `KRNS_MAINT_LOCK_TC0` ON `krns_maint_lock_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-724', '2.1.0-SNP', '3:0386987647ed8ccec89168c909409ce7', 1493)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-725::unit-test::(Checksum: 3:a70d27b4dd978cc997171f148b802a41)
CREATE INDEX `KRNS_MAINT_LOCK_TI2` ON `krns_maint_lock_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-725', '2.1.0-SNP', '3:a70d27b4dd978cc997171f148b802a41', 1494)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-726::unit-test::(Checksum: 3:ec33accb71616471d4e9c56556b2e5d1)
CREATE UNIQUE INDEX `KRNS_NTE_TC0` ON `krns_nte_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-726', '2.1.0-SNP', '3:ec33accb71616471d4e9c56556b2e5d1', 1495)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-727::unit-test::(Checksum: 3:e47e160143a9c1dde7d8d9406493fd6c)
CREATE INDEX `KRNS_NTE_TR1` ON `krns_nte_t`(`NTE_TYP_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-727', '2.1.0-SNP', '3:e47e160143a9c1dde7d8d9406493fd6c', 1496)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-728::unit-test::(Checksum: 3:f882e4c211f1f1e9e8b31c880bea97ff)
CREATE UNIQUE INDEX `KRNS_NTE_TYP_TC0` ON `krns_nte_typ_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-728', '2.1.0-SNP', '3:f882e4c211f1f1e9e8b31c880bea97ff', 1497)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-729::unit-test::(Checksum: 3:76624c91b1a3ad84f4bb208deda52b75)
CREATE UNIQUE INDEX `KRNS_PESSIMISTIC_LOCK_TC0` ON `krns_pessimistic_lock_t`(`OBJ_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-729', '2.1.0-SNP', '3:76624c91b1a3ad84f4bb208deda52b75', 1498)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-730::unit-test::(Checksum: 3:51680ed5951b8860766cad1e1a8e9368)
CREATE INDEX `KRNS_PESSIMISTIC_LOCK_TI1` ON `krns_pessimistic_lock_t`(`DOC_HDR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-730', '2.1.0-SNP', '3:51680ed5951b8860766cad1e1a8e9368', 1499)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-731::unit-test::(Checksum: 3:90980bc1f7467098c59f98cd28f7db0e)
CREATE INDEX `KRNS_PESSIMISTIC_LOCK_TI2` ON `krns_pessimistic_lock_t`(`PRNCPL_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-731', '2.1.0-SNP', '3:90980bc1f7467098c59f98cd28f7db0e', 1500)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-732::unit-test::(Checksum: 3:c396eee38da79de6f1e2e455a5f9ac26)
CREATE INDEX `KRNS_SESN_DOC_TI1` ON `krns_sesn_doc_t`(`LAST_UPDT_DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-732', '2.1.0-SNP', '3:c396eee38da79de6f1e2e455a5f9ac26', 1501)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-733::unit-test::(Checksum: 3:b374abb68bc6b86eb07868f20fb57e91)
CREATE INDEX `KREW_BAM_PARM_TI1` ON `krsb_bam_parm_t`(`BAM_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-733', '2.1.0-SNP', '3:b374abb68bc6b86eb07868f20fb57e91', 1502)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-734::unit-test::(Checksum: 3:7d01ac73decf3a8f14e02d385c6dc0d3)
CREATE INDEX `KRSB_BAM_TI1` ON `krsb_bam_t`(`SVC_NM`, `MTHD_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-734', '2.1.0-SNP', '3:7d01ac73decf3a8f14e02d385c6dc0d3', 1503)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-735::unit-test::(Checksum: 3:90331fabbe7cd45374f35fefc6079880)
CREATE INDEX `KRSB_BAM_TI2` ON `krsb_bam_t`(`SVC_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-735', '2.1.0-SNP', '3:90331fabbe7cd45374f35fefc6079880', 1504)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-736::unit-test::(Checksum: 3:e0694465042669b2d51054f94deed208)
CREATE INDEX `KRSB_MSG_QUE_TI1` ON `krsb_msg_que_t`(`SVC_NM`, `SVC_MTHD_NM`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-736', '2.1.0-SNP', '3:e0694465042669b2d51054f94deed208', 1505)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-737::unit-test::(Checksum: 3:2e9abdf6a863fc84c4b1414b5abd4ec0)
CREATE INDEX `KRSB_MSG_QUE_TI2` ON `krsb_msg_que_t`(`APPL_ID`, `STAT_CD`, `IP_NBR`, `DT`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-737', '2.1.0-SNP', '3:2e9abdf6a863fc84c4b1414b5abd4ec0', 1506)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-738::unit-test::(Checksum: 3:3ba5ab361bff0640ba5f5d7bcddfbabf)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI1` ON `krsb_qrtz_fired_triggers`(`JOB_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-738', '2.1.0-SNP', '3:3ba5ab361bff0640ba5f5d7bcddfbabf', 1507)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-739::unit-test::(Checksum: 3:bde9e7bb25940c64405779e91f9a1a72)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI2` ON `krsb_qrtz_fired_triggers`(`JOB_NAME`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-739', '2.1.0-SNP', '3:bde9e7bb25940c64405779e91f9a1a72', 1508)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-740::unit-test::(Checksum: 3:2d80e5bebcde755510b92bf7198d419e)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI3` ON `krsb_qrtz_fired_triggers`(`REQUESTS_RECOVERY`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-740', '2.1.0-SNP', '3:2d80e5bebcde755510b92bf7198d419e', 1509)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-741::unit-test::(Checksum: 3:4b792d811e8c6c3852b8c10a11bad354)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI4` ON `krsb_qrtz_fired_triggers`(`IS_STATEFUL`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-741', '2.1.0-SNP', '3:4b792d811e8c6c3852b8c10a11bad354', 1510)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-742::unit-test::(Checksum: 3:5b61a714e3bab98316faaf2d265e7109)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI5` ON `krsb_qrtz_fired_triggers`(`TRIGGER_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-742', '2.1.0-SNP', '3:5b61a714e3bab98316faaf2d265e7109', 1511)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-743::unit-test::(Checksum: 3:cdb384d8b0f5b7aa80f78ef43814daf1)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI6` ON `krsb_qrtz_fired_triggers`(`INSTANCE_NAME`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-743', '2.1.0-SNP', '3:cdb384d8b0f5b7aa80f78ef43814daf1', 1512)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-744::unit-test::(Checksum: 3:85f4582131ea48ec85998954516e626a)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI7` ON `krsb_qrtz_fired_triggers`(`TRIGGER_NAME`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-744', '2.1.0-SNP', '3:85f4582131ea48ec85998954516e626a', 1513)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-745::unit-test::(Checksum: 3:d855ac045c2747c5489af6fb4fbcf4c9)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI8` ON `krsb_qrtz_fired_triggers`(`TRIGGER_NAME`, `TRIGGER_GROUP`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-745', '2.1.0-SNP', '3:d855ac045c2747c5489af6fb4fbcf4c9', 1514)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-746::unit-test::(Checksum: 3:76590b94b7d4cfbaf14dff44e0ec8fe9)
CREATE INDEX `KRSB_QRTZ_FIRED_TRIGGERS_TI9` ON `krsb_qrtz_fired_triggers`(`IS_VOLATILE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-746', '2.1.0-SNP', '3:76590b94b7d4cfbaf14dff44e0ec8fe9', 1515)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-747::unit-test::(Checksum: 3:c632cc0be1ef517aa9ed2f0894763f98)
CREATE INDEX `KRSB_QRTZ_JOB_DETAILS_TI1` ON `krsb_qrtz_job_details`(`REQUESTS_RECOVERY`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-747', '2.1.0-SNP', '3:c632cc0be1ef517aa9ed2f0894763f98', 1516)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-748::unit-test::(Checksum: 3:2aa66d332d2195cc70ad54ef2906ed29)
CREATE INDEX `KRSB_QRTZ_TRIGGERS_TI1` ON `krsb_qrtz_triggers`(`NEXT_FIRE_TIME`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-748', '2.1.0-SNP', '3:2aa66d332d2195cc70ad54ef2906ed29', 1517)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-749::unit-test::(Checksum: 3:ef2f23f75978fb9c417f4be039c03a88)
CREATE INDEX `KRSB_QRTZ_TRIGGERS_TI2` ON `krsb_qrtz_triggers`(`NEXT_FIRE_TIME`, `TRIGGER_STATE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-749', '2.1.0-SNP', '3:ef2f23f75978fb9c417f4be039c03a88', 1518)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-750::unit-test::(Checksum: 3:c17872ee1e9125b001639a9ac40d0e1d)
CREATE INDEX `KRSB_QRTZ_TRIGGERS_TI3` ON `krsb_qrtz_triggers`(`TRIGGER_STATE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-750', '2.1.0-SNP', '3:c17872ee1e9125b001639a9ac40d0e1d', 1519)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-751::unit-test::(Checksum: 3:977288613ec7d93049b689b40da96149)
CREATE INDEX `KRSB_QRTZ_TRIGGERS_TI4` ON `krsb_qrtz_triggers`(`IS_VOLATILE`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-751', '2.1.0-SNP', '3:977288613ec7d93049b689b40da96149', 1520)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-752::unit-test::(Checksum: 3:f3dabd689912fed30542ca2f82c5aa20)
CREATE INDEX `KRSB_SVC_DEF_FK1` ON `krsb_svc_def_t`(`SVC_DSCRPTR_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-752', '2.1.0-SNP', '3:f3dabd689912fed30542ca2f82c5aa20', 1521)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-753::unit-test::(Checksum: 3:e9a55442ffd28be151fb5df69bc0175a)
CREATE INDEX `KRSB_SVC_DEF_TI1` ON `krsb_svc_def_t`(`INSTN_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-753', '2.1.0-SNP', '3:e9a55442ffd28be151fb5df69bc0175a', 1522)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-754::unit-test::(Checksum: 3:528fee48b0181605d4796d4786ef057c)
CREATE INDEX `KRSB_SVC_DEF_TI2` ON `krsb_svc_def_t`(`SVC_NM`, `STAT_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-754', '2.1.0-SNP', '3:528fee48b0181605d4796d4786ef057c', 1523)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-755::unit-test::(Checksum: 3:c0c05821dea2cd7243d42f127202d8c7)
CREATE INDEX `KRSB_SVC_DEF_TI3` ON `krsb_svc_def_t`(`STAT_CD`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-755', '2.1.0-SNP', '3:c0c05821dea2cd7243d42f127202d8c7', 1524)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-756::unit-test::(Checksum: 3:f209798f95086a181cd007ccea547ea9)
CREATE INDEX `TRV_ACCT_FK1` ON `trv_acct`(`ACCT_FO_ID`)
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create Index', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-756', '2.1.0-SNP', '3:f209798f95086a181cd007ccea547ea9', 1525)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-757::unit-test::(Checksum: 3:2cd8360a80f080335eedaec84a169ef3)
CREATE VIEW `krim_grp_mbr_v` AS select g.NMSPC_CD AS NMSPC_CD,g.GRP_NM AS grp_nm,g.GRP_ID AS GRP_ID,p.PRNCPL_NM AS PRNCPL_NM,p.PRNCPL_ID AS PRNCPL_ID,mg.GRP_NM AS mbr_grp_nm,mg.GRP_ID AS mbr_grp_id from ((((krim_grp_mbr_t gm left join krim_grp_t g on((g.GRP_ID = gm.GRP_ID))) left join krim_grp_t mg on(((mg.GRP_ID = gm.MBR_ID) and (gm.MBR_TYP_CD = 'G')))) left join krim_prncpl_t p on(((p.PRNCPL_ID = gm.MBR_ID) and (gm.MBR_TYP_CD = 'P')))) left join krim_entity_nm_t en on(((en.ENTITY_ID = p.ENTITY_ID) and (en.DFLT_IND = 'Y') and (en.ACTV_IND = 'Y')))) order by g.NMSPC_CD,g.GRP_NM,p.PRNCPL_NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-757', '2.1.0-SNP', '3:2cd8360a80f080335eedaec84a169ef3', 1526)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-758::unit-test::(Checksum: 3:97d4db0ecff9bebd0fdb426d9e5f6796)
CREATE VIEW `krim_grp_v` AS select g.NMSPC_CD AS NMSPC_CD,g.GRP_NM AS grp_nm,g.GRP_ID AS GRP_ID,t.NM AS grp_typ_nm,a.NM AS attr_nm,d.ATTR_VAL AS attr_val from (((krim_grp_t g left join krim_grp_attr_data_t d on((d.GRP_ID = g.GRP_ID))) left join krim_attr_defn_t a on((a.KIM_ATTR_DEFN_ID = d.KIM_ATTR_DEFN_ID))) left join krim_typ_t t on((g.KIM_TYP_ID = t.KIM_TYP_ID)))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-758', '2.1.0-SNP', '3:97d4db0ecff9bebd0fdb426d9e5f6796', 1527)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-759::unit-test::(Checksum: 3:48a3d6806b68345b726a22db2acc6178)
CREATE VIEW `krim_perm_attr_v` AS select t.NMSPC_CD AS tmpl_nmspc_cd,t.NM AS tmpl_nm,t.PERM_TMPL_ID AS PERM_TMPL_ID,p.NMSPC_CD AS perm_nmspc_cd,p.NM AS perm_nm,p.PERM_ID AS PERM_ID,a.NM AS attr_nm,ad.ATTR_VAL AS attr_val from (((krim_perm_t p left join krim_perm_tmpl_t t on((p.PERM_TMPL_ID = t.PERM_TMPL_ID))) left join krim_perm_attr_data_t ad on((p.PERM_ID = ad.PERM_ID))) left join krim_attr_defn_t a on((ad.KIM_ATTR_DEFN_ID = a.KIM_ATTR_DEFN_ID))) order by t.NMSPC_CD,t.NM,p.NMSPC_CD,p.PERM_ID,a.NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-759', '2.1.0-SNP', '3:48a3d6806b68345b726a22db2acc6178', 1528)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-760::unit-test::(Checksum: 3:7d31e40869544a7288e41563fde2e4e8)
CREATE VIEW `krim_perm_v` AS select t.NMSPC_CD AS tmpl_nmspc_cd,t.NM AS tmpl_nm,t.PERM_TMPL_ID AS PERM_TMPL_ID,p.NMSPC_CD AS perm_nmspc_cd,p.NM AS perm_nm,p.PERM_ID AS PERM_ID,typ.NM AS perm_typ_nm,typ.SRVC_NM AS SRVC_NM from ((krim_perm_t p join krim_perm_tmpl_t t on((p.PERM_TMPL_ID = t.PERM_TMPL_ID))) left join krim_typ_t typ on((t.KIM_TYP_ID = typ.KIM_TYP_ID)))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-760', '2.1.0-SNP', '3:7d31e40869544a7288e41563fde2e4e8', 1529)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-761::unit-test::(Checksum: 3:869445a4a726fb0b8214d4f0c1092ebd)
CREATE VIEW `krim_prncpl_v` AS select p.PRNCPL_ID AS PRNCPL_ID,p.PRNCPL_NM AS PRNCPL_NM,en.FIRST_NM AS FIRST_NM,en.LAST_NM AS LAST_NM,ea.AFLTN_TYP_CD AS AFLTN_TYP_CD,ea.CAMPUS_CD AS CAMPUS_CD,eei.EMP_STAT_CD AS EMP_STAT_CD,eei.EMP_TYP_CD AS EMP_TYP_CD from (((krim_prncpl_t p left join krim_entity_emp_info_t eei on((eei.ENTITY_ID = p.ENTITY_ID))) left join krim_entity_afltn_t ea on((ea.ENTITY_ID = p.ENTITY_ID))) left join krim_entity_nm_t en on(((p.ENTITY_ID = en.ENTITY_ID) and ('Y' = en.DFLT_IND))))
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-761', '2.1.0-SNP', '3:869445a4a726fb0b8214d4f0c1092ebd', 1530)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-762::unit-test::(Checksum: 3:ba68a9cd2db37c3fbf0053530897d663)
CREATE VIEW `krim_role_grp_v` AS select r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,r.ROLE_ID AS role_id,g.NMSPC_CD AS grp_nmspc_cd,g.GRP_NM AS GRP_NM,rm.ROLE_MBR_ID AS ROLE_MBR_ID,a.NM AS attr_nm,d.ATTR_VAL AS attr_val from ((((krim_role_mbr_t rm left join krim_role_t r on((r.ROLE_ID = rm.ROLE_ID))) left join krim_grp_t g on((g.GRP_ID = rm.MBR_ID))) left join krim_role_mbr_attr_data_t d on((d.ROLE_MBR_ID = rm.ROLE_MBR_ID))) left join krim_attr_defn_t a on((a.KIM_ATTR_DEFN_ID = d.KIM_ATTR_DEFN_ID))) where (rm.MBR_TYP_CD = 'G') order by r.NMSPC_CD,r.ROLE_NM,g.NMSPC_CD,g.GRP_NM,rm.ROLE_MBR_ID,a.NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-762', '2.1.0-SNP', '3:ba68a9cd2db37c3fbf0053530897d663', 1531)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-763::unit-test::(Checksum: 3:71e8bdca5df40a2c489c3b5424a1e7cd)
CREATE VIEW `krim_role_perm_v` AS select r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,r.ROLE_ID AS role_id,pt.NMSPC_CD AS tmpl_nmspc_cd,pt.NM AS tmpl_nm,pt.PERM_TMPL_ID AS PERM_TMPL_ID,p.NMSPC_CD AS perm_nmpsc_cd,p.NM AS perm_nm,p.PERM_ID AS PERM_ID,a.NM AS attr_nm,ad.ATTR_VAL AS attr_val from (((((krim_perm_t p left join krim_perm_tmpl_t pt on((p.PERM_TMPL_ID = pt.PERM_TMPL_ID))) left join krim_perm_attr_data_t ad on((p.PERM_ID = ad.PERM_ID))) left join krim_attr_defn_t a on((ad.KIM_ATTR_DEFN_ID = a.KIM_ATTR_DEFN_ID))) left join krim_role_perm_t rp on((rp.PERM_ID = p.PERM_ID))) left join krim_role_t r on((rp.ROLE_ID = r.ROLE_ID))) order by r.NMSPC_CD,r.ROLE_NM,pt.NMSPC_CD,pt.NM,p.PERM_ID,a.NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-763', '2.1.0-SNP', '3:71e8bdca5df40a2c489c3b5424a1e7cd', 1532)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-764::unit-test::(Checksum: 3:f418ae4994b3b77da2c69a46028eca50)
CREATE VIEW `krim_role_prncpl_v` AS select r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,r.ROLE_ID AS ROLE_ID,p.PRNCPL_NM AS PRNCPL_NM,p.PRNCPL_ID AS PRNCPL_ID,en.FIRST_NM AS FIRST_NM,en.LAST_NM AS LAST_NM,rm.ROLE_MBR_ID AS ROLE_MBR_ID,ad.NM AS attr_nm,rmad.ATTR_VAL AS attr_val from (((((krim_role_t r left join krim_role_mbr_t rm on((r.ROLE_ID = rm.ROLE_ID))) left join krim_role_mbr_attr_data_t rmad on((rm.ROLE_MBR_ID = rmad.ROLE_MBR_ID))) left join krim_attr_defn_t ad on((rmad.KIM_ATTR_DEFN_ID = ad.KIM_ATTR_DEFN_ID))) left join krim_prncpl_t p on(((rm.MBR_ID = p.PRNCPL_ID) and (rm.MBR_TYP_CD = 'P')))) left join krim_entity_nm_t en on((p.ENTITY_ID = en.ENTITY_ID))) where (en.DFLT_IND = 'Y') order by r.NMSPC_CD,r.ROLE_NM,p.PRNCPL_NM,rm.ROLE_MBR_ID,ad.NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-764', '2.1.0-SNP', '3:f418ae4994b3b77da2c69a46028eca50', 1533)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-765::unit-test::(Checksum: 3:f4faf252f723bae78c4d3f4cf9627865)
CREATE VIEW `krim_role_role_v` AS select r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,r.ROLE_ID AS role_id,mr.NMSPC_CD AS mbr_role_nmspc_cd,mr.ROLE_NM AS mbr_role_nm,mr.ROLE_ID AS mbr_role_id,rm.ROLE_MBR_ID AS role_mbr_id,a.NM AS attr_nm,d.ATTR_VAL AS attr_val from ((((krim_role_mbr_t rm left join krim_role_t r on((r.ROLE_ID = rm.ROLE_ID))) left join krim_role_t mr on((mr.ROLE_ID = rm.MBR_ID))) left join krim_role_mbr_attr_data_t d on((d.ROLE_MBR_ID = rm.ROLE_MBR_ID))) left join krim_attr_defn_t a on((a.KIM_ATTR_DEFN_ID = d.KIM_ATTR_DEFN_ID))) where (rm.MBR_TYP_CD = 'R') order by r.NMSPC_CD,r.ROLE_NM,mr.NMSPC_CD,mr.ROLE_NM,rm.ROLE_MBR_ID,a.NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-765', '2.1.0-SNP', '3:f4faf252f723bae78c4d3f4cf9627865', 1534)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-766::unit-test::(Checksum: 3:4ec6615822b8dbf6465bbe9e8ab1a6eb)
CREATE VIEW `krim_role_v` AS select r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,r.ROLE_ID AS ROLE_ID,t.NM AS role_typ_nm,t.SRVC_NM AS SRVC_NM,t.KIM_TYP_ID AS KIM_TYP_ID from krim_role_t r join krim_typ_t t where ((t.KIM_TYP_ID = r.KIM_TYP_ID) and (r.ACTV_IND = 'Y')) order by r.NMSPC_CD,r.ROLE_NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-766', '2.1.0-SNP', '3:4ec6615822b8dbf6465bbe9e8ab1a6eb', 1535)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-767::unit-test::(Checksum: 3:25a9e704451a3cb6e0853a07ce8dfa94)
CREATE VIEW `krim_rsp_attr_v` AS select krim_typ_t.NM AS responsibility_type_name,krim_rsp_tmpl_t.NM AS rsp_TEMPLATE_NAME,krim_rsp_t.NMSPC_CD AS rsp_namespace_code,krim_rsp_t.NM AS rsp_NAME,krim_rsp_t.RSP_ID AS rsp_id,krim_attr_defn_t.NM AS attribute_name,krim_rsp_attr_data_t.ATTR_VAL AS attribute_value from ((((krim_rsp_t join krim_rsp_attr_data_t on((krim_rsp_t.RSP_ID = krim_rsp_attr_data_t.RSP_ID))) join krim_attr_defn_t on((krim_rsp_attr_data_t.KIM_ATTR_DEFN_ID = krim_attr_defn_t.KIM_ATTR_DEFN_ID))) join krim_rsp_tmpl_t on((krim_rsp_t.RSP_TMPL_ID = krim_rsp_tmpl_t.RSP_TMPL_ID))) join krim_typ_t on((krim_rsp_tmpl_t.KIM_TYP_ID = krim_typ_t.KIM_TYP_ID))) order by krim_rsp_tmpl_t.NM,krim_rsp_t.NM,krim_attr_defn_t.NM
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-767', '2.1.0-SNP', '3:25a9e704451a3cb6e0853a07ce8dfa94', 1536)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-768::unit-test::(Checksum: 3:7773c465f15aa59aa0c4c5796b0c57b2)
CREATE VIEW `krim_rsp_role_actn_v` AS select rsp.NMSPC_CD AS rsp_nmspc_cd,rsp.RSP_ID AS rsp_id,r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,rr.ROLE_ID AS ROLE_ID,rm.MBR_ID AS MBR_ID,rm.MBR_TYP_CD AS MBR_TYP_CD,rm.ROLE_MBR_ID AS ROLE_MBR_ID,actn.ACTN_TYP_CD AS ACTN_TYP_CD,actn.ACTN_PLCY_CD AS ACTN_PLCY_CD,actn.FRC_ACTN AS FRC_ACTN,actn.PRIORITY_NBR AS PRIORITY_NBR from (((((krim_rsp_t rsp left join krim_rsp_tmpl_t rspt on((rsp.RSP_TMPL_ID = rspt.RSP_TMPL_ID))) left join krim_role_rsp_t rr on((rr.RSP_ID = rsp.RSP_ID))) left join krim_role_mbr_t rm on((rm.ROLE_ID = rr.ROLE_ID))) left join krim_role_rsp_actn_t actn on(((actn.ROLE_RSP_ID = rr.ROLE_RSP_ID) and ((actn.ROLE_MBR_ID = rm.ROLE_MBR_ID) or (actn.ROLE_MBR_ID = '*'))))) left join krim_role_t r on((rr.ROLE_ID = r.ROLE_ID))) order by rsp.NMSPC_CD,rsp.RSP_ID,rr.ROLE_ID,rm.ROLE_MBR_ID
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-768', '2.1.0-SNP', '3:7773c465f15aa59aa0c4c5796b0c57b2', 1537)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml::1313699682134-769::unit-test::(Checksum: 3:c1b9b8d5c612bf026ce6d04d3273ca76)
CREATE VIEW `krim_rsp_role_v` AS select rspt.NMSPC_CD AS rsp_tmpl_nmspc_cd,rspt.NM AS rsp_tmpl_nm,rsp.NMSPC_CD AS rsp_nmspc_cd,rsp.NM AS rsp_nm,rsp.RSP_ID AS rsp_id,a.NM AS attr_nm,d.ATTR_VAL AS attr_val,r.NMSPC_CD AS NMSPC_CD,r.ROLE_NM AS ROLE_NM,rr.ROLE_ID AS ROLE_ID from (((((krim_rsp_t rsp left join krim_rsp_tmpl_t rspt on((rsp.RSP_TMPL_ID = rspt.RSP_TMPL_ID))) left join krim_rsp_attr_data_t d on((rsp.RSP_ID = d.RSP_ID))) left join krim_attr_defn_t a on((d.KIM_ATTR_DEFN_ID = a.KIM_ATTR_DEFN_ID))) left join krim_role_rsp_t rr on((rr.RSP_ID = rsp.RSP_ID))) left join krim_role_t r on((rr.ROLE_ID = r.ROLE_ID))) order by rspt.NMSPC_CD,rspt.NM,rsp.NMSPC_CD,rsp.NM,rsp.RSP_ID,a.NM,d.ATTR_VAL
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Create View', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/schema.xml', '1313699682134-769', '2.1.0-SNP', '3:c1b9b8d5c612bf026ce6d04d3273ca76', 1538)
;

-- Release Database Lock
