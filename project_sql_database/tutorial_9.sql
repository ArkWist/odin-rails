--  self JOIN

-- 1. Show the number of stops in the database.
SELECT COUNT(stops.id)
  FROM stops;

-- 2. Find the id value for the stop 'Craiglockhart'.
SELECT stops.id
  FROM stops
 WHERE stops.name = 'Craiglockhart';

-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT stops.id, stops.name
  FROM stops
  JOIN route ON stops.id = route.stop
 WHERE route.company = 'LRT' AND route.num = '4';

-- 4. Give the number of routes that visit either London Road (149) or Craiglockhart (53)





-- 10. 
