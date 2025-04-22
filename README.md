[netflix_titles.csv](https://github.com/user-attachments/files/19854989/netflix_titles.csv)-----for database
# 📊 Netflix Content Analysis

This project focuses on analyzing Netflix's catalog using SQL. By exploring key attributes such as content type, genre, rating, and release years, this analysis uncovers insights about the content distribution on the platform.

## 🔍 Objective

The goal is to perform structured data analysis on the Netflix dataset using SQL queries to answer real-world business questions like:
- What is the distribution of Movies vs TV Shows?
- What are the most common genres on Netflix?
- What is the most common rating for Movies and TV Shows?
- How has the content changed over the years?

## 🧰 Tools & Technologies Used

- **SQL** (Structured Query Language)
- **PostgreSQL (for doing all this code and compling)
- **DB Browser for SQLite / MySQL Workbench / WAMP Server** *(based on your environment)*
- **Git & GitHub** for version control and project hosting

## 📁 Dataset

The dataset used is a publicly available Netflix dataset containing:
- `title`
- `type` (Movie or TV Show)
- `director`, `cast`
- `country`, `release_year`
- `rating`
- `duration`
- `listed_in` (genres)
- `description`

## 📌 Key SQL Queries

- Count of Movies vs TV Shows
- Most common content rating by type
- Genre-wise content distribution
- Yearly trend of content additions

## 📊 Sample Outputs

| Content Type | Count  |
|--------------|--------|
| Movie        | 5000+  |
| TV Show      | 2000+  |

| Genre        | Count  |
|--------------|--------|
| Drama        | 3000+  |
| Comedy       | 2500+  |

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/prajavkrish/NETFLIX.git



2. OR  install PostgreSQl and create a database 'NETFLIX';
3. create a table as netflix
4. right click in table and select import/export table and import the netflix.csv file i have given by excel.
5. after the process is finished and passed
6. click the netflix table and select pl/sql tool and write  the netflix code.
7. run and save the code
