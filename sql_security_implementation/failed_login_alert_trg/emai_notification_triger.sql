CREATE OR REPLACE PROCEDURE send_security_email (
    p_user IN VARCHAR2,
    p_count IN NUMBER
) AS
BEGIN
    UTL_MAIL.send(
        sender     => 'alerts@company.com',
        recipients => 'securityteam@example.com',
        subject    => 'Security Alert: Failed Login Attempts',
        message    => 'User ' || p_user || ' has ' || p_count || ' failed login attempts today.'
    );
END;
/
