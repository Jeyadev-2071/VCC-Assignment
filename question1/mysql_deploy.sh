#!/bin/bash

# Variables
DB_NAME="testdb"
DB_USER="testuser"
DB_PASS="testpassword"
TABLE_NAME="test_table"

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

# Create table and insert dummy values
sudo mysql -u${DB_USER} -p${DB_PASS} -D${DB_NAME} -e "
CREATE TABLE IF NOT EXISTS ${TABLE_NAME} (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO ${TABLE_NAME} (name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com');
"

echo "MySQL installation, database setup, table creation, and data insertion are complete."
