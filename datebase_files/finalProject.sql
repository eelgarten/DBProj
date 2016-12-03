DROP DATABASE if exists finalProject;
CREATE DATABASE finalProject;
USE finalProject;

DROP TABLE IF EXISTS players;
CREATE TABLE players
(
	playerName char(30) NOT NULL,
    playerId varchar(20) PRIMARY KEY,
    pos char(3) NOT NULL,
    sport char(3) NOT NULL,
    team char(3) NOT NULL,
    salary int(10) NOT NULL
);

DROP TABLE IF EXISTS footballOffensivePlayerStats;
CREATE TABLE footballOffensivePlayerStats
(
	playerId varchar(20) PRIMARY KEY,
    approximateValue int(2),
    passingYards int(4),
    passingTD int(2),
    yardsPerCompletion DECIMAL(3,1),
    yardsPerAttempt DECIMAL(3,1),
    completionPercentage DECIMAL(3,1),
    rushingAttempts int(3),
    rushingYards int(4),
    rushingTD int(2),
    targets int(3),
    receptions int(3),
    receivingYards int(4),
    receivingTD int(2),
    fumbles int(2),
    interceptions int(2),
	CONSTRAINT offensive_skillplayer_id
		FOREIGN KEY (playerId)
        REFERENCES players(playerId)
);

DROP TABLE IF EXISTS footballDefensivePlayerStats;
CREATE TABLE footballDefensivePlayerStats
(
	playerId varchar(20) PRIMARY KEY,
    approximateValue int(2),
    totalTackles int(3),
    assistedTackles int(3),
    sacks int(2),
    passedDefended int(2),
    interceptions int(2),
    forcedFumbles int(2),
    fumblesRecovered int(2),
    defensiveTD int(1),
	CONSTRAINT defensive_player_id
		FOREIGN KEY (playerId)
        REFERENCES players(playerId)
);

DROP TABLE IF EXISTS footballOffensiveLineStats;
CREATE TABLE footballOffensiveLineStats
(
	playerId varchar(20) PRIMARY KEY,
	approximateValue int(2),
    sacksAllowed int(2),
    qbHits int(2),
    qbHurries int(2),
    penaltiesCommitted int(2),
    penaltiesAccepted int(2),
	CONSTRAINT offensive_lineman_id
		FOREIGN KEY (playerId)
        REFERENCES players(playerId)
);

DROP TABLE IF EXISTS basketballPlayerStats;
CREATE TABLE basketballPlayerStats
(
    playerId varchar(20) PRIMARY KEY,
    gamesPlayed int(2),
    playerEfficiencyRating DECIMAL(3,1),
    pointsPerGame DECIMAL(3,1),
    reboundsPerGame DECIMAL(3,1),
    assistsPerGame DECIMAL(3,1),
    stealsPerGame DECIMAL(3,1),
    blocksPerGame DECIMAL(3,1),
    fieldGoalPercentage DECIMAL (4,3),
    trueShootingPercentage DECIMAL(4,3),
    usagePercentage DECIMAL(3,1),
    valueOverReplacementPlayer DECIMAL(2,1),
	CONSTRAINT basketball_player_id
		FOREIGN KEY (playerId)
        REFERENCES players(playerId)
);

DROP TABLE IF EXISTS baseballHitterStats;
CREATE TABLE baseballHitterStats
(
	playerId varchar(20) PRIMARY KEY,
    atBats int(3),
    runsScored int(3),
    hits int(3),
    doubles int(2),
    triples int(2),
    homeruns int(2),
    runsBattedIn int(3),
    stolenBases int(3),
    caughtStealing int(3),
    walksDrawn int(3),
    strikeouts int(3),
    battingAverage DECIMAL(4,3),
    onBasePercentage DECIMAL(4,3),
    sluggingPercentage DECIMAL(4,3),
    onBasePlusSlugging DECIMAL(4,3),
    winsAboveReplacement DECIMAL(3,1),
	CONSTRAINT hitter_id
		FOREIGN KEY (playerId)
        REFERENCES players(playerId)
);

DROP TABLE IF EXISTS baseballPitcherStats;
CREATE TABLE baseballPitcherStats
(
	playerId varchar(20) PRIMARY KEY,
	gamesPitched int(2),
    gamesStarted int(2),
    inningsPitched DECIMAL(4,1),
    hitsAllowed int(3),
    runsGivenUp int(3),
    earnedRuns int(3),
    walksAllowed int(3),
    strikeouts int(3),
    wins int(2),
    losses int(2),
    saves int(2),
    blownSaves int(2),
    walksPlusHitsAllowedPerInningsPitched DECIMAL(3,2),
    earnedRunAverage DECIMAL(3,2),
    winsAboveReplacement DECIMAL(3,1),
	CONSTRAINT pitcher_id
		FOREIGN KEY (playerId)
        REFERENCES players(playerId)
);