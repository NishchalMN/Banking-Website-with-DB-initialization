\c railways
create table if not exists users
(	user_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	aadhar_no varchar(20),
	gender char,age int,
	mobile_no varcahr(20),
	email varchar(20),
	city varchar(50),
	state varchar(50),
	pincode varchar(20),
	password varchar(50)
);

create table if not exists train
(	train_no int primary key,
	train_name varchar(50),
	arrival_time time,
	departure_time time,
	available_no_of_seats char(3),
	date date
);

create table if not exists station
(	station_id int,
	name varchar(50),
	arrival_time time,
	train_no int,
	primary key(station_id,train_no),
	foreign key(train_no) references train(train_no)
);

create table if not exists ticket
(	ticket_id int primary key,
	user_id int,
	reservation_status char,
	no_of_passengers int,
	train_no int,
	foreign key(user_id) references users(user_id),
	foreign key(train_no) references train(train_no)
);

create table if not exists passenger
(	passenger_id int primary key,
	pnr_no int,age int,
	gender char,
	user_id int,
	reservation_staus char,
	seat_no varchar(5),
	name varchar(50),
	ticket_id int,
	foreign key(user_id) references users(user_id),
	foreign key(ticket_id) references ticket(ticket_id)
);

create table if not exists starts
(	train_no int primary key,
	station_id int,
	foreign key(train_no) references train(train_no),
	foreign key(station_id) references station(station_id)
);

create table if not exists starts
(	train_no int primary key,
	station_id int,
	foreign key(train_no,station_id) references station(train_no,station_id)
);

create table if not exists stops_at
(	train_no  int primary key,
	station_id int,
	foreign key(train_no,station_id) references station(train_no,station_id)
);

create table if not exists books
(	user_id int,
	ticket_id int,
	foreign key(user_id) references users(user_id),
	foreign key(ticket_id) references ticket(ticket_id)
);

create table if not exists cancels
(	user_id int,
	ticket_id int,
	passenger_id int,
	foreign key(user_id) references users(user_id),
	foreign key(ticket_id) references ticket(ticket_id),
	foreign key(passenger_id) references passenger(passenger_id)
);


ALTER TABLE train ALTER COLUMN available_no_of_seats TYPE character(3);
ALTER TABLE ticket ALTER COLUMN reservation_status TYPE character(2);
ALTER TABLE passenger ALTER COLUMN TYPE reservation_staus TYPE character(2);

insert into users values
(1111111,'Ashutosh','Banerjee','99999999','M','20','9878787878','ashutoshban@gmail.com','Kolkata','West Bengal','460012','ashuban@123'),
(1111112,'Anshuman','Banerjee','99998999','M','30','9858787878','anshumanban@gmail.com','Kolkata','West Bengal','460015','anshuban@123'),
(1111113,'Ayush','Mukherjee','99999979','M','30','9878717878','ayushmukh@yahoo.com','Darjeeling','West Bengal','461012','ayushkher@123'),
(1111114,'Ashish','Upadhyay','99599999','M','35','9978787878','ashishyay@hotmail.com','Lucknow','Uttar Pradesh','470012','ashupy@193'),
(1111115,'Bimal','Nair','99949999','M','25','9878887878','bimalnair@gmail.com','Thrissur','Kerala','660012','bimaln@123'),
(1111116,'Mohini','Iyer','99999799','F','27','9877787878','mohinier@rediffmail.com','Madurai','Tamil Nadu','650012','mohiner@233'),
(1111117,'Shweta','Nair','99399999','F','25','9878787678','shwetan@gmail.com','Ernakulam','Kerala','670012','shwenir@123'),
(1111118,'Pallavi','Bhatt','99299999','F','35','9848787878','pallavi@yahoo.com','Amritsar','Punjab','260017','pallette@143'),
(1111119,'Ravi','Purohit','99919999','M','26','9878737878','ravipurohit@gmail.com','Allahabad','Uttar Pradesh','360012','ravroars@123'),
(1111120,'Ramani','Iyengar','99999099','F','40','9878787828','ramangar@gmail.com','Chennai','Tamil Nadu','610012','ramanigar@432'),
(1111121,'Alice','Thomas','92999099','F','20','9878782828','alitom@gmail.com','Ooty','Tamil Nadu','640012','alimas@546');

insert into train values
(8564,'Shatabdi express','113000','114500',12),
(4324,'Nethravathi express','140000','142000',9),
(4343,'Nizamuddin express','124500','125500',3),
(1234,'Karnataka express','192000','194000',4),
(4534,'Rajdhani express','153000','154500','NA'),
(4353,'Bangalore express','200000','201000','NA'),
(8979,'Tuticorin express','143000','144000',2),
(6576,'Konkan express','233000','234500','NA');

insert into station values
(3232,'Bangalore city junction','103000',8564),
(3543,'Chatrapati Shivaji Terminus','223000',6576),
(5432,'Chennai central','143000',8564),
(3232,'Bangalore city junction','182000',1234),
(7656,'Secunderabad central','143000',4534),
(3543,'Chatrapati Shivaji Terminus','100000',4324),
(3232,'Chennai central','133000',8979),
(8769,'Trivandrum central','130000',4324),
(3232,'Bangalore city junction','070000',4353),
(9662,'Panaji junction','080000',6576),
(9772,'Delhi junction','154500',4343),
(9882,'Tuticorin junction','220000',8979);

insert into ticket values
(0100,1111111,'C',3,8564),
(0101,1111112,'NC',2,4324),
(0102,1111113,'W',3,8564),
(0103,1111116,'C',3,4534),
(0104,1111112,'NC',5,1234),
(0105,1111114,'C',3,8979),
(0106,1111118,'W',3,6576),
(0107,1111119,'W',2,4534),
(0108,1111112,'C',3,4353),
(0109,1111115,'NC',3,6576),
(0110,1111117,'C',4,4353);

insert into passenger values
(21324,32124,24,'F',1111113,'W','A2-23','Geetha',0102),
(21524,33124,34,'F',1111114,'C','B1-23','Preetha',0105),
(21664,34124,24,'M',1111115,'NC','B2-23','Rajeev',0109),
(210724,35124,44,'M',1111116,'C','B3-23','Gautham',0103),
(21334,36124,24,'F',1111117,'C','S1-23','Seetha',0110),
(21824,37124,34,'M',1111118,'W','S2-23','Ravishankar',0106),
(21774,38124,54,'F',1111119,'W','S3-23','Roopa',0107),
(21924,39124,24,'F',1111112,'C','S4-23','Rebecca',0108),
(21994,40124,34,'M',1111112,'NC','S5-23','Shyam',0101),
(21444,41124,44,'F',1111112,'NC','S6-23','Nazreen',0104);

insert into starts values
(8564,3232),
(1234,3232),
(4343,9772),
(6576,3543),
(8979,9882),
(4534,7656),
(4353,3232),
(4324,3543);

insert into stops_at values
(8564,3232),
(4324,8769),
(4343,9772),
(1234,3232),
(4534,7656),
(4353,3232),
(8979,9882),
(6576,3543);

insert into books values
(1111111,0100),
(1111112,0104),
(1111113,0102),
(1111114,0105),
(1111115,0109),
(1111116,0103),
(1111117,0110),
(1111118,0106),
(1111119,0107),
(1111120,0108),
(1111121,0101);

insert into cancels values
(1111111,0100,21324),
(1111112,0104,21444),
(1111113,0102,21324),
(1111114,0105,21524),
(1111115,0109,21664),
(1111116,0103,210724),
(1111117,0110,21444),
(1111118,0106,21824),
(1111119,0107,21774),
(1111120,0108,21924),
(1111121,0101,21994);