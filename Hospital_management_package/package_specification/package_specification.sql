CREATE OR REPLACE PACKAGE hospital_pkg IS
    
    -- Collection type for bulk patient loading
    TYPE patient_rec IS RECORD (
        patient_id    patients.patient_id%TYPE,
        patient_name  patients.patient_name%TYPE,
        age           patients.age%TYPE,
        gender        patients.gender%TYPE
    );

    TYPE patient_table IS TABLE OF patient_rec;

    -- Procedure to bulk insert patients
    PROCEDURE bulk_load_patients(p_patients IN patient_table);

    -- Function to return all patients (cursor)
    FUNCTION show_all_patients RETURN SYS_REFCURSOR;

    -- Function to count admitted patients
    FUNCTION count_admitted RETURN NUMBER;

    -- Procedure to admit a patient (update admitted='YES')
    PROCEDURE admit_patient(p_id IN NUMBER);

END hospital_pkg;
/
