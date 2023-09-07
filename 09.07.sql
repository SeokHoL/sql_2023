--동등조인
--여러개의 테이블을 연결할때 특정 컬럼의 값이 같은 행들만 검색할때 사용

--고객과 고객의 주문에 관한 데이터를 모두 출력하시오
SELECT * FROM customer, orders
WHERE customer.custid = orders.custid;

--고객과 고객의 주문에 관한 데이터를 모두 고객번호순으로 출력하시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid desc;

--고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT name,saleprice
FROM customer, orders
WHERE customer.custid=orders.custid;

--고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT name,SUM(saleprice) FROM customer, orders
WHERE customer.custid=orders.custid
GROUP BY customer.name
ORDER BY customer.name;

--고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
--3개의 테이블에 대한 동등조인
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid=orders.custid AND orders.bookid=book.bookid;
--ORDER BY name; --고객이름순으로 할때. 오름차순

--가격이 16,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
--SELECT customer.name, book.bookname   --잘못된예시
--FROM orders o, book b ,customer c
--WHERE c.custid = o.custid AND o.bookid = b.booki d AND b.price=16000;

SELECT c.name, b.bookname
FROM orders o, book b, customer c
WHERE c.custid = o.custid AND o.bookid = b.bookid AND b.price = 10000;

--외부조인
--동등조인을 하게되면 값이 동등하지 않는 행은 무시되지만
--외부조인을 하게되면 기준이 되는 테이블의 값이 동등하지 않은 데이터 행도 포함해서 출력해준다.

--도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT customer.name, saleprice
FROM customer LEFT OUTER JOIN orders ON customer.custid = orders.custid;

--서브쿼리
--main query내의 있는 query

SELECT MAX(price)
FROM book;

SELECT bookname
FROM book
WHERE price = 5000;

SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

SELECT bookname
FROM book
WHERE price = (SELECT Min(price) FROM book);

--도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);


SELECT name
FROM customer
WHERE custid IN(SELECT custid
                FROM  orders
                WHERE bookid IN(SELECT bookid
                                FROM book
                                WHERE publisher ='독일'));
                                
                                
SELECT name
FROM customer c, orders o, book b
WHERE o.bookid = b.bookid AND o.custid = c.custid  AND b.publisher ='독일';



