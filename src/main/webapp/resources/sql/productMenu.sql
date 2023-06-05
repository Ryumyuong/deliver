create table productMenu ( 
    p_id varchar2(10) not null,
    p_name varchar2(20) not null,
    p_unitprice number(30,0),
    p_description varchar2(1000),
    p_condition varchar2(20),
    p_filename varchar2(30)     
) ;

select * from productMenu;