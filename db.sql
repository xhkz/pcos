# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.10)
# Database: pcos
# Generation Time: 2015-02-17 05:40:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;


# Dump of table clinical_review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clinical_review`;

CREATE TABLE `clinical_review` (
  `id`                        BIGINT(20) NOT NULL AUTO_INCREMENT,
  `doa`                       DATETIME            DEFAULT NULL,
  `eh_body`                   VARCHAR(6)          DEFAULT NULL,
  `eh_face`                   VARCHAR(6)          DEFAULT NULL,
  `exm_acanthosis_nigricans`  TINYINT(1)          DEFAULT NULL,
  `exm_acne`                  TINYINT(1)          DEFAULT NULL,
  `exm_androgenetic_alopecia` TINYINT(1)          DEFAULT NULL,
  `exm_hirsutism`             TINYINT(1)          DEFAULT NULL,
  `exm_lipodystrophy`         TINYINT(1)          DEFAULT NULL,
  `rr_oligo`                  TINYINT(1)          DEFAULT NULL,
  `rr_hirsutism`              TINYINT(1)          DEFAULT NULL,
  `rr_acne`                   TINYINT(1)          DEFAULT NULL,
  `rr_hard_conceive`          TINYINT(1)          DEFAULT NULL,
  `rr_weight_gain`            TINYINT(1)          DEFAULT NULL,
  `rr_other`                  VARCHAR(255)        DEFAULT NULL,
  `pt_yasmin`                 TINYINT(1)          DEFAULT NULL,
  `pt_dianette`               TINYINT(1)          DEFAULT NULL,
  `pt_other_ocp`              TINYINT(1)          DEFAULT NULL,
  `pt_metformin`              TINYINT(1)          DEFAULT NULL,
  `pt_medroxy_acetate`        TINYINT(1)          DEFAULT NULL,
  `pt_clomiphene`             TINYINT(1)          DEFAULT NULL,
  `pt_other`                  VARCHAR(255)        DEFAULT NULL,
  `fh_dc_who`                 VARCHAR(255)        DEFAULT NULL,
  `fh_diabetes`               TINYINT(1)          DEFAULT NULL,
  `fh_diabetes_who`           VARCHAR(255)        DEFAULT NULL,
  `fh_difficulties_conceiv`   TINYINT(1)          DEFAULT NULL,
  `fh_hbp`                    TINYINT(1)          DEFAULT NULL,
  `fh_hbp_who`                VARCHAR(255)        DEFAULT NULL,
  `fh_hd_who`                 VARCHAR(255)        DEFAULT NULL,
  `fh_heart_disease`          TINYINT(1)          DEFAULT NULL,
  `fh_hirsutism`              TINYINT(1)          DEFAULT NULL,
  `fh_hirsutism_who`          VARCHAR(255)        DEFAULT NULL,
  `fh_irregular_periods`      TINYINT(1)          DEFAULT NULL,
  `fh_irrper_who`             VARCHAR(255)        DEFAULT NULL,
  `fh_obesity`                TINYINT(1)          DEFAULT NULL,
  `fh_obesity_who`            VARCHAR(255)        DEFAULT NULL,
  `fh_stroke`                 TINYINT(1)          DEFAULT NULL,
  `fh_stroke_who`             VARCHAR(255)        DEFAULT NULL,
  `fh_other`                  VARCHAR(255)        DEFAULT NULL,
  `impression`                VARCHAR(255)        DEFAULT NULL,
  `pbwlb`                     DOUBLE              DEFAULT NULL,
  `pbwp`                      DOUBLE              DEFAULT NULL,
  `birth_weight`              DOUBLE              DEFAULT NULL,
  `patient_id`                BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_clinical_review_patient_1` (`patient_id`),
  CONSTRAINT `fk_clinical_review_patient_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table clinician
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clinician`;

CREATE TABLE `clinician` (
  `id`         BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `user_id`    BIGINT(20)   NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name`  VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_clinician_user_2` (`user_id`),
  CONSTRAINT `fk_clinician_user_2` FOREIGN KEY (`user_id`) REFERENCES `security_user` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table investigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `investigation`;

CREATE TABLE `investigation` (
  `id`                          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `doa`                         DATETIME            DEFAULT NULL,
  `consent_uob`                 TINYINT(1)          DEFAULT NULL,
  `consent_pcos_db`             TINYINT(1)          DEFAULT NULL,
  `urine24h`                    TINYINT(1)          DEFAULT NULL,
  `ultrasound_pelvis_performed` TINYINT(1)          DEFAULT NULL,
  `pco_appearance`              VARCHAR(10)         DEFAULT NULL,
  `right_ovarian`               INT(11)             DEFAULT NULL,
  `left_ovarian`                INT(11)             DEFAULT NULL,
  `max_diameter`                INT(11)             DEFAULT NULL,
  `blood_form_visit`            TINYINT(1)          DEFAULT NULL,
  `dheas`                       DOUBLE              DEFAULT NULL,
  `androstenedione`             DOUBLE              DEFAULT NULL,
  `testosterone`                DOUBLE              DEFAULT NULL,
  `shbg`                        DOUBLE              DEFAULT NULL,
  `ohp`                         DOUBLE              DEFAULT NULL,
  `oestradiol`                  DOUBLE              DEFAULT NULL,
  `lh`                          DOUBLE              DEFAULT NULL,
  `fsh`                         DOUBLE              DEFAULT NULL,
  `prolactin`                   DOUBLE              DEFAULT NULL,
  `tsh`                         DOUBLE              DEFAULT NULL,
  `ast`                         DOUBLE              DEFAULT NULL,
  `alt`                         DOUBLE              DEFAULT NULL,
  `alp`                         DOUBLE              DEFAULT NULL,
  `albumin`                     DOUBLE              DEFAULT NULL,
  `na`                          DOUBLE              DEFAULT NULL,
  `k`                           DOUBLE              DEFAULT NULL,
  `urea`                        DOUBLE              DEFAULT NULL,
  `creatinine`                  DOUBLE              DEFAULT NULL,
  `hba1c`                       DOUBLE              DEFAULT NULL,
  `cholesterol`                 DOUBLE              DEFAULT NULL,
  `hdl_cholesterol`             DOUBLE              DEFAULT NULL,
  `triglycerides`               DOUBLE              DEFAULT NULL,
  `wbc_cou`                     INT(11)             DEFAULT NULL,
  `rbc_cou`                     INT(11)             DEFAULT NULL,
  `haemoglob`                   INT(11)             DEFAULT NULL,
  `haematocr`                   INT(11)             DEFAULT NULL,
  `ser`                         INT(11)             DEFAULT NULL,
  `heparin_plas`                INT(11)             DEFAULT NULL,
  `ed`                          INT(11)             DEFAULT NULL,
  `urine24h_samp`               INT(11)             DEFAULT NULL,
  `volume2`                     INT(11)             DEFAULT NULL,
  `patient_id`                  BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_investigation_patient_8` (`patient_id`),
  CONSTRAINT `fk_investigation_patient_8` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table medical_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medical_history`;

CREATE TABLE `medical_history` (
  `id`                      BIGINT(20) NOT NULL AUTO_INCREMENT,
  `diagnosed_operated_date` DATETIME            DEFAULT NULL,
  `diagnosis_surgery`       VARCHAR(255)        DEFAULT NULL,
  `clinical_review_id`      BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_medical_history_clinicalReview_3` (`clinical_review_id`),
  CONSTRAINT `fk_medical_history_clinicalReview_3` FOREIGN KEY (`clinical_review_id`) REFERENCES `clinical_review` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table medication_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medication_record`;

CREATE TABLE `medication_record` (
  `id`                 BIGINT(20) NOT NULL AUTO_INCREMENT,
  `commenced_date`     DATETIME            DEFAULT NULL,
  `dose`               VARCHAR(255)        DEFAULT NULL,
  `frequency`          VARCHAR(255)        DEFAULT NULL,
  `medication`         VARCHAR(255)        DEFAULT NULL,
  `clinical_review_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_medication_record_clinicalReview_4` (`clinical_review_id`),
  CONSTRAINT `fk_medication_record_clinicalReview_4` FOREIGN KEY (`clinical_review_id`) REFERENCES `clinical_review` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table observation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `observation`;

CREATE TABLE `observation` (
  `id`                   BIGINT(20) NOT NULL AUTO_INCREMENT,
  `doa`                  DATETIME            DEFAULT NULL,
  `p_ba_peripheral_fat`  DOUBLE              DEFAULT NULL,
  `p_ba_peripheral_lean` DOUBLE              DEFAULT NULL,
  `p_ba_tot_body_water`  DOUBLE              DEFAULT NULL,
  `p_ba_tot_fat`         DOUBLE              DEFAULT NULL,
  `p_ba_tot_lean`        DOUBLE              DEFAULT NULL,
  `p_ba_trunk_fat`       DOUBLE              DEFAULT NULL,
  `p_ba_trunk_lean`      DOUBLE              DEFAULT NULL,
  `p_bmi`                DOUBLE              DEFAULT NULL,
  `p_bp1st_db`           INT(11)             DEFAULT NULL,
  `p_bp1st_sb`           INT(11)             DEFAULT NULL,
  `p_bp2nd_db`           INT(11)             DEFAULT NULL,
  `p_bp2nd_sb`           INT(11)             DEFAULT NULL,
  `p_height`             DOUBLE              DEFAULT NULL,
  `p_wght`               DOUBLE              DEFAULT NULL,
  `patient_id`           BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_observation_patient_5` (`patient_id`),
  CONSTRAINT `fk_observation_patient_5` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table patient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `id`            BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `first_name`    VARCHAR(255) NOT NULL,
  `last_name`     VARCHAR(255) NOT NULL,
  `email`         VARCHAR(255) NOT NULL,
  `date_of_birth` DATETIME     NOT NULL,
  `user_id`       BIGINT(20)   NOT NULL,
  `clinician_id`  BIGINT(20)   NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_patient_email` (`email`),
  KEY `ix_patient_user_6` (`user_id`),
  KEY `ix_patient_clinician_7` (`clinician_id`),
  CONSTRAINT `fk_patient_clinician_7` FOREIGN KEY (`clinician_id`) REFERENCES `clinician` (`id`),
  CONSTRAINT `fk_patient_user_6` FOREIGN KEY (`user_id`) REFERENCES `security_user` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table pregnancy_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pregnancy_history`;

CREATE TABLE `pregnancy_history` (
  `id`                     BIGINT(20) NOT NULL AUTO_INCREMENT,
  `birth_weight`           INT(11)             DEFAULT NULL,
  `conceive_time`          INT(11)             DEFAULT NULL,
  `current_partner`        TINYINT(1)          DEFAULT NULL,
  `delivery_mode`          VARCHAR(19)         DEFAULT NULL,
  `fetal_heart_seen`       TINYINT(1)          DEFAULT NULL,
  `gestational_age`        INT(11)             DEFAULT NULL,
  `gestational_diabetes`   TINYINT(1)          DEFAULT NULL,
  `outcome`                VARCHAR(11)         DEFAULT NULL,
  `pre_eclamptic_toxaemia` TINYINT(1)          DEFAULT NULL,
  `pregnancy_induced_htn`  TINYINT(1)          DEFAULT NULL,
  `year`                   INT(11)             DEFAULT NULL,
  `clinical_review_id`     BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pregnancy_history_clinicalReview_9` (`clinical_review_id`),
  CONSTRAINT `fk_pregnancy_history_clinicalReview_9` FOREIGN KEY (`clinical_review_id`) REFERENCES `clinical_review` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table questionnaire
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questionnaire`;

CREATE TABLE `questionnaire` (
  `id`                           BIGINT(20) NOT NULL AUTO_INCREMENT,
  `bh_arms_pos`                  VARCHAR(1)          DEFAULT NULL,
  `bh_breast_pos`                VARCHAR(1)          DEFAULT NULL,
  `bh_chin_pos`                  VARCHAR(1)          DEFAULT NULL,
  `bh_escu_pos`                  VARCHAR(1)          DEFAULT NULL,
  `bh_lowerback_pos`             VARCHAR(1)          DEFAULT NULL,
  `bh_pubic_pos`                 VARCHAR(1)          DEFAULT NULL,
  `bh_unwant`                    TINYINT(1)          DEFAULT NULL,
  `bh_unwant_start_age`          INT(11)             DEFAULT NULL,
  `bh_upperback_pos`             VARCHAR(1)          DEFAULT NULL,
  `bh_upperleg_pos`              VARCHAR(1)          DEFAULT NULL,
  `bh_upperlip_pos`              VARCHAR(1)          DEFAULT NULL,
  `diet_after_diner_snack`       VARCHAR(9)          DEFAULT NULL,
  `diet_breakfast_daily`         TINYINT(1)          DEFAULT NULL,
  `diet_late_dinner`             TINYINT(1)          DEFAULT NULL,
  `diet_three_meals_daily`       TINYINT(1)          DEFAULT NULL,
  `date_submitted`               DATETIME            DEFAULT NULL,
  `exercise_ma_days_pw`          INT(11)             DEFAULT NULL,
  `exercise_ma_mins_pd`          INT(11)             DEFAULT NULL,
  `exercise_sitting_hrs_pd`      INT(11)             DEFAULT NULL,
  `exercise_va_days_pw`          INT(11)             DEFAULT NULL,
  `exercise_va_mins_pd`          INT(11)             DEFAULT NULL,
  `exercise_walking_days_pw`     INT(11)             DEFAULT NULL,
  `exercise_walking_mins_pd`     INT(11)             DEFAULT NULL,
  `mc_absent_date`               DATETIME            DEFAULT NULL,
  `mc_age`                       INT(11)             DEFAULT NULL,
  `mc_irregular_start_age`       INT(11)             DEFAULT NULL,
  `mc_irregular_year_bleeds`     INT(11)             DEFAULT NULL,
  `mc_present_status`            VARCHAR(9)          DEFAULT NULL,
  `mc_regular_days`              INT(11)             DEFAULT NULL,
  `pmh_alcohol`                  TINYINT(1)          DEFAULT NULL,
  `pmh_alcohol_week_taken`       INT(11)             DEFAULT NULL,
  `pmh_bc_diagonsed_age`         INT(11)             DEFAULT NULL,
  `pmh_blood_clot`               TINYINT(1)          DEFAULT NULL,
  `pmh_diabetes`                 TINYINT(1)          DEFAULT NULL,
  `pmh_diabetes_diagonosed_age`  INT(11)             DEFAULT NULL,
  `pmh_earlier_first_pubic_hair` TINYINT(1)          DEFAULT NULL,
  `pmh_hbp_diagonosed_age`       INT(11)             DEFAULT NULL,
  `pmh_hc_diagonosed_age`        INT(11)             DEFAULT NULL,
  `pmh_hd_diagonosed_age`        INT(11)             DEFAULT NULL,
  `pmh_heart_disease`            TINYINT(1)          DEFAULT NULL,
  `pmh_high_blood_pressure`      TINYINT(1)          DEFAULT NULL,
  `pmh_high_cholesterol`         TINYINT(1)          DEFAULT NULL,
  `pmh_smoke_day_taken`          INT(11)             DEFAULT NULL,
  `pmh_smoke_status`             VARCHAR(10)         DEFAULT NULL,
  `pmh_smoke_years`              INT(11)             DEFAULT NULL,
  `pmh_underactive_thyroid`      TINYINT(1)          DEFAULT NULL,
  `pmh_ut_diagnosed_age`         INT(11)             DEFAULT NULL,
  `skin_acne`                    TINYINT(1)          DEFAULT NULL,
  `skin_acne_start_age`          INT(11)             DEFAULT NULL,
  `sleep_snore`                  VARCHAR(7)          DEFAULT NULL,
  `weight_over`                  TINYINT(1)          DEFAULT NULL,
  `weight_overyear`              INT(11)             DEFAULT NULL,
  `ethnicity`                    VARCHAR(34)         DEFAULT NULL,
  `patient_id`                   BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_questionnaire_patient_10` (`patient_id`),
  CONSTRAINT `fk_questionnaire_patient_10` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Dump of table security_session
# ------------------------------------------------------------

# DROP TABLE IF EXISTS `security_session`;
#
# CREATE TABLE `security_session` (
#   `id` bigint(20) NOT NULL AUTO_INCREMENT,
#   `secret` varchar(255) NOT NULL,
#   `user_id` bigint(20) NOT NULL,
#   `last_request_at` datetime NOT NULL,
#   `expired_at` datetime DEFAULT NULL,
#   PRIMARY KEY (`id`),
#   UNIQUE KEY `uq_security_session_1` (`secret`,`expired_at`),
#   KEY `ix_security_session_user_11` (`user_id`),
#   CONSTRAINT `fk_security_session_user_11` FOREIGN KEY (`user_id`) REFERENCES `security_user` (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table security_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `security_user`;

CREATE TABLE `security_user` (
  `id`       BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `email`    VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name`     VARCHAR(255) NOT NULL,
  `role`     VARCHAR(20)           DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_security_user_email` (`email`),
  UNIQUE KEY `uq_security_user_password` (`password`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
