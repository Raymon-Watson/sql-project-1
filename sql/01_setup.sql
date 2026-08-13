-- ================================
-- Project Setup
-- ================================

-- First remove the relevant tables if they already exist.
-- CAREFUL: This will delete these tables.
DROP TABLE IF EXISTS orders
DROP TABLE IF EXISTS customers
DROP TABLE IF EXISTS products

-- Create tables using correct data types
CREATE TABLE orders (
  order_id VARCHAR(100) PRIMARY KEY,
  customer_id VARCHAR(100),
  product_id VARCHAR(100),
  order_date DATE,
  quantity INT,
  payment_method VARCHAR(100)

  FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)

  FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

CREATE TABLE customers (
  customer_id VARCHAR(100) PRIMARY KEY,
  gender VARCHAR(100),
  age INT,
  city VARCHAR(100)
  signup_date DATE,
  loyalty_member VARCHAR(100)
);

CREATE TABLE products (
  product_id VARCHAR(100) PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(100),
  price DECIMAL
);
