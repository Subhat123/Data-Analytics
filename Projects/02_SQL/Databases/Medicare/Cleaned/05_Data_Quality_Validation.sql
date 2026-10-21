-- Medicare SQL Project
-- NULL, orphan-record, numeric, date, and ID-format checks.

SELECT
SUM(hospital_id IS NULL) AS hospital_id_nulls,
SUM(hospital_name IS NULL) AS hospital_name_nulls,
SUM(hospital_type IS NULL) AS hospital_type_nulls,
SUM(city IS NULL) AS city_nulls,
SUM(state IS NULL) AS state_nulls
FROM Hospitals;

SELECT
SUM(department_id IS NULL) AS department_id_nulls,
SUM(department_name IS NULL) AS department_name_nulls,
SUM(hospital_id IS NULL) AS hospital_id_nulls
FROM Departments;

SELECT
SUM(doctor_id IS NULL) AS doctor_id_nulls,
SUM(first_name IS NULL) AS first_name_nulls,
SUM(last_name IS NULL) AS last_name_nulls,
SUM(hospital_id IS NULL) AS hospital_id_nulls,
SUM(department_id IS NULL) AS department_id_nulls
FROM Doctors;

SELECT
SUM(patient_id IS NULL) AS patient_id_nulls,
SUM(first_name IS NULL) AS first_name_nulls,
SUM(last_name IS NULL) AS last_name_nulls
FROM Patients;

SELECT
SUM(employee_id IS NULL) AS employee_id_nulls,
SUM(first_name IS NULL) AS first_name_nulls,
SUM(last_name IS NULL) AS last_name_nulls,
SUM(department_id IS NULL) AS department_id_nulls,
SUM(hospital_id IS NULL) AS hospital_id_nulls
FROM Employees;

-- Departments → Hospitals
SELECT DISTINCT d.hospital_id
FROM Departments d
LEFT JOIN Hospitals h
ON d.hospital_id = h.hospital_id
WHERE d.hospital_id IS NOT NULL
AND h.hospital_id IS NULL;

-- Doctors → Hospitals
SELECT DISTINCT d.hospital_id
FROM Doctors d
LEFT JOIN Hospitals h
ON d.hospital_id = h.hospital_id
WHERE d.hospital_id IS NOT NULL
AND h.hospital_id IS NULL;

-- Doctors → Departments
SELECT DISTINCT d.department_id
FROM Doctors d
LEFT JOIN Departments dp
ON d.department_id = dp.department_id
WHERE d.department_id IS NOT NULL
AND dp.department_id IS NULL;

-- Appointments → Patients
SELECT DISTINCT a.patient_id
FROM Appointments a
LEFT JOIN Patients p
ON a.patient_id = p.patient_id
WHERE a.patient_id IS NOT NULL
AND p.patient_id IS NULL;

-- Appointments → Doctors
SELECT DISTINCT a.doctor_id
FROM Appointments a
LEFT JOIN Doctors d
ON a.doctor_id = d.doctor_id
WHERE a.doctor_id IS NOT NULL
AND d.doctor_id IS NULL;

-- Admissions → Patients
SELECT DISTINCT a.patient_id
FROM Admissions a
LEFT JOIN Patients p
ON a.patient_id = p.patient_id
WHERE a.patient_id IS NOT NULL
AND p.patient_id IS NULL;

-- Admissions → Hospitals
SELECT DISTINCT a.hospital_id
FROM Admissions a
LEFT JOIN Hospitals h
ON a.hospital_id = h.hospital_id
WHERE a.hospital_id IS NOT NULL
AND h.hospital_id IS NULL;

-- Treatments → Admissions
SELECT DISTINCT t.admission_id
FROM Treatments t
LEFT JOIN Admissions a
ON t.admission_id = a.admission_id
WHERE t.admission_id IS NOT NULL
AND a.admission_id IS NULL;

-- Insurance → Patients
SELECT DISTINCT i.patient_id
FROM Insurance i
LEFT JOIN Patients p
ON i.patient_id = p.patient_id
WHERE i.patient_id IS NOT NULL
AND p.patient_id IS NULL;

-- Pharmacy → Patients
SELECT DISTINCT p.patient_id
FROM Pharmacy p
LEFT JOIN Patients pt
ON p.patient_id = pt.patient_id
WHERE p.patient_id IS NOT NULL
AND pt.patient_id IS NULL;

-- Pharmacy → Medicines
SELECT DISTINCT p.medicine_id
FROM Pharmacy p
LEFT JOIN Medicines m
ON p.medicine_id = m.medicine_id
WHERE p.medicine_id IS NOT NULL
AND m.medicine_id IS NULL;

-- Billing → Patients
SELECT DISTINCT b.patient_id
FROM Billing b
LEFT JOIN Patients p
ON b.patient_id = p.patient_id
WHERE b.patient_id IS NOT NULL
AND p.patient_id IS NULL;

-- Payments → Billing
SELECT DISTINCT p.bill_id
FROM Payments p
LEFT JOIN Billing b
ON p.bill_id = b.bill_id
WHERE p.bill_id IS NOT NULL
AND b.bill_id IS NULL;

-- Numeric Data Validation
SELECT *
FROM Hospitals
WHERE bed_capacity < 0;

SELECT *
FROM Rooms
WHERE room_id IS NULL;

SELECT *
FROM Treatments
WHERE treatment_cost < 0;

SELECT *
FROM Pharmacy
WHERE quantity < 0
   OR total_price < 0;
   
SELECT *
FROM Billing
WHERE total_bill_amount < 0;

SELECT *
FROM Payments
WHERE payment_amount < 0;

DESC Billing;

-- Date Validation
SELECT *
FROM Appointments
WHERE appointment_date IS NULL;

SELECT *
FROM Admissions
WHERE admission_date IS NULL;

SELECT *
FROM Admissions
WHERE discharge_date IS NOT NULL
AND discharge_date < admission_date;

SELECT *
FROM Pharmacy
WHERE sale_date IS NULL;

SELECT *
FROM Payments
WHERE payment_date IS NULL;

--  Doctor ID format check 
SELECT doctor_id
FROM Doctors
WHERE doctor_id NOT REGEXP '^DR[0-9]{4,5}$';

-- Departments:
SELECT head_doctor_id
FROM Departments
WHERE head_doctor_id IS NOT NULL
AND head_doctor_id NOT REGEXP '^DR[0-9]{4,5}$';

-- Admissions:
SELECT admitting_doctor_id
FROM Admissions
WHERE admitting_doctor_id IS NOT NULL
AND admitting_doctor_id NOT REGEXP '^DR[0-9]{4,5}$';
