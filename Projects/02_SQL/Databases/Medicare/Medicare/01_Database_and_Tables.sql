-- Medicare SQL Project
-- Database selection and CREATE TABLE statements.

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
