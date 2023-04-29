-- DROP TABLE `Storage`.`Laptop`;

-- Задание 1
CREATE TABLE `Storage`.`Laptop`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `model` VARCHAR(50),
    `vendor` VARCHAR(20),
    `price` DECIMAL(8, 2),
    `amount` INT
);

INSERT INTO `Storage`.`Laptop` (`model`, `vendor`, `price`, `amount`)
VALUES ('Macbook Pro 16', 'Apple', 199990.00, 3),
       ('XPS 13', 'Dell', 69999.00, 10),
       ('XPS 17 Pro', 'Dell', 231695.00, 2),
       ('Mi Notebook Pro 14', 'Xiaomi', 79990.00, 7),
       ('Macbook Air 13', 'Apple', 89990.00, 12),
       ('Mi Notebook Air 13', 'Xiaomi', 59990.00, 25),
       ('Swift 1', 'Acer', 33291.00, 14);


-- Задание 2
-- Вариант 1
SELECT model, vendor, amount FROM `Storage`.`Laptop` 
ORDER BY amount DESC;

-- Вариант 2
SELECT model, price, vendor FROM `Storage`.`Laptop` 
ORDER BY price ASC;


-- Задание 3
-- Вариант 1
SELECT model AS "Название модели", 
       vendor AS "Производитель", 
       amount AS "Остаток на складе" 
FROM `Storage`.`Laptop` 
ORDER BY model ASC;

-- Вариант 2
SELECT model AS "Название модели",
       price AS "Цена",
       vendor AS "Производитель"
FROM `Storage`.`Laptop`
ORDER BY vendor DESC;


-- Задание 4
-- Вариант 1
SELECT model,
       vendor,
       price AS "Цена до скидки",
       ROUND(price * 0.8, 2) AS "Цена после скидки"
FROM `Storage`.`Laptop`;

-- Вариант 2
SELECT model,
       vendor,
       price,
       ROUND(price * 0.2, 2) AS "Скидка 20%"
FROM `Storage`.`Laptop`;


-- Задание 5
-- Вариант 1
SELECT model,
       vendor,
       price AS "Цена до скидки",
       CASE
           WHEN amount <= 5 THEN ROUND(price * 0.9, 2)
           ELSE ROUND(price * 0.8, 2)
       END AS "Цена после уникальной скидки"
FROM `Storage`.`Laptop`;

-- Вариант 2
SELECT model,
       vendor,
       price,
       CASE
           WHEN amount <= 5 THEN ROUND(price * 0.1, 2)
           ELSE ROUND(price * 0.2, 2)
       END AS "Уникальная скидка"
FROM `Storage`.`Laptop`;


-- Задание 6
-- Вариант 1
SELECT model,
       vendor,
       ROUND(amount * price, 2) AS "Общая сумма"
FROM `Storage`.`Laptop`
WHERE (amount * price) >= 500000
ORDER BY `Общая сумма` DESC;

-- Вариант 2
SELECT model,
       vendor,
       ROUND(amount * price, 2) AS "Общая сумма"
FROM `Storage`.`Laptop`
WHERE (amount * price) < 500000
ORDER BY `Общая сумма` ASC;


-- Задание 7
-- Вариант 1
SELECT model,
       vendor,
       ROUND((amount * price), 2) AS "Общая сумма"
FROM `Storage`.`Laptop`
WHERE model LIKE '%Pro%'
  OR model LIKE '%Air%'
ORDER BY model DESC;

-- Вариант 2
SELECT model,
       vendor,
       ROUND((amount * price), 2) AS "Общая сумма"
FROM `Storage`.`Laptop`
WHERE model LIKE '%13%'
ORDER BY `Общая сумма` ASC;


-- Задание 8
-- Вариант 1
SELECT model, vendor, price FROM `Storage`.`Laptop`
WHERE price BETWEEN 50000 AND 70000
ORDER BY vendor ASC;

-- Вариант 2
SELECT model, vendor, price FROM `Storage`.`Laptop`
WHERE vendor IN ('Acer', 'Xiaomi')
ORDER BY model ASC;


-- Задание 9
-- Вариант 1
SELECT DISTINCT vendor FROM `Storage`.`Laptop`;

-- Вариант 2
SELECT model FROM `Storage`.`Laptop`
WHERE vendor = 'Apple';


-- Задание 10
-- Вариант 1
UPDATE `Storage`.`Laptop` 
SET price = price + 15000
WHERE vendor = 'Apple';

SELECT * FROM `Storage`.`Laptop`
ORDER BY price DESC;

-- Вариант 2
UPDATE `Storage`.`Laptop`
SET price = price - 5000
WHERE vendor = 'Xiaomi';

SELECT * FROM `Storage`.`Laptop`
ORDER BY model ASC;
