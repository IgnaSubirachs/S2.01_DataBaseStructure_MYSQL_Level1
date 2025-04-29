SELECT COUNT(*) AS total_invoices
FROM Sale
WHERE client_id = 1
  AND sale_date BETWEEN '2024-04-01' AND '2024-05-31';

SELECT DISTINCT G.brand
FROM Sale S
JOIN Glasses G ON S.glasses_id = G.glasses_id
WHERE S.employee_id = 1
  AND YEAR(S.sale_date) = 2024;

SELECT DISTINCT SU.name AS supplier
FROM Sale S
JOIN Glasses G ON S.glasses_id = G.glasses_id
JOIN Supplier SU ON G.supplier_id = SU.supplier_id;


