create table netflix(
show_id varchar(10),
type varchar(10),
title varchar(150),
director varchar(210),
cast_list varchar(1000),
country varchar(150),
date_added varchar(50),
release_year int,
rating varchar(10),
duration varchar(20),
listed_in varchar(100),
description varchar(250)
)

SELECT*FROM NETFLIX

SELECT COUNT(*) AS TOTAL_VALUE FROM NETFLIX 

 -- 1.Count the number of Movies vs Tv Show--
SELECT type, COUNT(type) AS total_count
FROM NETFLIX
GROUP BY type;

select distinct director from NETFLIX

 --2.Find the most Common rating for movies and Tv Shows--
SELECT type, rating, COUNT(*) AS total
FROM NETFLIX
GROUP BY type, rating
ORDER BY type, total ASC;


select type,rating
from
 (select 
    type,
    rating,
    count(*),
    rank() over(partition by type order by count(*) desc) as ranking
  from Netflix
  group by type, rating) as table_1
  where 
    ranking = 1

--3.List all movies released in a specific year (e.g.2020)--
SELECT * FROM NETFLIX
WHERE
release_year =2020
AND
 TYPE='Movie'

 --4.Find the Top 5 countries with the most content on netflix--
SELECT COUNTRY, COUNT(*) AS TOTAL_CONTENT
FROM NETFLIX 
GROUP BY COUNTRY
ORDER BY TOTAL_CONTENT DESC
LIMIT 2;


select
     unnest(string_to_array(country,',')) as new_country,
     count(show_id) as total_content
from netflix
group by new_country
order by Total_content desc
limit 5

--5.Identify the Longest Movie --
SELECT TYPE,DURATION ,title
FROM NETFLIX
WHERE TYPE='Movie'
order by duration desc
limit 5;


select * from netflix
	where
	  Type ='Movie'
	  and 
	  duration = (select max(duration) 

	  
 --6.Find content added in the last 5 years--
 select listed_in
 from NETFLIX
 where release_year>=2020
 group by listed_in;
 
 --7.Find all the movie/Tv show by director ‘Rajiv Chilaka' --
 select type,title,director 
 from NETFLIX 
 where director='Rajiv Chilaka';

   select * from netflix
   where director ilike '%Rajiv Chilaka%'

--8.List all Tv shows with more than 5 seasons --
select type ,duration,title from NETFLIX
WHERE TYPE='TV Show' and duration>'5 Sesons'
order by duration asc;


  select * from netflix
	 where 
	     type ='TV Show' 
		 and
		 Split_Part(duration,' ', 1):: numeric > 5 

		 
--9.Count the number of content items in each genre --
select listed_in, count(*) as total_num_of_items
from NETFLIX
GROUP BY listed_in
order by total_num_of_items asc;


select 
UNNEST(String_To_Array(listed_in,',')) AS Genre,
COUNT(show_id) as total_content
from netflix
GROUP BY 1


		
--10.Find each year and the average numbers of content release in India on Netflix,Top 5 years with highest average content releases-

SELECT release_year, COUNT(*) AS total_content
FROM NETFLIX
WHERE country = 'India'
GROUP BY release_year
order by total_content desc
limit 5;

 select
 EXTRACT(YEAR FROM To_date(date_added,'Month DD, YYYY')) AS YEAR,
count(*) as yearly_content,
Round(count(*)::numeric/(select count(*) from netflix where country='India')::numeric * 100,2) as avg_content_per_year
from netflix 
where country = 'India'
group by 1

 --11.List all movie that are Documentaries--

select TYPE,listed_in,title
from NETFLIX
WHERE TYPE='Movie'
and listed_in='Documentaries';

 select * from netflix
   where
       listed_in ilike '%documentaries%'
       and 
	   type ='Movie'


---12. Find all content without a director--

        select * from netflix
		where
		   director is null


 --13.Find how many movies actor 'Salman Khan' appeared in last 10 years --

select count(*) as total_movies
from NETFLIX
where type='Movies' and cast_list='Salman Khan'
and release_year >=2015;

 select * from netflix
		 where
		    cast_list ilike '%Salman khan%'
			and
			release_year >  extract(year from current_date) - 10


----14. Find the Top 10 actors who have appeared in the highest number of movies produced in Inida.--

		 select 
		      unnest(string_to_array(cast_list, ' '))  as actors,
		      count(*) as total_content
		 from netflix
		 where 
		 country ILIKE '%iNDIA%'
         GROUP BY 1
		 ORDER BY 2 DESC
		 LIMIT 10
     

---15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field.-- 
        Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many iteams fall into each category.


		   with New_table   
		   as(
		   select *,
           case
		      when description ilike '%kill%' or
			       description ilike '%violence%'  then 'Bad_content'
			  Else 	'Good_Content'  
		   End category
		   from netflix
           ) select category,
		     count(*) as total_content
			 from New_table
			 group by category


 





