USE HealthPlus_Care_DB;

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
