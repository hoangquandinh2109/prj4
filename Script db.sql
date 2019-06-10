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
	cateDescription  varchar(max)
)
drop table if exists tbTag
go
create table tbTag(
	tagID int identity primary key,
	tag varchar(255),
	tag_description varchar(255),
	tagType varchar(20)
)
go

Drop table if exists productType
go
create table productType(
	typeID int identity primary key,
	typeName varchar(20),
	statusType bit,
	typeDescription  varchar(max),
	catID int foreign key REFERENCES category(catID)
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
	total_price float,
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
	staffID varchar(10)  foreign key REFERENCES staff(staffID),
	mailStatus bit
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
 wishlistID int identity primary key,
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
go



insert into tbTag values
('Him','','product'),
('Her','','product'),
('Kids','','product'),
('TeenGirl','','product'),
('TeenBoy','','product'),
('HowToMade','','post'),
('Hand Made','','post'),
('Gift For Wedding','','post'),
('Gift For Birthday','','post'),
('Anniversary','','post'),
('Best friend','','post')

go
insert into category values--them ICON
	('Jewelry gift','1','Make a jewelry gift more special by adding a personal touch. Our jewelry gifts for moms, brides, girlfriends, and teens can all be custom made to reflect their style and the occasion.:fas fa-ring'),
	('Mug Collection','1','Here’s an essential read for all coffee lovers. Get to know the different types of coffee glasses for all styles of coffee beverages.:fas fa-mug'),
	('HOME DECOR','1','All our home decorations can be personalized to create unique gifts perfect for housewarming parties, hostess gifts, and gifts for friends and family. Customize wall plaques, throw pillows, and photo frames to give a gift of unique home decor they will cherish.:fas fa-wreath'),
	('Gift BASKETS','1','Gift baskets make for cheerful-looking presents that can be enjoyed and shared immediately. Perfect as a group gift, a food gift basket can be chosen to fit your recipient or occasion just right.:fal fa-shopping-basket'),
	('Toy for kids','1','All kids love toys, and, lets be honest, plenty of adults do too. Whether they are a child who would love an outside toy they can play with all summer long, or an adult who could use an office toy to make their work a bit more fun:fas fa-child'),
	('Art and Crafts','1','Whatever occasion is being celebrated - a birthday, anniversary, holiday or other special event - you can not go wrong with a unique art and crafts gift from Gift Shop.:fas fa-democrat'),
	('Computers','1','For the techie who has it all, discover unique, personalized computer gift ideas sure to take them by surprise. From sports themed items, to travel accessories, eco-friendly technology, computer games, and more, there is something perfect for any personality.:far fa-phone-laptop'),
	('Sport gift','1','Whatever occasion is being celebrated, a birthday, anniversary, graduation or holiday, surprise them with a unique gift celebrating their passion for sports and recreation. :fas fa-tennis-ball')
go
insert into  productType values
	('necklace','1','This brass earring is shaped like five birds. It is designed in a style evocative of Medieval fashion.  It is accented with a huge translucent blue, bright purple, dark pink, and white baguette-cut gem surrounded by translucent aquamarine gems.','1'),
	('Ring','1','This gold earring is a rounded ovoid. It is designed in an Art Nouveau style.','1'),
	('Watch','1','A best Gift of alll time? Buy for him or her a watch? No matter what the occasion may be, she or he will love you no condition!','1'),
	('Mug for travel','1','When shopping for gifts for teen boys, its essential to know the difference between awesome and dorky. With the "cool meter" handy, we handpicked this great collection of gifts sure to meet with approval from your favorite teen guy','2'),
	('Mug Espresso','1','','2'),
	('Mug Tumbler','1','','2'),
	('Pillow','1','','3'),
	('Sweet','1','','4'),
	('Fruit','1','','4'),
	('Teddy','1','','5'),
	('Puzzle','1','','5'),
	('Craft','1','','6'),
	('Sculptures','1','','6'),
	('Standees','1','','6'),
	('Accessories','1','','7'),
	('Novelty','1','','7'),
	('Tennis','1','','8'),
	('Water Sport','1','','8'),
	('Foot Ball','1','','8')
	go

insert into Feature values
('Hot','','1'),
('Sale','','1'),
('New','','1')
go
insert into product values
--for Jewelry gift
('PR001','St. Louis Cardinals Busch Stadium Seat Pendant','A special gift for the ladies who love Major League Baseball! This pendant is made from salvaged seats from the St. Louis Cardinals famous Busch Stadium. Features a sterling silver ball chain and the name of each stadium engraved on the back. Each necklace comes with a certificate of stadium material authenticity. Pendant measures approximately 5/8” square.','23.00','100','2019-06-01','1','Her:TeenGirl','1','1','1','0','4.6'),
('PR002','Men Java Paths Sterling Silver Pendant Necklace','SHe is not the kind of guy to follow the well-trod path. SHe is looking for something different, and has so many adventures ahead of him. Give him this handsome, handcrafted necklace. It is a cool and unique style.','19.00','100','2019-06-01','1','Her:TeenGirl','1','1','1','0','4.6'),
('PR003','Leave a Trail Necklace','Created by an artisan in Los Angeles, California, this necklace features an inspirational quote from that great American writer, Ralph Waldo Emerson. For any dreamer who follows their own path','230.00','100','2019-06-01','1','Her:TeenGirl','1','1','3','0','4.6'),
('PR004','Sterling Silver Cubic Zirconia Heart Ruby Halo Solitaire Ring','Speak to her heart with this dazzling ring. Red is the color of love, and she ll smile when she puts this on and thinks of you','45.00','100','2019-06-01','1','Her:TeenGirl','1','2','2','10','4.6'),
('PR005','Personalized Black Stainless Steel Beveled Edge Band','When it comes to wedding bands there is so much more to choose from than the classic gold and silver band. This chic stainless steel band is a stylish black, an eye catching ring for the fashion forward person','68.00','100','2019-06-01','1','Him:TeenBoy','1','2','3','0','4.6'),
('PR006','Mens Cordoba Tungsten Carbide Ring','When its time to slip a ring on his finger, surprise him with a piece of jewelry that matches his rugged, yet sophisticated style. Crafted from tungsten carbide, this handsome ring offers a sleek durable design.','29.00','100','2019-06-01','1','Him:TeenBoy','1','2','1','0','4.6'),
('PR007','Large Ladybugs Watch in Gold','Whimsical Gifts No, thats not a bug crawling up your arm. Its a Ladybug Whimsical Watch. Everybody loves a pretty lady, this one just happens to be a bug! Hand crafted using miniatures of Ladybugs placed on a beautiful bed of flowers. ','139.00','100','2019-06-01','1','Her:TeenGirl','1','3','2','10','4.6'),
('PR008','Womens Moments of Faith Stretch Watch with Crystals','She has always been a woman of profound faith. She has an unshakeable belief in the Lord, and she never misses a Sunday at church. This regal and sophisticated gold-tone watch is a devout fashion statement','69.99','100','2019-06-01','1','Her:TeenGirl','1','3','2','30','4.6'),
('PR009','Tampa Bay Rays Cage Analog Watch','He doesnt need an excuse to show off some Tampa Bay spirit. Whether its game day or its the off-season, hes always happy to rock Rays gear. Give him this handsome watch. Its a gift he can wear every day.','23.00','100','2019-06-01','1','Him:TeenBoy','1','3','2','30','4.6'),
--For 'Mug Collection
('PR010','RTIC Double Wall Vacuum Insulated','RTIC makes top of the line coolers, so it’s no surprise that they also crush in the insulated beverage game. This deep green thermos also comes in 13 other colors. The double wall vacuum insulation keeps each sip hot, so he’ll be sure to think of you in a good light.','120.60','100','2019-06-01','1','For all','2','4','2','10','4.9'),
('PR011','S’well Bottle Traveler','The sleek look of teakwood will fit in quite nicely in the office. Pick from a 12-, 16- or 20-ounce bottle that will keep a latte steaming for up to twelve hours thanks to stainless steel and triple-walled insulation. If the wood is too dark, check out the upscale marble, metallic or deep navy colors instead','110.60','100','2019-06-01','1','For all','2','4','2','30','4.9'),
('PR012','Contigo Autoseal Transit Stainless Steel Travel Mug','This 16-ounce jet black travel mug will keep any beverage hot for up to five hours, and a cold brew good for 12 hours. The non-slip grip prevents drops, and the lifetime warranty is certainly something to consider.','131.60','100','2019-06-01','1','For all','2','4','1','0','4.9'),
('PR013','Thermos 16-Ounce Travel Mug','There’s a reason coffee mugs have handles — the body of the cup gets just as hot as the boiling water you pour in it, so a handle is the best way to combat that. This Thermos is made of all stainless steel (both inside and out), so the handle is a necessity. The vacuum insulation will keep tea hot for up to four hours.','143.60','100','2019-06-01','1','For all','2','4','1','0','4.9'),
('PR014','DeLonghi Double Walled Thermo Espresso Glasses, Set of 2','Double wall thermos glasses. Keeps drinks hot or cold. Condensation free. Dishwasher safe. Capacity: 2 oz. /60 ml','123.60','100','2019-06-01','1','For all','2','5','3','0','4.9'),
('PR015','Ello Campy Vacuum-Insulated Stainless Steel Travel Mug','If you loves to get outdoors, this backcountry-inspired travel mug looks just like the ceramic mugs that used to be everyone’s go-to for camping. The leak-proof lid keeps things hot and secure for up to five hours. We recommend you pair this with some easy-to-make camp coffee like Kuju’s single serving pourovers or Alpine Start’s instant coffee.','162.60','100','2019-06-01','1','For all','2','4','3','0','4.9'),
--For Home decor
('PR016','Family Names Throw Pillow Covers | Name Cushion Covers | 18 x 18” Custom Cotton White Pillowcases | Birthday Personalized Mothers Day Gift','Personalized Family Names Throw Pillow Covers, Printed Cotton White Pillowcases, Washable Pillows, Cushion Covers Mother’s Day Gifts','10.60','100','2019-06-01','1','Her','3','7','1','0','4.9'),
('PR017','Family Names Throw Pillow Covers Printed Pillowcases Custom Pillow Cover Personalized Pillow Cover Custom Throw Pillow Birthday Gift for Mom','Family Names Throw Pillow Covers Printed Pillowcases Custom White Pillowcases Personalized Pillow Covers Custom Pillow Birthday Gift for Mom. Family Names Throw Pillow Covers Children Names Pillow Case Custom Names Pillow Covers Mothers Day Gift for Mom Gift for Grandparents','10.60','100','2019-06-01','1','Her','3','7','2','10','4.9'),
('PR018','Schumacher Citrus Garden Pillow Cover Decorative Throw Pillow, Accent Pillow, Home Decor','All pillow covers are sewn professionally, over-locked with finished edges to prevent fraying and has invisible zipper enclosures. This provides long lasting, durable covers that will stay straight and beautiful over time, which makes for a clean professional look.','23.60','100','2019-06-01','1','Her','3','7','2','10','4.9'),
('PR019','2 Pack of Ticking Stripe Throw Pillow Covers / Farmhouse Decor / 18 x 18 Cushion Covers','Channel your inner Joanna Gaines by styling your home with these timeless grain stripe throw pillow covers. These pillow covers are especially great for rustic, cottage, and farmhouse style home decor.These versatile cushion covers will look great in the bedroom, living room, entryway, and pretty much anywhere else!','45.60','100','2019-06-01','1','Kids','3','7','3','0','4.9'),
--
('PR020','Father of Wildlings Tumblers, GOT tumbler, game of thrones, Cups, fathers day, Stainless Steel tumbler','The design is laser engraved so that way you don’t have to worry about a sticker peeling off.','67.60','100','2019-06-01','1','For all','2','6','2','10','4.9'),
('PR021','Personalized Game of Thrones Tumbler For Dad. Father’s day gift. Unique Gift For any GOT Dad or Grandfather. 12oz, 20oz, and 30oz Available.','12 oz double wall 18/8 stainless steel, copper coated, vacuum insulated travel tumbler with a powder coated finish that protects against chips and scratches. Comes with a clear push-on lid and matching straw. Non-toxic and BPA-free.','123.60','100','2019-06-01','1','For all','2','6','2','10','4.9'),
('PR022','Wine Tumbler- Custom Wine Tumbler- Rose Gold Tumbler- Custom Tumbler-Wine Glass- Wine Cup- Bachelorette Gift- Bachelorette Party','Fully Custom Text! Stainless Steel Wine Tumbler. Put any message you would like on these tumblers :)','78.60','100','2019-06-01','1','For all','2','6','2','10','4.9'),
('PR023','Coffee Tumbler','Built 21oz tumbler I love you more than coffee','23.60','100','2019-06-01','1','For all','2','6','3','0','4.9'),
('PR024','Tumbler with Straw / Insulated Cup / Bridesmaid Gift / Personalized Tumbler / Coffee Mug / Custom Tumbler / Metal Tumbler, Coffee tumbler',' Choose Your Font Style and whether you would like the text written horizontal (left to right) or vertical (bottom to top).','99.60','100','2019-06-01','1','For all','2','6','3','0','4.9'),
('PR025','Love Lives Here Mug','A family name or short phrase can be put across the bottom instead if you like! Up to 8 locations can be chosen. ','199.60','100','2019-06-01','1','For all','2','6','3','0','4.9'),
--
('PR026',' The Love Between Mother & Daughter Knows No Distance,Custom Map Gift,Mothers Day,Fathers Day,Grandparents Gift,Pillow Form Available','Special OFFER( For USA, Canada, Europe and UK only ) : GET YOUR ORDER FASTER with EXPRESS Shipping. If total value of your order is $42.99 or above then we will ship your order with DHL express shipping ( 3-4 days delivery ) instead of regular shipping ( no coupon code required ).','340.60','100','2019-06-01','1','For all','3','7','1','10','4.9'),
('PR027','Personalized pillow, Wedding gift , Anniversary gift pillow, Newlywed Gift,Engagement Gift, Bridal shower gift , Wedding gift pillow (P5)','Personalized pillow cover with pillow insert. Beautiful gift for Anniversary, Wedding Day , Newlywed , Bride as an engagement gift, shower gif , christmas gift, or just for you! !','53.60','100','2019-06-01','1','For all','3','7','1','10','4.9'),
('PR028','Mr Mrs Personalized Embroidered Cushion Cover, Bedroom Pillow, Custom Date Pillow, Wedding Gift Pillow Cover, Bridal Shower, Couple Pillow','1. You are always welcome if you need any suggestion from us regarding fabric and thread color matching. 2.if you are looking for a custom design/font that does not appear in our shop, please send us a convo, and we’d be happy to help! 3. Actual colors may vary from those shown in the pictures due to photography and different monitor settings.','27.60','100','2019-06-01','1','For all','3','7','1','10','4.9'),
('PR029','Anniversary Gift, Cotton Anniversary Gift, Custom Pillow Family Name Pillow Cover, Wedding Gifts','Introducing e.b.homes curated line of personalized rustic throw pillows. Our neutral designs make our pillows the perfect piece to cozy up and personalize any space!','11.60','100','2019-06-01','1','For all','3','7','1','10','4.9'),
--For Gift BASKETS
('PR030','Banana Chips and Trail Mix Healthy Food Basket','Healthy eaters need to have fun too! Give the fitness fanatics in your life this delicious gift basket that is filled with vitality increasing treats like honey wheat dipping pretzels, trail mix and banana chips','120.60','100','2019-06-05','1','Kids','4','8','2','10','4.9'),
('PR031','Healthy Choices Deluxe Care Package','Delight even the pickiest health nuts with this low fat snack gift basket thats crammed full of positively yummy treats. Comes with: Quaker caramel rice snacks, raisins, granola bars, trail mix, pretzels, and much more!','61.60','100','2019-06-05','1','Kids','4','8','2','10','2.3'),
('PR032','Belgian Chocolate Covered Twinkies','Surprise them with a sophisticated version of their favorite treat. These twinkies are covered with Belgian chocolate and delicious drizzles for an elegant appearance, giving them a special surprise','52.60','100','2019-06-05','1','Kids','4','8','2','10','3.4'),
('PR033','Belgian Chocolate Dipped Biscotti','Think of it as cookies all grown up. This set of a dozen biscotti dipped in milk, white, and dark chocolate indulges a sweet tooth in sophistication','134.60','100','2019-06-05','1','Kids','4','8','2','10','3.5'),
('PR034','Assorted Mini Cheesecakes 12 Piece Gift Tin','Dont just satisfy her sweet tooth put it on overload with these scrumptious mini cheesecakes. These lip smacking cheesecakes arrive in mouthwatering varieties like New York and Black Fores','45.60','100','2019-06-05','1','Kids','4','8','2','10','2.6'),
('PR035','College Candy and Snacks Care Package','You know your faraway college student isnt eating enough food to fuel their late night studying. Give your starving student this complete care package that is filled with delicious treats like butter peanut crunch','36.60','100','2019-06-05','1','Kids','4','8','2','10','2.7'),
('PR036','Snacks and Treats Military Care Package','Even if they are thousands of miles away they will love this delicious reminder of home sweet home. This amazing care package is brimming with snack favorites like honey mustard and onion pretzels and Twizzlers','33.60','100','2019-06-05','1','Kids','4','8','2','10','1.8'),
('PR037','80 Individually Wrapped Nut Free Smiley Cookies','An unexpected sweet surprise puts a smile on anyones face. Whether as party favors or a marketing tool, these cookies are ready to garner you new fans','132.60','100','2019-06-05','1','Kids','4','8','2','10','4.3'),
--For Toys For KIDS
('PR038','12 Plush Valentine Sport Balls','Not all Valentines are mushy and covered in hearts. These plush balls each have a tag with a Valentine message with a sport theme for a toy they can play around with all year! One dozen balls for multiple sports.','10.60','100','2019-06-08','1','Kids','5','10','2','10','4.9'),
('PR039','Handicorn Unicorn Hand Puppet','Details','13.60','100','2019-06-08','1','Kids','5','10','3','0','3.2'),
('PR040','Unicorn Rattle','Details','23.60','100','2019-06-08','1','Kids','5','10','3','0','4.3'),
('PR041','Personalized Heart Plush Bear','Details','56.60','100','2019-06-08','1','Kids','5','10','3','0','3.4'),
('PR042','11.5" Snowy Owl Push Toy','Details','50.60','100','2019-06-08','1','Kids','5','10','3','0','3.5'),
('PR043','Personalized Will You Marry Me Teddy Bear','Details','40.60','100','2019-06-08','1','Kids','5','10','3','0','3.6'),
('PR044','Feel Better Plush Penguin','Details','20.60','100','2019-06-08','1','Kids','5','10','1','0','2.3'),
('PR045','Flynn Teddy Bear with Personalized Star of David T-Shirt','Details','40.60','100','2019-06-08','1','Kids','5','10','1','0','1.1'),
('PR046','Personalized Graduation Balloon Teddy Bear','Details','30.60','100','2019-06-08','1','Kids','5','10','1','0','2.2'),
('PR047','Personalized Wedding Bells Teddy Bear','Details','52.60','100','2019-06-08','1','Kids','5','10','1','0','4.3'),
('PR048','Teddy Bear','Details','60.60','100','2019-06-08','1','Kids','5','10','1','0','3.4'),
('PR049','Toy TedVN','Details','60.60','100','2019-06-08','1','Kids','5','10','2','10','4.5'),
('PR050','Take Care Bear Aroma Therapy Teddy','Details','60.60','100','2019-06-08','1','Kids','5','10','2','10','4.5'),
('PR051','We Found Each Other Custom Map Puzzle','Details','60.60','100','2019-06-08','1','Kids','5','11','2','10','4.5'),
('PR052','Personalized 2-Line Hebrew Name Puzzle','Details','60.60','100','2019-06-08','1','Kids','5','11','2','10','4.5'),
('PR053','Fancy Fins and Classic Chrome Cars Puzzle','Details','60.60','100','2019-06-08','1','Kids','5','11','1','0','4.5'),
('PR054','12 Realistic Praying Animal Puzzles','Details','60.60','100','2019-06-08','1','Kids','5','11','1','0','4.5'),
--For Art and Crafts
('PR055','Green Jungle Gourd Maracas','Details','10.60','100','2019-06-02','1','For all','6','12','1','0','4.9'),
('PR056','10th Anniversary Celtic Love Spoon','Details','10.60','100','2019-06-02','1','For all','6','12','1','0','4.9'),
('PR057','Big Ben Glass Ornament','Details','20.60','100','2019-06-02','1','For all','6','12','1','0','4.9'),
('PR058','Loon Stained Glass Nightlight','Details','32.60','100','2019-06-02','1','For all','6','12','1','0','4.9'),
('PR059','Mermaid Kisses Wood Sign','Details','30.60','100','2019-06-02','1','For all','6','12','1','0','4.9'),
('PR060','Elsa Frozen Cardboard Cutout Standee','Details','30.60','100','2019-06-02','1','Kids','6','14','3','0','4.9'),
('PR061','Frozen Elsa and Anna Cardboard Cutout Standee','Details','30.60','100','2019-06-02','1','Kids','6','14','3','0','4.9'),
('PR062','Talking Life Size Elvis Presley Standee with Guitar','Details','20.60','100','2019-06-02','1','Kids','6','14','3','0','4.9'),
('PR063','Hot Air Balloon 3D Standee','Details','20.60','100','2019-06-02','1','Kids','6','14','3','0','4.9'),
('PR064','Minnie Mouse Standee','Details','20.60','100','2019-06-02','1','Kids','6','14','3','0','4.9'),
('PR065','Doctor Who Tardis Stand Up Cardboard Cutout','Details','22.60','100','2019-06-02','1','For all','6','14','2','10','4.9'),

('PR066','Moon Goddess Wood Sculpture','Details','22.60','100','2019-06-02','1','TeenBoy:Him:Kids','6','13','2','10','4.9'),
('PR067','The Stockings Were Hung Personalized Thomas Kinkade Sculpture','Details','22.60','100','2019-06-02','1','TeenBoy:Him:Kids','6','13','2','10','4.9'),
('PR068','Rustic Monster Motorbike Sculpture','Details','22.60','100','2019-06-02','1','TeenBoy:Him:Kids','6','13','2','10','4.9'),
('PR069','Friends Forever Iron Statuette','Details','22.60','100','2019-06-02','1','TeenBoy:Him:Kids','6','13','2','10','4.9'),
('PR070','Cute Ginger Rabbit Wood Sculpture','Details','23.60','100','2019-06-02','1','TeenBoy:Him:Kids','6','13','2','10','4.9'),
--Computer
('PR071','Traveling Style in Black Leather Accent Cotton Tablet Case','Details','12.60','100','2019-06-01','1','TeenBoy:Him','7','15','1','0','2.9'),
('PR072','The Greatest Gift Dad Mouse Pad','Details','140.60','100','2019-06-01','1','TeenGirl:Her','7','15','1','0','3.9'),
('PR073','She Believed She Could Laptop Case','Details','13.60','100','2019-06-01','1','TeenGirl:Her','7','15','1','0','4.9'),
('PR074','Zebra USB Flash Drive','Details','20.60','100','2019-06-01','1','For all','7','16','1','0','3.9'),
('PR075','Leather Mouse Pad with Wrist Rest','Details','20.60','100','2019-06-01','1','For all','7','15','2','20','3.9'),
('PR076','Personalized Camel Laptop Sleeve','Details','30.60','100','2019-06-01','1','TeenGirl:Her:TeenBoy:Him','7','15','2','10','4.9'),
('PR077','Elephant USB Flash Drive','Details','10.60','100','2019-06-01','1','For all','7','16','2','10','2.9'),
('PR078','Random Acts of Kindness Kit with Family Boom Boom Cards','Details','120.60','100','2019-06-01','1','For all','7','16','3','0','4.9'),
('PR079','The KeyPad Pen','Details','120.60','100','2019-06-01','1','tag','7','16','3','0','4.9'),
('PR080','Giraffe USB Flash Drive','Details','120.60','100','2019-06-01','1','For all','7','16','3','0','4.9'),
-- for the last one
('PR081','The Serve Reclaimed Auto Parts 7.5" Sculpture','Details','120.60','100','2019-06-02','1','Her:TeenGirl','8','17','1','0','4.9'),
('PR082','Personalized Tennis Racket Cover','Details','120.60','100','2019-06-02','1','Her:TeenGirl','8','17','1','0','4.9'),
('PR083','Tennis Champ Upcycled Auto Parts Statuette','Details','34.60','100','2019-06-02','1','Her:TeenGirl','8','17','1','0','4.9'),
('PR084','Pink Hello Kitty Zipper Tennis Visor','Details','20.60','100','2019-06-02','1','Her:TeenGirl','8','17','1','0','4.9'),

('PR085','Fish S well Bottle in White','Details','50.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR086','Wooden Kayak Desktop Sculpture','Details','30.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR087','Sunset Kayaking Tour On Lake Tahoe for 1','Details','20.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR088','Miami Watersports Adventure Experience Gift','Details','80.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR089','Michael Phelps Pop Art Print','Details','90.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR090','Bay Area Surf Lesson','Details','80.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR091','Seabed Swimming Caricature from Photos','Details','76.60','100','2019-06-02','1','For all','8','18','2','10','4.9'),
('PR092','Standup Paddleboarding Tour of Lake Tugaloo for 1','Details','67.60','100','2019-06-02','1','For all','8','18','2','10','4.9')
go

insert into imgStog values
('PR001.jpg','1','PR001.jpg'),('PR001(1).jpg','','PR001.jpg'),('PR001(2).jpg','','PR001.jpg'),('PR001(3).jpg','','PR001.jpg'),
('PR002.jpg','1','PR002.jpg'),('PR002(1).jpg','','PR002.jpg'),('PR002(2).jpg','','PR002.jpg'),('PR002(3).jpg','','PR002.jpg'),
('PR003.jpg','1','PR003.jpg'),('PR003(1).jpg','','PR003.jpg'),('PR003(2).jpg','','PR003.jpg'),('PR003(3).jpg','','PR003.jpg'),
('PR004.jpg','1','PR004.jpg'),('PR004(1).jpg','','PR004.jpg'),('PR004(2).jpg','','PR004.jpg'),('PR004(3).jpg','','PR004.jpg'),
('PR005.jpg','1','PR005.jpg'),('PR005(1).jpg','','PR005.jpg'),('PR005(2).jpg','','PR005.jpg'),('PR005(3).jpg','','PR005.jpg'),
('PR006.jpg','1','PR006.jpg'),('PR006(1).jpg','','PR006.jpg'),('PR006(2).jpg','','PR006.jpg'),('PR006(3).jpg','','PR006.jpg'),
('PR007.jpg','1','PR007.jpg'),('PR007(1).jpg','','PR007.jpg'),('PR007(2).jpg','','PR007.jpg'),('PR007(3).jpg','','PR007.jpg'),
('PR008.jpg','1','PR008.jpg'),('PR008(1).jpg','','PR008.jpg'),('PR008(2).jpg','','PR008.jpg'),('PR008(3).jpg','','PR008.jpg'),
('PR009.jpg','1','PR009.jpg'),('PR009(1).jpg','','PR009.jpg'),('PR009(2).jpg','','PR009.jpg'),('PR009(3).jpg','','PR009.jpg'),
('PR010.jpg','1','PR010.jpg'),('PR010(1).jpg','','PR010.jpg'),('PR010(2).jpg','','PR010.jpg'),('PR010(3).jpg','','PR010.jpg'),
('PR011.jpg','1','PR011.jpg'),('PR011(1).jpg','','PR011.jpg'),('PR011(2).jpg','','PR011.jpg'),('PR011(3).jpg','','PR011.jpg'),
('PR012.jpg','1','PR012.jpg'),('PR012(1).jpg','','PR012.jpg'),('PR012(2).jpg','','PR012.jpg'),('PR012(3).jpg','','PR012.jpg'),
('PR013.jpg','1','PR013.jpg'),('PR013(1).jpg','','PR013.jpg'),('PR013(2).jpg','','PR013.jpg'),('PR013(3).jpg','','PR013.jpg'),
('PR014.jpg','1','PR014.jpg'),('PR014(1).jpg','','PR014.jpg'),('PR014(2).jpg','','PR014.jpg'),('PR014(3).jpg','','PR014.jpg'),
('PR015.jpg','1','PR015.jpg'),('PR015(1).jpg','','PR015.jpg'),('PR015(2).jpg','','PR015.jpg'),('PR015(3).jpg','','PR015.jpg'),
('PR016.jpg','1','PR016.jpg'),('PR016(1).jpg','','PR016.jpg'),('PR016(2).jpg','','PR016.jpg'),('PR016(3).jpg','','PR016.jpg'),
('PR017.jpg','1','PR017.jpg'),('PR017(1).jpg','','PR017.jpg'),('PR017(2).jpg','','PR017.jpg'),('PR017(3).jpg','','PR017.jpg'),
('PR018.jpg','1','PR018.jpg'),('PR018(1).jpg','','PR018.jpg'),('PR018(2).jpg','','PR018.jpg'),('PR018(3).jpg','','PR018.jpg'),
('PR019.jpg','1','PR019.jpg'),('PR019(1).jpg','','PR019.jpg'),('PR019(2).jpg','','PR019.jpg'),('PR019(3).jpg','','PR019.jpg'),
('PR020.jpg','1','PR020.jpg'),('PR040.jpg','1','PR040.jpg'),('PR060.jpg','1','PR060.jpg'),('PR080.jpg','1','PR080.jpg'),
('PR021.jpg','1','PR021.jpg'),('PR041.jpg','1','PR041.jpg'),('PR061.jpg','1','PR061.jpg'),('PR081.jpg','1','PR081.jpg'),
('PR022.jpg','1','PR022.jpg'),('PR042.jpg','1','PR042.jpg'),('PR062.jpg','1','PR062.jpg'),('PR082.jpg','1','PR082.jpg'),
('PR023.jpg','1','PR023.jpg'),('PR043.jpg','1','PR043.jpg'),('PR063.jpg','1','PR063.jpg'),('PR083.jpg','1','PR083.jpg'),
('PR024.jpg','1','PR024.jpg'),('PR044.jpg','1','PR044.jpg'),('PR064.jpg','1','PR064.jpg'),('PR084.jpg','1','PR084.jpg'),
('PR025.jpg','1','PR025.jpg'),('PR045.jpg','1','PR045.jpg'),('PR065.jpg','1','PR065.jpg'),('PR085.jpg','1','PR085.jpg'),
('PR026.jpg','1','PR026.jpg'),('PR046.jpg','1','PR046.jpg'),('PR066.jpg','1','PR066.jpg'),('PR086.jpg','1','PR086.jpg'),
('PR027.jpg','1','PR027.jpg'),('PR047.jpg','1','PR047.jpg'),('PR067.jpg','1','PR067.jpg'),('PR087.jpg','1','PR087.jpg'),
('PR028.jpg','1','PR028.jpg'),('PR048.jpg','1','PR048.jpg'),('PR068.jpg','1','PR068.jpg'),('PR088.jpg','1','PR088.jpg'),
('PR029.jpg','1','PR029.jpg'),('PR049.jpg','1','PR049.jpg'),('PR069.jpg','1','PR069.jpg'),('PR089.jpg','1','PR089.jpg'),
('PR030.jpg','1','PR030.jpg'),('PR050.jpg','1','PR050.jpg'),('PR070.jpg','1','PR070.jpg'),('PR090.jpg','1','PR090.jpg'),
('PR031.jpg','1','PR031.jpg'),('PR051.jpg','1','PR051.jpg'),('PR071.jpg','1','PR071.jpg'),('PR091.jpg','1','PR091.jpg'),
('PR032.jpg','1','PR032.jpg'),('PR052.jpg','1','PR052.jpg'),('PR072.jpg','1','PR072.jpg'),('PR092.jpg','1','PR092.jpg'),
('PR033.jpg','1','PR033.jpg'),('PR053.jpg','1','PR053.jpg'),('PR073.jpg','1','PR073.jpg'),
('PR034.jpg','1','PR034.jpg'),('PR054.jpg','1','PR054.jpg'),('PR074.jpg','1','PR074.jpg'),
('PR035.jpg','1','PR035.jpg'),('PR055.jpg','1','PR055.jpg'),('PR075.jpg','1','PR075.jpg'),
('PR036.jpg','1','PR036.jpg'),('PR056.jpg','1','PR056.jpg'),('PR078.jpg','1','PR076.jpg'),
('PR037.jpg','1','PR037.jpg'),('PR057.jpg','1','PR057.jpg'),('PR077.jpg','1','PR077.jpg'),
('PR038.jpg','1','PR038.jpg'),('PR058.jpg','1','PR058.jpg'),('PR078.jpg','1','PR078.jpg'),
('PR039.jpg','1','PR039.jpg'),('PR059.jpg','1','PR059.jpg'),('PR079.jpg','1','PR079.jpg')
go
insert into staff values
('admin001','Gail','0123456789','admin@giftshop.com','adrees','pw','1','1'),
('admin002','Gabriella','0123456789','admin01@giftshop.com','adrees','pw','2','1'),
('staff001','Georgina','0123456789','staff02@giftshop.com','adrees','pw','2','1'),
('staff002','Gertrude','0123456789','staff03@giftshop.com','adrees','pw','2','1'),
('staff003','Georgiana','0123456789','staff04@giftshop.com','adrees','pw','2','1'),
('staff004','Georgie','0123456789','staff05@giftshop.com','adrees','pw','2','1'),
('staff005','Gracie','0123456789','staff06@giftshop.com','adrees','pw','2','1'),
('staff006','Gloria','0123456789','staff07@giftshop.com','adrees','pw','2','1'),
('staff007','Gabriela','0123456789','staff08@giftshop.com','adrees','pw','2','1'),
('staff008','Gabriel','0123456789','staff09@giftshop.com','adrees','pw','2','1'),
('staff009','Gabriesa','0123456789','staff10@giftshop.com','adrees','pw','2','1')

go
insert into customer values
('Dylan Joseph White','user1@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Derek Matthew','user2@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Dustin Thomas','user3@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Devin Daniel','user4@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Name','user5@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Dray Joshua','user6@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Donell Samuel','user7@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Dhaval James','user8@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Derice Jack','user9@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Dereece Alexander','user10@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Dainton Luke','user11@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','1'),
('Dante','user12@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2'),
('Darcy','user13@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2'),
('Drew','user14@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2'),
('Delilah','user15@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2'),
('Thema ','user16@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2'),
('Doris','user17@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2'),
('Denise','user18@mail.com','Asdfdf1','address','cusPhone','cusAvt','1','2')
go
insert into feedback values
('Feedback Website','all the system is good for me','2019-06-06','1','3'),
('Feedback Website','use full website','2019-06-06','2','3'),
('Feedback Website','this website made me crazy','2019-06-07','3','3'),
('Feedback Website','i need this website','2019-06-02','4','3'),
('Feedback Website','nothing to blame','2019-06-03','5','3'),
('Feedback Website','there is alot bug in this website','2019-06-06','6','2'),
('Feedback Website','bad system','2019-06-06','7','3'),
('Feedback Website','nothing to say','2019-06-03','8','3'),
('Feedback Website','1 spamm','2019-06-03','9','3'),
('Feedback Website','2 spam','2019-06-06','10','3'),
('Feedback Website','nothing','2019-06-08','11','3'),
('Feedback Website','Something have to upgrade','2019-06-08','12','3'),
('Feedback Website','There is VIP','2019-06-08','13','3'),
('Feedback Website','vipbienhoa is best system','2019-06-10','14','3'),
('Feedback Website','more feature please','2019-06-10','15','3'),
('Feedback Website','there are still bug','2019-06-10','16','3'),
('Feedback Website','error website','2019-06-10','1','3')
go
insert into mailbox values
('Forgot password','staff001@giftshop.com','2019-06-04',null,'','',null,'0'),
('Forgot password','staff002@giftshop.com','2019-06-04',null,'','',null,'0'),
('Forgot password','staff003@giftshop.com','2019-06-04',null,'','',null,'0'),
('Forgot password','staff004@giftshop.com','2019-06-04',null,'','',null,'0')
go

insert into review values 
('Good product','this is very good','3','1','PR004'),
('Good product','this is very good','4','2','PR004'),
('Good product','this is very good','4','3','PR004'),
('Good product','this is very good','3','4','PR004'),
('Good product','this is very good','4','5','PR004'),
('Good product','this is very good','4','6','PR004'),
('Good product','this is very good','2','7','PR004'),
('Good product','this is very good','5','8','PR004'),
('Good product','this is very good','3','9','PR004'),
('Good product','this is very good','4','10','PR004'),
('Good product','this is very good','3','1','PR005'),
('Good product','this is very good','4','2','PR005'),
('Good product','this is very good','4','3','PR005'),
('Good product','this is very good','3','4','PR005'),
('Good product','this is very good','4','5','PR005'),
('Good product','this is very good','4','6','PR005'),
('Good product','this is very good','2','7','PR005'),
('Good product','this is very good','5','8','PR005'),
('Good product','this is very good','3','9','PR006'),
('Good product','this is very good','4','10','PR006'),
('Good product','this is very good','3','1','PR007'),
('Good product','this is very good','4','2','PR008'),
('Good product','this is very good','4','3','PR009'),
('Good product','this is very good','3','4','PR010'),
('Good product','this is very good','4','5','PR011'),
('Good product','this is very good','4','6','PR014'),
('Good product','this is very good','2','7','PR024'),
('Good product','this is very good','5','8','PR034'),
('Good product','this is very good','3','9','PR044'),
('Good product','this is very good','4','10','PR054')
go
insert into wishlist values('1','1','PR001'),
('1','2','PR001'),
('1','3','PR001'),
('1','4','PR001'),
('1','5','PR001'),
('1','6','PR001'),
('1','7','PR001'),
('1','8','PR001'),
('1','1','PR002'),
('1','1','PR003'),
('1','1','PR004'),
('1','1','PR005'),
('1','1','PR006'),
('1','2','PR004'),
('1','2','PR005'),
('1','2','PR006'),
('1','2','PR004'),
('1','2','PR005'),
('1','2','PR004'),
('1','2','PR005'),
('1','1','PR014'),
('1','1','PR015'),
('1','1','PR016'),
('1','1','PR026'),
('1','1','PR036')
go
insert into purchase values
 ('201906061000','1','120.00','1','2019-06-06','2019-06-09','Gabriel','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061001','2','400.00','3','2019-06-06','2019-06-09','Gladys ','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061002','3','200.00','3','2019-06-06','2019-06-09','Gertrude','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061003','4','312.00','3','2019-06-06','2019-06-09','Gabriela','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061004','5','210.00','3','2019-06-06','2019-06-09','Gloria','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061005','6','300.00','2','2019-06-06','2019-06-09','Georgiana','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061006','1','40.00','3','2019-06-06','2019-06-09','Gabriella','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906061007','1','120.00','3','2019-06-06','2019-06-09','Gabrielle','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071000','1','23.00','3','2019-06-07','2019-06-10','Gabriel','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071001','3','42.00','3','2019-06-07','2019-06-10','Gladys ','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071002','3','213.00','1','2019-06-07','2019-06-10','Gertrude','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071003','3','278.00','1','2019-06-07','2019-06-10','Gabriela','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071004','4','89.00','2','2019-06-07','2019-06-10','Gloria','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071005','3','76.00','2','2019-06-07','2019-06-10','Georgiana','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071006','2','45.00','3','2019-06-07','2019-06-10','Gabriella','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071007','1','200.00','3','2019-06-07','2019-06-10','Gabrielle','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071008','2','278.00','2','2019-06-07','2019-06-10','Gabriela','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071009','5','89.00','2','2019-06-07','2019-06-10','Gloria','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071010','3','76.00','2','2019-06-07','2019-06-10','Georgiana','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071011','2','32.00','2','2019-06-07','2019-06-10','Gabriella','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071012','6','278.00','3','2019-06-07','2019-06-10','Gabriela','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071013','9','32.00','3','2019-06-07','2019-06-10','Gloria','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071014','3','43.00','3','2019-06-07','2019-06-10','Georgiana','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071015','2','56.00','3','2019-06-07','2019-06-10','Gabriella','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071016','1','77.00','2','2019-06-07','2019-06-10','Gabrielle','290 CMT8 HCM CITY','0123456789','COD',''),
 ('201906071017','1','89.00','3','2019-06-07','2019-06-10','Gabrielle','290 CMT8 HCM CITY','0123456789','COD','')
go
insert into purchaseItem values 
('PR001','3','201906061000'),
('PR002','3','201906061000'),
('PR003','3','201906061000'),
('PR004','3','201906061000'),
('PR015','3','201906061000'),
('PR014','3','201906061000'),

('PR061','3','201906061001'),
('PR082','3','201906061001'),
('PR073','3','201906061001'),
('PR064','3','201906061001'),
('PR025','3','201906061001'),
('PR013','3','201906061001'),
('PR001','3','201906061001'),

('PR013','3','201906061002'),
('PR023','3','201906061002'),
('PR051','3','201906061002'),

('PR011','3','201906061002'),
('PR053','3','201906061002'),
('PR061','3','201906061002'),

('PR021','3','201906061003'),
('PR024','3','201906061003'),
('PR056','3','201906061003'),
('PR078','3','201906061003'),

('PR081','3','201906061004'),
('PR091','3','201906061004'),
('PR023','3','201906061004'),
('PR045','3','201906061004'),

('PR031','3','201906061005'),
('PR021','3','201906061005'),
('PR011','3','201906061005'),

('PR026','3','201906061006'),
('PR087','3','201906061006'),
('PR088','3','201906061006'),

('PR021','3','201906061007'),
('PR067','3','201906061007'),
('PR056','3','201906061007'),


('PR021','3','201906061007'),
('PR067','3','201906061007'),
('PR056','3','201906061007'),

('PR021','3','201906071001'),
('PR067','3','201906071002'),
('PR056','3','201906071002'),
('PR021','3','201906071002'),
('PR067','3','201906071003'),
('PR056','3','201906071004'),
('PR021','3','201906071005'),
('PR067','3','201906071006'),

('PR056','3','201906071007'),
('PR021','3','201906071007'),
('PR067','3','201906071007'),
('PR056','3','201906071007'),

('PR061','3','201906071008'),
('PR041','3','201906071008'),
('PR056','3','201906071008'),

('PR025','3','201906071009'),
('PR045','3','201906071009'),
('PR067','3','201906071009'),


('PR025','3','201906071010'),
('PR045','3','201906071010'),
('PR067','3','201906071010'),

('PR025','3','201906071011'),
('PR045','2','201906071011'),

('PR025','17','201906071012'),
('PR049','23','201906071012'),

('PR078','31','201906071013'),
('PR076','23','201906071013'),

('PR026','32','201906071014'),
('PR034','18','201906071015'),
('PR023','7','201906071016'),
('PR062','1','201906071017'),
('PR063','2','201906071017'),
('PR061','4','201906071017')



go
/*
insert into post values
()
go
insert into customer values()
go
insert into reply values()
go
insert into likes values()
go

*/

