drop database Promotit 

create database Promotit 

create table Users ( ID int Primary key identity,
Name nvarchar(30) not null,
Email nvarchar(40) not null,
Role nvarchar (40) not null,
Adress nvarchar(50), 
PhoneNumber nvarchar (15),
Link nvarchar(70),
Money money) 

create table Campaigns (ID int primary key identity, URL nvarchar(70), Hashtag nvarchar(50), 
NonProfitID int foreign key references Users(ID)) 

create table Products (ID int Primary key identity, 
ProductName nvarchar(30),  
UnitPrice Money,
Amount int,
SupplierID int foreign key references Users(ID), 
CampaignID int foreign key references Campaigns(ID))

create table Purchases (ID int primary key identity, 
ActivistID int foreign key references Users(ID), 
ProductID int foreign key references Products(ID), 
IsKeeping bit,
Amount int)

create table Twitter (ID int primary key identity,
TweetID nvarchar(40),
ActivistID int foreign key references Users(ID),
CampaignID int foreign key references Campaigns(ID),
TweetHashtag nvarchar(50),
TweetText nvarchar(100),
Date Date,
Time Time)