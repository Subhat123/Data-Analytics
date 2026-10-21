-- Medicare SQL Project
-- ALTER TABLE changes and initial table checks.

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
