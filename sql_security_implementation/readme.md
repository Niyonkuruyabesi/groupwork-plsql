Login Security Monitoring System

A database solution for monitoring suspicious login behavior and enforcing security policies.

Project Overview

This project implements a database-level security monitoring system to detect and record suspicious login attempts. The system tracks all login activity, identifies repeated failed attempts, and generates security alerts automatically.

Objectives

Record every login attempt (success or failure).

Detect when a user exceeds the allowed number of failed attempts in a day.

Automatically generate security alerts for suspicious behavior.

(Optional) Send an email notification to the security team.

Database Objects

1. login_audit Table

Stores all login attempts.

Column	Description

audit_id	Unique identifier for each login attempt

username	Username used in the login attempt

attempt_time	Timestamp of the attempt

status	SUCCESS or FAILED

ip_address	Optional: IP or device information


2. security_alerts Table

Stores generated alerts when suspicious behavior is detected.

Column	Description

alert_id	Unique identifier for each alert

username	User who triggered the alert

failed_attempts	Number of failed attempts detected

alert_time	Timestamp when the alert was created

alert_message	Description of the alert

contact_email	Email to notify Trigger Logic

A compound trigger on login_audit performs the following tasks:

After each login attempt is recorded, it checks how many failed attempts the user has made today.

If the user exceeds 2 failed attempts (i.e., fails 3 or more times), the system inserts a record into security_alerts.

Optional: The trigger can call a stored procedure to send an email notification.

This prevents the common Oracle error ORA-04091 (mutating table) by separating row-level and statement-level logic.

Expected System Behavior

Condition	System Action

1–2 failed login attempts	Stored only in login_audit

3rd failed attempt	security_alerts entry created

3 failed attempts	Additional alerts created (Optional: one per day)

Successful login	Recorded normally without alerts

 Testing the System
 
Insert test login attempts:
```sql
INSERT INTO login_audit (username, status) VALUES ('john', 'FAILED');
INSERT INTO login_audit (username, status) VALUES ('john', 'FAILED');
INSERT INTO login_audit (username, status) VALUES ('john', 'FAILED');  -- Triggers alert
```
Check alerts:
```sql
SELECT * FROM security_alerts;
```
Optional Email Notification (Advanced Feature)

A stored procedure using UTL_MAIL or UTL_SMTP can automatically notify the security team whenever an alert is generated.

Example message:

User honette has exceeded 3 failed login attempts today.

