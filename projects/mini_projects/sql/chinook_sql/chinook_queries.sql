
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
