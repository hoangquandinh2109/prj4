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
	staffPassword nvarchar(255),
	[role] tinyint,
	staffStatus bit
	
)
go
Drop table if exists product
go
create table product(
	proID varchar(10) primary key,
	proName nvarchar(255),
	proDetails nvarchar(max),
	proPrice int,
	DateRelease date,
	proStatus bit,
	imgID int foreign key REFERENCES imgStog(imgID)
)
go
drop table if exists imgStog
create table imgStog (
	imgID int identity primary key,
	img_link varchar(255),
	proID varchar(10) foreign key REFERENCES product(proID)
)


Drop table if exists purchase
go
create table purchase (
	purID int identity primary key,
	cusID int foreign key REFERENCES customer(cusID),
	total_price int
)
Drop table if exists purchaseItem
go
create table purchaseItem(
	purItemID int identity primary key,
	proID varchar(10) foreign key REFERENCES product(proID),
	quantity int,
	
)
go

