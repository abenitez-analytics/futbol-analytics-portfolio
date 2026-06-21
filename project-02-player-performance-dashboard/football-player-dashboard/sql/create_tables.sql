-- Football Player Dashboard
-- SQL script for the final aggregated player dataset.
-- The data comes from player_stats_v2.csv and scouting_shortlist.csv.

CREATE DATABASE IF NOT EXISTS football_analytics;

USE football_analytics;

DROP TABLE IF EXISTS scouting_shortlist;
DROP TABLE IF EXISTS player_stats;

CREATE TABLE player_stats (
    player VARCHAR(150),
    passes FLOAT,
    shots FLOAT,
    xg FLOAT,
    pressures FLOAT,
    recoveries FLOAT,
    matches_played INT,
    minutes INT,
    passes_per90 FLOAT,
    shots_per90 FLOAT,
    xg_per90 FLOAT,
    pressures_per90 FLOAT,
    recoveries_per90 FLOAT,
    xg_per_shot FLOAT,
    pressure_pass_ratio FLOAT,
    attacking_score FLOAT
);

CREATE TABLE scouting_shortlist (
    player VARCHAR(150),
    passes FLOAT,
    shots FLOAT,
    xg FLOAT,
    pressures FLOAT,
    recoveries FLOAT,
    matches_played INT,
    minutes INT,
    passes_per90 FLOAT,
    shots_per90 FLOAT,
    xg_per90 FLOAT,
    pressures_per90 FLOAT,
    recoveries_per90 FLOAT,
    xg_per_shot FLOAT,
    pressure_pass_ratio FLOAT,
    attacking_score FLOAT
);

-- Top attacking players by the custom attacking score.
SELECT
    player,
    attacking_score,
    xg_per90,
    shots_per90,
    passes_per90
FROM player_stats
ORDER BY attacking_score DESC
LIMIT 10;

-- Most dangerous players by expected goals per 90 minutes.
SELECT
    player,
    xg,
    minutes,
    xg_per90,
    shots_per90
FROM player_stats
WHERE minutes >= 450
ORDER BY xg_per90 DESC
LIMIT 10;

-- High-volume shooters with strong chance quality.
SELECT
    player,
    shots_per90,
    xg_per_shot,
    xg_per90
FROM player_stats
WHERE shots_per90 >= 2
ORDER BY xg_per_shot DESC
LIMIT 10;

-- Players who combine attacking output with defensive pressure.
SELECT
    player,
    attacking_score,
    xg_per90,
    pressures_per90,
    recoveries_per90
FROM player_stats
WHERE
    xg_per90 >= 0.25
    AND pressures_per90 >= 10
ORDER BY attacking_score DESC;

-- Scouting shortlist ranked by attacking score.
SELECT
    player,
    attacking_score,
    xg_per90,
    shots_per90,
    pressures_per90,
    recoveries_per90
FROM scouting_shortlist
ORDER BY attacking_score DESC;

-- Compare shortlisted players against the full dataset average.
SELECT
    s.player,
    s.attacking_score,
    s.xg_per90,
    s.shots_per90,
    s.pressures_per90,
    ROUND(s.attacking_score - avg_stats.avg_attacking_score, 2) AS score_vs_average
FROM scouting_shortlist AS s
CROSS JOIN (
    SELECT AVG(attacking_score) AS avg_attacking_score
    FROM player_stats
) AS avg_stats
ORDER BY score_vs_average DESC;
