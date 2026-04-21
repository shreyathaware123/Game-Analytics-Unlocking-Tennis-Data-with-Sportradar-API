-- Created database 
Create Database game_analytics;

-- choose database to work
Use game_analytics;

# categories
CREATE TABLE categories (
    category_id VARCHAR(50) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Retrieving data 
Select * from categories;

-- rows and columns
Select count(*) from categories;
 
# competition
CREATE TABLE competitions (
    competition_id VARCHAR(50) PRIMARY KEY,
    competition_name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    category_id VARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Retrieving data 
Select * from competitions;

-- rows and columns
Select count(*) from competitions;

# complexes
CREATE TABLE complexes (
    complex_id VARCHAR(50) PRIMARY KEY,
    complex_name VARCHAR(100) NOT NULL
);

-- Retrieving data 
Select * from complexes;

-- rows and columns
Select count(*) from complexes;

# venues
CREATE TABLE venues (
    venue_id VARCHAR(50) PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    country_name VARCHAR(100) NOT NULL,
    country_code CHAR(3) NOT NULL,
    timezone VARCHAR(100) NOT NULL,
    complex_id VARCHAR(50),
    FOREIGN KEY (complex_id) REFERENCES complexes(complex_id)
);

-- Retrieving data 
Select * from venues;

-- rows and columns
Select count(*) from venues;

-- -- Data mismatch due to foreign key constraint, so clearing and re-importing venues table 

-- Clear existing data
DELETE FROM venues;

-- Disable  foreign key 
SET FOREIGN_KEY_CHECKS = 0;

-- verifying 
Select count(*) from venues;

# competitor
CREATE TABLE competitors (
    competitor_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    country_code CHAR(3) NOT NULL,
    abbreviation VARCHAR(10) NOT NULL
);

-- Retrieving data 
Select * from competitors;

-- rows and columns
Select count(*) from competitors;

# ranking
CREATE TABLE rankings (
    rank_id INT AUTO_INCREMENT PRIMARY KEY,
    `rank` INT NOT NULL,
    movement INT NOT NULL,
    points INT NOT NULL,
    competitions_played INT NOT NULL,
    competitor_id VARCHAR(50),
    FOREIGN KEY (competitor_id) REFERENCES competitors(competitor_id)
);

-- Retrieving data 
Select * from rankings;

-- rows and columns
Select count(*) from rankings;