use master
go
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
	catID int identity primary key,
	catName varchar(20)
)
drop table if exists tbTag
go
create table tbTag(
	tagID int identity primary key,
	tag varchar(255),
	tag_description varchar(255)
)
go
drop table if exists imgStog
create table imgStog (
	imgID int identity primary key,
	img_name varchar(255),
)
Drop table if exists productType
go
create table productType(
	typeID int identity primary key,
	typeName varchar(20)
)
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
	catID int foreign key REFERENCES category(catID),
	typeID int foreign key REFERENCES productType(typeID),
	starAVG float
)
go
drop table if exists ProImgtb
create table ProImgtb (
	Code int primary key identity,
	proID varchar(10) foreign key REFERENCES product(proID),
	imgID int foreign key REFERENCES imgStog(imgID)
)
Drop table if exists purchase
go
create table purchase (
	purID varchar(20) primary key,
	cusID int foreign key REFERENCES customer(cusID),
	total_price int,
	purchaseStatus tinyint,
	date_order_placed date,
	date_order_paid date,
)
Drop table if exists purchaseItem
go
create table purchaseItem(
	purItemID int identity primary key,
	proID varchar(10) foreign key REFERENCES product(proID),
	quantity int,
	purID varchar(20) foreign key REFERENCES purchase(purID)
)
go
drop table if exists feedback
go
create table feedback(
	feedId int identity primary key,
	[Subject] varchar(500),
	[Message]	text,
	ReceivedDate datetime,
	sender int foreign key REFERENCES customer(cusID),
	rating int
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
drop table if exists rating
go
create table review(
	rateID int identity primary key,
	reviewContent text,
	star int,
	cusID int foreign key REFERENCES customer(cusID),
	proID varchar(10) foreign key REFERENCES product(proID)
)
go
drop table if exists whislist
go
drop table if exists comment
create table commentItem(
	id int identity primary key,
	content text,
	[date] datetime
)
-- 
create table viewComment(
	commentID int identity primary key,
	comItem int foreign key REFERENCES commentItem(id),
	cusID int foreign key REFERENCES customer(cusID),
	proID varchar(10) foreign key REFERENCES product(proID),
	[like] int
)
go



