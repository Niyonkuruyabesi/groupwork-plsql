-- PATIENTS table
CREATE TABLE patients (
    patient_id     NUMBER PRIMARY KEY,
    patient_name   VARCHAR2(100),
    age            NUMBER(3),
    gender         VARCHAR2(10),
    admitted       VARCHAR2(3) DEFAULT 'NO'   -- values: YES / NO
);

-- DOCTORS table
CREATE TABLE doctors (
    doctor_id     NUMBER PRIMARY KEY,
    doctor_name   VARCHAR2(100),
    specialty     VARCHAR2(50)
);
