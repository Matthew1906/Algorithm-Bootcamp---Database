USE DOTO

SELECT * 
FROM Equipments

-- Aggregate Functions
-- Functions that values multiple rows are grouped as an input and returning a single value
-- COUNT, MIN, MAX, SUM, AVG
-- CAN ONLY BE USED IN SELECT, HAVING, AND ORDER BY

SELECT MAX(EquipmentName) AS [MAX OF EQUIPMENT],
MIN(EquipmentName) AS [MIN OF EQUIPMENT]
FROM Equipments

-- Grouping
SELECT EquipmentRarity, COUNT(*) AS [Num of Equipments]
FROM Equipments
GROUP BY EquipmentRarity
ORDER BY EquipmentRarity

SELECT HeroId, SUM(EquipmentPrice) as [TOTAL EQUIPMENT PRICE]
FROM Equipments
Group by HeroId

SELECT HeroId, EquipmentRarity, SUM(EquipmentPrice) as [Total Equipment Price]
FROM Equipments
Group by HeroId, EquipmentRarity
ORDER BY HeroId

-- HAVING = RESTRICTED GROUPING
-- HAVING => FILTER PAKAI SESUATU YANG DI GROUPING

SELECT EquipmentRarity, SUM(EquipmentPrice) as [Total Equipment Price]
from Equipments
Group by EquipmentRarity
Having sum(EquipmentPrice)>100


-- String and Date Functions


