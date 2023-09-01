
SELECT *
FROM book
where bookname Like '%축구%' and price >=2000;

SELECT *
FROM book 
WHERE bookname LIKE '%과학%' AND price >=5000;

SELECT *
from book
WHERE publisher = '굿스포츠'  or publisher =  '어크로스';

SELECT *
FROM book
WHERE publisher in('굿스포츠', ',어크로스');

SELECT *
FROM book
ORDER BY bookid;

SELECT * FROM book order by price, bookname;

SELECT *
FROM book
ORDER BY price DESC, publisher ASC;



SELECT SUM(saleprice) as 총판매금액
FROM orders;

--orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오.

SELECT SUM(saleprice) as 총판매량
FROM orders
WHERE custid = 1;

--orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오.

SELECT SUM (saleprice) as 총판매금액,
    AVG(saleprice) as 판매액평균,
    MIN(saleprice) as 최저가격,
    MAX(saleprice) as 최고가격
FROM orders;

--orders 테이블에서 판매한 도서의 개수를 구하시오.
SELECT count(*)
FROM orders;

--orders 테이블에서 도ㅓ 가격이 13000원이상인 도서의 개수를 구하시오.
SELECT count(*)
FROM orders
WHERE saleprice >=13000;

--orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오.
SELECT count(*)
FROM orders
WHERE custid in( 1,3);

--orders 테이블에서 고객별 주문한 도서의 개수와 총합게를 구하시오.
SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM orders
GROUP BY custid
ORDER BY custid;

SELECT custid, count(*) as 도서수량
FROM orders
WHERE saleprice >=8000
GROUP BY custid
HAVING count(*) >=2;


----연습문제----

--도서번호가 1인 도서의 이름
SELECT bookname
FROM book
WHERE bookid =1;

--가격이 10,000원 이상인 도서의 이름
SELECT bookname
FROM book
WHERE price >=10000;

--박지성의 총구매액
SELECT SUM(saleprice)
FROM orders
WHERE custid = (SELECT custid
FROM customer
WHERE name = '박지성');

--박지성이 구매한 도서의 수
SELECT count(*) as 도서의수
FROM orders
WHERE custid = (SELECT custid
FROM customer
WHERE name = '박지성');

--마당서점 도서의 총수
SELECT count(*)
FROM book;

--마당서점에 도서를 출고하는 출판사의 총수
SELECT COUNT(DISTINCT publisher) as "출판사 총수"
FROM book;

--모든 고객의 이름, 주소
SELECT name, address
FROM customer;

-- 2020년 7월4일~7월7일 사이에 주문받은 도서의 주문번호
SELECT bookid
FROM orders
WHERE orderdate BETWEEN to_date('2020-07-04','YYYY-MM-DD') AND to_date('2020-07-07','YYYY-MM-DD');

-- 2020년 7월4일~7월7일 사이에 주문받은 도서를 제외한 도서의 주문번호
SELECT bookid
FROM orders
WHERE orderdate NOT BETWEEN to_date('2020-07-04','YYYY-MM-DD') AND to_date('2020-07-07','YYYY-MM-DD');

--성이 '김'씨인 고객의 이름과 주소
SELECT name,address
FROM customer
WHERE name LIKE '김%';

--성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT name,address
FROM customer
WHERE name LIKE '김%아';
