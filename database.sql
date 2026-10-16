
CREATE DATABASE IF NOT EXISTS product_management;

USE product_management;

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO products (name, price, quantity)
VALUES
('Ban phim', 250000, 10),
('Chuot may tinh', 150000, 20),
('Tai nghe', 350000, 8);

SELECT * FROM products;
