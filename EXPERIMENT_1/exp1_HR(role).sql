select * from project;
ALTER TABLE Project
ADD project_status VARCHAR(20);

-- Update values in new column
UPDATE Project
SET project_status = 'In Progress';

-- Verify change
SELECT * FROM Project;

-- Dropping the project TAble 
drop table project;