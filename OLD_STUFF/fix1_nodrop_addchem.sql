-- MySQL Script generated by MySQL Workbench
-- Thu Mar 29 16:11:46 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ChemDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ChemDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ChemDB` DEFAULT CHARACTER SET armscii8 ;
USE `ChemDB` ;

-- -----------------------------------------------------
-- Table `ChemDB`.`Assay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Assay` (
  `aid` INT NOT NULL,
  `acid` INT NOT NULL,
  `aeid` INT NOT NULL,
  `asid` INT NOT NULL,
  `assay_source_name` VARCHAR(64) NULL DEFAULT NULL,
  `assay_source_long_name` VARCHAR(64) NULL DEFAULT NULL,
  `assay_source_desc` TEXT NULL DEFAULT NULL,
  `assay_name` VARCHAR(64) NULL DEFAULT NULL,
  `assay_desc` VARCHAR(255) NULL DEFAULT NULL,
  `timepoint_hr` INT NULL DEFAULT NULL,
  `organism_id` INT NULL DEFAULT NULL,
  `organism` VARCHAR(64) NULL DEFAULT NULL,
  `tissue` VARCHAR(64) NULL DEFAULT NULL,
  `cell_format` VARCHAR(64) NULL DEFAULT NULL,
  `cell_free_component_source` VARCHAR(255) NULL DEFAULT NULL,
  `cell_short_name` VARCHAR(64) NULL DEFAULT NULL,
  `cell_growth_mode` VARCHAR(64) NULL DEFAULT NULL,
  `assay_footprINT` VARCHAR(64) NULL DEFAULT NULL,
  `assay_format_type` VARCHAR(64) NULL DEFAULT NULL,
  `assay_format_type_sub` VARCHAR(64) NULL DEFAULT NULL,
  `content_readout_type` VARCHAR(64) NULL DEFAULT NULL,
  `dilution_solvent` VARCHAR(64) NULL DEFAULT NULL,
  `dilution_solvent_percent_max` FLOAT NULL DEFAULT NULL,
  `assay_component_name` VARCHAR(64) NULL DEFAULT NULL,
  `assay_component_desc` TEXT NULL DEFAULT NULL,
  `assay_component_target_desc` TEXT NULL DEFAULT NULL,
  `parameter_readout_type` VARCHAR(64) NULL DEFAULT NULL,
  `assay_design_type` VARCHAR(64) NULL DEFAULT NULL,
  `assay_design_type_sub` VARCHAR(64) NULL DEFAULT NULL,
  `biological_process_target` VARCHAR(64) NULL DEFAULT NULL,
  `detection_technology_type` VARCHAR(64) NULL DEFAULT NULL,
  `detection_technology_type_sub` VARCHAR(64) NULL DEFAULT NULL,
  `detection_technology` VARCHAR(64) NULL DEFAULT NULL,
  `signal_direction_type` VARCHAR(64) NULL DEFAULT NULL,
  `key_assay_reagent_type` VARCHAR(64) NULL DEFAULT NULL,
  `key_assay_reagent` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_type` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_type_sub` VARCHAR(64) NULL DEFAULT NULL,
  `assay_component_endpoINT_name` VARCHAR(64) NULL DEFAULT NULL,
  `export_ready` INT NULL DEFAULT NULL,
  `internal_ready` INT NULL DEFAULT NULL,
  `assay_component_endpoINT_desc` TEXT NULL DEFAULT NULL,
  `assay_function_type` VARCHAR(64) NULL DEFAULT NULL,
  `normalized_data_type` VARCHAR(64) NULL DEFAULT NULL,
  `analysis_direction` VARCHAR(64) NULL DEFAULT NULL,
  `burst_assay` INT NULL DEFAULT NULL,
  `key_positive_control` VARCHAR(64) NULL DEFAULT NULL,
  `signal_direction` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_type` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_type_sub` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_family` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_family_sub` VARCHAR(64) NULL DEFAULT NULL,
  `fit_all` INT NULL DEFAULT NULL,
  `reagent_arid` VARCHAR(255) NULL DEFAULT NULL,
  `reagent_reagent_name_value` TEXT NULL DEFAULT NULL,
  `reagent_reagent_name_value_type` TEXT NULL DEFAULT NULL,
  `reagent_culture_or_assay` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`aid`, `acid`, `aeid`, `asid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChemDB`.`Citation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Citation` (
  `citation_id` INT NOT NULL,
  `pmid` INT NOT NULL,
  `doi` VARCHAR(255) NULL DEFAULT NULL,
  `other_source` VARCHAR(64) NULL DEFAULT NULL,
  `other_id` VARCHAR(64) NULL DEFAULT NULL,
  `citation` VARCHAR(255) NULL DEFAULT NULL,
  `title` VARCHAR(64) NULL DEFAULT NULL,
  `author` VARCHAR(255) NULL DEFAULT NULL,
  `url` VARCHAR(64) NULL DEFAULT NULL,
  PRIMARY KEY (`citation_id`, `pmid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChemDB`.`Target`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Target` (
  `target_id` INT NOT NULL,
  `intended_target_gene_id` INT NULL DEFAULT NULL,
  `intended_target_entrez_gene_id` INT NULL DEFAULT NULL,
  `intended_target_official_full_name` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_gene_name` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_official_symbol` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_gene_symbol` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_description` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_uniprot_accession_number` VARCHAR(64) NULL DEFAULT NULL,
  `intended_target_organism_id` INT NULL DEFAULT NULL,
  `intended_target_track_status` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_gene_id` INT NULL DEFAULT NULL,
  `technological_target_entrez_gene_id` INT NULL DEFAULT NULL,
  `technological_target_official_full_name` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_gene_name` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_official_symbol` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_gene_symbol` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_description` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_uniprot_accession_number` VARCHAR(64) NULL DEFAULT NULL,
  `technological_target_organism_id` INT NULL DEFAULT NULL,
  `technological_target_track_status` VARCHAR(64) NULL DEFAULT NULL,
  PRIMARY KEY (`target_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChemDB`.`Published`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Published` (
  `aeid` INT NOT NULL,
  `citation_id` INT NOT NULL,
  `pmid` INT NOT NULL,
  PRIMARY KEY (`aeid`, `citation_id`, `pmid`),
  INDEX `fk_Published_Citation_idx` (`citation_id` ASC),
  INDEX `fk_Published_Citation1_idx` (`pmid` ASC))
ENGINE = MEMORY;


-- -----------------------------------------------------
-- Table `ChemDB`.`Chemicals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Chemicals` (
  `DSSTox_Substance_Id` VARCHAR(64) NOT NULL,
  `DSSTox_Structure_Id` VARCHAR(64) NOT NULL,
  `DSSTox_QC-Level` VARCHAR(64) NULL,
  `Substance_Name` VARCHAR(64) NULL,
  `Substance_CASRN` VARCHAR(64) NULL,
  `Substance_Type` VARCHAR(64) NULL,
  `Substance_Note` VARCHAR(64) NULL,
  `Structure_SMILES` VARCHAR(64) NULL,
  `Structure_InChI` VARCHAR(64) NULL,
  `Structure_InChIKey` VARCHAR(64) NULL,
  `Structure_Formula` VARCHAR(64) NULL,
  `Structure_MolWt` FLOAT NULL,
  PRIMARY KEY (`DSSTox_Substance_Id`, `DSSTox_Structure_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChemDB`.`Tested`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Tested` (
  `aeid` INT NOT NULL,
  `target_id` INT NOT NULL,
  `DSSTox_Substance_Id` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`aeid`, `target_id`, `DSSTox_Substance_Id`),
  INDEX `fk_Tested_Target1_idx` (`target_id` ASC),
  INDEX `fk_Tested_Chemicals1_idx` (`DSSTox_Substance_Id` ASC))
ENGINE = MEMORY;


-- -----------------------------------------------------
-- Table `ChemDB`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NULL DEFAULT NULL,
  `password` VARCHAR(64) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `level` VARCHAR(15) NOT NULL DEFAULT 'user',
  `loggedIn` TINYINT ZEROFILL NOT NULL,
  `creationDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChemDB`.`Toxicity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChemDB`.`Toxicity` (
  `SDDTox_Substance_Id` VARCHAR(64) NOT NULL,
  `aeid` INT NOT NULL,
  PRIMARY KEY (`SDDTox_Substance_Id`, `aeid`),
  INDEX `fk_Tested_Assay2_idx` (`aeid` ASC),
  CONSTRAINT `fk_Tested_Assay2`
    FOREIGN KEY (`aeid`)
    REFERENCES `ChemDB`.`Assay` (`aeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tested_Chemicals2`
    FOREIGN KEY (`SDDTox_Substance_Id`)
    REFERENCES `ChemDB`.`Chemicals` (`DSSTox_Substance_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
