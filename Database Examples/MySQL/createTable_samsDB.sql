-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- ----------------------------------------------------_
-- Schema mydb
-- ----------------------------------------------------_
-- ----------------------------------------------------_
-- Schema samsdb
-- ----------------------------------------------------_

-- ----------------------------------------------------_
-- Schema samsdb
-- ----------------------------------------------------_
CREATE SCHEMA IF NOT EXISTS `samsdb` ;
USE `samsdb` ;

-- ----------------------------------------------------_
-- Table `samsdb`.`Country`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Country` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Country` (
  `countryID` VARCHAR(10) NOT NULL,
  `countryName` VARCHAR(45) NULL,
  PRIMARY KEY (`countryID`),
  UNIQUE INDEX `countryName_UNIQUE` (`countryName` ASC) VISIBLE)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Airline`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Airline` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Airline` (
  `airlineID` VARCHAR(2) NOT NULL,
  `countryID` VARCHAR(10) NOT NULL,
  `airlineName` VARCHAR(25) NULL,
  `street` VARCHAR(25) NULL,
  `suburb` VARCHAR(25) NULL,
  `postcode` VARCHAR(10) NULL,
  `state` VARCHAR(25) NULL,
  `country` VARCHAR(25) NULL,
  `contactPhone` VARCHAR(25) NOT NULL,
  `websiteAddress` VARCHAR(60) NULL,
  PRIMARY KEY (`airlineID`),
  INDEX `fk_Airline_Country1_idx` (`countryID` ASC) VISIBLE,
  UNIQUE INDEX `contactPhone_UNIQUE` (`contactPhone` ASC) VISIBLE,
  CONSTRAINT `fk_Airline_Country1`
    FOREIGN KEY (`countryID`)
    REFERENCES `samsdb`.`Country` (`countryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`AircraftManufacturer`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`AircraftManufacturer` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`AircraftManufacturer` (
  `manufacturerID` INT NOT NULL AUTO_INCREMENT, /* Collation Error?*/
  `manufacturerName` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`manufacturerID`))
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`EngineModel`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`EngineModel` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`EngineModel` (
  `engineModelName` VARCHAR(30) NOT NULL,
  `engineManufacturer` VARCHAR(25) NULL,
  `thrustRange_km` INT UNSIGNED NOT NULL,
  `dryWeight_kg` DECIMAL(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`engineModelName`))
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`AircraftModel`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`AircraftModel` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`AircraftModel` (
  `modelID` VARCHAR(4) NOT NULL,
  `manufacturerID` INT NOT NULL, /* Collation Error */
  PRIMARY KEY (`modelID`),
  INDEX `fk_Aircraft Model_Aircraft Manufacturer1_idx` (`manufacturerID` ASC) VISIBLE,
  CONSTRAINT `fk_Aircraft Model_Aircraft Manufacturer1` /* ERROR HERE?*/
    FOREIGN KEY (`manufacturerID`)
    REFERENCES `samsdb`.`AircraftManufacturer` (`manufacturerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`AircraftSub_Model`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`AircraftSub_Model` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`AircraftSub_Model` (
  `submodelID` VARCHAR(10) NOT NULL,
  `engineModelName` VARCHAR(30) NOT NULL,
  `modelID` VARCHAR(4) NOT NULL,
  `length_m` DECIMAL(6,2) UNSIGNED NOT NULL,
  `height` DECIMAL(6,2) UNSIGNED NOT NULL,
  `wingspanArea_m2` DECIMAL(8,2) UNSIGNED NOT NULL,
  `maxPayloadWeight_kg` DECIMAL(8,2) UNSIGNED NOT NULL,
  `maxCruisingSpeed_kp/h` INT UNSIGNED NOT NULL,
  `maximumRange_km` DECIMAL(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`submodelID`),
  INDEX `fk_Aircraft Sub_Model_Model1_idx` (`engineModelName` ASC) VISIBLE,
  INDEX `fk_Aircraft Sub_Model_Aircraft Model1_idx` (`modelID` ASC) VISIBLE,
  CONSTRAINT `fk_Aircraft Sub_Model_Model1`
    FOREIGN KEY (`engineModelName`)
    REFERENCES `samsdb`.`EngineModel` (`engineModelName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft Sub_Model_Aircraft Model1`
    FOREIGN KEY (`modelID`)
    REFERENCES `samsdb`.`AircraftModel` (`modelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Aircraft`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Aircraft` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Aircraft` (
  `aircraftID` VARCHAR(6) NOT NULL,
  `submodelID` VARCHAR(10) NOT NULL,
  `aviationRegistrationNo` VARCHAR(6) NOT NULL,
  `aircraftName` VARCHAR(25) NULL,
  PRIMARY KEY (`aircraftID`),
  INDEX `fk_Aircraft_Aircraft Sub_Model1_idx` (`submodelID` ASC) VISIBLE,
  UNIQUE INDEX `aviationRegistrationNo_UNIQUE` (`aviationRegistrationNo` ASC) VISIBLE,
  CONSTRAINT `fk_Aircraft_Aircraft Sub_Model1`
    FOREIGN KEY (`submodelID`)
    REFERENCES `samsdb`.`AircraftSub_Model` (`submodelID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Engine`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Engine` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Engine` (
  `engineIdentificationNumber` VARCHAR(30) NOT NULL,
  `Aircraft_aircraftID` VARCHAR(6) NOT NULL,
  `engineModelName` VARCHAR(30) NOT NULL,
  `manufacturingDate` DATE NULL,
  PRIMARY KEY (`engineIdentificationNumber`),
  INDEX `fk_Engine_Aircraft1_idx` (`Aircraft_aircraftID` ASC) VISIBLE,
  INDEX `fk_Engine_EngineModel1_idx` (`engineModelName` ASC) VISIBLE,
  CONSTRAINT `fk_Engine_Aircraft1`
    FOREIGN KEY (`Aircraft_aircraftID`)
    REFERENCES `samsdb`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engine_EngineModel1`
    FOREIGN KEY (`engineModelName`)
    REFERENCES `samsdb`.`EngineModel` (`engineModelName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`PassengerCategory`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`PassengerCategory` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`PassengerCategory` (
  `passengerCatergoryID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `submodelID` VARCHAR(10) NOT NULL,
  `maximumNumberOfPassengers` INT UNSIGNED NOT NULL,
  `maxNoPassengers1stClass` INT UNSIGNED NOT NULL,
  `maxNoPassengersEconomy` INT UNSIGNED NOT NULL,
  INDEX `fk_Passenger Category_Aircraft Sub_Model1_idx` (`submodelID` ASC) VISIBLE,
  PRIMARY KEY (`passengerCatergoryID`),
  CONSTRAINT `fk_Passenger Category_Aircraft Sub_Model1`
    FOREIGN KEY (`submodelID`)
    REFERENCES `samsdb`.`AircraftSub_Model` (`submodelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`CargoCategory`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`CargoCategory` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`CargoCategory` (
  `cargoCatergoryID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `submodelID` VARCHAR(10) NOT NULL,
  `maximumCargoWeight_kg` DECIMAL(8,2) UNSIGNED NOT NULL,
  `mainDeckCapacity_m3` DECIMAL(8,2) UNSIGNED NOT NULL,
  `lowerDeckCapacity_m3` DECIMAL(8,2) UNSIGNED NOT NULL,
  INDEX `fk_CargoCategory_AircraftSub_Model1_idx` (`submodelID` ASC) VISIBLE,
  PRIMARY KEY (`cargoCatergoryID`),
  CONSTRAINT `fk_CargoCategory_AircraftSub_Model1`
    FOREIGN KEY (`submodelID`)
    REFERENCES `samsdb`.`AircraftSub_Model` (`submodelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Technician`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Technician` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Technician` (
  `employeeID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `supervisorID` INT UNSIGNED NULL,
  `firstName` VARCHAR(25) NOT NULL,
  `lastName` VARCHAR(25) NOT NULL,
  `streetAddress` VARCHAR(25) NULL,
  `suburb` VARCHAR(25) NULL,
  `postcode` VARCHAR(10) NULL,
  `phone` VARCHAR(25) NOT NULL,
  `salary` DECIMAL(8,2) UNSIGNED NOT NULL,
  `loginName` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `loginName_UNIQUE` (`loginName` ASC) VISIBLE,
  INDEX `fk_Technician_Technician1_idx` (`supervisorID` ASC) VISIBLE,
  CONSTRAINT `fk_Technician_Technician1`
    FOREIGN KEY (`supervisorID`)
    REFERENCES `samsdb`.`Technician` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Manager`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Manager` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Manager` (
  `managerID` INT UNSIGNED NOT NULL,
  `ManagementCommencementDate` DATE NOT NULL,
  INDEX `fk_Manager_Technician1_idx` (`managerID` ASC) VISIBLE,
  PRIMARY KEY (`managerID`),
  CONSTRAINT `fk_Manager_Technician1`
    FOREIGN KEY (`managerID`)
    REFERENCES `samsdb`.`Technician` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Training`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Training` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Training` (
  `trainingID` INT UNSIGNED NOT NULL,
  `trainingName` VARCHAR(45) NULL,
  `trainingDate` DATE NULL,
  PRIMARY KEY (`trainingID`))
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`TestEvent`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`TestEvent` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`TestEvent` (
  `testEventID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Aircraft_aircraftID` VARCHAR(6) NOT NULL,
  `startTestDateTime` DATETIME NULL,
  `endTestDateTime` DATETIME NULL,
  `noOfHours` DECIMAL(6,2) NULL,
  `testResult` ENUM('Pass', 'Fail') NULL,
  `resultComments` VARCHAR(150) NULL,
  PRIMARY KEY (`testEventID`),
  INDEX `fk_Test Event_Aircraft1_idx` (`Aircraft_aircraftID` ASC) VISIBLE,
  CONSTRAINT `fk_Test Event_Aircraft1`
    FOREIGN KEY (`Aircraft_aircraftID`)
    REFERENCES `samsdb`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Test`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Test` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Test` (
  `testID` INT NOT NULL,
  `testName` VARCHAR(45) NULL,
  PRIMARY KEY (`testID`))
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`TestItem`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`TestItem` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`TestItem` (
  `itemCode` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ItemName` VARCHAR(60) NOT NULL,
  `testResult` ENUM('Pass', 'Fail') NULL,
  `testID` INT NOT NULL,
  PRIMARY KEY (`itemCode`, `testID`),
  INDEX `fk_TestItem_Test1_idx` (`testID` ASC) VISIBLE,
  CONSTRAINT `fk_TestItem_Test1`
    FOREIGN KEY (`testID`)
    REFERENCES `samsdb`.`Test` (`testID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`TestItemTestEvent`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`TestItemTestEvent` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`TestItemTestEvent` (
  `testEventID` INT UNSIGNED NOT NULL,
  `itemCode` INT UNSIGNED NOT NULL,
  `testID` INT NOT NULL,
  PRIMARY KEY (`testEventID`, `itemCode`, `testID`),
  INDEX `fk_TestItemTestEvent_TestEvent1_idx` (`testEventID` ASC) VISIBLE,
  INDEX `fk_TestItemTestEvent_TestItem1_idx` (`itemCode` ASC, `testID` ASC) VISIBLE,
  CONSTRAINT `fk_TestItemTestEvent_TestEvent1`
    FOREIGN KEY (`testEventID`)
    REFERENCES `samsdb`.`TestEvent` (`testEventID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_TestItemTestEvent_TestItem1`
    FOREIGN KEY (`itemCode` , `testID`)
    REFERENCES `samsdb`.`TestItem` (`itemCode` , `testID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`QualifiedTechnician`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`QualifiedTechnician` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`QualifiedTechnician` (
  `Technician_employeeID` INT UNSIGNED NOT NULL,
  `trainingID` INT UNSIGNED NOT NULL,
  `completionStatus` ENUM('Complete', 'Not Complete') NOT NULL,
  PRIMARY KEY (`Technician_employeeID`, `trainingID`),
  INDEX `fk_Technician_has_Aircraft Model_Technician1_idx` (`Technician_employeeID` ASC) VISIBLE,
  INDEX `fk_QualifiedTechnician_Training1_idx` (`trainingID` ASC) VISIBLE,
  CONSTRAINT `fk_Technician_has_Aircraft Model_Technician1`
    FOREIGN KEY (`Technician_employeeID`)
    REFERENCES `samsdb`.`Technician` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QualifiedTechnician_Training1`
    FOREIGN KEY (`trainingID`)
    REFERENCES `samsdb`.`Training` (`trainingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`TechnicianTestItemTestEvent`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`TechnicianTestItemTestEvent` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`TechnicianTestItemTestEvent` (
  `employeeID` INT UNSIGNED NOT NULL,
  `testEventID` INT UNSIGNED NOT NULL,
  `itemCode` INT UNSIGNED NOT NULL,
  `testID` INT NOT NULL,
  PRIMARY KEY (`employeeID`, `testEventID`, `itemCode`, `testID`),
  INDEX `fk_TechnicianTestItemTestEvent_Technician1_idx` (`employeeID` ASC) VISIBLE,
  INDEX `fk_TechnicianTestItemTestEvent_TestItemTestEvent1_idx` (`testEventID` ASC, `itemCode` ASC, `testID` ASC) VISIBLE,
  CONSTRAINT `fk_TechnicianTestItemTestEvent_Technician1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `samsdb`.`Technician` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TechnicianTestItemTestEvent_TestItemTestEvent1`
    FOREIGN KEY (`testEventID` , `itemCode` , `testID`)
    REFERENCES `samsdb`.`TestItemTestEvent` (`testEventID` , `itemCode` , `testID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`AircraftModel_QualifiedTechnician`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`AircraftModel_QualifiedTechnician` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`AircraftModel_QualifiedTechnician` (
  `modelID` VARCHAR(4) NOT NULL,
  `Technician_employeeID` INT UNSIGNED NOT NULL,
  `trainingID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`modelID`, `Technician_employeeID`, `trainingID`),
  INDEX `fk_AircraftModel_QualifiedTechnician_AircraftModel1_idx` (`modelID` ASC) VISIBLE,
  INDEX `fk_AircraftModel_QualifiedTechnician_QualifiedTechnician1_idx` (`Technician_employeeID` ASC, `trainingID` ASC) VISIBLE,
  CONSTRAINT `fk_AircraftModel_QualifiedTechnician_AircraftModel1`
    FOREIGN KEY (`modelID`)
    REFERENCES `samsdb`.`AircraftModel` (`modelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AircraftModel_QualifiedTechnician_QualifiedTechnician1`
    FOREIGN KEY (`Technician_employeeID` , `trainingID`)
    REFERENCES `samsdb`.`QualifiedTechnician` (`Technician_employeeID` , `trainingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ----------------------------------------------------_
-- Table `samsdb`.`Airline_Aircraft`
-- ----------------------------------------------------_
DROP TABLE IF EXISTS `samsdb`.`Airline_Aircraft` ;

CREATE TABLE IF NOT EXISTS `samsdb`.`Airline_Aircraft` (
  `airlineID` VARCHAR(2) NOT NULL,
  `aircraftID` VARCHAR(6) NOT NULL,
  `dateOwned` DATE NOT NULL,
  PRIMARY KEY (`airlineID`, `aircraftID`),
  INDEX `fk_Airline_Aircraft_Airline1_idx` (`airlineID` ASC) VISIBLE,
  INDEX `fk_Airline_Aircraft_Aircraft1_idx` (`aircraftID` ASC) VISIBLE,
  CONSTRAINT `fk_Airline_Aircraft_Airline1`
    FOREIGN KEY (`airlineID`)
    REFERENCES `samsdb`.`Airline` (`airlineID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airline_Aircraft_Aircraft1`
    FOREIGN KEY (`aircraftID`)
    REFERENCES `samsdb`.`Aircraft` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
