create table bord(num int not null auto_increment, id varchar2(20) not null, name varchar2(10) not null,
subject varchar2(100) not null, content text not null, regist_day varchar2(30), hit int, ip varchar2(20),
PRIMARY KEY (num));