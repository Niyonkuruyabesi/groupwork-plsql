DECLARE
    total NUMBER;
BEGIN
    total := hospital_pkg.count_admitted;
    DBMS_OUTPUT.PUT_LINE('Admitted patients: ' || total);
END;
/
