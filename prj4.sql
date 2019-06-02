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
	cusStatus bit,
	cusGender bit
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
	catName varchar(20),
	statusCategory bit
)
drop table if exists tbTag
go
create table tbTag(
	tagID int identity primary key,
	tag varchar(255),
	tag_description varchar(255)
)
go

Drop table if exists productType
go
create table productType(
	typeID int identity primary key,
	typeName varchar(20),
	statusType bit
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
drop table if exists imgStog
create table imgStog (
	imgID int identity primary key,
	img_name varchar(255),
	proID varchar(10) foreign key REFERENCES product(proID)
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
create table whislist(
 whislistID int identity primary key,
 quantity int,
 cusID int foreign key REFERENCES customer(cusID),
 proID varchar(10) foreign key REFERENCES product(proID)
)
go
drop table if exists Feature
create table Feature(
	FeatureID int identity primary key,
	Fname varchar(50),
	Fdescription varchar(255),
	proID varchar(10) foreign key REFERENCES product(proID)
)



