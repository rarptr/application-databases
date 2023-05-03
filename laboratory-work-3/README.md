### Задание 1.

Создайте базу данных Work. 
Создайте таблицы по следующей схеме данных, заполнять таблицы данными не нужно.

**Employee**
|	id 		        |	int PK AI   |
|:--------------|:------------|
|	name 		    	| varchar(30) |
|	surname			  | varchar(50) |
|	age 			    | int         |
|	department_id	| int FK      |
|	position_id  	| int FK      |

**Department**
|	id 	 | int PK AI   |
|:-----|:----------- |
|	name |varchar(100) |

**Position**
|	id 		      |	int PK AI     |
|:------------| :-------------|
|	name 		  	| varchar(100)  |
| base_salary | decimal(8, 2) |



### Задание 2.

Выполните скрипт для создания и заполнения базы данных Store. 

Скрипт:
```sql
create database if not exists store;

create table if not exists store.vendor(
  id int primary key auto_increment,
  name varchar(50)
);

create table if not exists store.laptop(
  id int primary key auto_increment,
  model varchar(50),
  vendor_id int,
  price decimal(8,2),
  amount int,
  foreign key (vendor_id) references vendor(id)
);

insert into store.vendor(name)
values ("Apple"), ("Xiaomi"), ("Dell"), ("Acer"), ("HP"), ("Lenovo"), ("Huawei");

insert into store.laptop(model, vendor_id, price, amount) values 
("Macbook Pro 13", (select id from store.vendor where name = "Apple"), 90000, 5),
("Macbook Air 13", (select id from store.vendor where name = "Apple"), 70000, 10),
("Macbook Pro 16", (select id from store.vendor where name = "Apple"), 130000, 3),
("XPS 13", (select id from store.vendor where name = "Dell"), 80000, 7),
("XPS 17 Pro", (select id from store.vendor where name = "Dell"), 200000, 4),
("Mi Notebook Air", (select id from store.vendor where name = "Xiaomi"), 60000, 15),
("Mi Notebook Pro", (select id from store.vendor where name = "Xiaomi"), 85000, 10),
("Swift 1", (select id from store.vendor where name = "Acer"), 33000, 25),
("Swift 3", (select id from store.vendor where name = "Acer"), 45000, 18);
```

Схема данных выглядит следующим образом:

**Laptop**

| id        |  int PK AI   |
|:----------|:-------------|
| price     |  varchar(30) |
| amount    |  varchar(50) |
| vendor_id |  int FK      |

**Vendor**
| id   | int PK AI   |
|:-----|:------------|
| name | varchar(50) |

**Вариант 1.** Выведите название моделей ноутбуков и их производителя, для которых производителем является Apple или Huawei. В результирующей таблице назовите столбцы “Модель” и “Производитель” соответственно. Отсортируйте по производителю.

**Вариант 2.** Выведите названия всех моделей ноутбуков и их производителей. В результирующей таблице назовите столбцы “Модель” и “Производитель” соответственно. Отсортируйте по названию модели в убывающем порядке.

### Задание 3.

**Вариант 1.** Выведите названия всех моделей ноутбуков и их производителей. В результирующей таблице назовите столбцы “Модель” и “Производитель” соответственно. Если для какого-то производителя нет ноутбуков, то в результирующей таблице должно стоять NULL. Отсортируйте по названию модели в убывающем порядке.

**Вариант 2.** Выведите название моделей ноутбуков и их производителя, для которых производителем является Apple или Huawei. В результирующей таблице назовите столбцы “Модель” и “Производитель” соответственно. Если для какого-то производителя нет ноутбуков, то в результирующей таблице должно стоять NULL. Отсортируйте по производителю.

### Задание 4.

Вывести только тех производителей, у которых в магазине не представлены ноутбуки.

### Задание 5.

**Вариант 1.** Вывести производителя и количество различных ноутбуков у каждого производителя. Если у производителя нет ноутбуков, то он все равно должен быть включен в результирующую таблицу с количеством 0. Столбцы назвать “Производитель” и “Количество” соответственно.

**Вариант 2.** Вывести производителя и общую сумму его ноутбуков на складе. Если у производителя нет ноутбуков, то он все равно должен быть включен в результирующую таблицу с общей суммой 0. Столбцы назвать “Производитель” и “Общая сумма” соответственно.
Подсказка: используйте группировку, если после соединения таблиц получается значение NULL, то при вычислении агрегирующих функций получится 0.
