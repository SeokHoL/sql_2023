
SELECT *
FROM book
where bookname Like '%�౸%' and price >=2000;

SELECT *
FROM book 
WHERE bookname LIKE '%����%' AND price >=5000;

SELECT *
from book
WHERE publisher = '�½�����'  or publisher =  '��ũ�ν�';

SELECT *
FROM book
WHERE publisher in('�½�����', ',��ũ�ν�');

SELECT *
FROM book
ORDER BY bookid;

SELECT * FROM book order by price, bookname;

SELECT *
FROM book
ORDER BY price DESC, publisher ASC;



SELECT SUM(saleprice) as ���Ǹűݾ�
FROM orders;

--orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.

SELECT SUM(saleprice) as ���Ǹŷ�
FROM orders
WHERE custid = 1;

--orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.

SELECT SUM (saleprice) as ���Ǹűݾ�,
    AVG(saleprice) as �Ǹž����,
    MIN(saleprice) as ��������,
    MAX(saleprice) as �ְ���
FROM orders;

--orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
SELECT count(*)
FROM orders;

--orders ���̺��� ���� ������ 13000���̻��� ������ ������ ���Ͻÿ�.
SELECT count(*)
FROM orders
WHERE saleprice >=13000;

--orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
SELECT count(*)
FROM orders
WHERE custid in( 1,3);

--orders ���̺��� ���� �ֹ��� ������ ������ ���հԸ� ���Ͻÿ�.
SELECT custid, COUNT(*) AS ��������, SUM(saleprice) AS �Ѿ�
FROM orders
GROUP BY custid
ORDER BY custid;

SELECT custid, count(*) as ��������
FROM orders
WHERE saleprice >=8000
GROUP BY custid
HAVING count(*) >=2;


----��������----

--������ȣ�� 1�� ������ �̸�
SELECT bookname
FROM book
WHERE bookid =1;

--������ 10,000�� �̻��� ������ �̸�
SELECT bookname
FROM book
WHERE price >=10000;

--�������� �ѱ��ž�
SELECT SUM(saleprice)
FROM orders
WHERE custid = (SELECT custid
FROM customer
WHERE name = '������');

--�������� ������ ������ ��
SELECT count(*) as �����Ǽ�
FROM orders
WHERE custid = (SELECT custid
FROM customer
WHERE name = '������');

--���缭�� ������ �Ѽ�
SELECT count(*)
FROM book;

--���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�
SELECT COUNT(DISTINCT publisher) as "���ǻ� �Ѽ�"
FROM book;

--��� ���� �̸�, �ּ�
SELECT name, address
FROM customer;

-- 2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ �ֹ���ȣ
SELECT bookid
FROM orders
WHERE orderdate BETWEEN to_date('2020-07-04','YYYY-MM-DD') AND to_date('2020-07-07','YYYY-MM-DD');

-- 2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
SELECT bookid
FROM orders
WHERE orderdate NOT BETWEEN to_date('2020-07-04','YYYY-MM-DD') AND to_date('2020-07-07','YYYY-MM-DD');

--���� '��'���� ���� �̸��� �ּ�
SELECT name,address
FROM customer
WHERE name LIKE '��%';

--���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
SELECT name,address
FROM customer
WHERE name LIKE '��%��';
