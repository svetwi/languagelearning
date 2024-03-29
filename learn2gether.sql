-- MySQL Script generated by MySQL Workbench
-- Sat Jan 14 16:12:37 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`UserInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserInfo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UserInfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `isAdmin` TINYINT NOT NULL,
  `userEmail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ForumPosts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ForumPosts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ForumPosts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(2000) NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ForumPosts_UserInfo_idx` (`userID` ASC),
  CONSTRAINT `fk_ForumPosts_UserInfo`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`UserInfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ForumReplies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ForumReplies` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ForumReplies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(2000) NOT NULL,
  `postID` INT NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ForumReplies_ForumPosts1_idx` (`postID` ASC),
  INDEX `fk_ForumReplies_UserInfo1_idx` (`userID` ASC),
  CONSTRAINT `fk_ForumReplies_ForumPosts1`
    FOREIGN KEY (`postID`)
    REFERENCES `mydb`.`ForumPosts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ForumReplies_UserInfo1`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`UserInfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tests` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tests` (
  `id` INT NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Tests_UserInfo1_idx` (`userID` ASC),
  CONSTRAINT `fk_Tests_UserInfo1`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`UserInfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Submissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Submissions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Submissions` (
  `id` INT NOT NULL,
  `userID` VARCHAR(45) NOT NULL,
  `content` VARCHAR(2000) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Submissions_UserInfo1_idx` (`userID` ASC),
  CONSTRAINT `fk_Submissions_UserInfo1`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`UserInfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Questions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Questions` (
  `id` INT NOT NULL,
  `answer` VARCHAR(20) NOT NULL,
  `testID` INT NOT NULL,
  `content` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Questions_Tests1_idx` (`testID` ASC),
  CONSTRAINT `fk_Questions_Tests1`
    FOREIGN KEY (`testID`)
    REFERENCES `mydb`.`Tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Words`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Words` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Words` (
  `id` INT NOT NULL,
  `bulgarian` VARCHAR(100) NOT NULL,
  `english` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
