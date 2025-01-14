-- MySQL Script generated by MySQL Workbench
-- Tue Feb 20 21:17:53 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ar3dex-db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ar3dex-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ar3dex-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ar3dex-db` ;

-- -----------------------------------------------------
-- Table `ar3dex-db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(123) NOT NULL,
  `price` INT NULL DEFAULT NULL,
  `description` TEXT NULL,
  `discount` INT NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL,
  `id_category` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `category_FK_1_idx` (`id_category` ASC) VISIBLE,
  CONSTRAINT `category_FK_1`
    FOREIGN KEY (`id_category`)
    REFERENCES `ar3dex-db`.`categories` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NOT NULL,
  `province` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(9) NULL DEFAULT NULL,
  `surname` VARCHAR(12) NULL DEFAULT NULL,
  `id_address` INT NOT NULL,
  `phone` VARCHAR(19) NULL DEFAULT NULL,
  `email` VARCHAR(29) NULL DEFAULT NULL,
  `id_rol` INT NOT NULL,
  `password` VARCHAR(255) NULL,
  `image` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `user:rok_fk` (`id_rol` ASC) VISIBLE,
  INDEX `user_address_fk_idx` (`id_address` ASC) VISIBLE,
  CONSTRAINT `user:rok_fk`
    FOREIGN KEY (`id_rol`)
    REFERENCES `ar3dex-db`.`roles` (`id`),
  CONSTRAINT `user_address_fk`
    FOREIGN KEY (`id_address`)
    REFERENCES `ar3dex-db`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`methods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`tickets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `date_ticket` DATE NULL DEFAULT NULL,
  `total` INT NULL DEFAULT NULL,
  `id_method` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `facturas_FK` (`id_user` ASC) VISIBLE,
  INDEX `facturas_method_fk_idx` (`id_method` ASC) VISIBLE,
  CONSTRAINT `facturas_FK`
    FOREIGN KEY (`id_user`)
    REFERENCES `ar3dex-db`.`users` (`id`),
  CONSTRAINT `facturas_method_fk`
    FOREIGN KEY (`id_method`)
    REFERENCES `ar3dex-db`.`methods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ticket` INT NOT NULL,
  `id_product` INT NOT NULL,
  `price` DECIMAL(3,2) NULL DEFAULT NULL,
  `quantity` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `items_de_facturas_FK` (`id_ticket` ASC) VISIBLE,
  INDEX `items_de_facturas_FK_1` (`id_product` ASC) VISIBLE,
  CONSTRAINT `items_de_facturas_FK`
    FOREIGN KEY (`id_ticket`)
    REFERENCES `ar3dex-db`.`tickets` (`id`),
  CONSTRAINT `items_de_facturas_FK_1`
    FOREIGN KEY (`id_product`)
    REFERENCES `ar3dex-db`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ar3dex-db`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar3dex-db`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `product_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_image_product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_image_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `ar3dex-db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
