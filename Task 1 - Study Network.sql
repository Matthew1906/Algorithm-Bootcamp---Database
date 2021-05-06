
-- CREATE DATABASE
CREATE DATABASE StudentNetwork

-- Use Database
USE StudentNetwork

-- CREATE USERS TABLE
CREATE TABLE Users(
	UserId CHAR(5) PRIMARY KEY CHECK(UserId = 'US[0-9][0-9][0-9]'),
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	School varchar(255) NOT NULL,
	UserAddress varchar(255) NOT NULL,
	-- I CHANGED IT BECAUSE ADDRESS IS A KEYWORD
	Email varchar(255) NOT NULL CHECK(Email like '%@%'),
	PhoneNumber varchar(12) NOT NULL 
		CHECK(PhoneNumber = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
		OR PhoneNumber = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
		OR PhoneNumber = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	-- MUST CONTAIN 10 - 12 NUMBERS
	UserLocation varchar(255) NOT NULL,
	Gender varchar(10) NOT NULL 
		CHECK(Gender = 'Male' or Gender = 'Female'),
	DateOfBirth date NOT NULL
)

-- CREATE FRIENDS TABLE
CREATE TABLE Friends(
	UserId CHAR(5) CHECK(UserId = 'US[0-9][0-9][0-9]'),
	FriendId CHAR(5) CHECK(FriendId = 'FR[0-9][0-9][0-9]'),
	CONSTRAINT FriendPK PRIMARY KEY(UserId, FriendId),
	CONSTRAINT UserFK FOREIGN KEY(UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
)

-- CREATE PAGES TABLE
CREATE TABLE Pages(
	PageId CHAR(5),
	PageName varchar(255) NOT NULL, 
	PageContent varchar(MAX),
	CONSTRAINT PagePK PRIMARY KEY(PageId),
	CONSTRAINT PageCheck CHECK(PageId like 'PG[0-9][0-9][0-9]')
)

-- CREATE PAGELIKES TABLE
CREATE TABLE PageLikes(
	UserId CHAR(5) CHECK(UserId = 'US[0-9][0-9][0-9]'),
	PageId CHAR(5) CHECK(PageId = 'PG[0-9][0-9][0-9]'),
	CONSTRAINT PageLikePK PRIMARY KEY(UserId, PageId),
	CONSTRAINT UserFKLikes FOREIGN KEY(UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PageFKLikes FOREIGN KEY(PageId) REFERENCES Pages(PageId) ON UPDATE CASCADE ON DELETE CASCADE,
)

-- CREATE TABLE POSTS
CREATE TABLE Posts(
	PostId char(5) PRIMARY KEY CHECK(PostId ='PO[0-9][0-9][0-9]'),
	UserId char(5) UNIQUE CHECK(UserId ='US[0-9][0-9][0-9]'),
	PostDate date NOT NULL,
	PostContent varchar(max),
	CONSTRAINT UserPostFK FOREIGN KEY(UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE
)

-- CREATE TABLE POSTLIKES
CREATE TABLE PostLikes(
	UserId CHAR(5) CHECK(UserId = 'US[0-9][0-9][0-9]') UNIQUE,
	PostId CHAR(5) CHECK(PostId = 'PO[0-9][0-9][0-9]') UNIQUE,
	CONSTRAINT PostLikesPK PRIMARY KEY(UserId, PostId),
	CONSTRAINT UserFKPostLikes FOREIGN KEY(UserId) REFERENCES Posts(UserId),
	CONSTRAINT FKPostLikes FOREIGN KEY(PostId) REFERENCES Posts(PostId)
)

-- CREATE TABLE Photos
CREATE TABLE Photos(
	PhotoId CHAR(5) PRIMARY KEY CHECK(PhotoId ='PH[0-9][0-9][0-9]'),
	PostId CHAR(5) CHECK(PostId = 'PO[0-9][0-9][0-9]'),
	ImageContent varchar(max) NOT NULL,
	constraint PostsFKPhotos FOREIGN KEY(PostId) REFERENCES Posts(PostId) ON UPDATE CASCADE ON DELETE SET NULL
)

-- create table SHARES
CREATE TABLE Shares(
	UserId CHAR(5) CHECK(UserId = 'US[0-9][0-9][0-9]') UNIQUE,
	PostId CHAR(5) CHECK(PostId = 'PO[0-9][0-9][0-9]') UNIQUE,
	CONSTRAINT SharesPK PRIMARY KEY(UserId, PostId),
	CONSTRAINT UserFKShares FOREIGN KEY(UserId) REFERENCES Posts(UserId),
	CONSTRAINT PostFKShares FOREIGN KEY(PostId) REFERENCES Posts(PostId)
)

CREATE TABLE Comments(
	CommentId CHAR(5) PRIMARY KEY CHECK(CommentId ='CO[0-9][0-9][0-9]'),
	UserId CHAR(5) CHECK(UserId = 'US[0-9][0-9][0-9]') UNIQUE,
	PostId CHAR(5) CHECK(PostId = 'PO[0-9][0-9][0-9]') UNIQUE,
	CommentDate date NOT NULL,
	CommentContent varchar(max),
	CONSTRAINT UserFKComments FOREIGN KEY(UserId) REFERENCES Posts(UserId),
	CONSTRAINT PostFKComments FOREIGN KEY(PostId) REFERENCES Posts(PostId)
)

CREATE TABLE CommentLikes(
	UserId CHAR(5) CHECK(UserId = 'US[0-9][0-9][0-9]') UNIQUE,
	CommentId CHAR(5) CHECK(CommentId = 'CO[0-9][0-9][0-9]'),
	CONSTRAINT CommentLikesPK PRIMARY KEY(UserId, CommentId),
	CONSTRAINT UserFKCommentLikes FOREIGN KEY(UserId) REFERENCES Posts(UserId),
	CONSTRAINT CommentFKLikes FOREIGN KEY(CommentId) REFERENCES Comments(CommentId)
)

-- DROP THE DATABASE
DROP DATABASE StudentNetwork


