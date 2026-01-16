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

### Option A: SQLite CLI
1. Download the Chinook SQLite database file (often named `Chinook_Sqlite.sqlite`).
2. In your terminal:

```bash
sqlite3 Chinook_Sqlite.sqlite
.read chinook_queries.sql
```
