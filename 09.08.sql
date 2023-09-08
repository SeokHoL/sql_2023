
--������ ������ ����� ���
SELECT name              --������ �̸�
FROM customer
MINUS
SELECT name             --������ �ֹ��� ��
FROM customer
WHERE custid IN(SELECT custid FROM orders);

--������ ������ ������� �������
SELECT name
FROM customer
WHERE custid not in(SELECT DISTINCT  custid FROM orders);

--EXISTS: ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.

--in������ ����Ѱ��
SELECT name,address
FROM customer
WHERE custid in(SELECT DISTINCT custid from orders);

--�������ΰ� �ߺ��� ������ ���
SELECT DISTINCT name,address FROM customer c, orders o
WHERE c.custid = o.custid;

--EXISTS ����Ѱ��
SELECT name, address FROM customer c
WHERE EXISTS(select * from orders o
                            WHERE c.custid = o.custid);
                            

--1�� �������� 5��
--�������� ������ ������ ���ǻ� ��
SELECT COUNT(distinct publisher) as "���ǻ� ��"
FROM customer, orders, book
WHERE (customer.custid = orders.custid) and (book.bookid =orders.bookid) and (customer.name='������');

--1�� �������� 6��
--�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
SELECT bookname, price, price-saleprice
FROM customer, orders, book
WHERE (customer.custid = orders.custid) AND(book.bookid=orders.bookid) AND (customer.name='������');



--1�� �������� 7��
--������ �������� ���� ������ �̸�
SELECT bookname FROM book,orders,customer
MINUS
SELECT bookname FROM book,orders,customer
WHERE (customer.custid=orders.custid) AND (book.bookid=orders.bookid) AND(customer.name='������');







--1�� �������� ���� �̸��� ���� ������ �������


--1�� ��������

SELECT * FROM book b, orders o
WHERE b.bookid = o.bookid
AND price-saleprice =(SELECT MAX(price-saleprice)
                            FROM book sb, orders so
                            WHERE sb.bookid = so.bookid);
                            


--DDL ����������   CREATE TABLE
--���̺� ��������
CREATE TABLE NewBook2(
bookid NUMBER,
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price NUMBER,
PRIMARY KEY (bookid)
);

CREATE TABLE NewBook3(
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price NUMBER
);

CREATE TABLE NewBook4(
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000),
PRIMARY KEY (bookname,publisher)
);




                                                            
