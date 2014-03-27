DECLARE @prevDate date, @prevValue float, @curDate date, @curValue float
DECLARE @TempData TABLE ([TargetDate] date, [Days] int, [DiffValue] float)

DECLARE data_cursor CURSOR
FOR 
	SELECT [Date], Value FROM [dbo].[UtilitiesItemsDetails]
	WHERE [UtilitiesItemsID] = 4 
	ORDER BY [Date]
OPEN data_cursor

FETCH NEXT FROM data_cursor
INTO @prevDate, @prevValue

WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM data_cursor
	INTO @curDate, @curValue
	INSERT INTO @TempData 
	VALUES(@curDate, DATEDIFF(day, ISNULL(@prevDate, @curDate), @curDate), (@curValue - ISNULL(@prevValue, @curValue))) 
	SET @prevDate = @curDate
	SET @prevValue = @curValue
END

CLOSE data_cursor;
DEALLOCATE data_cursor;

SELECT * FROM @TempData

