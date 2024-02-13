-- 1
CREATE OR ALTER VIEW Profs_And_Books AS
SELECT 
	Teacher.first_name,
	Teacher.last_name,
	Book.name AS borrowed_books
FROM Teacher
JOIN T_Cards ON Teacher.id = T_Cards.id_teacher
JOIN Book ON T_Cards.id_book = Book.id

-- 2
CREATE OR ALTER VIEW Students_Without_Books AS
SELECT
	Student.first_name,
	Student.last_name
FROM Student
WHERE id NOT IN (SELECT DISTINCT id_student FROM S_Cards)

-- 3
-- (выдал больше всего книг)
CREATE OR ALTER VIEW Most_Active_Labrarian AS
SELECT TOP 1
	Librarian.first_name,
	Librarian.last_name,
	COUNT(*) AS books_borrowed
FROM Librarian
JOIN S_Cards ON Librarian.id = S_Cards.id_librarian
GROUP BY Librarian.first_name, Librarian.last_name

--
CREATE OR ALTER VIEW Most_Responsible_Librarian AS
SELECT TOP 1
	Librarian.first_name,
	Librarian.last_name,
	COUNT(*) AS books_returned
FROM Librarian
JOIN S_Cards ON Librarian.id = S_Cards.id_librarian
WHERE S_Cards.date_in IS NOT NULL
GROUP BY Librarian.first_name, Librarian.last_name
