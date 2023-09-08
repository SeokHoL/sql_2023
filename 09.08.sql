
--차집합 연사자 사용한 경우
SELECT name              --모든고객의 이름
FROM customer
MINUS
SELECT name             --도서를 주문한 고객
FROM customer
WHERE custid IN(SELECT custid FROM orders);

--집합자 연산자 사용자지 않은경우
SELECT name
FROM customer
WHERE custid not in(SELECT DISTINCT  custid FROM orders);

--EXISTS: 서브쿼리의 결과가 존재하는 경우에 true
-- 주문이 있는 고객의 이름과 주소를 출력하시오.

--in연산자 사용한경우
SELECT name,address
FROM customer
WHERE custid in(SELECT DISTINCT custid from orders);

--동등조인과 중복행 제거한 경우
SELECT DISTINCT name,address FROM customer c, orders o
WHERE c.custid = o.custid;

--EXISTS 사용한경우
SELECT name, address FROM customer c
WHERE EXISTS(select * from orders o
                            WHERE c.custid = o.custid);
                            

--1장 연습문제 5번
--박지성이 구매한 도서의 출판사 수
SELECT COUNT(distinct publisher) as "출판사 수"
FROM customer, orders, book
WHERE (customer.custid = orders.custid) and (book.bookid =orders.bookid) and (customer.name='박지성');

--1장 연습문제 6번
--박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT bookname, price, price-saleprice
FROM customer, orders, book
WHERE (customer.custid = orders.custid) AND(book.bookid=orders.bookid) AND (customer.name='박지성');



--1장 연습문제 7번
--박지성 구매하지 않은 도서의 이름
SELECT bookname FROM book,orders,customer
MINUS
SELECT bookname FROM book,orders,customer
WHERE (customer.custid=orders.custid) AND (book.bookid=orders.bookid) AND(customer.name='박지성');







--1장 연습문제 고객의 이름과 고객이 구매한 도서목록


--1장 연습문제

SELECT * FROM book b, orders o
WHERE b.bookid = o.bookid
AND price-saleprice =(SELECT MAX(price-saleprice)
                            FROM book sb, orders so
                            WHERE sb.bookid = so.bookid);
                            


--DDL 데이터정의   CREATE TABLE
--테이블 생성연습
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




                                                            
