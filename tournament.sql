-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
-- Players table
DROP TABLE IF EXISTS players CASCADE;
CREATE TABLE players (
player_id SERIAL PRIMARY KEY,
player_name text
);

-- Matches Table
DROP TABLE IF EXISTS matches;
CREATE TABLE matches (
    match_id SERIAL primary key, 
    winner SERIAL references players(player_id), 
    loser SERIAL references players(player_id)
    );

-- View for player standings
DROP VIEW IF EXISTS standings;
CREATE VIEW standings AS
SELECT p.player_id as player_id, p.player_name,
(SELECT count(*) FROM matches WHERE matches.winner = p.player_id) as won,
(SELECT count(*) FROM matches WHERE p.player_id in (winner, loser)) as played
FROM players p
GROUP BY p.player_id
ORDER BY won DESC;
