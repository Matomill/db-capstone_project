-- MySQL Script generated by MySQL Workbench
-- Sun 30 Apr 2023 03:14:07 PM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DaliveryStatus` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `Courses` VARCHAR(45) NOT NULL,
  `Starters` VARCHAR(45) NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  `Drinks` VARCHAR(45) NOT NULL,
  `Desserts` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `EmployeeID` INT NOT NULL,
  `EmployeeName` VARCHAR(95) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  `EmployeeAddress` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `DaliveryID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_booking_ID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_customer_ID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_delivery_ID_idx` (`DaliveryID` ASC) VISIBLE,
  INDEX `fk_menu_id_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Staff_id_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_booking_ID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_ID`
    FOREIGN KEY (`DaliveryID`)
    REFERENCES `LittleLemonDB`.`OrderDeliveryStatus` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_id`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Staff_id`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDB`.`Staff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
