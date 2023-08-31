--도서정보 Book테이블
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--고객정보 Customer 테이블
create table Customer(
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

--주문정보 Orders 테이블

create table Orders(
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE

);

--수입도서정보 Imported_Book 테이블
create table Imported_Book(
    bookid NUMBER(2) ,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--Book 테이블 10권의 도서정보를 추가하세요
insert into Book values(1, '축구의역사', '굿스포츠',7000);
insert into Book values(2, '롤의역사', 'e스포츠', 10000);
insert into Book values(3, '삼국지', '짱개', 6000);
insert into Book values(4, '나폴레옹', '브띠프랑스', 8000);
insert into Book values(5, '노르망디상륙작전', '독일', 5000);
insert into Book values(6, '미생', '카카오웹툰', 10000);
insert into Book values(7, '헬퍼', '네이버웹툰', 9000);
insert into Book values(8, '외모지상주의', '네이버웹툰', 7000);
insert into Book values(9, '역행자', '웅진지식하우스', 10000);
insert into Book values(10, '도둑맞은 집중력', '웅진지식하우스', 10000);

--Customer 테이블에 고개정보 5명추가
insert into customer values(1, '박지성', '영국 맨처스터', '000-5000-001');
insert into customer values(2, '김연아', '서울 동작구 흑석동', '02-333-5555');
insert into customer values(3, '장미란', '서울 용산구 보광동', '02-555-7777');
insert into customer values(4, '추신수', '인천광역시 연수구', '032-233-5656');
insert into customer values(5, '박세리', '대전광역시 유성구', '042-322-1237');
