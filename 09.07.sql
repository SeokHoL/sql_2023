--��������
--�������� ���̺��� �����Ҷ� Ư�� �÷��� ���� ���� ��鸸 �˻��Ҷ� ���

--���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
SELECT * FROM customer, orders
WHERE customer.custid = orders.custid;

--���� ���� �ֹ��� ���� �����͸� ��� ����ȣ������ ����Ͻÿ�
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid desc;

--���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT name,saleprice
FROM customer, orders
WHERE customer.custid=orders.custid;

--������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT name,SUM(saleprice) FROM customer, orders
WHERE customer.custid=orders.custid
GROUP BY customer.name
ORDER BY customer.name;

--���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
--3���� ���̺� ���� ��������
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid=orders.custid AND orders.bookid=book.bookid;
--ORDER BY name; --���̸������� �Ҷ�. ��������

--������ 16,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
--SELECT customer.name, book.bookname   --�߸��ȿ���
--FROM orders o, book b ,customer c
--WHERE c.custid = o.custid AND o.bookid = b.booki d AND b.price=16000;

SELECT c.name, b.bookname
FROM orders o, book b, customer c
WHERE c.custid = o.custid AND o.bookid = b.bookid AND b.price = 10000;

--�ܺ�����
--���������� �ϰԵǸ� ���� �������� �ʴ� ���� ���õ�����
--�ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�.

--������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
SELECT customer.name, saleprice
FROM customer LEFT OUTER JOIN orders ON customer.custid = orders.custid;

--��������
--main query���� �ִ� query

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

--������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);


SELECT name
FROM customer
WHERE custid IN(SELECT custid
                FROM  orders
                WHERE bookid IN(SELECT bookid
                                FROM book
                                WHERE publisher ='����'));
                                
                                
SELECT name
FROM customer c, orders o, book b
WHERE o.bookid = b.bookid AND o.custid = c.custid  AND b.publisher ='����';



