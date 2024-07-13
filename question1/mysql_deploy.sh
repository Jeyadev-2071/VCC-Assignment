#!/bin/bash

# Variables
DB_NAME="testdb"
DB_USER="testuser"
DB_PASS="testpassword"
TABLE1_NAME="User"
TABLE2_NAME="Product"
TABLE3_NAME="Orders"

# Update package index
sudo apt-get update

# Install MySQL server
sudo apt-get install -y mysql-server

# Start MySQL service
sudo systemctl start mysql

# Enable MySQL to start on boot
sudo systemctl enable mysql

# Secure MySQL installation
# You will be prompted to set a root password and remove some insecure defaults
sudo mysql_secure_installation

# Create database and user
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
sudo mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Create tables and insert dummy values
sudo mysql -u${DB_USER} -p${DB_PASS} -D${DB_NAME} -e "
CREATE TABLE IF NOT EXISTS ${TABLE1_NAME} (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO ${TABLE1_NAME} (name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com');

CREATE TABLE IF NOT EXISTS ${TABLE2_NAME} (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO ${TABLE2_NAME} (product_name, price, stock) VALUES
('Product A', 10.99, 100),
('Product B', 25.50, 50),
('Product C', 7.25, 200);

CREATE TABLE IF NOT EXISTS ${TABLE3_NAME} (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_number VARCHAR(50) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL
);
INSERT INTO ${TABLE3_NAME} (order_number, customer_name, order_date, amount) VALUES
('ORD123', 'John Doe', NOW(), 99.99),
('ORD124', 'Jane Smith', NOW(), 149.99),
('ORD125', 'Alice Johnson', NOW(), 249.99);
"

# List all tables in the database
echo "Listing all tables in database ${DB_NAME}:"
sudo mysql -u${DB_USER} -p${DB_PASS} -D${DB_NAME} -e "SHOW TABLES;"

echo "MySQL installation, database setup, table creation, data insertion, and table listing are complete."
