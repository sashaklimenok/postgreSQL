-- Inner join
-- Left/Right join
-- Full join
-- Cross join
-- Self join

SELECT products.product_name, suppliers.company_name, products.units_in_stock
FROM products
    INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY products.units_in_stock DESC;

SELECT category_name, SUM(products.units_in_stock)
FROM products
    INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY
    category_name
ORDER BY SUM(products.units_in_stock) DESC;

SELECT
    order_date,
    product_name,
    ship_country,
    products.unit_price,
    quantity,
    discount
FROM
    orders
    INNER JOIN order_details ON orders.order_id = order_details.order_id
    INNER JOIN products ON order_details.product_id = products.product_id;

SELECT company_name, product_name
FROM suppliers
    LEFT JOIN products ON suppliers.supplier_id = products.product_id;

SELECT company_name, orders.order_id
FROM customers
    LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE
    orders.order_id IS NULL;

SELECT
    order_date,
    product_name,
    ship_country,
    products.unit_price
FROM
    orders
    JOIN order_details USING (order_id)
    JOIN products USING (product_id);

SELECT COUNT(*) AS employees_count FROM employees;

SELECT category_id, SUM(units_in_stock) AS units_in_stock
FROM products
GROUP BY
    category_id
ORDER BY units_in_stock DESC;

SELECT p.category_id, SUM(units_in_stock) AS units_in_stock
FROM products p
GROUP BY
    category_id
ORDER BY units_in_stock DESC

-- 1. Найти заказчиков и обслуживающих их заказы сотрудников таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.

SELECT c.company_name, CONCAT(
        e.first_name, ' ', e.last_name
    ) AS employee_full_name
FROM
    orders o
    JOIN customers c USING (customer_id)
    JOIN employees e USING (employee_id)
    JOIN shippers s ON s.shipper_id = o.ship_via
WHERE
    c.city = 'London'
    AND e.city = 'London'
    AND s.company_name = 'Speedy Express'

-- 2. Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.

SELECT p.product_name, p.units_in_stock, s.contact_name, s.phone, c.category_name
FROM
    products AS p
    JOIN categories AS c USING (category_id)
    JOIN suppliers AS s USING (supplier_id)
WHERE
    c.category_name IN ('Beverages', 'Seafood')
    AND p.discontinued = 0
    AND p.units_in_stock < 20
ORDER BY p.units_in_stock

-- 3. Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.

SELECT c.contact_name, order_id
FROM customers AS c
    LEFT JOIN orders AS o USING (customer_id)
WHERE
    o.order_id IS NULL

-- 4. Переписать предыдущий запрос, использовав симметричный вид джойна (подсказка: речь о LEFT и RIGHT).

SELECT c.contact_name, order_id
FROM orders AS o
    RIGHT JOIN customers AS c USING (customer_id)
WHERE
    o.order_id IS NULL