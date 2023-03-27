#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
echo "$($PSQL "DROP TABLE games, teams CASCADE")"

echo "$($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(50) UNIQUE NOT NULL)")"

echo "$($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY NOT NULL, year INT NOT NULL, round VARCHAR(50) NOT NULL, winner_id INT NOT NULL REFERENCES teams(team_id), opponent_id INT NOT NULL REFERENCES teams(team_id), winner_goals INT NOT NULL, opponent_goals INT NOT NULL)")"
