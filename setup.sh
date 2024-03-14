#!/bin/bash

# Install MySQL server
sudo apt-get install mysql-common

# Start MySQL service
sudo service mysql start

# Log in to MySQL as root and execute SQL scripts
sudo mysql -u root <<'END_SQL'
-- Create a user
CREATE USER IF NOT EXISTS 'JWTUser'@'localhost' IDENTIFIED BY 'JWTPassword';
GRANT ALL PRIVILEGES ON *.* TO 'JWTUser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Create the database
CREATE DATABASE IF NOT EXISTS JWTUser;

END_SQL

# Restart MySQL service to apply changes
sudo service mysql restart

# Run database migrations or initialize the schema
# Adjust this based on your project structure and build tools
mvn clean install

# Start your application
mvn spring-boot:run