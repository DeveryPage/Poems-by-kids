--1
SELECT *
From Grade

--2
Select *
From Emotion

--3
Select Count(Poem.Id)
From Poem

--4
Select *
From Author
Order By Author.name

--5
Select name
from Author
Where Author.id <= 76

--6
Select Top 76 Author.name, Grade.name, Gender.name
from Author
left join Grade on  Grade.Id = Author.gradeId
left join Gender on Gender.Id = Author.genderId

--7
Select sum(WordCount)
From Poem

--8
Select Poem.CharCount Poem,title
from Poem
order by Poem.CharCount asc
--Where CharCount < 7

--9
Select *
From Author
Left Join Grade on Grade.id = Author.gradeId
Where Grade.id = 3
--9.5
Select count(Author.Id) as 'Number Of 3rd Graders'
From Author
left join Grade on Grade.id = Author.gradeId
Where Grade.id = 3

--10
Select *
From Author
Left Join Grade on Grade.id = Author.gradeId
Where Grade.id <= 3

--10.5

Select count(Author.Id) as 'Total Number Of Authors'
From Author
Left Join Grade on Grade.id = Author.gradeId
Where Grade.id <= 3

--11
Select Count(Poem.id) as '4th grade poems'
From Author
Left Join Poem on Poem.AuthorId = Author.Id
Where Author.gradeid = 4

--12
Select g.name, count(p.title) 'Amount per grade'
from Grade g
join Author a on a.GradeId = g.Id
join Poem p on p.AuthorId = a.Id
group by g.name

--13
Select g.name, count(a.name) 'Authors per Grade'
From Grade g
join Author a on a.GradeId = g.Id
group by g.name
--13.5
select count(a.name) as 'Total Number of Authors'
from Author a

--14
Select Top 1 max(Poem.WordCount), Poem.Title
From Poem
Group By Poem.Title 
Order by max(Poem.WordCount)desc


--15
Select Top 3 count(*) poemCount, Author.name
From Poem
join Author on Author.Id = Poem.AuthorId
Group by Author.id, Author.name
Order by poemCount desc

--16
Select count(*) as 'Sad Poems'
From Poem
join PoemEmotion on PoemEmotion.poemId = Poem.Id
join Emotion on Emotion.Id = PoemEmotion.EmotionId
Where Emotion.Id = 3

--17
Select count(*) as 'Numb Poems'
From Poem
left join PoemEmotion on PoemEmotion.poemId = Poem.Id
Where PoemEmotion.Id is null

--18
Select distinct Top 1 e.name 'Emotion in least amount of poems', count(*) 'Least amount of poems'
from Poem p
join PoemEmotion pe on pe.poemId = p.Id
join Emotion e on e.id = pe.Emotionid
Group by e.name

--19
Select g.name, count(poem.id) as 'Poem Count'
From Poem
Left join Author a on Poem.AuthorId = a.Id
left join Grade g on g.id = a.GradeId
left Join PoemEmotion pe on pe.PoemId = Poem.Id
left join Emotion e on pe.EmotionId = e.id
Where e.name = 'Joy'
group by g.name

