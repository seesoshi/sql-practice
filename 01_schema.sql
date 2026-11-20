-- Схема учебной базы sql_practice.
-- Домен: интернет-магазин электроники и товаров для дома.
-- Выполнять внутри базы sql_practice (не в postgres).

DROP TABLE IF EXISTS order_items, orders, events, products, customers CASCADE;

CREATE TABLE customers (
    customer_id   serial        PRIMARY KEY,
    full_name     text          NOT NULL,
    city          text,                          -- может быть NULL: город не указан
    signup_date   date          NOT NULL,
    is_subscribed boolean       NOT NULL DEFAULT false
);

CREATE TABLE products (
    product_id serial        PRIMARY KEY,
    title      text          NOT NULL,
    category   text          NOT NULL,
    price      numeric(10,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE orders (
    order_id     serial        PRIMARY KEY,
    customer_id  int           NOT NULL REFERENCES customers(customer_id),
    order_date   date          NOT NULL,
    status       text          NOT NULL,         -- paid / pending / cancelled
    total_amount numeric(10,2) NOT NULL
);

CREATE TABLE order_items (
    item_id    serial        PRIMARY KEY,
    order_id   int           NOT NULL REFERENCES orders(order_id),
    product_id int           NOT NULL REFERENCES products(product_id),
    quantity   int           NOT NULL CHECK (quantity > 0),
    unit_price numeric(10,2) NOT NULL
);

CREATE TABLE events (
    event_id    serial    PRIMARY KEY,
    customer_id int       NOT NULL REFERENCES customers(customer_id),
    event_type  text      NOT NULL,              -- view / add_to_cart / purchase
    event_time  timestamp NOT NULL
);
