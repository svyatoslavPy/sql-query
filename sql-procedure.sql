-- 1.
CREATE OR ALTER PROCEDURE ShowGroupDepartmentBorrowedBooks
AS
BEGIN
	SELECT
		[Group].name AS 'groups_and_departments',
		COUNT(S_Cards.date_out) AS 'borrowed_books'
	FROM [Group]
		JOIN Student ON Student.id_group = [Group].id
		JOIN S_Cards ON S_Cards.id_student = Student.id
	GROUP BY [Group].name

	UNION ALL

	SELECT
		Department.name,
		COUNT(T_Cards.date_out)
	FROM Department
		JOIN Teacher ON Teacher.id_department = Department.id
		JOIN T_Cards ON T_Cards.id_teacher = Teacher.id
	GROUP BY Department.name
END

EXEC ShowGroupDepartmentBorrowedBooks


-- 2.
CREATE OR ALTER PROCEDURE FindBooks
    @firstname NVARCHAR(50),
    @lastname NVARCHAR(50),
    @category NVARCHAR(50),
    @field INT,
    @sort INT
AS
BEGIN
    DECLARE @order NVARCHAR(4) = CASE WHEN @sort = 0 THEN 'ASC' ELSE 'DESC' END
    DECLARE @query NVARCHAR(500) = N'SELECT
        b.name AS book_name,
        a.first_name,
        a.last_name,
        c.name AS category
    FROM Book b
        JOIN Author a ON b.id_author = a.id
        JOIN Category c ON b.id_category = c.id
    WHERE
        a.first_name LIKE @firstname AND
        a.last_name LIKE @lastname AND
        c.name LIKE @category
    ORDER BY ' + CAST(@field AS NVARCHAR) + ' ' + @order

    EXEC sp_executesql @query, N'@firstname NVARCHAR(50), @lastname NVARCHAR(50), @category NVARCHAR(50)', @firstname, @lastname, @category
END


-- 3
CREATE OR ALTER PROCEDURE ShowLibrarianBookCount
AS
BEGIN
	SELECT
		Librarian.first_name,
		Librarian.last_name,
		COUNT(T_Cards.date_out) + COUNT(S_Cards.date_out) AS 'books'
	FROM Librarian
		LEFT JOIN T_Cards ON Librarian.id = T_Cards.id_librarian
		LEFT JOIN S_Cards ON Librarian.id = S_Cards.id_librarian
	GROUP BY
		Librarian.first_name,
		Librarian.last_name
	ORDER BY 'books' DESC
END

EXEC ShowLibrarianBookCount


-- 4.
CREATE OR ALTER PROCEDURE ShowBiggestStudentBookCount
AS
BEGIN
	SELECT TOP 1
		Student.first_name,
		Student.last_name,
		COUNT(S_Cards.id_student) AS 'books'
	FROM Student
		JOIN S_Cards ON Student.id = S_Cards.id_student
	GROUP BY
		Student.first_name,
		Student.last_name
	ORDER BY 'books' DESC
END

EXEC ShowBiggestStudentBookCount


-- 5
CREATE OR ALTER PROCEDURE TotalBooksBorrowed
AS
BEGIN
    SELECT
        ((SELECT COUNT(T_Cards.date_out) FROM T_Cards) +
        (SELECT COUNT(S_Cards.date_out) FROM S_Cards))
        AS 'all_borrowed_books'
END
