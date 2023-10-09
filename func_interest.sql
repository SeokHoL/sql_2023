--사용자 정의 함수 만들기

create or replace function func_interest(price number)
                                            return int
is
    myInterest number;
begin
    if price >=30000 then myInterest :=price*0.1;
    else myInterest :=price*0.05;
    end if;
    return myInterest;
end;
