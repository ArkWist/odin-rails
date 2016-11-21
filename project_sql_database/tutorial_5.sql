-- SUM and COUNT

-- 1. Show the total population of the world.
SELECT SUM(population) AS population
  FROM world;

-- 2. List all the continents - just once each.
SELECT DISTINCT continent
  FROM world;

-- 3. Give the total GDP of Africa.
SELECT SUM(gdp)
  FROM world
 WHERE continent = 'Africa';

-- 4. Show how many countries have an area of at least 1000000.
SELECT COUNT(name)
  FROM world
 WHERE area >= 1000000;

-- 5. Show the total population of France, Germany, and Spain. 
SELECT SUM(population) AS population
  FROM world
 WHERE name IN ('France', 'Germany', 'Spain');

-- 6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent;

-- 7.


-- 8.








