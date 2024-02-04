-- 1. 
PRINT 'Task 1:'
DECLARE @num1 float = 15.3
DECLARE @num2 float = 8.6
DECLARE @num3 float = 12.2

PRINT 'The arithmetic mean of numbers: ' + CHAR(10) 
	+ cast(@num1 AS nvarchar) + ', ' 
	+ cast(@num2 AS nvarchar) + ', '
	+ cast(@num3 AS nvarchar) + ' --> '
	+ cast(((@num1 + @num2 + @num3) / 3.0) AS nvarchar)

-- 2.
PRINT CHAR(10) + 'Task 2:'
DECLARE @hour_now int = DATEPART(HOUR, GETDATE())

IF @hour_now BETWEEN 5 AND 11
	PRINT 'Good morning!'
ELSE IF @hour_now BETWEEN 12 AND 16
	PRINT 'Good morning!'
ELSE IF @hour_now BETWEEN 17 AND 23 
	PRINT 'Have a good evening!'
ELSE 
	PRINT 'Have a good evening!'

-- 3.

-- 1 способ
PRINT CHAR(10) + 'Task 3, Method 1:'
DECLARE @number int = 123006
DECLARE @firstThreeDigits int
DECLARE @lastThreeDigits int

IF @number BETWEEN 100000 AND 999999
BEGIN
	SET @firstThreeDigits = (@number / 1000) % 1000
	SET @lastThreeDigits = @number % 1000

	IF ((@firstThreeDigits / 100) + (@firstThreeDigits / 10 % 10) + (@firstThreeDigits % 10)) = 
		((@lastThreeDigits / 100) + (@lastThreeDigits / 10 % 10) + (@lastThreeDigits % 10))
		PRINT 'number ' + cast(@number AS nvarchar) + ' - happy!'
	ELSE
		PRINT 'number ' + cast(@number AS nvarchar) + ' - not happy('
END
ELSE
	PRINT 'number ' + cast(@number AS nvarchar) + ' is not six digits'

-- 2 
PRINT CHAR(10) + 'Task 3, Method 2:'
DECLARE @number2 nvarchar(6) = '001010'
DECLARE @firstThreeDigitsSum int
DECLARE @lastThreeDigitsSum int

IF LEN(@number2) = 6
BEGIN
	SET @firstThreeDigitsSum = 
		CAST(SUBSTRING(@number2, 1, 1) AS int) 
		+ CAST(SUBSTRING(@number2, 2, 1) AS int)
		+ CAST(SUBSTRING(@number2, 3, 1) AS int)
	SET @lastThreeDigitsSum = 
		CAST(SUBSTRING(@number2, 4, 1) AS int) 
		+ CAST(SUBSTRING(@number2, 5, 1) AS int) 
		+ CAST(SUBSTRING(@number2, 6, 1) AS int)

	IF @firstThreeDigitsSum = @lastThreeDigitsSum
		PRINT 'number ' + @number2 + ' - happy!'
	ELSE
		PRINT 'number ' + @number2 + ' - unhappy('
END
ELSE
	PRINT 'number ' + @number2 + ' is not six digits'