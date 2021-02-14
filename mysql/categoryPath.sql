USE testdome;

CREATE TABLE category
(
    id       INTEGER     NOT NULL PRIMARY KEY,
    name     VARCHAR(50) NOT NULL,
    parentId INTEGER REFERENCES category (id)
);


INSERT INTO category (id, name, parentId)
VALUES (0, 'Kinderwagen', NULL),
       (1, 'Kindersitze', NULL),
       (2, 'Pflege', NULL),
       (4, 'Ernährung', NULL),
       (5, 'Spielzeug', NULL),
       (6, 'Mode', NULL),
       (7, 'Sale', NULL),
       (8, 'Babytrage', 0),
       (9, 'Buggy', 0),
       (10, 'Kinderwagen', 0),
       (11, 'Babytragen klein', 8),
       (12, 'Babytragen groß', 8),
       (13, 'Babyschale', 1),
       (14, 'Basisstation', 1),
       (15, 'Kinderfahrradsitze', 1);




WITH RECURSIVE cte AS
(
  SELECT id, name, CAST(id AS CHAR(200)) AS path
  FROM category WHERE parentId IS NULL
  UNION ALL
  SELECT c.id, c.name, CONCAT(cte.path, ",", c.id)
  FROM category c JOIN cte ON cte.id=c.parentId
)
SELECT * FROM cte ORDER BY id;