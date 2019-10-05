-- Задание 1
-- Проанализировать запросы, которые выполнялись на занятии, 
-- определить возможные корректировки и/или улучшения (JOIN пока не применять).

-- По запросам идей улучшения не возникло, единственное что пришло на ум это добавить admin_user_id 
-- в группу user_communities тогда можно реализовать идеюнетолько одна группаодин админ, а более 
-- одного админа или систему правв группе, а аткже запрос проверки пользователя админ он или нет 
-- выглядел бы подругому c выводом имени группы id пользователя и статуса(adnin/user):

SELECT 
	(SELECT name FROM communities WHERE id = 1) AS group_name, 
	user_id, 
	IF(admin_user_id = 1, 'admin', 'user') AS status 
	FROM users_communities WHERE community_id = 1 AND user_id = 1;



-- Задача №2
-- Пусть задан некоторый пользователь.Из всех друзей этого пользователя найдите 
-- человека, который больше всех общался с нашим пользователем.

--  В данном случае выбираем наибольшее количество сообщений отправленных другом пользователю с  заданым id=1
SELECT COUNT(from_user_id) AS total, from_user_id AS friend FROM messages WHERE to_user_id = 1 GROUP BY from_user_id ORDER BY total DESC LIMIT 1;


-- Задача №3
-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10; вывести 10 самых молодых пользователей

CREATE TEMPORARY TABLE tmp_prof like profiles; -- создаем временную таблицу копию profiles
INSERT INTO tmp_prof SELECT * FROM profiles ORDER BY birthday DESC LIMIT 10; -- копируем в нее 10 самых молодых пользователей
SELECT 
	COUNT(media_id) AS total, GROUP_CONCAT(user_id) AS users_like, media_id FROM likes 
	WHERE media_id in 
	(select id from media where user_id in (select user_id from tmp_prof)) 
	GROUP BY media_id ORDER BY total DESC;  -- соответственно выбираем публикации сделанные 10 самыми молодыми
                                                -- пользователями групируем по количеству лайков сортируем по
                                                -- возрастанию от большего и выводим
DROP TABLE tmp_prof; -- удаляем временную таблицу


-- Задача №4
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select 
	if((select gender from profiles where user_id = likes.user_id)='m', 'мужчины', 'женщины') as gender, 
	count(*) as total 
	from likes 
	group by gender 
	order by total desc;


-- Задача №5
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

select 
	count(*) as total_post, 
	user_id, 
	GROUP_CONCAT(DATE(created_at)) 
	from media 
	group by user_id 
	order by (GROUP_CONCAT(created_at order by created_at desc));
-- групируем по количеству сделанных публикаций пользователем и 
-- сортируем по датам публикаций от старых к новым
-- получаем самых нективных пользователей по датам и количеству публикаций

