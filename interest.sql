create or replace procedure interest
as 
    myInterest numeric;
    price numeric;
    cursor interestCursor is select saleprice from orders;
    
begin
    myInterest :=0.0;
    open interestCursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%notfound;
        if price >=30000 then
            myInterest := myInterest + price*0.1;
        else
            myInterest := myInterest + price*0.05;
        end if;
    end loop;
    close interestCursor;
    dbms_output.put_line('전체 이익 금액 =' || myInterest);
end;

