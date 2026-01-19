# Chinook SQL Mini-Project

This mini-project uses the **Chinook** sample database (SQLite) to practice and demonstrate core SQL skills on a realistic relational schema (music store data: customers, invoices, employees, tracks, albums, artists).

## What’s inside

- `chinook_queries.sql` — 7 SQL queries demonstrating common patterns

## Skills demonstrated

- Subqueries (`IN`, scalar subquery)
- Aggregations with `COUNT()` + `GROUP BY`
- `JOIN` and `LEFT JOIN`
- Self-join for manager → employee reporting relationships
- Anti-join pattern (`LEFT JOIN ... IS NULL`) to find missing related records
- `UNION` set operation
- Basic data-quality check (customer city vs billing city)

## Queries included

1. List tracks from a specific album (“Californication”) using a subquery  
2. Count total invoices per customer with customer details  
3. List tracks with album + artist ID (including albums with no tracks)  
4. Manager last name + employee last name for direct reports (self-join)  
5. Artists who do not have albums (anti-join)  
6. Combined list of customer + employee names using `UNION`  
7. Customers whose city differs from invoice billing city (data check)

## How to run

## Database

This project uses the **Chinook** sample database.

- Source repository: https://github.com/lerocha/chinook-database  
- SQLite database file (download from the repo): `ChinookDatabase/DataSources/Chinook_Sqlite.sqlite`

### Option A: SQLite CLI
1. Download `Chinook_Sqlite.sqlite` from the Chinook repo above.
2. Place it next to `chinook_queries.sql` (or keep it elsewhere—just update the path when opening SQLite).
3. In your terminal:

```bash
sqlite3 Chinook_Sqlite.sqlite
.read chinook_queries.sql
```
### Option B: DB Browser for SQLite / DBeaver

1. Open the Chinook SQLite database file
2. Open chinook_queries.sql
3. Run queries (all at once or one section at a time)

## Notes

This project is written for SQLite.

SQLite string concatenation uses: FirstName || ' ' || LastName
(In some databases you’d use CONCAT(FirstName, ' ', LastName).)

### Sample Outputs
<img width="1454" height="1224" alt="image" src="https://github.com/user-attachments/assets/064f1233-dba4-4ebc-906f-2c6e08347373" />

<img width="1393" height="1148" alt="image" src="https://github.com/user-attachments/assets/140adcec-b4e7-4229-899f-83744d91fd61" />
