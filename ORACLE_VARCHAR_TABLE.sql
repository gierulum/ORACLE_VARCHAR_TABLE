

declare 
var_variables varchar2(100):= 'AAA,CCC';


cursor mgie is 
select id, name , note
from (
select 1 id, 'AAA' name, 'ADAM' note from dual
union  
select 2 id, 'BBB' name, 'NATALIA' note from  dual
union  
select 3 id, 'AAA' name, 'PETER' note from dual
union  
select 4 id, 'BBB' name, 'SYLWIA' note from dual
union  
select 5 id, 'AAA' name, 'MARTIN' note from dual)
where name in ( select trim(regexp_substr(aa,'[^,]+', 1, level) ) value
                from (select var_variables aa from dual)
                connect by regexp_substr(aa, '[^,]+', 1, level) is not null);
                
begin 
    for x in mgie loop
        
        dbms_output.put_line(x.note);
    end loop;
end;

                