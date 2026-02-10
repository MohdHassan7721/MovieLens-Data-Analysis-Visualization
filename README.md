# MovieLens-Data-Analysis-Visualization.

# Description:

This project analyzes MovieLens user rating data using Python, SQL, Excel, and Power BI to generate insights on movie popularity, genre trends, and audience behavior.

## 1. Project Overview:
Project Title: MovieLens Data Analysis & Visualization
Tools & Technologies: Python, Excel, SQL, Power BI
Domain:  Recommendation Analytics
This project focuses on analyzing user movie ratings to extract meaningful insights such as genre performance, user engagement, rating trends, and popularity metrics. The workflow covers the complete data analytics lifecycle — data cleaning, transformation, querying, visualization, and business insight generation.

## 2. Objectives
 •	Analyze movie rating patterns
 •	Identify top performing genres
 •	Measure movie popularity
 •	Track rating trends over years
 •	Build an interactive Power BI dashboard
 •	Create a reusable analytics dataset

## 3. Dataset Description
 Source: MovieLens Dataset
 Files Used:
 •	movies.csv
 •	ratings.csv
## Movies Table
 •	movieId
 •	title
 •	genres
 •	year (extracted)
## Ratings Table
 •	userId
 •	movieId
 •	rating
 •	timestamp.

 # 4. Python Data Cleaning & Processing
## 4.1 Import Libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
## 4.2 Load Data
movies = pd.read_csv("movies.csv")
ratings = pd.read_csv("ratings.csv")
## 4.3 Extract Release Year
movies['year'] = movies['title'].str.extract(r'\((\d{4})\)')
movies['year'] = movies['year'].astype(float)
## 4.4 Merge Datasets
data = pd.merge(ratings, movies, on='movieId')
4.5 Handle Missing Values
data.dropna(inplace=True)
4.6 Create Popularity Score
popularity = data.groupby('title').agg(
    avg_rating=('rating','mean'),
    total_ratings=('rating','count')
).reset_index()

popularity['popularity_score'] = (
    popularity['avg_rating'] * popularity['total_ratings']
)

# 5. Python Visualizations
## 5.1 Rating Distribution
plt.figure(figsize=(8,5))
data['rating'].hist()
plt.title("Rating Distribution")
plt.show()
## 5.2 Top Rated Movies
top_movies = popularity.sort_values(
    by='popularity_score',
    ascending=False
).head(10)
## 5.3 Genre Analysis
genre_split = data.assign(
    genre=data['genres'].str.split('|')
).explode('genre')

genre_rating = genre_split.groupby('genre')['rating'].mean()

# 6. Excel Data Cleaning
## 6.1 Merge Ratings & Movies
Formula (VLOOKUP):
=VLOOKUP(A2,Movies!A:D,2,FALSE)
Used to fetch movie titles into ratings sheet.
## 6.2 Extract Year
=MID(B2,FIND("(",B2)+1,4)
## 6.3 Total Ratings Per Movie
=COUNTIF(MovieID_Column,A2)
## 6.4 Average Rating
=AVERAGEIF(MovieID_Column,A2,Rating_Column)
## 6.5 Popularity Score
=Avg_Rating * Total_Ratings

# 7. SQL Data Analysis
## 7.1 Create Tables
CREATE TABLE movies (
  movieId INT,
  title VARCHAR(255),
  genres VARCHAR(255),
  year INT
);

CREATE TABLE ratings (
  userId INT,
  movieId INT,
  rating FLOAT,
  timestamp BIGINT
);
## 7.2 Total Movies
SELECT COUNT(DISTINCT movieId) AS total_movies
FROM movies;
## 7.3 Average Rating
SELECT AVG(rating) AS avg_rating
FROM ratings;
## 7.4 Top 10 Movies
SELECT m.title,
       AVG(r.rating) AS avg_rating,
       COUNT(r.rating) AS total_ratings
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY m.title
ORDER BY total_ratings DESC
LIMIT 10;
## 7.5 Genre Wise Ratings
SELECT genres,
       AVG(r.rating) AS avg_rating
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
GROUP BY genres
ORDER BY avg_rating DESC;

# 8. Power BI Dashboard Development
## 8.1 Data Import
•	Open Power BI
•	Get Data → Excel
•	Load merged cleaned dataset
## 8.2 Data Modeling
•	Create relationship: movieId
•	Create measures:
Total Ratings = COUNT(rating)
Avg Rating = AVERAGE(rating)
Movies Count = DISTINCTCOUNT(movieId)
Popularity Score = [Avg Rating] * [Total Ratings]

# 9. Dashboard Visuals
KPI Cards
•	Movies Count
•	Avg Rating
•	Total Ratings
•	Popularity Score
Charts Used
•	Donut Chart → Rating Distribution
•	Bar Chart → Genre Performance
•	Line Chart → Avg Rating vs Year
•	Stacked Bar → Ratings by Genre

# 10. Key Insights
•	Drama & Thriller genres received highest engagement
•	Ratings peaked between 1995–2005 releases
•	Popularity strongly correlates with rating volume
•	Classic movies maintain high average ratings
_
# 11. Business Use Cases
•	Recommendation systems
•	Content acquisition strategy
•	Audience preference tracking
•	OTT platform analytics
# 
12. Project Architecture
Python → Data Cleaning → Excel Validation → SQL Querying → Power BI Visualization.

# Conclusion:

The MovieLens analysis project demonstrates an end‑to‑end analytics workflow — from raw data processing to executive dashboard reporting. It highlights technical proficiency in Python, SQL, Excel, and BI tools while delivering actionable entertainment industry insights.




