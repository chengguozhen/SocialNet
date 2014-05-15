
-- this sql script is used to create schema for our database
drop table if exists `account`;
drop table if exists `friend`;
-- comment is a reserved key word, pay attention to that
drop table if exists `comment`;
drop table if exists `message`;
drop table if exists `request`;
drop table if exists `group`;
drop table if exists `groupInfo`;

-- create table for friends request
create table if not exists `request` (
    fromUser char(32) not null,
    toUser char(32) not null
) default charset=utf8;;

-- create table for group information
create table if not exists `group` (
    groupID int not null auto_increment primary key,
    groupName char(32) not null
) default charset=utf8;;

-- create table for group information
create table if not exists `groupInfo` (
    groupID int not null,
    userID char(32) not null
) default charset=utf8;;

-- create table for storing account information
create table if not exists `account` (
	userID char(32) not null primary key,
	passwd char(32) not null,
	userName char(64) not null,
	sex char(8) not null,
	birthday date not null	
) default charset=utf8;;

-- create table for friends
create table if not exists `friend` (
	userID1 char(32) not null,
	userID2 char(32) not null
) default charset=utf8;;

-- create table for messages
create table if not exists `message` (
	messageID int not null auto_increment primary key,
	userID char(32) not null,
	publishTime datetime not null,
	content char(140) not null	
) default charset=utf8;;

-- create table for comments
create table if not exists `comment` (
	commentID int not null auto_increment primary key,
	userID char(20) not null, -- the user who replied this message
	messageID int not null,
	publishTime datetime not null,
	content char(140) not null
);

-- insert some data into databases for purpose of debugging
insert into `account` values ('david@pku.edu.cn', '123', 'david', 'M', '1992-3-5');
insert into `request` values ('david@pku.edu.cn', 'wang@pku.edu.cn');
insert into `group` values ('100', 'programming' );
insert into `groupInfo` values ('100', 'wang@pku.edu.cn');
insert into `groupInfo` values ('100', 'talor@pku.edu.cn');
insert into `account` values ('wang@pku.edu.cn', '123', 'wangliang', 'M', '1992-1-19');
insert into `account` values ('taylor@pku.edu.cn', '345', 'taylor', 'F', '1983-3-25');
insert into `friend` values ('wang@pku.edu.cn', 'taylor@pku.edu.cn');
insert into `friend` values ('taylor@pku.edu.cn', 'wang@pku.edu.cn');
insert into `message` values ('1', 'wang@pku.edu.cn', '2014-4-12 15:01:32', 'life is amazing');
insert into `message` values ('2', 'wang@pku.edu.cn', '2014-4-13 13:01:43', 'a good day');
insert into `comment` values ('1001', 'wang@pku.edu.cn', '1', '2014-5-2 10:09:56', 'I totally agree');
insert into `message` values ('3', 'david@pku.edu.cn', '2014-5-6 12:01:23', "Hey, I am David!");


