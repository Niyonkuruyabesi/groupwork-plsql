# groupwork-plsql
hospital management package and login audit&amp; security alert sustem


Hospital Management PL/SQL Package


Overview

This project implements a Hospital Management System using PL/SQL in an Oracle database.
It provides functionality to efficiently manage patients and doctors, including bulk insertion of patient records, displaying patient information, admitting patients, and tracking admitted patients.

Features

Patient Management

Store patient details (ID, name, age, gender, admitted status)

Admit patients and track their admission status

Doctor Management

Store doctor details (ID, name, specialty)

Bulk Operations

Efficient bulk insertion of multiple patient records using PL/SQL collections

Query Functions

Display all patients

Count the number of admitted patients

Database Objects

Tables

patients – Stores patient information

doctors – Stores doctor information


PL/SQL Package: hospital_pkg

Procedures

bulk_load_patients(p_patients IN patient_table) – Inserts multiple patients at once

admit_patient(p_id IN NUMBER) – Updates a patient’s admitted status to 'YES'

Functions

show_all_patients RETURN SYS_REFCURSOR – Returns all patients

count_admitted RETURN NUMBER – Returns the count of admitted patients



Bulk Insert Patients

```sql
DECLARE
    l_patients hospital_pkg.patient_table := hospital_pkg.patient_table();
BEGIN
    -- Add patient records to the collection
    -- Call hospital_pkg.bulk_load_patients(l_patients);
END;
```
Display All Patients
```sql
l_rc := hospital_pkg.show_all_patients;
```
Admit a Patient
```sql
hospital_pkg.admit_patient(2);
```
Count Admitted Patients
```sql
total := hospital_pkg.count_admitted;
```
