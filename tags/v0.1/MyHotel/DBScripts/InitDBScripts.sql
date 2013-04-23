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
INSERT INTO [Room](Name, Capacity) VALUES(N'1п жовта (DBL)',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'1п рожева (DBL)',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'1п зелена (Apart)',4)
INSERT INTO [Room](Name, Capacity) VALUES(N'2п бежева (DBL)',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'2п червона (DBL)',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'2п зелена (Apart)',4)

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