--ban cap nhat ngay 22/05

use projectSem4
--- cap nhat 5 cot o bang purchase
alter table purchase
add toName nvarchar(50),
	toAddress nvarchar(50),
	toPhone varchar(11),
	paymentMethod varchar(50),
	note nvarchar(255)
go
--- table cua TU
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



