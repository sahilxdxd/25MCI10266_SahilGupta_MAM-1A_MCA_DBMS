# WORKSHEET 10 – SQL Transactions and Rollback

## Student Information
- **Name:** Sahil Gupta  
- **UID:** 25MCI10266  
- **Branch:** MCA (AI & ML)  
- **Section:** 25MAM-1 A  
- **Semester:** 2nd Semester  
- **Subject:** Technical Skills  
- **Date of Performance:** 21/04/2026  

---

## AIM
To study and implement SQL transactions using **COMMIT, ROLLBACK, and SAVEPOINT** to control database changes and maintain data integrity.

---

## Software Requirement
- Oracle Database Express Edition  
- PostgreSQL  
- pgAdmin  

---

## OBJECTIVES
- Understand transaction control commands in SQL  
- Use **ROLLBACK** to undo changes  
- Use **SAVEPOINT** for partial rollback  
- Maintain consistency and integrity of database data  

---

# Practical / Experiment Steps

---

## Table Creation
```sql
CREATE TABLE Payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0)
);
```
### output : table created 
<img width="516" height="262" alt="table created" src="https://github.com/user-attachments/assets/ae60a403-b301-4e59-b1d2-1012b022c4bc" />

## step-1 
```sql
BEGIN;

UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

ROLLBACK;
```
### OUTPUT : Rollback

BEGIN: 
<img width="468" height="140" alt="begin" src="https://github.com/user-attachments/assets/80d5e9d1-b333-4cca-b42a-04af046c167d" />

Rollback Error when trying to update values which are not applicable: 
<img width="875" height="219" alt="rollback error" src="https://github.com/user-attachments/assets/9d36308f-39f8-4e2b-b695-e9b031e1afd1" />

OUTPUT: 
<img width="552" height="204" alt="after rollback " src="https://github.com/user-attachments/assets/adbdcf1e-cb88-4c3e-8935-818bb56f20a2" />

## Step 2: rollback + commit + update using checkpoints
```sql
BEGIN;

-- Update 1
UPDATE Payroll
SET salary = salary + 5000
WHERE emp_id = 1;

SAVEPOINT sp1;

-- Update 2
UPDATE Payroll
SET salary = salary + 7000
WHERE emp_id = 2;

-- Error simulation
UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

ROLLBACK TO sp1;

COMMIT;
```
## OUTPUTS

### updates :
<img width="583" height="401" alt="upadate 1 " src="https://github.com/user-attachments/assets/662b9f19-f536-4524-8228-24e40be89ecd" />

### rollback :
<img width="427" height="139" alt="savepoint " src="https://github.com/user-attachments/assets/e7d1ed5f-19eb-46d5-9a88-b8539d33d766" />

### output table : 
<img width="543" height="249" alt="table after rollback" src="https://github.com/user-attachments/assets/e1b3d90b-aba1-4b0c-bf0c-feba2145b47d" />
