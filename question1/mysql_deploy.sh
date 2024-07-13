#!/bin/bash

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

# Create a test database and user (optional)
DB_NAME="testdb"
DB_USER="testuser"
DB_PASS="testpassword"

sudo mysql -e "CREATE DATABASE ${DB_NAME};"
sudo mysql -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "MySQL installation and initial setup is complete."
