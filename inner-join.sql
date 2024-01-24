-- 1.
SELECT
    Product.name AS 'ProductName',
    Category.name AS 'CategoryName',
    Supplier.name AS 'SupplierName'
FROM Product
    JOIN Category ON Category.id = Product.category_id
    JOIN Delivery ON Product.id = Delivery.product_id
    JOIN Supplier ON Supplier.id = Delivery.supplier_id
WHERE
    Supplier.name IN ('OOO Паньки', 'OOO Какие люди')

-- 2
SELECT
    Product.name AS 'ProductName',
    Category.name AS 'CategoryName',
    Supplier.name AS 'SupplierName',
    Producer.name AS 'ProducerName'
FROM Product
    JOIN Delivery ON Product.id = Delivery.product_id
    JOIN Supplier ON Supplier.id = Delivery.supplier_id
    JOIN Producer ON Producer.id = Product.producer_id
    JOIN Category ON Category.id = Product.category_id
WHERE
    Producer.name NOT LIKE '%[AKM]%'
    AND Category.name <> 'Grains'

-- 3.
SELECT
    Product.name AS 'ProductName',
    Category.name AS 'CategoryName',
    Supplier.name AS 'SupplierName',
    Delivery.price AS 'DeliveryPrice',
    Country.name AS 'CountryOfProducer'
FROM Product
    JOIN Category ON Category.id = Product.category_id
    JOIN Delivery ON Product.id = Delivery.product_id
    JOIN Supplier ON Supplier.id = Delivery.supplier_id
    JOIN Producer ON Producer.id = Product.producer_id
    JOIN Address ON Address.id = Producer.address_id
    JOIN City ON City.id = Address.city_id
    JOIN Region ON Region.id = City.region_id
    JOIN Country ON Country.id = Region.country_id
WHERE
    Country.name NOT IN ('Ukraine', 'Netherlands')
    AND Delivery.price < 50
    AND Delivery.delivery_date BETWEEN '2023-10-10' AND GETDATE()

-- 4.
SELECT
    Product.name AS 'ProductName',
    Category.name AS 'CategoryName',
    Sale.quantity AS 'SoldQuantity',
    Supplier.name AS 'SupplierName',
    Producer.name AS 'ProducerName'
FROM Product
    JOIN Category ON Category.id = Product.category_id
    JOIN Sale ON Product.id = Sale.product_id
    JOIN Delivery ON Product.id = Delivery.product_id
    JOIN Supplier ON Supplier.id = Delivery.supplier_id
    JOIN Producer ON Producer.id = Product.producer_id
WHERE
    Category.name IN ('Sweets', 'Alcohol')
    AND Sale.quantity > 100

-- 5.
SELECT
    Product.name AS 'ProductName',
    Supplier.name AS 'SupplierName',
    Category.name AS 'CategoryName',
    Delivery.delivery_date,
    Delivery.price AS 'DeliveryPrice'
FROM Product
    JOIN Delivery ON Product.id = Delivery.product_id
    JOIN Supplier ON Supplier.id = Delivery.supplier_id
    JOIN Category ON Category.id = Product.category_id
WHERE
    Supplier.name IN ('Amazon', 'eBay')
ORDER BY Product.name

-- 6.
SELECT
    Product.name AS 'ProductName',
    Producer.name AS 'ProducerName',
    (Country.name + ', ' + City.name + ', ' + Address.street) AS 'ProducerAddress',
    Category.name AS 'CategoryName',
    Sale.sale_date,
    Sale.price AS 'SalePrice'
FROM Product
    JOIN Producer ON Producer.id = Product.producer_id
    JOIN Address ON Address.id = Producer.address_id
    JOIN City ON City.id = Address.city_id
    JOIN Region ON Region.id = City.region_id
    JOIN Country ON Country.id = Region.country_id
    JOIN Category ON Category.id = Product.category_id
    JOIN Sale ON Product.id = Sale.product_id
WHERE
    Producer.name NOT IN ('Sony', 'Sumsung')
ORDER BY Sale.price DESC
