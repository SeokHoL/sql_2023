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
where bookname like '�౸�ǿ���';

SELECT name, phone
FROM customer
where name ='�迬��';

SELECT *
FROM customer
where name ='�迬��';

SELECT custid , address, phone
FROM customer
where name ='������';

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
where publisher in ('�½�����','���̹�����');

--book���̺��� ���ǻ簡 
select * from book
where publisher ='�½�����' or publisher= '���ѹ̵��';

SELECT *
FROM book
WHERE publisher not in ('e������','�س�','���������Ͽ콺');

select *
from book
where publisher <>'�½�����' and publisher <>'�س�';

SELECT *
FROM book
WHERE bookname LIKE '%����%';

SELECT *
FROM book
WHERE bookname LIKE '%����';

SELECT *
FROM book
where bookname like '___��%';




