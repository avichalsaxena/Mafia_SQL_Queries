CREATE SCHEMA IF NOT EXISTS `Mafia` DEFAULT CHARACTER SET utf8 ;
USE `Mafia` ;

CREATE TABLE IF NOT EXISTS `Mafia`.`Business` (
  `b_id` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `difficulty` INT NULL,
  PRIMARY KEY (`b_id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Mafia`.`Family` (
  `f_id` VARCHAR(255) NOT NULL,
  `headquarter` VARCHAR(255) NULL,
  `year_founded` INT NULL,
  `owned_by` VARCHAR(255) NULL,
  PRIMARY KEY (`f_id`),
  INDEX `fk_Family_Family_idx` (`owned_by` ASC) VISIBLE,
  CONSTRAINT `fk_Family_Family`
    FOREIGN KEY (`owned_by`)
    REFERENCES `Mafia`.`Family` (`f_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Mafia`.`Members` (
  `m_id` VARCHAR(255) NOT NULL,
  `salary` INT NULL,
  `job` VARCHAR(255) NULL,
  `f_id` VARCHAR(255) NULL,
  PRIMARY KEY (`m_id`),
  INDEX `fk_Members_Family1_idx` (`f_id` ASC) VISIBLE,
  CONSTRAINT `fk_Members_Family1`
    FOREIGN KEY (`f_id`)
    REFERENCES `Mafia`.`Family` (`f_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Mafia`.`Business_Family` (
  `Business_b_id` VARCHAR(255) NOT NULL,
  `Family_f_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Business_b_id`, `Family_f_id`),
  INDEX `fk_Business_has_Family_Family1_idx` (`Family_f_id` ASC) VISIBLE,
  INDEX `fk_Business_has_Family_Business1_idx` (`Business_b_id` ASC) VISIBLE,
  CONSTRAINT `fk_Business_has_Family_Business1`
    FOREIGN KEY (`Business_b_id`)
    REFERENCES `Mafia`.`Business` (`b_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Business_has_Family_Family1`
    FOREIGN KEY (`Family_f_id`)
    REFERENCES `Mafia`.`Family` (`f_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
