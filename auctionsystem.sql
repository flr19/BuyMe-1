DROP DATABASE auctionsystem;
CREATE DATABASE IF NOT EXISTS auctionsystem;
USE auctionsystem;

CREATE TABLE account(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
address varchar(30) NOT NULL,
email varchar(30) NOT NULL,
name varchar(50) NOT NULL,
primary key(username));
INSERT INTO account VALUES ('kuhu27' , 'halder', '1202', 'kuhu@com', 'kuhu'), ('pink' , 'pink', '1202', 'pink@com', 'pink'), ('farah01' , 'lubaba', 'saudi', 'farah@com', 'farah'),('jigisha19' , 'mavani', 'edison', 'jigisha@com', 'jigisha'), ('prince18', '1234', 'newbrunswick', 'prince@com', 'prince');


CREATE TABLE product(
	product_id INT AUTO_INCREMENT,
	category VARCHAR(50) NOT NULL,
	brand VARCHAR(25) NOT NULL,
    color VARCHAR(20),
    gender VARCHAR(20),
	seller VARCHAR(50) NOT NULL,
    min_price DECIMAL (20,2) NOT NULL,
	price DECIMAL(20,2) NOT NULL,
	status BOOLEAN,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    winner VARCHAR(20),
	PRIMARY KEY(product_id),
    foreign key(seller) references account(username)
);

CREATE TABLE bid(
bid_id INT AUTO_INCREMENT,
username varchar(50) NOT NULL, 
upper_limit int NOT NULL, 
-- bidHistory varchar(20) NOT NULL, 
bid_increment int NOT NULL,
amount DECIMAL (20,2) NOT NULL,
product_id int NOT NULL, 
primary key(bid_id, username, product_id),
foreign key(username) references account(username),
foreign key(product_id) references product(product_id));

CREATE TABLE alerts(
alert_id INT AUTO_INCREMENT,
username varchar(50) NOT NULL, 
alert_message varchar(50),
user_bid int NOT NULL, 
product_id int NOT NULL, 
primary key(alert_id, username, product_id),
foreign key(username) references account(username),
foreign key(product_id) references product(product_id));

CREATE TABLE questions(
	question_id INT AUTO_INCREMENT,
    username VARCHAR(50),
    question VARCHAR(250) NOT NULL,
    answer VARCHAR(250) DEFAULT NULL,
    FOREIGN KEY (username) REFERENCES account(username),
		-- ON DELETE CASCADE,
    PRIMARY KEY (question_id)
);
-- CREATE TABLE sell(
-- username varchar(50) NOT NULL, 
-- reserve int NOT NULL, 
-- end_date int NOT NULL, 
-- endt_ime int NOT NULL, 
-- product_id int NOT NULL,
-- primary key(product_id),
-- foreign key(username) references account(username),
-- foreign key(product_id) references product(product_id));

CREATE TABLE users(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references account(username)
-- foreign key(password) references account(password)
);

insert into users values('pink', 'pink');

CREATE TABLE buyers(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references users(username)
-- foreign key(password) references users(password)
);

CREATE TABLE sellers(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references users(username)
-- foreign key(password) references users(password)
);

CREATE TABLE customerrep(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references account(username)
-- foreign key(password) references account(password)
);

INSERT INTO customerrep VALUES ('kuhu27' , 'halder'), ('farah01' , 'lubaba'),('jigisha19' , 'mavani');

CREATE TABLE admin(
username varchar(30) 	NOT NULL,
password varchar(30) 	NOT NULL,
primary key(username),
foreign key(username) references account(username)
-- foreign key(password) references account(password)
);

INSERT INTO admin VALUES ('prince18' , '1234');
