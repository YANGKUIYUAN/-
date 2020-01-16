create table book (
                    id int primary key auto_increment,
                    name varchar(16) ,
                    author varchar(16) ,
                    press varchar (32) ,
                    price decimal(7,2),
                    remark text
);
insert into book values (null,'cat','LaoShe','Chinese literature',99.9,'This a cat_story'),
(null,'Say china free','LuXun','Chinese literature',59.9,'Tallking say china '),
(null,'Zaibiekangqiao','XuZiMo','Chinese aducation',68,'This a story about student');

create database books charset=utf8;
create table book (
                    id int primary key auto_increment,
                    title varchar(16) not null ,
                    author varchar(16) default "匿名",
                    publication varchar (32) not null,
                    price decimal(5,2) not null,
                    comment text);
insert into book (title,author,publication,price,comment) values
('边城','沈从文','机械工业出版社',36,'小城故事多'),
('骆驼祥子','老舍','机械工业出版社',87,'你是祥子么'),
('林家铺子','茅盾','中国文学出版社',42,'铺子'),
('茶馆','老舍','中国教育出版社',70,'茶馆故事');
alter table interest add tellphone default 123456 after name ;
* 删除字段(drop)
alter table 表名 drop 字段名;
* 修改数据类型(modify)
alter table 表名 modify 字段名 新数据类型;
alter table 表名 add 字段名 数据类型 after 字段名;
* 修改字段名(change)
alter table interest change tellphone tel char(11) default 12345;
* 表重命名(rename)
alter table 表名 rename 新表名;

create table marathon (id int primary key auto_increment,
                        athlete varchar(26) not null ,
                        birthday date ,
                        registration_time  datetime,
                        performance time );
create table sanguo (id int primary key auto_increment,
                    gender  varchar(1),
                    name  varchar(26) not null,
                    country  char(10),
                    attack smallint unsigned,
                    defense  tinyint unsigned);
                    alter table sanguo change name gender varchar(1);
alter table sanguo modify  新数据类型;
insert into sanguo values (null ,'男','曹操','魏国',150,63),
                        (null ,'男','郭嘉','魏国',240,50),
                        (null ,'女','张春华','魏国',355,60),
                        (null ,'男','典韦','魏国',360,40),
                        (null ,'男','赵云','蜀国',368,90),
                        (null ,'男','刘备','蜀国',179,60),
                        (null ,'女','糜夫人','蜀国',319,90),
                        (null ,'男','诸葛亮','蜀国',320,80),
                        (null ,'女','小乔','吴国',350,100),
                        (null ,'男','孙权','吴国',300,40),
                        (null ,'男','周瑜','吴国',320,69),
                        (null ,'男','周泰','吴国',190,100);
insert into marathon values (null,'CaoCao','1990-1-9','2019/12/28 18:33:25','2:14:55'),
(null,'LiuXiang','1996-12-5','2018-10-28 10:33:25','2:30:55');

update book set price=45 where name='狂人小说';
alter table book add public_date date after price;
update book set public_date='2012-5-4' where author='老舍';
update book set public_date='2016-10-1' where publication='人民教育出版社' and author !='老舍';
delete from book where price>80;
alter table book modify price decimal (5,2);
insert into book (title,author,publication,price,comment) values
('资本主义体系','鲁迅','人民教育出版社',55,'大地主阶级的利益'),
('藤','老舍','人民教育出版社',95,'向往阳光的树藤');
alter table class_1 rename cls;

     查找所有蜀国人信息，按照攻击力排名
select * from sanguo where country='蜀国' order by attack;
       将赵云的攻击力设为360 防御力设置为70
update attack,defense from sanguo where name='赵云';
      吴国英雄攻击力超过300的改为300（最多改2个）
      查找攻击力高于250 的魏国英雄的名字和攻击力
      将所有英雄攻击力按照降序排序，如果攻击力相同则按照防御力降序排序

      查找所有名字为3个字的英雄
select * from  sanguo where name like '___';
      找到魏国防御力前2名的英雄
select * from  where country order by defense desc limit 2;
      找到攻击力比魏国最高攻击力者还要高的蜀国英雄
select  from  where
      找过所有女型角色中攻击力比诸葛亮还要高的英雄

--------------
insert into dept  values (1,'总裁办'),
(2,'销售部'),
(3,'技术部'),
(4,'人事部'),
(5,'财务部'),
(6,'市场部'),
(7,'行政部');
insert into person  values
(1,'Alex',33,'m',28000,'2017-3-8',2),
(2,'马云',45,'m',128000,'2016-1-8',5),
(3,'Lucy',23,'w',18000,'2019-5-6',1),
(4,'Maria',25,'w',20000,'2017-3-1',4),
(5,'YeJe',30,'w',65000,'2017-2-11',5),
(6,'JinXiang',29,'w',50000,'2017-5-24',5),
(7,'Alex',26,'m',10000,'2017-7-12',7),
(8,'Alex',31,'m',40000,'2017-9-3',3);

create table  athlete(
id int not null  auto_increment,
name varchar (30) default null ,
age tinyint ,
country varchar (30),
description varchar (30) ,
primary key (id)
);
CREATE TABLE `item` (
`id` int NOT NULL AUTO_INCREMENT,
`rname` varchar(30) NOT NULL,
PRIMARY KEY (`id`)
);
CREATE TABLE `athlete_item` (
`aid` int NOT NULL,
`tid` int NOT NULL,
PRIMARY KEY (`aid`,`tid`),
CONSTRAINT `athlete_fk` FOREIGN KEY (`aid`) REFERENCES `athlete` (`id`),
CONSTRAINT `item_fk` FOREIGN KEY (`tid`) REFERENCES `item` (`id`)
);
create table athlete_item (
aid int not null ,
tid int not null ,
primary key (aid , tid),
constraint  athelet_fk foreign key (aid) references athlete(id),
constraint  item_fk foreign key  (tid) references  item(id)
);
create table student(id int primary key auto_increment,name varchar(50) not null);
create table record(id int primary key auto_increment,
comment text not null,
st_id int unique,
foreign key(st_id) references student(id)
on delete cascade
on update cascade
);



create table teacher(
id primary key auto_increment,
name varchar (32),
age tinyint not null ,
dengji char(1),
);
create table kechen(
id int primary key auto_increment,
score tinyint not null,
kechen_name varchar (30),
constraint t_fk foreign key (t_id) references teacher(id)
);
create table stu01(
id int primary key auto_increment,
姓名 varchar (30) default null ,
年龄 tinyint ,
性别 char(1),
籍贯 varchar (32)
);
create table  xuanke(
`aid` int NOT NULL,
`tid` int NOT NULL,
score float not null,
primary key (aid , tid),
constraint  stu01_fk foreign key (aid) references stu01(id),
constraint  kechen_fk foreign key  (tid) references  kechen(id)
);

create table user(
id int primary key auto_increment,
姓名 varchar (32),
密码 varchar (30)
);

create table pyq(
id int primary key auto_increment,
内容 varchar (30),
图片 blob,
时间 datetime ,
地点 varchar (50)
);
create table pyq_user(
id int primary key auto_increment,
uid int,
pid int,
`like` bit ,
comment text ,
constraint u_fk foreign key (uid) references user(id),
constraint p_fk foreign key (pid) references pyq(id)
);
create table word (
id primary key auto_increment,
word varchar (50),
mean varchar (100)
);


