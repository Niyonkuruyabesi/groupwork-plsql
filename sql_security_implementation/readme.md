# Login Audit & Security Alert System

1. Project Overview

This project implements a login monitoring and security alert system in Oracle Database to strengthen system security. The system tracks user login attempts and generates alerts for suspicious activity based on failed login attempts.

The system is designed to:

Record all login attempts (success or failure).

Detect users with multiple failed login attempts within the same session/day.

Automatically generate security alerts for suspicious behavior.

Optionally, send email notifications to the security team.

2. Database Tables
   
1. login_audit

Stores all login attempts with details:

Column Name	Data Type	Description

username	VARCHAR2	User attempting login

attempt_time	DATE	Time of login attempt

status	VARCHAR2	SUCCESS / FAILED

ip_address	VARCHAR2	IP address or device info (optional)

2. security_alerts

Stores alerts triggered by suspicious activity:

Column Name	Data Type	Description

username	VARCHAR2	User causing alert

number_of_failed_attempts	NUMBER	Number of failed attempts

alert_time	DATE	Time alert is generated

alert_message	VARCHAR2	Description of suspicious activity

contact_email	VARCHAR2	Email to notify security team

Triggers & Procedures

1. Login Attempt Trigger

Fires after each login attempt recorded in login_audit.

Counts failed login attempts for the same user within the same day.

Inserts a new record into security_alerts if failed attempts exceed 2.

2. Security Alert Email Trigger (Optional)

Fires after an insert in security_alerts.

Calls a stored procedure send_security_alert_email to send an email notification to the security team using UTL_MAIL.

Note: If UTL_MAIL is not available, the trigger can log alert notifications to a table instead of sending real emails.

Installation Steps

Create Tables

CREATE TABLE login_audit (...);

CREATE TABLE security_alerts (...);


Create Triggers

CREATE OR REPLACE TRIGGER trg_login_audit_failed AFTER INSERT ON login_audit ...

CREATE OR REPLACE TRIGGER trg_send_alert_email AFTER INSERT ON security_alerts ...


Create Email Procedure (Optional)

CREATE OR REPLACE PROCEDURE send_security_alert_email(...) AS ...


Configure Email (Optional)

Install UTL_MAIL if not available.

Set SMTP server:

ALTER SYSTEM SET smtp_out_server = 'smtp.yourdomain.com' SCOPE=BOTH;

Usage

Insert login attempts into login_audit:

INSERT INTO login_audit (username, attempt_time, status, ip_address)

VALUES ('john_doe', SYSDATE, 'FAILED', '192.168.1.10');


If a user fails 3 or more times in a day, a new record is automatically inserted into security_alerts.

(Optional) Security team receives an email alert about the suspicious activity.
