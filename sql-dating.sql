USE Dating

-- 1.
SELECT TOP 10
	users.nick AS 'nickname',
	users.user_id AS 'page_id',
	users.age AS 'age',
	gender.name AS 'sex',
	ROUND(AVG(CAST(anketa_rate.rating AS FLOAT)),1) AS 'average_rating'
FROM anketa_rate
	JOIN users ON users.user_id = anketa_rate.id_kogo
	JOIN gender ON gender.id = users.sex
GROUP BY
	users.nick,
	users.user_id,
	users.age,
	gender.name
ORDER BY 'average_rating' DESC


-- 2.
SELECT
	users.nick AS 'nickname',
	users.user_id AS 'page_id',
	users.age AS 'age',
	gender.name AS 'sex',
	education.name AS 'studies',
	smoking.name AS 'smoking',
	drinking.name AS 'alcohol',
	drugs.name AS 'drugs'
FROM users
	JOIN gender ON gender.id = users.sex
	JOIN education ON education.id = users.id_education
	JOIN smoking ON smoking.id = users.my_smoke
	JOIN drinking ON drinking.id = users.my_drink
	JOIN drugs ON drugs.id = users.my_drugs
WHERE
	education.id >= 4
	AND smoking.id = 1
	AND drinking.id = 1
	AND drugs.id = 1
ORDER BY 'age' DESC


-- 5.
SELECT
    users.nick AS 'nickname',
    users.user_id AS 'page_id',
    users.age AS 'age',
    gender.name AS 'sex',
    moles.name AS 'defects_of_the_skin',
    framework.name AS 'occupation',
	Interes.name AS 'hobby'
FROM users
	JOIN gender ON gender.id = users.sex
	JOIN framework ON framework.id = users.id_framework
	JOIN users_moles ON users_moles.user_id = users.user_id
	JOIN moles ON moles.id = users_moles.moles_id
	JOIN users_interes ON users_interes.user_id = users.user_id
	JOIN interes ON users_interes.interes_id = interes.id
WHERE
    users.id_framework = 1
    AND moles.id = 1
    AND interes.id = 23
ORDER BY users.age

-- 6.
SELECT
    users.nick AS 'nickname',
    users.user_id AS 'page_id',
    users.age AS 'age',
    gender.name AS 'sex',
    goroskop.name AS 'zodiac_sign',
    COUNT(*) AS 'number_of_gifts'
FROM users
	JOIN gender ON gender.id = users.sex
	JOIN goroskop ON goroskop.id = users.id_zodiak
	JOIN gift_service ON gift_service.id_to = users.user_id
WHERE users.id_zodiak = 12
GROUP BY
	users.nick,
	users.user_id,
	users.age,
	gender.name,
	goroskop.name
ORDER BY 'number_of_gifts' DESC


-- 7.
SELECT
    users.nick AS 'nickname',
    users.user_id AS 'page_id',
    users.age AS 'age',
    gender.name AS 'sex',
    richness.name AS 'richness',
	kitchen.name AS 'cooking_skills',
	STRING_AGG(languages.name, ', ') AS 'language_skills'
FROM users
	JOIN gender ON gender.id = users.sex
	JOIN richness ON richness.id = users.my_rich
	JOIN kitchen ON kitchen.id = users.like_kitchen
	JOIN users_languages ON users_languages.user_id = users.user_id
	JOIN languages ON languages.id = users_languages.Languages_id
WHERE users.like_kitchen = 2
GROUP BY
	users.nick,
	users.user_id,
	users.age,
	gender.name,
	richness.name,
	kitchen.name
HAVING COUNT(languages.id) >= 5
ORDER BY 'language_skills' DESC
