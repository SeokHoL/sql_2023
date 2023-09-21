--1 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

SELECT DISTINCT name
FROM customer JOIN orders
ON customer.custid = orders.custid
WHERE bookid IN (SELECT bookid
FROM book
WHERE customer.name NOT LIKE '박지성' AND
publisher IN(
            SELECT publisher
            FROM orders JOIN book
            ON orders.bookid = book.bookid
            WHERE orders.custid = (
            SELECT custid
            FROM customer
            WHERE name LIKE '박지성')
            
));



--박지성이 구매한 도서의 출판사이름을 출력하시오.
SELECT publisher FROM customer cs, orders os, book bs
WHERE cs.custid = os.custid and os.bookid = bs.bookid
AND name LIKE '박지성';

--1 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT name FROM customer cs, orders os, book bs
WHERE cs.custid = os.custid and os.bookid = bs.bookid
AND name NOT LIKE '박지성'
AND publisher IN(
                SELECT publisher FROM customer cs, orders os, book bs
                WHERE cs.custid = os.custid and os.bookid = bs.bookid
                AND name LIKE '박지성'
);


--2 두개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT name FROM customer cm
WHERE (SELECT count(DISTINCT publisher) FROM customer c, orders o, book b
WHERE c.custid = o.custid AND o.bookid = b.bookid
AND name LIKE cm.name) >=2;

--고객의 30% 이상이 구매한 도서명을 출력하시오.

SELECT bookname FROM book bm
WHERE (SELECT count(b,bookid) FROM book b, orders o
       WHERE b.bookid=o.bookid AND b.bookid = bm.bookid)
       >=(SELECT count(*) FROM customer)*0.3;
       
       
SELECT bm.bookname 
FROM book bm
WHERE (
    SELECT COUNT(b.bookid) 
    FROM book b, orders o 
    WHERE b.bookid = o.bookid AND b.bookid = bm.bookid
) >= (SELECT COUNT(*) FROM customer) * 0.3;

--1 새로운 도서('스포츠 세게','대한미디어',10000원)이 마당서점에 입고되었다. 삽입이 안디ㅗㄹ 경우 필요한 데이터가 더 있는지 찾아보시오.

INSERT INTO book(bookid, bookname, publisher, price) VALUES(11,'스포츠 세계', '대한미디어',10000);

--2'짱개;에서 출판한 도서를 삭제하시오.
DELETE FROM book
WHERE publisher ='짱개';

-- 무결성 제약조건(C##MADANG.SYS_C008318)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- 따라서 '짱개'출판사의 도서정보는 삭제할 수 없다.
SELECT * FROM book;

--4 출판사 '대한미디어' 를 대한 대한출판사로 이름을 바꾸세요
 UPDATE book
 SET publisher ='대한출한사'
 WHERE publisher ='대한미디어';
 
 SELECT abs(-78), abs(+78)
 FROM dual;

SELECT round(4.875,1)
FROM dual;

SELECT custid "고객번호", round(SUM(saleprice)/COUNT(*),-2)"평균금액"
FROM orders
GROUP BY custid;


SELECT bookid, replace(bookname, '과학', '농구') bookname, publisher, price
FROM book;

SELECT bookname "제목", length(bookname) "글자수",
        lengthb(bookname) "바이트 수"
FROM book
WHERE publisher ='굿스포츠';

SELECT substr(name,1,1) "성", count(*) "인원"
FROM customer
GROUP BY substr(name,1,1);

--마당서점은 주문일로부터 10일후 매출을 확정한다. 주문번호,주문일,주문확정일을 구하시오
SELECT orderid "주문번호", orderdate "주문일", orderdate + 10 "확정"
FROM orders order by orderid;

--2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오
--단, 주문일은 "yyyy년 mm월 dd일로"과 같은 format으로 표시 하시오.

SELECT orderid "주문번호", orderdate "주문일", custid "고객번호", bookid "도서번호"
FROM orders
WHERE orderdate = TO_DATE('20230828', 'yyyymmdd');

--2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객명, 도서번호를 모두 출력하시오
SELECT o.orderid "주문번호", o.orderdate "주문일",  o.bookid "도서번호", c.name "고객명"
FROM orders o
join customer c on o.custid = c.cutid
WHERE orderdate = TO_DATE('20230828', 'yyyymmdd') 


SELECT orderid "주문번호", to_char(orderdate,'yyyy-mm-dd') "주문일", name 고객명, bookname 도서명
FROM orders o , customer c , book b
where c.custid = o.custid and b.bookid=o.bookid
and orderdate = TO_DATE('20230828', 'yyyymmdd')

--DBMS 서버에 설절된 현재 날짜와 시간,요일을 확인하시오
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1"
FROM dual;

