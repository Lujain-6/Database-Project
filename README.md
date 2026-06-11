# Toy and Surprise Store Database Project 🧸🎁
### Introduction to Database Course Project | Computer Science & AI

This repository contains an end-to-end relational database design and implementation for a **Toy and Surprise Store**. The project covers the full database development lifecycle, including conceptual design (ER Diagram), logical schema mapping, table creation with strict integrity constraints, data population, and complex analytical SQL queries.

---

## 👥 Project Context & Team
* **Academic Institution:** Umm Al-Qura University
* **College:** College of Computing
* **Department:** Computer Science and Artificial Intelligence
* **Course:** Introduction to Database
* **Instructor:** Ms. Arwa Halawani

### Team Members & Responsibilities:
* **Lujain Bakkar (Leader):** ER Diagram Design, Relational Schema Mapping, Table Creation & Constraints, Data Insertion, Aggregate Functions, and Joint Queries.
* **Meral Alansari:** Scenario Description, Relational Schema Mapping, Table Creation & Constraints, Data Insertion, Alternative SQL Queries, and Joint Queries.
* **Reema Khalid:** Table Creation & Constraints, Data Insertion, Alternative SQL Queries, and Joint Queries.

---

## 📌 Business Scenario & Enterprise Rules
The system models a retail store that specializes in selling toys, custom surprise boxes, and event tickets. The operations are governed by the following key rules:
* **Customers & Orders:** Customers can place multiple orders. Each order can contain multiple items (Toys, Surprise Boxes, or Event Tickets).
* **Inventory Management:** The store tracks individual toys and surprise boxes, managing their stock levels, pricing, and category classifications.
* **Suppliers:** Toys are provided by external suppliers, and the system maintains a tracking relationship to see which supplier provides which product.
* **Employees:** Employees manage customer accounts and process store orders.
* **Promotions:** The store runs promotional events and discounts that can be applied to orders.

---

## 📐 Database Design Phases

### 1. Conceptual Design (ER Diagram)
The relational architecture maps out core business entities and their corresponding real-world cardinalities:
* `CUSTOMER` orders `ORDERS` *(1:M)*
* `EMPLOYEE` manages `CUSTOMER` *(1:M)*
* `SUPPLIER` supplies `TOYS` *(1:M)*
* `ORDERS` includes a bridge breakdown for `TOYS`, `SURPRISE_BOX`, and `EVENT_TICKET` *(M:N relationships resolved via associative entities)*.

### 2. Logical Design (Relational Schema)
All entities were mapped into 3NF (Third Normal Form) relational schemas, defining explicit Primary Keys (PK) and Foreign Keys (FK) to enforce domain logic and prevent redundancy.

---

## 🛠️ Implementation & Database Schema
The database engine constraints are built using standard SQL commands, utilizing specific datatypes and transactional actions (`ON UPDATE CASCADE`, `ON DELETE SET NULL`, `CHECK`, `NOT NULL`, and `UNIQUE`).

### Core Tables Structure:
1. **`EMPLOYEE`**: Tracks employee demographics, roles, and supervisor links.
2. **`CUSTOMER`**: Holds buyer registration fields and assigned managing employee.
3. **`SUPPLIER`**: Stores external vendor contact information.
4. **`ORDERS`**: Core transaction table linking customers, orders, and promotion codes.
5. **`TOYS`**: Product details including stock, price, and supplier tracking.
6. **`SURPRISE_BOX`**: Specially configured item packages.
7. **`EVENT_TICKET`**: Stores tickets sold for in-store entertainment/promotional events.
8. **Associative Tables:** Bridge tables (`Order_Toys`, `Order_Boxes`, `Order_Tickets`) to resolve many-to-many product transaction lines.

---

## 🔍 SQL Query Portfolio
The project showcases a wide suite of robust SQL statements divided by execution type:

* **Basic Data Retrieval:** Queries utilizing `SELECT`, `WHERE`, `LIKE`, and `ORDER BY` for targeted data filtering.
* **Aggregate Functions:** Analytical summaries leveraging `COUNT()`, `SUM()`, `AVG()`, `MAX()`, and `MIN()` grouped by criteria via `GROUP BY` and filtered through `HAVING`.
* **Advanced Joint Queries:** Combining tables using distinct relational algebra mappings including `INNER JOIN`, `LEFT JOIN`, and multi-table operations to construct complex relational views (e.g., matching customers with specific orders and products).

---

## 💻 Getting Started
Prerequisites
Any standard Relational Database Management System (RDBMS) such as MySQL, Oracle DB, or PostgreSQL.
