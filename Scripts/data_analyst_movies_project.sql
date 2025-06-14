--Q1.Give the name, release year, and worldwide gross of the lowest grossing movie.
SELECT film_title, release_year, MIN (revenue.worldwide_gross)
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
GROUP BY film_title, release_year
ORDER BY MIN (revenue.worldwide_gross) ASC;
--A.Semi-tough, 1977, 37187139

--Q2.What year has the highest average imdb rating?
SELECT release_year, AVG(imdb_rating)
FROM specs
INNER JOIN rating
ON specs.movie_id = rating.movie_id
GROUP BY release_year
ORDER BY AVG(imdb_rating) DESC;
--A.1991


--Q3. What is the highest grossing G-rated movie? Which company distributed it?
SELECT specs.film_title, revenue.worldwide_gross,distributors.company_name
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
INNER JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
WHERE mpaa_rating ='G'
ORDER BY revenue.worldwide_gross DESC;

--A.Toy Story 4, Walt Disney


--Q4.Write a query that returns, for each distributor in the distributors table,the  distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT distributors.company_name, COUNT (specs.film_title)
FROM distributors
LEFT JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
GROUP BY distributors.company_name
ORDER BY COUNT (specs.film_title) DESC;


--Q5.Write a query that returns the five distributors with the highest average movie budget.
SELECT distributors.company_name, AVG(revenue.film_budget)
FROM specs
INNER JOIN revenue
ON specs.movie_id=revenue.movie_id
INNER JOIN distributors
ON specs.domestic_distributor_id= distributors.distributor_id
GROUP BY company_name 
ORDER BY AVG(revenue.film_budget)DESC
LIMIT 5;

--A. Walt Disney, Sony Pictures, Liosngate, Dreamworks,Warner Bros. 



--Q6.How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT headquarters, imdb_rating, film_title
FROM distributors
LEFT JOIN specs
ON specs.domestic_distributor_id = distributors.distributor_id
LEFT JOIN rating
ON specs.movie_id = rating.movie_id
WHERE headquarters NOT LIKE '%CA'
ORDER BY imdb_rating DESC;
--A.2 movies Drity Dancing, My Big Fat Weddin
--sidenotes
Select*
FROM distributors
WHERE headquarters NOT LIKE '%CA%'

SELECT*
FROM rating;

SELECT*
FROM specs;



--Q7.Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
--Krithika 

SELECT 'movies < 2 hours'AS movie_time, AVG( imdb_rating)
FROM specs
JOIN rating
USING (movie_id)
WHERE length_in_min <120
UNION
SELECT 'movies > 2 hours' AS movie_time, AVG(imdb_rating)
FROM specs
JOIN rating
USING(movie_id)
WHERE length_in_min > 120
GROUP BY film_title
ORDER BY AVG (imdb_rating) DESC;

--Jennifer 
SELECT
    CASE
        WHEN specs.length_in_min > 120 THEN 'Over 2 Hours'
        WHEN specs.length_in_min <= 120 THEN '2 Hours or Less' -- This includes movies exactly 120 mins. 
    END AS film_length_category, -- this creates a new column called film_length_category that assigns each movie to one of your desired categories based on its length
    AVG(rating.imdb_rating) AS average_rating
FROM specs
JOIN
    rating ON specs.movie_id = rating.movie_id
GROUP BY
    film_length_category -- Grouping all movies belonging to 'Over 2 Hours' into one group and '2 Hours or Less' into another, allowing AVG() to calculate the average for each category.
ORDER BY 1 DESC;

--A.Over 2 Hours 7.2571, 2 hours or less 6.9154









