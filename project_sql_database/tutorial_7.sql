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

-- 4. What are the titles of the films with ids 11768, 11955, 21191.
SELECT title
  FROM movie
 WHERE id IN (11768, 11955, 21191);

-- 5. Show the id number for the actress Glenn Close.
SELECT id
  FROM actor
 WHERE name = 'Glenn Close';

-- 6. Show the id of the film Casablanca. 
SELECT id
  FROM movie
 WHERE title = 'Casablanca';

-- 7. Obtain the cast list for Casablanca.
SELECT name
  FROM actor
  JOIN casting ON actor.id = casting.actorid
 WHERE movieid = 11768
 ORDER BY actor.name;

-- 8. Obtain the cast list for the film Alien.
SELECT name
  FROM actor
  JOIN casting ON actor.id = casting.actorid
  JOIN movie   ON casting.movieid = movie.id
 WHERE movie.title = 'Alien'
 ORDER BY actor.name;

-- 9. 
SELECT movie.title
  FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor   ON casting.actorid = actor.id
 WHERE actor.name = 'Harrison Ford'
 ORDER BY movie.title;

-- 10. List the films where 'Harrison Ford' has appeared - but not in the starring role.
SELECT movie.title
  FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor   ON casting.actorid = actor.id
 WHERE actor.name = 'Harrison Ford'
   AND casting.ord <> 1
 ORDER BY movie.title;

-- 11. List the films together with the leading star for all 1962 films. 
SELECT movie.title, actor.name
  FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor   ON casting.actorid = actor.id
 WHERE movie.yr = 1962
   AND casting.ord = 1;

-- 12. Show the year and the number of movies John Travolta made each year for any year in which he made more than 2 movies.
SELECT movie.yr, COUNT(movie.title)
  FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor   ON casting.actorid = actor.id
 WHERE name = 'John Travolta'
 GROUP BY movie.yr
HAVING COUNT(movie.title) = (SELECT MAX(c)
                               FROM (SELECT movie.yr, COUNT(movie.title) AS c
                                       FROM movie
                                       JOIN casting ON movie.id = casting.movieid
                                       JOIN actor   ON casting.actorid = actor.id
                                      WHERE name = 'John Travolta'
                                      GROUP BY yr) AS t)

-- 13. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT movie.title, actor.name
  FROM movie
  JOIN casting t1 ON movie.id = t1.movieid
  JOIN actor      ON actor.id = t1.actorid
 WHERE t1.ord = 1
   AND t1.movieid IN (SELECT t2.movieid
                        FROM casting t2
                        JOIN actor ON actor.id = t2.actorid
                       WHERE name = 'Julie Andrews');

-- 14. Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
SELECT actor.name
  FROM actor
  JOIN casting ON actor.id = casting.actorid
 WHERE casting.ord = 1
 GROUP BY actor.name
HAVING COUNT(actor.name) >= 30
 ORDER BY actor.name;

-- 15. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT movie.title, COUNT(casting.actorid) AS actors
  FROM movie
  JOIN casting ON movie.id = casting.movieid
 WHERE movie.yr = 1978
 GROUP BY title
 ORDER BY COUNT(casting.actorid) DESC, title;

-- 16. List all the people who have worked with Art Garfunkel.
SELECT actor.name
  FROM actor
  JOIN casting ON actor.id = casting.actorid
 WHERE casting.movieid IN (SELECT casting.movieid
                             FROM casting
                             JOIN actor ON actor.id = casting.actorid
                            WHERE actor.name = 'Art Garfunkel')
   AND name <> 'Art Garfunkel';

