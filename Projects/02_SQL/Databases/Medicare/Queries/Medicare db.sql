CREATE DATABASE medicare;
USE medicare;

CREATE TABLE Hospitals (
    hospital_id VARCHAR(10) PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    hospital_type VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(30),
    bed_capacity INT,
    established_year INT,
    contact_number VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Departments (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    hospital_id VARCHAR(10),
    floor_number INT,
    head_doctor_id VARCHAR(10)
);

CREATE TABLE Doctors (
    doctor_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender VARCHAR(20),
    specialization VARCHAR(100),
    department_id VARCHAR(10),
    hospital_id VARCHAR(10),
    qualification VARCHAR(100),
    experience_years INT,
    consultation_fee DECIMAL(10,2),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    joining_date DATE
);

CREATE TABLE Patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender VARCHAR(20),
    date_of_birth DATE,
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    blood_group VARCHAR(10),
    registration_date DATE
);

CREATE TABLE Rooms (
    room_id VARCHAR(10) PRIMARY KEY,
    hospital_id VARCHAR(10),
    room_number VARCHAR(20),
    room_type VARCHAR(50),
    floor_number INT,
    daily_charge DECIMAL(10,2),
    room_status VARCHAR(30)
);

CREATE TABLE Appointments (
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    hospital_id VARCHAR(10),
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(30),
    reason_for_visit VARCHAR(255),
    created_at DATETIME
);

CREATE TABLE Admissions (
    admission_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    hospital_id VARCHAR(10),
    department_id VARCHAR(10),
    admitting_doctor_id VARCHAR(10),
    room_id VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    admission_type VARCHAR(50),
    admission_status VARCHAR(50)
);

CREATE TABLE Treatments (
    treatment_id VARCHAR(10) PRIMARY KEY,
    admission_id VARCHAR(10),
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    treatment_name VARCHAR(100),
    treatment_date DATE,
    treatment_cost DECIMAL(10,2),
    treatment_status VARCHAR(50)
);

CREATE TABLE Insurance (
    insurance_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    provider_name VARCHAR(100),
    policy_number VARCHAR(50),
    coverage_amount DECIMAL(12,2),
    policy_start_date DATE,
    policy_end_date DATE,
    insurance_status VARCHAR(30)
);

CREATE TABLE Medicines (
    medicine_id VARCHAR(10) PRIMARY KEY,
    medicine_name VARCHAR(100),
    category VARCHAR(50),
    manufacturer VARCHAR(100),
    unit_price DECIMAL(10,2),
    stock_quantity INT,
    expiry_date DATE
);

CREATE TABLE Pharmacy (
    pharmacy_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    medicine_id VARCHAR(10),
    quantity INT,
    total_amount DECIMAL(10,2),
    transaction_date DATE
);

CREATE TABLE Laboratory (
    lab_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    test_name VARCHAR(100),
    test_date DATE,
    test_cost DECIMAL(10,2),
    test_status VARCHAR(30)
);

CREATE TABLE Employees (
    employee_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(20),
    department_id VARCHAR(10),
    hospital_id VARCHAR(10),
    designation VARCHAR(100),
    salary DECIMAL(12,2),
    joining_date DATE,
    phone_number VARCHAR(20)
);

CREATE TABLE Billing (
    bill_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    admission_id VARCHAR(10),
    bill_date DATE,
    room_charges DECIMAL(12,2),
    doctor_charges DECIMAL(12,2),
    medicine_charges DECIMAL(12,2),
    laboratory_charges DECIMAL(12,2),
    other_charges DECIMAL(12,2),
    total_bill_amount DECIMAL(12,2),
    bill_status VARCHAR(30)
);

CREATE TABLE Payments (
    payment_id VARCHAR(10) PRIMARY KEY,
    bill_id VARCHAR(10),
    patient_id VARCHAR(10),
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_amount DECIMAL(12,2),
    payment_status VARCHAR(30)
);

ALTER TABLE Employees
ADD COLUMN employment_type VARCHAR(30);

ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);

DESC Employees;

SELECT * FROM Employees LIMIT 5;

SELECT count(*) AS employee_count
FROM Employees;

DESC Pharmacy;

DROP TABLE Pharmacy;

CREATE TABLE Pharmacy (
    pharmacy_sale_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    medicine_id VARCHAR(10),
    hospital_id VARCHAR(10),
    quantity INT,
    sale_date DATE,
    total_price DECIMAL(12,2)
);

DESC Payments;

SELECT COUNT(*) FROM Payments;

ALTER TABLE Payments
CHANGE COLUMN payment_method payment_mode VARCHAR(50);

SELECT COUNT(*) FROM Hospitals;
SELECT COUNT(*) FROM Departments;
SELECT COUNT(*) FROM Doctors;
SELECT COUNT(*) FROM Patients;
SELECT COUNT(*) FROM Rooms;
SELECT COUNT(*) FROM Appointments;
SELECT COUNT(*) FROM Admissions;
SELECT COUNT(*) FROM Treatments;
SELECT COUNT(*) FROM Insurance;
SELECT COUNT(*) FROM Medicines;
SELECT COUNT(*) FROM Pharmacy;
SELECT COUNT(*) FROM Laboratory;
SELECT COUNT(*) FROM Employees;
SELECT COUNT(*) FROM Billing;
SELECT COUNT(*) FROM Payments;


DESC Hospitals;
DESC Departments;
DESC Doctors;
DESC Patients;
DESC Appointments;
DESC Admissions;
DESC Treatments;
DESC Insurance;
DESC Medicines;
DESC Pharmacy;
DESC Laboratory;
DESC Employees;
DESC Billing;
DESC Payments;

SHOW CREATE TABLE Departments;
SHOW CREATE TABLE Doctors;
SHOW CREATE TABLE Appointments;
SHOW CREATE TABLE Admissions;
SHOW CREATE TABLE Treatments;
SHOW CREATE TABLE Pharmacy;
SHOW CREATE TABLE Employees;
SHOW CREATE TABLE Billing;
SHOW CREATE TABLE Payments;


-- Departments → Hospitals
ALTER TABLE Departments
ADD CONSTRAINT fk_departments_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Doctors → Departments
ALTER TABLE Doctors
ADD CONSTRAINT fk_doctors_department
FOREIGN KEY (department_id)
REFERENCES Departments(department_id);

-- Doctors → Hospitals
ALTER TABLE Doctors
ADD CONSTRAINT fk_doctors_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Rooms → Hospitals
ALTER TABLE Rooms
ADD CONSTRAINT fk_rooms_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Appointments → Patients
ALTER TABLE Appointments
ADD CONSTRAINT fk_appointments_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Appointments → Doctors
ALTER TABLE Appointments
ADD CONSTRAINT fk_appointments_doctor
FOREIGN KEY (doctor_id)
REFERENCES Doctors(doctor_id);

-- Appointments → Hospitals
ALTER TABLE Appointments
ADD CONSTRAINT fk_appointments_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Admissions → Patients
ALTER TABLE Admissions
ADD CONSTRAINT fk_admissions_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Admissions → Hospitals
ALTER TABLE Admissions
ADD CONSTRAINT fk_admissions_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Admissions → Departments
ALTER TABLE Admissions
ADD CONSTRAINT fk_admissions_department
FOREIGN KEY (department_id)
REFERENCES Departments(department_id);

-- Admissions → Rooms
ALTER TABLE Admissions
ADD CONSTRAINT fk_admissions_room
FOREIGN KEY (room_id)
REFERENCES Rooms(room_id);

-- Treatments → Admissions
ALTER TABLE Treatments
ADD CONSTRAINT fk_treatments_admission
FOREIGN KEY (admission_id)
REFERENCES Admissions(admission_id);

-- Treatments → Patients
ALTER TABLE Treatments
ADD CONSTRAINT fk_treatments_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Treatments → Doctors
ALTER TABLE Treatments
ADD CONSTRAINT fk_treatments_doctor
FOREIGN KEY (doctor_id)
REFERENCES Doctors(doctor_id);

-- Insurance → Patients
ALTER TABLE Insurance
ADD CONSTRAINT fk_insurance_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Pharmacy → Patients
ALTER TABLE Pharmacy
ADD CONSTRAINT fk_pharmacy_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Pharmacy → Medicines
ALTER TABLE Pharmacy
ADD CONSTRAINT fk_pharmacy_medicine
FOREIGN KEY (medicine_id)
REFERENCES Medicines(medicine_id);

-- Pharmacy → Hospitals
ALTER TABLE Pharmacy
ADD CONSTRAINT fk_pharmacy_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Laboratory → Patients
ALTER TABLE Laboratory
ADD CONSTRAINT fk_laboratory_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Laboratory → Doctors
ALTER TABLE Laboratory
ADD CONSTRAINT fk_laboratory_doctor
FOREIGN KEY (doctor_id)
REFERENCES Doctors(doctor_id);

-- Employees → Departments
ALTER TABLE Employees
ADD CONSTRAINT fk_employees_department
FOREIGN KEY (department_id)
REFERENCES Departments(department_id);

-- Employees → Hospitals
ALTER TABLE Employees
ADD CONSTRAINT fk_employees_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

-- Billing → Patients
ALTER TABLE Billing
ADD CONSTRAINT fk_billing_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);

-- Billing → Admissions
ALTER TABLE Billing
ADD CONSTRAINT fk_billing_admission
FOREIGN KEY (admission_id)
REFERENCES Admissions(admission_id);

-- Payments → Billing
ALTER TABLE Payments
ADD CONSTRAINT fk_payments_bill
FOREIGN KEY (bill_id)
REFERENCES Billing(bill_id);

-- Payments → Patients
ALTER TABLE Payments
ADD CONSTRAINT fk_payments_patient
FOREIGN KEY (patient_id)
REFERENCES Patients(patient_id);


SELECT DISTINCT department_id
FROM Doctors
WHERE department_id NOT IN (SELECT department_id FROM Departments);

SELECT DISTINCT department_id
FROM Doctors
WHERE department_id NOT IN (SELECT department_id FROM Departments);

ALTER TABLE Doctors
ADD CONSTRAINT fk_doctors_hospital
FOREIGN KEY (hospital_id)
REFERENCES Hospitals(hospital_id);

SHOW CREATE TABLE Doctors;

SELECT CONSTRAINT_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'medicare'
AND TABLE_NAME = 'Doctors'
AND CONSTRAINT_TYPE = 'FOREIGN KEY';

SELECT DISTINCT admission_id
FROM Billing
WHERE admission_id IS NOT NULL
AND admission_id NOT IN (
    SELECT admission_id
    FROM Admissions
);

SELECT COUNT(*) AS orphan_admissions
FROM Billing
WHERE admission_id IS NOT NULL
AND admission_id NOT IN (
    SELECT admission_id
    FROM Admissions
);

UPDATE Billing
SET admission_id = NULL
WHERE admission_id NOT IN (
    SELECT admission_id
    FROM Admissions
);

SELECT COUNT(*)
FROM Billing
WHERE admission_id IS NOT NULL
AND admission_id NOT IN (
    SELECT admission_id
    FROM Admissions
);

ALTER TABLE Billing
ADD CONSTRAINT fk_billing_admission
FOREIGN KEY (admission_id)
REFERENCES Admissions(admission_id);

SELECT COUNT(*) AS orphan_count
FROM Billing
WHERE admission_id IS NOT NULL
AND admission_id NOT IN (
    SELECT admission_id
    FROM Admissions
);

SELECT admission_id
FROM Billing
WHERE admission_id IS NOT NULL
LIMIT 10;

SELECT admission_id
FROM Admissions
WHERE admission_id IS NOT NULL
LIMIT 10;

ALTER TABLE Departments
ADD CONSTRAINT fk_departments_head_doctor
FOREIGN KEY (head_doctor_id)
REFERENCES Doctors(doctor_id);

ALTER TABLE Admissions
ADD CONSTRAINT fk_admissions_doctor
FOREIGN KEY (admitting_doctor_id)
REFERENCES Doctors(doctor_id);

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'medicare'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'medicare'
  AND CONSTRAINT_NAME = 'PRIMARY'
ORDER BY TABLE_NAME; 

SELECT DISTINCT head_doctor_id
FROM Departments
WHERE head_doctor_id IS NOT NULL
AND head_doctor_id NOT IN (
    SELECT doctor_id
    FROM Doctors
);

SELECT DISTINCT admitting_doctor_id
FROM Admissions
WHERE admitting_doctor_id IS NOT NULL
AND admitting_doctor_id NOT IN (
    SELECT doctor_id
    FROM Doctors
);

SELECT COUNT(*) AS doctors_count
FROM Doctors;

SELECT doctor_id, COUNT(*) AS count
FROM Doctors
GROUP BY doctor_id
HAVING COUNT(*) > 1;

CREATE TABLE Doctors_Staging LIKE Doctors;

SELECT COUNT(*) AS staging_doctors_count
FROM Doctors_Staging;

SELECT
    d.head_doctor_id,
    s.doctor_id
FROM Departments d
LEFT JOIN Doctors_Staging s
    ON d.head_doctor_id = s.doctor_id
WHERE d.head_doctor_id IS NOT NULL
  AND s.doctor_id IS NULL;
  
  SELECT doctor_id, first_name, last_name, hospital_id, department_id
FROM Doctors_Staging
WHERE doctor_id IN ('DR00286', 'DR00063', 'DR00339');

SELECT head_doctor_id
FROM Departments
WHERE head_doctor_id IS NOT NULL
AND head_doctor_id NOT IN (
    SELECT doctor_id
    FROM Doctors
);

SELECT doctor_id
FROM Doctors
WHERE doctor_id LIKE '%0063%'
   OR doctor_id LIKE '%0033%'
   OR doctor_id LIKE '%0286%'
   OR doctor_id LIKE '%0339%';
   
   
SELECT head_doctor_id
FROM Departments
WHERE head_doctor_id IS NOT NULL
AND head_doctor_id NOT IN (
    SELECT doctor_id
    FROM Doctors
);

SELECT 'Hospitals' AS table_name, COUNT(*) AS row_count FROM Hospitals
UNION ALL
SELECT 'Departments', COUNT(*) FROM Departments
UNION ALL
SELECT 'Doctors', COUNT(*) FROM Doctors
UNION ALL
SELECT 'Patients', COUNT(*) FROM Patients
UNION ALL
SELECT 'Rooms', COUNT(*) FROM Rooms
UNION ALL
SELECT 'Appointments', COUNT(*) FROM Appointments
UNION ALL
SELECT 'Admissions', COUNT(*) FROM Admissions
UNION ALL
SELECT 'Treatments', COUNT(*) FROM Treatments
UNION ALL
SELECT 'Insurance', COUNT(*) FROM Insurance
UNION ALL
SELECT 'Medicines', COUNT(*) FROM Medicines
UNION ALL
SELECT 'Pharmacy', COUNT(*) FROM Pharmacy
UNION ALL
SELECT 'Laboratory', COUNT(*) FROM Laboratory
UNION ALL
SELECT 'Employees', COUNT(*) FROM Employees
UNION ALL
SELECT 'Billing', COUNT(*) FROM Billing
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments;

SELECT hospital_id, COUNT(*) AS duplicate_count
FROM Hospitals
GROUP BY hospital_id
HAVING COUNT(*) > 1;

SELECT department_id, COUNT(*) AS duplicate_count
FROM Departments
GROUP BY department_id
HAVING COUNT(*) > 1;

SELECT doctor_id, COUNT(*) AS duplicate_count
FROM Doctors
GROUP BY doctor_id
HAVING COUNT(*) > 1;

SELECT patient_id, COUNT(*) AS duplicate_count
FROM Patients
GROUP BY patient_id
HAVING COUNT(*) > 1;

SELECT room_id, COUNT(*) AS duplicate_count
FROM Rooms
GROUP BY room_id
HAVING COUNT(*) > 1;

SELECT appointment_id, COUNT(*) AS duplicate_count
FROM Appointments
GROUP BY appointment_id
HAVING COUNT(*) > 1;

SELECT admission_id, COUNT(*) AS duplicate_count
FROM Admissions
GROUP BY admission_id
HAVING COUNT(*) > 1;

SELECT treatment_id, COUNT(*) AS duplicate_count
FROM Treatments
GROUP BY treatment_id
HAVING COUNT(*) > 1;

SELECT insurance_id, COUNT(*) AS duplicate_count
FROM Insurance
GROUP BY insurance_id
HAVING COUNT(*) > 1;

SELECT medicine_id, COUNT(*) AS duplicate_count
FROM Medicines
GROUP BY medicine_id
HAVING COUNT(*) > 1;

SELECT pharmacy_sale_id, COUNT(*) AS duplicate_count
FROM Pharmacy
GROUP BY pharmacy_sale_id
HAVING COUNT(*) > 1;

SELECT lab_test_id, COUNT(*) AS duplicate_count
FROM Laboratory
GROUP BY lab_test_id
HAVING COUNT(*) > 1;

DESC Laboratory;

SELECT lab_id, COUNT(*) AS duplicate_count
FROM Laboratory
GROUP BY lab_id
HAVING COUNT(*) > 1;

SELECT employee_id, COUNT(*) AS duplicate_count
FROM Employees
GROUP BY employee_id
HAVING COUNT(*) > 1;

SELECT bill_id, COUNT(*) AS duplicate_count
FROM Billing
GROUP BY bill_id
HAVING COUNT(*) > 1;

SELECT payment_id, COUNT(*) AS duplicate_count
FROM Payments
GROUP BY payment_id
HAVING COUNT(*) > 1;


SELECT * FROM Laboratory LIMIT 5;

SELECT COUNT(*) AS total_rows FROM Laboratory;

SELECT lab_test_id
FROM Laboratory
GROUP BY lab_test_id;

SHOW COLUMNS FROM Laboratory;


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
    