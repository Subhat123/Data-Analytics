-- Medicare SQL Project
-- Foreign-key constraints and related integrity diagnostics.

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
