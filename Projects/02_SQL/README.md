# 🗄️ 02_SQL – Relational Database Design & Healthcare Analytics

This module contains production-grade SQL database implementations, schema designs, data quality assurance pipelines, and analytical query suites focused on complex healthcare business operations.

---

## 🗂️ Module Architecture

```text
02_SQL/
└── Databases/
    ├── HealthPlus/    # Comprehensive 17-table healthcare clinic and specialist network
    └── Medicare/      # Hospital operations, inpatient/outpatient admissions, and doctor workloads
```

---

## 🏥 Databases Overview

### 1. [HealthPlus Care DB](./Databases/HealthPlus/)
A relational database comprising 17 tables modeling an outpatient and multi-specialty healthcare network.
- **Key Modules:** Clinics, Members, Corporate Clients, Specialists, In-person and Telemedicine Consultations, Chronic Care Programs, Health Packages, Prescriptions, Laboratory Tests, Insurance Claims, Billing, Payments, and Patient Feedback.
- **Deliverables:** Master DDL scripts, comprehensive data quality validation scripts, business reporting queries, window function analytics, and full documentation PDF (`HealthPlus_DB_Output_Document.pdf`).

### 2. [Medicare Operations DB](./Databases/Medicare/)
An enterprise hospital management database modeling inpatient and outpatient operations.
- **Key Modules:** Patients, Doctors, Departments, Appointments, Inpatient Admissions, Treatments, Laboratory Tests, Pharmacy Orders, Billing, and Payments.
- **Deliverables:** Normalized DDL scripts, table alteration migration scripts, row count audits, foreign key validation, data profiling queries, window function rankings, and documentation PDF (`MEDICARE HEALTHCARE OPERATIONS DB.pdf`).

---

## 🛠️ Technical Competencies Demonstrated

- **DDL & Schema Design:** Normalized schema creation (`CREATE TABLE`), primary/foreign key definitions, constraints (`UNIQUE`, `NOT NULL`, `CHECK`).
- **Data Integrity & Validation:** Orphan record detection, duplicate key auditing, date logic validation, range checks.
- **Complex Aggregations & Joins:** Multi-table `INNER`, `LEFT`, and `RIGHT JOIN` structures, conditional `SUM(CASE WHEN ...)`, `GROUP BY`, and `HAVING`.
- **Advanced Window Functions:** `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, and `LEAD()` for sequential and longitudinal patient analysis.
- **Operational KPI Reporting:** Calculation of revenue gaps, collection efficiency ratios, patient retention, and doctor consultation utilization.
