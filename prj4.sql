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
	statusCategory bit,
	cateDescription  varchar(255)
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
	statusType bit,
	typeDescription  varchar(255)

)
drop table if exists Feature
create table Feature(
	FeatureID int identity primary key,
	Fname varchar(50),
	Fdescription varchar(255),
	statusFeature bit
)
Drop table if exists product
go
create table product(
	proID varchar(10) primary key,
	proName nvarchar(255),
	proDetails text,
	proPrice float,
	quantity int,
	DateRelease date,
	proStatus bit,
	tags varchar(255),
	catID int foreign key REFERENCES category(catID),
	typeID int foreign key REFERENCES productType(typeID),
	FeatureID int foreign key REFERENCES Feature(FeatureID),
	discout int,
	starAVG float,
	
)
go
drop table if exists imgStog
create table imgStog (
	imgID int identity primary key,
	img_name varchar(255),
	thumbnail bit,
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
	toName nvarchar(50),
	toAddress nvarchar(50),
	toPhone varchar(11),
	paymentMethod varchar(50),
	note nvarchar(255)
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
	reviewTitle varchar(50),
	reviewContent text,
	star int,
	cusID int foreign key REFERENCES customer(cusID),
	proID varchar(10) foreign key REFERENCES product(proID)
)
go
drop table if exists wishlist
create table wishlist(
 whislistID int identity primary key,
 quantity int,
 cusID int foreign key REFERENCES customer(cusID),
 proID varchar(10) foreign key REFERENCES product(proID)
)
go
drop table if exists post
go
create table post(
	postID int identity primary key,
	titlePost nvarchar(500),
	infontContent nvarchar(500),
	titleContent nvarchar(max),
	dateRealease datetime,
	postStatus bit,
	postTag nvarchar(500),
	cusID int foreign key REFERENCES customer(cusID),

)
go	
drop table  if exists comment
go
create table comment(
	commentID int identity primary key,
	commentContent text,
	commentStatus bit,
	cusID  int foreign key References customer(cusID),
	postID int foreign key References post(postID),
	dateComment datetime
)
go
drop table if exists reply
go
create table reply(
	repID int identity primary key,
	replyContent text,
	replyStatus bit,
	cusID int foreign key References customer(cusID),
	commentID int foreign key References comment(commentID),
	dateReply datetime

)
go
drop table if exists likes
go
create table likes (
	likeID int identity primary key,
	likeStatus bit,
	cusID int foreign key References customer(cusID),
	postLiked int foreign key References post(postID)

)
go
drop table if exists tb_notifyPost
go
create table tb_notifyPost(
	noID int identity primary key,
	cusToNotify int foreign key References customer(cusID),
	cusLike int foreign key References customer(cusID),
	[message] varchar(255),
	seenByUser bit,
	notificationDate datetime,
	notifyComment int foreign key References comment(commentID),
	notifyLike int foreign key References likes(likeID)
)



