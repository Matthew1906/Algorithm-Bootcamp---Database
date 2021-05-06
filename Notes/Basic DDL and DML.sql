--CREATE DATABASE HelloWorld

use doto -- USE DATABASE

-- SHORTCUT
--F5 = EXECUTE QUERY
--CTRL N = NEW FILE
--CTRL A = SELECT ALL
--ALT ARROW = MOVE CODE
--CTRL K, CTRL C = COMMENT
--CTRL K, CTRL C = UN COMMENT

-- How to restore database
-- 1. Databases->Klik Kanan
-- 2. Restore Database
-- 3. General->Device
-- 4. ...
-- 5. Add-> browse the bak file
-- 6. Ok, Ok

SELECT * from Equipments

SELECT * 
FROM Equipments
WHERE EquipmentRarity= 'Rare' OR EquipmentPrice>100

SELECT * 
FROM Equipments
ORDER BY HeroId, EquipmentName DESC
-- ORDER BY = SORTING (BY DEFAULT - ASCENDING)

-- SELECT->FROM->WHERE->GROUPBY->HAVING->ORDERBY

-- DDL -> DATA DEFINITION LANGUAGE
-- CREATE, DROP, ALTER DATABASE OBJECTS

CREATE DATABASE session2

USE session2

-- primary key -> must be declared
CREATE TABLE Heroes(
	HeroId char(5) PRIMARY KEY,
	HeroName varchar(255) NOT NULL UNIQUE,
	-- Hero Type - range/melee
	HeroType varchar(10)NOT NULL
		CHECK(HeroType = 'melee'
		or HeroType = 'range'),
	-- HERO Attribute -> int, str, agi
	HeroAttribute char(3) NOT NULL 
		CHECK(HeroAttribute like 'int' 
			or HeroAttribute like'str'
			or HeroAttribute like 'agi')
	-- case insensitive so don't worry
)

DROP TABLE Heroes

CREATE TABLE Equipments(
	EquipmentId char(5),
	HeroId char(5),
	EquipmentName varchar(255) UNIQUE NOT NULL,
	EquipmentRarity varchar(20) NOT NULL,
	EquipmentPrice INT NOT NULL,
	CONSTRAINT EquipmentsPK PRIMARY KEY(EquipmentId),
	CONSTRAINT RarityCheck CHECK(EquipmentRarity like 'Rare' or EquipmentRarity like 'Common'),
	CONSTRAINT HeroFK FOREIGN KEY(HeroId) REFERENCES Heroes(HeroId) ON UPDATE CASCADE ON DELETE SET NULL
)	

DROP TABLE Equipments

-- Maintain referential integrity -> child deleted, parents fine, if parents deleted/updated, child also deleted/updated
-- ON UPDATE [CASCADE|SET NULL |SET DEFAULT]
-- ON DELETE [CASCADE|SET NULL |SET DEFAULT]
-- USED ON FOREIGN KEY

-- ALTER TABLE tableName
-- DROP CONSTRAINT/COLUMN NAME
-- ADD|ALTER COLUMNNAME DATATYPE
-- ADD CONSTRAINT NAME

ALTER TABLE EQUIPMENTS
ADD HeroUseRate FLOAT DEFAULT 0

ALTER TABLE EQUIPMENTS
DROP constraint DF__Equipment__HeroU__3C69FB99

ALTER TABLE EQUIPMENTS
DROP column herouserate


-- DML = DATA MANIPULATION LANGUAGE
-- INSERT 

-- can auto increment if integer
INSERT INTO Heroes(HeroId, HeroAttribute, HeroName, HeroType)
VALUES('HE001', 'int', 'wukong', 'melee')

INSERT INTO Heroes(HeroId, HeroAttribute, HeroName, HeroType)
VALUES('HE002', 'agi', 'lancelot', 'range')

INSERT INTO Heroes(HeroId, HeroAttribute, HeroName, HeroType)
VALUES('HE003', 'str', 'joko', 'melee')

delete from Heroes
where HeroType = 'melee'

UPDATE Heroes
set HeroAttribute = 'str'
where HeroType = 'melee'

select * from Heroes

BEGIN TRAN
UPDATE Heroes
SET HeroAttribute ='agi'
ROLLBACK -- UNDO MOVEMENT

-- COMMIT -> NGESAVE TRANSACTION

DROP DATABASE session2 