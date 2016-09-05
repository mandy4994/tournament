# Tournament Planner
In this project, there is a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament use the Swiss system for pairing up players in each round: players are not eliminated, and each player is paired with another player with the same number of wins, or as close as possible.

This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.

## Instructions to run the project:

1. Install Vagrant and VirtualBox (Follow instructions from https://www.udacity.com/wiki/ud197/install-vagrant to install and configure)
2. Run vagrant up command followed by vagrant ssh to login
3. Replace the tournament folder inside vagrant folder to this one.
4. Change directory in bash using cd /vagrant/tournament
5. Run 'psql tournament' command to connect to tournament database and to check if exists (if it does not exist you can create empty one using 'createdb tournament')
6. Run '\i tournament.sql' to modify database
7. Run '\quit' to get back to command line and you can run test using 'python tournament_test.py' command

## Code Templates


The template file tournament.sql is where the database schema is defined, in the form of SQL create table commands.

The template file tournament.py is where the code of the module is. In this file you’ll see stubs of several functions. Each function has a docstring that says what it should do.

Finally, the file tournament_test.py contains unit tests that will test the functions written in tournament.py.

Functions in tournament.py
registerPlayer(name)
Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

countPlayers()
Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

deletePlayers()
Clear out all the player records from the database.

reportMatch(winner, loser)
Stores the outcome of a single match between two players in the database.

deleteMatches()
Clear out all the match records from the database.

playerStandings()
Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

swissPairings()
Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.
