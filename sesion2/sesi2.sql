Create TABLE
SHOW TABLES;
CREATE TABLE categories (id INT);
SHOW TABLES;
DESCRIBE categories;

SHOW DATABASES;
CREATE DATABASE database_name;
USE database_name;

DROP TABLE table_name;
DROP DATABASE database_name;

CREATE TABLE items (
    id INT NOT NULL,
    name VARCHAR(50) DEFAULT NULL,
    price INT DEFAULT 0,
    PRIMARY KEY (id)
);

ALTER TABLE categories ADD PRIMARY KEY(id);
ALTER TABLE categories ADD name VARCHAR(50);
DESCRIBE categories;


CREATE TABLE item_categories (
    item_id INT,
    category_id INT
);

SHOW DATABASES;
CREATE DATABASE food_oms_db;
USE food_oms_db;
