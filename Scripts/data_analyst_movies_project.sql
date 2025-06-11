--Q1.Give the name, release year, and worldwide gross of the lowest grossing movie.
SELECT film_title, release_year, MIN (revenue.worldwide_gross)
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
GROUP BY film_title, release_year
ORDER BY MIN (revenue.worldwide_gross) ASC;
--Semi-tough, 1977, 37187139

--Q2. 
--What year has the highest average imdb rating?
SELECT release_year, AVG(imdb_rating)
FROM specs
INNER JOIN rating
ON specs.movie_id = rating.movie_id
GROUP BY release_year
ORDER BY AVG(imdb_rating) DESC;
--1991

--Q3.
--What is the highest grossing G-rated movie? Which company distributed it?
SELECT film_title, mpaa_rating, MAX (worldwide_gross)
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
GROUP BY mpaa_rating,film_title
ORDER BY MAX (worldwide_gross) DESC;

--Toy Story 4 


--Q4.Write a query that returns, for each distributor in the distributors table, -----the distributor name and the number of movies ----associated with that distributor in --the movies table. Your result set should include all of the distributors, whether --or not -----they --have any movies in the movies table.

SELECT



--Q5.Write a query that returns the five distributors with the highest average movie budget.



--Q6.How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT*, rating.imb_rating
FROM distributors
INNER JOIN specs.domestic_distributor.id = distributors.company_name




--Q7.Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

