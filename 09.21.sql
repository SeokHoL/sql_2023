--1 �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�

SELECT DISTINCT name
FROM customer JOIN orders
ON customer.custid = orders.custid
WHERE bookid IN (SELECT bookid
FROM book
WHERE customer.name NOT LIKE '������' AND
publisher IN(
            SELECT publisher
            FROM orders JOIN book
            ON orders.bookid = book.bookid
            WHERE orders.custid = (
            SELECT custid
            FROM customer
            WHERE name LIKE '������')
            
));



--�������� ������ ������ ���ǻ��̸��� ����Ͻÿ�.
SELECT publisher FROM customer cs, orders os, book bs
WHERE cs.custid = os.custid and os.bookid = bs.bookid
AND name LIKE '������';

--1 �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name FROM customer cs, orders os, book bs
WHERE cs.custid = os.custid and os.bookid = bs.bookid
AND name NOT LIKE '������'
AND publisher IN(
                SELECT publisher FROM customer cs, orders os, book bs
                WHERE cs.custid = os.custid and os.bookid = bs.bookid
                AND name LIKE '������'
);


--2 �ΰ� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name FROM customer cm
WHERE (SELECT count(DISTINCT publisher) FROM customer c, orders o, book b
WHERE c.custid = o.custid AND o.bookid = b.bookid
AND name LIKE cm.name) >=2;

--���� 30% �̻��� ������ �������� ����Ͻÿ�.

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

--1 ���ο� ����('������ ����','���ѹ̵��',10000��)�� ���缭���� �԰�Ǿ���. ������ �ȵ�Ǥ� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�.

INSERT INTO book(bookid, bookname, publisher, price) VALUES(11,'������ ����', '���ѹ̵��',10000);

--2'¯��;���� ������ ������ �����Ͻÿ�.
DELETE FROM book
WHERE publisher ='¯��';

-- ���Ἲ ��������(C##MADANG.SYS_C008318)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- ���� '¯��'���ǻ��� ���������� ������ �� ����.
SELECT * FROM book;

--4 ���ǻ� '���ѹ̵��' �� ���� �������ǻ�� �̸��� �ٲټ���
 UPDATE book
 SET publisher ='�������ѻ�'
 WHERE publisher ='���ѹ̵��';
 
 SELECT abs(-78), abs(+78)
 FROM dual;

SELECT round(4.875,1)
FROM dual;

SELECT custid "����ȣ", round(SUM(saleprice)/COUNT(*),-2)"��ձݾ�"
FROM orders
GROUP BY custid;


SELECT bookid, replace(bookname, '����', '��') bookname, publisher, price
FROM book;

SELECT bookname "����", length(bookname) "���ڼ�",
        lengthb(bookname) "����Ʈ ��"
FROM book
WHERE publisher ='�½�����';

SELECT substr(name,1,1) "��", count(*) "�ο�"
FROM customer
GROUP BY substr(name,1,1);

--���缭���� �ֹ��Ϸκ��� 10���� ������ Ȯ���Ѵ�. �ֹ���ȣ,�ֹ���,�ֹ�Ȯ������ ���Ͻÿ�
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate + 10 "Ȯ��"
FROM orders order by orderid;

--2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�
--��, �ֹ����� "yyyy�� mm�� dd�Ϸ�"�� ���� format���� ǥ�� �Ͻÿ�.

SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", custid "����ȣ", bookid "������ȣ"
FROM orders
WHERE orderdate = TO_DATE('20230828', 'yyyymmdd');

--2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, ������ȣ�� ��� ����Ͻÿ�
SELECT o.orderid "�ֹ���ȣ", o.orderdate "�ֹ���",  o.bookid "������ȣ", c.name "����"
FROM orders o
join customer c on o.custid = c.cutid
WHERE orderdate = TO_DATE('20230828', 'yyyymmdd') 


SELECT orderid "�ֹ���ȣ", to_char(orderdate,'yyyy-mm-dd') "�ֹ���", name ����, bookname ������
FROM orders o , customer c , book b
where c.custid = o.custid and b.bookid=o.bookid
and orderdate = TO_DATE('20230828', 'yyyymmdd')

--DBMS ������ ������ ���� ��¥�� �ð�,������ Ȯ���Ͻÿ�
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1"
FROM dual;

