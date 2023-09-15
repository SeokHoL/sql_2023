--DDL:������ ���Ǿ�
--orderid(�⺻Ű), custid(not null, newcustomer custid �����ؤ� �ܷ�Ű, �ؼ����)
--bookid(no null, newbook1 bookid  �����ؼ� �ܷ�Ű, �ؼ����)
--saleprice
--orderdate(date��)

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


--Alter��
--�̹� ������ ���̺��� ������ ������ �� ���
--add(�߰�),drop(����),modify(����)

--������ newbook1 ���̺��� �����ϰ� �� ���̺� �ۼ�
CREATE TABLE NewBook1(
bookid NUMBER,
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price NUMBER);

-- isbn�÷��߰�
ALTER TABLE NewBook1
ADD isbn VARCHAR2(13);
-- isbn�÷��� �ڷ��� ����
ALTER TABLE NewBook1
MODIFY isbn NUMBER;

--isbn �÷�����
ALTER TABLE NewBook1 drop COLUMN isbn;

--bookname �÷��� varchar2(30) not null �������� ����
ALTER TABLE NewBook1 MODIFY bookname VARCHAR2(30) NOT NULL;

-- bookid �÷��� not null ��������
ALTER TABLE NewBook1 MODIFY bookid NUMBER NOT NULL;
-- bookid �÷��� �⺻Ű �߰�
ALTER TABLE NewBook1 
ADD PRIMARY KEY(bookid);

-- ���̺��� ����
DROP TABLE NewBook1;

--DMl(select, insert(�����ͻ���), update(�����ͼ���), delete(�����ͻ���)
--insert 1��: �Ӽ�����Ʈ�� ����

INSERT INTO book
VALUES(11, '����', '����å',12000);

--insert 2��:�Ӽ�(�÷�) ����Ʈ ���

INSERT INTO book(bookid,bookname,publisher,price)
VALUES(12,'���ӿ���������', '����å',8000);

--insert 3��:�÷��� ������ ����
INSERT INTO book(bookid, price, publisher, bookname)
VALUES(13, 28000, '���ڳ���', '���ǽ���' );  --����  �÷�(�Ӽ�)�� ���缭 ������ߵ�

--insert 4��: Ư�� �÷��� ���� ����
INSERT INTO book(bookid, price, bookname)
VALUES(14, 10000, '��ħ���');
 
 --���̺� ������ ���� �ٸ� ���̺��� �������� �����ϴ� ���
INSERT INTO  book(bookid, bookname, price, publisher)
SELECT bookid,bookname,price,publisher
from imported_book;

--update: �����͸� ����
SELECT * FROM customer;

UPDATE customer
set address ='���ѹα� �λ�'
where custid =5;

update customer
set address=(select address
            from customer
            where name ='�迬��')
where name='�ڼ���';

-- �ڼ��� ���� ��ȭ��ȣ�� �迬�� ���� ��ȭ��ȣ�� �����ϰ� �����Ͻÿ�.

update customer
set phone=(select phone
            from customer
            where name ='�迬��')
where name='�ڼ���';

--��� ���� �����Ͻÿ�
select * from orders;

delete from customer
where custid = 5;

rollback;
commit;

--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select name, publisher
from orders o, book b
where  
 

            