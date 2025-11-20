CREATE TABLE categories (
    					category_id INT PRIMARY KEY,
    					category_name TEXT,
    					description TEXT,
    					picture BYTEA
);

COPY categories(category_id, category_name, description, picture)
FROM 'C:\Users\csv\northwind_data_clean-master\data\categories.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM categories;

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE customers (
						customer_id TEXT PRIMARY KEY,
						company_name TEXT,
						contact_name TEXT,
						contact_title TEXT,
						address TEXT,
						city TEXT,
						region TEXT,
						postal_code TEXT,
						country TEXT,
						phone TEXT,
						fax TEXT
);

COPY customers(customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax)
FROM 'C:\Users\csv\northwind_data_clean-master\data\customers.csv'
DELIMITER ',' CSV HEADER NULL 'NULL';


SELECT * FROM customers;

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employee_territories (
									employee_id INT,
									territory_id INT,
									PRIMARY KEY (employee_id, territory_id)
);

COPY employee_territories(employee_id, territory_id)
FROM 'C:\Users\csv\northwind_data_clean-master\data\employee_territories.csv'
DELIMITER ',' CSV HEADER;


SELECT * FROM employee_territories;

ALTER TABLE employee_territories
ADD CONSTRAINT fk_employee_territories_territory
FOREIGN KEY (territory_id)
REFERENCES territories(territory_id);

ALTER TABLE employee_territories
ADD CONSTRAINT fk_employee_territories_employees
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employees (
						employee_id INT PRIMARY KEY,
						last_name TEXT,
						first_name TEXT,
						title TEXT,
						title_of_courtesy TEXT,
						birth_date TIMESTAMP,
						hire_date TIMESTAMP,
						address TEXT,
						city TEXT,
						region TEXT,
						postal_code TEXT,
						country TEXT,
						home_phone TEXT,
						"extension" INT,
						photo BYTEA,
						notes TEXT,
						reports_to TEXT,
						photo_path TEXT						
);

COPY employees(employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, "extension", photo, notes, reports_to, photo_path)
FROM 'C:\Users\csv\northwind_data_clean-master\data\employees.csv'
DELIMITER ',' CSV HEADER NULL 'NULL';

SELECT * FROM employees;

ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE
USING birth_date::date;

ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE
USING hire_date::date;

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE order_details (
							order_id INT,
							product_id INT,
							PRIMARY KEY (order_id, product_id),
							unit_price FLOAT,
							quantity INT,
							discount FLOAT
);

COPY order_details(order_id, product_id, unit_price, quantity, discount)
FROM 'C:\Users\csv\northwind_data_clean-master\data\order_details.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM order_details;

ALTER TABLE order_details
ADD CONSTRAINT fk_order_details_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE order_details
ADD CONSTRAINT fk_order_details_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);



SHOW lc_numeric;

SET lc_numeric TO 'C';  -- oder 'en_US.UTF-8'

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE orders (
					order_id	INT PRIMARY KEY,
					customer_id TEXT,
					employee_id INT,
					order_date TIMESTAMP,
					required_date TIMESTAMP,
					shipped_date TIMESTAMP,
					ship_via INT,
					freight FLOAT,	-- besser DECIMAL / NUMERIC?
					ship_name TEXT,
					ship_address TEXT,
					ship_city TEXT,
					ship_region TEXT,
					ship_postal_code TEXT,
					ship_country TEXT
);

COPY orders(order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
FROM 'C:\Users\csv\northwind_data_clean-master\data\orders.csv'
DELIMITER ',' CSV HEADER NULL 'NULL';

SELECT * FROM orders;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_employee
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_shippers
FOREIGN KEY (ship_via)
REFERENCES shippers(shipper_id);

-- Datum ohne Uhrzeit anzeigen lassen:
ALTER TABLE orders
ALTER COLUMN order_date TYPE DATE
USING order_date::date;

ALTER TABLE orders
ALTER COLUMN required_date TYPE DATE
USING required_date::date;

ALTER TABLE orders
ALTER COLUMN shipped_date TYPE DATE
USING shipped_date::date;

-- Info:
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders'
  AND column_name IN ('order_date', 'required_date', 'shipped_date');


------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE products (
						product_id INT PRIMARY KEY,
						product_name TEXT,
						supplier_id INT,
						category_id INT,
						quantity_per_unit TEXT,
						unit_price FLOAT,
						units_in_stock INT,
						units_on_order INT,
						reorder_level INT,
						discontinued INT
);

COPY products(product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
FROM 'C:\Users\csv\northwind_data_clean-master\data\products.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM products;

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES categories(category_id);

ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE regions (
					region_id INT PRIMARY KEY,
					region_description TEXT
);

COPY regions(region_id, region_description)
FROM 'C:\Users\csv\northwind_data_clean-master\data\regions.csv'
DELIMITER ',' CSV HEADER;


SELECT * FROM regions;

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE shippers (
					shipper_id INT PRIMARY KEY,
					company_name TEXT,
					phone TEXT
);

COPY shippers(shipper_id, company_name, phone)
FROM 'C:\Users\csv\northwind_data_clean-master\data\shippers.csv'
DELIMITER ',' CSV HEADER;


SELECT * FROM shippers;

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE suppliers (
					supplier_id INT PRIMARY KEY,
					company_name TEXT,
					contact_name TEXT,
					contact_title TEXT,
					address TEXT,
					city TEXT,
					region TEXT,
					postal_code TEXT,
					country TEXT,
					phone TEXT,
					fax TEXT,
					home_page TEXT
);

COPY suppliers(supplier_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, home_page)
FROM 'C:\Users\csv\northwind_data_clean-master\data\suppliers.csv'
DELIMITER ',' CSV HEADER NULL 'NULL';


SELECT * FROM suppliers;

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE territories (
						territory_id INT PRIMARY KEY,
						territory_description TEXT,
						region_id INT
);

COPY territories(territory_id, territory_description, region_id)
FROM 'C:\Users\csv\northwind_data_clean-master\data\territories.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM territories;

ALTER TABLE territories
ADD CONSTRAINT fk_territories_regions
FOREIGN KEY (region_id)
REFERENCES regions(region_id);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------


-- FRAGESTELLUNGEN:


-- 1. Welche Produkte wurden im erfassten Zeitraum verkauft?

SELECT product_id, product_name
FROM products;


-- 2. Welche Produkte sind zum letzten Stand (06.05.1998) in welcher Menge auf Lager gewesen? (Bevor Northwind bankrott ging.)

SELECT * FROM products;


SELECT
	product_id,
	product_name,
	units_in_stock
FROM products;


-- 3. Welche sind die drei teuersten Produkte, welche die drei günstigsten?

SELECT
	product_id,
	product_name,
	unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 3;

SELECT
	product_id,
	product_name,
	unit_price
FROM products
ORDER BY unit_price ASC
LIMIT 3;


-- 4. Welche Produkte kosten über 21$?

SELECT
	product_id,
	product_name,
	unit_price
FROM products
WHERE unit_price > 21;


-- 5. Welche Produkte kosten zwischen 5$ und 15$?

SELECT
	product_id,
	product_name,
	unit_price
FROM products
WHERE unit_price BETWEEN 5 AND 15
ORDER BY ASC;


-- 6. Welche Produkte kosten weniger als der Durchschnitt?

SELECT
  AVG(unit_price) AS average_price
FROM products;

SELECT
	product_id,
	product_name,
	unit_price
FROM products
WHERE unit_price < (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;


-- 7. Wie viele Produkte wurden zum letzten Zeitpunkt verkauft und bei wie vielen wurde der Verkauf eingestellt?

SELECT * FROM order_details;
SELECT * FROM products;


SELECT COUNT(DISTINCT product_id) AS products_sold
FROM order_details;

SELECT COUNT(*) AS discontinued_products
FROM products
WHERE discontinued = 1;		-- DATUM????


-- 8. Welcher Kunde hat bisher am meisten gekauft?

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_details;


SELECT
	customer_id,
	company_name,
	SUM(unit_price * quantity * (1 - discount)) AS total	-- (1 - discount) = der zu zahlende Anteil, und nicht Rabatt!
FROM customers
JOIN orders USING (customer_id)
JOIN order_details USING (order_id)
GROUP BY customer_id
ORDER BY total DESC
LIMIT 1;


-- 9. In welchem Alter wurden die Mitarbeiter eingestellt (mit Namen, bitte)?

SELECT * FROM employees;


SELECT
	last_name,
	first_name,
	(hire_date - birth_date) / 365 AS age
FROM employees;

SELECT
  last_name,
  first_name,
  EXTRACT(YEAR FROM age(hire_date, birth_date)) AS age
FROM employees;


-- 10. Bei welchen Artikeln überstiegen zum letzten Betriebszeitpunkt die Bestellzahlen den Vorrat im Lager?

SELECT * FROM products;
SELECT * FROM order_details;

SELECT * FROM order_details
WHERE product_id = 48;


SELECT 
	product_id,
	product_name,
	units_in_stock,
	SUM(quantity) AS total_ordered
FROM products
JOIN order_details USING (product_id)
GROUP BY product_id, product_name, units_in_stock
HAVING SUM(quantity) > units_in_stock				-- HAVING: filtert nur die, bei denen die Bestellungen den Vorrat übersteigen.
ORDER BY total_ordered ASC;

SELECT
    product_name,
    units_in_stock,
    units_on_order,
    (units_in_stock - units_on_order) AS adjusted_stock
FROM products
WHERE (units_in_stock - units_on_order) < 0;


-- 11. Welcher Verkäufer (mit Namen) hat die meisten Geschäfte gemacht?
--		Welches Transportschiff kam dabei am meisten zum Einsatz?
--		Welche Kunden hat er beliefert (mit Namen) und welche Produkte haben sie erhalten?

SELECT 
	employee_id,
	first_name,
	last_name,
	COUNT(order_id) AS anzahl_geschaefte
FROM orders
JOIN employees USING (employee_id)
GROUP BY employee_id, first_name, last_name
ORDER BY anzahl_geschaefte DESC
LIMIT 1;


SELECT 
	company_name,
	COUNT(*) AS anzahl
FROM orders
JOIN shippers ON shippers.shipper_id = orders.ship_via
WHERE employee_id = (
  SELECT employee_id
  FROM orders
  GROUP BY employee_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
)
GROUP BY company_name
ORDER BY anzahl DESC
LIMIT 1;


SELECT 
	company_name,
	product_name
FROM orders
JOIN order_details USING (order_id)
JOIN customers USING (customer_id)
JOIN products USING (product_id)
WHERE employee_id = (
  SELECT employee_id
  FROM orders
  GROUP BY employee_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
)
ORDER BY company_name, product_name;


-- 12. Welcher Kunde hat die größte Menge eines Produkts bestellt (quantity) und welches Produkt war das?

SELECT * FROM customers;
SELECT * FROM order_details;
SELECT * FROM products;

SELECT
	company_name,
	quantity,
	product_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_details USING (order_id)
JOIN products USING (product_id)
ORDER BY quantity DESC
LIMIT 2;


-- 13. Gibt es interessante Veränderungen in den Jahren 1996, 1997 und 1998?

-- Ja, solche Veränderungen lassen sich gut analysieren – man kann z.B. schauen, wie sich Verkaufszahlen,
-- Umsätze oder Produktverfügbarkeit über die Jahre 1996, 1997 und 1998 verändert haben.

-- Umsatz pro Jahr:
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  ROUND(SUM(unit_price * quantity * (1 - discount))::NUMERIC, 2) AS total_sales		-- ROUND(..., 2) erwartet einen NUMERIC-Wert mit zwei Nachkommastellen.
FROM orders
JOIN order_details USING (order_id)
GROUP BY year
ORDER BY year;

-- Anzahl Bestellungen pro Jahr:
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  COUNT(*) AS total_orders
FROM orders
GROUP BY year
ORDER BY year;

-- Anzahl verkaufter Produkte pro Jahr:
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  SUM(quantity) AS total_quantity
FROM orders
JOIN order_details USING (order_id)
GROUP BY year
ORDER BY year;


-- Alle zusammen in einer Abfrage:
WITH sales_per_year AS (
  SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    ROUND(SUM(unit_price * quantity * (1 - discount))::NUMERIC, 2) AS total_sales
  FROM orders
  JOIN order_details USING (order_id)
  GROUP BY year
),
orders_per_year AS (
  SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    COUNT(*) AS total_orders
  FROM orders
  GROUP BY year
),
quantity_per_year AS (
  SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(quantity) AS total_quantity
  FROM orders
  JOIN order_details USING (order_id)
  GROUP BY year
)
SELECT 
  year,
  total_sales,
  total_orders,
  total_quantity
FROM sales_per_year
JOIN orders_per_year USING (year)
JOIN quantity_per_year USING (year)
ORDER BY year;

