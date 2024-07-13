# Stream Lit App to Query Mysql Database

This is a simple UI app created to dynamically query data from MySql database hosted on any VM

## Features
- List Tables
- Dynamic Querying

## Requirements

- Python 3.10 or later
- Mysql

## My Sql Deploy Script 

- Update the package index.
- Install MySQL Server.
- Start the MySQL service.
- Enable MySQL to start on boot.
- Run the mysql_secure_installation script to secure your MySQL installation.
- Create a test database and user.
- Create a table in the database and insert some dummy values into it.
- You can adjust the DB_NAME, DB_USER, DB_PASS, and TABLE_NAME variables as needed.

- Make the script executable:
    - ### chmod +x install_and_setup_mysql.sh
- Run the script with sudo privileges
    - ### sudo ./install_and_setup_mysql.sh

