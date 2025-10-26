Create Database Ecommerce_db
Use  Ecommerce_db
select * from customers
where city = 'Delhi'

select * from products
order by price desc

select category , sum(price)  as TotalCategoryvalue from products
group by category

--customers and their orders 
SELECT A.CustomerName, B.OrderID, B.OrderDate
FROM Customers as A
INNER JOIN Orders as  B ON A.CustomerID = B.CustomerID

--Customers who have not placed any orders
SELECT A.CustomerName
FROM Customers as A
LEFT JOIN Orders as B  on  A.CustomerID = B.CustomerID
WHERE B.OrderID IS NULL

--Full Sales Data

SELECT A.CustomerName, D.ProductName, C.Quantity, (D.Price * C.Quantity) AS TotalAmount, B.OrderDate
FROM Customers as  A
JOIN Orders as  B on  A.CustomerID = B.CustomerID
JOIN OrderDetails as C on  B.OrderID = C.OrderID
JOIN Products D ON C.ProductID = D.ProductID

-- Top 5 products by quantity sold
SELECT TOP 5 A.ProductName, SUM(B.Quantity) AS TotalSold
FROM Products as A
JOIN OrderDetails as B  on  A.ProductID = B.ProductID
GROUP BY A.ProductName
ORDER BY TotalSold DESC

--Total Sales by City

SELECT A.City, SUM(D.Price * C.Quantity) AS TotalSales
FROM Customers as A
JOIN Orders as B on  A.CustomerID = B.CustomerID
JOIN OrderDetails as C  on  B.OrderID = C.OrderID
JOIN Products as D  on  C.ProductID = D.ProductID
GROUP BY A.City
ORDER BY TotalSales DESC

--Top 3 customers by Purchase value

SELECT TOP 3 A.CustomerName, SUM(D.Price * C.Quantity) AS TotalSpent
FROM Customers  as A
JOIN Orders as B  on  A.CustomerID = B.CustomerID
JOIN OrderDetails  as C on  B.OrderID = C.OrderID
JOIN Products as D  on C.ProductID = D.ProductID
GROUP BY A.CustomerName
ORDER BY TotalSpent DESC

--view 

CREATE VIEW SalesSummary AS
SELECT A.CustomerName, D.ProductName, C.Quantity, (D.Price * C.Quantity) AS TotalAmount, B.OrderDate
FROM Customers  as A 
JOIN Orders as B  on  A.CustomerID = B.CustomerID
JOIN OrderDetails as C  on B.OrderID = C.OrderID
JOIN Products as D  on  C.ProductID = D.ProductID

--You can then view it easily:

SELECT * FROM SalesSummary


-- index 
CREATE INDEX idx_orderdate ON Orders(OrderDate)

SELECT * FROM Orders WHERE OrderDate BETWEEN '2025-01-01' AND '2025-06-30'