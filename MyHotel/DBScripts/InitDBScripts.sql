/*RoomBooking*/
IF OBJECT_ID (N'RoomBooking', N'U') IS NOT NULL 
DROP TABLE [RoomBooking]

IF OBJECT_ID (N'Room', N'U') IS NOT NULL 
DROP TABLE [Room]

CREATE TABLE [Room]
(
	RoomID int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(100) NOT NULL,
	Capacity int NOT NULL
)
INSERT INTO [Room](Name, Capacity) VALUES(N'1 DBL',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'2 DBL',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'3 Apart',4)
INSERT INTO [Room](Name, Capacity) VALUES(N'4 DBL',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'5 DBL',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'6 Apart',4)

CREATE TABLE [RoomBooking]
(
	RoomBookingID int IDENTITY(1,1) PRIMARY KEY,
	RoomID int FOREIGN KEY REFERENCES [Room](RoomID) NOT NULL,
	GuestName nvarchar(max) NOT NULL,
	GuestPhone nvarchar(max) NOT NULL,
	NumberOfAdult int NOT NULL,
	NumberOfChild int NULL,
	PricePerRoom int NOT NULL,
	PriceOfAdditionalBed int NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL,
	BookingStatus int NOT NULL,
	AdditionalInfo nvarchar(max) NULL,
	AlreadyPaid int NULL
)

/*Expenses*/
IF OBJECT_ID (N'ExpensesDetails', N'U') IS NOT NULL 
DROP TABLE ExpensesDetails

IF OBJECT_ID (N'ExpensesItems', N'U') IS NOT NULL 
DROP TABLE [ExpensesItems]

CREATE TABLE [ExpensesItems]
(
	ExpensesItemID int IDENTITY(1,1) PRIMARY KEY,
	ParentExpensesItemID int FOREIGN KEY REFERENCES [ExpensesItems](ExpensesItemID) NULL,
	Name nvarchar(100) NOT NULL
)

SET IDENTITY_INSERT [ExpensesItems] ON
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(10, null, N'Комунальні послуги')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(11, 10, N'Газ')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(12, 10, N'Ел. енергія')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(13, 10, N'Вода')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(14, 10, N'Сміття')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(15, 10, N'Квартплата')

INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(20, null, N'Оплата праці')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(21, 20, N'п. Оля')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(22, 20, N'т. Зеня')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(23, 20, N'інші')

INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(30, null, N'Побутові товари')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(31, 30, N'для гостей')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(32, 30, N'для прання')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(33, 30, N'для прибирання')

INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(40, null, N'Різне')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(41, 40, N'для номерів')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(42, 40, N'для кухні')
INSERT INTO [ExpensesItems](ExpensesItemID, ParentExpensesItemID, Name) VALUES(43, 40, N'неплановані')
SET IDENTITY_INSERT [ExpensesItems] OFF

CREATE TABLE [ExpensesDetails]
(
	ExpensesDetailsID int IDENTITY(1,1) PRIMARY KEY,
	ExpensesItemID int FOREIGN KEY REFERENCES [ExpensesItems](ExpensesItemID) NOT NULL,
    [Date] date NOT NULL,
	Cost float NOT NULL,
	[Description] nvarchar(max) NULL
)
ALTER TABLE ExpensesDetails
ADD UNIQUE(ExpensesItemID, [Date]) 


IF OBJECT_ID (N'Cleaning', N'U') IS NOT NULL 
DROP TABLE [Cleaning]

CREATE TABLE [Cleaning]
(
	CleaningID int IDENTITY(1,1) PRIMARY KEY,
	RoomID int FOREIGN KEY REFERENCES [Room](RoomID) NOT NULL,
	DateOfCleaning date NOT NULL
)
ALTER TABLE Cleaning
ADD UNIQUE(RoomID, DateOfCleaning) 


IF OBJECT_ID (N'UtilitiesItemsDetails', N'U') IS NOT NULL 
DROP TABLE [UtilitiesItemsDetails]

IF OBJECT_ID (N'UtilitiesItems', N'U') IS NOT NULL 
DROP TABLE [UtilitiesItems]

CREATE TABLE [UtilitiesItems]
(
	UtilitiesItemsID int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(100) NOT NULL
)

SET IDENTITY_INSERT [UtilitiesItems] ON
INSERT INTO [UtilitiesItems](UtilitiesItemsID, Name) VALUES(1,N'Газ')
INSERT INTO [UtilitiesItems](UtilitiesItemsID, Name) VALUES(2,N'Ел.енергія')
INSERT INTO [UtilitiesItems](UtilitiesItemsID, Name) VALUES(3,N'Вода НХ')
INSERT INTO [UtilitiesItems](UtilitiesItemsID, Name) VALUES(4,N'Вода СХ')
SET IDENTITY_INSERT [ExpensesItems] OFF

CREATE TABLE [UtilitiesItemsDetails]
(
	UtilitiesItemsDetailsID int IDENTITY(1,1) PRIMARY KEY,
	UtilitiesItemsID int FOREIGN KEY REFERENCES [UtilitiesItems](UtilitiesItemsID) NOT NULL,
    [Date] date NOT NULL,
	Value float NOT NULL,
	[Description] nvarchar(max) NULL
)
ALTER TABLE [UtilitiesItemsDetails]
ADD UNIQUE(UtilitiesItemsID, [Date]) 

/*Custom data*/
IF OBJECT_ID (N'CustomData', N'U') IS NOT NULL 
DROP TABLE [CustomData]

CREATE TABLE [CustomData]
(
	CustomDataID int IDENTITY(1,1) PRIMARY KEY,
	JSONData nvarchar(MAX) NOT NULL
)