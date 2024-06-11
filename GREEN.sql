create table customers (
 customer_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50) not null, 
 last_name VARCHAR(50) not null,
 country VARCHAR(50),
 score INTEGER
);

-- insert customers data
Insert INTO customers (customer_id, first_name, last_name, country, score) VALUES 
(1, 'Maria', 'Cremer', 'Germany', 350),
(2, 'John', 'Steal', 'USA', 900),
(3, 'Georg', 'Pipps', 'UK', 750),
(4, 'Martin', 'Müller', 'Germany', 500),
(5, 'Peter', 'Franken', 'USA', null);

-- day-2
SELECT *
FROM customers 

SELECT 
first_name, 
country
FROM customers 


	-- create table orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id    SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date  DATE,
  quantity    INTEGER
);

-- Insert orders data
INSERT INTO orders (order_id, customer_id, order_date, quantity)VALUES
(1001, 1, '2021-01-11', 250),
(1002, 2, '2021-04-05', 1150),
(1003, 3, '2021-06-18', 500),
(1004, 6, '2021-08-31', 750);

SELECT *
FROM orders


-- create table employees
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  emp_id      SERIAL PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  emp_country VARCHAR(50),
  salary      INTEGER
);

-- Insert employees data
INSERT INTO employees (emp_id, first_name, last_name, emp_country, salary) VALUES
(1,'John', 'Steel', 'USA', 55000),
(2,'Ann', 'Labrune', 'France', 75000),
(3,'Marie', 'Bertrand', 'Brazil', 75000),
(4,'Georg', 'Afonso', 'UK', 75000),
(5,'Marie', 'Steel', 'UK', 75000);

SELECT *
FROM employees 


-- Distinct komutu

SELECT * FROM  customers  -- bütün ülkeleri getirdi

SELECT DISTINCT   -- tekrarları getirmeden ülkeleri getirir. UNIQUE olarak.
 country
 FROM customers
 
 
 
 -- Order by kullanımı: select dediğimizde sıralı gelmez. sıralamak için order by kullanmalıyız.
 
 SELECT * FROM customers
 
 ----------------------------
 
 SELECT *
 FROM customers
 ORDER BY score ASC  -- ASC yazmasak da çalışır, default'dur.
 
 -- PostgreSQL , NULL hücreyi en sona götürür. MySQL'de tam tersi çalışır.
 
 -- Null değerlerin en üste gelmesini istiyorsak; 
 
 SELECT *
 FROM customers
 ORDER BY score ASC NULLS FIRST -- demeliyiz.
 
 -----------------------------
 
 -- Customer tablosunu score değerlerine göre büyükten küçüğe sıralayarak getirme:
 
 SELECT * FROM customers 
 ORDER BY score DESC  
 
 -- burada null değeri en üste getirmek için:
 
  SELECT * FROM customers 
 ORDER BY score DESC NULLS LAST 
 
 
 --country ve score göre sıralama:
 
  SELECT * FROM customers 
 ORDER BY country ASC, score DESC  --countryleri kendi aralarında alfabetik dıralar ve ülkeleri kendi içinde score göre büyükten küçüğe sıralar.
 
 
 -- LIMIT Command: sınırlama koyar. 

SELECT * FROM customers
LIMIT 2 -- 2 kişiyi getirir.

-- OFFSET Command: mesela, ilk 2 kişiyi atlayıp, sonraki 2 kişiyi getirmek istersek kullanabiliriz.
 
SELECT * FROM customers
OFFSET 2  -- bazen sonuna ROW eklemek gerekebilir. -- 2 kişiyi atlamamızı sağladı bu.
LIMIT 2

-----------------------------------------------

--AS kullanımı: nick name vermek gibi düşün cicim

SELECT salary, salary*0.1 AS bonus -- bonus adında bi field oluşturdu (geçici) maaşı 0.1'le çarpıp yeni bi field oluşturduk. 
FROM employees e 


-------------------------------------------

-- WHERE Komutu: Datayı filtreler

-- sadece German müşterileri getir.

SELECT * FROM customers
WHERE country = 'Germany'


-- bütün müşterileri getir ama scorları 500'den büyük olsun

SELECT * FROM customers
WHERE score > 500


-- score değerleri 500'den küçük ya da eşitolan müşterileri getir.

SELECT * FROM customers
WHERE score <= 500


-- german olmayan (non-german) müşterileri getir.

SELECT * FROM customers
WHERE country != 'Germany'  -- WHERE country <> 'Germany' bunu da kabul eder.


-- AND operatörü:

-- score  400'den az ve germanyden gelen tüm customerları getir.

SELECT * FROM customers
WHERE score < 400 AND country = 'Germany'


SELECT * FROM customers c 


-- Score değeri 400'den küçük olmayanları getir (NOT örneği)
SELECT *
FROM customers c 
WHERE NOT score < 400


-- Between Operator
-- Belirtilen iki değer arasındakileri seçmek için kullanılır. Sınırlar dahildir.

-- Score değeri 100 ve 500 arasında olanları getir
SELECT *
FROM customers c 
WHERE score BETWEEN '100' AND '500'; 


-- Alternatif (Betweensiz)
SELECT *
FROM customers c 
WHERE score >= 100 AND score <= 500;


-- IN Operator
-- İçerisinde mi diye sorar ve True veya False döndürür.

-- id değeri 1,2,5 olan customerları getir.
SELECT *
FROM customers
WHERE customer_id IN (1,2,5);


-- LIKE Operator
-- Eğer içerisinde değer varsa true döndürür. % işaretleri kullanılır. %r% - __r% 

-- İsminin sonu 'n' harfiyle biten tüm customersları bulalım.
SELECT *
FROM customers
WHERE first_name LIKE '%n'
;

-- İsminin üçüncü pozisyonunda r olanları getir.
SELECT *
FROM customers
WHERE first_name LIKE '__r%'
;


-- İsmi m ile başlayanları  getir.
SELECT *
FROM customers
WHERE first_name LIKE 'M%'
;



-- GROUP BY
-- Bir sorguda ortaya çıkacak verileri belirli sütunlara göre gruplandırmak için kullanılır.


--Customerların toplam sayısını her ülke için bul
SELECT COUNT(*) AS total_customers, country 
FROM customers
GROUP BY country


-- DESC olarak sıralamak istersek.
SELECT COUNT(*) AS total_customers, country 
FROM customers
GROUP BY country
ORDER BY count(*) DESC


--AGGREGATE FUNCTIONS
--COUNT

SELECT * 
FROM customers


SELECT count(*) AS total_customers
FROM customers


SELECT count(score) AS total_score
FROM customers



--SUM
SELECT sum(quantity) AS sum_quantity
FROM orders o 


-- AVERAGE
SELECT AVG(score)
FROM customers c 


-- Eğer NULL hücreyi de hesaba kattırmak istersek COALESCE kullanırız;
SELECT AVG(COALESCE(score,0))  -- Score'daki NULL değerleri 0 olarak al demek.
FROM customers c 


-- MIN & MAX
SELECT MIN(score), MAX(score)
FROM customers c 

SELECT MIN(score), MAX(score)
FROM customers c 



SELECT MIN(order_date)
FROM orders o 

SELECT MAX(order_date)
FROM orders o 


-- 2. yol
SELECT order_date
FROM orders
ORDER BY order_date  DESC
LIMIT 1


-- STRING FUNCTIONS

-- CONCAT
--isim ve soyismi araya tire koyarak birleştiriniz
SELECT CONCAT(first_name, '-' , last_name) AS customer_name_surname
FROM customers c 

-- UPPER & LOWER
-- isim ve soyisimleri BÜYÜK ve küçük olarak değiştir.
SELECT UPPER(first_name), LOWER(last_name)
FROM customers c 

-- LENGHT
SELECT last_name,
length(last_name)
FROM customers c 

-- TRIM
SELECT 
	last_name,
	LENGTH(last_name),
	TRIM(last_name),
	LENGTH(TRIM(last_name))
FROM customers c 

-- SUBSTRING
SELECT last_name, SUBSTRING(last_name,2,3) AS kesilmis_last_name
FROM customers c 

-- GROUP BY and HAVING

SELECT 
	count(*) AS total_customers,
	country
FROM customers c
GROUP BY country 

-- Her bir ülke için en yüksek score'u getir
SELECT 
	country,
	MAX (score) AS max_score
FROM customers c
GROUP BY country 

-- HAVING
-- Group By sonuçlarını filtreler. (Where genel filtreler, having group by sonuçlarını filtreler)

--Soru: Her ülke için toplam müşteri sayısını bulup, sadece 1'den fazla olan sonuçları getir.

SELECT
	country,
	COUNT(*) AS total_customer
FROM customers c
GROUP BY country
HAVING count(*)>1;


-- INSERT Ornek

SELECT * FROM customers c;

INSERT INTO customers VALUES (6, 'Anne', 'Nixon', 'UK', NULL);

INSERT INTO customers 
	(customer_id,first_name, last_name)
VALUES ( 7, 'Max', 'Lang');


-- UPDATE
-- Tablodaki veriyi güncellemek için kullanılır. UPDATE - SET - WHERE kullanmak zorunludur.

-- Soru: Customer id'si 6 olan kişinin Country değerini 'Germany' yapınız.
UPDATE customers
SET country = 'Germany'
WHERE customer_id = 6;


SELECT * FROM customers c;

-- Soru: Max Lang isimli kişinin Country değerini 'UK' yapınız.
UPDATE customers 
SET country = 'UK'
WHERE first_name = 'Max';

-- Soru: Max Lang isimli kişinin Country değerini 'USA' yapıp score değerini 100 olarak güncelleyiniz.
UPDATE customers  
SET 
	country = 'USA', 
	score = 100
WHERE first_name = 'Max';


-- DELETE & TRUNCATE & DROP

/* 
 * DELETE: Tablodaki satırları silmek için kullanılır.
 * TRUNCATE: Tablodaki tüm satırları temizler.
 * DROP: Tabloyu tamamen siler.
 */ 

--Not: Update ve Delete işlemlerinde ID üzerinden koşul konulması best practice'dir.

-- SORU: Yeni eklenen Anne ve Max'i tablodan siliniz.
DELETE FROM customers
WHERE customer_id IN (6,7);



-- SORU: Tablodaki tüm customers'ları siliniz.
TRUNCATE TABLE customers;


-- SORU: customers tablosunu siliniz.
DROP TABLE customers;


/* ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS 
 * islemleri icin kullanilir.
   ALTER TABLE ifadesi tablolari yeniden isimlendirmek 
   (RENAME) icin de kullanilir. */
   
   
CREATE TABLE public.persons (
id SERIAL PRIMARY KEY,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL UNIQUE
);

-- ALTER TABLE

-- TASK: person tablosuna email diye bir field ekleyiniz.

ALTER TABLE persons 
ADD email varchar(15) NOT NULL;


-- persons tablosuna adress isimli bir field ekleyelim.
ALTER TABLE persons 
ADD adress varchar(50);

-- adress field'ını kaldırınız
ALTER TABLE persons
DROP adress;

-- persons tabloda phone field'ının veri tipini varchar(20) olarak düzenleyiniz.
ALTER TABLE persons
ALTER COLUMN phone TYPE varchar(20);

SELECT * FROM persons

-- persons tablasonun adını 'contact' olarak değiştirin.
ALTER TABLE persons
RENAME TO contacts;

SELECT * FROM contacts;

-- contacts tablosundaki phone field adını contact_number olarak değiştirin.
ALTER TABLE contacts
RENAME phone TO contact_number;


-- JOINS KONUSU
SELECT 
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id; 

/*
 * SELECT
 * *
 * *
 * *
 * *
 * FROM 1. TABLO
 * INNER JOIN 2. TABLO
 * ON 1. TABLO = 2. TABLO (Anahtar)
 */












