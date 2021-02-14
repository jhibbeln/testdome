-- Suggested testing environment:
-- https://www.db-fiddle.com/ with MySQL version set to 8

-- Example case create statement:
CREATE TABLE userTypes (
                           id INTEGER NOT NULL PRIMARY KEY,
                           type VARCHAR(50) NOT NULL
);

CREATE TABLE users (
                       id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
                       email VARCHAR(50) NOT NULL,
                       userTypeId INTEGER NOT NULL,
                       FOREIGN KEY (userTypeId) REFERENCES userTypes(id)
);

INSERT INTO userTypes (id, type) VALUES (0, 'free');
INSERT INTO userTypes (id, type) VALUES (1, 'paid');

DELIMITER //
CREATE PROCEDURE insertUser(
    IN type VARCHAR(50),
    IN email VARCHAR(50)
)
BEGIN
    DECLARE typeId INTEGER;
    SELECT userTypes.id INTO typeId FROM userTypes WHERE userTypes.type = type;

    INSERT INTO users (email, userTypeId) VALUES (email, typeId);
END//
DELIMITER ;

-- Example case:
CALL insertUser('free', 'john.doe@company.com');
CALL insertUser('paid', 'jane.doe@company.com');
SELECT * FROM users;

-- Expected output (in any order):
-- id    email                   userTypeId
-- ------------------------------------------
-- 1     john.doe@company.com    0
-- 2     jane.doe@company.com    1