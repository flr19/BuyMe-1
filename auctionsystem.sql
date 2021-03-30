
DROP DATABASE `auctionsystem`;
CREATE DATABASE IF NOT EXISTS `AuctionSystem`;
USE AuctionSystem;

CREATE TABLE account(
`username` varchar(30) 	NOT NULL,
`password` varchar(30) 	NOT NULL,
`address` varchar(30) NOT NULL,
`email` varchar(30) NOT NULL,
`name` varchar(50) NOT NULL,
primary key(`username`));
INSERT INTO `account` VALUES ('kuhu27' , 'halder', '1202', 'kuhu@com', 'kuhu'), ('farah01' , 'lubaba', 'saudi', 'farah@com', 'farah'),('jigisha19' , 'mavani', 'edison', 'jigisha@com', 'jigisha'), ('prince18', '1234', 'newbrunswick', 'prince@com', 'prince');


CREATE TABLE product(
`productid` int NOT NULL,
`minprice` int 	NOT NULL,
`seller` varchar(30) 	NOT NULL,
`price` int NOT NULL,
`category` varchar(30) NOT NULL,
`currentbid` int NOT NULL,
primary key(`productid`));

CREATE TABLE bid(
username varchar(50) NOT NULL, 
upperlimit int NOT NULL, 
bidHistory varchar(20) NOT NULL, 
bidIncremen int NOT NULL,
productid int NOT NULL, 
primary key(username, productid),
foreign key(username) references account(username),
foreign key(productid) references product(productid));

CREATE TABLE alert(
`username` varchar(50) NOT NULL, 
`userbid` int NOT NULL, 
`productid` int NOT NULL, 
primary key(`username`, `productid`),
foreign key(`username`) references account(username),
foreign key(`productid`) references product(productid));

CREATE TABLE sell(
`username` varchar(50) NOT NULL, 
`reserve` int NOT NULL, 
`enddate` int NOT NULL, 
`endtime` int NOT NULL, 
`productid` int NOT NULL,
primary key(`productid`),
foreign key(`username`) references account(username),
foreign key(`productid`) references product(productid));

CREATE TABLE users(
`username` varchar(30) 	NOT NULL,
`password` varchar(30) 	NOT NULL,
primary key(`username`),
foreign key(`username`) references account(username));

CREATE TABLE customerrep(
`username` varchar(30) 	NOT NULL,
`password` varchar(30) 	NOT NULL,
primary key(`username`),
foreign key(`username`) references account(username));

INSERT INTO `customerrep` VALUES ('kuhu27' , 'halder'), ('farah01' , 'lubaba'),('jigisha19' , 'mavani');

CREATE TABLE admin(
`username` varchar(30) 	NOT NULL,
`password` varchar(30) 	NOT NULL,
primary key(`username`),
foreign key(`username`) references account(username));

INSERT INTO `admin` VALUES ('prince18' , '1234');

