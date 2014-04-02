IF OBJECT_ID('tempdb..#TempData') IS NOT NULL
   DROP TABLE #TempData
CREATE TABLE #TempData ([Month] int)
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
	EXEC('ALTER TABLE #TempData ADD ['+ @curYear +'] float NULL');

	DECLARE @curMonth int
	SET @curMonth = 1
	WHILE @curMonth <= 12
	BEGIN
	--Month
		DECLARE @startDate date, @endDate date
		SET @startDate = CONVERT (datetime, '1.'+CAST(@curMonth AS NVARCHAR(2))+'.'+ CAST(@curYear AS NVARCHAR(4)), 104)
		SET @endDate = CONVERT (datetime, ''+CAST(DATEDIFF(day, DATEADD(day, 1-day(@startDate), @startDate), DATEADD(month, 1, DATEADD(day, 1-day(@startDate), @startDate))) AS NVARCHAR(2))+'.'+CAST(@curMonth AS NVARCHAR(2))+'.'+ CAST(@curYear AS NVARCHAR(4)), 104)
		DECLARE @sqlScript NVARCHAR(max)
		SET @sqlScript = 
		'
		IF((SELECT COUNT(*) FROM #TempData WHERE [Month] = '+CAST(@curMonth AS NVARCHAR(2))+') > 0)
		BEGIN
			UPDATE #TempData SET ['+CAST(@curYear AS NVARCHAR(4))+'] =
			ISNULL((SELECT AVG((PricePerRoom + PriceOfAdditionalBed) / (NumberOfAdult + NumberOfChild))
			FROM [RoomBooking]
			WHERE [StartDate] <= '''+CAST(@endDate AS NVARCHAR(max))+''' AND [EndDate] > '''+CAST(@startDate AS NVARCHAR(max))+'''), 0)
			WHERE [Month] = '+CAST(@curMonth AS NVARCHAR(2))+'		
		END
		ELSE
		BEGIN
			INSERT INTO #TempData([Month],['+CAST(@curYear AS NVARCHAR(4))+'])
			 SELECT 
				'+CAST(@curMonth AS NVARCHAR(2))+' AS [Month],
				ISNULL(AVG((PricePerRoom + PriceOfAdditionalBed) / (NumberOfAdult + NumberOfChild)), 0) AS ['+CAST(@curYear AS NVARCHAR(4))+']
			FROM [RoomBooking]
			WHERE [StartDate] <= '''+CAST(@endDate AS NVARCHAR(max))+''' AND [EndDate] > '''+CAST(@startDate AS NVARCHAR(max))+'''
		END'
		
		EXEC(@sqlScript)
	
	SET @curMonth = @curMonth + 1;
	END
	
	SET @curYear = @curYear + 1;
END
SELECT * FROM #TempData
DROP TABLE #TempData

--DATEDIFF
--		(
--			day,
--			CASE 
--			WHEN [StartDate] >= '+@startDate+'
--				THEN [StartDate]
--				ELSE '+@startDate+'
--			END
--			,
--			CASE 
--			WHEN [EndDate] <= '+@endDate+'
--				THEN [EndDate]
--				ELSE DATEADD(day, 1, '+@endDate+')
--			END
--		) AS [TotalDays],