DECLARE @minDate date, @maxDate date
SELECT 
	@minDate = Min([StartDate]), 
	@maxDate = Max([StartDate])
FROM [RoomBooking]
WHERE [StartDate] > '2012-01-01'
DECLARE @curYear int
SET @curYear = YEAR(@minDate)
WHILE @curYear <= YEAR(@maxDate)
BEGIN
--Year
	DECLARE @curMonth int
	SET @curMonth = 1
	WHILE @curMonth <= 12
	BEGIN
	--Month
		DECLARE @startDate date, @endDate date
		SET @startDate = CONVERT (datetime, '1.'+CAST(@curMonth AS NVARCHAR(2))+'.'+ CAST(@curYear AS NVARCHAR(4)), 104)
		SET @endDate = CONVERT (datetime, ''+CAST(DATEDIFF(day, DATEADD(day, 1-day(@startDate), @startDate), DATEADD(month, 1, DATEADD(day, 1-day(@startDate), @startDate))) AS NVARCHAR(2))+'.'+CAST(@curMonth AS NVARCHAR(2))+'.'+ CAST(@curYear AS NVARCHAR(4)), 104)
		SELECT 
		DATEDIFF
		(
			day,
			CASE 
			WHEN [StartDate] >= @startDate 
				THEN [StartDate]
				ELSE @startDate
			END
			,
			CASE 
			WHEN [EndDate] <= @endDate 
				THEN [EndDate]
				ELSE DATEADD(day, 1, @endDate)
			END
		) AS [TotalDays],
		(PricePerRoom + PriceOfAdditionalBed) AS RoomPricePerDay,
		(NumberOfAdult + NumberOfChild) AS GuestsNumber,
		* 
		FROM [RoomBooking]
		WHERE [StartDate] <= @endDate AND [EndDate] > @startDate
	
	SET @curMonth = @curMonth + 1;
	END
	
	SET @curYear = @curYear + 1;
END

