
# 🧾 Level 1 Database Projects – Òptica & Pizzeria

## 📄 Description – Exercise Statement

This level includes two database modeling exercises:

### 🕶️ Exercise 1 – Òptica "Cul d'Ampolla"

The goal is to design a database for managing clients, eyewear products, providers, and sales operations of an optician's store. The system stores data about glasses (frame type, colors, lens prescription, price), their providers, clients (with optional referrer), and which employee made each sale.

It also supports queries such as:
- Total invoices for a client in a given period.
- Glasses models sold by an employee in a year.
- Providers of successfully sold glasses.

### 🍕 Exercise 2 – Pizzeria

Design a database to support an online food ordering system for a pizzeria. It manages clients, orders, products (pizzas, burgers, drinks), and the employees and stores that fulfill orders. It also tracks:
- Product categories (especially for pizzas).
- Whether orders are for delivery or pickup.
- Which delivery person delivered the order and when.

It supports queries such as:
- Count of drinks sold in a specific town.
- Number of orders managed by a specific employee.

## 💻 Technologies Used

- **MySQL 8.0+**
- **SQL** (DDL and DML)
- Relational modeling principles
- SQL client tools (e.g., MySQL Workbench, DBeaver)

## 📋 Requirements

- MySQL Server (version 8.0 or higher)
- SQL editor or client tool
- User access with permission to create schemas and tables
- Optional: ER diagram tool for visualization

## 🛠️ Installation

1. Create a new database:
   ```sql
   CREATE DATABASE level1_projects;
   USE level1_projects;
   ```
2. Run the SQL scripts for each project (optica and pizzeria), or copy-paste the code into your SQL interface.

## ▶️ Execution

Example queries after data population:

- **Optica:**
  ```sql
  SELECT * FROM Glasses WHERE employee_id = 3 AND YEAR(sale_date) = 2023;
  SELECT DISTINCT provider_id FROM Glasses WHERE sold = TRUE;
  ```

- **Pizzeria:**
  ```sql
  SELECT COUNT(*) FROM Order_Products op
  JOIN Products p ON op.product_id = p.id
  JOIN Categories c ON p.category_id = c.id
  JOIN Orders o ON op.order_id = o.id
  JOIN Clients cl ON o.client_id = cl.id
  WHERE c.name = 'Drinks' AND cl.town_id = 5;

  SELECT COUNT(*) FROM Orders WHERE employee_id = 7;
  ```

## 🌐 Deployment

These projects are for educational use. For production readiness:
- Normalize all fields and use foreign keys.
- Index key columns for performance.
- Implement security at the application layer.
- Consider using a cloud database (e.g., AWS, Google Cloud SQL) for real deployment.
