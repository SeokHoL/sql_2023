create or replace procedure insertCustomer(
    myCustID in number,
    myName in varchar2,
    myAddress in varchar2,
    myPhone in number)
as
begin
    insert into customer(custid,name,address,phone)
    values(myCustID,myName,myAddress,myPhone);
end;

exec insertCustomer(6,'��Ƽ���⽺','���ð�����','02-4567-8971');
exec insertCustomer(7,'��������','MS������','031-4889-8971');
select * from customer;