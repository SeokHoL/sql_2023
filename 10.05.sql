
--2 주문을 한 고객별 이름., 평균 구매가격을 구하시오.
SELECT cs.name,s                          
FROM (select custid,avg(saleprice)s
        FROM orders
        GROUP BY custid)od,customer cs
WHERE cs.custid =od.custid;


--3 custid가 3이하인 고객의 총 주문금액을 계산해라
SELECT SUM(saleprice)"total"     
FROM orders od
WHERE exists (select *
                from customer cs
                where custid <=3 and cs.custid = od.custid);

CREATE VIEW vm_customer
AS SELECT *
    FROM customer
    WHERE address LIKE '%대한민국%';
    
CREATE VIEW v_book
AS SELECT *   FROM book
WHERE bookname LIKE '%과학%';

--주소에 서울이라는 단어가 포함된 뷰를 생성하시오--
CREATE VIEW vm_customer
AS SELECT *
    FROM customer
    WHERE address LIKE '%서울%';
    
select * from vm_customer;

CREATE VIEW vm_orders(orderid,custid,name,bookid,bookname,saleprice, orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, o.bookname, o.saleprice, o.orderdate
    FROM orders o, customer c, book b
    WHERE o.custid = c.custid and o.bookid = b.bookid;
    
SELECT *FROM vm_orders;

SELECT orderid, bookname, saleprice 
FROM vm_orders
WHERE name='김연아';


CREATE OR REPLACE VIEW vm_customer(custid,name,address)
AS SELECT custid, name, address
    FROM customer
    WHERE address LIKE '%영국%';
    
select * from customer;
select * from vm_customer;

DROP VIEW vm_customer;


--1. 판매가격이 20,000원이상인 도서의 도서번호, 도서이름,고객이름,출판사,판매가격을 보여주는 highorders 뷰를 생성하시오.

CREATE VIEW highorders(도서번호,도서이름,고객이름,출판사,판매가격)
AS SELECT b.bookid,b.bookname,c.name,b.publisher,o.saleprice
    FROM book b,  customer c, orders o
    WHERE b.bookid=o.custid and o.custid =c.custid and o.saleprice >=20000;

--2 생성한뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문을 작성하시오.
SELECT 도서이름, 고객이름
FROM highorders;

--highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오.


exec insertbook(13,'스포츠과학','마당과학서적',25000);

select * from book;


