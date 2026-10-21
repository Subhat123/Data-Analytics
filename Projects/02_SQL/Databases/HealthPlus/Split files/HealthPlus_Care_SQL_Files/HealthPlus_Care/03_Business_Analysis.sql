USE HealthPlus_Care_DB;

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
