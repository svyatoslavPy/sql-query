-- 1
SELECT
    Product.Name AS 'product',
    Producer.Name AS 'producer'
FROM Producer
LEFT OUTER JOIN Product ON Product.id_producer = Producer.id


SELECT
	Category.name AS 'category',
	Product.name AS 'product'
FROM Category
	LEFT JOIN Product ON Category.id = Product.id_category
WHERE Product.id IS NULL

-- 3.
SELECT
    Region.name AS 'region'
FROM Region
EXCEPT
SELECT 
    Region.name
FROM Producer
	JOIN Address ON Producer.id_address = Address.id
	JOIN City ON Address.id_city = City.id
	JOIN Region ON City.id_region = Region.id

-- 4.
SELECT
	Category.name
FROM Category
EXCEPT
SELECT
    Category.name
FROM Product
	JOIN Category ON Product.id_category = Category.id
	JOIN Producer ON Product.id_producer = Producer.id
WHERE NOT EXISTS Producer.name = 'OOO Нли Ю'
