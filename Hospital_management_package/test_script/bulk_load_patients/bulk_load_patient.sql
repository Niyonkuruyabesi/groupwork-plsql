DECLARE
    l_patients hospital_pkg.patient_table := hospital_pkg.patient_table();
BEGIN
    -- Add sample patients to collection
    l_patients.EXTEND(3);

    l_patients(1).patient_id := 1;
    l_patients(1).patient_name := 'John Doe';
    l_patients(1).age := 30;
    l_patients(1).gender := 'Male';

    l_patients(2).patient_id := 2;
    l_patients(2).patient_name := 'Alice Kay';
    l_patients(2).age := 25;
    l_patients(2).gender := 'Female';

    l_patients(3).patient_id := 3;
    l_patients(3).patient_name := 'Brian Kim';
    l_patients(3).age := 40;
    l_patients(3).gender := 'Male';

    -- Call bulk insert procedure
    hospital_pkg.bulk_load_patients(l_patients);

    DBMS_OUTPUT.PUT_LINE('Bulk load complete.');
END;
/
