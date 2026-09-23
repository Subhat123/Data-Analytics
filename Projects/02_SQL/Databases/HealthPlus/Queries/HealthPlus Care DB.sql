CREATE DATABASE HealthPlus_Care_DB;
USE HealthPlus_Care_DB;

CREATE TABLE Clinics (
    clinic_id VARCHAR(10) PRIMARY KEY,
    clinic_name VARCHAR(150),
    clinic_type VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    established_year INT,
    contact_number VARCHAR(20)
);

CREATE TABLE Members (
    member_id VARCHAR(15) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(20),
    date_of_birth DATE,
    age INT,
    city VARCHAR(100),
    membership_type VARCHAR(50),
    registration_date DATE,
    phone_number VARCHAR(20),
    email VARCHAR(150)
);

CREATE TABLE Corporates (
    corporate_id VARCHAR(10) PRIMARY KEY,
    company_name VARCHAR(150),
    industry VARCHAR(100),
    city VARCHAR(100),
    contract_start_date DATE,
    contract_end_date DATE,
    employee_count INT
);

CREATE TABLE Specialists (
    specialist_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(20),
    specialization VARCHAR(100),
    clinic_id VARCHAR(10),
    qualification VARCHAR(100),
    experience_years INT,
    consultation_fee DECIMAL(10,2),

    CONSTRAINT fk_specialist_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Corporate_Members (
    corporate_member_id VARCHAR(15) PRIMARY KEY,
    corporate_id VARCHAR(10),
    member_id VARCHAR(15),
    designation VARCHAR(100),
    enrollment_date DATE,

    CONSTRAINT fk_corporate_member_corporate
        FOREIGN KEY (corporate_id)
        REFERENCES Corporates(corporate_id),

    CONSTRAINT fk_corporate_member_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

CREATE TABLE Consultations (
    consultation_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    specialist_id VARCHAR(10),
    clinic_id VARCHAR(10),
    consultation_date DATE,
    consultation_mode VARCHAR(30),
    status VARCHAR(30),
    reason_for_visit VARCHAR(255),

    CONSTRAINT fk_consultation_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_consultation_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES Specialists(specialist_id),

    CONSTRAINT fk_consultation_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Telemedicine_Sessions (
    session_id VARCHAR(15) PRIMARY KEY,
    consultation_id VARCHAR(15),
    session_start_time DATETIME,
    session_end_time DATETIME,
    platform VARCHAR(50),
    connection_quality VARCHAR(30),
    session_status VARCHAR(30),

    CONSTRAINT fk_telemedicine_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

CREATE TABLE Chronic_Care_Programs (
    program_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    specialist_id VARCHAR(10),
    condition_name VARCHAR(150),
    enrollment_date DATE,
    program_status VARCHAR(30),
    next_review_date DATE,

    CONSTRAINT fk_chronic_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_chronic_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES Specialists(specialist_id)
);

CREATE TABLE Health_Packages (
    package_id VARCHAR(10) PRIMARY KEY,
    package_name VARCHAR(150),
    package_type VARCHAR(50),
    price DECIMAL(10,2),
    validity_days INT,
    tests_included INT
);

CREATE TABLE Package_Subscriptions (
    subscription_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    package_id VARCHAR(10),
    subscription_date DATE,
    expiry_date DATE,
    payment_status VARCHAR(30),

    CONSTRAINT fk_subscription_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_subscription_package
        FOREIGN KEY (package_id)
        REFERENCES Health_Packages(package_id)
);

CREATE TABLE Prescriptions (
    prescription_id VARCHAR(15) PRIMARY KEY,
    consultation_id VARCHAR(15),
    member_id VARCHAR(15),
    specialist_id VARCHAR(10),
    medicine_name VARCHAR(150),
    dosage VARCHAR(100),
    duration_days INT,
    prescribed_date DATE,

    CONSTRAINT fk_prescription_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id),

    CONSTRAINT fk_prescription_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_prescription_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES Specialists(specialist_id)
);

CREATE TABLE Lab_Tests (
    lab_test_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    clinic_id VARCHAR(10),
    test_name VARCHAR(150),
    test_date DATE,
    test_result VARCHAR(100),
    test_cost DECIMAL(12,2),
    test_status VARCHAR(30),

    CONSTRAINT fk_labtest_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_labtest_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Claims (
    claim_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    consultation_id VARCHAR(15),
    claim_amount DECIMAL(12,2),
    claim_date DATE,
    claim_status VARCHAR(30),
    insurance_provider VARCHAR(150),

    CONSTRAINT fk_claim_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_claim_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

CREATE TABLE Staff (
    staff_id VARCHAR(15) PRIMARY KEY,
    clinic_id VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    designation VARCHAR(100),
    employment_type VARCHAR(50),
    salary DECIMAL(12,2),
    joining_date DATE,

    CONSTRAINT fk_staff_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Billing (
    bill_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    consultation_id VARCHAR(15),
    bill_date DATE,
    consultation_charges DECIMAL(12,2),
    lab_charges DECIMAL(12,2),
    medicine_charges DECIMAL(12,2),
    total_amount DECIMAL(12,2),
    bill_status VARCHAR(30),

    CONSTRAINT fk_health_billing_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_health_billing_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

CREATE TABLE Payments (
    payment_id VARCHAR(15) PRIMARY KEY,
    bill_id VARCHAR(15),
    member_id VARCHAR(15),
    payment_date DATE,
    payment_amount DECIMAL(12,2),
    payment_mode VARCHAR(50),
    payment_status VARCHAR(30),

    CONSTRAINT fk_health_payment_bill
        FOREIGN KEY (bill_id)
        REFERENCES Billing(bill_id),

    CONSTRAINT fk_health_payment_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

CREATE TABLE Feedback (
    feedback_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    consultation_id VARCHAR(15),
    rating INT,
    feedback_text TEXT,
    feedback_date DATE,

    CONSTRAINT fk_feedback_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_feedback_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

-- Row Count Validation

SELECT 'Clinics' AS Table_Name, COUNT(*) AS Row_Count FROM Clinics
UNION ALL
SELECT 'Members', COUNT(*) FROM Members
UNION ALL
SELECT 'Corporates', COUNT(*) FROM Corporates
UNION ALL
SELECT 'Specialists', COUNT(*) FROM Specialists
UNION ALL
SELECT 'Corporate_Members', COUNT(*) FROM Corporate_Members
UNION ALL
SELECT 'Consultations', COUNT(*) FROM Consultations
UNION ALL
SELECT 'Telemedicine_Sessions', COUNT(*) FROM Telemedicine_Sessions
UNION ALL
SELECT 'Chronic_Care_Programs', COUNT(*) FROM Chronic_Care_Programs
UNION ALL
SELECT 'Health_Packages', COUNT(*) FROM Health_Packages
UNION ALL
SELECT 'Package_Subscriptions', COUNT(*) FROM Package_Subscriptions
UNION ALL
SELECT 'Prescriptions', COUNT(*) FROM Prescriptions
UNION ALL
SELECT 'Lab_Tests', COUNT(*) FROM Lab_Tests
UNION ALL
SELECT 'Claims', COUNT(*) FROM Claims
UNION ALL
SELECT 'Staff', COUNT(*) FROM Staff
UNION ALL
SELECT 'Billing', COUNT(*) FROM Billing
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Feedback', COUNT(*) FROM Feedback;


-- Duplicates Check PK Column

SELECT clinic_id,COUNT(*) FROM Clinics GROUP BY clinic_id HAVING COUNT(*)>1;

SELECT member_id,COUNT(*) FROM Members GROUP BY member_id HAVING COUNT(*)>1;

SELECT corporate_id,COUNT(*) FROM Corporates GROUP BY corporate_id HAVING COUNT(*)>1;

SELECT specialist_id,COUNT(*) FROM Specialists GROUP BY specialist_id HAVING COUNT(*)>1;

SELECT corporate_member_id,COUNT(*) FROM Corporate_Members GROUP BY corporate_member_id HAVING COUNT(*)>1;

SELECT consultation_id,COUNT(*) FROM Consultations GROUP BY consultation_id HAVING COUNT(*)>1;

SELECT session_id,COUNT(*) FROM Telemedicine_Sessions GROUP BY session_id HAVING COUNT(*)>1;

SELECT program_id,COUNT(*) FROM Chronic_Care_Programs GROUP BY program_id HAVING COUNT(*)>1;

SELECT package_id,COUNT(*) FROM Health_Packages GROUP BY package_id HAVING COUNT(*)>1;

SELECT subscription_id,COUNT(*) FROM Package_Subscriptions GROUP BY subscription_id HAVING COUNT(*)>1;

SELECT prescription_id,COUNT(*) FROM Prescriptions GROUP BY prescription_id HAVING COUNT(*)>1;

SELECT lab_test_id,COUNT(*) FROM Lab_Tests GROUP BY lab_test_id HAVING COUNT(*)>1;

SELECT claim_id,COUNT(*) FROM Claims GROUP BY claim_id HAVING COUNT(*)>1;

SELECT staff_id,COUNT(*) FROM Staff GROUP BY staff_id HAVING COUNT(*)>1;

SELECT bill_id,COUNT(*) FROM Billing GROUP BY bill_id HAVING COUNT(*)>1;

SELECT payment_id,COUNT(*) FROM Payments GROUP BY payment_id HAVING COUNT(*)>1;

SELECT feedback_id,COUNT(*) FROM Feedback GROUP BY feedback_id HAVING COUNT(*)>1;

-- Null Check

SELECT * FROM Clinics WHERE clinic_id IS NULL;

SELECT * FROM Members WHERE member_id IS NULL;

SELECT * FROM Corporates WHERE corporate_id IS NULL;

SELECT * FROM Specialists WHERE specialist_id IS NULL;

SELECT * FROM Corporate_Members WHERE corporate_member_id IS NULL;

SELECT * FROM Consultations WHERE consultation_id IS NULL;

SELECT * FROM Telemedicine_Sessions WHERE session_id IS NULL;

SELECT * FROM Chronic_Care_Programs WHERE program_id IS NULL;

SELECT * FROM Health_Packages WHERE package_id IS NULL;

SELECT * FROM Package_Subscriptions WHERE subscription_id IS NULL;

SELECT * FROM Prescriptions WHERE prescription_id IS NULL;

SELECT * FROM Lab_Tests WHERE lab_test_id IS NULL;

SELECT * FROM Claims WHERE claim_id IS NULL;

SELECT * FROM Staff WHERE staff_id IS NULL;

SELECT * FROM Billing WHERE bill_id IS NULL;

SELECT * FROM Payments WHERE payment_id IS NULL;

SELECT * FROM Feedback WHERE feedback_id IS NULL;


-- Date Validation
SELECT * FROM Members
WHERE registration_date > CURDATE();

SELECT * FROM Corporates
WHERE contract_end_date < contract_start_date;

SELECT * FROM Consultations
WHERE consultation_date > CURDATE();

SELECT * FROM Package_Subscriptions
WHERE expiry_date < subscription_date;

SELECT * FROM Prescriptions
WHERE prescribed_date > CURDATE();

SELECT * FROM Claims
WHERE claim_date > CURDATE();

SELECT * FROM Payments
WHERE payment_date > CURDATE();

SELECT * FROM Feedback
WHERE feedback_date > CURDATE();


-- Business Rule Validation
SELECT * FROM Members
WHERE age < 0 OR age > 120;

SELECT * FROM Specialists
WHERE experience_years < 0;

SELECT * FROM Specialists
WHERE consultation_fee < 0;

SELECT * FROM Health_Packages
WHERE price < 0;

SELECT * FROM Lab_Tests
WHERE test_cost < 0;

SELECT * FROM Claims
WHERE claim_amount < 0;

SELECT * FROM Staff
WHERE salary < 0;

SELECT * FROM Payments
WHERE payment_amount < 0;

SELECT * FROM Feedback
WHERE rating NOT BETWEEN 1 AND 5;

-- Billing Validation
SELECT *
FROM Billing
WHERE total_amount <>
(
consultation_charges
+ lab_charges
+ medicine_charges
);

-- Foreign Key Validation
SELECT s.*
FROM Specialists s
LEFT JOIN Clinics c
ON s.clinic_id=c.clinic_id
WHERE c.clinic_id IS NULL;

SELECT cm.*
FROM Corporate_Members cm
LEFT JOIN Members m
ON cm.member_id=m.member_id
WHERE m.member_id IS NULL;

SELECT c.*
FROM Consultations c
LEFT JOIN Members m
ON c.member_id=m.member_id
WHERE m.member_id IS NULL;

SELECT p.*
FROM Payments p
LEFT JOIN Billing b
ON p.bill_id=b.bill_id
WHERE b.bill_id IS NULL;

-- Outlier Analysis
SELECT MIN(age),MAX(age),AVG(age)
FROM Members;

SELECT MIN(consultation_fee),
MAX(consultation_fee),
AVG(consultation_fee)
FROM Specialists;

SELECT MIN(price),
MAX(price),
AVG(price)
FROM Health_Packages;

SELECT MIN(claim_amount),
MAX(claim_amount),
AVG(claim_amount)
FROM Claims;

SELECT MIN(salary),
MAX(salary),
AVG(salary)
FROM Staff;


-- Final Profiling Report
SELECT COUNT(*) AS Total_Members
FROM Members;

SELECT COUNT(DISTINCT city)
FROM Members;

SELECT MIN(age),
MAX(age),
AVG(age)
FROM Members;

SELECT gender,
COUNT(*)
FROM Members
GROUP BY gender;

-------------------------------------------------------
-- Step-1  Category-wise Analysis Queries 

-- Top 10 Clinics by Consultation Volume

SELECT
    c.clinic_name,
    COUNT(co.consultation_id) AS total_consultations
FROM Clinics c
JOIN Consultations co
ON c.clinic_id = co.clinic_id
GROUP BY c.clinic_name
ORDER BY total_consultations DESC
LIMIT 10;


-- Top Specialists by Consultation Count

SELECT
    s.specialist_id,
    CONCAT(s.first_name,' ',s.last_name) AS specialist_name,
    COUNT(c.consultation_id) AS consultation_count
FROM Specialists s
JOIN Consultations c
ON s.specialist_id = c.specialist_id
GROUP BY s.specialist_id,specialist_name
ORDER BY consultation_count DESC;


-- Consultation Mode Analysis

SELECT
consultation_mode,
COUNT(*) AS total
FROM Consultations
GROUP BY consultation_mode;


-- Step-2  Telemedicine Analysis

-- Average Session Duration

SELECT
AVG(
TIMESTAMPDIFF
(MINUTE,
session_start_time,
session_end_time)
) AS avg_duration_minutes
FROM Telemedicine_Sessions;

-- Platform Usage

SELECT
platform,
COUNT(*) total_sessions
FROM Telemedicine_Sessions
GROUP BY platform
ORDER BY total_sessions DESC;

-- Step- 3  Chronic Care Analysis

-- Most Common Conditions

SELECT
condition_name,
COUNT(*) total_members
FROM Chronic_Care_Programs
GROUP BY condition_name
ORDER BY total_members DESC;

-- Active vs Inactive Programs

SELECT
program_status,
COUNT(*) total
FROM Chronic_Care_Programs
GROUP BY program_status;


-- Step 4: Package Analysis

-- Most Subscribed Packages

SELECT
hp.package_name,
COUNT(ps.subscription_id) subscriptions
FROM Health_Packages hp
JOIN Package_Subscriptions ps
ON hp.package_id = ps.package_id
GROUP BY hp.package_name
ORDER BY subscriptions DESC;


-- Step 5: Corporate Analysis
-- Top Corporate Clients

SELECT
c.company_name,
COUNT(cm.member_id) total_members
FROM Corporates c
JOIN Corporate_Members cm
ON c.corporate_id=cm.corporate_id
GROUP BY c.company_name
ORDER BY total_members DESC;


-- Step 6: Prescription Analysis
-- Most Prescribed Medicines

SELECT
medicine_name,
COUNT(*) total
FROM Prescriptions
GROUP BY medicine_name
ORDER BY total DESC
LIMIT 10;


-- Step 7: Lab Test Analysis
-- Highest Cost Tests

SELECT
test_name,
SUM(test_cost) total_cost
FROM Lab_Tests
GROUP BY test_name
ORDER BY total_cost DESC;


-- Step 8: Claims Analysis
-- Insurance Provider Performance

SELECT
insurance_provider,
COUNT(*) total_claims,
SUM(claim_amount) total_amount
FROM Claims
GROUP BY insurance_provider
ORDER BY total_amount DESC;


-- Step 9: Revenue Analysis
-- Total Revenue

SELECT
SUM(total_amount) total_billing
FROM Billing;

-- Total Payment Collection

SELECT
SUM(payment_amount) total_payment
FROM Payments;

-- Collection Gap

SELECT
(SELECT SUM(total_amount)FROM Billing)
-
(SELECT SUM(payment_amount)FROM Payments)
AS collection_gap;


-- Step 10: Feedback Analysis
-- Average Rating

SELECT
ROUND(AVG(rating),2)
AS avg_rating
FROM Feedback;

-- Best Specialists

SELECT
s.specialist_id,
CONCAT(s.first_name,' ',s.last_name) specialist_name,
ROUND(AVG(f.rating),2) avg_rating
FROM Specialists s
JOIN Consultations c
ON s.specialist_id=c.specialist_id
JOIN Feedback f
ON c.consultation_id=f.consultation_id
GROUP BY s.specialist_id,specialist_name
ORDER BY avg_rating DESC;


-- Step 11: Window Functions (Mandatory in BRD)

-- ROW_NUMBER()

SELECT
member_id,
consultation_date,
ROW_NUMBER()
OVER(PARTITION BY member_id ORDER BY consultation_date) AS visit_no
FROM Consultations;

-- RANK()

SELECT
specialist_id,
COUNT(*) total_consultations,
RANK()
OVER(ORDER BY COUNT(*) DESC) ranking
FROM Consultations
GROUP BY specialist_id;

-- LAG()

SELECT
member_id,
consultation_date,
LAG(consultation_date)
OVER(PARTITION BY member_id ORDER BY consultation_date) previous_visit
FROM Consultations;

-- LEAD()

SELECT
member_id,
consultation_date,
LEAD(consultation_date)
OVER(PARTITION BY member_id ORDER BY consultation_date) next_visit
FROM Consultations;


-- Total Members
SELECT COUNT(*) AS Total_Members
FROM Members;

-- Toatal Consultations
SELECT COUNT(*) AS Total_Consultations
FROM Consultations;

-- Total Revenue
SELECT ROUND(SUM(total_amount),2) AS Total_Revenue
FROM Billing;

-- Total Payment  Collection
SELECT ROUND(SUM(payment_amount),2) AS Total_Payment_Collection
FROM Payments;

-- Collection Gap
SELECT
ROUND(
(SELECT SUM(total_amount) FROM Billing)
-
(SELECT SUM(payment_amount) FROM Payments),2) AS Collection_Gap;

-- Average Rating
SELECT ROUND(AVG(rating),2) AS Average_Rating
FROM Feedback;

-- Top Clinic
SELECT
c.clinic_name,
COUNT(co.consultation_id) AS Total_Consultations
FROM Clinics c
JOIN Consultations co
ON c.clinic_id = co.clinic_id
GROUP BY c.clinic_name
ORDER BY Total_Consultations DESC
LIMIT 1;

-- Top Specialists
SELECT
CONCAT(s.first_name,' ',s.last_name) AS Specialist_Name,
COUNT(c.consultation_id) AS Total_Consultations
FROM Specialists s
JOIN Consultations c
ON s.specialist_id=c.specialist_id
GROUP BY Specialist_Name
ORDER BY Total_Consultations DESC
LIMIT 1;

-- Most Prescribed Medicine
SELECT
medicine_name,
COUNT(*) AS Prescription_Count
FROM Prescriptions
GROUP BY medicine_name
ORDER BY Prescription_Count DESC
LIMIT 1;

-- Top Insurance Provider
SELECT
insurance_provider,
SUM(claim_amount) AS Total_Claim_Amount
FROM Claims
GROUP BY insurance_provider
ORDER BY Total_Claim_Amount DESC
LIMIT 1;