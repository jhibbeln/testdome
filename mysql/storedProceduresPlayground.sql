CREATE DATABASE testdome;
-- USE testdome;

CREATE TABLE testdome.pet (name VARCHAR(20), owner VARCHAR(20),
                  species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

INSERT INTO pet
VALUES ('Puffball1','Diane1','hamster1','f','1000-03-30','2000-03-30'),
       ('Puffball2','Diane2','hamster2','m','2000-03-30','3000-03-30'),
       ('Puffball3','Diane3','hamster3','m','3000-03-30','4000-03-30');

SELECT * FROM testdome.pet WHERE testdome.pet.sex = 'm';

-- stored procedures
DELIMITER $$

CREATE PROCEDURE getMalePets()
BEGIN
    SELECT * FROM testdome.pet WHERE testdome.pet.sex = 'm';
END $$

DELIMITER ;

CALL getMalePets();
DROP PROCEDURE IF EXISTS getMalePets;

-- stored procedures with variables
DELIMITER $$

CREATE PROCEDURE getTotalPets()
BEGIN
    DECLARE totalPets CHAR(1) DEFAULT 'm';
    SELECT testdome.pet.sex INTO totalPets FROM testdome.pet LIMIT 1;
    SELECT * FROM testdome.pet where testdome.pet.sex = totalPets;
END $$

DELIMITER ;

CALL getTotalPets;
DROP PROCEDURE IF EXISTS getTotalPets;


-- stored procedures with arguments
DELIMITER $$

CREATE PROCEDURE getPetsBySex(
    IN sex CHAR(1),
    OUT amount INT
)
BEGIN
    SELECT COUNT(*) INTO amount FROM testdome.pet WHERE testdome.pet.sex = sex;
END $$

DELIMITER ;

CALL getPetsBySex('f', @amount);
SELECT @amount;
DROP PROCEDURE IF EXISTS getPetsBySex;