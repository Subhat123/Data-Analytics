-- Medicare SQL Project
-- Table row counts, DESC, and SHOW CREATE TABLE checks.

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
