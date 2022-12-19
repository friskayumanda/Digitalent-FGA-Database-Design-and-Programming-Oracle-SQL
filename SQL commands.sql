CREATE TABLE customer
(customer_id VARCHAR2(20) CONSTRAINT g_loc_customer_id_nn NOT NULL,
c_name VARCHAR2(20) CONSTRAINT g_loc_c_name_nn NOT NULL, 
c_city VARCHAR(20),
discount NUMBER(10,2),
c_email VARCHAR2(20) UNIQUE CONSTRAINT g_loc_c_email_nn NOT NULL,
CONSTRAINT customer_customer_id_pk PRIMARY KEY(customer_id));

CREATE TABLE product 
(product_id VARCHAR2(20) CONSTRAINT g_loc_product_id_nn NOT NULL,
p_name VARCHAR(20),
quantity NUMBER(10) CONSTRAINT g_loc_quantity_nn NOT NULL,
price NUMBER(10,2) CONSTRAINT g_loc_price_nn NOT NULL,
CONSTRAINT product_product_id_pk PRIMARY KEY(product_id));

CREATE TABLE ordering 
(ordno VARCHAR2(20) CONSTRAINT g_loc_order_no_nn NOT NULL,
month DATE,
quantity NUMBER(10) CONSTRAINT g_loc_quantity_order_nn NOT NULL,
CONSTRAINT ordering_orderno_pk PRIMARY KEY(ordno),
customer_id VARCHAR(20) CONSTRAINT ordering_customer_id_fk
REFERENCES customer(customer_id),
product_id VARCHAR(20) CONSTRAINT ordering_product_id_fk
REFERENCES product(product_id));


INSERT INTO product(product_id, p_name, quantity, price) 
WITH p AS(
SELECT 'p01', 'pants', 20, 30.00 FROM dual UNION ALL 
SELECT 'p02', 't-shirt', 10, 15.50 FROM dual UNION ALL 
SELECT 'p03', 'shoes', 12, 35.00 FROM dual UNION ALL 
SELECT 'p04', 'jacket', 5, 50.00 FROM dual UNION ALL 
SELECT 'p05', 'glasses', 25, 70.75 FROM dual UNION ALL 
SELECT 'p06', 'brecelet', 50, 5.00 FROM dual UNION ALL 
SELECT 'p07', 'mask', 120, 1.50 FROM dual UNION ALL 
SELECT 'p08', 'bag', 12, 25.00 FROM dual UNION ALL 
SELECT 'p09', 'headphone', 30, 60.00 FROM dual UNION ALL 
SELECT 'p10', 'shirt', 50, 1.15 FROM dual UNION ALL 
SELECT 'p11', 'hat', 20, 10.99 FROM dual UNION ALL 
SELECT 'p12', 'shorts', 5, 20.25 FROM dual UNION ALL 
SELECT 'p13', 'earrings', 60, 35.50 FROM dual UNION ALL 
SELECT 'p14', 'earphone', 10, 30.00 FROM dual UNION ALL
SELECT 'p15', 'sunglass', 20, 1.50 FROM dual)
SELECT * FROM p;

--update price value of shirt
UPDATE product
SET price = 10.15, p_name ='shirt'
WHERE product_id = 'p10';
--update price value of shirt
UPDATE product
SET price = 40, p_name ='sunglass'
WHERE product_id = 'p15';

SELECT product_id, p_name, price FROM product WHERE price = 10.15 OR price = 40;

INSERT INTO customer (customer_id, c_name, c_city, discount, c_email) 
WITH c AS(
SELECT 'c001', 'Anisa', 'Jakarta Pusat', NULL, 'anisa@gmail.com' FROM dual UNION ALL 
SELECT 'c002', 'Bagus', 'Jakarta Selatan', NULL, 'bagus@gmail.com' FROM dual UNION ALL 
SELECT 'c003', 'Cita', 'Depok', 0.75, 'cita@gmail.com' FROM dual UNION ALL 
SELECT 'c004', 'Dika', 'Tangerang', NULL, 'dika@gmail.com' FROM dual UNION ALL 
SELECT 'c005', 'Fifi', 'Depok', NULL, 'fifi@gmail.com' FROM dual UNION ALL 
SELECT 'c006', 'Lili', 'Jakarta Selatan', 0.10, 'lili@gmail.com' FROM dual UNION ALL 
SELECT 'c007', 'Melina', 'Jakarta Timur', 0.40, 'melina@gmail.com' FROM dual UNION ALL 
SELECT 'c008', 'Nanda', 'Jakarta Selatan', 0.25, 'nanda@gmail.com' FROM dual UNION ALL 
SELECT 'c009', 'Gina', 'Tangerang', 1.00, 'gina@gmail.com' FROM dual UNION ALL 
SELECT 'c010', 'Helmi', 'Jakarta Pusat', 0.50, 'helmi@gmail.com' FROM dual UNION ALL 
SELECT 'c011', 'Iriana', 'Jakarta Selatan', 0.25, 'iriana@gmail.com' FROM dual UNION ALL 
SELECT 'c012', 'Jeremy', 'Jakarta Barat', NULL , 'jeremy@gmail.com' FROM dual UNION ALL 
SELECT 'c013', 'Kiara', 'Jakarta Selatan', NULL, 'kiara@gmail.com' FROM dual UNION ALL 
SELECT 'c014', 'Okta', 'Bekasi', 1.50, 'okta@gmail.com' FROM dual)
SELECT * FROM c;

SELECT * FROM customer

ALTER TABLE ordering
RENAME COLUMN month TO order_date;

INSERT INTO ordering (ordno, order_date, quantity, customer_id, product_id) 
WITH o AS(
SELECT 'ord001', TO_DATE('2022-01-01','YYYY-MM-DD'), 2, 'c010', 'p11' FROM dual UNION ALL
SELECT 'ord002', TO_DATE('2022-01-02','YYYY-MM-DD'), 4, 'c013', 'p15' FROM dual UNION ALL
SELECT 'ord003', TO_DATE('2022-01-05','YYYY-MM-DD'), 10, 'c003', 'p07' FROM dual UNION ALL
SELECT 'ord004', TO_DATE('2022-01-12','YYYY-MM-DD'), 1, 'c004', 'p11' FROM dual UNION ALL
SELECT 'ord005', TO_DATE('2022-01-20','YYYY-MM-DD'), 5, 'c009', 'p02' FROM dual UNION ALL
SELECT 'ord006', TO_DATE('2022-02-10','YYYY-MM-DD'), 2, 'c009', 'p13' FROM dual UNION ALL
SELECT 'ord007', TO_DATE('2022-02-12','YYYY-MM-DD'), 2, 'c012', 'p12' FROM dual UNION ALL
SELECT 'ord008', TO_DATE('2022-02-14','YYYY-MM-DD'), 5, 'c008', 'p07' FROM dual UNION ALL
SELECT 'ord009', TO_DATE('2022-02-26','YYYY-MM-DD'), 3, 'c010', 'p14' FROM dual UNION ALL
SELECT 'ord010', TO_DATE('2022-03-14','YYYY-MM-DD'), 6, 'c007', 'p07' FROM dual UNION ALL
SELECT 'ord011', TO_DATE('2022-03-25','YYYY-MM-DD'), 1, 'c005', 'p05' FROM dual UNION ALL
SELECT 'ord012', TO_DATE('2022-03-29','YYYY-MM-DD'), 2, 'c001', 'p07' FROM dual UNION ALL
SELECT 'ord013', TO_DATE('2022-04-07','YYYY-MM-DD'), 3, 'c010', 'p12' FROM dual UNION ALL
SELECT 'ord014', TO_DATE('2022-04-10','YYYY-MM-DD'), 6, 'c008', 'p02' FROM dual UNION ALL
SELECT 'ord015', TO_DATE('2022-04-15','YYYY-MM-DD'), 2, 'c006', 'p01' FROM dual UNION ALL
SELECT 'ord016', TO_DATE('2022-04-18','YYYY-MM-DD'), 4, 'c007', 'p10' FROM dual UNION ALL
SELECT 'ord017', TO_DATE('2022-04-24','YYYY-MM-DD'), 1, 'c003', 'p03' FROM dual UNION ALL
SELECT 'ord018', TO_DATE('2022-04-27','YYYY-MM-DD'), 2, 'c012', 'p14' FROM dual UNION ALL
SELECT 'ord019', TO_DATE('2022-04-28','YYYY-MM-DD'), 1, 'c008', 'p13' FROM dual UNION ALL
SELECT 'ord020', TO_DATE('2022-04-30','YYYY-MM-DD'), 1, 'c009', 'p04' FROM dual UNION ALL
SELECT 'ord021', TO_DATE('2022-05-02','YYYY-MM-DD'), 1, 'c001', 'p05' FROM dual UNION ALL
SELECT 'ord022', TO_DATE('2022-05-10','YYYY-MM-DD'), 2, 'c014', 'p10' FROM dual UNION ALL
SELECT 'ord023', TO_DATE('2022-05-18','YYYY-MM-DD'), 1, 'c004', 'p14' FROM dual UNION ALL
SELECT 'ord024', TO_DATE('2022-06-24','YYYY-MM-DD'), 1, 'c002', 'p08' FROM dual UNION ALL
SELECT 'ord025', TO_DATE('2022-07-20','YYYY-MM-DD'), 1, 'c011', 'p03' FROM dual UNION ALL
SELECT 'ord026', TO_DATE('2022-07-22','YYYY-MM-DD'), 2, 'c004', 'p03' FROM dual UNION ALL
SELECT 'ord027', TO_DATE('2022-07-26','YYYY-MM-DD'), 1, 'c011', 'p03' FROM dual UNION ALL
SELECT 'ord028', TO_DATE('2022-07-27','YYYY-MM-DD'), 2, 'c003', 'p08' FROM dual UNION ALL
SELECT 'ord029', TO_DATE('2022-07-30','YYYY-MM-DD'), 1, 'c009', 'p04' FROM dual UNION ALL
SELECT 'ord030', TO_DATE('2022-08-05','YYYY-MM-DD'), 2, 'c014', 'p09' FROM dual)
SELECT * FROM o;

SELECT * FROM ordering

SELECT c_name, c_email, c_city
FROM customer
WHERE c_city = 'Jakarta Selatan'
Order By c_name;


--CASE MANIPULATION (lower, upper, initcap)
SELECT LOWER(c_name), UPPER(c_name), INITCAP(c_name) FROM customer;

--CHARACTER MANIPULATION
--CONCAT
SELECT customer_id||' - '||c_name AS username FROM customer;

--SUBSTR
SELECT SUBSTR(c_name, 2, 5) FROM customer;

--LENGTH
SELECT p_name, LENGTH(p_name) FROM product;

--INSTR
SELECT INSTR('c007 - Melina', 'Mel') AS "Position Found" FROM DUAL;

--LPAD, RPAD
SELECT LPAD(c_name, 10, '*'), RPAD(c_name, 10, '*') FROM customer;

--TRIM
SELECT TRIM(' Anisa '), 
TRIM(LEADING 'c' FROM 'c001'), 
TRIM(TRAILING '1' FROM 'c001') FROM DUAL;

--REPLACE
SELECT ordno, REPLACE(ordno, '0'), 
REPLACE(ordno, '0', '*') FROM ordering;

--NUMBER FUNCTIONS (round, trunc, mod)
SELECT price, 
ROUND(price), TRUNC(price), MOD(price, 1) 
FROM product;


--DATE FUNCTIONS 
--ROUND, TRUNC
SELECT order_date, ROUND(TO_DATE(order_date),'MONTH') "Round Order Date", 
TRUNC(TO_DATE(order_date),'MONTH') "Trunc Order Date" FROM ordering;

--MONTHS_BETWEEN
SELECT ordno, product_id, quantity, customer_id, ROUND(MONTHS_BETWEEN(sysdate, 
order_date))||' Months Ago' "ORDERED" FROM ordering;

--ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 6) FROM DUAL;

--NEXT_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'saturday') "NEXT WEEKEND" FROM DUAL;

--LAST_DAY
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

--CONVERSION FUNCTIONS
--NUMBER TO CHARACTER
SELECT price, TO_CHAR(price, '$9999.9') FROM product;

--CHARACTER TO NUMBER
SELECT TO_NUMBER('$1,250.50', '$9,999.99') FROM DUAL;

--DATE TO CHARACTER
SELECT order_date, TO_CHAR(order_date, 'Day, Mon dd yyyy') FROM ordering;

--CHARACTER TO DATE
SELECT TO_DATE('August 17, 2022', 'Month dd, yyyy') FROM DUAL;

--NULL FUNCTIONS 
--NVL
SELECT c_name, discount, TO_CHAR(NVL (discount, 0), '$99.99') FROM customer;

--NVL2
SELECT c_name, discount, NVL2 (discount, 'With discount', 'Without Discount') AS 
"DISCOUNT" FROM customer;

--NULLIF
SELECT NULLIF(LENGTH(customer_id), LENGTH(product_id)), NULLIF(0.25, 0.25) FROM 
ordering;

--COALESCE
--Coalesce will return the first not null value in the parentheses
SELECT COALESCE(NULL, NULL, NULL, 'EXAMPLE', NULL, 'ANOTHER EXAMPLE') FROM DUAL;

--CONDITIONAL EXPRESSION
--DECODE
SELECT ordno, DECODE(mod(quantity, 2), 1, 'Odd', 0, 'Even') FROM ordering;

--CASE
SELECT customer_id, CASE 
WHEN quantity < 3 THEN 'low'
WHEN quantity > 3 AND quantity <= 5 THEN 'average'
WHEN quantity > 5 THEN 'high'
END order_amount
FROM ordering;


--JOIN PART I
--CROSS JOIN
SELECT customer_id, ordering.product_id, ordering.quantity, order_date
FROM product CROSS JOIN ordering
ORDER BY customer_id;

--NATURAL JOIN, JOIN ON, JOIN USING, INNER JOIN
SELECT * FROM customer NATURAL JOIN ordering;

--INNER JOIN WITH ON/USING
SELECT p.p_name, o.quantity, p.price, o.customer_id
FROM product p INNER JOIN ordering o
ON (p.product_id = o.product_id);

SELECT p.p_name, o.quantity, p.price, o.customer_id
FROM product p INNER JOIN ordering o
USING (product_id);

--SELF JOIN
SELECT DISTINCT p.p_name, p.price, a.customer_id "1stBuyer", 
b.customer_id "2ndBuyer", a.quantity AS "1stOrder", b.quantity AS "2ndOrder"
FROM ordering a INNER JOIN ordering b
ON(a.customer_id<>b.customer_id
AND a.product_id = b.product_id
AND a.order_date <> b.order_date)
INNER JOIN product p
ON(b.product_id=p.product_id)
ORDER BY a.customer_id;

--LEFT OUTER JOIN
SELECT p.product_id, p.p_name, p.price, o.quantity, o.order_date
FROM product p LEFT JOIN ordering o
ON(p.product_id = o.product_id)
WHERE price < 10
ORDER BY p.product_id;

--RIGHT OUTER JOIN
SELECT p.product_id, p.p_name, p.price, o.quantity, o.order_date
FROM product p RIGHT JOIN ordering o
ON(p.product_id = o.product_id)
WHERE price < 10
ORDER BY p.product_id;

--FULL OUTER JOIN
SELECT p.product_id, p.p_name, p.price, o.quantity, o.order_date
FROM product p FULL OUTER JOIN ordering o
ON(p.product_id = o.product_id)
WHERE price < 10
ORDER BY p.product_id;


--JOINS PART II
--EQUI JOIN
SELECT p.product_id, p.p_name, p.price, o.quantity, p.quantity, o.order_date
FROM product p INNER JOIN ordering o
ON(o.quantity = p.quantity)
ORDER BY p.product_id;

 NON EQUI JOIN
SELECT p.product_id, p.p_name, p.price, o.quantity, p.quantity, o.order_date
FROM product p INNER JOIN ordering o
ON(o.quantity < p.quantity)
WHERE order_date = '01-Jan-2022'
ORDER BY p.product_id;


--GROUP FUNCTION
--SUM
--Wants to know which types of product are the most ordered during 2 weeks before Eid Mubarak
SELECT c.c_name, p.p_name, SUM(o.quantity) AS Total_Ordered
FROM ordering o INNER JOIN product p
ON(o.product_id = p.product_id)
INNER JOIN customer c ON (o.customer_id = c.customer_id)
WHERE o.order_date BETWEEN '15-April-2022' AND '01-May-2022'
GROUP BY o.product_id, o.customer_id, p.p_name, c.c_name
ORDER BY Total_Ordered DESC;

--COUNT
SELECT COUNT(DISTINCT p.product_id) "Types of Products Available", COUNT(DISTINCT 
o.product_id) "Types of Products Ordered"
FROM product p CROSS JOIN ordering o;

--NVL, AVG
SELECT TO_CHAR(AVG(NVL(discount, 0)), '$99.99') AS "AVERAGE_DISCOUNT"
FROM customer;

--HAVING CLAUSE
--Wants to know the biggest quantity of order for each product type, with special condition: each product must had been ordered by at least more than one customers
SELECT product_id, MAX(quantity) AS MAX_QUANTITY
FROM ordering
GROUP BY product_id
HAVING COUNT(customer_id)>1
ORDER BY MAX_QUANTITY DESC;


--GROUP FUNCTIONS PART II
--ROLLUP
SELECT customer_id, product_id, SUM(quantity)
FROM ordering
GROUP BY ROLLUP (customer_id, product_id)
WHERE customer_id IN('c012', 'c013', 'c014');

--CUBE
SELECT customer_id, product_id, SUM(quantity)
FROM ordering
WHERE customer_id IN('c012', 'c013', 'c014');

--GROUPING SETS
SELECT ordno, customer_id, product_id, SUM(quantity)
FROM ordering 
WHERE customer_id IN('c012', 'c013', 'c014')
GROUP BY GROUPING SETS ((ordno, product_id),(customer_id, product_id),(customer_id, 
ordno));

--GROUPING FUNCTIONS
SELECT customer_id, product_id, SUM(quantity),
GROUPING(customer_id) AS "Customer Sub Total",
GROUPING(product_id) AS "Product Sub Total"
FROM ordering
WHERE customer_id IN('c012', 'c013', 'c014')
GROUP BY CUBE (customer_id, product_id);


--SUBQUERIES
--SINGLE ROW SUBQUERIES (FROM DIFFERENT TABLES)
SELECT customer_id, quantity, product_id
FROM ordering
WHERE customer_id = 
(SELECT customer_id FROM customer WHERE c_name = 'Fifi');

--MULTIPLE ROW SUBQUERIES 
SELECT customer_id, order_date, product_id, quantity
FROM ordering
WHERE(product_id,customer_id) IN
(SELECT product_id, customer_id FROM ordering WHERE quantity IN(2, 3));

--CORRELATED SUBQUERIES
WITH products AS
(SELECT DISTINCT product_id FROM ordering WHERE product_id IS NOT NULL)
SELECT p_name AS "Never ordered product"
FROM product
WHERE product_id NOT IN 
(SELECT * FROM products);


--VIEW
--CREATE VIEW
CREATE OR REPLACE VIEW view_products_ordered
("order_number", "customerID", "productID", "product_name", "ordered_quantity", 
"product_price")
AS SELECT o.ordno, o.customer_id, o.product_id, p.p_name, o.quantity, p.price
FROM ordering o JOIN product p
ON (o.product_id= p.product_id);

--SHOW VIEW TABLE
SELECT * FROM view_products_ordered;

--DROP VIEW
DROP VIEW view_products_ordered;

--TOP N ANALYSIS
SELECT ROWNUM as RANK, customer_id TOP_BUYER, quantity
FROM (SELECT customer_id, quantity
FROM ordering
ORDER BY quantity DESC)
WHERE ROWNUM <=5;


--SEQUENCE
--CREATE SEQUENCE
CREATE SEQUENCE supplier_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
NOCACHE
NOCYCLE;

--USING A SEQUENCE IN A TABLE
CREATE TABLE supplier
(supplier_id_seq NUMBER(4,0) CONSTRAINT supplier_id_seq_pk PRIMARY KEY,
supplier_name VARCHAR2(20),
location VARCHAR(20));

DESCRIBE TABLE supplier;

insert nextval and currval pseudocolumns into table rows
INSERT INTO supplier (supplier_id_seq, supplier_name, location)
VALUES(supplier_id_seq.CURRVAL, 'PT ABC', 'Bogor');
INSERT INTO supplier (supplier_id_seq, supplier_name, location)
VALUES(supplier_id_seq.NEXTVAL, 'PT XYZ', 'Tangerang');

SELECT * FROM supplier;

--MODIFYING A SEQUENCE
ALTER SEQUENCE supplier_id_seq
INCREMENT BY 1
MAXVALUE 500
NOCACHE
NOCYCLE;

--DROP A SEQUENCE
DROP SEQUENCE supplier_id_seq;


--INDEX 
--CREATE INDEX
CREATE INDEX customer_name_idx ON customer(c_name);

--DROP INDEX
DROP INDEX customer_name_idx;

--SYNONYM
--CREATE SYNONYM
CREATE SYNONYM buying FOR ordering;

--DROP SYNONIM
DROP SYNONYM buying
