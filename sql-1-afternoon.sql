-- PERSON -------------------------------------------------------------------------

-- 1
CREATE TABLE person(
    id SERIAL PRIMARY KEY,
    person_name TEXT NOT NULL,
    age INTEGER,
    height VARCHAR(64),
    city TEXT NOT NULL,
    favorite_color TEXT NOT NULL
);

-- 2
INSERT INTO person (person_name, age, height, city, favorite_color)
VALUES
('Joely', 19, '157cm', 'Ventura', 'Red'),
('Lisa', 56, '162cm', 'Elizabeth', 'Teal'),
('Wyatt', 16, '175cm', 'Thousand Oaks', 'Orange'),
('Lon', 46, '175cm', 'Detroit', 'Blue'),
('Big Bird', 50, '250cm', 'Sesame Street', 'Yellow');

--3
SELECT * FROM person
ORDER BY height DESC;

--4
SELECT * FROM person
ORDER BY height;

--5
SELECT * FROM person
ORDER BY age DESC;

--6
SELECT * FROM person
WHERE age > 20;

--7
SELECT * FROM person
WHERE age = 18;

--8
SELECT * FROM person
WHERE age < 20 OR age > 30;

--9
SELECT * FROM person
WHERE age != 27;

--10
SELECT * FROM person
WHERE favorite_color != 'Red';

--11
SELECT * FROM person
WHERE favorite_color != 'Red' AND favorite_color != 'Blue';

--12
SELECT * FROM person
WHERE favorite_color = 'Orange' OR favorite_color = 'Green';

--13
SELECT * FROM person
WHERE favorite_color IN ('Orange','Green','Blue');

--14
SELECT * FROM person
WHERE favorite_color IN ('Yellow','Purple');

-- ORDERS -------------------------------------------------------------------------

--1
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL REFERENCES person(id),
    product_name TEXT NOT NULL,
    product_price INTEGER NOT NULL,
    quantity INTEGER NOT NULL
);

--2
INSERT INTO orders (person_id, product_name, product_price, quantity)
VALUES
( 1, 'Music CD', 6, 2),
( 2, 'Used Book', 5, 1),
( 3, 'Fancy Pens', 3, 4),
( 4, 'Pants', 10, 3),
( 5, 'Crayons', 7, 1);

--3
SELECT * FROM orders;

--4
SELECT SUM(quantity) FROM orders;

--5
SELECT SUM(product_price * quantity) FROM orders;

--6
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 1;

-- ARTIST -------------------------------------------------------------------------

--1
INSERT INTO artist (name)
VALUES
('Slipknot'),
('Korn'),
('Avenged Sevenfold');

--2
SELECT * FROM artist
ORDER BY name DESC
LIMIT 10;

--3
SELECT * FROM artist
ORDER BY name
LIMIT 5;

--4
SELECT * FROM artist
WHERE artist ILIKE 'Black%';

--5
SELECT * FROM artist
WHERE artist ILIKE '%Black%';

-- EMPLOYEE -----------------------------------------------------------------------

--1
SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';

--2
SELECT MAX(birth_date) FROM employee

--3
SELECT MIN(birth_date) FROM employee;

--4
SELECT * FROM employee
WHERE reports_to = 2;

--5
SELECT COUNT(*) FROM employee
WHERE city = 'Lethbridge';

-- INVOICE ------------------------------------------------------------------------

--1
SELECT COUNT(*) FROM invoice
WHERE billing_country = 'USA';

--2
SELECT MAX(total) FROM invoice;

--3
SELECT MIN(total) FROM invoice;

--4
SELECT * FROM invoice
WHERE total > 5;

--5
SELECt * FROM invoice
WHERE total < 5;

--6
SELECT COUNT(*) FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ');

--7
SELECT AVG(total) FROM invoice;

--8
SELECT SUM(total) FROM invoice;

-- --------------------------------------------------------------------------------