drop database if exists demo;
--  bước 1:

-- Tạo cơ sở dữ liệu demo
create database if not exists demo;
use demo;

-- bước 2:

-- Tạo bảng Products 
create table Products  (
 id  int primary key auto_increment,
 product_code  varchar(20),
 product_name  varchar(20),
 product_price  double,
 product_amount int,
 product_description varchar(30),
 product_status bit
);
-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into Products 
values(1,'SP1','EXCITER 150',45000,1,'XE VIP',1),
(2,'SP2','EXCITER 150',45000,1,'Iphone',1),
(3,'SP3','EXCITER 150',45000,1,'Xiaomi',1),
(4,'SP4','EXCITER 150',45000,1,'Samsung',1);

-- bước 3:

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_products_code on Products(
product_code
);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table Products add index i_products(
product_name,
product_price
);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select*from products where product_code = 'SP2';
explain select*from products where product_name = 'IPHONE 13' or product_price=45000;

-- bước 4:

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_products as select product_code, product_name, product_price, product_status from products;
-- Tiến hành sửa đổi view
update w_products set product_name = 'SUZUKI' where   product_code = 'SP1';
update products set product_name = 'xì po' where product_code = 'SP1';
-- Tiến hành xoá view
drop view w_products;

-- bước 5:

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure sp_product()
begin
select*from products;
end //
DELIMITER ;

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure sp_product1(in id int,code_  varchar(20),name_  varchar(20),price  double,amount int,description_ VARCHAR(30),status_ bit)
begin
insert into products value (id,code_,name_,price,amount,description_,status_);
end //
DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure sp_product2(in sp_id int)
begin
update products
set product_name = 'cong' where id = sp_id;
end //
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure sp_product3(in sp_id int)
begin
delete from products where id = sp_id;
end //
DELIMITER ;



