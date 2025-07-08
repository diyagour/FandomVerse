# 🎬 FandomVerse – TV Show Character Interaction & Fan Popularity Tracker

FandomVerse is a **SQL-based analytics project** that tracks fan engagement, screen time, and character data from shows like *Game of Thrones* and *Stranger Things*.

---

## 📁 Folders

```
FandomVerse/
├── schema/       → Table creation SQL
├── data/         → Dummy data inserts
├── queries/      → Advanced queries
```

---

## 🔥 Features

- Most loved characters by votes
- Underrated MVPs (low screen time, high votes)
- Screen time leaderboard
- Vote-per-minute efficiency ranks

---

## 🛠 Built Using

- ✅ MySQL
- ✅ MySQL Workbench or DBeaver
- 🧪 Optional: Python + Pandas
- 📊 Optional: Excel dashboards

---

## ✅ How to Run

1. Run `schema/create_tables.sql`
2. Run `data/insert_dummy_data.sql`
3. Run `queries/advanced_queries.sql`

---

## 🧪 Sample Query

```sql
SELECT name, SUM(vote_count) AS total_votes
FROM fan_votes
JOIN characters USING(character_id)
GROUP BY character_id
ORDER BY total_votes DESC;
```

---

## 💡 Output Preview

| Character     | Total Votes |
|---------------|-------------|
| Eleven        | 420         |
| Arya Stark    | 350         |
| Jon Snow      | 275         |

---

## 🎯 Best For

- SQL portfolio
- Job/Internship showcase
- Data analytics practice

---

## ⚠️ Note

FandomVerse is a **fictional** project built for educational purposes.
