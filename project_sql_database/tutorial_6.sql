-- JOIN

-- 1. Show all goals scored by Germany.
SELECT matchid, player
  FROM goal 
 WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for just game 1012.
SELECT id, stadium, team1, team2
  FROM game
 WHERE id = 1012;

-- 3. Show the player, teamid, stadium and mdate for every German goal.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM game
  JOIN goal ON (game.id = goal.matchid)
 WHERE goal.teamid = 'GER';

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario.
SELECT game.team1, game.team2, goal.player
  FROM game
  JOIN goal ON (game.id = goal.matchid)
 WHERE goal.player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
  FROM goal
  JOIN eteam ON goal.teamid = eteam.id
 WHERE goal.gtime <= 10;

-- 6. List the the dates of the matches and the name of the team in which Fernando Santos was the team1 coach.
SELECT game.mdate, eteam.teamname
  FROM game
  JOIN eteam ON (game.team1 = eteam.id)
 WHERE eteam.coach = 'Fernando Santos';

-- 7.















