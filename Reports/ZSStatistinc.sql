DECLARE @prevDate date, @prevUtilitiesItemsID int, @prevValue float, @curDate date, @curUtilitiesItemsID int, @curValue float
DECLARE @TempData TABLE ([TargetDate] date, [Days] int, [UtilitiesItemsID] int, [DiffValueGas] float, [DiffValueEngy] float, [DiffValueWater] float)
DECLARE @count int
DECLARE data_cursor CURSOR
FOR 
	SELECT [Date], [UtilitiesItemsID], [Value] FROM [dbo].[UtilitiesItemsDetails]
OPEN data_cursor

FETCH NEXT FROM data_cursor
INTO @prevDate, @prevUtilitiesItemsID, @prevValue

WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM data_cursor
	INTO @curDate, @curUtilitiesItemsID, @curValue
	IF((SELECT COUNT(*) FROM @TempData WHERE [TargetDate] = @curDate) > 0)
	BEGIN
		IF(@curUtilitiesItemsID = 1) 
		BEGIN
			UPDATE @TempData SET [DiffValueGas] = @curValue WHERE [TargetDate] = @curDate
		END
		ELSE IF(@curUtilitiesItemsID = 2) 
		BEGIN
			UPDATE @TempData SET [DiffValueEngy] = @curValue WHERE [TargetDate] = @curDate
		END
		ELSE IF(@curUtilitiesItemsID = 3 OR @curUtilitiesItemsID = 4) 
		BEGIN
			UPDATE @TempData SET [DiffValueWater] = ISNULL([DiffValueWater], 0) + @curValue WHERE [TargetDate] = @curDate
		END
	END
	ELSE
	BEGIN
		IF(@curUtilitiesItemsID = 1) 
		BEGIN
			INSERT INTO @TempData([TargetDate], [UtilitiesItemsID], [DiffValueGas], [Days]) 
			VALUES(@curDate, @curUtilitiesItemsID, DATEDIFF(day, ISNULL(@prevDate, @curDate), @curDate), (@curValue - ISNULL(@prevValue, @curValue))) 
		END
		ELSE IF(@curUtilitiesItemsID = 2) 
		BEGIN
			INSERT INTO @TempData([TargetDate], [UtilitiesItemsID], [DiffValueEngy], [Days]) 
			VALUES(@curDate, @curUtilitiesItemsID, DATEDIFF(day, ISNULL(@prevDate, @curDate), @curDate), (@curValue - ISNULL(@prevValue, @curValue))) 
		END
		ELSE IF(@curUtilitiesItemsID = 3 OR @curUtilitiesItemsID = 4) 
		BEGIN
			INSERT INTO @TempData([TargetDate], [UtilitiesItemsID], [DiffValueWater], [Days]) 
			VALUES(@curDate, @curUtilitiesItemsID, DATEDIFF(day, ISNULL(@prevDate, @curDate), @curDate), (@curValue - ISNULL(@prevValue, @curValue))) 
		END
	END
	SET @prevDate = @curDate
	SET @prevUtilitiesItemsID = @curUtilitiesItemsID
	SET @prevValue = @curValue
END

CLOSE data_cursor;
DEALLOCATE data_cursor;

SELECT * FROM @TempData ORDER BY [TargetDate]