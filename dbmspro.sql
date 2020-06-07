DROP DATABASE dbms;
CREATE DATABASE dbms;

\c dbms


CREATE TABLE users(
  userid int PRIMARY KEY NOT NULL,
  uname varchar(50) UNIQUE NOT NULL
);

INSERT into users values(1,'Akshatha');
INSERT into users values(2,'Pallavi');
INSERT into users values(3,'Harshitha');
INSERT into users values(4,'Akshatha01');
INSERT into users values(5,'Sonu');
INSERT into users values(6,'Bhavana');
INSERT into users values(7,'Harish');
INSERT into users values(8,'Bhuvan');
INSERT into users values(9,'Akash');
INSERT into users values(10,'Shreya');




CREATE TABLE IF NOT EXISTS customer(
userid int NOT NULL,
cid int PRIMARY KEY  NOT NULL,
cname char(30) NOT NULL,
cmail char(30) NOT NULL,
ccity char(20) NOT NULL,
cdate DATE NOT NULL,
cpincode varchar NOT NULL,
cphoneno varchar NOT NULL,
FOREIGN KEY(userid) REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO customer values(1,111,'Akshatha','akshatha@gmail.com','Harihar','2020/03/15',577601,9632514569);
INSERT INTO customer values(2,112,'Pallavi','pallavi@gmail.com','Harihar','2020/02/10',577601,8563245698);
INSERT INTO customer values(3,113,'Harshitha','harshitha@gmail.com','Harihar','2020/01/01',577601,6325896412);
INSERT INTO customer values(4,114,'Akshatha01','akshi123@gmail.com','Davangere','2019/05/23',577602,7563256699);
INSERT INTO customer values(5,115,'Sonu','sonusakki@gmail.com','Davangere','2019/09/03',577602,6254866120);
INSERT INTO customer values(6,116,'Bhavana','bhavana@gmail.com','Hubli','2018/04/25',580029,9445213354);
INSERT INTO customer values(7,117,'Harish','harishnaik@gmail.com','Mysuru','2019/10/16',570026,9548112354);
INSERT INTO customer values(8,118,'Bhuvan','bhuvanbhuvi@gmail.com','Bengaluru','2018/06/26',560098,9875613341);
INSERT INTO customer values(9,119,'Akash','akashhnh@gmail.com','Bengaluru','2018/06/26',560085,7215468220);
INSERT INTO customer values(10,120,'Shreya','shreyasheetal@gmail.com','Bengaluru','2019/10/05',560085,8456213581);


CREATE TABLE address(
	cid int NOT NULL,	
	street varchar(50) NOT NULL,
	area varchar(50) NOT NULL,
	FOREIGN KEY(cid) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO address values(111,'1st main 1st cross','Keshav nagar');
INSERT INTO address values(112,'1st main 1st cross','K R nagar');
INSERT INTO address values(113,'1st main 1st cross','Vidya nagar');
INSERT INTO address values(114,'2nd stage','Vinob nagar');
INSERT INTO address values(115,'1st cross','Dev raj urs Layout');
INSERT INTO address values(116,'3rd cross','Deshpande nagar');
INSERT INTO address values(117,'2nd cross','CFTRI layout');
INSERT INTO address values(118,'1st cross','RR nagar');
INSERT INTO address values(119,'3rd main road','Ittamadu');
INSERT INTO address values(120,'3rd cross','Patel nagar');


CREATE TABLE IF NOT EXISTS orders(
cid INT NOT NULL,
status char(100) NOT NULL,
orderid int PRIMARY KEY NOT NULL,
dateofdelivery varchar NOT NULL,
quty int NOT NULL,
FOREIGN KEY(cid) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO orders values(111,'Not Delivered',101,'Pending',1);
INSERT INTO orders values(112,'Not Delivered',102,'Pending',1);
INSERT INTO orders values(113,'Delivered',103,'2020/02/01',1);
INSERT INTO orders values(114,'Delivered',104,'2019/06/23',2);
INSERT INTO orders values(115,'Delivered',105,'2019/10/03',1);
INSERT INTO orders values(116,'Delivered',106,'2018/05/25',1);
INSERT INTO orders values(117,'Delivered',107,'2019/11/16',2);
INSERT INTO orders values(118,'Delivered',108,'2018/08/26',1);
INSERT INTO orders values(119,'Delivered',109,'2018/07/26',1);
INSERT INTO orders values(120,'Delivered',110,'2019/11/05',1);


CREATE TABLE IF NOT EXISTS order_detail(
orderid INT NOT NULL,
quantity int NOT NULL,
price decimal(10,2) NOT NULL,
FOREIGN KEY(orderid) REFERENCES orders ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO order_detail values(101,1,1500.00);
INSERT INTO order_detail values(102,1,500.00);
INSERT INTO order_detail values(103,1,2500.00);
INSERT INTO order_detail values(104,2,4000.00);
INSERT INTO order_detail values(105,1,600.00);
INSERT INTO order_detail values(106,1,999.00);
INSERT INTO order_detail values(107,2,6000.00);
INSERT INTO order_detail values(108,1,3000.00);
INSERT INTO order_detail values(109,1,300.00);
INSERT INTO order_detail values(110,1,900.00);


CREATE TABLE IF NOT EXISTS product(
orderid int NOT NULL,
pid int PRIMARY KEY NOT NULL,
pname varchar(100) NOT NULL,
pcategory varchar(100) NOT NULL,
psubcategory varchar(100) NOT NULL,
pquantity int NOT NULL,
datep DATE NOT NULL,
FOREIGN KEY(orderid) REFERENCES orders ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO product values(101,1111,'Hair straightner','Women','Accessories',1,'2020/03/15');
INSERT INTO product values(102,1112,'Top','Women','Clothes',1,'2020/02/10');
INSERT INTO product values(103,1113,'Bag','Women','Accessories',1,'2020/01/01');
INSERT INTO product values(104,1114,'Bluetooth speaker','Electronics','Audio Equipment',2,'2019/05/23');
INSERT INTO product values(105,1115,'Shoes','Women','Footwear',1,'2019/09/03');
INSERT INTO product values(106,1116,'Makeup kit','Women','Accessories',1,'2018/04/25');
INSERT INTO product values(107,1117,'Watch','Men','Accessories',2,'2019/10/16');
INSERT INTO product values(108,1118,'Watch','Women','Accessories',1,'2018/06/26');
INSERT INTO product values(109,1119,'Perfume','Men','Accessories',1,'2018/06/26');
INSERT INTO product values(110,1120,'Trimmer','Men','Accessories',1,'2019/10/05');



CREATE TABLE IF NOT EXISTS product_detail(
pid int NOT NULL,
pname varchar(100) NOT NULL,
description varchar(300) NOT NULL,
brand varchar(30) NOT NULL,
pprice decimal(10,2) NOT NULL,
FOREIGN KEY(pid) REFERENCES product ON DELETE CASCADE ON UPDATE CASCADE
);    


INSERT INTO product_detail values(1111,'Hair straightner','length : 22cm','brand : Philips',1500.00);
INSERT INTO product_detail values(1112,'Top','color : blue','brand : levis',500.00);
INSERT INTO product_detail values(1113,'Hair straightner','color : pale pink','brand : Guess',2500.00);
INSERT INTO product_detail values(1114,'Bluetooth speaker','Power : 80W','brand : JBL',4000.00);
INSERT INTO product_detail values(1115,'Shoes','Size : 24cm','brand : esse comfort',600.00);
INSERT INTO product_detail values(1116,'Makeup kit','Compact size','brand : Mac',999.00);
INSERT INTO product_detail values(1117,'Watch','Waterproof','brand : Fasttrack',6000.00);
INSERT INTO product_detail values(1118,'Watch','Sapphire crystal','brand : Titan',3000.00);
INSERT INTO product_detail values(1119,'Perfume','122ml','brand : Axe',300.00);
INSERT INTO product_detail values(1120,'Trimmer','Warranty : 1year','brand : Philips',900.00);



CREATE TABLE wishlist(
	userid int not null,
	wishname varchar(20),
FOREIGN KEY(userid) REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO wishlist values(1,'Jeans');
INSERT INTO wishlist values(2,'Shoes');
INSERT INTO wishlist values(1,'Bag');
INSERT INTO wishlist values(4,'Phant');
INSERT INTO wishlist values(5,'Lipstick');
INSERT INTO wishlist values(1,'Towel');
INSERT INTO wishlist values(7,'Bluetooth');
INSERT INTO wishlist values(8,'Iron Box');
INSERT INTO wishlist values(9,'Photo frame');
INSERT INTO wishlist values(10,'Watch');












