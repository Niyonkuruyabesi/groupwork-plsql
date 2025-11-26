CREATE OR REPLACE PACKAGE BODY hospital_pkg IS

    -- =======================================
    -- Bulk insert patients using FORALL
    -- =======================================
    PROCEDURE bulk_load_patients(p_patients IN patient_table) IS
    BEGIN
        FORALL i IN 1 .. p_patients.COUNT
            INSERT INTO patients (patient_id, patient_name, age, gender)
            VALUES (p_patients(i).patient_id,
                    p_patients(i).patient_name,
                    p_patients(i).age,
                    p_patients(i).gender);

        COMMIT;
    END bulk_load_patients;

    -- =======================================
    -- Return all patients using a ref cursor
    -- =======================================
    FUNCTION show_all_patients RETURN SYS_REFCURSOR IS
        l_rc SYS_REFCURSOR;
    BEGIN
        OPEN l_rc FOR
            SELECT * FROM patients ORDER BY patient_id;
        RETURN l_rc;
    END show_all_patients;

    -- =======================================
    -- Count admitted patients
    -- =======================================
    FUNCTION count_admitted RETURN NUMBER IS
        l_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO l_count
        FROM patients
        WHERE admitted = 'YES';

        RETURN l_count;
    END count_admitted;

    -- =======================================
    -- Admit a specific patient
    -- =======================================
    PROCEDURE admit_patient(p_id IN NUMBER) IS
    BEGIN
        UPDATE patients
        SET admitted = 'YES'
        WHERE patient_id = p_id;

        COMMIT;
    END admit_patient;

END hospital_pkg;
/
