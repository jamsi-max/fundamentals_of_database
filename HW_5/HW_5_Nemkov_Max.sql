-- *********Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”***************************

-- Задаиние 1 
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.

UPDATE users SET created_at = now(), updated_at = now();


-- Задание 2
-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

UPDATE users SET created_at = DATE_FORMAT(STR_TO_DATE(created_at, '%d-%m-%Y %h:%i:%s'), '%Y-%m-%d %h:%i:%s');
UPDATE users SET updated_at = DATE_FORMAT(STR_TO_DATE(updated_at, '%d-%m-%Y %h:%i:%s'), '%Y-%m-%d %h:%i:%s');
ALTER TABLE users MODIFY created_at DATETIME; 
ALTER TABLE users MODIFY updated_at DATETIME;


-- Задание 3
-- В таблице складских запасов storehouses_products в поле value могут встречаться 
-- самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
-- значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

select value from storehouses_products order by if(value = 0, 1, 0), value;


-- Задание 4
-- Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий ('may', 'august')


UPDATE users SET birthday_at = DATE_FORMAT(str_to_date(birthday_at, '%Y-%M-%d'), '%Y-%m-%d');
ALTER TABLE users MODIFY birthday_at DATE;
select birthday_at from users WHERE date_format(birthday_at, '%m') between 5 and 8;


-- Задание 5
-- Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs order by if(id=5,0,1), if(id=1,0,1), if(id=2,0,1) limit 3;

-- *******************Практическое задание теме “Агрегация данных” ***********************

-- Задаине 1
-- Подсчитайте средний возраст пользователей в таблице users

select FLOOR(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW()))) FROM users;

-- Задаине 2
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть,
-- что необходимы дни недели текущего года, а не года рождения.

select count(*), date_format(birthday_at, '%a') as week from users group by week;

-- Задаине 3
-- Подсчитайте произведение чисел в столбце таблицы

-- Тут конечно гугл помог я только округлил до целого числа
select floor(exp(sum(ln(value)))) as sum from storehouses_products;
