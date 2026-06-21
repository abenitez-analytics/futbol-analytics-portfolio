-- Football Player Dashboard
-- Analysis queries for the final player dataset.

USE football_analytics;

-- 1. Check how many players are available in each table.
SELECT
    'player_stats' AS table_name,
    COUNT(*) AS total_rows
FROM player_stats
UNION ALL
SELECT
    'scouting_shortlist' AS table_name,
    COUNT(*) AS total_rows
FROM scouting_shortlist;

-- 2. Top 10 players by attacking score.
SELECT
    player,
    attacking_score,
    xg_per90,
    shots_per90,
    passes_per90
FROM player_stats
ORDER BY attacking_score DESC
LIMIT 10;

-- 3. Top 10 players by xG per 90 minutes.
-- The minutes filter avoids ranking players with very small samples too highly.
SELECT
    player,
    minutes,
    xg,
    xg_per90,
    shots_per90
FROM player_stats
WHERE minutes >= 450
ORDER BY xg_per90 DESC
LIMIT 10;

-- 4. Efficient finishers: players who generate strong xG per shot.
SELECT
    player,
    shots,
    xg,
    xg_per_shot,
    shots_per90
FROM player_stats
WHERE shots >= 10
ORDER BY xg_per_shot DESC
LIMIT 10;

-- 5. High pressing players.
SELECT
    player,
    pressures,
    pressures_per90,
    recoveries_per90,
    pressure_pass_ratio
FROM player_stats
WHERE minutes >= 450
ORDER BY pressures_per90 DESC
LIMIT 10;

-- 6. Balanced scouting profile: attack plus pressure.
SELECT
    player,
    attacking_score,
    xg_per90,
    shots_per90,
    pressures_per90,
    recoveries_per90
FROM player_stats
WHERE
    xg_per90 >= 0.25
    AND shots_per90 >= 1.5
    AND pressures_per90 >= 10
ORDER BY attacking_score DESC;

-- 7. Scouting shortlist ranked by attacking score.
SELECT
    player,
    attacking_score,
    xg_per90,
    shots_per90,
    xg_per_shot,
    pressures_per90
FROM scouting_shortlist
ORDER BY attacking_score DESC;

-- 8. Compare shortlisted players with the full player pool average.
SELECT
    s.player,
    s.attacking_score,
    ROUND(a.avg_attacking_score, 2) AS dataset_avg_attacking_score,
    ROUND(s.attacking_score - a.avg_attacking_score, 2) AS score_vs_dataset_avg,
    s.xg_per90,
    s.shots_per90,
    s.pressures_per90
FROM scouting_shortlist AS s
CROSS JOIN (
    SELECT AVG(attacking_score) AS avg_attacking_score
    FROM player_stats
) AS a
ORDER BY score_vs_dataset_avg DESC;

-- 9. Summary KPIs for a dashboard header.
SELECT
    COUNT(*) AS total_players,
    ROUND(AVG(attacking_score), 2) AS avg_attacking_score,
    ROUND(AVG(xg_per90), 2) AS avg_xg_per90,
    ROUND(AVG(shots_per90), 2) AS avg_shots_per90,
    ROUND(AVG(pressures_per90), 2) AS avg_pressures_per90
FROM player_stats;

-- 10. Shortlist summary KPIs.
SELECT
    COUNT(*) AS shortlist_players,
    ROUND(AVG(attacking_score), 2) AS shortlist_avg_attacking_score,
    ROUND(AVG(xg_per90), 2) AS shortlist_avg_xg_per90,
    ROUND(AVG(shots_per90), 2) AS shortlist_avg_shots_per90,
    ROUND(AVG(pressures_per90), 2) AS shortlist_avg_pressures_per90
FROM scouting_shortlist;
