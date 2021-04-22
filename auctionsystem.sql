DROP DATABASE auctionsystem;
CREATE DATABASE IF NOT EXISTS auctionsystem;
USE auctionsystem;

CREATE TABLE account(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
address varchar(30) NOT NULL,
email varchar(30) NOT NULL,
name varchar(50) NOT NULL,
account_type varchar(50),
primary key(username));
INSERT INTO account VALUES ('kuhu27' , 'halder', '1202', 'kuhu@com', 'kuhu', 'customerrep'), ('pink' , 'pink', '1202', 'pink@com', 'pink', 'buyer'), ('prince' , 'rawal', '1202', 'pink@com', 'pink', 'buyer'), ('farah01' , 'lubaba', 'saudi', 'farah@com', 'farah', 'customerrep'),('jigisha19' , 'mavani', 'edison', 'jigisha@com', 'jigisha', 'customerrep'), ('prince18', '1234', 'newbrunswick', 'prince@com', 'prince', 'admin');

CREATE TABLE customerrep(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references account(username)
);

INSERT INTO customerrep VALUES ('kuhu27' , 'halder'), ('farah01' , 'lubaba'),('jigisha19' , 'mavani');

CREATE TABLE admin(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references account(username)
);

INSERT INTO admin VALUES ('prince18' , '1234');

CREATE TABLE product(
	product_id INT AUTO_INCREMENT,
	category VARCHAR(50) default null,
	brand VARCHAR(25) default null,
    color VARCHAR(20) default null,
    gender VARCHAR(20) default null,
    seller varchar(20) default null,
    foreign key(seller) references account(username) on delete cascade,
	PRIMARY KEY(product_id)
);

CREATE TABLE auction(
	auction_id INT AUTO_INCREMENT,
    product_id int,
	seller VARCHAR(50) default null,
    new_bid_increment float default 1,
    min_price float default 0,
	price float default 0,
	status varchar(10) default null,
	start_date DATETIME default now(),
    end_date DATETIME,
    winner VARCHAR(20) default null,
    current_bid float default 0,
	PRIMARY KEY(auction_id, product_id),
	foreign key(seller) references product(seller) ON DELETE CASCADE,
    foreign key(product_id) references product(product_id)
);

CREATE TABLE bid(
bid_id INT AUTO_INCREMENT,
buyer varchar(50) default null, 
upper_limit float default 0, 
is_autobid BOOLEAN default false,
bid_increment float default 0,
amount float default 0,
auction_id int, 
primary key(bid_id),
foreign key(buyer) references account(username) ON DELETE SET NULL,
foreign key(auction_id) references auction(auction_id) ON DELETE CASCADE
);
CREATE TABLE alerts(
alert_id INT AUTO_INCREMENT,
username varchar(50),
alert_message varchar(1000),
product_id int default 0,
auction_id int default 0, 
primary key(alert_id, username),
foreign key(username) references account(username) ON DELETE CASCADE,
foreign key(product_id) references product(product_id));

CREATE TABLE questions(
	question_id INT AUTO_INCREMENT,
    username VARCHAR(50),
    customerrep_username VARCHAR(50),
    question VARCHAR(250),
    answer VARCHAR(250) DEFAULT NULL,
    PRIMARY KEY (question_id)
);

insert into product values(1, 'analog watches', 'rolex', 'brown', 'girl', 'prince');
INSERT INTO auction values(1,1,'prince', 1, 90, 10, 'open', now(), '2021-04-10 22:50:59', null, 0) ;
insert into product values(2, 'digital watches', 'mont blanc', 'red', 'nb', 'pink');
INSERT INTO auction values(2,2,'pink', 1, 900, 100, 'open', now(), '2021-04-10 22:50:59', null, 0) ;
insert into product values(3, 'digital watches', 'titan', 'silver', 'girl', 'pink');
INSERT INTO auction values(3,3,'pink',1, 80, 20, 'open', now(), '2021-5-13 22:50:59', null, 0) ;
INSERT INTO auction values(4,3,'pink', 1, 80, 20, 'open', now(), '2021-5-13 22:50:59', null, 0) ;
insert into auction values(5,3, 'pink',1, 100, 10, 'open', '2020-5-13 22:50:59', '2021-5-13 22:50:59', null, 0);
insert into auction values(6,3, 'pink', 1, 100, 10, 'open', '2020-5-13 22:50:59', '2021-5-13 22:50:59', null, 0);
