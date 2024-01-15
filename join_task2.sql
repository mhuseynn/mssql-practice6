--11. Student və Teacherlər arasında ən məşhur mövzunu(ları) çıxarın.



--12. Kitabxanaya neçə tələbə və neçə müəllim gəldiyini ekrana çıxarın.
select 'Student', COUNT(Id) as Say from S_Cards
UNION
select 'Teacher', COUNT(Id) as Say from T_Cards;



--13. Əgər bütün kitabların sayını 100% qəbul etsək, siz hər fakultənin neçə faiz kitab götürdüyünü hesablamalısınız.
select Faculties.Name, (COUNT(Books.Id) * 100) / (SELECT COUNT(*) FROM S_Cards) AS 'Faiz' from Books
inner join S_Cards on S_Cards.Id_Book=Books.Id
inner join Students on S_Cards.Id_Student=Students.Id
inner join Groups on Students.Id_Group= Groups.Id
inner join Faculties on Groups.Id_Faculty=Faculties.Id
Group by Faculties.[Name]


--14, Ən çox oxuyan fakultə cə dekanatlığı ekrana çıxarın

SELECT distinct top 1 'Facuty',Faculties.Name, COUNT(Students.Id) AS StudentCount
FROM Students
INNER JOIN Groups ON Students.Id_Group = Groups.Id
INNER JOIN Faculties ON Groups.Id_Faculty = Faculties.Id
GROUP BY Faculties.Name
ORDER BY StudentCount DESC

--15. Tələbələr və müəllimlər arasında ən məşhur authoru çıxarın.



--16. Display the names of the most popular books among teachers and students.
--16. Müəllim və Tələbələr arasında ən məşhur kitabların adlarını çıxarın.

select Books.[Name] from Books
inner join S_Cards on S_Cards.Id_Book=Books.Id
Intersect 
select Books.[Name]  from Books
inner join T_Cards on T_Cards.Id_Book=Books.Id


--17. Show all students and teachers of designers.
--17. Dizayn sahəsində olan bütün tələbə və müəllimləri ekrana çıxarın.

select Students.FirstName,Students.LastName from Students
inner join Groups on Students.Id_Group=Groups.Id
inner join Faculties on Faculties.Id=Groups.Id_Faculty
where Faculties.Name='Web Design'
union
select Teachers.FirstName,Teachers.LastName from Teachers
inner join Departments on Teachers.Id_Dep=Departments.Id
where Departments.Name='Graphics and Designs'




--18. Show all information about students and teachers who have taken books.
--18. Kitab götürən tələbə və müəllimlər haqqında informasiya çıxarın.
SELECT Students.FirstName,Students.LastName FROM Students
inner join S_Cards ON S_Cards.Id_Student = Students.Id
UNION
SELECT Teachers.FirstName,Teachers.LastName FROM Teachers
inner join T_Cards ON T_Cards.Id_Teacher = Teachers.Id


--19. Show books that were taken by both teachers and students.
--19. Müəllim və şagirdlərin cəmi neçə kitab götürdüyünü ekrana çıxarın.

SELECT 'Student',COUNT(*) FROM S_Cards  
Union
SELECT 'Teacher',COUNT(*) FROM T_Cards


--20. Show how many books each librarian issued.
--20. Hər kitbxanaçının (libs) neçə kitab verdiyini ekrana çıxarın

Select Libs.FirstName,Libs.LastName,COUNT(*) from Books
inner join S_Cards on Books.Id=S_Cards.Id_Book
inner join Libs on Libs.Id=S_Cards.Id_Lib
Group by Libs.FirstName,Libs.LastName




