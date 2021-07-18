
CREATE TABLE items (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE categories (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE item_categories (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    item_id INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE customers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone CHAR(12) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    order_date DATETIME NOT NULL,
    grand_total_price INT NOT NULL
);

CREATE TABLE detail_orders (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item_category_id INT NOT NULL,
    FOREIGN KEY (item_category_id) REFERENCES item_categories(id),
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    quantity INT NOT NULL,
    total_price INT NOT NULL
);

INSERT INTO items (id, name, price) VALUES (1, 'Nasi Padang', 20000);
INSERT INTO items (id, name, price) VALUES (2, 'Nasi Kucing', 5000);
INSERT INTO items (id, name, price) VALUES (3, 'Starbucks', 50000);
INSERT INTO items (id, name, price) VALUES (4, 'Pancong', 7000);
INSERT INTO items (id, name, price) VALUES (5, 'Nasi Uduk', 10000);

SELECT id, name, price FROM items;
SELECT * FROM items;

INSERT INTO categories (id, category) VALUES (1, 'Makanan'), (2, 'Minuman');
SELECT * FROM categories;
INSERT INTO item_categories (item_id, category_id) VALUES (1, 1), (2, 1), (3, 2), (4, 1), (5, 1);
SELECT * FROM item_categories;

SELECT items.id, items.name, item_categories.category_id FROM items JOIN item_categories ON items.id = item_categories.item_id;

SELECT categories.*, GROUP_CONCAT(items.name) AS items, MAX(items.price) AS price FROM categories LEFT JOIN item_categories ON categories.id = item_categories.category_id JOIN items ON item_categories.item_id = items.id GROUP BY categories.id;

INSERT INTO customers (id, name, phone, address) VALUES 
(1, 'Udin', 081298765438, 'Jakarta'), 
(2, 'Ucok', 081298364436, 'Bekasi'), 
(3, 'Mahmud', 081228735434, 'Karawang'), 
(4, 'Ninu', 081298785335, 'Purwokerto'), 
(5, 'Nunu', 081208715437, 'Jambi');


INSERT INTO orders (customer_id, item_category_id, order_date, total_price, quantity) VALUES
(1, 1, '2021-11-12 10:10:10', 100000, 2), 
(2, 2, '2020-10-09 11:11:11', 20000, 3), 
(3, 3, '2021-05-02 12:12:12', 300000, 10), 
(4, 4, '2020-04-01 13:13:13', 50000, 9), 
(5, 5, '2021-01-07 14:14:14', 500000, 7);

SELECT * FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN detail_orders do ON do.order_id = o.id
INNER JOIN item_categories ic ON ic.id = do.item_category_id
INNER JOIN items i ON ic.item_id = i.id
INNER JOIN categories ca ON ic.category_id = ca.id;


SELECT o.id, o.order_date AS 'order date', c.name AS 'customer name', c.phone AS 'customer phone', SUM(do.total_price) AS total, GROUP_CONCAT(i.name SEPARATOR ', ') AS 'items bought' FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN detail_orders do ON do.order_id = o.id
INNER JOIN item_categories ic ON ic.id = do.item_category_id
INNER JOIN items i ON ic.item_id = i.id
INNER JOIN categories ca ON ic.category_id = ca.id
GROUP BY o.id;


INSERT INTO detail_orders (item_category_id, order_id, quantity, total_price) VALUES
(1, 1, 2, 100000), 
(2, 2, 3, 20000), 
(3, 3, 10, 300000), 
(4, 4, 9, 50000), 
(5, 5, 7, 500000);

INSERT INTO orders (customer_id, order_date, grand_total_price) VALUES
(1, '2021-11-12 10:10:10', 200000), 
(2, '2020-10-09 11:11:11', 50000), 
(3, '2021-05-02 12:12:12', 3000000), 
(4, '2020-04-01 13:13:13', 450000), 
(5, '2021-01-07 14:14:14', 3500000);

INSERT INTO detail_orders (item_category_id, order_id, quantity, total_price) VALUES
(3, 2, 2, 600000);


SELECT * FROM orders INNER JOIN detail_orders ON orders.id = detail_orders.order_id;

UPDATE customers SET phone='+6281298765438' WHERE id=1;
UPDATE customers SET phone='+6281298364436' WHERE id=2;
UPDATE customers SET phone='+6281228735434' WHERE id=3;
UPDATE customers SET phone='+6281298785335' WHERE id=4;
UPDATE customers SET phone='+6281208715437' WHERE id=5;

