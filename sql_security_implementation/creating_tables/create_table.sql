CREATE TABLE login_audit (
    audit_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username      VARCHAR2(50) NOT NULL,
    attempt_time  DATE DEFAULT SYSDATE,
    status        VARCHAR2(10) CHECK (status IN ('SUCCESS', 'FAILED')),
    ip_address    VARCHAR2(50)
);


CREATE TABLE security_alerts (
    alert_id         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username         VARCHAR2(50) NOT NULL,
    failed_attempts  NUMBER NOT NULL,
    alert_time       DATE DEFAULT SYSDATE,
    alert_message    VARCHAR2(255),
    contact_email    VARCHAR2(100)
);

