-- Задание № 1
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select count(id) as total, (select name from users where id = orders.user_id) as name from orders group by user_id;

-- Задание № 2
-- Выведите список товаров products и разделов catalogs, который соответствует товару.

select name as product_name, (select name from catalogs where id = products.catalog_id) as catalog from products;

-- Задание № 3
-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

select 
	(select name from cities where label=flights.from) as `from`,
	(select name from cities where label=flights.to) as `to` 
from flights;