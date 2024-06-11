/* Soru-1
"calisanlar" isimli bir Tablo olusturun. Icinde "id", "isim", "maas", "ise_baslama"  
field'lari olsun. "id" yi Primary Key yapin, "isim" i Unique, "maas" i Not Null yapın. 

"adresler" isminde baska bir tablo olusturun.Icinde "adres_id", "sokak", "cadde" ve 
"sehir" fieldlari olsun.  "adres_id" field'i ile Foreign Key oluşturun.
*/


--Not: PK ile FK aynı data tipinde olmalı.

CREATE TABLE calisanlar (
id serial PRIMARY KEY,
isim varchar(50) UNIQUE,
maas NUMERIC(10,2) NOT NULL,
ise_baslama date
);


CREATE TABLE adresler (
adres_id serial,
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY(adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');

SELECT * FROM calisanlar

---------------------------------------------------------

-- developers table create

CREATE TABLE developers(
id serial PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary REAL,
prog_lang varchar(20),
city varchar(50),
age int
);


INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Abdullah Berk','abdullah@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','btl@mail.com',4000,'C#','Bursa',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayse Gul','ayse@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ali Seker','ali@mail.com',4000,'C#','Ankara',29);

SELECT * FROM developers 

-------------------------------

-- developers tablosundan ekleme(id) sırasına göre ilk 3 kaydı getiriniz.

SELECT * FROM developers  
LIMIT 3;

-------------------------------

-- developers tablosundan ekleme sırasına göre ilk 2 kayıttan sonraki ilk 3 kayıtı getir.

SELECT * FROM developers 
OFFSET 2
LIMIT 3;

-- developers tablosundan maaşı en düşük ilk 3 kayıtı getir.

SELECT * FROM developers  
ORDER BY salary ASC -- kendi aralarında sıralamak için name eklenebilir.
LIMIT 3

-- developers tablosundan maaşı en yüksek 2. developerın tüm bilgilerini getir.

SELECT * FROM developers  
ORDER BY salary DESC 
OFFSET 1
LIMIT 1;

---------------------------------------

-- ALIAS Konusu: sadece raporlamada ismi değiştirir kalıcıdeğildir bebeğim

CREATE TABLE workers (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);


INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');


SELECT * FROM workers;


/* 1-calisan_id sutun ismini id olarak degistirelim
2-calisan_isim sutun ismini isim olarak degistirelim
3-workers olan tablo ismini w olarak degistirelim */


SELECT calisan_id AS id FROM workers -- raporlamada değiştirdik adını. geçici yani unutma. her şey gibiii.

SELECT calisan_isim AS isim FROM workers --AS kullanmadan da çalışır.

SELECT workers AS w FROM workers 

--------------------------------------------------------------------

CREATE TABLE calisanlar1(
id char(5),
isim varchar(50),
maas int,
ise_baslama date
);


INSERT INTO calisanlar1 VALUES('10002', 'Donatello' ,12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10003', null, 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10004', 'Donatello', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10006', 'Leonardo', null, '2019-04-12');
INSERT INTO calisanlar1 VALUES('10007', 'Raphael',null , '2018-04-14');
INSERT INTO calisanlar1 VALUES('', 'April', 2000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('', 'Ms.April', 2000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10002', 'Splinter' ,12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES( null, 'Fred' ,12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10010', 'Betty' ,12000, '2018-04-14');

SELECT * FROM calisanlar1



CREATE TABLE adresler1(
adres_id char(5),
sokak varchar(30),
cadde varchar(30),
sehir varchar(20)
);


INSERT INTO adresler1 VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler1 VALUES('10003','Kaya Sok', '50.Cad.','Ankara');
INSERT INTO adresler1 VALUES('10002','Taş Sok', '30.Cad.','Konya');
INSERT INTO adresler1 VALUES('10012','Taş Sok', '30.Cad.','Konya');
INSERT INTO adresler1 VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler1 VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');


SELECT * FROM adresler1;



----------

-- calisanlar1 tablosundan ismi "Donatello" olanların tüm bilgilerini gerir.

SELECT * FROM calisanlar1
WHERE isim = 'Donatello'

-- calisanlar1 tablosunda maaşı 5000'den fazlaolanların tüm bilgilerini getir.

SELECT * FROM calisanlar1
WHERE maas > 5000

-- calisanlar1 tablosunda maaşı 5000'den fazla olanların isim ve maaşlarını getir.

SELECT isim, maas
FROM calisanlar1
WHERE maas > 5000


----------------------

--adresler tablosunda sehiri 'Konya' ve adres_id'si 10002 olan kaydın tümverilerini getir

SELECT * FROM adresler1
WHERE sehir ='Konya'
AND adres_id ='10002'

-- sehiri konya veya bursa olan adreslerin cadde ve sehir bilgilerini getir.


SELECT * FROM adresler1
WHERE sehir ='Konya'
OR sehir ='Bursa'


-- Senaryo: "markalar" ve "calisanlar3" adında iki tablo oluşturun.

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

CREATE TABLE calisanlar3 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

--calisanlar3 tablosunda max maaş değerini bulunuz.
SELECT MAX(maas)
FROM calisanlar3 c 

--calisanlar3 tablosunda min maaş değerini bulunuz.
SELECT MIN(maas)
FROM calisanlar3 c 

--calisanlar3 tablosunda toplam maaş değerini bulunuz.
SELECT SUM(maas)
FROM calisanlar3 c 

--calisanlar3 tablosunda ortalama maaş değerini bulunuz.
SELECT ROUND(AVG(maas), 2) 
FROM calisanlar3 c 

--calisanlar3 tablosundaki kayıt sayısını bulunuz.
SELECT COUNT(*)
FROM calisanlar3

--calisanlar3 tablosunda maaşı 2500 olanların kayıt sayısını bulunuz.
SELECT COUNT(*)
FROM calisanlar3 c 
WHERE maas = 2500


-- TEACHERS tablosu oluşturalım

CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar(50),
age int,	
city varchar(20),
course_name varchar(20),
salary real	
);

INSERT INTO teachers VALUES(111,'AhmeT  ','  Han',35,'Istanbul','SpringMVC',5000);
INSERT INTO teachers VALUES(112,'Mehmet','Ran ',33,'Van','HTML',4000);
INSERT INTO teachers VALUES(113,' Bilal','Fan ',34,'Bursa','SQL',3000);
INSERT INTO teachers VALUES(114,'Celal',' San',30,'Bursa','Java',3000);
INSERT INTO teachers VALUES(115,'Deniz',' Can',30,'Istanbul','SQL',3500);
INSERT INTO teachers VALUES(116,'ekreM','Demir',36,'Istanbul','Java',4000.5);
INSERT INTO teachers VALUES(117,'Fatma','Celik',38,'Van','SpringBOOT',5550);
INSERT INTO teachers VALUES(118,'Hakan','Cetin',44,'Izmir','Java',3999.5);
INSERT INTO teachers VALUES(119,'mert','Cetin',32,'Izmir','HTML',2999.5);
INSERT INTO teachers VALUES(120,'Nilay','Cetin',32,'Izmir','CSS',2999.5);
INSERT INTO teachers VALUES(121,'Selma','Celik',40,'Ankara','SpringBOOT',5550);
INSERT INTO teachers VALUES(122,'fatiH','Can',32,'Ankara','HTML',2550.22);
INSERT INTO teachers VALUES(123,'Nihat','Keskin',32,'Izmir','CSS',3000.5);
INSERT INTO teachers VALUES(124,'Hasan','Temel',37,'Istanbul','S.Security',3000.5);

SELECT * FROM teachers;

-- SORU 1: 
--teachers tablosundaki tüm kayıtların firstname değerlerini büyük harfe,
--lastname değerlerini küçük harfe çevirerek,uzunlukları ile birlikte listeleyiniz.

SELECT
	UPPER(firstname) AS upper_firstname,
	LENGTH(firstname) AS len_firstname,
	LOWER(lastname) AS lower_lastname,
	LENGTH(lastname) AS len_lastname
FROM teachers t 


-- SORU 2:
--teachers tablosunda firstname ve lastname değerlerindeki başlangıç ve sondaki boşlukları kaldırınız.

SELECT 
	TRIM(firstname) AS clean_firstname , 
	TRIM(lastname) AS clean_lastname
FROM teachers t 

-- SORU 3:
--teachers tablosunda tüm kayıtların firstname değerlerini ilk harfini büyük diğerleri küçük harfe çevirerek görüntüleyiniz.


SELECT 
	firstname,
	initcap(firstname) AS baslangic_buyuk_firstname 
FROM teachers t 





CREATE TABLE manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;


-- Senaryo 1: manav tablosundaki tüm isimleri ve her bir isim için, toplam ürün miktarını görüntüleyiniz.*/

SELECT 
	isim, 
	SUM(urun_miktar)
FROM manav m
GROUP BY isim;


/* Senaryo 2: manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
Toplam ürün miktarına göre azalan olarak sıralayınız.*/

SELECT 
	isim,
	sum(urun_miktar)
FROM manav m 
GROUP BY isim
ORDER BY sum(urun_miktar) DESC;



-- Senaryo 3: Her bir ismin aldığı, her bir ürünün toplam miktarını, isme göre sıralı görüntüleyiniz.*/
-- Önce isime, sonra ürün adına göre 

SELECT 
	isim,
	urun_adi, 
	sum(urun_miktar)
FROM manav m 
GROUP BY isim, urun_adi
ORDER BY isim;


-- Senaryo 4: ürün adina göre, her bir ürünü alan toplam kişi sayısını gösteriniz.*/

SELECT  				  -- toplam denildiği için count
	urun_adi, 
	count(DISTINCT(isim)) -- DISTINCT ile UNIQUE olarak aldık isimleri, aynı isimleri saymasın diye.
FROM manav m 
GROUP BY urun_adi


-- Senaryo 5: Isme göre, alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz*/

SELECT 
	isim, 
	sum(urun_miktar),
	count(urun_adi) -- saymak denildiği için count
FROM manav m 
GROUP BY isim;



-- HAVING


CREATE TABLE personel (
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(678901245, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel p 


-- Senaryo 1: HEr bir şirketin MIN maas bilgisini, bilgi eğer 4000'den fazlaysa getirin.
SELECT 
	sirket,
	MIN(maas) AS minumum_maas
FROM personel p
GROUP BY sirket
HAVING MIN(maas) > 4000;

--Senaryo 2: Maaşı 4000 den fazla olan çalışanlarin sirketlerini bulduktan sonra, 
--bu sinirin ustunde olan MIN maas bilgisini her sirket icin görüntüleyiniz.*/

SELECT 
	sirket,
	MIN(maas)
FROM personel
WHERE maas > 4000
GROUP BY sirket

-- Senaryo 3: Eğer bir şehirde çalışan personel (id) sayısı 1'den çoksa,
-- sehir ismini ve personel sayısını veren sorgu yazınız.

SELECT
	sehir,
	COUNT(id) AS kisi_sayisi
FROM personel p 
GROUP BY sehir
HAVING COUNT(id) > 1






CREATE TABLE calisanlar4 (
id INT UNIQUE, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar4 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar4 VALUES(345678901, null, 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar4 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar4 VALUES(678901234, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(789012345, 'Fatma Yasa', null, 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(890123456, null, 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(901234567, 'Ali Han', null, 2500, 'Vakko');

SELECT * FROM calisanlar4;



-- UPDATE ÖRNEKLERİ

--Senaryo 1: calisanlar4 tablosunda id’si 123456789 olan çalışanın isyeri ismini 'Trendyol' olarak güncelleyiniz.*/

UPDATE calisanlar4  
SET isyeri = 'Trendyol'
WHERE id = 123456789;




--Senaryo 2: id’si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve sehrini 'Bursa' olarak güncelleyiniz.*/

UPDATE calisanlar4  
SET isim = 'Veli Yıldırım', sehir = 'Bursa'
WHERE id = 567890123;


SELECT * FROM markalar m 

-- Senaryo 3: markalar tablosundaki marka_id değeri 102’ye eşit veya büyük olanların marka_id’sini 2 ile çarparak değiştirin.*/

UPDATE markalar  
SET marka_id = marka_id * 2
WHERE marka_id >= 102;


-- Senaryo 4: markalar tablosundaki tüm markaların calisan_sayisi değerlerini marka_id ile toplayarak güncelleyiniz.*/

UPDATE markalar  
SET calisan_sayisi = marka_id + calisan_sayisi 
-- WHERE'e ihtiyaç yok, çünkü bir koşul bulunmuyor. Uyarı verir, onaylamak gerekir.


-- VACUUM komutu
/* PostgreSQL'de bir tablo veya veri silindiğinde disk 
 * alanını geri kazanmak istiyorsanız, VACUUM komutunu 
 * kullanabilirsiniz. VACUUM komutu silinen verilerin yer 
 * kaplamasını önler, boş alanı temizler ve veritabanındaki
 *  diğer işlemler için kullanılabilir hale getirir. 
-- Syntax: VACUUM FULL table_name;
-- MySQL de PURGE komutunmunu karşılığı


-- ALTER TABLE konusu

-- Senaryo 1: calisanlar4 tablosuna yas (int) seklinde yeni sutun ekleyiniz.*/


ALTER TABLE calisanlar4 
ADD yas int;


SELECT * FROM calisanlar4


-- Senaryo 2: calisanlar4 tablosuna remote (boolean) seklinde yeni sutun ekleyiniz. varsayılan olarak remote değeri TRUE olsun*

ALTER TABLE calisanlar4 
ADD remote boolean DEFAULT TRUE;


-- Senaryo 3: calisanlar4 tablosunda yas sutununu siliniz

ALTER TABLE calisanlar4 
DROP yas;

-- Senaryo 4: calisanlar4 tablosundaki maas sutununun data tipini real olarak güncelleyiniz.*/

ALTER TABLE calisanlar4 
ALTER COLUMN maas TYPE REAL;

-- Senaryo 9: calisanlar4tablosunda isim sütununa
--NOT NULL constrainti ekleyiniz. (edited) 

ALTER TABLE calisanlar4
ALTER COLUMN isim SET NOT NULL
-- NOT: NULL içeren fieldlar varsa izin vermez.

























