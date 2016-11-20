
-- Modify it to show the population of Germany
SELECT population
  FROM world
 WHERE name = 'Germany'
  
-- Show the name and the population for 'Ireland', 'Iceland' and 'Denmark'.
SELECT name, population
  FROM world
 WHERE name IN ('Ireland', 'Iceland', 'Denmark');

-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000. 
SELECT name, area
  FROM world
 WHERE area BETWEEN 200000
                AND 250000


