--1--
CREATE TABLE information(
info_id SERIAL PRIMARY KEY,
title VARCHAR(500) NOT NULL,
person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information;

--2.RENAME TABLE --
ALTER TABLE information
RENAME TO new_info;

SELECT * FROM new_info;


--3.RENAME COLUMN --

ALTER TABLE new_info
RENAME COLUMN person TO people;

SELECT * FROM new_info;


-- 4. CHANGE CONSTRAINT TYPE --
--INSERT VALUE WHEN NOT NULL IS SET for people THROWS ERROR--

INSERT INTO new_info(title)
VALUES
('Colasce');


--DROP THE CONSTRAINT TYPE --

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

-- NO ERROR --
INSERT INTO new_info(title)
VALUES
('Colasce');

SELECT * FROM new_info;