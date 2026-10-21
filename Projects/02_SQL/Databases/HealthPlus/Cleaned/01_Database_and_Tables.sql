CREATE DATABASE HealthPlus_Care_DB;
USE HealthPlus_Care_DB;

CREATE TABLE Clinics (
    clinic_id VARCHAR(10) PRIMARY KEY,
    clinic_name VARCHAR(150),
    clinic_type VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    established_year INT,
    contact_number VARCHAR(20)
);

CREATE TABLE Members (
    member_id VARCHAR(15) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(20),
    date_of_birth DATE,
    age INT,
    city VARCHAR(100),
    membership_type VARCHAR(50),
    registration_date DATE,
    phone_number VARCHAR(20),
    email VARCHAR(150)
);

CREATE TABLE Corporates (
    corporate_id VARCHAR(10) PRIMARY KEY,
    company_name VARCHAR(150),
    industry VARCHAR(100),
    city VARCHAR(100),
    contract_start_date DATE,
    contract_end_date DATE,
    employee_count INT
);

CREATE TABLE Specialists (
    specialist_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(20),
    specialization VARCHAR(100),
    clinic_id VARCHAR(10),
    qualification VARCHAR(100),
    experience_years INT,
    consultation_fee DECIMAL(10,2),

    CONSTRAINT fk_specialist_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Corporate_Members (
    corporate_member_id VARCHAR(15) PRIMARY KEY,
    corporate_id VARCHAR(10),
    member_id VARCHAR(15),
    designation VARCHAR(100),
    enrollment_date DATE,

    CONSTRAINT fk_corporate_member_corporate
        FOREIGN KEY (corporate_id)
        REFERENCES Corporates(corporate_id),

    CONSTRAINT fk_corporate_member_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

CREATE TABLE Consultations (
    consultation_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    specialist_id VARCHAR(10),
    clinic_id VARCHAR(10),
    consultation_date DATE,
    consultation_mode VARCHAR(30),
    status VARCHAR(30),
    reason_for_visit VARCHAR(255),

    CONSTRAINT fk_consultation_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_consultation_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES Specialists(specialist_id),

    CONSTRAINT fk_consultation_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Telemedicine_Sessions (
    session_id VARCHAR(15) PRIMARY KEY,
    consultation_id VARCHAR(15),
    session_start_time DATETIME,
    session_end_time DATETIME,
    platform VARCHAR(50),
    connection_quality VARCHAR(30),
    session_status VARCHAR(30),

    CONSTRAINT fk_telemedicine_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

CREATE TABLE Chronic_Care_Programs (
    program_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    specialist_id VARCHAR(10),
    condition_name VARCHAR(150),
    enrollment_date DATE,
    program_status VARCHAR(30),
    next_review_date DATE,

    CONSTRAINT fk_chronic_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_chronic_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES Specialists(specialist_id)
);

CREATE TABLE Health_Packages (
    package_id VARCHAR(10) PRIMARY KEY,
    package_name VARCHAR(150),
    package_type VARCHAR(50),
    price DECIMAL(10,2),
    validity_days INT,
    tests_included INT
);

CREATE TABLE Package_Subscriptions (
    subscription_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    package_id VARCHAR(10),
    subscription_date DATE,
    expiry_date DATE,
    payment_status VARCHAR(30),

    CONSTRAINT fk_subscription_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_subscription_package
        FOREIGN KEY (package_id)
        REFERENCES Health_Packages(package_id)
);

CREATE TABLE Prescriptions (
    prescription_id VARCHAR(15) PRIMARY KEY,
    consultation_id VARCHAR(15),
    member_id VARCHAR(15),
    specialist_id VARCHAR(10),
    medicine_name VARCHAR(150),
    dosage VARCHAR(100),
    duration_days INT,
    prescribed_date DATE,

    CONSTRAINT fk_prescription_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id),

    CONSTRAINT fk_prescription_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_prescription_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES Specialists(specialist_id)
);

CREATE TABLE Lab_Tests (
    lab_test_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    clinic_id VARCHAR(10),
    test_name VARCHAR(150),
    test_date DATE,
    test_result VARCHAR(100),
    test_cost DECIMAL(12,2),
    test_status VARCHAR(30),

    CONSTRAINT fk_labtest_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_labtest_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Claims (
    claim_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    consultation_id VARCHAR(15),
    claim_amount DECIMAL(12,2),
    claim_date DATE,
    claim_status VARCHAR(30),
    insurance_provider VARCHAR(150),

    CONSTRAINT fk_claim_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_claim_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

CREATE TABLE Staff (
    staff_id VARCHAR(15) PRIMARY KEY,
    clinic_id VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    designation VARCHAR(100),
    employment_type VARCHAR(50),
    salary DECIMAL(12,2),
    joining_date DATE,

    CONSTRAINT fk_staff_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES Clinics(clinic_id)
);

CREATE TABLE Billing (
    bill_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    consultation_id VARCHAR(15),
    bill_date DATE,
    consultation_charges DECIMAL(12,2),
    lab_charges DECIMAL(12,2),
    medicine_charges DECIMAL(12,2),
    total_amount DECIMAL(12,2),
    bill_status VARCHAR(30),

    CONSTRAINT fk_health_billing_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_health_billing_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
);

CREATE TABLE Payments (
    payment_id VARCHAR(15) PRIMARY KEY,
    bill_id VARCHAR(15),
    member_id VARCHAR(15),
    payment_date DATE,
    payment_amount DECIMAL(12,2),
    payment_mode VARCHAR(50),
    payment_status VARCHAR(30),

    CONSTRAINT fk_health_payment_bill
        FOREIGN KEY (bill_id)
        REFERENCES Billing(bill_id),

    CONSTRAINT fk_health_payment_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

CREATE TABLE Feedback (
    feedback_id VARCHAR(15) PRIMARY KEY,
    member_id VARCHAR(15),
    consultation_id VARCHAR(15),
    rating INT,
    feedback_text TEXT,
    feedback_date DATE,

    CONSTRAINT fk_feedback_member
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id),

    CONSTRAINT fk_feedback_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultations(consultation_id)
