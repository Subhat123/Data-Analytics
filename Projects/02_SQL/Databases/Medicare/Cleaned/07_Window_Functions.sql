-- Medicare SQL Project
-- ROW_NUMBER, RANK, LAG, and LEAD examples.

-- ROW NUMBER 
SELECT
    patient_id,
    appointment_id,
    appointment_date,
    ROW_NUMBER() OVER (PARTITION BY patient_id ORDER BY appointment_date) AS appointment_sequence
FROM Appointments
ORDER BY patient_id, appointment_date;
    
SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(a.appointment_id) AS appointment_count,
    RANK() OVER (ORDER BY COUNT(a.appointment_id) DESC) AS workload_rank
FROM Doctors d
LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name
ORDER BY workload_rank;    

SELECT
    patient_id,
    appointment_date,
    LAG(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date) AS previous_appointment_date
FROM Appointments
ORDER BY patient_id, appointment_date;

SELECT
    patient_id,
    appointment_date,
    LEAD(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date) AS next_appointment_date
FROM Appointments
ORDER BY patient_id, appointment_date;
