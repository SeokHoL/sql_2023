--DDL:데이터 정의어
--orderid(기본키), custid(not null, newcustomer custid 참조해ㅓ 외래키, 앤쇄삭제)
--bookid(no null, newbook1 bookid  참조해서 외래키, 앤쇄삭제)
--saleprice
--orderdate(date형)

CREATE TABLE NewCustomer(
custid NUMBER PRIMARY KEY,
name VARCHAR2(40),
address VARCHAR2(40),
phone VARCHAR2(30));




CREATE TABLE NewOrders(
orderid NUMBER,
custid NUMBER   NOT NULL,
bookid NUMBER   NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE,
FOREIGN KEY(bookid) REFERENCES NewBook3(bookid) ON DELETE CASCADE);


--Alter문
--이미 생성된 테이블의 구조를 변경할 때 사용
--add(추가),drop(삭제),modify(수정)

--기존의 newbook1 테이블을 삭제하고 새 테이블 작성
CREATE TABLE NewBook1(
bookid NUMBER,
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price NUMBER);

-- isbn컬럼추가
ALTER TABLE NewBook1
ADD isbn VARCHAR2(13);
-- isbn컬럼의 자료형 변경
ALTER TABLE NewBook1
MODIFY isbn NUMBER;

--isbn 컬럼삭제
ALTER TABLE NewBook1 drop COLUMN isbn;

--bookname 컬럼의 varchar2(30) not null 제약조건 변경
ALTER TABLE NewBook1 MODIFY bookname VARCHAR2(30) NOT NULL;

-- bookid 컬럼에 not null 제약조건
ALTER TABLE NewBook1 MODIFY bookid NUMBER NOT NULL;
-- bookid 컬럼의 기본키 추가
ALTER TABLE NewBook1 
ADD PRIMARY KEY(bookid);

-- 테이블을 삭제
DROP TABLE NewBook1;

--DMl(select, insert(데이터삽입), update(데이터수정), delete(데이터삭제)
--insert 1번: 속성리스트를 생략

INSERT INTO book
VALUES(11, '나무', '좋은책',12000);

--insert 2번:속성(컬럼) 리스트 명시

INSERT INTO book(bookid,bookname,publisher,price)
VALUES(12,'라임오렌지나무', '좋은책',8000);

--insert 3번:컬럼의 순서를 변경
INSERT INTO book(bookid, price, publisher, bookname)
VALUES(13, 28000, '부자나라', '부의습관' );  --값은  컬럼(속성)에 맞춰서 적어줘야됨

--insert 4번: 특정 컬럼의 값을 생략
INSERT INTO book(bookid, price, bookname)
VALUES(14, 10000, '아침명상');
 
 --테이블 구조가 같은 다른 테이블의 ㄷ이터행 삽입하는 방법
INSERT INTO  book(bookid, bookname, price, publisher)
SELECT bookid,bookname,price,publisher
from imported_book;

--update: 데이터를 변경
SELECT * FROM customer;

UPDATE customer
set address ='대한민국 부산'
where custid =5;

update customer
set address=(select address
            from customer
            where name ='김연아')
where name='박세리';

-- 박세리 고객의 전화번호를 김연아 고객의 전화번호와 동일하게 변경하시오.

update customer
set phone=(select phone
            from customer
            where name ='김연아')
where name='박세리';

--모든 고객을 삭제하시오
select * from orders;

delete from customer
where custid = 5;

rollback;
commit;

--박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select name, publisher
from orders o, book b
where  
 

            