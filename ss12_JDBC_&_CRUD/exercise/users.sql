create database if not exists demo_2;
use demo_2;

create table users(
id  int primary key auto_increment,
 name varchar(120),
 email varchar(220),
 country varchar(120)
);


insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');