-- Total movies
SELECT COUNT(*) FROM movies;

-- Total ratings
SELECT COUNT(*) FROM ratings;

-- Average rating overall
SELECT AVG(rating) FROM ratings;

# Movie Performance
-- Top 10 highest rated movies (min 50 ratings)
SELECT m.title,
    AVG(r.rating) AS avg_rating,
    COUNT(r.rating) AS total_ratings
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY m.title
HAVING COUNT(r.rating) >= 50
ORDER BY avg_rating DESC
LIMIT 10;

# Popularity Analysis
-- Most rated movies
SELECT m.title,
    COUNT(r.rating) AS rating_count
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY m.title
ORDER BY rating_count DESC
LIMIT 10;

# Genre Analysis
-- Genre-wise average rating
SELECT genre,
    AVG(r.rating) AS avg_rating
FROM ratings r
JOIN movies m 
    ON r.movieId = m.movieId
GROUP BY genre
ORDER BY avg_rating DESC;


