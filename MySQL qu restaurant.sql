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
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT cust_id, cust_name FROM customers;

INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Thom", "thom@email.com", 0757489565);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Peter", "peter@email.com", 0734619754);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Amy", "amy@email.com", 0748978463);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Gerald", "Gerald@email.com", 0777946221);
INSERT INTO customers(cust_name, cust_email, cust_phone) VALUES("Alfred", "Alfred@email.com", 0773644978);
		#or
INSERT INTO items(item_name, item_price) VALUES("Burger", 10.99),("F&C", 11.99),("Sirloin", 18.50),("Spagbol", 9.00),("Sundae chocolate", 6.40),("Sundae Strawberry", 6.40),("Sundae Mango", 6.40);


UPDATE customers SET cust_name="Thom B", cust_email=0789632145 WHERE cust_id=1;
UPDATE customers SET cust_name="Jordan" WHERE cust_id=2;

UPDATE items SET item_price=10.00 WHERE item_id=4;
UPDATE items SET item_name="Cheese board" WHERE item_id=4;

DELETE FROM customers WHERE cust_id=1;
DELETE FROM items WHERE item_id=2;

CREATE TABLE orders(
order_id INT UNIQUE NOT NULL AUTO_INCREMENT,
cust_id INT NOT NULL,
order_time TIME NOT NULL,
total_price DECIMAL(5,2) NOT NULL,
FOREIGN KEY (cust_id) REFERENCES customers(cust_id));

INSERT INTO orders(cust_id, order_time, total_price) VALUES(3, '21:39:26', 30.00),(5, '20:30:11', 100.00),(6, '13:35:36', 15.50),(4, '19:33:44', 37.40);


ALTER TABLE orders ADD PRIMARY KEY(order_id);

CREATE TABLE order_items(
order_items_id INT UNIQUE NOT NULL AUTO_INCREMENT,
items_id INT NOT NULL,
order_id INT NOT NULL,
PRIMARY KEY (order_items_id),
FOREIGN KEY (items_id) REFERENCES items(item_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id));

ALTER TABLE orders ADD COLUMN quantity INT NOT NULL;

UPDATE orders SET quantity= 1 WHERE order_id= 1;
UPDATE orders SET quantity= 3 WHERE order_id= 2;
UPDATE orders SET quantity= 10 WHERE order_id= 3;
UPDATE orders SET quantity= 1 WHERE order_id= 4;
UPDATE orders SET quantity= 5 WHERE order_id= 5;

INSERT INTO order_items(items_id, order_id) VALUES(4,1),(4,2),(4,3),(6,4),(7,5);



