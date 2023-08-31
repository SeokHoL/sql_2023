insert into orders VALUES(1, 1, 1, 6000, TO_DATE('2023-01-10','yyyy-mm-dd'));
insert into orders VALUES(2, 1, 3, 21000, TO_DATE('2023-07-03','yyyy-mm-dd'));
insert into orders VALUES(3, 2, 5, 8000, TO_DATE('2023-07-10','yyyy-mm-dd'));
insert into orders VALUES(4, 3, 6, 10000, TO_DATE('2023-08-10','yyyy-mm-dd'));
insert into orders VALUES(5, 4, 7, 9000, TO_DATE('2023-09-10','yyyy-mm-dd'));
insert into orders VALUES(6, 1, 2, 30000, TO_DATE('2023-10-10','yyyy-mm-dd'));
insert into orders VALUES(7, 4, 8, 5000, TO_DATE('2023-06-10','yyyy-mm-dd'));
insert into orders VALUES(8, 3, 10, 8000, TO_DATE('2023-07-27','yyyy-mm-dd'));
insert into orders VALUES(9, 2, 10, 10000, TO_DATE('2023-07-20','yyyy-mm-dd'));
insert into orders VALUES(10, 1, 1, 30000, TO_DATE('2023-08-20','yyyy-mm-dd'));


INSERT INTO imported_book VALUES(21, 'Zen Golf', 'Person', 12000);
INSERT INTO imported_book VALUES(22, 'Soccer Skills', 'Human Kinetics',15000);



SELECT publisher, price FROM book
where bookname like 'Ãà±¸ÀÇ¿ª»ç';

SELECT name, phone
FROM customer
where name ='±è¿¬¾Æ';

SELECT *
FROM customer
where name ='±è¿¬¾Æ';

SELECT custid , address, phone
FROM customer
where name ='¹ÚÁö¼º';

SELECT price, bookname
FROM book;

SELECT *
FROM book;

SELECT publisher
FROM book;

SELECT DISTINCT publisher
FROM book;

SELECT *
FROM book
where price < 10000;

SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM book
WHERE price >= 7000 AND price <=20000;

SELECT *
from book
where publisher in ('±Â½ºÆ÷Ã÷','³×ÀÌ¹öÀ¥Å÷');

--bookÅ×ÀÌºí¿¡¼­ ÃâÆÇ»ç°¡ 
select * from book
where publisher ='±Â½ºÆ÷Ã÷' or publisher= '´ëÇÑ¹Ìµð¾î';

SELECT *
FROM book
WHERE publisher not in ('e½ºÆ÷Ã÷','ÇØ³¿','¿õÁøÁö½ÄÇÏ¿ì½º');

select *
from book
where publisher <>'±Â½ºÆ÷Ã÷' and publisher <>'ÇØ³¿';

SELECT *
FROM book
WHERE bookname LIKE '%°úÇÐ%';

SELECT *
FROM book
WHERE bookname LIKE '%°úÇÐ';

SELECT *
FROM book
where bookname like '___ÀÇ%';




