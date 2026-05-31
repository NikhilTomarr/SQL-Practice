# 📊 SQL Mastery & Practice Lab

Welcome to the ultimate SQL learning and practice repository! This project is designed as a structured guide to take anyone from a complete beginner to an advanced level in SQL. It contains bite-sized theoretical notes, foundational concepts, and a complete practical implementation script.

---

## 🚀 Repository Roadmap

*   **`01_sql_core_fundamentals.sql`**: Comprehensive script covering DDL, DML, DQL/DRL, Joins, Subqueries, and Views.
*   **`02_50_sql_interview_ques.sql`**: 50 handpicked conceptual and logical interview problems.

---

## 📚 Core SQL Cheat-Sheet (Quick Revision)

### 1. The Big Picture: SQL vs MySQL
*   **SQL (Structured Query Language):** It is **not** a database. It is a standard query language used to perform **CRUD** operations on data.
*   **MySQL:** It is an open-source **RDBMS** (Relational Database Management System) that uses the **Client-Server Model** (where your CLI/Frontend acts as a client requesting services from the MySQL Server) and executes SQL commands to manage data in tables.

### 2. The CRUD Cycle

| Operation | SQL Command | Purpose |
| :--- | :--- | :--- |
| **C**reate | `INSERT` | Adds a new row/tuple into the table. |
| **R**ead | `SELECT` | Retrieves and displays data from tables. |
| **U**pdate | `UPDATE` | Modifies existing data within a table. |
| **D**elete | `DELETE` | Removes specific or multiple rows. |

---

## 🛠️ Types of SQL Commands

SQL commands are classified into 5 main categories based on their functionality:

```text
               ┌───────────────────────────────┐
               │         SQL Commands          │
               └───────────────┬───────────────┘
  ┌──────────────┬─────────────┼──────────────┬──────────────┐
┌─┴─┐          ┌─┴─┐         ┌─┴─┐          ┌─┴─┐          ┌─┴─┐
│DDL│          │DML│         │DRL│          │DCL│          │TCL│
└───┘          └───┘         └───┘          └───┘          └───┘
```

1.  **DDL (Data Definition Language) - Blueprint Design**
    *   Modifies the structural schema of the database.
    *   `CREATE` (DB/Table/View), `ALTER` (Structure change), `DROP` (Delete structure), `TRUNCATE` (Empty table), `RENAME`.
2.  **DML (Data Modification Language) - Data Modification**
    *   Manages the data inside the tables.
    *   `INSERT`, `UPDATE`, `DELETE`.
3.  **DRL / DQL (Data Retrieval Language) - Querying**
    *   Fetching data from the database.
    *   `SELECT`.
4.  **DCL (Data Control Language) - Security/Access**
    *   Handles permissions and access control.
    *   `GRANT` (Give access), `REVOKE` (Take back access).
5.  **TCL (Transaction Control Language) - Data Integrity**
    *   Manages transactions to ensure data consistency.
    *   `START TRANSACTION`, `COMMIT` (Save permanently), `ROLLBACK` (Undo changes), `SAVEPOINT`.

---

## 🔢 Data Types Quick Reference

Choosing the right datatype optimizes performance and saves storage space (`VARCHAR` is preferred over `CHAR` as it occupies variable space equal to actual data size).

*   **Numeric:** `TINYINT` < `SMALLINT` < `MEDIUMINT` < `INT` < `BIGINT` | `FLOAT`, `DOUBLE`, `DECIMAL`.
*   **String/Text:** `CHAR(size)`, `VARCHAR(size)`, `TEXT`, `BLOB`, `ENUM`, `SET`.
*   **Date & Time:** `DATE` (YYYY-MM-DD), `DATETIME` (YYYY-MM-DD HH:MM:SS), `TIMESTAMP`, `TIME`.

---

## 📂 Inside the Practice File (`01_sql_core_fundamentals.sql`)

The main script is well-commented and logically ordered. It performs practical execution on multiple dummy tables (`Worker`, `Bonus`, `Title`, `Customer`, `Employee`, `Project`, `Client`):

### 🔹 Topic Index Covered in Code:

*   **Database & Table Setup:** Initialization, Constraints (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `DEFAULT`).
*   **Basic Querying:** `WHERE` clause, Filtering (`BETWEEN`, `IN`, `NOT IN`, `IS NULL`).
*   **Pattern Matching:** Wildcards (`LIKE` operator with `%` and `_`).
*   **Sorting & Aggregations:** `ORDER BY`, `DISTINCT`, `GROUP BY` with Aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), and `HAVING` clause.
*   **Table Modifications:** `ALTER` Operations (`ADD`, `MODIFY`, `CHANGE`, `DROP`, `RENAME`) and `REPLACE` syntax.
*   **Referential Actions:** Handling data deletion gracefully via `ON DELETE CASCADE` and `ON DELETE SET NULL`.
*   **Advanced Joins:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `CROSS JOIN`.
*   **Set Operations:** Simulating `UNION`, `INTERSECT`, and `MINUS`.
*   **Subqueries:** Nested queries, Derived tables (`FROM` clause), and Advanced **Co-related Subqueries**.
*   **Database Views:** Creating, Altering, and Dropping `VIEW`.

---

## 🛠️ How to Use This Script

1.  Clone this repository or copy the code from `01_sql_core_fundamentals.sql`.
2.  Open **MySQL Workbench** or **MySQL CLI**.
3.  Run the commands sequentially line-by-line to see how the database state changes and how data shifts across different tables.

---

💡 *Tip: Star ⭐ this repository if you find it helpful for your SQL revision!*
