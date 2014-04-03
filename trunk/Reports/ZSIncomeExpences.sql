IF OBJECT_ID('tempdb..#TempData') IS NOT NULL
   DROP TABLE #TempData
CREATE TABLE #TempData ([Month] date, Income float, Expenses float)
DECLARE @minDate date, @maxDate date
SELECT 
	@minDate = Min([StartDate]), 
	@maxDate = Max([StartDate])
FROM [RoomBooking]
--WHERE [StartDate] > '2012-01-01'
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
		DECLARE @sqlScript NVARCHAR(max)
		SET @sqlScript = 
		'INSERT INTO #TempData([Month],[Income],[Expenses])
		 SELECT 
			'''+CAST(@startDate AS NVARCHAR(max))+''' AS [Month],
			ISNULL(
			SUM(
			(PricePerRoom + PriceOfAdditionalBed)
			*
			DATEDIFF
			(
				day,
				CASE 
				WHEN [StartDate] >= '''+CAST(@startDate AS NVARCHAR(max))+'''
					THEN [StartDate]
					ELSE '''+CAST(@startDate AS NVARCHAR(max))+'''
				END
				,
				CASE 
				WHEN [EndDate] <= '''+CAST(@endDate AS NVARCHAR(max))+'''
					THEN [EndDate]
					ELSE DATEADD(day, 1, '''+CAST(@endDate AS NVARCHAR(max))+''')
				END
			))
			, 0) AS [Income],
			ISNULL((SELECT SUM(Cost) FROM ExpensesDetails WHERE [Date]>= '''+CAST(@startDate AS NVARCHAR(max))+''' AND [Date]<='''+CAST(@endDate AS NVARCHAR(max))+'''), 0) AS Expenses
		FROM [RoomBooking]
		WHERE [StartDate] <= '''+CAST(@endDate AS NVARCHAR(max))+''' AND [EndDate] > '''+CAST(@startDate AS NVARCHAR(max))+''''
		EXEC(@sqlScript)
	
	SET @curMonth = @curMonth + 1;
	END
	
	SET @curYear = @curYear + 1;
END
SELECT * FROM #TempData WHERE [Income]>0  OR [Expenses]>0
DROP TABLE #TempData