-- =====================================================================
-- ЭТАЛОННЫЕ ОТВЕТЫ. Неделя 1 (SELECT, WHERE, ORDER BY, LIMIT, DISTINCT).
--
-- Сначала реши сам в week1_tasks.sql, потом сверяйся здесь.
-- Совпал результат — не значит «совпал запрос»: сравнивай и смысл,
-- и порядок строк, и то, какие строки вообще попали в выборку.
-- =====================================================================

-- ЗАДАЧА 1
SELECT * FROM orders;

-- ЗАДАЧА 2
SELECT order_id, order_date, total_amount
FROM orders;

-- ЗАДАЧА 3
SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE status = 'paid';

-- ЗАДАЧА 4
SELECT order_id, total_amount
FROM orders
WHERE total_amount > 20000;

-- ЗАДАЧА 5. Полуинтервал [2026-12-01, 2027-01-01) — это ровно декабрь 2026.
SELECT order_id, order_date
FROM orders
WHERE order_date >= '2026-12-01'
  AND order_date <  '2027-01-01';

-- ЗАДАЧА 6
SELECT order_id, total_amount
FROM orders
WHERE total_amount BETWEEN 1200 AND 5000;

-- ЗАДАЧА 7. DISTINCT считает все NULL одинаковыми, поэтому NULL вернётся одной строкой.
SELECT DISTINCT city
FROM customers;

-- ЗАДАЧА 8
SELECT DISTINCT status
FROM orders;

-- ЗАДАЧА 9
SELECT DISTINCT category
FROM products;

-- ЗАДАЧА 10
SELECT order_id, total_amount
FROM orders
ORDER BY total_amount DESC
LIMIT 5;

-- ЗАДАЧА 11
SELECT order_id, order_date
FROM orders
ORDER BY order_date ASC
LIMIT 3;

-- ЗАДАЧА 12
SELECT title, price
FROM products
WHERE price < 1500
ORDER BY price ASC;

-- ЗАДАЧА 13
SELECT category, title, price
FROM products
ORDER BY category ASC, price DESC;

-- ЗАДАЧА 14
SELECT customer_id, full_name, signup_date
FROM customers
WHERE city IS NULL;

-- ЗАДАЧА 15
SELECT full_name, signup_date
FROM customers
WHERE signup_date >= '2026-11-01'
ORDER BY signup_date ASC;

-- ЗАДАЧА 16. ILIKE — регистронезависимый LIKE из PostgreSQL. Ожидается 2 строки:
-- «Ноутбук IdeaPad 5» и «Чехол для ноутбука».
-- Нюанс: если база создана с локалью C (а не русской), ILIKE не сворачивает
-- регистр кириллицы и вернёт только «Чехол для ноутбука». Это свойство локали,
-- а не ошибка в запросе.
SELECT title
FROM products
WHERE title ILIKE '%ноутбук%';

-- ЗАДАЧА 17
SELECT order_id, status
FROM orders
WHERE status <> 'cancelled';

-- ЗАДАЧА 18. DISTINCT по двум колонкам — уникальные пары.
SELECT DISTINCT city, is_subscribed
FROM customers;

-- ЗАДАЧА 19
SELECT full_name, signup_date
FROM customers
ORDER BY signup_date DESC
LIMIT 5;

-- ЗАДАЧА 20
SELECT order_id, order_date
FROM orders
WHERE order_date IN ('2026-11-16', '2026-12-01')
ORDER BY order_date ASC;
