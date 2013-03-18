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
INSERT INTO [Room](Name, Capacity) VALUES(N'1п DBL жовта',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'1п DBL рожева',2)
INSERT INTO [Room](Name, Capacity) VALUES(N'1п Apart зелена',4)

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
	AdditionalInfo nvarchar(max) NULL 
)