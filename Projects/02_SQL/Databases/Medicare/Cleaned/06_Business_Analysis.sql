-- Medicare SQL Project
-- Hospital, department, doctor, patient, admission, treatment, pharmacy, billing, and KPI analysis.

SELECT
    h.hospital_id,
    h.hospital_name,
    COUNT(DISTINCT a.appointment_id) AS total_appointments,
    COUNT(DISTINCT ad.admission_id) AS total_admissions,
    COUNT(DISTINCT a.patient_id) AS unique_patients
FROM Hospitals h
LEFT JOIN Appointments a
    ON h.hospital_id = a.hospital_id
LEFT JOIN Admissions ad
    ON h.hospital_id = ad.hospital_id
GROUP BY h.hospital_id, h.hospital_name
ORDER BY total_admissions DESC, total_appointments DESC;


SELECT
    d.department_id,
    d.department_name,
    COUNT(DISTINCT ad.admission_id) AS total_admissions
FROM Departments d
LEFT JOIN Admissions ad
    ON d.department_id = ad.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_admissions DESC;


SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    COUNT(DISTINCT a.appointment_id) AS appointment_count,
    COUNT(DISTINCT t.treatment_id) AS treatment_count
FROM Doctors d
LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id
LEFT JOIN Treatments t
    ON d.doctor_id = t.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name,
    d.specialization
ORDER BY appointment_count DESC, treatment_count DESC;

SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    COUNT(DISTINCT a.appointment_id) AS appointments,
    COUNT(DISTINCT ad.admission_id) AS admissions,
    COUNT(DISTINCT t.treatment_id) AS treatments,
    COUNT(DISTINCT l.lab_id) AS lab_tests,
    COUNT(DISTINCT ph.pharmacy_sale_id) AS pharmacy_transactions
FROM Patients p
LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id
LEFT JOIN Admissions ad
    ON p.patient_id = ad.patient_id
LEFT JOIN Treatments t
    ON p.patient_id = t.patient_id
LEFT JOIN Laboratory l
    ON p.patient_id = l.patient_id
LEFT JOIN Pharmacy ph
    ON p.patient_id = ph.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY
    appointments + admissions + treatments + lab_tests + pharmacy_transactions DESC;
    
    SELECT
    admission_type,
    admission_status,
    COUNT(*) AS admission_count
FROM Admissions
GROUP BY admission_type, admission_status
ORDER BY admission_count DESC;

SELECT
    ROUND(
        AVG(DATEDIFF(discharge_date, admission_date)),
        2
    ) AS average_length_of_stay_days
FROM Admissions
WHERE discharge_date IS NOT NULL
  AND discharge_date >= admission_date;


SELECT
    treatment_name,
    COUNT(*) AS treatment_volume,
    SUM(treatment_cost) AS total_treatment_cost,
    ROUND(AVG(treatment_cost), 2) AS average_treatment_cost
FROM Treatments
GROUP BY treatment_name
ORDER BY treatment_volume DESC;

SELECT
    test_name,
    COUNT(*) AS test_volume,
    SUM(test_cost) AS total_test_cost,
    ROUND(AVG(test_cost), 2) AS average_test_cost
FROM Laboratory
GROUP BY test_name
ORDER BY total_test_cost DESC;

SELECT
    m.medicine_name,
    m.category,
    SUM(ph.quantity) AS total_quantity_sold,
    SUM(ph.total_price) AS total_revenue
FROM Pharmacy ph
JOIN Medicines m
    ON ph.medicine_id = m.medicine_id
GROUP BY
    m.medicine_id,
    m.medicine_name,
    m.category
ORDER BY total_revenue DESC;

SELECT
    b.total_billed_amount,
    p.total_payment_amount,
    b.total_billed_amount - p.total_payment_amount AS collection_gap,
    ROUND((p.total_payment_amount / NULLIF(b.total_billed_amount, 0)) * 100,2) AS collection_rate_percent FROM
(SELECT SUM(total_bill_amount) AS total_billed_amount FROM Billing) b CROSS JOIN
(SELECT SUM(payment_amount) AS total_payment_amount FROM Payments) p;

SELECT
    (SELECT COUNT(*) FROM Patients) AS total_patients,
    (SELECT COUNT(*) FROM Appointments) AS total_appointments,
    (SELECT COUNT(*) FROM Admissions) AS total_admissions,

    (SELECT ROUND(AVG(DATEDIFF(discharge_date, admission_date)), 2)
     FROM Admissions
     WHERE discharge_date IS NOT NULL AND discharge_date >= admission_date) AS average_length_of_stay,

    (SELECT COUNT(*) FROM Treatments) AS total_treatments,

    (SELECT SUM(treatment_cost)
     FROM Treatments) AS total_treatment_cost,

    (SELECT COUNT(*) FROM Laboratory) AS total_lab_activity,

    (SELECT COUNT(*) FROM Pharmacy) AS total_pharmacy_activity,

    (SELECT SUM(total_bill_amount)
	FROM Billing) AS total_billed_amount,
    
    (SELECT SUM(payment_amount)
    FROM Payments) AS total_payment_collected;
