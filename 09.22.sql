SELECT ABS(-15) -- : ���밪
FROM DUAL;

SELECT ceil(15.7) -- '����'�� �ø�
FROM DUAL;

SELECT cos(3.14159) -- �ڻ��ΰ�
FROM dual;

SELECT (15.7) --����'�� ������
FROM dual;

SELECT log(10,100) --�ڿ��α�'�� ��ꡡ
FROM dual;

SELECT MOD(11,4) -- 11 % 4 = 3 '������ ���'
FROM dual;

SELECT power(3,2) --3��2�� '���� ���'
FROM dual;

SELECT round(15.7) --'����'�� �ݿø���
FROM dual;

SELECT sign(-15)  --��ȣ ��ȯ ����� 1, ������ -1
FROM dual;

SELECT trunc(15.7) --������ �ڸ������� ������
FROM dual;

SELECT CHR(67)  --�ƽ�Ű�ڵ尪�� ���ڷ� ��ȯ
FROM dual;

SELECT concat('HAPPY', 'Birthday') --'HAPPY','Birthday' �ΰ��� �̾���
FROM dual;

SELECT lower('Birthday') --���ڿ��� �ҹ��ڷ� �ٲ���
FROM dual;

SELECT lpad('page 1', 15 ,'*.') --Ư�� ���� ��ŭ ���ڸ� �����ʿ� �ٿ��� �����
FROM dual;

SELECT ltrim('page 1','ae') -- ���ʺ��� �����ѹ��� ����
FROM dual;

SELECT replace('JACK','J','BL')  --���ڸ� ��ü��
FROM dual;

SELECT rpad('page 1',15,'*.') --Ư�����̸�ŭ ���ڸ� ���ʿ� �ٿ��� �����
FROM dual;

SELECT RTRIM('Page 1','ae')  --�����ʺ��� �����ѹ��� ����
FROM dual;

--���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�. (��, ��ȭ��ȣ�� ���� ���� ����ó �������� ����Ͻÿ�.)
SELECT name �̸�, phone ��ȭ��ȣ FROM customer;

SELECT name �̸�, nvl(phone,'����ó����') ��ȭ��ȣ FROM customer;

--����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ���̽ÿ�.
SELECT ROWNUM "����", custid, name, phone
FROM customer
WHERE rownum <=2;

--mybook ���̺����
CREATE table mybook(
    bookid number not null PRIMARY  key,
    price number 
);

--�������� ����
insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook(bookid) values(3);

select * from mybook;

--(1)
SELECT *        --mybook�� ��ä�� ��ȸ�Ѵ�
FROM mybook;

--(2)
SELECT bookid, nvl(price,0) --null�� 0���� �ٲ�
FROM mybook;

--(3)
SELECT *                   --��ü�� ������ �ٵ�  price�� null�ΰ͸�.
FROM mybook
WHERE price is null;

--(4)
SELECT *               --����
FROM mybook;
--where price-";

--(5)
SELECT bookid, price+100    -- �����߻�
FROM mybook;

--(6)
SELECT SUM(price), AVG(price), COUNT(*)  --�����߻�
FROM mybook
WHERE bookid >=4;

--(7)
SELECT COUNT(*), COUNT(price)        --��ü�హ�� , ������ü�హ��
FROM mybook;

--(9)
SELECT SUM(price), AVG(price)        --�����հ�, �������
FROM mybook;


--ROWNUM �� ���� ���� SQL���� ���Ͻÿ�.

--(1)
SELECT *          --��ü���� ������
FROM BOOK;

--(2)
SELECT *                   --5���� ���� ������
FROM book
WHERE rownum <=5;

--(3)
SELECT *                    --5�������� ������, price�� �������� ��������
FROM book
WHERE ROWNUM <=5
ORDER BY price;

--(4)
SELECT *
FROM (select * from book order by price)b      --5�������� ������. ���� book���̺��� ���ݿ����������� �������� 5������ �����ش�.
WHERE rownum <=5;

--(5)
select *                                     --3���� ������� ����.
from (select * from book where rownum <=5)b
order by price;

--(6)
select *                                       --3��,5�� �� ������� ����.
from(select * from book where rownum <=5 order by price)b;

--��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
SELECT orderid, saleprice
FROM orders
WHERE saleprice <=(select avg(saleprice)
                    from orders);
                    
                    
--�� ���� ����ֹ��ݾ׺��� ū �ݾ��� �ֹ������� ���ؼ� �ֹ���ȣ,����ȣ,�ݾ��� ���̽ÿ�.
SELECT orderid, custid, saleprice
FROM orders md
WHERE saleprice > (select avg(saleprice) from orders so where md.custid = so.custid);

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
SELECT sum(saleprice) ���Ǹűݾ�
FROM orders
WHERE custid IN(select custid from customer where address like '%����%');

--���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
SELECT sum(saleprice) ���Ǹűݾ�
FROM orders
WHERE custid NOT IN(select custid from customer where address like '%����%');

--3��  ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
SELECT orderid, saleprice
FROM orders
WHERE saleprice > all(select saleprice from orders where custid=3);

--EXISTS �����ڸ� ����Ͽ� '����'�� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
SELECT SUM(saleprice) ���Ǹž�
FROM orders od
WHERE exists (select * from customer cs where address like '%����%' and cs.custid =od.custid);

--���缭���� ���� �Ǹž��� ���̽ÿ�(����� ���̸��� ���� �Ǹž��� ���).
SELECT (select name
        from customer cs
        where cs.custid =  od.custid) ���̸�, sum(saleprice) �հ�
FROM orders od
GROUP BY od.custid;

--�ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid= o.bookid);

--����ȣ�� 2������ ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǿ־� ���)
SELECT custid ����ȣ, name �̸� from customer
where custid <=2;

--����ȣ�� 2������ ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǿ־� ���)
select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
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