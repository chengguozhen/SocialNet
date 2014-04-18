
-- this sql script is used to create schema for our database
drop table if exists `account`;
drop table if exists `friend`;
-- comment is a reserved key word, pay attention to that
drop table if exists `comment`;
drop table if exists `message`;

-- create table for storing account information
create table if not exists `account` (
	userID char(32) not null primary key,
	passwd char(32) not null,
	userName char(64) not null,
	sex char(8) not null,
	birthday date not null	
);

-- create table for friends
create table if not exists `friend` (
	userID1 char(32) not null,
	userID2 char(32) not null
);

-- create table for messages
create table if not exists `message` (
	messageID int not null auto_increment primary key,
	userID char(32) not null,
	publishTime datetime not null,
	content char(140) not null	
);

-- create table for comments
create table if not exists `comment` (
	commentID int not null auto_increment primary key,
	userID char(20) not null, -- the user who replied this message
	messageID int not null,
	publishTime datetime not null,
	content char(140) not null
);

-- insert some data into databases for purpose of debugging
insert into `account` values ('1', '123', 'wangliang', 'M', '1992-1-19');
insert into `account` values ('2', '345', 'taylor', 'F', '1983-3-25');
insert into `friend` values ('1', '2');
insert into `message` values ('1', '1', '2014-4-12 15:01:32', 'life is amazing');
insert into `message` values ('2', '1', '2014-4-13 13:01:43', 'a good day');
insert into `comment` values ('1001', '1', '1', '2014-5-23 10:09:56', 'I totally agree');



