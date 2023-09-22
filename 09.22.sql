SELECT ABS(-15) -- : 절대값
FROM DUAL;

SELECT ceil(15.7) -- '정수'로 올림
FROM DUAL;

SELECT cos(3.14159) -- 코사인값
FROM dual;

SELECT (15.7) --정수'로 버림　
FROM dual;

SELECT log(10,100) --자연로그'값 계산　
FROM dual;

SELECT MOD(11,4) -- 11 % 4 = 3 '나머지 계산'
FROM dual;

SELECT power(3,2) --3의2승 '지수 계산'
FROM dual;

SELECT round(15.7) --'정수'로 반올림　
FROM dual;

SELECT sign(-15)  --부호 반환 양수면 1, 음수면 -1
FROM dual;

SELECT trunc(15.7) --지정한 자릿수에서 버림함
FROM dual;

SELECT CHR(67)  --아스키코드값을 문자로 변환
FROM dual;

SELECT concat('HAPPY', 'Birthday') --'HAPPY','Birthday' 두값을 이어줌
FROM dual;

SELECT lower('Birthday') --문자열을 소문자로 바꿔줌
FROM dual;

SELECT lpad('page 1', 15 ,'*.') --특정 길이 만큼 문자를 오른쪽에 붙여서 출력함
FROM dual;

SELECT ltrim('page 1','ae') -- 왼쪽부터 지정한문자 삭제
FROM dual;

SELECT replace('JACK','J','BL')  --문자를 교체함
FROM dual;

SELECT rpad('page 1',15,'*.') --특정길이만큼 문자를 왼쪽에 붙여서 출력함
FROM dual;

SELECT RTRIM('Page 1','ae')  --오른쪽부터 지정한문자 삭제
FROM dual;

--고객의 이름과 전화번호를 출력하시오. (단, 전화번호가 없는 고객은 연락처 없음으로 출력하시오.)
SELECT name 이름, phone 전화번호 FROM customer;

SELECT name 이름, nvl(phone,'연락처없음') 전화번호 FROM customer;

--고객목록에서 고객번호, 이름, 전화번호를 앞의 두명만 보이시오.
SELECT ROWNUM "순번", custid, name, phone
FROM customer
WHERE rownum <=2;

--mybook 테이블생성
CREATE table mybook(
    bookid number not null PRIMARY  key,
    price number 
);

--데이터행 삽입
insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook(bookid) values(3);

select * from mybook;

--(1)
SELECT *        --mybook에 전채행 조회한다
FROM mybook;

--(2)
SELECT bookid, nvl(price,0) --null을 0으로 바꿈
FROM mybook;

--(3)
SELECT *                   --전체를 보여줘 근데  price가 null인것만.
FROM mybook
WHERE price is null;

--(4)
SELECT *               --오류
FROM mybook;
--where price-";

--(5)
SELECT bookid, price+100    -- 오류발생
FROM mybook;

--(6)
SELECT SUM(price), AVG(price), COUNT(*)  --오류발생
FROM mybook
WHERE bookid >=4;

--(7)
SELECT COUNT(*), COUNT(price)        --전체행갯수 , 가격전체행갯수
FROM mybook;

--(9)
SELECT SUM(price), AVG(price)        --가격합계, 가격평균
FROM mybook;


--ROWNUM 에 관한 다음 SQL문에 답하시오.

--(1)
SELECT *          --전체행을 보여줌
FROM BOOK;

--(2)
SELECT *                   --5개의 행을 보여줌
FROM book
WHERE rownum <=5;

--(3)
SELECT *                    --5개의행을 보여줌, price를 기준으로 오름차순
FROM book
WHERE ROWNUM <=5
ORDER BY price;

--(4)
SELECT *
FROM (select * from book order by price)b      --5개의행을 보여줌. 먼저 book테이블에서 가격오름차순으로 정리한후 5개행을 보여준다.
WHERE rownum <=5;

--(5)
select *                                     --3번과 결과값이 같음.
from (select * from book where rownum <=5)b
order by price;

--(6)
select *                                       --3번,5번 과 결과값이 같음.
from(select * from book where rownum <=5 order by price)b;

--평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
SELECT orderid, saleprice
FROM orders
WHERE saleprice <=(select avg(saleprice)
                    from orders);
                    
                    
--각 고객의 평균주문금액보다 큰 금액의 주문내역에 대해서 주문번호,고객번호,금액을 보이시오.
SELECT orderid, custid, saleprice
FROM orders md
WHERE saleprice > (select avg(saleprice) from orders so where md.custid = so.custid);

--서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
SELECT sum(saleprice) 총판매금액
FROM orders
WHERE custid IN(select custid from customer where address like '%서울%');

--서울에 거주하지 않는 고객에게 판매한 도서의 총판매액을 구하시오.
SELECT sum(saleprice) 총판매금액
FROM orders
WHERE custid NOT IN(select custid from customer where address like '%서울%');

--3번  고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.
SELECT orderid, saleprice
FROM orders
WHERE saleprice > all(select saleprice from orders where custid=3);

--EXISTS 연산자를 사용하여 '서울'을 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
SELECT SUM(saleprice) 총판매액
FROM orders od
WHERE exists (select * from customer cs where address like '%서울%' and cs.custid =od.custid);

--마당서점의 고객별 판매액을 보이시오(결과는 고객이름과 고객별 판매액을 출력).
SELECT (select name
        from customer cs
        where cs.custid =  od.custid) 고객이름, sum(saleprice) 합계
FROM orders od
GROUP BY od.custid;

--주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid= o.bookid);

--고객번호가 2이하인 고객의 판매액을 보이시오(고객이름과 고객별 판애액 출력)
SELECT custid 고객번호, name 이름 from customer
where custid <=2;

--고객번호가 2이하인 고객의 판매액을 보이시오(고객이름과 고객별 판애액 출력)
select name 고객이름, sum(saleprice) 판매총액
from (SELECT custid , name  from customer
      where custid <=2) c, orders o
WHERE c.custid = o.custid
group by c.name;

--5.(1)
select custid,(select address                
                from customer cs
                where cs.custid = od.custid) "address",
                sum(saleprice)"total"
from orders od
group by od.custid;