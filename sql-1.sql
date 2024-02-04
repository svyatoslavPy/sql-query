-- 1.
SELECT 
	Producer.name AS 'producer', 
	CAST((
		SELECT COUNT(*)
		FROM Product 
		WHERE id_producer = Producer.id
	) AS float) / (SELECT COUNT(*) FROM Product) * 100 AS '%'
FROM Producer
ORDER BY Producer.name

-- 2.
SELECT Producer.name AS 'producer'
FROM Producer
WHERE (
	SELECT COUNT(*) 
	FROM Sale 
	WHERE id_product IN (
		SELECT id 
		FROM Product 
		WHERE id_producer = Producer.id
	)
) > 3

-- 3.
SELECT Product.name AS 'product'
FROM Product
WHERE Product.id IN (
	SELECT TOP 1 id_product
	FROM Sale
	GROUP BY id_product
	ORDER BY COUNT(id_product) DESC
)

-- 4.
SELECT Supplier.name AS 'supplier'
FROM Supplier
WHERE Supplier.id IN (
	SELECT id_supplier 
	FROM Delivery 
	WHERE Delivery.id_product IN (
		SELECT id 
		FROM Product 
		WHERE Product.name NOT LIKE 'Йогурт'
	)
)

-- 5. 
SELECT Producer.name AS 'producer'
FROM Producer
WHERE (
	SELECT id_country
	FROM Region
	WHERE id = (
		SELECT id_region
		FROM City
		WHERE id = (
			SELECT id_city
			FROM Address
			WHERE id = Producer.id_address
		)
	)
) = (
	SELECT id_country
	FROM Region
	WHERE id = (
		SELECT id_region
		FROM City
		WHERE id = (
			SELECT id_city
			FROM Address
			WHERE id = (
				SELECT id_address
				FROM Producer
				WHERE name = 'ООО "Зеленоглазое такси'
			)
		)
	)
)

EXCEPT
	SELECT Producer.name
	FROM Producer
	WHERE name = 'ООО "Зеленоглазое такси'

-- 6.
SELECT Producer.name AS 'producer'
FROM Producer
WHERE (
	SELECT COUNT(*)
	FROM Product 
	WHERE Product.id_producer = Producer.id
) > (
	SELECT COUNT(*)
	FROM Product 
	WHERE id_producer IN (
		SELECT id
		FROM Producer
		WHERE name = 'ООО "Самтаймс'
	)
)

-- 7.
SELECT 
	Sale.date_of_sale,
	SUM(Sale.quantity) AS 'sales_quantity'
FROM Sale 
WHERE Sale.date_of_sale BETWEEN '2023-11-15' AND GETDATE()
GROUP BY Sale.date_of_sale
ORDER BY Sale.date_of_sale DESC