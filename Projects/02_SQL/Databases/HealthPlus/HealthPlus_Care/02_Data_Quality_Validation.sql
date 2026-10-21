USE HealthPlus_Care_DB;

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
