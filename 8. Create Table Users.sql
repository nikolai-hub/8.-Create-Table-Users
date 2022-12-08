CREATE DATABASE Users

USE Users

CREATE TABLE Users
(
		id BIGINT PRIMARY KEY IDENTITY,
		username VARCHAR(30) NOT NULL,
		[password] VARCHAR(26) NOT NULL,
		profilePicturePath VARCHAR(MAX),
		lastLoginTime DATETIME,
		isDeleted BIT NOT NULL
)

INSERT INTO Users (username, [password], profilePicturePath, lastLoginTime , isDeleted) VALUES
('nik_123',  '123456789' , NULL, '12/15/2022', 0),
('sadasf', 'dagfsgfd', 'https://softuni.bg/' ,  '01/12/2022' , 1),
('git_hub', 'coding', 'https://github.com/', '08/12/2022', 0),
('asdff', 'asdff' , NULL, '01/01/2015', 1),
('angel', 'MORE THEN 5' , NULL, '01/28/2016', 1)

ALTER TABLE Users DROP CONSTRAINT  [PK__Users__3213E83F64D35D94]

ALTER TABLE Users ADD CONSTRAINT PKidUsername PRIMARY KEY (id , username)

DELETE Users

ALTER TABLE Users ADD CONSTRAINT CH_checkPassMoreThen5Symbols CHECK(LEN([password]) > 5)

INSERT INTO Users (username, [password], profilePicturePath, lastLoginTime , isDeleted) VALUES
('nik_123',  'MORE THEN 5' , NULL, '12/15/2022', 0),
('sadasf', 'MORE THEN 5', 'https://softuni.bg/' ,  '01/12/2022' , 1),
('git_hub', 'MORE THEN 5', 'https://github.com/', '08/12/2022', 0),
('asdff', 'MORE THEN 5' , NULL, '01/01/2015', 1),
('angel', 'MORE THEN 5' , NULL, '01/28/2016', 1)

ALTER TABLE Users ADD CONSTRAINT DF_lastLoginTime DEFAULT GETDATE() FOR lastLoginTime

ALTER TABLE Users DROP CONSTRAINT PKidUsername 

ALTER TABLE Users ADD CONSTRAINT PKid PRIMARY KEY (id)

ALTER TABLE Users ADD CONSTRAINT CH_usernameMoreThen2Symbols CHECK(LEN(username) >2)

DELETE Users

DROP TABLE Users

USE master

DROP DATABASE Users