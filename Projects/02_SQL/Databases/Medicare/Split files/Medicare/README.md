# Medicare Database SQL Project

## Project Overview
This project organizes the Medicare SQL work into separate files for easier review and submission.

## Files
1. `01_Database_and_Tables.sql` — creates the database and tables.
2. `02_Table_Alterations.sql` — table alterations and initial checks.
3. `03_Table_Inspection_and_Row_Counts.sql` — row counts and table structure inspection.
4. `04_Foreign_Keys_and_Integrity_Checks.sql` — foreign keys and relationship diagnostics.
5. `05_Data_Quality_Validation.sql` — missing values, orphan records, numeric/date validation, and ID formats.
6. `06_Business_Analysis.sql` — operational and financial analysis queries.
7. `07_Window_Functions.sql` — examples using ROW_NUMBER, RANK, LAG, and LEAD.

## How to Run
Open the files in MySQL Workbench and execute them in order where applicable. Start with database/tables and data setup. Some checks depend on data already being loaded. Review foreign-key and data-quality statements before running any `UPDATE` or schema-changing statements.

## Note
These files are split from the supplied SQL script by topic. Review the queries and test them against your database before final submission; the source script includes diagnostic and schema-changing statements.
