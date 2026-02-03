CREATE TABLE employee (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary   INT,
    score    INT
);

INSERT INTO employee VALUES
(1, 'Sahil',   80000, 85),
(2, 'Rahul',     35000, 72),
(3, 'Bunty', 40000, 60),
(4, 'Krishna',   45000, 48),
(5, 'Radha',   38000, 55

select * from employee;


-- Example 1 : For loop (Simple Iteration)
Do $$
Declare 
	i INT;
Begin
	For i in 1..5 LOOP
		Raise notice 'Execution cycle number: %',i;
	end LOOP;
END $$;


-- Example 2 : For loop with query(Row-by-Row processing)
Do $$ 
Declare
	rec RECORD;
Begin
	For rec in select emp_id, emp_name from employee LOOP
		Raise notice 'Employee ID: %, Name: %',rec.emp_id,rec.emp_name;
	End LOOP;
End $$;


-- Example 3 : While LOOP - Conditional Iteration
Do $$
Declare 
	counter INT := 1;
Begin 
	WHILE counter <= 3 LOOP
		Raise Notice 'While loop execution: %',counter;
		counter := counter + 1 ;
	End LOOP;
End $$;


-- Example 4 : LOOP with EXIT WHEN
Do $$
Declare
	i INT := 1;
Begin 
	LOOP
		Raise notice 'LOOP execution number: %',i;
		i := i+1;

		Exit WHEN i > 4;
	END LOOP;
END $$;


-- Example 5 : Salary increment Using For LOOP
Do $$
Declare
	rec RECORD;
Begin
	For rec in select emp_id FROM employee LOOP
		UPDATE employee
		SET salary = salary + 5000
		WHERE emp_id = rec.emp_id;

		Raise notice 'Salary incremented for Employee ID %', rec.emp_id;
	END LOOP;
END $$;

select * from employee;  -- Salary updated by 5000(Everyone)


-- Example 6 : Combining LOOP and IF Condition
Do $$ 
Declare
	rec RECORD;
Begin
	For rec in select emp_name, score From employee LOOP

		IF rec.score >= 75 THEN 
			Raise NOTICE '% -> Grade: Distinction', rec.emp_name;
		ELSIF rec.score >= 60 THEN 
			Raise NOTICE '% -> Grade: First Class', rec.emp_name;
		ELSE
			Raise NOTICE '% -> Grade: Pass', rec.emp_name;
		End if;
	End LOOP;
End $$;