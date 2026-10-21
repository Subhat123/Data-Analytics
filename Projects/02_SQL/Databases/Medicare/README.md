# Medicare Database Analysis Using SQL

## 📌 Project Overview
The Medicare Database Analysis project focuses on organizing and analyzing healthcare data using SQL. It covers hospital operations, patient appointments, admissions, medical treatments, laboratory tests, pharmacy transactions, billing, and payments.

The project demonstrates SQL skills in database creation, table management, data validation, relational integrity, business analysis, and window functions.

## 🎯 Objectives
- Create and manage a relational healthcare database.
- Inspect table structures and record counts.
- Establish and validate relationships using foreign keys.
- Perform data quality checks to identify missing, duplicate, and invalid records.
- Analyze hospital operations, patient activity, treatments, and healthcare costs.
- Use SQL window functions to analyze appointment sequences and doctor workloads.

## 🛠️ Tools & Technologies
- **Database:** MySQL
- **Query Language:** SQL
- **Environment:** MySQL Workbench
- **Version Control:** GitHub

## 🗂️ Project Structure

```text
Medicare/
├── 01_Database_and_Tables.sql
├── 02_Table_Alterations.sql
├── 03_Table_Inspection_and_Row_Counts.sql
├── 04_Foreign_Keys_and_Integrity_Checks.sql
├── 05_Data_Quality_Validation.sql
├── 06_Business_Analysis.sql
├── 07_Window_Functions.sql
└── README.md
```

## 📊 Analysis Performed

### 1. Database Creation & Table Management
- Created the Medicare database and healthcare-related tables.
- Modified table structures using `ALTER TABLE`.
- Inspected schemas using `DESC` and `SHOW CREATE TABLE`.

### 2. Data Integrity & Validation
- Established foreign-key relationships between related tables.
- Checked for orphan records and invalid references.
- Identified duplicate identifiers and missing values.
- Validated numeric values, dates, and doctor ID formats.

### 3. Healthcare Business Analysis
- Analyzed hospital appointments, admissions, and patient activity.
- Evaluated department admissions and doctor workloads.
- Examined treatment volumes and treatment costs.
- Analyzed laboratory tests and pharmacy sales.
- Calculated billing totals, payment collections, and collection gaps.
- Generated overall healthcare operational KPIs.

### 4. SQL Window Functions
- `ROW_NUMBER()` — assigns a sequence to patient appointments.
- `RANK()` — ranks doctors by appointment workload.
- `LAG()` — retrieves the previous appointment date.
- `LEAD()` — retrieves the next appointment date.

## 💡 Key SQL Concepts
`CREATE DATABASE` · `CREATE TABLE` · `ALTER TABLE` · `SELECT` · `JOIN` · `GROUP BY` · `HAVING` · Aggregate Functions · Subqueries · `UNION ALL` · Foreign Keys · Data Validation · Window Functions

## ▶️ How to Run
1. Install MySQL Server and MySQL Workbench.
2. Clone or download this repository.
3. Open MySQL Workbench and connect to your database server.
4. Open the SQL files in the recommended order.
5. Select the `medicare` database where applicable.
6. Execute the queries and review the output.

**Important:** Some queries depend on existing tables and loaded data. Review schema-changing and data-modifying statements before execution, particularly `DROP TABLE`, `UPDATE`, and foreign-key constraints.

## 📁 Repository
(https://github.com/Subhat123/Data-Analytics)

## 👩‍💻 Author
**T. Subha**

Aspiring Data Analyst | SQL | Python | Power BI | Excel

---

*This project was developed for SQL practice and healthcare data analysis. The results depend on the data available in the database.*
