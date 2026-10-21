# 🏥 HealthPlus Care – SQL Data Analysis Project

## 📌 Project Overview

The **HealthPlus Care SQL Data Analysis Project** focuses on analyzing healthcare operations using SQL. The project uses a relational healthcare database to explore member information, clinic performance, specialist consultations, telemedicine sessions, chronic care programs, health packages, prescriptions, laboratory tests, insurance claims, billing, payments, and patient feedback.

The objective is to validate data quality, analyze healthcare business performance, and generate meaningful insights using SQL queries.

## 🎯 Project Objectives

- Validate data quality and database consistency.
- Analyze healthcare clinic and specialist performance.
- Examine consultation modes and telemedicine usage.
- Analyze chronic care programs and health package subscriptions.
- Identify frequently prescribed medicines and laboratory test costs.
- Evaluate insurance claims and revenue collection.
- Analyze patient feedback and specialist ratings.
- Apply SQL window functions for member visit and specialist ranking analysis.
- Generate key performance indicators (KPIs) for healthcare operations.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **Query Language:** SQL
- **Environment:** MySQL Workbench
- **Version Control:** GitHub

## 🗂️ Database Tables

The database contains 17 tables:

1. Clinics
2. Members
3. Corporates
4. Specialists
5. Corporate_Members
6. Consultations
7. Telemedicine_Sessions
8. Chronic_Care_Programs
9. Health_Packages
10. Package_Subscriptions
11. Prescriptions
12. Lab_Tests
13. Claims
14. Staff
15. Billing
16. Payments
17. Feedback

## 📊 Project Analysis

### 1. Data Quality Validation
- Row count validation across database tables
- Primary key duplicate checks
- NULL checks on primary key columns
- Date validation
- Business rule validation for age, salary, consultation fees, and other numeric values
- Billing amount validation
- Foreign key relationship checks
- Outlier analysis and data profiling

### 2. Healthcare Operations Analysis
- Top clinics by consultation volume
- Specialist consultation counts
- Consultation mode analysis
- Average telemedicine session duration
- Telemedicine platform usage
- Chronic care condition and program status analysis

### 3. Package & Corporate Analysis
- Most subscribed health packages
- Corporate clients ranked by enrolled members

### 4. Prescription & Laboratory Analysis
- Most frequently prescribed medicines
- Laboratory test cost analysis

### 5. Claims & Revenue Analysis
- Insurance provider performance
- Total billing revenue
- Total payment collection
- Revenue collection gap

### 6. Feedback Analysis
- Average patient feedback rating
- Specialist performance based on average ratings

### 7. SQL Window Functions
- `ROW_NUMBER()` – Numbering member consultation visits
- `RANK()` – Ranking specialists by consultation count
- `LAG()` – Identifying previous consultation dates
- `LEAD()` – Identifying next consultation dates

## 📈 Key Performance Indicators (KPIs)

The project includes SQL queries to calculate:

- Total Members
- Total Consultations
- Total Revenue
- Total Payment Collection
- Collection Gap
- Average Feedback Rating
- Top Clinic
- Top Specialist
- Most Prescribed Medicine
- Top Insurance Provider

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Clone or download this GitHub repository.
3. Open the SQL script in MySQL Workbench.
4. Execute the database creation and table creation statements first.
5. Load the corresponding dataset into the tables.
6. Run the data quality validation queries.
7. Execute the business analysis, window function, and KPI queries.
8. Review the result sets to understand healthcare operational performance.

**Note:** The database schema must be created and the required data loaded before running the analysis queries. The SQL scripts should be executed in the correct order.

## 💡 Learning Outcomes

- Hands-on experience with relational database design and SQL.
- Practical use of aggregate functions, joins, subqueries, and grouping.
- Data quality validation and database relationship checks.
- Business analysis using healthcare-related datasets.
- Application of SQL window functions.
- KPI calculation and data-driven decision-making.

## 👩‍💻 Author

**T. Subha**

Aspiring Data Analyst | AI/ML Enthusiast

🔗 GitHub: (https://github.com/Subhat123)

---

⭐ If you find this project useful, feel free to explore the SQL queries and analysis.
