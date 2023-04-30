-- Задание 1 
SELECT MIN(price) FROM `Storage`.`Laptop`
WHERE price =
    (SELECT MIN(price) FROM `Storage`.`Laptop`);


-- Задание 2 
-- Вариант 1
SELECT model, vendor, price
FROM `Storage`.`Laptop`
WHERE ABS(
    amount - (SELECT AVG(amount) FROM `Storage`.`Laptop`)
) <= 3
ORDER BY price ASC;

-- Вариант 2
SELECT model, vendor, price FROM `Storage`.`Laptop`
WHERE ABS(
    price - (SELECT AVG(price) FROM `Storage`.`Laptop`)
) > 30000
Order BY model DESC;


-- Задание 3 
-- Вариант 1
SELECT model, vendor, price FROM `Storage`.`Laptop`
WHERE vendor IN
    (SELECT vendor FROM `Storage`.`Laptop`
     GROUP BY vendor
     HAVING SUM(amount) >= 15)
Order BY vendor DESC;

-- Вариант 2
SELECT model, vendor, price FROM `Storage`.`Laptop`
WHERE vendor IN
    (SELECT vendor FROM `Storage`.`Laptop`
     GROUP BY vendor
     HAVING SUM(amount) < 10)
ORDER BY price ASC;


-- Задание 4 
-- Вариант 1
CREATE TABLE `Storage`.`Order` LIKE `Storage`.`Laptop`;

INSERT INTO `Storage`.`Order` 
SELECT * FROM `Storage`.`Laptop` 
WHERE vendor IN ('Dell', 'Xiaomi');

SELECT * FROM `Storage`.`Order` 
ORDER BY price ASC;

-- Вариант 2
CREATE TABLE `Storage`.`Order` LIKE `Storage`.`Laptop`;

INSERT INTO `Storage`.`Order` 
SELECT * FROM `Storage`.`Laptop` 
WHERE price <= 100000;

SELECT * FROM `Storage`.`Order` 
ORDER BY vendor DESC;


-- Задание 5 
SELECT model, vendor, price FROM `Storage`.`Laptop`
WHERE model NOT IN 
    (SELECT model FROM `Storage`.`Order`);
