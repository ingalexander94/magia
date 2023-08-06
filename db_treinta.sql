-- 1. Creo tabla usuarios

CREATE TABLE users (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(9) NOT NULL,
    host TINYINT,
    FOREIGN KEY (host) REFERENCES users(id)
);

-- 2. Creo tabla temporal para los nombres de usuarios 

CREATE TEMPORARY TABLE fake (
    id TINYINT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(9)
);

-- 3. Inserto 30 usuarios de mentiras

INSERT INTO fake (fullname)
VALUES
    ('Usuario1'), ('Usuario2'), ('Usuario3'), ('Usuario4'), ('Usuario5'), ('Usuario6'), ('Usuario7'), ('Usuario8'), ('Usuario9'), ('Usuario10'), ('Usuario11'), ('Usuario12'), ('Usuario13'), ('Usuario14'), ('Usuario15'), ('Usuario16'), ('Usuario17'), ('Usuario18'), ('Usuario19'), ('Usuario20'), ('Usuario21'), ('Usuario22'), ('Usuario23'), ('Usuario24'), ('Usuario25'), ('Usuario26'), ('Usuario27'), ('Usuario28'), ('Usuario29'), ('Usuario30');

-- 4. Agrego el candidato

INSERT INTO users (fullname, host)
SELECT fullname, NULL
FROM fake
WHERE id = 1;

-- 5. Agrego 9 lideres

INSERT INTO users (fullname, host)
SELECT fullname, 1
FROM fake
WHERE id BETWEEN 2 AND 10;

-- 6. Agrego el segundo nivel

ALTER TABLE users AUTO_INCREMENT = 11;

INSERT INTO users (fullname, host)
SELECT fullname, FLOOR(RAND()*(10-2+1)+2) 
FROM fake
WHERE id BETWEEN 11 AND 20;

-- 7. Agrego el tercel nivel

ALTER TABLE users AUTO_INCREMENT = 21;

INSERT INTO users (fullname, host)
SELECT fullname, FLOOR(RAND()*(20-11+1)+11) 
FROM fake
WHERE id BETWEEN 21 AND 30;

-- 8. Elimino tabla temporal

DROP TEMPORARY TABLE fake;

-- 9. Consulta para traer red de usuarios

-- WITH RECURSIVE red AS ( 
-- SELECT id, fullname, host 
-- FROM users
-- WHERE id = 1 
-- UNION ALL 
-- SELECT u.id, u.fullname, u.host 
-- FROM users u JOIN red ju ON u.host = ju.id) 
-- SELECT id, fullname, host 
-- FROM red;
