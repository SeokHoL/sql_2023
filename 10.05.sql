
--2 �ֹ��� �� ���� �̸�., ��� ���Ű����� ���Ͻÿ�.
SELECT cs.name,s                          
FROM (select custid,avg(saleprice)s
        FROM orders
        GROUP BY custid)od,customer cs
WHERE cs.custid =od.custid;


--3 custid�� 3������ ���� �� �ֹ��ݾ��� ����ض�
SELECT SUM(saleprice)"total"     
FROM orders od
WHERE exists (select *
                from customer cs
                where custid <=3 and cs.custid = od.custid);

CREATE VIEW vm_customer
AS SELECT *
    FROM customer
    WHERE address LIKE '%���ѹα�%';
    
CREATE VIEW v_book
AS SELECT *   FROM book
WHERE bookname LIKE '%����%';

--�ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�--
CREATE VIEW vm_customer
AS SELECT *
    FROM customer
    WHERE address LIKE '%����%';
    
select * from vm_customer;

CREATE VIEW vm_orders(orderid,custid,name,bookid,bookname,saleprice, orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, o.bookname, o.saleprice, o.orderdate
    FROM orders o, customer c, book b
    WHERE o.custid = c.custid and o.bookid = b.bookid;
    
SELECT *FROM vm_orders;

SELECT orderid, bookname, saleprice 
FROM vm_orders
WHERE name='�迬��';


CREATE OR REPLACE VIEW vm_customer(custid,name,address)
AS SELECT custid, name, address
    FROM customer
    WHERE address LIKE '%����%';
    
select * from customer;
select * from vm_customer;

DROP VIEW vm_customer;


--1. �ǸŰ����� 20,000���̻��� ������ ������ȣ, �����̸�,���̸�,���ǻ�,�ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.

CREATE VIEW highorders(������ȣ,�����̸�,���̸�,���ǻ�,�ǸŰ���)
AS SELECT b.bookid,b.bookname,c.name,b.publisher,o.saleprice
    FROM book b,  customer c, orders o
    WHERE b.bookid=o.custid and o.custid =c.custid and o.saleprice >=20000;

--2 �����Ѻ並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT �����̸�, ���̸�
FROM highorders;

--highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�.


exec insertbook(13,'����������','������м���',25000);

select * from book;


