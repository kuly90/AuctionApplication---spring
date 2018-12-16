use master;
create database AuctionDB
drop database AuctionDB
go
use AuctionDB
go
create table userRole(
roleID int identity primary key,
roleName varchar(50) not null
)

insert into userRole values
('ROLE_MANAGE'),
('ROLE_ADMIN'),
('ROLE_CUSTOMER')
create table customer
(
	customerID int identity primary key,
	name varchar(50) not null,
	phone varchar(50) not null,
	address varchar(255) not null,
	email varchar(255) not null,
	userName varchar(50) not null,
	password varchar(50) not null,
	roleID int references userRole(roleID),
	status bit default 1
)
select * from customer
delete customer
insert into customer values('Da Nang','dung@gmail','Quoc Dung',123456,0905,1,'dung',3),
							('Hue','ly@gmail','Ku Ly',123456,0999,1,'ly',3),
							('Quang Nam','manage@gmail','Manage',123456,0123,1,'manage',1),
							('Da Nang','admin@gmail','Admin',123456,0905,1,'admin',2)




select  userName , roleName from customer c join CustomerRole r on c.roleID = r.roleID where userName = 'admin'
go
create table creditAccount
(	
	customerID int references customer(customerID),
	numberAccount varchar(16) unique,
	dateOpen date not null,
	validTo date not null,
	amount money default 0,
	primary key (customerID)
)
delete creditAccount
drop table creditAccount
select * from creditAccount
insert into creditAccount values(1,500, '10/10/2016',123412341234, '11/11/2016'),
								(2,700, '05/05/2017',456745674567, '11/11/2017');

--select * from creditcard
go
create table goods
(
	goodID int identity primary key,
	goodName varchar(100) not null,
	description varchar(500),
	status bit
)
insert into goods values
('Penguins','Chom canh cut',1)
select*from goods
go
create table imagegood
(
	id int identity primary key,
	goodID int references goods(goodID),
	imageUrl varchar(100) not null
)
insert into imagegood values ('Penguins.jpg',1)

go
create table comission
(
	comissionID int identity primary key,
	minimum money not null unique,
	maximum money not null unique,
	amountOld money not null default 0,
	amountNew money not null,
	dateChange date,
	status bit
)
select * from comission
delete comission
insert into comission values(0,100,null,0,15,1),
							(101,200,null,0,10,1),
							(201,300,null,0,5,1);
go
create table auction
(
	auctionID int identity primary key,
	customerID int references customer(customerID),
	goodID int references goods(goodID),
	comissionID int references comission(comissionID),
	minimunPrice money not null,
	reserverPrice money not null,
	startDate date not null,
	hourStart int not null,
	minuteStart int not null,
	secondStart int not null,
	duration float not null,
	dateChange date,
	status int default 0
)
select * from auction
update auction set status = 0 where auctionid = 1
go
create table bids
(
	bidID int identity primary key,
	auctionID int references auction(auctionID),
	customerID int references customer(customerID),
	date datetime not null,
	amount money not null
)
go
create table transactions
(
	transactionID int identity primary key,
	auctionID int references auction(auctionID),
	cardNumber varchar(16) references creditAccount(numberAccount),
	amount money not null,
	description varchar(255),
	dateTransaction date not null
)
go
create table buildbroad
(
	broadID int identity primary key,
	customerID int references customer(customerID),
	auctionID int references auction(auctionID),
	message varchar(500) not null,
	date date not null
)
select * from customer
select * from goods
select * from comission
select * from auction

insert into auction values ('2017-01-01',1,0,10,0,10,59,'2017-01-01',2,1,3,1)
where auctionID=3
delete from bids where auctionID=3
delete from buildbroad where auctionID=3
select * from auction
update auction set status = 0 where auctionID = 1;