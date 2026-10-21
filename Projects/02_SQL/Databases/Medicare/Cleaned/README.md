# 🧼 Medicare – Cleaned & Modular SQL Scripts

## 📌 Contents Overview

This directory contains the modularized, sequentially organized SQL scripts for the Medicare hospital management database.

---

## 🗂️ Script Catalog & Execution Sequence

| Step | Script File | Description |
| :---: | :--- | :--- |
| **01** | **`01_Database_and_Tables.sql`** | Creates `medicare_db` schema, instantiating tables for Patients, Doctors, Appointments, Admissions, Treatments, and Billing. |
| **02** | **`02_Table_Alterations.sql`** | Contains schema evolution statements, index additions, and column type modifications. |
| **03** | **`03_Table_Inspection_and_Row_Counts.sql`** | Inspects table structures (`DESCRIBE`) and validates record counts across all hospital entities. |
| **04** | **`04_Foreign_Keys_and_Integrity_Checks.sql`** | Validates relational constraints, child-parent foreign key integrity, and identifies orphan records. |
| **05** | **`05_Data_Quality_Validation.sql`** | Quality checks checking for duplicate records, NULL values in mandatory fields, and date format compliance. |
| **06** | **`06_Business_Analysis.sql`** | Analyzes hospital operational questions: department admission rates, treatment cost variations, and pharmacy billing volume. |
| **07** | **`07_Window_Functions.sql`** | Uses `ROW_NUMBER()`, `RANK()`, and `LAG()` to analyze sequential patient appointments and doctor workload rankings. |

---

## 🚀 Execution Instructions

Execute in sequential order (`01` through `07`) using MySQL Workbench or the MySQL command-line client:

```sql
SOURCE 01_Database_and_Tables.sql;
SOURCE 02_Table_Alterations.sql;
SOURCE 03_Table_Inspection_and_Row_Counts.sql;
SOURCE 04_Foreign_Keys_and_Integrity_Checks.sql;
SOURCE 05_Data_Quality_Validation.sql;
SOURCE 06_Business_Analysis.sql;
SOURCE 07_Window_Functions.sql;
```
