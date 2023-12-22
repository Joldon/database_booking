-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_booking` DEFAULT CHARACTER SET utf8 ;
USE `db_booking` ;

-- -----------------------------------------------------
-- Table `db_booking`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_booking`.`Menu` (
  `item_id` INT NOT NULL,
  `item_name` VARCHAR(255) NULL,
  `item_type` VARCHAR(45) NULL,
  `price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_booking`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_booking`.`Staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  `salary` INT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_booking`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_booking`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL(6,2) NULL,
  `item_id` INT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `item_id_fk_idx` (`item_id` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `item_id_fk`
    FOREIGN KEY (`item_id`)
    REFERENCES `db_booking`.`Menu` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `db_booking`.`Staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_booking`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_booking`.`Customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(100) NULL,
  `contact_details` VARCHAR(255) NULL,
  `order_id` INT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `order_id_fk_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`order_id`)
    REFERENCES `db_booking`.`Orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_booking`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_booking`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `db_booking`.`Customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_booking`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_booking`.`OrderStatus` (
  `status_id` INT NOT NULL,
  `delivery_date` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `order_id` INT NULL,
  PRIMARY KEY (`status_id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `db_booking`.`Orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
