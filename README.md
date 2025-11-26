# groupwork-plsql

Group Members

1. IGINAREZA Honette 27707
2. MUTUYIMANA Evelyne 27701
3. NIYONKURU NYIRIMPETA Yabesi 27715
4. ARAJE Divin 26461
5. NIYIBIZI Olivier 28248
6. GATETE Odry 28450

# groupwork-plsql

A combined PL/SQL project containing two major components:

1. **Hospital Management Package**  
2. **SQL Security & Login Audit Implementation**

This repository provides Oracle PL/SQL modules for hospital data management and a security subsystem for monitoring user login behaviour.

---
---

##  Overview

### **1. Hospital Management Package**

This module contains PL/SQL packages and SQL scripts that support hospital operations, including:

- Patient registration  
- Doctor & staff information  
- Admission management  
- Appointment handling  
- Bulk patient processing  
- Data display procedures

The objective is to create a modular, reusable PL/SQL package that supports daily hospital operations.

---

### **2. SQL Security & Login Audit Implementation**

This module implements an organizational security policy requiring the system to:

> “Record and alert whenever a user attempts more than **two failed login attempts** in the same session or day.”

It includes:

- `login_audit` table  
- Trigger to detect and record failed logins  
- Trigger to generate security alerts  
- Logging of username, timestamp, status, session ID, etc.

This ensures accountability, intrusion detection, and compliance with internal policies.

---

