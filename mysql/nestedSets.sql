use testdome;

CREATE TABLE tree
(
    id   INT(12) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)      NOT NULL,
    lft  INT(12) UNSIGNED NOT NULL,
    rgt  INT(12) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    key lft (lft),
    key rgt (rgt)
);

TRUNCATE TABLE tree;

SELECT * FROM tree;

INSERT INTO tree (name, lft, rgt)
VALUES ('Säugetiere', 1, 2);


UPDATE tree SET rgt=rgt+2 WHERE rgt = 2;
INSERT INTO tree (name,lft,rgt) VALUES ('Primaten',2,3);

SET @rgt = 4;
UPDATE tree SET rgt=rgt+2 WHERE rgt >= @rgt ;
INSERT INTO tree (name,lft,rgt) VALUES ('Nagetiere', @rgt , @rgt +1);

SET @rgt = 6;
UPDATE tree SET rgt=rgt+2 WHERE rgt >= @rgt ;
INSERT INTO tree (name,lft,rgt) VALUES ('Primaraten', @rgt , @rgt +1);

SET @rgt = 3;
UPDATE tree SET rgt=rgt+2 WHERE rgt >= @rgt ;
INSERT INTO tree (name,lft,rgt) VALUES ('Halbaffen', @rgt , @rgt +1);

SET @rgt = 5;
UPDATE tree SET rgt=rgt+2 WHERE rgt >= @rgt ;
INSERT INTO tree (name,lft,rgt) VALUES ('Affen', @rgt , @rgt +1);


SET @rgt = 2;
UPDATE tree SET rgt=rgt+2 WHERE rgt >= @rgt;
UPDATE tree SET lft=lft+2 WHERE lft > @rgt;
INSERT INTO tree (name,lft,rgt) VALUES ('Primaraten', @rgt, @rgt +1);


SELECT * FROM tree WHERE lft > 2 AND rgt < 7;