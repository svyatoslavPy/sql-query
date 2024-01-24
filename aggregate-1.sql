-- 1.
SELECT
    p.Name AS 'ProductName',
    AVG(s.SellingPrice) AS 'AverageSellPrice'
FROM Product p
INNER JOIN Sale s ON p.Id = s.ProductId
GROUP BY p.ProductName
HAVING AVG(s.SellingPrice) > 50


-- 2.
SELECT
	Category.name AS 'category',
	COUNT(Product.name) AS 'quantity'
FROM Product
	JOIN Category ON Category.id = Product.id_category
	JOIN Delivery ON Product.id = Delivery.id_product
GROUP BY Category.name
HAVING AVG(Delivery.price) > 100
-- 3.

SELECT
	Supplier.name AS 'supplier',
	MIN(Delivery.price) AS 'delivery_price'
FROM Product
	JOIN Delivery ON Product.id = Delivery.id_product
	JOIN Supplier ON Supplier.id = Delivery.id_supplier
WHERE
	Delivery.date_of_delivery BETWEEN
	DATEADD(MONTH, -1, GETDATE()) AND GETDATE()
GROUP BY Supplier.name
ORDER BY MIN(Delivery.price)

--4
SELECT
    pr.Name AS 'producer',
    CONCAT(Country.Name, ', ', Region.Name, ', ', City.Name, ', ', Address.Street) AS FullAddress,
    COUNT(p.Id) AS NumberOfProducts,
    SUM(s.SellingPrice) AS TotalSales
FROM Producer pr
JOIN Address ON pr.AddressId = Address.Id
JOIN City ON Address.CityId = City.Id
JOIN Region ON City.RegionId = Region.Id
JOIN Country ON Region.CountryId = Country.Id
JOIN Product p ON pr.Id = p.ProducerId
JOIN Sale s ON p.Id = s.ProductId
GROUP BY pr.Name, FullAddress
HAVING SUM(s.SellingPrice) BETWEEN 500 AND 20000


-- 5.
SELECT
	Category.name AS 'category',
	COUNT(Product.name) AS 'quantity',
	Supplier.name AS 'supplier',
	Delivery.price AS 'delivery_price'
FROM Product
	JOIN Category ON Category.id = Product.id_category
	JOIN Delivery ON Product.id = Delivery.id_product
	JOIN Supplier ON Supplier.id = Delivery.id_supplier
WHERE Supplier.name IN ('OOO Паньки', 'eBay', 'OOO Какие люди')
GROUP BY Category.name, Supplier.name, Delivery.price
HAVING SUM(Delivery.price) > 400
