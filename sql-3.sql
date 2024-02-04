-- 1. 
CREATE TABLE Numbers (number int)
DECLARE @i int = 1
WHILE @i <= 25
BEGIN
    INSERT INTO Numbers VALUES (@i)
    SET @i += 1
END

-- 
DECLARE @rowCount int
DECLARE @currentRow int = 1
DECLARE @number float
DECLARE @factorial float
DECLARE @j int

DECLARE factCursor CURSOR FOR SELECT number FROM Numbers

SELECT @rowCount = COUNT(*) FROM Numbers

OPEN factCursor
FETCH NEXT FROM factCursor INTO @number

WHILE @currentRow <= @rowCount
BEGIN
    SET @factorial = 1
    SET @j = 1

    WHILE @j <= @number
    BEGIN
        SET @factorial *= @j
        SET @j += 1
    END

    PRINT cast(@number AS varchar) + '! = ' + cast(@factorial AS varchar)

    SET @currentRow += 1
    FETCH NEXT FROM factCursor INTO @number
END

CLOSE factCursor
DEALLOCATE factCursor

-- 2. 
CREATE TABLE Numbers2 (number int)
DECLARE @h int = 3
WHILE @h <= 1000000
BEGIN
    INSERT INTO Numbers2 VALUES (@h)
    SET @h += 1
END

-- 
DECLARE @rowCount2 int
DECLARE @currentRow2 int = 1
DECLARE @num int
DECLARE @k int
DECLARE @isPrime bit

DECLARE numCursor CURSOR FOR SELECT number FROM Numbers2

SELECT @rowCount2 = COUNT(*) FROM Numbers2

OPEN numCursor
FETCH NEXT FROM numCursor INTO @num

WHILE @currentRow2 <= @rowCount2
BEGIN
    SET @isPrime = 1
    SET @k = 2

    WHILE @k * @k <= @num
    BEGIN
        IF @num % @k = 0
        BEGIN
            SET @isPrime = 0
            BREAK
        END
        SET @k = @k + 1
    END

    IF @isPrime = 1
        PRINT @num

    FETCH NEXT FROM numCursor INTO @num
END

CLOSE numCursor
DEALLOCATE numCursor

-- 3. 

DECLARE @credits int = 500
DECLARE @cost int = 10
DECLARE @balance int = @credits
DECLARE @num1 int
DECLARE @num2 int
DECLARE @num3 int

WHILE @balance >= @cost
BEGIN
    SET @balance -= @cost

    SET @num1 = CAST(RAND() * 7 + 1 AS int)
	SET @num2 = CAST(RAND() * 7 + 1 AS int)
	SET @num3 = CAST(RAND() * 7 + 1 AS int)

    PRINT 'Scrolling result: ' + char(10) + '| '
		+ CAST(@num1 AS varchar(10)) + ' - ' 
		+ CAST(@num2 AS NVARCHAR(10)) + ' - ' 
		+ CAST(@num3 AS NVARCHAR(10)) + ' |'
    
    IF @num1 = @num2 AND @num2 = @num3
	BEGIN
		SET @balance += 50
		PRINT 'You"ve won 50 credits!'
	END
	ELSE IF @num1 = 7 AND @num2 = 7 AND @num3 = 7
	BEGIN
		SET @balance += 777
		PRINT 'JACKPOT!!! You have won 777 credits!!!'
	END
	ELSE
	BEGIN
		PRINT 'Unfortunately, you haven"t won anything.'
		SET @balance -= 10
	END
PRINT 'Your balance: ' + CAST(@balance AS varchar(10)) + ' credits'
PRINT '-----------------------------------'
END

IF @balance < @cost
    PRINT 'Oops! Looks like you have no credits left, game over.'

-- 4.
CREATE TABLE Bad_Words (word varchar(255))
INSERT INTO Bad_Words VALUES ('cunt')


DECLARE @st varchar(255) = 'cunt!';
DECLARE @word varchar(255)
DECLARE @has_bad_words bit = 0

-- 
DECLARE bw_cursor CURSOR FOR SELECT word FROM Bad_Words

OPEN bw_cursor

FETCH NEXT FROM bw_cursor INTO @word;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF CHARINDEX(@word, @st) > 0
		SET @has_bad_words = 1

    FETCH NEXT FROM bw_cursor INTO @word
END

CLOSE bw_cursor
DEALLOCATE bw_cursor

IF @has_bad_words = 1
    PRINT 'It"s spam/get banned'
ELSE
    PRINT 'It"s not spam.'

-- 5.1 
DECLARE @db_name varchar(255)

DECLARE db_cursor CURSOR FOR 
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb') 

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @db_name

WHILE @@FETCH_STATUS = 0
BEGIN
       PRINT @db_name
       FETCH NEXT FROM db_cursor INTO @db_name
END

CLOSE db_cursor
DEALLOCATE db_cursor

-- 5.2 
DECLARE @db_name2 varchar(255), @l int = 1

DECLARE db_cursor2 CURSOR FOR 
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb')

OPEN db_cursor2
FETCH NEXT FROM db_cursor2 INTO @db_name2

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @l % 4 = 0
		PRINT @db_name2

	SET @l += 1
	FETCH NEXT FROM db_cursor2 INTO @db_name2
END

CLOSE db_cursor2
DEALLOCATE db_cursor2

-- 5.3
DECLARE @db_name3 varchar(255)

DECLARE db_cursor3 CURSOR FOR 
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb') AND name LIKE '%А%'

OPEN db_cursor3
FETCH NEXT FROM db_cursor3 INTO @db_name3

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @db_name3
	FETCH NEXT FROM db_cursor3 INTO @db_name3
END

CLOSE db_cursor3
DEALLOCATE db_cursor3

-- 5.4 
CREATE OR ALTER PROCEDURE GetDBSize
@db_name varchar(255),
@sizeMB DECIMAL(18,2) OUTPUT
AS
BEGIN
	SELECT @sizeMB = SUM(size * 8.0 / 1024)
	FROM sys.master_files
	WHERE type = 0 AND [database_id] = DB_ID(@db_name)
END

-- 
DECLARE @db_name4 varchar(255)
DECLARE @db_size DECIMAL(18,2)

DECLARE db_cursor4 CURSOR FOR 
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb')

OPEN db_cursor4
FETCH NEXT FROM db_cursor4 INTO @db_name4

WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC GetDBSize @db_name = @db_name4, @sizeMB = @db_size OUTPUT
	IF @db_size < 1 
		PRINT @db_name4
	FETCH NEXT FROM db_cursor4 INTO @db_name4
END

CLOSE db_cursor4
DEALLOCATE db_cursor4