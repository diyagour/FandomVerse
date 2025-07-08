# FandomVerse
TV Show Character Interaction &amp; Fan Analytics using MySQL
# 🎬 FandomVerse – TV Show Character Interaction & Fan Popularity Tracker

A SQL-based analytics project that simulates fan engagement, screen time, and character interactions across fictional TV shows.

## 📂 Project Structure
- `schema/` – SQL table creation scripts
- `data/` – Dummy data insert statements
- `queries/` – 10+ advanced SQL queries
- `dashboard/` – Optional Python/Excel dashboards

## 🧠 Features
- Analyze most loved characters based on votes
- Detect underrated MVPs using screen time vs votes
- Track character interactions per episode
- Rank characters by votes and performance

## 🔧 Built With
- MySQL
- MySQL Workbench / DBeaver
- (Optional) Python (Pandas + Seaborn/Plotly)
- (Optional) Excel for dashboarding

## 📊 Sample Query Output
```sql
SELECT name, SUM(vote_count) AS total_votes
FROM fan_votes
GROUP BY character_id
ORDER BY total_votes DESC;
