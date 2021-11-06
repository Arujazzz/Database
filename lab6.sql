-- 1a
SELECT *
FROM dealer d
JOIN client c ON d.id = c.dealer_id;

-- 1b
SELECT d, c.name, c.city, c.priority, s.id, s.date, s.amount
FROM dealer d
LEFT JOIN client c ON d.id = c.dealer_id
LEFT JOIN sell s ON c.id = s.client_id
WHERE  c.name IS NOT NULL AND
       c.city IS NOT NULL AND
       c.priority IS NOT NULL AND
       s.id IS NOT NULL AND
       s.date IS NOT NULL AND
       s.amount IS NOT NULL;

-- 1c
SELECT d, c
FROM dealer d
INNER JOIN client c ON c.city = d.location;

-- 1d
SELECT s.id, s.amount, c.name, c.city
FROM sell s
INNER JOIN client c ON s.client_id = c.id
WHERE s.amount >= 100 AND s.amount <= 500;

-- 1e
SELECT *
FROM dealer d
LEFT JOIN client c ON d.location = c.city;

--1f
SELECT c.name, c.city, d.name, d.charge
FROM client c
JOIN dealer d ON c.dealer_id = d.id;

-- 1g
SELECT c.name, c.city, d
FROM  client c
JOIN dealer d ON dealer_id = d.id
WHERE d.charge > 0.12;

-- 1h
SELECT c.name, c.city, s.id, s.date, s.amount, d.name,d.charge
FROM client c
JOIN dealer d ON c.dealer_id = d.id
JOIN sell s ON c.id = s.client_id;

-- 1i
SELECT c.name, c.priority,d.name, s.id, s.amount
FROM dealer d
LEFT JOIN client c ON d.id = c.dealer_id
LEFT JOIN sell s ON c.id = s.client_id
WHERE s.amount >= 2000 AND c.priority IS NOT NULL;

-- 2a
CREATE VIEW a2 AS
SELECT s.date, COUNT(DISTINCT s.client_id), AVG(s.amount), SUM(s.amount)
FROM sell s
GROUP BY s.date;

-- 2b
CREATE VIEW b2 AS
SELECT s.date, s.amount
FROM sell s
ORDER BY s.amount DESC
LIMIT 5;

-- 2c
CREATE VIEW c2 AS
SELECT  d, COUNT(s.amount), AVG(s.amount), SUM(s.amount)
FROM sell s
JOIN dealer d ON d.id = s.dealer_id
GROUP BY d;

-- 2d
CREATE VIEW d2 AS
SELECT d, SUM(amount * d.charge)
FROM sell s
JOIN dealer d ON d.id = s.dealer_id
GROUP BY d;

--2e
CREATE VIEW e2 AS
SELECT d.location, COUNT(s.amount), AVG(s.amount), SUM(s.amount)
FROM dealer d
JOIN sell s ON d.id = s.dealer_id
GROUP BY d.location;

--2f
CREATE VIEW f2 AS
SELECT c.city, COUNT(s.amount), AVG(s.amount * (d.charge + 1)), SUM(s.amount * (d.charge + 1))
FROM client c
JOIN dealer d ON c.dealer_id = d.id
JOIN sell s ON c.id = s.client_id
GROUP BY c.city;

--2g
CREATE VIEW g2 AS
SELECT c.city, SUM(s.amount * (d.charge + 1)) AS totalexpense, SUM(s.amount) AS totalamount
FROM client c
JOIN sell s ON c.id = s.client_id
JOIN dealer d ON s.dealer_id = d.id and c.city = d.location
GROUP BY c.city;
