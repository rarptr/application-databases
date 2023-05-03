-- Задание 1

CREATE DATABASE IF NOT EXISTS `Work`;

CREATE TABLE IF NOT EXISTS `Work`.`Department`(
  `id` int PRIMARY KEY AUTO_INCREMENT, 
  `name` varchar(100)
);

CREATE TABLE IF NOT EXISTS `Work`.`Position`(
  `id` int PRIMARY KEY AUTO_INCREMENT, 
  `name` varchar(100), 
  `base_salary` decimal(8, 2)
);

CREATE TABLE IF NOT EXISTS `Work`.`Employee`(
  `id` int PRIMARY KEY AUTO_INCREMENT, 
  `name` varchar(30), 
  `surname` varchar(50), 
  `age` int, 
  `department_id` int,
  `position_id` int,
  FOREIGN KEY (department_id) REFERENCES `Work`.`Department`(id), 
  FOREIGN KEY (position_id) REFERENCES `Work`.`Position`(id)
);


-- Задание 2
-- Вариант 1.
SELECT model AS 'Модель', name AS 'Производитель' 
FROM vendor
JOIN laptop 
	ON vendor.id = laptop.vendor_id
WHERE name = 'Apple' OR name = 'Huawei'
ORDER BY vendor.name;


-- Задание 3
-- Вариант 1.
SELECT model AS 'Модель', name AS 'Производитель' 
FROM vendor
LEFT JOIN laptop 
	ON vendor.id = laptop.vendor_id
ORDER BY vendor.name DESC;


-- Задание 4
SELECT name FROM vendor
WHERE name NOT IN (
  SELECT name	FROM vendor
	JOIN laptop 
	  ON vendor.id = laptop.vendor_id
);


-- Задание 5.
-- Вариант 1.
SELECT name AS 'Производитель', COUNT(laptop.id) AS 'Количество' 
FROM vendor
LEFT JOIN laptop 
	ON vendor.id = laptop.vendor_id
GROUP BY vendor.name;
