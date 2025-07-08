
-- 1. Top 3 Most Loved Characters (Total Votes)
SELECT c.name, SUM(fv.vote_count) AS total_votes
FROM fan_votes fv
JOIN characters c ON fv.character_id = c.character_id
GROUP BY fv.character_id
ORDER BY total_votes DESC
LIMIT 3;

-- 2. Underrated MVPs (Low Screen Time, High Votes)
SELECT c.name, SUM(ce.screen_time) AS total_time, SUM(fv.vote_count) AS total_votes
FROM characters c
JOIN character_episodes ce ON c.character_id = ce.character_id
JOIN fan_votes fv ON c.character_id = fv.character_id
GROUP BY c.character_id
HAVING total_time < 20 AND total_votes > 200;

-- 3. Character with Most Unique Interactions
SELECT c.name, COUNT(DISTINCT i.character2_id) AS unique_interactions
FROM interactions i
JOIN characters c ON i.character1_id = c.character_id
GROUP BY c.character_id
ORDER BY unique_interactions DESC
LIMIT 1;

-- 4. Most Interactive Episode (Highest Interactions)
SELECT e.title, COUNT(*) AS total_interactions
FROM interactions i
JOIN episodes e ON i.episode_id = e.episode_id
GROUP BY i.episode_id
ORDER BY total_interactions DESC
LIMIT 1;

-- 5. Total Screen Time by Season per Character
SELECT c.name, e.season, SUM(ce.screen_time) AS total_screen_time
FROM character_episodes ce
JOIN characters c ON ce.character_id = c.character_id
JOIN episodes e ON ce.episode_id = e.episode_id
GROUP BY c.name, e.season
ORDER BY e.season, total_screen_time DESC;

-- 6. Most Interactions Between Two Characters
SELECT c1.name AS character_1, c2.name AS character_2, COUNT(*) AS total_interactions
FROM interactions i
JOIN characters c1 ON i.character1_id = c1.character_id
JOIN characters c2 ON i.character2_id = c2.character_id
GROUP BY i.character1_id, i.character2_id
ORDER BY total_interactions DESC
LIMIT 1;

-- 7. Rank Characters by Votes per Episode
SELECT 
  e.title,
  c.name,
  fv.vote_count,
  RANK() OVER (PARTITION BY fv.episode_id ORDER BY fv.vote_count DESC) AS vote_rank
FROM fan_votes fv
JOIN characters c ON fv.character_id = c.character_id
JOIN episodes e ON fv.episode_id = e.episode_id;

-- 8. Characters Who Got Votes but Had 0 Screen Time
SELECT c.name, e.title
FROM fan_votes fv
JOIN characters c ON fv.character_id = c.character_id
JOIN episodes e ON fv.episode_id = e.episode_id
LEFT JOIN character_episodes ce 
    ON c.character_id = ce.character_id AND e.episode_id = ce.episode_id
WHERE ce.screen_time IS NULL;

-- 9. Most Popular Character by Season
SELECT e.season, c.name, SUM(fv.vote_count) AS season_votes
FROM fan_votes fv
JOIN episodes e ON fv.episode_id = e.episode_id
JOIN characters c ON fv.character_id = c.character_id
GROUP BY e.season, c.character_id
ORDER BY e.season, season_votes DESC;

-- 10. Top 5 Alliances Across All Episodes
SELECT c1.name AS character_1, c2.name AS character_2, COUNT(*) AS alliance_count
FROM interactions i
JOIN characters c1 ON i.character1_id = c1.character_id
JOIN characters c2 ON i.character2_id = c2.character_id
WHERE i.interaction_type = 'alliance'
GROUP BY c1.character_id, c2.character_id
ORDER BY alliance_count DESC
LIMIT 5;

-- 11. Average Screen Time: Main vs Supporting Characters
SELECT role, AVG(ce.screen_time) AS avg_screen_time
FROM characters c
JOIN character_episodes ce ON c.character_id = ce.character_id
GROUP BY role;
