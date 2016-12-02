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
SELECT company, num, COUNT(*)
  FROM route
 WHERE stop = 149 OR stop = 53
 GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Show the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
  FROM route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
 WHERE a.stop = 53 AND b.stop = 149;

-- 6. Show the services between Craiglockhart and London Road.
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a
  JOIN route b     ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
 WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

-- 7. Give a list of all the services which connect stops 115 and 137 (Haymarket and Leith).
SELECT DISTINCT a.company, a.num
  FROM route a
  JOIN route b     ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
 WHERE stopa.name = 'Haymarket' AND stopb.name = 'Leith';

-- 8. Give a list of the services which connect the stops Craiglockhart and Tollcross.
SELECT DISTINCT a.company, a.num
  FROM route a
  JOIN route b     ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
 WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- 9. Give a distinct list of the stops which may be reached from Craiglockhart by taking one bus, including Craiglockhart itself, offered by the LRT company.
SELECT DISTINCT stopb.name, a.company, a.num
  FROM route a
  JOIN route b     ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
 WHERE stopa.name = 'Craiglockhart' AND a.company = 'LRT';

-- 10. Find the routes involving two buses that can go from Craiglockhart to Sighthill.
SELECT DISTINCT ra.num, ra.company, sb.name, rc.num, rc.company
  FROM route ra
  JOIN route rb ON (ra.company = rb.company AND ra.num = rb.num)
  JOIN (route rc JOIN route rd ON (rc.company = rd.company AND rc.num = rd.num))
  JOIN stops sa ON (ra.stop = sa.id)
  JOIN stops sb ON (rb.stop = sb.id)
  JOIN stops sc ON (rc.stop = sc.id)
  JOIN stops sd ON (rd.stop = sd.id)
 WHERE sa.name = 'Craiglockhart'
   AND sd.name = 'Sighthill'
   AND sb.name = sc.name
 ORDER BY LENGTH(ra.num), rb.num, sb.id, LENGTH(rc.num), rd.num;
-- with reference to: https://github.com/jisaw/sqlzoo-solutions/blob/master/self-join.sql
