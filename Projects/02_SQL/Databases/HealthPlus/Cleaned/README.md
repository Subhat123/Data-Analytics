# 🧼 HealthPlus Care – Cleaned & Modular SQL Scripts

## 📌 Contents Overview

This directory organizes the HealthPlus Care SQL pipeline into sequentially executed, standardized modular scripts.

---

## 🗂️ Script Manifest & Execution Order

| Step | Script File | Description |
| :---: | :--- | :--- |
| **01** | **`01_Database_and_Tables.sql`** | Creates `HealthPlus_Care_DB` schema and instantiates all 17 tables with primary keys, foreign keys, and constraints. |
| **02** | **`02_Data_Quality_Validation.sql`** | Verifies data integrity: table row counts, duplicate primary key checks, NULL checks, date ranges, and business sanity constraints. |
| **03** | **`03_Business_Analysis.sql`** | Runs business queries: top clinics by visit volume, doctor workloads, chronic care enrollments, telemedicine durations, and pharmacy analytics. |
| **04** | **`04_Window_Functions.sql`** | Advanced analytical queries utilizing `ROW_NUMBER()`, `RANK()`, `LAG()`, and `LEAD()` to examine patient return intervals and specialist rankings. |
| **05** | **`05_Final_KPI_Queries.sql`** | Executive KPI calculations: Total Revenue, Total Members, Claim Settlement Ratios, and Collection Gap Metrics. |

---

## 🚀 Execution Instructions

Run the scripts in sequential numerical order (`01` through `05`) within MySQL Workbench or through the MySQL CLI:

```sql
SOURCE 01_Database_and_Tables.sql;
SOURCE 02_Data_Quality_Validation.sql;
SOURCE 03_Business_Analysis.sql;
SOURCE 04_Window_Functions.sql;
SOURCE 05_Final_KPI_Queries.sql;
```
