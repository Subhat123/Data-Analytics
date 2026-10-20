USE HealthPlus_Care_DB;

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
