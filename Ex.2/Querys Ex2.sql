SELECT CI.name AS city, SUM(OI.quantity) AS total_drinks_sold
FROM OrderItem OI
JOIN Product P ON OI.product_id = P.product_id
JOIN OrderTable O ON OI.order_id = O.order_id
JOIN Client C ON O.client_id = C.client_id
JOIN City CI ON C.city_id = CI.city_id
WHERE P.type = 'drink'
  AND CI.name = 'Barcelona'
GROUP BY CI.name;

SELECT E.first_name, E.last_name, COUNT(*) AS total_orders_delivered
FROM Delivery D
JOIN Employee E ON D.employee_id = E.employee_id
WHERE E.employee_id = 3
GROUP BY E.first_name, E.last_name;

