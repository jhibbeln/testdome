-- Suggested testing environment:
-- https://www.db-fiddle.com/ with MySQL version set to 8

-- Example case create statement:

USE testdome;
CREATE TABLE question (
                           id INTEGER NOT NULL PRIMARY KEY,
                           name VARCHAR(50) NOT NULL,
                           parentId INTEGER REFERENCES question(id)
);

INSERT INTO question (id, name, parentId) VALUES
(0, 'SQL select', NULL),
(1, 'SQL select v2', 0),
(2, 'C# tuples', NULL),
(3, 'SQL select v3', 1);


DELIMITER //
CREATE PROCEDURE findAllVersions(
    IN questionId INTEGER
)
BEGIN
    WITH RECURSIVE cte (id, parentId) AS (
        SELECT
            q1.id,
            q1.parentId
        FROM question AS q1
        WHERE q1.id = questionId

    UNION

        SELECT
            q2.id,
            q2.parentId
        FROM question AS q2
        INNER JOIN cte
            ON q2.parentId = cte.id

   UNION

        SELECT
            q2.id,
            q2.parentId
        FROM question AS q2
        INNER JOIN cte
            ON q2.id = cte.parentId
    )
    SELECT id FROM cte;
END;
//
DELIMITER ;

-- Example case:
CALL findAllVersions(3);
DROP PROCEDURE IF EXISTS findAllVersions;
-- Expected output (in any order):
-- id
-- ---
-- 0
-- 1
-- 3