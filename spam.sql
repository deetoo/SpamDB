CREATE DATABASE SpamDB;

CREATE TABLE SpamDB.SpamTable ( 
	id int auto_increment,
	FirstName varchar(20),
	LastName varchar(20),
	PRIMARY KEY(id)
);

GRANT ALL PRIVILEGES ON SpamDB.* TO SpamUser@localhost IDENTIFIED BY 'SpamPass';
