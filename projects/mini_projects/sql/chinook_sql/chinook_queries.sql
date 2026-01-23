
/*
  Chinook SQL Mini-Project (SQLite)
  Author: <YOUR NAME>

  Patterns covered:
  - Subqueries
  - Aggregation + GROUP BY
  - JOIN / LEFT JOIN
  - Self-join (employee hierarchy)
  - Anti-join (missing related records)
  - UNION
  - Data-quality check
*/

-- =========================================================
-- 1) Tracks for the album "Californication" (subquery)
-- =========================================================
SELECT
  t.TrackId,
  t.Name AS TrackName
FROM Tracks t
WHERE t.AlbumId IN (
  SELECT a.AlbumId
  FROM Albums a
  WHERE a.Title = 'Californication'
)
ORDER BY t.TrackId;

-- =========================================================
-- 2) Invoice count per customer + customer details
-- =========================================================
SELECT
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS FullName,
  c.City,
  c.Email,
  COUNT(i.InvoiceId) AS TotalInvoices
FROM Customers c
JOIN Invoices i
  ON i.CustomerId = c.CustomerId
GROUP BY
  c.CustomerId,
  c.FirstName,
  c.LastName,
  c.City,
  c.Email
ORDER BY TotalInvoices DESC, c.LastName, c.FirstName;

-- =========================================================
-- 3) Track name + album title + artist ID + track ID (all albums)
-- =========================================================
SELECT
  t.Name  AS TrackName,
  a.Title AS Album,
  a.ArtistId AS ArtistID,
  t.TrackId AS TrackID
FROM Albums a
LEFT JOIN Tracks t
  ON t.AlbumId = a.AlbumId
ORDER BY a.Title, t.TrackId;

-- =========================================================
-- 4) Manager last name + employee last name (self-join reports)
-- =========================================================
SELECT
  m.LastName AS ManagerLastName,
  e.LastName AS EmployeeLastName
FROM Employees m
JOIN Employees e
  ON e.ReportsTo = m.EmployeeId
ORDER BY m.LastName, e.LastName;

-- =========================================================
-- 5) Artists with no albums (anti-join)
-- =========================================================
SELECT
  ar.ArtistId,
  ar.Name
FROM Artists ar
LEFT JOIN Albums al
  ON al.ArtistId = ar.ArtistId
WHERE al.AlbumId IS NULL
ORDER BY ar.Name;

-- =========================================================
-- 6) Customer + employee names using UNION (deduplicated)
-- =========================================================
SELECT FirstName, LastName
FROM Customers
UNION
SELECT FirstName, LastName
FROM Employees
ORDER BY LastName DESC, FirstName DESC;

-- =========================================================
-- 7) Data check: customer city differs from invoice billing city
-- =========================================================
SELECT DISTINCT
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS FullName,
  c.City AS CustomerCity,
  i.BillingCity
FROM Customers c
JOIN Invoices i
  ON i.CustomerId = c.CustomerId
WHERE c.City IS NOT NULL
  AND i.BillingCity IS NOT NULL
  AND c.City <> i.BillingCity
ORDER BY c.LastName, c.FirstName, i.BillingCity;

-- =========================================================
-- 8) Customer full name + address + CITY+COUNTRY in UPPERCASE
--    (e.g., LOS ANGELES USA)
-- =========================================================
SELECT
  CustomerId,
  FirstName || ' ' || LastName AS FullName,
  Address,
  UPPER(City || ' ' || Country) AS Location
FROM Customers
ORDER BY CustomerId;

-- =========================================================
-- 9) Employee user id: first 4 of first + first 2 of last (lowercase)
--    Show each step (First4, Last2, final NewEmployeeID)
-- =========================================================
SELECT
  FirstName,
  LastName,
  LOWER(SUBSTR(FirstName, 1, 4)) AS First4,
  LOWER(SUBSTR(LastName,  1, 2)) AS Last2,
  LOWER(SUBSTR(FirstName, 1, 4)) || LOWER(SUBSTR(LastName, 1, 2)) AS NewEmployeeID
FROM Employees
ORDER BY LastName, FirstName;

-- =========================================================
-- 10) Employees with 15+ years at company (uses current date)
--     SQLite-friendly: compute years via julianday difference
-- =========================================================
SELECT
  FirstName,
  LastName,
  HireDate,
  CAST((julianday('now') - julianday(HireDate)) / 365.25 AS INT) AS YearsWithCompany
FROM Employees
WHERE ((julianday('now') - julianday(HireDate)) / 365.25) >= 15
ORDER BY LastName ASC;

-- =========================================================
-- 11) Profiling Customers table: row count + distinct companies
--     + NULL checks for common nullable columns
-- =========================================================
SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT Company) AS distinct_company_count,

  SUM(CASE WHEN Company     IS NULL THEN 1 ELSE 0 END) AS null_company,
  SUM(CASE WHEN Address     IS NULL THEN 1 ELSE 0 END) AS null_address,
  SUM(CASE WHEN PostalCode  IS NULL THEN 1 ELSE 0 END) AS null_postalcode,
  SUM(CASE WHEN Phone       IS NULL THEN 1 ELSE 0 END) AS null_phone,
  SUM(CASE WHEN Fax         IS NULL THEN 1 ELSE 0 END) AS null_fax
FROM Customers;

-- =========================================================
-- 12) Cities with the most customers + rank (descending)
-- =========================================================
SELECT
  City,
  COUNT(*) AS CustomerCount,
  DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS CityRank
FROM Customers
GROUP BY City
ORDER BY CustomerCount DESC, City ASC;

-- =========================================================
-- 13) New customer invoice id = InvoiceId + FirstName + LastName
--     Ordered by FirstName, LastName, InvoiceId (as requested)
-- =========================================================
SELECT
  c.FirstName,
  c.LastName,
  i.InvoiceId,
  (c.FirstName || c.LastName || i.InvoiceId) AS NewInvoiceID
FROM Customers c
JOIN Invoices i
  ON i.CustomerId = c.CustomerId
ORDER BY c.FirstName ASC, c.LastName ASC, i.InvoiceId ASC;