Drop database if exists projectSem4
go
create database projectSem4
go
use projectSem4
go
Drop table if exists customer
go
create table customer(
	cusID int identity primary key,
	cusName nvarchar(255),
	cusEmail nvarchar(255),
	cusPassword varchar(255),
	cusAddress nvarchar(255),
	cusPhone varchar(255),
	cusAvatar varchar(255),
	cusStatus bit
	
)
go
Drop table if exists staff
go
create table staff(
	staffID varchar(10) primary key,
	staffName nvarchar(255),
	staffPhone varchar(10),
	staffEmail varchar(50),
	staffAddress varchar(255),

	staffPassword nvarchar(255),
	[role] tinyint,
	staffStatus bit
	
)
go
drop table if exists category
go
create table category(
	catID varchar(20) primary key,
	catName varchar(20)
)
drop table if exists imgStog
create table imgStog (
	imgID int identity primary key,
	img_name varchar(255),
	proID varchar(10) foreign key REFERENCES product(proID)
)


drop table if exists tbTag
go
create table tbTag(
	tagID int identity primary key,
	tag varchar(255)
)
go
Drop table if exists product
go
create table product(
	proID varchar(10) primary key,
	proName nvarchar(255),
	proDetails text,
	proPrice int,
	quantity int,
	DateRelease date,
	proStatus bit,
	tags varchar(255),
	catID varchar(20) foreign key REFERENCES category(catID),
	imgID int foreign key REFERENCES imgStog(imgID)
)
go

Drop table if exists purchaseItem
go
create table purchaseItem(
	purItemID varchar(20) primary key,
	proID varchar(10) foreign key REFERENCES product(proID),
	quantity int
	
)
go
Drop table if exists purchase
go
create table purchase (
	purID int identity primary key,
	cusID int foreign key REFERENCES customer(cusID),
	purItemID varchar(20) foreign key REFERENCES purchaseItem(purItemID),
	total_price int,
	purchaseStatus tinyint,
	date_order_placed date,
	date_order_paid date,


)
drop table if exists feedback
go
create table feedback(
	feedId int identity primary key,
	[Subject] varchar(500),
	[Message]	text,
	ReceivedDate datetime,
	sender int foreign key REFERENCES customer(cusID)
	
)
go
drop table if exists mailbox
go
create table mailbox(
	mailID int identity primary key,
	[Subject] varchar(500),
	[Message]	text,
	ReceivedDate datetime,
	cusID int foreign key REFERENCES customer(cusID),
	replyContent text,
	replyDate datetime,
	staffID varchar(10)  foreign key REFERENCES staff(staffID)
)


