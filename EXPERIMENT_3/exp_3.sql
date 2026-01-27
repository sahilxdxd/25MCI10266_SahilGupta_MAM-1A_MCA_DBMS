CREATE TABLE SCHEMA_ANALYSIS(
	report_id INT PRIMARY KEY,
    entity_name VARCHAR(50) NOT NULL,
    violation_count INT NOT NULL
);
INSERT INTO SCHEMA_ANALYSIS VALUES
(1, 'User_Schema', 0),
(2, 'Order_Schema', 2),
(3, 'Payment_Schema', 3),
(4, 'Inventory_Schema', 1),
(5, 'Audit_Schema', 10);

SELECT*FROM SCHEMA_ANALYSIS;

-- Step -1  : CLASSIFYING DATA USING CASE EXPRESSION
SELECT *,
CASE 
    WHEN violation_count = 0 THEN 'NO VIOLATION'
    WHEN violation_count BETWEEN 1 AND 2 THEN 'MINOR VIOLATION'
    ELSE 'CRITICAL VIOLATION'
END AS VIOLATION_CATEGORY
FROM SCHEMA_ANALYSIS;
-- Step -2 : Applying CASE Logic in Data Updates
ALTER TABLE SCHEMA_ANALYSIS
ADD COLUMN approval_status VARCHAR(20);

UPDATE SCHEMA_ANALYSIS
SET approval_status =
CASE
    WHEN violation_count = 0 THEN 'Approved'
    WHEN violation_count BETWEEN 1 AND 2 THEN 'Review'
    ELSE 'Rejected'
END;

-- Step -3 : Implementing IF–ELSE Logic Using PL/pgSQL

DO $$
DECLARE
    v_violation_count INT := 0;   -- change value to test
BEGIN
    IF v_violation_count = 0 THEN
        RAISE NOTICE 'Status: Approved (No Violations)';
    ELSIF v_violation_count BETWEEN 1 AND 2 THEN
        RAISE NOTICE 'Status: Review (Minor Violations)';
    ELSE
        RAISE NOTICE 'Status: Rejected (Critical Violations)';
    END IF;
END $$;
