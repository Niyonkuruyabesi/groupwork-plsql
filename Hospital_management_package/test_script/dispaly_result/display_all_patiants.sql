DECLARE
    l_rc SYS_REFCURSOR;
    id   NUMBER;
    name VARCHAR2(100);
    age  NUMBER;
    gender VARCHAR2(10);
    admitted VARCHAR2(3);
BEGIN
    l_rc := hospital_pkg.show_all_patients;

    LOOP
        FETCH l_rc INTO id, name, age, gender, admitted;
        EXIT WHEN l_rc%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(id || ' - ' || name || ' - ' || age || ' - ' || gender || ' - ' || admitted);
    END LOOP;
END;
/
