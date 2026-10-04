CREATE DATABASE IF NOT EXISTS order_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE order_db;

-- Клієнти
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  last_name   VARCHAR(100) NOT NULL,
  address     VARCHAR(255) NOT NULL
);

-- Товари
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL
);

-- Замовлення
CREATE TABLE orders (
  order_id    INT PRIMARY KEY,
  order_date  DATE NOT NULL,
  customer_id INT NOT NULL,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Позиції замовлення (зв'язок N:M між orders і products)
CREATE TABLE order_items (
  order_id   INT NOT NULL,
  product_id INT NOT NULL,
  quantity   INT NOT NULL CHECK (quantity > 0),
  PRIMARY KEY (order_id, product_id),
  CONSTRAINT fk_items_order
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  CONSTRAINT fk_items_product
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

USE order_db;
SHOW TABLES;