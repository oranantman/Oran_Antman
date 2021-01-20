CREATE DATABASE ShiftProject
USE ShiftProject
CREATE TABLE Employees
(
    EmployeeID int PRIMARY KEY identity (1,1) ,
	PersonalId varchar(9) NOT NULL,
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    City varchar(20) NOT NULL,
    Street varchar(20) NOT NULL,
    HomeNum int NOT NULL,
	Phone varchar(9) unique ,
	Email varchar(50) unique  NOT NULL,
	Birthday date NOT NULL,
	Check(Len(PersonalID)=9),
	Check(Email LIKE '%@%.%')
) --------
CREATE TABLE Companies
(
    CompanyId varchar(7) PRIMARY KEY ,
    CompanyName varchar(20) NOT NULL,
    CompanyAdress varchar(20) ,
	Check(Len(CompanyId)=7)
) 
------------
CREATE TABLE Premissions
(
    PermissionId int PRIMARY KEY identity (100,1) ,
    PermissionName varchar(20) unique NOT NULL ,
	AddOptions bit NOT NULL,
	EditOption bit NOT NULL,
	WatchWorkerOrder bit NOT NULL,
	CreateWorkerOrder bit NOT NULL,
	CloseWorkerOrder bit NOT NULL,
	ReportHourWorker bit NOT NULL,
	AddWroker bit NOT NULL,
	AddCompany bit NOT NULL
) 
-----------
CREATE TABLE Roles
(
	RoleId int Primary key identity (1000,1),
	RoleName varchar(20) NOT NULL

)
-----------------
CREATE TABLE EmpAtCompany
(
	EmployeeId int  ,
	CompanyId varchar(7) ,
	PermissionId int,
	RoleId  int  ,
	UsernNme varchar(20) NOT NULL,
	UserPassword varchar(20) NOT NULL,
	WagePerHour money  NOT NULL,
	check (WagePerHour between 0 and 1000000),
	primary key(EmployeeId,CompanyId),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	FOREIGN KEY (CompanyId) REFERENCES Companies(CompanyId),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
	FOREIGN KEY (PermissionID) REFERENCES Premissions(PermissionId)
)
-----------------
CREATE TABLE ShiftsType
(
	ShiftID  int Primary key ,
	StartHour time NOT NULL,
	EndHour time NOT NULL,
	CompanyId varchar(7),
	FOREIGN KEY (CompanyId) REFERENCES Companies(CompanyId)
)
----------------
CREATE TABLE WorkSchedule
(
	ShiftDate date,
	ShiftID int,
	EmployeeID int,
	RoleId int ,
	Assigning bit Default 0 NOT NULL, 
	PRIMARY KEY (ShiftDate,ShiftID,EmployeeID),
	FOREIGN KEY (ShiftID) REFERENCES ShiftsType(ShiftID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
	)
------------------
CREATE TABLE ShiftStatus
(
	ShiftDate  date ,
	ShiftID  int,
	RoleId int,
	NumInShift int,
	InClose bit NOT NULL,
	PRIMARY KEY(ShiftDate,ShiftID,RoleId),
	FOREIGN KEY (ShiftID) REFERENCES ShiftsType(ShiftID),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)

)
	
---------------------
CREATE TABLE ActualShift
(
	ShiftDate date,
	ShiftId int ,
	EmployeeId int, 
	RoleId int,
	WagePerHour money,
	PRIMARY KEY (ShiftDate,ShiftID,EmployeeID),
	FOREIGN KEY (ShiftID) REFERENCES ShiftsType(ShiftID),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)

)
-------------

	insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Ofir', 'Levi', 'Shoham', 'Macabim',80,'052789587','Ofir@gmail.com','1990-06-06');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('216237356', 'Yogev', 'Sitbon', 'Shoham', 'Rimonin',42,'059685472','yogev@gmail.com','1990-04-05');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('215268742', 'Dor', 'Gilad', 'Ramat Gan', 'Bialik',25,'055478692','dor@gmail.com','1979-03-10');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('256873793', 'Ron', 'Amiel', 'Ashdod', 'Arazim',12,'058745325','ron@gmail.com','1990-08-04');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Yonatan', 'Maoz', 'Rishon', 'Negba',14,'056214876','yonatan@gmail.com','1991-10-01');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Hen', 'Gamper', 'Rishon', 'Hitim',52,'058732146','heng@gmail.com','1996-10-06');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Yarin', 'Sigavi', 'Azur', 'Shemesh',44,'051423578','yarin@gmail.com','1990-01-16');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Eden', 'Eliash', 'Yavne', 'Elen',59,'053698653','eden@gmail.com','1994-10-09');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Hen', 'Lev', 'Holon', 'Dorim',11,'053287542','henl@gmail.com','1988-12-11');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Gil', 'Refael', 'Tel Aviv', 'Tira',19,'055697854','gil@gmail.com','1979-10-10');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Yosi', 'Hiti', 'Ramat Gan', 'Migdal',52,'053987586','yosi@gmail.com','1984-12-12');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Nati', 'Hamat', 'Rishon', 'Maagal',75,'053124879','nati@gmail.com','1994-03-06');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Or', 'Amiel', 'Ashdod', 'Zait',18,'052145789','Or@gmail.com','1982-01-08');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Oran', 'Antman', 'Ramat gan', 'Seora',83,'053879542','Oran@gmail.com','1985-02-03');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Gil', 'Hamo', 'Jerusalem', 'Hita',94,'055897878','gil1@gmail.com','1989-01-01');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Ben', 'Oringer', 'Raanana', 'Hadar',84,'056875421','ben1@gmail.com','1992-06-26');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Nadav', 'Raz', 'Carmiel', 'Hanav',70,'055302154','nadav1@gmail.com','1990-03-16');
insert into Employees(PersonalId, FirstName, LastName,  City, Street,HomeNum,Phone,Email,Birthday) values ('211396745', 'Noam', 'Versano', 'Raanana', 'Shoter',74,'050287202','noam1@gmail.com','1991-02-08');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Companies(CompanyId, CompanyName,CompanyAdress) values (2747469, 'Offispaces', 'Haarbaha');
insert into Companies(CompanyId, CompanyName,CompanyAdress) values (4235785, 'RefaelNadlan', 'Menahem Begin');
insert into Companies(CompanyId, CompanyName,CompanyAdress) values (1278459, 'Hagag Group', 'Alfasi');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Roles(RoleName) values('CEO')
insert into Roles(RoleName) values('Sales Manager')
insert into Roles(RoleName) values('Marketing Manager')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Premissions(PERMISSIONNAME,ADDOPTIONS,EditOption,WatchWorkerOrder,CreateWorkerOrder,CloseWorkerOrder,ReportHourWorker,AddWroker,AddCompany) values('Regular Employee',1,0,1,0,0,0,0,0)
insert into Premissions(PERMISSIONNAME,ADDOPTIONS,EditOption,WatchWorkerOrder,CreateWorkerOrder,CloseWorkerOrder,ReportHourWorker,AddWroker,AddCompany) values('Supervisor',1,1,1,0,0,0,0,0)
insert into Premissions(PERMISSIONNAME,ADDOPTIONS,EditOption,WatchWorkerOrder,CreateWorkerOrder,CloseWorkerOrder,ReportHourWorker,AddWroker,AddCompany) values('Branch Manager',1,1,1,1,1,1,1,0)
insert into Premissions(PERMISSIONNAME,ADDOPTIONS,EditOption,WatchWorkerOrder,CreateWorkerOrder,CloseWorkerOrder,ReportHourWorker,AddWroker,AddCompany) values('System Manager',1,1,1,1,1,1,1,1)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into EmpAtCompany(EmployeeId,CompanyId,PermissionId,RoleId,UsernNme,UserPassword,WagePerHour) values
(1,'1278459',100,1000,'Office1','Spaces1',40),
(2,'1278459',100,1000,'Refael2', 'Nadlan12',45),
(3,'1278459',100,1001,'Hagag111', 'dgrygffd122',60),
(4,'1278459',101,1001,'DROR124','GRGRGR112',55),
(5,'1278459',102,1002,'Adaaaa123','aqwer1111',65),
(6,'1278459',103,1002,'dgfjfh443','oooaaa11',100),
(7,'2747469',100,1000,'AaBbCc','11223344',35),
(8,'2747469',100,1000,'CDFRTE','44567543',45),
(9,'2747469',100,1001,'ACaaar','odgrdvb134',65),
(10,'2747469',101,1001,'Ccdrfgh','addrgddg',70),
(11,'2747469',102,1002,'Qqzasdcv','dddooooddd',85),
(12,'2747469',103,1002,'zzxxccvb','QAqaser',125),
(13,'4235785',100,1000,'Aaqwertc','aaaCVFG1',50),
(14,'4235785',100,1000,'QEaadfgf','aaACVFHC12',65),
(15,'4235785',100,1001,'QSDQ111','AAaaaxx12',85),
(16,'4235785',101,1001,'aaDGTYH','CFHGTRTDSD',96),
(17,'4235785',102,1002,'EEGFHSFSGF','BRYT4TVD',122),
(18,'4235785',103,1002,'ASFWFVFFR','122343234',135)
--------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ShiftsType (ShiftID,StartHour,EndHour,CompanyId) values
(1,'08:00','15:00',1278459),
(2,'15:00','22:00',1278459),
(3,'07:00','14:00',2747469),
(4,'14:00','22:00',2747469),
(5,'07:00','15:00',4235785),
(6,'15:00','22:00',4235785)
-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO WorkSchedule(ShiftDate,ShiftID,EmployeeID,RoleId,Assigning)
values	( '2020-12-13',1,1,1000,1),
		( '2020-12-13',1,3,1001,1),
		( '2020-12-13',2,6,1002,1),
		( '2020-12-13',3,7,1000,1),
		( '2020-12-13',3,10,1001,1),
		( '2020-12-13',4,12,1002,1),
		( '2020-12-13',5,13,1000,1),
		( '2020-12-13',5,15,1001,1),
		( '2020-12-13',6,18,1002,1),
		( '2020-12-13',1,2,1000,0),
		( '2020-12-13',2,5,1002,0),
		( '2020-12-13',3,8,1000,0),
		( '2020-12-13',5,14,1000,0),
		( '2020-12-14',1,2,1000,1),
		( '2020-12-14',1,3,1001,1),
		( '2020-12-14',2,5,1002,1),
		( '2020-12-14',3,8,1000,1),
		( '2020-12-14',3,10,1001,1),
		( '2020-12-14',4,11,1002,1),
		( '2020-12-14',5,14,1000,1),
		( '2020-12-14',5,16,1001,1),
		( '2020-12-14',6,17,1002,1),
		( '2020-12-14',1,1,1000,0),
		( '2020-12-14',2,6,1002,0),
		( '2020-12-14',3,9,1001,0),
		( '2020-12-14',6,18,1002,0),
		( '2020-12-15',1,1,1000,1),
		( '2020-12-15',1,3,1001,1),
		( '2020-12-15',2,5,1002,1),
		( '2020-12-15',3,7,1000,1),
		( '2020-12-15',3,9,1001,1),
		( '2020-12-15',4,11,1002,1),
		( '2020-12-15',5,13,1000,1),
		( '2020-12-15',5,15,1001,1),
		( '2020-12-15',6,17,1002,1),
		( '2020-12-15',1,4,1001,0),
		( '2020-12-15',2,6,1002,0),
		( '2020-12-15',5,14,1000,0),
		( '2020-12-15',5,16,1001,0),
		( '2020-12-16',1,2,1000,1),
		( '2020-12-16',1,4,1001,1),
		( '2020-12-16',2,6,1002,1),
		( '2020-12-16',3,8,1000,1),
		( '2020-12-16',3,10,1001,1),
		( '2020-12-16',4,12,1002,1),
		( '2020-12-16',5,14,1000,1),
		( '2020-12-16',5,16,1001,1),
		( '2020-12-16',6,18,1002,1),
		( '2020-12-16',2,5,1002,0),
		( '2020-12-16',3,7,1000,0),
		( '2020-12-16',4,11,1002,0),
		( '2020-12-16',6,17,1002,0),
		( '2020-12-17',1,1,1000,1),
		( '2020-12-17',1,3,1001,1),
		( '2020-12-17',2,5,1002,1),
		( '2020-12-17',3,7,1000,1),
		( '2020-12-17',3,9,1001,1),
		( '2020-12-17',4,11,1002,1),
		( '2020-12-17',5,13,1000,1),
		( '2020-12-17',5,15,1001,1),
		( '2020-12-17',6,17,1002,1),
		( '2020-12-17',1,4,1001,0),
		( '2020-12-17',4,12,1002,0),
		( '2020-12-17',6,18,1002,0),
		( '2020-12-20',1,1,1000,0),
		( '2020-12-20',1,2,1000,0),
		( '2020-12-20',1,4,1001,0),
		( '2020-12-20',2,6,1002,0),
		( '2020-12-20',3,7,1000,0),
		( '2020-12-20',3,9,1001,0),
		( '2020-12-20',3,10,1001,0),
		( '2020-12-20',4,12,1002,0),
		( '2020-12-20',5,14,1000,0),
		( '2020-12-20',5,15,1001,0),
		( '2020-12-20',5,16,1001,0),
		( '2020-12-20',6,17,1002,0),
		( '2020-12-21',1,2,1000,0),
		( '2020-12-21',1,3,1001,0),
		( '2020-12-21',1,4,1001,0),
		( '2020-12-21',2,5,1002,0),
		( '2020-12-21',3,8,1000,0),
		( '2020-12-21',3,9,1001,0),
		( '2020-12-21',4,11,1002,0),
		( '2020-12-21',4,12,1002,0),
		( '2020-12-21',5,12,1000,0),
		( '2020-12-21',5,16,1001,0),
		( '2020-12-21',6,17,1002,0),
		( '2020-12-21',6,18,1002,0),
		( '2020-12-22',1,1,1000,0),
		( '2020-12-22',1,2,1000,0),
		( '2020-12-22',1,3,1001,0),
		( '2020-12-22',2,6,1002,0),
		( '2020-12-22',3,8,1000,0),
		( '2020-12-22',3,9,1001,0),
		( '2020-12-22',3,10,1001,0),
		( '2020-12-22',4,11,1002,0),
		( '2020-12-22',5,13,1000,0),
		( '2020-12-22',5,15,1001,0),
		( '2020-12-22',5,16,1001,0),
		( '2020-12-22',6,17,1002,0),
		( '2020-12-23',1,2,1000,0),
		( '2020-12-23',1,3,1001,0),
		( '2020-12-23',1,4,1001,0),
		( '2020-12-23',2,5,1002,0),
		( '2020-12-23',3,7,1000,0),
		( '2020-12-23',3,8,1000,0),
		( '2020-12-23',3,10,1001,0),
		( '2020-12-23',4,11,1002,0),
		( '2020-12-23',5,13,1000,0),
		( '2020-12-23',5,14,1000,0),
		( '2020-12-23',5,15,1001,0),
		( '2020-12-23',6,18,1002,0),
		( '2020-12-24',1,1,1000,0),
		( '2020-12-24',1,2,1000,0),
		( '2020-12-24',1,3,1001,0),
		( '2020-12-24',2,5,1002,0),
		( '2020-12-24',2,6,1002,0),
		( '2020-12-24',3,7,1000,0),
		( '2020-12-24',3,9,1001,0),
		( '2020-12-24',3,10,1001,0),
		( '2020-12-24',4,11,1002,0),
		( '2020-12-24',4,12,1002,0),
		( '2020-12-24',5,13,1000,0),
		( '2020-12-24',5,14,1000,0),
		( '2020-12-24',5,16,1001,0),
		( '2020-12-24',6,17,1002,0),
		( '2020-12-24',6,18,1002,0)
--------------------------------------------------------------------------------------------------------------------------------------
insert into  ShiftStatus(ShiftDate,ShiftID,RoleId,NumInShift,InClose)
values	('2020-12-13',1,1000,1,1),
		('2020-12-13',1,1001,1,1),
		('2020-12-13',2,1002,1,1),
		('2020-12-13',3,1000,1,1),
		('2020-12-13',3,1001,1,1),
		('2020-12-13',4,1002,1,1),
		('2020-12-13',5,1001,1,1),
		('2020-12-13',6,1002,1,1),
		('2020-12-13',5,1000,1,1),
		('2020-12-14',1,1000,1,1),
		('2020-12-14',1,1001,1,1),
		('2020-12-14',2,1002,1,1),
		('2020-12-14',3,1000,1,1),
		('2020-12-14',3,1001,1,1),
		('2020-12-14',4,1002,1,1),
		('2020-12-14',5,1000,1,1),
		('2020-12-14',5,1001,1,1),
		('2020-12-14',6,1002,1,1),
		('2020-12-15',1,1000,1,1),
		('2020-12-15',1,1001,1,1),
		('2020-12-15',2,1002,1,1),
		('2020-12-15',3,1000,1,1),
		('2020-12-15',3,1001,1,1),
		('2020-12-15',4,1002,1,1),
		('2020-12-15',5,1000,1,1),
		('2020-12-15',5,1001,1,1),
		('2020-12-15',6,1002,1,1),
		('2020-12-16',1,1000,1,1),
		('2020-12-16',1,1001,1,1),
		('2020-12-16',2,1002,1,1),
		('2020-12-16',3,1000,1,1),
		('2020-12-16',3,1001,1,1),
		('2020-12-16',4,1002,1,1),
		('2020-12-16',5,1001,1,1),
		('2020-12-16',6,1002,1,1),
		('2020-12-16',5,1000,1,1),
		('2020-12-17',1,1000,1,1),
		('2020-12-17',1,1001,1,1),
		('2020-12-17',2,1002,1,1),
		('2020-12-17',3,1000,1,1),
		('2020-12-17',3,1001,1,1),
		('2020-12-17',4,1002,1,1),
		('2020-12-17',5,1000,1,1),
		('2020-12-17',5,1001,1,1),
		('2020-12-17',6,1002,1,1),
		('2020-12-20',1,1000,1,0),
		('2020-12-20',1,1001,1,0),
		('2020-12-20',2,1002,1,0),
		('2020-12-20',3,1000,1,0),
		('2020-12-20',3,1001,1,0),
		('2020-12-20',4,1002,1,0),
		('2020-12-20',5,1000,1,0),
		('2020-12-20',5,1001,1,0),
		('2020-12-20',6,1002,1,0),
		('2020-12-21',1,1000,1,0),
		('2020-12-21',1,1001,1,0),
		('2020-12-21',2,1002,1,0),
		('2020-12-21',3,1000,1,0),
		('2020-12-21',3,1001,1,0),
		('2020-12-21',4,1002,1,0),
		('2020-12-21',5,1000,1,0),
		('2020-12-21',5,1001,1,0),
		('2020-12-21',6,1002,1,0),
		('2020-12-22',1,1000,1,0),
		('2020-12-22',1,1001,1,0),
		('2020-12-22',2,1002,1,0),
		('2020-12-22',3,1000,1,0),
		('2020-12-22',3,1001,1,0),
		('2020-12-22',4,1002,1,0),
		('2020-12-22',5,1000,1,0),
		('2020-12-22',5,1001,1,0),
		('2020-12-22',6,1002,1,0),
		('2020-12-23',1,1000,1,0),
		('2020-12-23',1,1001,1,0),
		('2020-12-23',2,1002,1,0),
		('2020-12-23',3,1000,1,0),
		('2020-12-23',3,1001,1,0),
		('2020-12-23',4,1002,1,0),
		('2020-12-23',5,1000,1,0),
		('2020-12-23',5,1001,1,0),
		('2020-12-23',6,1002,1,0),
		('2020-12-24',1,1000,1,0),
		('2020-12-24',1,1001,1,0),
		('2020-12-24',2,1002,1,0),
		('2020-12-24',3,1000,1,0),
		('2020-12-24',3,1001,1,0),
		('2020-12-24',4,1002,1,0),
		('2020-12-24',5,1000,1,0),
		('2020-12-24',5,1001,1,0),
		('2020-12-24',6,1002,1,0)
-------------------------------------------------------------------------------------------
insert into ActualShift(ShiftDate,ShiftId,EmployeeId,RoleId,WagePerHour)
values  ( '2020-12-13',1,1,1000,40),
		( '2020-12-13',1,3,1001,60),
		( '2020-12-13',2,6,1002,100),
		( '2020-12-13',3,7,1000,35),
		( '2020-12-13',3,10,1001,70),
		( '2020-12-13',4,12,1002,125),
		( '2020-12-13',5,13,1000,50),
		( '2020-12-13',5,15,1001,85),
		( '2020-12-13',6,18,1002,135),
		( '2020-12-14',1,2,1000,45),
		( '2020-12-14',1,3,1001,60),
		( '2020-12-14',2,5,1002,65),
		( '2020-12-14',3,8,1000,45),
		( '2020-12-14',3,10,1001,70),
		( '2020-12-14',4,11,1002,85),
		( '2020-12-14',5,14,1000,65),
		( '2020-12-14',5,16,1001,96),
		( '2020-12-14',6,17,1002,122),
		( '2020-12-15',1,1,1000,40),
		( '2020-12-15',1,3,1001,60),
		( '2020-12-15',2,5,1002,65),
		( '2020-12-15',3,7,1000,35),
		( '2020-12-15',3,9,1001,65),
		( '2020-12-15',4,11,1002,85),
		( '2020-12-15',5,13,1000,50),
		( '2020-12-15',5,15,1001,85),
		( '2020-12-15',6,17,1002,122),
		( '2020-12-16',1,2,1000,45),
		( '2020-12-16',1,4,1001,55),
		( '2020-12-16',2,6,1002,100),
		( '2020-12-16',3,8,1000,45),
		( '2020-12-16',3,10,1001,70),
		( '2020-12-16',4,12,1002,125),
		( '2020-12-16',5,14,1000,65),
		( '2020-12-16',5,16,1001,96),
		( '2020-12-16',6,18,1002,135),
		( '2020-12-17',1,1,1000,40),
		( '2020-12-17',1,3,1001,60),
		( '2020-12-17',2,5,1002,65),
		( '2020-12-17',3,7,1000,35),
		( '2020-12-17',3,9,1001,65),
		( '2020-12-17',4,11,1002,85),
		( '2020-12-17',5,13,1000,50),
		( '2020-12-17',5,15,1001,85),
		( '2020-12-17',6,17,1002,122)


--------------------------------------------------------------------------------------------------------------------------------------------------
--1

GO;
CREATE PROCEDURE pr_employee_info(@emp_id INT, @company_id VARCHAR(7))
AS
	SELECT E.FirstName, E.LastName, EAT.UsernNme, EAT.UserPassword, EAT.CompanyId, R.RoleName, P.AddOptions,
		P.EditOption, P.WatchWorkerOrder, P.CreateWorkerOrder, P.CloseWorkerOrder, P.ReportHourWorker, P.AddWroker, P.AddCompany
	FROM Employees AS E
	LEFT JOIN EmpAtCompany AS EAT
	ON E.EmployeeID = EAT.EmployeeId
	JOIN Roles AS R
	ON EAT.RoleId = R.RoleId
	JOIN Premissions AS P
	ON P.PermissionId = EAT.PermissionId
	WHERE E.EmployeeID = @emp_id AND EAT.CompanyId = @company_id

EXEC pr_employee_info @emp_id = 1, @company_id = '1278459'

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--2
GO;
CREATE PROCEDURE pr_shift_for_week(@company_id VARCHAR(7), @start_date DATE = '2020-12-13', @end_date DATE = '2020-12-17')
AS
	IF @start_date > @end_date
		BEGIN
		DECLARE @temp_date DATE = @start_date
		SET @start_date = @end_date
		SET @end_date = @temp_date
		END

	SELECT C.CompanyName, ASH.ShiftDate, ST.StartHour, ST.EndHour, E.FirstName, E.LastName, E.PersonalId
	FROM ActualShift AS ASH
	JOIN Employees AS E
	ON ASH.EmployeeId = E.EmployeeID
	JOIN ShiftsType AS ST
	ON ST.ShiftID = ASH.ShiftId
	JOIN Companies AS C
	ON C.CompanyId = ST.CompanyId
	WHERE C.CompanyId = @company_id AND ASH.ShiftDate BETWEEN @start_date AND @end_date


EXEC pr_shift_for_week @company_id = '2747469'

--------------------------------------------------------------------------------------------------------------------------------------
--3
GO;
CREATE PROCEDURE pr_salary_table(@syear INT = 2020, @smonth INT = 12)
AS
	SELECT E.FirstName, E.LastName, E.EmployeeID, E.PersonalId, SUM(DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour)) AS WorkingHours,
		SUM(ASH.WagePerHour * (DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour))) AS GrossSalary, SUM(ASH.WagePerHour * (DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour))) * 0.7 AS NetSalary
	FROM Employees AS E
	JOIN ActualShift AS ASH
	ON E.EmployeeID = ASH.EmployeeID
	JOIN ShiftsType AS ST
	ON ASH.ShiftId = ST.ShiftID
	WHERE YEAR(ASH.ShiftDate) = @syear AND MONTH(ASH.ShiftDate) = @smonth
	GROUP BY E.FirstName, E.LastName, E.EmployeeID, E.PersonalId

EXEC pr_salary_table

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--4
GO;
CREATE PROCEDURE pr_shifts_option_weekly(@company_id VARCHAR(7), @start_date DATE = '2020-12-13', @end_date DATE = '2020-12-17')
AS
	IF @start_date > @end_date
		BEGIN
		DECLARE @temp_date DATE = @start_date
		SET @start_date = @end_date
		SET @end_date = @temp_date
		END
	SELECT E.EmployeeID, E.FirstName, E.LastName, WS.ShiftDate, ST.StartHour, ST.EndHour
	FROM WorkSchedule AS WS
	JOIN Employees AS E
	ON WS.EmployeeID = E.EmployeeID
	JOIN ShiftsType ST
	ON WS.ShiftID = ST.ShiftID
	WHERE ST.CompanyId = @company_id AND WS.ShiftDate BETWEEN @start_date AND @end_date
	ORDER BY E.EmployeeID, WS.ShiftDate

EXEC pr_shifts_option_weekly @company_id = '1278459'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--5
GO;
CREATE PROCEDURE pr_shifts_option_weekly_per_emp(@person_id VARCHAR(9), @start_date DATE = '2020-12-13', @end_date DATE = '2020-12-17')
AS
	IF @start_date > @end_date
		BEGIN
		DECLARE @temp_date DATE = @start_date
		SET @start_date = @end_date
		SET @end_date = @temp_date
		END
	SELECT E.PersonalId, E.FirstName, E.LastName, WS.ShiftDate, ST.StartHour, ST.EndHour
	FROM WorkSchedule AS WS
	JOIN Employees AS E
	ON WS.EmployeeID = E.EmployeeID
	JOIN ShiftsType ST
	ON WS.ShiftID = ST.ShiftID
	WHERE E.PersonalId = @person_id AND WS.ShiftDate BETWEEN @start_date AND @end_date
	ORDER BY E.PersonalId, WS.ShiftDate

EXEC pr_shifts_option_weekly_per_emp @person_id = '216237356'

--6
GO;
CREATE PROCEDURE pr_shifts_status(@start_date DATE = '2020-12-20', @end_date DATE = '2020-12-24')
AS
	IF @start_date > @end_date
		BEGIN
		DECLARE @temp_date DATE = @start_date
		SET @start_date = @end_date
		SET @end_date = @temp_date
		END

	SELECT DISTINCT ShiftDate, ShiftID, InClose
	FROM ShiftStatus AS SS
	WHERE SS.ShiftDate BETWEEN @start_date AND @end_date
	ORDER BY ShiftDate

EXEC pr_shifts_status

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--7
CREATE PROCEDURE pr_shifts_details(@company_id VARCHAR(7))
AS
	SELECT DISTINCT ST.CompanyId, WS.ShiftDate, WS.ShiftID, ST.StartHour, ST.EndHour
	FROM ShiftsType AS ST
	JOIN WorkSchedule AS WS
	ON ST.ShiftID = WS.ShiftID
	WHERE WS.Assigning = 1 AND CompanyId = @company_id AND WS.ShiftDate BETWEEN '2020-12-13' AND '2020-12-17'
	ORDER BY WS.ShiftDate, WS.ShiftID, ST.StartHour

EXEC pr_shifts_details @company_id = '2747469'

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--8
SELECT *
FROM WorkSchedule
GO;
CREATE PROCEDURE pr_insert_shifts(@sdate DATE, @sid INT, @empid INT, @rid INT)
AS
	BEGIN TRY
		INSERT INTO WorkSchedule (ShiftDate, ShiftID, EmployeeID, RoleId)
		VALUES(@sdate, @sid, @empid, @rid)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
		RAISERROR('There is a problem with the entered shift', 12, 1)
	END CATCH



GO;           
CREATE PROCEDURE pr_delete_shifts(@sdate DATE, @sid INT, @empid INT, @rid INT)
AS
	BEGIN TRY
		DELETE FROM WorkSchedule 
		WHERE ShiftDate = @sdate AND  ShiftID = @sid AND EmployeeID = @empid AND RoleId = @rid
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
		RAISERROR('There is a problem with the entered shift', 12, 1)
	END CATCH


---------------------------------------------------------------------------------------------------------------------------------------------------------------
--9
GO;
CREATE PROCEDURE pr_company_salary_report(@companyid VARCHAR(7), @syear INT = 2020, @smonth INT = 12)
AS
	SELECT ST.CompanyId, SUM(DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour)) AS WorkingHours,
		SUM(ASH.WagePerHour * (DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour))) AS GrossSalary, SUM(ASH.WagePerHour * (DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour))) * 0.3 AS Tax
		, SUM(ASH.WagePerHour * (DATEPART(HH, ST.EndHour) - DATEPART(HH, ST.StartHour))) * 0.7 AS NetSalary
	FROM ActualShift AS ASH
	JOIN ShiftsType AS ST
	ON ASH.ShiftId = ST.ShiftID
	WHERE YEAR(ASH.ShiftDate) = @syear AND MONTH(ASH.ShiftDate) = @smonth AND ST.CompanyId = @companyid
	GROUP BY ST.CompanyId

EXEC pr_company_salary_report @companyid = 1278459




