-- more JOIN operations

-- 1. List the films where the year is 1962.
SELECT id, title
 FROM movie
 WHERE yr = 1962;

-- 2. Give year of 'Citizen Kane'.
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr. Order results by year.
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr;

-- 4. What are the titles of the films with id 11768, 11955, 21191.
SELECT title
  FROM movie
 WHERE id IN (11768, 11955, 21191);

-- 5. SHow the id number for the actress 'Glenn Close' have?
SELECT id
  FROM actor
 WHERE name = 'Glenn Close';

-- 6. Show the id of the film 'Casablanca' 
SELECT id
  FROM movie
 WHERE title = 'Casablanca';

-- 7. 


-- 8. 


-- 9. 


-- 10. 


-- 11. 


-- 12. 


-- 13. 


-- 14. 


-- 15. 


-- 16. 







