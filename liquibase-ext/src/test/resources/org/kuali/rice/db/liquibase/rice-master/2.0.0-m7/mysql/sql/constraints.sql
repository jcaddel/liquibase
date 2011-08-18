-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml
-- Ran at: 8/18/11 2:33 PM
-- Against: LIQUIBASE@localhost@jdbc:mysql://localhost/LIQUIBASE
-- Liquibase version: 2.1.0-SNAPSHOT
-- *********************************************************************

-- Lock Database
-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-1::unit-test::(Checksum: 3:76b41db71ba770cbc024452cdba451aa)
ALTER TABLE `krcr_cmpnt_t` ADD CONSTRAINT `KRNS_PARM_DTL_TYP_TR1` FOREIGN KEY (`NMSPC_CD`) REFERENCES `krcr_nmspc_t` (`NMSPC_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-1', '2.1.0-SNP', '3:76b41db71ba770cbc024452cdba451aa', 770)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-2::unit-test::(Checksum: 3:fc152a75fa04fe4a7887917fb9b13538)
ALTER TABLE `krcr_parm_t` ADD CONSTRAINT `KRNS_PARM_TR1` FOREIGN KEY (`NMSPC_CD`) REFERENCES `krcr_nmspc_t` (`NMSPC_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-2', '2.1.0-SNP', '3:fc152a75fa04fe4a7887917fb9b13538', 771)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-3::unit-test::(Checksum: 3:84ac86b79e80912b3d143ca5ed118469)
ALTER TABLE `krcr_parm_t` ADD CONSTRAINT `KRNS_PARM_TR2` FOREIGN KEY (`PARM_TYP_CD`) REFERENCES `krcr_parm_typ_t` (`PARM_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-3', '2.1.0-SNP', '3:84ac86b79e80912b3d143ca5ed118469', 772)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-4::unit-test::(Checksum: 3:4d989fb04421038748ef32c4cad0a6d8)
ALTER TABLE `kren_chnl_prodcr_t` ADD CONSTRAINT `KREN_CHNL_PRODCR_FK1` FOREIGN KEY (`CHNL_ID`) REFERENCES `kren_chnl_t` (`CHNL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-4', '2.1.0-SNP', '3:4d989fb04421038748ef32c4cad0a6d8', 773)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-5::unit-test::(Checksum: 3:f46b1ded9d6d58327b6cdc614a313095)
ALTER TABLE `kren_chnl_prodcr_t` ADD CONSTRAINT `KREN_CHNL_PRODCR_FK2` FOREIGN KEY (`PRODCR_ID`) REFERENCES `kren_prodcr_t` (`PRODCR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-5', '2.1.0-SNP', '3:f46b1ded9d6d58327b6cdc614a313095', 774)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-6::unit-test::(Checksum: 3:27f183ffd4e4d9a4743e7b6d383b85c4)
ALTER TABLE `kren_chnl_subscrp_t` ADD CONSTRAINT `KREN_CHAN_SUBSCRP_FK1` FOREIGN KEY (`CHNL_ID`) REFERENCES `kren_chnl_t` (`CHNL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-6', '2.1.0-SNP', '3:27f183ffd4e4d9a4743e7b6d383b85c4', 775)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-7::unit-test::(Checksum: 3:6c29dd1734b6468df1810c85536c477b)
ALTER TABLE `kren_msg_deliv_t` ADD CONSTRAINT `KREN_MSG_DELIV_FK1` FOREIGN KEY (`MSG_ID`) REFERENCES `kren_msg_t` (`MSG_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-7', '2.1.0-SNP', '3:6c29dd1734b6468df1810c85536c477b', 776)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-8::unit-test::(Checksum: 3:28c55eeeb9a5c9142005f45c51201b27)
ALTER TABLE `kren_ntfctn_msg_deliv_t` ADD CONSTRAINT `KREN_NTFCTN_MSG_DELIV_FK1` FOREIGN KEY (`NTFCTN_ID`) REFERENCES `kren_ntfctn_t` (`NTFCTN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-8', '2.1.0-SNP', '3:28c55eeeb9a5c9142005f45c51201b27', 777)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-9::unit-test::(Checksum: 3:d4188ed1daf90b4b97f5a08bec0fe124)
ALTER TABLE `kren_ntfctn_t` ADD CONSTRAINT `KREN_NTFCTN_FK1` FOREIGN KEY (`CHNL_ID`) REFERENCES `kren_chnl_t` (`CHNL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-9', '2.1.0-SNP', '3:d4188ed1daf90b4b97f5a08bec0fe124', 778)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-10::unit-test::(Checksum: 3:df9b2e066d5144ef73d5834c1ba4a1a0)
ALTER TABLE `kren_ntfctn_t` ADD CONSTRAINT `KREN_NTFCTN_FK2` FOREIGN KEY (`CNTNT_TYP_ID`) REFERENCES `kren_cntnt_typ_t` (`CNTNT_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-10', '2.1.0-SNP', '3:df9b2e066d5144ef73d5834c1ba4a1a0', 779)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-11::unit-test::(Checksum: 3:5a0bfdc885424d8623a962c39a1fcbd4)
ALTER TABLE `kren_ntfctn_t` ADD CONSTRAINT `KREN_NTFCTN_FK3` FOREIGN KEY (`PRIO_ID`) REFERENCES `kren_prio_t` (`PRIO_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-11', '2.1.0-SNP', '3:5a0bfdc885424d8623a962c39a1fcbd4', 780)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-12::unit-test::(Checksum: 3:4795bf32364f900854d706c36c53b665)
ALTER TABLE `kren_ntfctn_t` ADD CONSTRAINT `KREN_NTFCTN_FK4` FOREIGN KEY (`PRODCR_ID`) REFERENCES `kren_prodcr_t` (`PRODCR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-12', '2.1.0-SNP', '3:4795bf32364f900854d706c36c53b665', 781)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-13::unit-test::(Checksum: 3:83117748fc06bfa35402de90865b061f)
ALTER TABLE `kren_recip_list_t` ADD CONSTRAINT `KREN_RECIP_LIST_FK1` FOREIGN KEY (`CHNL_ID`) REFERENCES `kren_chnl_t` (`CHNL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-13', '2.1.0-SNP', '3:83117748fc06bfa35402de90865b061f', 782)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-14::unit-test::(Checksum: 3:755af0bf33c8bc826d378ac2329edd4c)
ALTER TABLE `kren_recip_t` ADD CONSTRAINT `KREN_RECIP_FK1` FOREIGN KEY (`NTFCTN_ID`) REFERENCES `kren_ntfctn_t` (`NTFCTN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-14', '2.1.0-SNP', '3:755af0bf33c8bc826d378ac2329edd4c', 783)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-15::unit-test::(Checksum: 3:aea9f9f266fbdddcd5016462ed9ec78d)
ALTER TABLE `kren_rvwer_t` ADD CONSTRAINT `NOTIFICATION_REVIEWERS_N_FK1` FOREIGN KEY (`CHNL_ID`) REFERENCES `kren_chnl_t` (`CHNL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-15', '2.1.0-SNP', '3:aea9f9f266fbdddcd5016462ed9ec78d', 784)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-16::unit-test::(Checksum: 3:40f7e293be5f16df7ef4c4da5d498cc1)
ALTER TABLE `kren_sndr_t` ADD CONSTRAINT `KREN_SNDR_FK1` FOREIGN KEY (`NTFCTN_ID`) REFERENCES `kren_ntfctn_t` (`NTFCTN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-16', '2.1.0-SNP', '3:40f7e293be5f16df7ef4c4da5d498cc1', 785)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-17::unit-test::(Checksum: 3:24aa63f577cf8b85ba9406585fc34349)
ALTER TABLE `krew_rte_node_cfg_parm_t` ADD CONSTRAINT `EN_RTE_NODE_CFG_PARM_TR1` FOREIGN KEY (`RTE_NODE_ID`) REFERENCES `krew_rte_node_t` (`RTE_NODE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-17', '2.1.0-SNP', '3:24aa63f577cf8b85ba9406585fc34349', 786)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-18::unit-test::(Checksum: 3:5d396f258e27264776612e1c24dfe88c)
ALTER TABLE `krew_rule_t` ADD CONSTRAINT `KREW_RULE_TR1` FOREIGN KEY (`RULE_EXPR_ID`) REFERENCES `krew_rule_expr_t` (`RULE_EXPR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-18', '2.1.0-SNP', '3:5d396f258e27264776612e1c24dfe88c', 787)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-19::unit-test::(Checksum: 3:d5fbad57377b98d19e7eae464e420819)
ALTER TABLE `krim_dlgn_mbr_attr_data_t` ADD CONSTRAINT `KRIM_DLGN_MBR_ATTR_DATA_TR2` FOREIGN KEY (`KIM_ATTR_DEFN_ID`) REFERENCES `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-19', '2.1.0-SNP', '3:d5fbad57377b98d19e7eae464e420819', 788)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-20::unit-test::(Checksum: 3:e9e4af89494178e408d00d4cea15d931)
ALTER TABLE `krim_dlgn_mbr_attr_data_t` ADD CONSTRAINT `KRIM_DLGN_MBR_ATTR_DATA_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-20', '2.1.0-SNP', '3:e9e4af89494178e408d00d4cea15d931', 789)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-21::unit-test::(Checksum: 3:3323db949fcaa86845270d64ef6f794d)
ALTER TABLE `krim_dlgn_mbr_t` ADD CONSTRAINT `KRIM_DLGN_MBR_TR2` FOREIGN KEY (`DLGN_ID`) REFERENCES `krim_dlgn_t` (`DLGN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-21', '2.1.0-SNP', '3:3323db949fcaa86845270d64ef6f794d', 790)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-22::unit-test::(Checksum: 3:81736d29041cec1bf6b6b4487548cc1f)
ALTER TABLE `krim_dlgn_t` ADD CONSTRAINT `KRIM_DLGN_TR2` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-22', '2.1.0-SNP', '3:81736d29041cec1bf6b6b4487548cc1f', 791)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-23::unit-test::(Checksum: 3:fda779b50199a59cfbd21a03af5b82b7)
ALTER TABLE `krim_dlgn_t` ADD CONSTRAINT `KRIM_DLGN_TR1` FOREIGN KEY (`ROLE_ID`) REFERENCES `krim_role_t` (`ROLE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-23', '2.1.0-SNP', '3:fda779b50199a59cfbd21a03af5b82b7', 792)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-24::unit-test::(Checksum: 3:240a53374b75be2eca6ca59f527f179f)
ALTER TABLE `krim_entity_addr_t` ADD CONSTRAINT `KRIM_ENTITY_ADDR_TR2` FOREIGN KEY (`ADDR_TYP_CD`) REFERENCES `krim_addr_typ_t` (`ADDR_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-24', '2.1.0-SNP', '3:240a53374b75be2eca6ca59f527f179f', 793)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-25::unit-test::(Checksum: 3:7fc0ed11a2c293ce8d158bdf575bf86c)
ALTER TABLE `krim_entity_addr_t` ADD CONSTRAINT `KRIM_ENTITY_ADDR_TR1` FOREIGN KEY (`ENT_TYP_CD`, `ENTITY_ID`) REFERENCES `krim_entity_ent_typ_t` (`ENT_TYP_CD`, `ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-25', '2.1.0-SNP', '3:7fc0ed11a2c293ce8d158bdf575bf86c', 794)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-26::unit-test::(Checksum: 3:649cf3ade9072cb38d25df2018d8cef5)
ALTER TABLE `krim_entity_afltn_t` ADD CONSTRAINT `KRIM_ENTITY_AFLTN_TR2` FOREIGN KEY (`AFLTN_TYP_CD`) REFERENCES `krim_afltn_typ_t` (`AFLTN_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-26', '2.1.0-SNP', '3:649cf3ade9072cb38d25df2018d8cef5', 795)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-27::unit-test::(Checksum: 3:15eecc5b83c382627239faebc0d603df)
ALTER TABLE `krim_entity_afltn_t` ADD CONSTRAINT `KRIM_ENTITY_AFLTN_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-27', '2.1.0-SNP', '3:15eecc5b83c382627239faebc0d603df', 796)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-28::unit-test::(Checksum: 3:8b4dfe8a405813334b631c9f19bac2f4)
ALTER TABLE `krim_entity_ctznshp_t` ADD CONSTRAINT `KRIM_ENTITY_CTZNSHP_TR2` FOREIGN KEY (`CTZNSHP_STAT_CD`) REFERENCES `krim_ctznshp_stat_t` (`CTZNSHP_STAT_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-28', '2.1.0-SNP', '3:8b4dfe8a405813334b631c9f19bac2f4', 797)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-29::unit-test::(Checksum: 3:ca0b1980a402f5174adea6f68b9b8097)
ALTER TABLE `krim_entity_ctznshp_t` ADD CONSTRAINT `KRIM_ENTITY_CTZNSHP_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-29', '2.1.0-SNP', '3:ca0b1980a402f5174adea6f68b9b8097', 798)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-30::unit-test::(Checksum: 3:d74a08d943b4320a1ae68e1e163d0c41)
ALTER TABLE `krim_entity_email_t` ADD CONSTRAINT `KRIM_ENTITY_EMAIL_TR1` FOREIGN KEY (`ENT_TYP_CD`, `ENTITY_ID`) REFERENCES `krim_entity_ent_typ_t` (`ENT_TYP_CD`, `ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-30', '2.1.0-SNP', '3:d74a08d943b4320a1ae68e1e163d0c41', 799)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-31::unit-test::(Checksum: 3:56d2e0db4c10df6dd175c2d766513808)
ALTER TABLE `krim_entity_emp_info_t` ADD CONSTRAINT `KRIM_ENTITY_EMP_INFO_TR2` FOREIGN KEY (`EMP_STAT_CD`) REFERENCES `krim_emp_stat_t` (`EMP_STAT_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-31', '2.1.0-SNP', '3:56d2e0db4c10df6dd175c2d766513808', 800)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-32::unit-test::(Checksum: 3:59f4f4b74aae670c1c2973d17f1b1350)
ALTER TABLE `krim_entity_emp_info_t` ADD CONSTRAINT `KRIM_ENTITY_EMP_INFO_TR3` FOREIGN KEY (`EMP_TYP_CD`) REFERENCES `krim_emp_typ_t` (`EMP_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-32', '2.1.0-SNP', '3:59f4f4b74aae670c1c2973d17f1b1350', 801)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-33::unit-test::(Checksum: 3:d86c9ac91a0f85defb52d3278f4db187)
ALTER TABLE `krim_entity_emp_info_t` ADD CONSTRAINT `KRIM_ENTITY_EMP_INFO_TR4` FOREIGN KEY (`ENTITY_AFLTN_ID`) REFERENCES `krim_entity_afltn_t` (`ENTITY_AFLTN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-33', '2.1.0-SNP', '3:d86c9ac91a0f85defb52d3278f4db187', 802)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-34::unit-test::(Checksum: 3:9fa321792c6d407c84bc36404b2343c0)
ALTER TABLE `krim_entity_emp_info_t` ADD CONSTRAINT `KRIM_ENTITY_EMP_INFO_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-34', '2.1.0-SNP', '3:9fa321792c6d407c84bc36404b2343c0', 803)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-35::unit-test::(Checksum: 3:f4cde012a9a8c4178898c7d79c6b65df)
ALTER TABLE `krim_entity_ent_typ_t` ADD CONSTRAINT `KRIM_ENTITY_ENT_TYP_TR2` FOREIGN KEY (`ENT_TYP_CD`) REFERENCES `krim_ent_typ_t` (`ENT_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-35', '2.1.0-SNP', '3:f4cde012a9a8c4178898c7d79c6b65df', 804)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-36::unit-test::(Checksum: 3:86e5c549dd971d6109892745557c4373)
ALTER TABLE `krim_entity_ent_typ_t` ADD CONSTRAINT `KRIM_ENTITY_ENT_TYP_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-36', '2.1.0-SNP', '3:86e5c549dd971d6109892745557c4373', 805)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-37::unit-test::(Checksum: 3:0c4797c522675e4b70f091161f6fc7d5)
ALTER TABLE `krim_entity_ethnic_t` ADD CONSTRAINT `KRIM_ENTITY_ETHNIC_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-37', '2.1.0-SNP', '3:0c4797c522675e4b70f091161f6fc7d5', 806)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-38::unit-test::(Checksum: 3:4d9346d8cdf1d1a49b89546d47a93cc5)
ALTER TABLE `krim_entity_ext_id_t` ADD CONSTRAINT `KRIM_ENTITY_EXT_ID_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-38', '2.1.0-SNP', '3:4d9346d8cdf1d1a49b89546d47a93cc5', 807)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-39::unit-test::(Checksum: 3:663ab81512e58862668147c3ef17227b)
ALTER TABLE `krim_entity_ext_id_t` ADD CONSTRAINT `KRIM_ENTITY_EXT_ID_TR2` FOREIGN KEY (`EXT_ID_TYP_CD`) REFERENCES `krim_ext_id_typ_t` (`EXT_ID_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-39', '2.1.0-SNP', '3:663ab81512e58862668147c3ef17227b', 808)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-40::unit-test::(Checksum: 3:969c986f6e69cc2ad1df75c9cdfca5d6)
ALTER TABLE `krim_entity_nm_t` ADD CONSTRAINT `KRIM_ENTITY_NM_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-40', '2.1.0-SNP', '3:969c986f6e69cc2ad1df75c9cdfca5d6', 809)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-41::unit-test::(Checksum: 3:858eda236fa570e17fabe6771f7261b2)
ALTER TABLE `krim_entity_phone_t` ADD CONSTRAINT `KRIM_ENTITY_PHONE_TR1` FOREIGN KEY (`ENT_TYP_CD`, `ENTITY_ID`) REFERENCES `krim_entity_ent_typ_t` (`ENT_TYP_CD`, `ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-41', '2.1.0-SNP', '3:858eda236fa570e17fabe6771f7261b2', 810)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-42::unit-test::(Checksum: 3:33985330e3f4eaf24d4acb8d284ef116)
ALTER TABLE `krim_entity_phone_t` ADD CONSTRAINT `KRIM_ENTITY_PHONE_TR2` FOREIGN KEY (`PHONE_TYP_CD`) REFERENCES `krim_phone_typ_t` (`PHONE_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-42', '2.1.0-SNP', '3:33985330e3f4eaf24d4acb8d284ef116', 811)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-43::unit-test::(Checksum: 3:3abf27247b497b663107258d3d3b94c7)
ALTER TABLE `krim_entity_residency_t` ADD CONSTRAINT `KRIM_ENTITY_RESIDENCY_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-43', '2.1.0-SNP', '3:3abf27247b497b663107258d3d3b94c7', 812)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-44::unit-test::(Checksum: 3:60e128412e0d2e41c18ed1e3bdde0805)
ALTER TABLE `krim_entity_visa_t` ADD CONSTRAINT `KRIM_ENTITY_VISA_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-44', '2.1.0-SNP', '3:60e128412e0d2e41c18ed1e3bdde0805', 813)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-45::unit-test::(Checksum: 3:931d8206d88f6c99c15f54296fc5f2f0)
ALTER TABLE `krim_grp_attr_data_t` ADD CONSTRAINT `KRIM_GRP_ATTR_DATA_TR3` FOREIGN KEY (`GRP_ID`) REFERENCES `krim_grp_t` (`GRP_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-45', '2.1.0-SNP', '3:931d8206d88f6c99c15f54296fc5f2f0', 814)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-46::unit-test::(Checksum: 3:1e0e4b56cfcd74582be8824c10c205f0)
ALTER TABLE `krim_grp_attr_data_t` ADD CONSTRAINT `KRIM_GRP_ATTR_DATA_TR2` FOREIGN KEY (`KIM_ATTR_DEFN_ID`) REFERENCES `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-46', '2.1.0-SNP', '3:1e0e4b56cfcd74582be8824c10c205f0', 815)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-47::unit-test::(Checksum: 3:a13d1cf2cdb1afe4385e0d10642a2318)
ALTER TABLE `krim_grp_attr_data_t` ADD CONSTRAINT `KRIM_GRP_ATTR_DATA_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-47', '2.1.0-SNP', '3:a13d1cf2cdb1afe4385e0d10642a2318', 816)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-48::unit-test::(Checksum: 3:7744c5d6f87ec924fcb64e2e53a54ecb)
ALTER TABLE `krim_grp_mbr_t` ADD CONSTRAINT `KRIM_GRP_MBR_TR1` FOREIGN KEY (`GRP_ID`) REFERENCES `krim_grp_t` (`GRP_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-48', '2.1.0-SNP', '3:7744c5d6f87ec924fcb64e2e53a54ecb', 817)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-49::unit-test::(Checksum: 3:ef9766fbff85138d2d0b8ef02d704f4c)
ALTER TABLE `krim_grp_t` ADD CONSTRAINT `KRIM_GRP_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-49', '2.1.0-SNP', '3:ef9766fbff85138d2d0b8ef02d704f4c', 818)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-50::unit-test::(Checksum: 3:45000c646addae6f6b4bc1b3c1df88ff)
ALTER TABLE `krim_perm_attr_data_t` ADD CONSTRAINT `KRIM_PERM_ATTR_DATA_TR2` FOREIGN KEY (`KIM_ATTR_DEFN_ID`) REFERENCES `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-50', '2.1.0-SNP', '3:45000c646addae6f6b4bc1b3c1df88ff', 819)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-51::unit-test::(Checksum: 3:5d8c5f5ca28920ca9e05e669e29ee92b)
ALTER TABLE `krim_perm_attr_data_t` ADD CONSTRAINT `KRIM_PERM_ATTR_DATA_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-51', '2.1.0-SNP', '3:5d8c5f5ca28920ca9e05e669e29ee92b', 820)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-52::unit-test::(Checksum: 3:9a3d4458646c1258257446ede7b9d2c6)
ALTER TABLE `krim_perm_attr_data_t` ADD CONSTRAINT `KRIM_PERM_ATTR_DATA_TR3` FOREIGN KEY (`PERM_ID`) REFERENCES `krim_perm_t` (`PERM_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-52', '2.1.0-SNP', '3:9a3d4458646c1258257446ede7b9d2c6', 821)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-53::unit-test::(Checksum: 3:3db3673722d793c1761e4f284e6a5005)
ALTER TABLE `krim_perm_t` ADD CONSTRAINT `KRIM_PERM_TR1` FOREIGN KEY (`PERM_TMPL_ID`) REFERENCES `krim_perm_tmpl_t` (`PERM_TMPL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-53', '2.1.0-SNP', '3:3db3673722d793c1761e4f284e6a5005', 822)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-54::unit-test::(Checksum: 3:73f5af1ab6b90a5192f259ff67377710)
ALTER TABLE `krim_perm_tmpl_t` ADD CONSTRAINT `KRIM_PERM_TMPL_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-54', '2.1.0-SNP', '3:73f5af1ab6b90a5192f259ff67377710', 823)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-55::unit-test::(Checksum: 3:ba6314f00e105e18b61e7c7885085a7f)
ALTER TABLE `krim_pnd_afltn_mt` ADD CONSTRAINT `KRIM_PND_AFLTN_MT_FK1` FOREIGN KEY (`FDOC_NBR`) REFERENCES `krim_person_document_t` (`FDOC_NBR`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-55', '2.1.0-SNP', '3:ba6314f00e105e18b61e7c7885085a7f', 824)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-56::unit-test::(Checksum: 3:5f0434693ce42e39bca9e0ece466b28a)
ALTER TABLE `krim_prncpl_t` ADD CONSTRAINT `KRIM_PRNCPL_TR1` FOREIGN KEY (`ENTITY_ID`) REFERENCES `krim_entity_t` (`ENTITY_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-56', '2.1.0-SNP', '3:5f0434693ce42e39bca9e0ece466b28a', 825)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-57::unit-test::(Checksum: 3:1b4b87d0cab80033f395b447b8fa16e0)
ALTER TABLE `krim_role_mbr_attr_data_t` ADD CONSTRAINT `KRIM_ROLE_MBR_ATTR_DATA_TR2` FOREIGN KEY (`KIM_ATTR_DEFN_ID`) REFERENCES `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-57', '2.1.0-SNP', '3:1b4b87d0cab80033f395b447b8fa16e0', 826)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-58::unit-test::(Checksum: 3:c088f0300c9e3b010e7ef53800667d90)
ALTER TABLE `krim_role_mbr_attr_data_t` ADD CONSTRAINT `KRIM_ROLE_MBR_ATTR_DATA_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-58', '2.1.0-SNP', '3:c088f0300c9e3b010e7ef53800667d90', 827)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-59::unit-test::(Checksum: 3:8b8f4d65da1645c6666aab24eae03584)
ALTER TABLE `krim_role_mbr_t` ADD CONSTRAINT `KRIM_ROLE_MBR_TR1` FOREIGN KEY (`ROLE_ID`) REFERENCES `krim_role_t` (`ROLE_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-59', '2.1.0-SNP', '3:8b8f4d65da1645c6666aab24eae03584', 828)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-60::unit-test::(Checksum: 3:a8dcd9e74e6e8ba3eeae0546283acdbc)
ALTER TABLE `krim_role_perm_t` ADD CONSTRAINT `KRIM_ROLE_PERM_TR1` FOREIGN KEY (`PERM_ID`) REFERENCES `krim_perm_t` (`PERM_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-60', '2.1.0-SNP', '3:a8dcd9e74e6e8ba3eeae0546283acdbc', 829)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-61::unit-test::(Checksum: 3:665f67dfc9cae2ec536a5097c4a8d82f)
ALTER TABLE `krim_role_rsp_t` ADD CONSTRAINT `KRIM_ROLE_RSP_TR1` FOREIGN KEY (`RSP_ID`) REFERENCES `krim_rsp_t` (`RSP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-61', '2.1.0-SNP', '3:665f67dfc9cae2ec536a5097c4a8d82f', 830)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-62::unit-test::(Checksum: 3:5125a47f212b3141b2ff5bb741e79fc8)
ALTER TABLE `krim_role_t` ADD CONSTRAINT `KRIM_ROLE_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-62', '2.1.0-SNP', '3:5125a47f212b3141b2ff5bb741e79fc8', 831)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-63::unit-test::(Checksum: 3:96d8bd242724086fd9e99a6c5b676d24)
ALTER TABLE `krim_rsp_attr_data_t` ADD CONSTRAINT `KRIM_RSP_ATTR_DATA_TR2` FOREIGN KEY (`KIM_ATTR_DEFN_ID`) REFERENCES `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-63', '2.1.0-SNP', '3:96d8bd242724086fd9e99a6c5b676d24', 832)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-64::unit-test::(Checksum: 3:8c9cd48d21c259745590db00025160ab)
ALTER TABLE `krim_rsp_attr_data_t` ADD CONSTRAINT `KRIM_RSP_ATTR_DATA_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-64', '2.1.0-SNP', '3:8c9cd48d21c259745590db00025160ab', 833)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-65::unit-test::(Checksum: 3:5a31868b5455a141ad214d2d2c758cb1)
ALTER TABLE `krim_rsp_attr_data_t` ADD CONSTRAINT `KRIM_RSP_ATTR_DATA_TR3` FOREIGN KEY (`RSP_ID`) REFERENCES `krim_rsp_t` (`RSP_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-65', '2.1.0-SNP', '3:5a31868b5455a141ad214d2d2c758cb1', 834)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-66::unit-test::(Checksum: 3:350e96b64e519f5e9aaf98b462e67819)
ALTER TABLE `krim_rsp_t` ADD CONSTRAINT `KRIM_RSP_TR1` FOREIGN KEY (`RSP_TMPL_ID`) REFERENCES `krim_rsp_tmpl_t` (`RSP_TMPL_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-66', '2.1.0-SNP', '3:350e96b64e519f5e9aaf98b462e67819', 835)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-67::unit-test::(Checksum: 3:f36d3eda8a04c545709a4cb8ed347075)
ALTER TABLE `krim_rsp_tmpl_t` ADD CONSTRAINT `KRIM_RSP_TMPL_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-67', '2.1.0-SNP', '3:f36d3eda8a04c545709a4cb8ed347075', 836)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-68::unit-test::(Checksum: 3:767a84fbe6d62605bf971f603fb44225)
ALTER TABLE `krim_typ_attr_t` ADD CONSTRAINT `KRIM_TYP_ATTR_TR2` FOREIGN KEY (`KIM_ATTR_DEFN_ID`) REFERENCES `krim_attr_defn_t` (`KIM_ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-68', '2.1.0-SNP', '3:767a84fbe6d62605bf971f603fb44225', 837)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-69::unit-test::(Checksum: 3:cb44a382e9f2ca7148bcc45cf37dded9)
ALTER TABLE `krim_typ_attr_t` ADD CONSTRAINT `KRIM_TYP_ATTRIBUTE_TR1` FOREIGN KEY (`KIM_TYP_ID`) REFERENCES `krim_typ_t` (`KIM_TYP_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-69', '2.1.0-SNP', '3:cb44a382e9f2ca7148bcc45cf37dded9', 838)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-70::unit-test::(Checksum: 3:15dde6354a40f67a2ae005e02ff80a20)
ALTER TABLE `krlc_cmp_t` ADD CONSTRAINT `SH_CAMPUS_TR1` FOREIGN KEY (`CAMPUS_TYP_CD`) REFERENCES `krlc_cmp_typ_t` (`CAMPUS_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-70', '2.1.0-SNP', '3:15dde6354a40f67a2ae005e02ff80a20', 839)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-71::unit-test::(Checksum: 3:8ad5a1628bcac90f40df6ef5bf61d3ca)
ALTER TABLE `krlc_pstl_cd_t` ADD CONSTRAINT `KR_POSTAL_CODE_TR3` FOREIGN KEY (`COUNTY_CD`, `POSTAL_STATE_CD`, `POSTAL_CNTRY_CD`) REFERENCES `krlc_cnty_t` (`COUNTY_CD`, `STATE_CD`, `POSTAL_CNTRY_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-71', '2.1.0-SNP', '3:8ad5a1628bcac90f40df6ef5bf61d3ca', 840)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-72::unit-test::(Checksum: 3:3649f530f566ed892258b66348761fe7)
ALTER TABLE `krlc_pstl_cd_t` ADD CONSTRAINT `KR_POSTAL_CODE_TR1` FOREIGN KEY (`POSTAL_CNTRY_CD`) REFERENCES `krlc_cntry_t` (`POSTAL_CNTRY_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-72', '2.1.0-SNP', '3:3649f530f566ed892258b66348761fe7', 841)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-73::unit-test::(Checksum: 3:273c88e1e8c5ee094f4f652bbe981b82)
ALTER TABLE `krlc_pstl_cd_t` ADD CONSTRAINT `KR_POSTAL_CODE_TR2` FOREIGN KEY (`POSTAL_STATE_CD`, `POSTAL_CNTRY_CD`) REFERENCES `krlc_st_t` (`POSTAL_STATE_CD`, `POSTAL_CNTRY_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-73', '2.1.0-SNP', '3:273c88e1e8c5ee094f4f652bbe981b82', 842)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-74::unit-test::(Checksum: 3:8ffadc02804f6a7de21e5bdb7fd1ffd6)
ALTER TABLE `krlc_st_t` ADD CONSTRAINT `KR_STATE_TR1` FOREIGN KEY (`POSTAL_CNTRY_CD`) REFERENCES `krlc_cntry_t` (`POSTAL_CNTRY_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-74', '2.1.0-SNP', '3:8ffadc02804f6a7de21e5bdb7fd1ffd6', 843)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-75::unit-test::(Checksum: 3:a8187c8a805ba2a6488319ffcdf7245b)
ALTER TABLE `krms_actn_attr_t` ADD CONSTRAINT `KRMS_ACTN_ATTR_FK1` FOREIGN KEY (`ACTN_ID`) REFERENCES `krms_actn_t` (`ACTN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-75', '2.1.0-SNP', '3:a8187c8a805ba2a6488319ffcdf7245b', 844)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-76::unit-test::(Checksum: 3:795590cde67826b8e9ffd571d818b528)
ALTER TABLE `krms_actn_attr_t` ADD CONSTRAINT `KRMS_ACTN_ATTR_FK2` FOREIGN KEY (`ATTR_DEFN_ID`) REFERENCES `krms_attr_defn_t` (`ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-76', '2.1.0-SNP', '3:795590cde67826b8e9ffd571d818b528', 845)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-77::unit-test::(Checksum: 3:30604dc4e3664b37c64d313f0c92dea1)
ALTER TABLE `krms_actn_t` ADD CONSTRAINT `KRMS_ACTN_FK1` FOREIGN KEY (`RULE_ID`) REFERENCES `krms_rule_t` (`RULE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-77', '2.1.0-SNP', '3:30604dc4e3664b37c64d313f0c92dea1', 846)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-78::unit-test::(Checksum: 3:46834eed2bbc5b02ab0f81d590a98f2b)
ALTER TABLE `krms_agenda_attr_t` ADD CONSTRAINT `KRMS_AGENDA_ATTR_FK1` FOREIGN KEY (`AGENDA_ID`) REFERENCES `krms_agenda_t` (`AGENDA_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-78', '2.1.0-SNP', '3:46834eed2bbc5b02ab0f81d590a98f2b', 847)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-79::unit-test::(Checksum: 3:22c04803096a2f9ce824163b0981bf08)
ALTER TABLE `krms_agenda_attr_t` ADD CONSTRAINT `KRMS_AGENDA_ATTR_FK2` FOREIGN KEY (`ATTR_DEFN_ID`) REFERENCES `krms_attr_defn_t` (`ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-79', '2.1.0-SNP', '3:22c04803096a2f9ce824163b0981bf08', 848)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-80::unit-test::(Checksum: 3:458c0ab2bff05a883d12333ba4c3d598)
ALTER TABLE `krms_agenda_itm_t` ADD CONSTRAINT `KRMS_AGENDA_ITM_FK2` FOREIGN KEY (`AGENDA_ID`) REFERENCES `krms_agenda_t` (`AGENDA_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-80', '2.1.0-SNP', '3:458c0ab2bff05a883d12333ba4c3d598', 849)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-81::unit-test::(Checksum: 3:2070290866f375b68c9a2997632d76d0)
ALTER TABLE `krms_agenda_itm_t` ADD CONSTRAINT `KRMS_AGENDA_ITM_FK6` FOREIGN KEY (`ALWAYS`) REFERENCES `krms_agenda_itm_t` (`AGENDA_ITM_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-81', '2.1.0-SNP', '3:2070290866f375b68c9a2997632d76d0', 850)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-82::unit-test::(Checksum: 3:81f10a174996e2f2c80722f652fb8eae)
ALTER TABLE `krms_agenda_itm_t` ADD CONSTRAINT `KRMS_AGENDA_ITM_FK1` FOREIGN KEY (`RULE_ID`) REFERENCES `krms_rule_t` (`RULE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-82', '2.1.0-SNP', '3:81f10a174996e2f2c80722f652fb8eae', 851)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-83::unit-test::(Checksum: 3:2329fe92ce3f0caf3f02abfeab35640f)
ALTER TABLE `krms_agenda_itm_t` ADD CONSTRAINT `KRMS_AGENDA_ITM_FK3` FOREIGN KEY (`SUB_AGENDA_ID`) REFERENCES `krms_agenda_t` (`AGENDA_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-83', '2.1.0-SNP', '3:2329fe92ce3f0caf3f02abfeab35640f', 852)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-84::unit-test::(Checksum: 3:ab9818651d891bb7814b0da679cfed6d)
ALTER TABLE `krms_agenda_itm_t` ADD CONSTRAINT `KRMS_AGENDA_ITM_FK5` FOREIGN KEY (`WHEN_FALSE`) REFERENCES `krms_agenda_itm_t` (`AGENDA_ITM_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-84', '2.1.0-SNP', '3:ab9818651d891bb7814b0da679cfed6d', 853)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-85::unit-test::(Checksum: 3:bbce0f52a50342bb9612195052f7792e)
ALTER TABLE `krms_agenda_itm_t` ADD CONSTRAINT `KRMS_AGENDA_ITM_FK4` FOREIGN KEY (`WHEN_TRUE`) REFERENCES `krms_agenda_itm_t` (`AGENDA_ITM_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-85', '2.1.0-SNP', '3:bbce0f52a50342bb9612195052f7792e', 854)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-86::unit-test::(Checksum: 3:9bad3a0ed3d351b98c8b6efa0759347d)
ALTER TABLE `krms_agenda_t` ADD CONSTRAINT `KRMS_AGENDA_FK1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-86', '2.1.0-SNP', '3:9bad3a0ed3d351b98c8b6efa0759347d', 855)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-87::unit-test::(Checksum: 3:5cd31a2a0bda8db00976f4ca7ec4b657)
ALTER TABLE `krms_cmpnd_prop_props_t` ADD CONSTRAINT `KRMS_CMPND_PROP_PROPS_FK2` FOREIGN KEY (`CMPND_PROP_ID`) REFERENCES `krms_prop_t` (`PROP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-87', '2.1.0-SNP', '3:5cd31a2a0bda8db00976f4ca7ec4b657', 856)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-88::unit-test::(Checksum: 3:a39b6216b32cf4560203fcff2b2aa50f)
ALTER TABLE `krms_cmpnd_prop_props_t` ADD CONSTRAINT `KRMS_CMPND_PROP_PROPS_FK1` FOREIGN KEY (`PROP_ID`) REFERENCES `krms_prop_t` (`PROP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-88', '2.1.0-SNP', '3:a39b6216b32cf4560203fcff2b2aa50f', 857)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-89::unit-test::(Checksum: 3:894e1f3cbb030d9e59a8f5c51b8e38b7)
ALTER TABLE `krms_cntxt_attr_t` ADD CONSTRAINT `KRMS_CNTXT_ATTR_FK2` FOREIGN KEY (`ATTR_DEFN_ID`) REFERENCES `krms_attr_defn_t` (`ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-89', '2.1.0-SNP', '3:894e1f3cbb030d9e59a8f5c51b8e38b7', 858)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-90::unit-test::(Checksum: 3:32e66183d999dd97aa5da6626e5af3ee)
ALTER TABLE `krms_cntxt_attr_t` ADD CONSTRAINT `KRMS_CNTXT_ATTR_FK1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-90', '2.1.0-SNP', '3:32e66183d999dd97aa5da6626e5af3ee', 859)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-91::unit-test::(Checksum: 3:d53b0d15b4bf8e71cd834d0574aa5597)
ALTER TABLE `krms_cntxt_vld_actn_t` ADD CONSTRAINT `KRMS_CNTXT_VLD_ACTN_FK1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-91', '2.1.0-SNP', '3:d53b0d15b4bf8e71cd834d0574aa5597', 860)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-92::unit-test::(Checksum: 3:de4e95fc54c2588bbf207b9f3e40f97f)
ALTER TABLE `krms_cntxt_vld_event_t` ADD CONSTRAINT `KRMS_CNTXT_VLD_EVENT_FK1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-92', '2.1.0-SNP', '3:de4e95fc54c2588bbf207b9f3e40f97f', 861)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-93::unit-test::(Checksum: 3:b02c2d29905966f923d4215ef3195b38)
ALTER TABLE `krms_cntxt_vld_func_t` ADD CONSTRAINT `KRMS_CNTXT_VLD_FUNC_FK1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-93', '2.1.0-SNP', '3:b02c2d29905966f923d4215ef3195b38', 862)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-94::unit-test::(Checksum: 3:67d4ae7f10113045c4a41320f4583e87)
ALTER TABLE `krms_cntxt_vld_rule_t` ADD CONSTRAINT `KRMS_CNTXT_VLD_RULE_FK1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-94', '2.1.0-SNP', '3:67d4ae7f10113045c4a41320f4583e87', 863)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-95::unit-test::(Checksum: 3:2c71a37ee689e1e7db2930db3f797add)
ALTER TABLE `krms_cntxt_vld_term_spec_t` ADD CONSTRAINT `KRMS_CNTXT_VLD_TERM_SPEC_TI1` FOREIGN KEY (`CNTXT_ID`) REFERENCES `krms_cntxt_t` (`CNTXT_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-95', '2.1.0-SNP', '3:2c71a37ee689e1e7db2930db3f797add', 864)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-96::unit-test::(Checksum: 3:53b2a3305286146c335c211591c5ac89)
ALTER TABLE `krms_cntxt_vld_term_spec_t` ADD CONSTRAINT `KRMS_CNTXT_VLD_TERM_SPEC_TI2` FOREIGN KEY (`TERM_SPEC_ID`) REFERENCES `krms_term_spec_t` (`TERM_SPEC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-96', '2.1.0-SNP', '3:53b2a3305286146c335c211591c5ac89', 865)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-97::unit-test::(Checksum: 3:56add7ac21d7a8c134bf67d5dd492d2a)
ALTER TABLE `krms_func_ctgry_t` ADD CONSTRAINT `KRMS_FUNC_CTGRY_FK2` FOREIGN KEY (`CTGRY_ID`) REFERENCES `krms_ctgry_t` (`CTGRY_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-97', '2.1.0-SNP', '3:56add7ac21d7a8c134bf67d5dd492d2a', 866)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-98::unit-test::(Checksum: 3:c35169df7641eaed0b7ae0ffd50eea74)
ALTER TABLE `krms_func_ctgry_t` ADD CONSTRAINT `KRMS_FUNC_CTGRY_FK1` FOREIGN KEY (`FUNC_ID`) REFERENCES `krms_func_t` (`FUNC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-98', '2.1.0-SNP', '3:c35169df7641eaed0b7ae0ffd50eea74', 867)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-99::unit-test::(Checksum: 3:05a5839523243c7c0d0148d708bcde0f)
ALTER TABLE `krms_func_parm_t` ADD CONSTRAINT `KRMS_FUNC_PARM_FK1` FOREIGN KEY (`FUNC_ID`) REFERENCES `krms_func_t` (`FUNC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-99', '2.1.0-SNP', '3:05a5839523243c7c0d0148d708bcde0f', 868)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-100::unit-test::(Checksum: 3:198f6961a69d92e59328773ec7ddea18)
ALTER TABLE `krms_func_t` ADD CONSTRAINT `KRMS_FUNC_FK1` FOREIGN KEY (`TYP_ID`) REFERENCES `krms_typ_t` (`TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-100', '2.1.0-SNP', '3:198f6961a69d92e59328773ec7ddea18', 869)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-101::unit-test::(Checksum: 3:936bbde3017c90669651d2842be5ce52)
ALTER TABLE `krms_prop_parm_t` ADD CONSTRAINT `KRMS_PROP_PARM_FK1` FOREIGN KEY (`PROP_ID`) REFERENCES `krms_prop_t` (`PROP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-101', '2.1.0-SNP', '3:936bbde3017c90669651d2842be5ce52', 870)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-102::unit-test::(Checksum: 3:1ea6297b0bb8bd9f0e88199d0aa43215)
ALTER TABLE `krms_prop_t` ADD CONSTRAINT `KRMS_PROP_FK1` FOREIGN KEY (`RULE_ID`) REFERENCES `krms_rule_t` (`RULE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-102', '2.1.0-SNP', '3:1ea6297b0bb8bd9f0e88199d0aa43215', 871)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-103::unit-test::(Checksum: 3:f5f022f19c6010a3adf63649760bd936)
ALTER TABLE `krms_prop_t` ADD CONSTRAINT `KRMS_PROP_FK2` FOREIGN KEY (`TYP_ID`) REFERENCES `krms_typ_t` (`TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-103', '2.1.0-SNP', '3:f5f022f19c6010a3adf63649760bd936', 872)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-104::unit-test::(Checksum: 3:63736b3c99b2a6d9eaefafe05cb6ce78)
ALTER TABLE `krms_rule_attr_t` ADD CONSTRAINT `KRMS_RULE_ATTR_FK2` FOREIGN KEY (`ATTR_DEFN_ID`) REFERENCES `krms_attr_defn_t` (`ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-104', '2.1.0-SNP', '3:63736b3c99b2a6d9eaefafe05cb6ce78', 873)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-105::unit-test::(Checksum: 3:5d778e82afe4a0c82958efc9fd1386f1)
ALTER TABLE `krms_rule_attr_t` ADD CONSTRAINT `KRMS_RULE_ATTR_FK1` FOREIGN KEY (`RULE_ID`) REFERENCES `krms_rule_t` (`RULE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-105', '2.1.0-SNP', '3:5d778e82afe4a0c82958efc9fd1386f1', 874)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-106::unit-test::(Checksum: 3:1af858578df8094ed8c5aecbf7ae0b6d)
ALTER TABLE `krms_rule_t` ADD CONSTRAINT `KRMS_RULE_FK1` FOREIGN KEY (`PROP_ID`) REFERENCES `krms_prop_t` (`PROP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-106', '2.1.0-SNP', '3:1af858578df8094ed8c5aecbf7ae0b6d', 875)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-107::unit-test::(Checksum: 3:e060407e6c36ce785628abf2d2c0dfc0)
ALTER TABLE `krms_term_parm_t` ADD CONSTRAINT `KRMS_TERM_PARM_FK1` FOREIGN KEY (`TERM_ID`) REFERENCES `krms_term_t` (`TERM_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-107', '2.1.0-SNP', '3:e060407e6c36ce785628abf2d2c0dfc0', 876)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-108::unit-test::(Checksum: 3:a8c84b6a1d4494fb09dfeda7feeb44ac)
ALTER TABLE `krms_term_rslvr_attr_t` ADD CONSTRAINT `KRMS_TERM_RSLVR_ATTR_FK2` FOREIGN KEY (`ATTR_DEFN_ID`) REFERENCES `krms_attr_defn_t` (`ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-108', '2.1.0-SNP', '3:a8c84b6a1d4494fb09dfeda7feeb44ac', 877)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-109::unit-test::(Checksum: 3:61698c2fbd0b5287d3328c4b29aef805)
ALTER TABLE `krms_term_rslvr_attr_t` ADD CONSTRAINT `KRMS_TERM_RSLVR_ATTR_FK1` FOREIGN KEY (`TERM_RSLVR_ID`) REFERENCES `krms_term_rslvr_t` (`TERM_RSLVR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-109', '2.1.0-SNP', '3:61698c2fbd0b5287d3328c4b29aef805', 878)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-110::unit-test::(Checksum: 3:72f44efd6bde656cb88573a1ea77b71e)
ALTER TABLE `krms_term_rslvr_input_spec_t` ADD CONSTRAINT `KRMS_INPUT_ASSET_FK1` FOREIGN KEY (`TERM_RSLVR_ID`) REFERENCES `krms_term_rslvr_t` (`TERM_RSLVR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-110', '2.1.0-SNP', '3:72f44efd6bde656cb88573a1ea77b71e', 879)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-111::unit-test::(Checksum: 3:4d1638d515524639f9db71ffaab4b792)
ALTER TABLE `krms_term_rslvr_input_spec_t` ADD CONSTRAINT `KRMS_INPUT_ASSET_FK2` FOREIGN KEY (`TERM_SPEC_ID`) REFERENCES `krms_term_spec_t` (`TERM_SPEC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-111', '2.1.0-SNP', '3:4d1638d515524639f9db71ffaab4b792', 880)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-112::unit-test::(Checksum: 3:be6ec2862ab5b19ac00fb689152ad359)
ALTER TABLE `krms_term_rslvr_parm_spec_t` ADD CONSTRAINT `KRMS_TERM_RESLV_PARM_FK1` FOREIGN KEY (`TERM_RSLVR_ID`) REFERENCES `krms_term_rslvr_t` (`TERM_RSLVR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-112', '2.1.0-SNP', '3:be6ec2862ab5b19ac00fb689152ad359', 881)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-113::unit-test::(Checksum: 3:97053b08f5f134c4d0193bc66850e5cb)
ALTER TABLE `krms_term_rslvr_t` ADD CONSTRAINT `KRMS_TERM_RSLVR_FK1` FOREIGN KEY (`OUTPUT_TERM_SPEC_ID`) REFERENCES `krms_term_spec_t` (`TERM_SPEC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-113', '2.1.0-SNP', '3:97053b08f5f134c4d0193bc66850e5cb', 882)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-114::unit-test::(Checksum: 3:974fc428328929073ef162eedd95e4ce)
ALTER TABLE `krms_term_rslvr_t` ADD CONSTRAINT `KRMS_TERM_RSLVR_FK3` FOREIGN KEY (`TYP_ID`) REFERENCES `krms_typ_t` (`TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-114', '2.1.0-SNP', '3:974fc428328929073ef162eedd95e4ce', 883)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-115::unit-test::(Checksum: 3:b4657da71ea1ec6d4457fbb8d9961858)
ALTER TABLE `krms_term_spec_ctgry_t` ADD CONSTRAINT `KRMS_TERM_SPEC_CTGRY_FK2` FOREIGN KEY (`CTGRY_ID`) REFERENCES `krms_ctgry_t` (`CTGRY_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-115', '2.1.0-SNP', '3:b4657da71ea1ec6d4457fbb8d9961858', 884)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-116::unit-test::(Checksum: 3:cb65874eeb2a74d849857b30ff6a1ced)
ALTER TABLE `krms_term_spec_ctgry_t` ADD CONSTRAINT `KRMS_TERM_SPEC_CTGRY_FK1` FOREIGN KEY (`TERM_SPEC_ID`) REFERENCES `krms_term_spec_t` (`TERM_SPEC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-116', '2.1.0-SNP', '3:cb65874eeb2a74d849857b30ff6a1ced', 885)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-117::unit-test::(Checksum: 3:0c309c3a5748f6ea992eeba7ba6b8759)
ALTER TABLE `krms_term_t` ADD CONSTRAINT `KRMS_TERM_T__FK1` FOREIGN KEY (`TERM_SPEC_ID`) REFERENCES `krms_term_spec_t` (`TERM_SPEC_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-117', '2.1.0-SNP', '3:0c309c3a5748f6ea992eeba7ba6b8759', 886)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-118::unit-test::(Checksum: 3:c1b944a86aef36d48879a801e0dba529)
ALTER TABLE `krms_typ_attr_t` ADD CONSTRAINT `KRMS_TYP_ATTR_FK1` FOREIGN KEY (`ATTR_DEFN_ID`) REFERENCES `krms_attr_defn_t` (`ATTR_DEFN_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-118', '2.1.0-SNP', '3:c1b944a86aef36d48879a801e0dba529', 887)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-119::unit-test::(Checksum: 3:17f303df91c76a97c67a09007b0582e7)
ALTER TABLE `krms_typ_attr_t` ADD CONSTRAINT `KRMS_TYP_ATTR_FK2` FOREIGN KEY (`TYP_ID`) REFERENCES `krms_typ_t` (`TYP_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-119', '2.1.0-SNP', '3:17f303df91c76a97c67a09007b0582e7', 888)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-120::unit-test::(Checksum: 3:52415d327f6de1cf26158f6ed1b696aa)
ALTER TABLE `krns_att_t` ADD CONSTRAINT `KRNS_ATT_TR1` FOREIGN KEY (`NTE_ID`) REFERENCES `krns_nte_t` (`NTE_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-120', '2.1.0-SNP', '3:52415d327f6de1cf26158f6ed1b696aa', 889)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-121::unit-test::(Checksum: 3:8290a6f2f5cbfa9ea199c21bdab0138b)
ALTER TABLE `krns_maint_doc_t` ADD CONSTRAINT `KRNS_MAINT_DOC_TR1` FOREIGN KEY (`DOC_HDR_ID`) REFERENCES `krns_doc_hdr_t` (`DOC_HDR_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-121', '2.1.0-SNP', '3:8290a6f2f5cbfa9ea199c21bdab0138b', 890)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-122::unit-test::(Checksum: 3:4518795ecd5391088d128c72f6133dc3)
ALTER TABLE `krns_nte_t` ADD CONSTRAINT `KRNS_NTE_TR1` FOREIGN KEY (`NTE_TYP_CD`) REFERENCES `krns_nte_typ_t` (`NTE_TYP_CD`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-122', '2.1.0-SNP', '3:4518795ecd5391088d128c72f6133dc3', 891)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-123::unit-test::(Checksum: 3:7dc89f156b0285323612e6e49a132304)
ALTER TABLE `krsb_qrtz_blob_triggers` ADD CONSTRAINT `KRSB_QRTZ_BLOB_TRIGGERS_TR1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `krsb_qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-123', '2.1.0-SNP', '3:7dc89f156b0285323612e6e49a132304', 892)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-124::unit-test::(Checksum: 3:84560d81be32b3631c881d6109add8bc)
ALTER TABLE `krsb_qrtz_cron_triggers` ADD CONSTRAINT `KRSB_QRTZ_CRON_TRIGGERS_TR1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `krsb_qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-124', '2.1.0-SNP', '3:84560d81be32b3631c881d6109add8bc', 893)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-125::unit-test::(Checksum: 3:3468f2844e64d05d19b91378d3a2431b)
ALTER TABLE `krsb_qrtz_job_listeners` ADD CONSTRAINT `KRSB_QUARTZ_JOB_LISTENERS_TR1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `krsb_qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-125', '2.1.0-SNP', '3:3468f2844e64d05d19b91378d3a2431b', 894)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-126::unit-test::(Checksum: 3:10f98bb18e570060229265e76eeac2e2)
ALTER TABLE `krsb_qrtz_simple_triggers` ADD CONSTRAINT `KRSB_QRTZ_SIMPLE_TRIGGERS_TR1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `krsb_qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-126', '2.1.0-SNP', '3:10f98bb18e570060229265e76eeac2e2', 895)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-127::unit-test::(Checksum: 3:466c4538d283af966254e9bf57fa755d)
ALTER TABLE `krsb_qrtz_trigger_listeners` ADD CONSTRAINT `KRSB_QRTZ_TRIGGER_LISTENE_TR1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `krsb_qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-127', '2.1.0-SNP', '3:466c4538d283af966254e9bf57fa755d', 896)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-128::unit-test::(Checksum: 3:c2e844c45610dfc85c023bd8720b6681)
ALTER TABLE `krsb_svc_def_t` ADD CONSTRAINT `KRSB_SVC_DEF_FK1` FOREIGN KEY (`SVC_DSCRPTR_ID`) REFERENCES `krsb_svc_dscrptr_t` (`SVC_DSCRPTR_ID`) ON UPDATE NO ACTION ON DELETE CASCADE
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-128', '2.1.0-SNP', '3:c2e844c45610dfc85c023bd8720b6681', 897)
;

-- Changeset org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml::1313699682649-129::unit-test::(Checksum: 3:012193c435fcf736e5e18ee176a5007d)
ALTER TABLE `trv_acct` ADD CONSTRAINT `TRV_ACCT_FK1` FOREIGN KEY (`ACCT_FO_ID`) REFERENCES `trv_acct_fo` (`ACCT_FO_ID`) ON UPDATE NO ACTION ON DELETE NO ACTION
;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('unit-test', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'org/kuali/rice/db/liquibase/rice-master/2.0.0-m7/mysql/xml/constraints.xml', '1313699682649-129', '2.1.0-SNP', '3:012193c435fcf736e5e18ee176a5007d', 898)
;

-- Release Database Lock
