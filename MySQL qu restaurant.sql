CREATE DATABASE qa_restaurant;
USE qa_restaurant;

CREATE TABLE customer(
cust_id INT UNIQUE NOT NULL AUTO_INCREMENT,
cust_name VARCHAR(100) NOT NULL,
cust_email VARCHAR(100) UNIQUE NOT NULL,
cust_phone INT NOT NULL,
PRIMARY KEY (cust_id));

CREATE TABLE items(
item_id INT UNIQUE NOT NULL AUTO_INCREMENT,
item_name VARCHAR(50) NOT NULL,
item_price DECIMAL(5,2) NOT NULL,
PRIMARY KEY(item_id));

SHOW TABLES;
DESCRIBE customers;
DESCRIBE items;

ALTER TABLE items MODIFY item_name VARCHAR(25) NOT NULL;
ALTER TABLE customer DROP COLUMN post_code;
ALTER TABLE customer RENAME TO customers;
ALTER TABLE customer ADD COLUMN post_code VARCHAR(8) NOT NULL;

SELECT * FROM customers;
SELECT * FROM items;
SELECT cust_id, cust_name FROM customers;

INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Thom", "thom@email.com", 0757489565);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Peter", "peter@email.com", 0734619754);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Amy", "amy@email.com", 0748978463);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Gerald", "Gerald@email.com", 0777946221);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Alfred", "Alfred@email.com", 0773644978);

INSERT INTO items(item_name, item_price) VALUES("Burger", 10.99);
INSERT INTO items(item_name, item_price) VALUES("F&C", 11.99);
INSERT INTO items(item_name, item_price) VALUES("Sirloin", 18.50);
INSERT INTO items(item_name, item_price) VALUES("Spagbol", 9.00);
INSERT INTO items(item_name, item_price) VALUES("Sundae chocolate", 6.40);


UPDATE customers SET cust_name="Thom B", cust_email=0789632145 WHERE cust_id=1;
UPDATE customers SET cust_name="Jordan" WHERE cust_id=2;

UPDATE items SET item_price=10.00 WHERE item_id=4;
UPDATE items SET item_name="Cheese board" WHERE item_id=4;

DELETE FROM customers WHERE cust_id=1;
DELETE FROM items WHERE item_id=2;


