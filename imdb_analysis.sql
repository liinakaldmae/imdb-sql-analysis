--- Creating tables from the IMDb Data Files

CREATE VIEW title_akas AS
         SELECT *
         FROM read_csv(
             '/Users/liinakaldmae/Downloads/title.akas.tsv',
             delim = '\t',
             header = true,
             auto_detect = true
         );


CREATE VIEW title_basics AS
         SELECT *
         FROM read_csv(
             '/Users/liinakaldmae/Downloads/title.basics.tsv',
             delim = '\t',
             header = true,
             auto_detect = true
         );


CREATE VIEW title_principals AS
         SELECT *
         FROM read_csv(
             '/Users/liinakaldmae/Downloads/title.principals.tsv',
             delim = '\t',
             header = true,
             auto_detect = true
         );


CREATE VIEW name_basics AS
         SELECT *
         FROM read_csv(
             '/Users/liinakaldmae/Downloads/name.basics.tsv',
             delim = '\t',
             header = true,
             auto_detect = true
         );

CREATE VIEW title_ratings AS
         SELECT *
         FROM read_csv(
             '/Users/liinakaldmae/Downloads/title.ratings.tsv',
             delim = '\t',
             header = true,
             auto_detect = true


--- Getting a list of movies that have at least 50 000 votes.
select distinct 
    title, 
    titleId, 
    averageRating,
    numVotes
FROM title_akas title 
INNER JOIN title_ratings ratings ON title.titleID=ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=title.titleID
WHERE ratings.numVotes > 50000
AND title.isOriginalTitle=1
AND basics.titleType='movie';

--- Adding all the DIRECTORS of these movies
select distinct 
    title, 
    titleId, 
    averageRating, 
    numVotes, 
    category, 
    job, 
    primaryName
FROM title_akas title 
INNER JOIN title_ratings ratings ON title.titleID=ratings.tconst 
INNER JOIN title_principals p on title.titleID=p.tconst 
INNER JOIN name_basics n ON n.nconst=p.nconst  
INNER JOIN title_basics basics ON basics.tconst=title.titleID
WHERE ratings.numVotes > 50000
AND isOriginalTitle=1 
AND category='director'
AND title.isOriginalTitle=1
AND basics.titleType='movie'
ORDER BY numVotes desc;

--- Getting a list of DIRECTORS that have at least 5 movies connected to them with over 50 000 votes
select distinct 
    n.primaryName,
    COUNT(p.tconst) as TitleCount
FROM name_basics n
INNER JOIN title_principals p ON n.nconst=p.nconst 
INNER JOIN title_ratings ratings ON p.tconst=ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category='director'
AND basics.titleType='movie'
GROUP BY 1
HAVING TitleCount >= 5;


-- Getting the DIRECTORS with all time top number of movies made
select distinct 
    n.primaryName,
    n.birthYear,
    n.deathYear,
    COUNT(p.tconst) as TitleCount
FROM name_basics n
INNER JOIN title_principals p ON n.nconst=p.nconst 
INNER JOIN title_ratings ratings ON p.tconst=ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category='director'
AND basics.titleType='movie'
GROUP BY 1,2,3
ORDER BY TitleCount desc;


--- Getting the DIRECTORS with the highest average rating for their movies
SELECT
    n.primaryName,
    n.birthYear,
    n.deathYear,
    COUNT(p.tconst) AS TitleCount,
    ROUND(AVG(ratings.averageRating),2) AS AvgRating
FROM name_basics n
INNER JOIN title_principals p ON n.nconst = p.nconst
INNER JOIN title_ratings ratings ON p.tconst = ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category = 'director'
AND basics.titleType='movie'
GROUP BY 1,2,3
HAVING TitleCount >= 5
ORDER BY AvgRating DESC;

-- Getting the ACTRESSES with all time top number of movies acted in
select distinct 
    n.primaryName,
    n.birthYear,
    n.deathYear,
    COUNT(p.tconst) as TitleCount
FROM name_basics n
INNER JOIN title_principals p ON n.nconst=p.nconst 
INNER JOIN title_ratings ratings ON p.tconst=ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category='actress'
AND basics.titleType='movie'
GROUP BY 1,2,3
ORDER BY TitleCount desc;

--- Getting the ACTRESSES with the highest average rating for their movies
SELECT
    n.primaryName,
    n.birthYear,
    n.deathYear,
    COUNT(p.tconst) AS TitleCount,
    ROUND(AVG(ratings.averageRating),2) AS AvgRating
FROM name_basics n
INNER JOIN title_principals p ON n.nconst = p.nconst
INNER JOIN title_ratings ratings ON p.tconst = ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category = 'actress'
AND basics.titleType='movie'
GROUP BY 1,2,3
HAVING TitleCount >= 5
ORDER BY AvgRating DESC;

-- Getting the ACTORS with all time top number of movies acted in
select distinct 
    n.primaryName,
    n.birthYear,
    n.deathYear,
    COUNT(p.tconst) as TitleCount
FROM name_basics n
INNER JOIN title_principals p ON n.nconst=p.nconst 
INNER JOIN title_ratings ratings ON p.tconst=ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category='actor'
AND basics.titleType='movie'
GROUP BY 1,2,3
ORDER BY TitleCount desc;

--- Getting the ACTORS with the highest average rating for their movies
SELECT
    n.primaryName,
    n.birthYear,
    n.deathYear,
    COUNT(p.tconst) AS TitleCount,
    ROUND(AVG(ratings.averageRating),2) AS AvgRating
FROM name_basics n
INNER JOIN title_principals p ON n.nconst = p.nconst
INNER JOIN title_ratings ratings ON p.tconst = ratings.tconst
INNER JOIN title_basics basics ON basics.tconst=p.tconst
WHERE ratings.numVotes > 50000
AND p.category = 'actor'
AND basics.titleType='movie'
GROUP BY 1,2,3
HAVING TitleCount >= 5
ORDER BY AvgRating DESC;


