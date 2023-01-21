--1
SELECT TOP(10) c.quantity,p.title, c.price,p.price
FROM Sale c RIGHT JOIN Product p
ON c.id = p.id_category 
WHERE c.quantity > 5
ORDER BY c.price DESC
--2
SELECT TOP(10) c.quantity, p.title, AVG(c.price + p.price)
FROM Sale c RIGHT JOIN Product p
ON c.id = p.id_category 
WHERE c.quantity > 0
GROUP BY p.title,c.quantity
HAVING AVG(c.price + p.price) > 50

--3
SELECT TOP(100) c.quantity, p.title, AVG(c.price)
FROM Product p RIGHT JOIN Delivery c
ON c.id = p.id_category 
WHERE c.quantity > 0
GROUP BY p.title,c.quantity
HAVING AVG(c.price) > 100

--4
SELECT TOP(1) c.name, COUNT(*) AS IDK
FROM Product p RIGHT JOIN Category c
ON c.id = p.id_category 
GROUP BY p.id_category,c.name
ORDER BY IDK DESC

--5
SELECT TOP(10) c.name, p.quantity AS qua,p.price AS PR
FROM Delivery p INNER JOIN Supplier c
ON c.id = p.id_supplier 
ORDER BY PR ASC

--6
SELECT TOP(100)p.name,c.street, COUNT(*) AS IDK,prod.quantity,SUM(s.quantity * s.price)
FROM Producer p 
INNER JOIN Address c
ON c.id = p.id_address 
JOIN Product prod 
ON prod.id_producer = p.id
JOIN Sale s
ON prod.id = s.id_product
GROUP BY p.id_address,p.name,c.street,prod.quantity
HAVING SUM(s.quantity * s.price) BETWEEN 500 AND 2000
ORDER BY prod.quantity DESC


--7
SELECT TOP(1) c.name, COUNT(*) AS IDK
FROM Product p RIGHT JOIN Category c
ON c.id = p.id_category 
GROUP BY p.id_category,c.name
ORDER BY IDK ASC


--8
SELECT TOP(3) p.title,p.id,pr.id,pr.name,p.price,SUM(d.price * d.quantity)
FROM Product p 
JOIN Producer pr ON pr.id = p.id_producer
JOIN Delivery d ON p.id = d.id_product
WHERE pr.name LIKE 'BananaTeam' OR title LIKE 'JBL' OR title LIKE 'Redbull' 
GROUP BY p.title,p.id,pr.id,pr.name,p.price
HAVING SUM(d.price * d.quantity) > 400
ORDER BY p.price ASC
