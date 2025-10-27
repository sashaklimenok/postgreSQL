SELECT
    company_name,
    contact_name,
    phone,
    country
FROM customers
WHERE
    country = 'USA';

SELECT * FROM products WHERE unit_price BETWEEN 20 AND 50;

SELECT *
FROM products
WHERE
    unit_price >= 20
    AND unit_price <= 50
ORDER BY unit_price;

SELECT *
FROM products
WHERE
    unit_price = 20
    OR unit_price = 25
ORDER BY product_name, unit_price ASC;

SELECT shipped_date, freight
FROM orders
WHERE (shipped_date > '1998-04-30')
    AND (
        freight > 75
        OR freight < 150
    )

# Homework

# 1. Выбрать все заказы из стран France, Austria, Spain

SELECT order_id, ship_country
FROM orders
WHERE ship_country IN('France', 'Austria', 'Spain')
ORDER BY ship_country;

# 2. Выбрать все заказы, отсортировать по required_date (по убыванию) и отсортировать по дате отгрузке (по возрастанию)

SELECT *
FROM orders
ORDER BY required_date DESC;

SELECT * FROM orders ORDER BY required_date ASC;

# 3. Выбрать минимальную цену товара среди тех продуктов, которых в продаже более 30 единиц.

SELECT MIN(unit_price)
FROM products
WHERE units_in_stock > 30

# 4. Выбрать максимальное кол-во единиц товара среди тех продуктов, цена которых более 30 у.е.

SELECT MAX(units_in_stock)
FROM products
WHERE unit_price > 30

# 5. Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA

SELECT AVG(shipped_date - order_date)
FROM orders

# 6. Найти сумму, на которую имеется товаров (кол-во * цену) причём таких, которые планируется продавать и в будущем (см. на поле discontinued)

SELECT SUM(units_in_stock * unit_price)
FROM products
WHERE discontinued >= 1