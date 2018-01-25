--demo
-- Oracle search all tables all columns for a string
DECLARE
  match_count     INTEGER;
  v_search_string VARCHAR2(4000) := 'customer';
BEGIN
  FOR t IN
  (SELECT owner,
    table_name,
    column_name
  FROM all_tab_columns
  WHERE data_type IN ('CHAR', 'VARCHAR2', 'NCHAR', 'NVARCHAR2', 'CLOB', 'NCLOB')
  )
  LOOP
    BEGIN
      EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM '||t.owner || '.' || t.table_name|| ' WHERE '||t.column_name||' = :1' INTO match_count USING v_search_string;
      IF match_count > 0 THEN
        dbms_output.put_line( t.owner || '.' || t.table_name ||' '||t.column_name||' '||match_count );
      END IF;
    EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line( 'Error encountered trying to read ' || t.column_name || ' from ' || t.owner || '.' || t.table_name );
    END;
  END LOOP;
END;
/
----------
DESC EMPLOYEES;
DESCRIBE EMPLOYEES;
SELECT COUNT(*) FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM EMPLOYEES;
SELECT FIRST_NAME NAME, LAST_NAME AS SURNAME, EMAIL FROM EMPLOYEES;
SELECT FIRST_NAME "FIRST of His Name",
  LAST_NAME AS SURNAME,
  EMAIL
FROM EMPLOYEES;
SELECT FIRST_NAME "FIRST of His Name",
  LAST_NAME SURNAME,
  EMAIL,
  12*SALARY AS "Annual Salary"
FROM EMPLOYEES;
SELECT * FROM DUAL;
SELECT DUMMY FROM DUAL;
SELECT 'I''m Sarfaraz' AS INFO FROM DUAL;
SELECT q'[I'm Sarfaraz]' AS INFO FROM DUAL;
SELECT q'{I'm Sarfaraz}' AS INFO FROM DUAL;
SELECT COUNT(JOB_ID) FROM EMPLOYEES;                  --107
SELECT COUNT(DISTINCT JOB_ID) FROM EMPLOYEES;         --19
SELECT DISTINCT JOB_ID, DEPARTMENT_ID FROM EMPLOYEES; --20
SELECT 'I''m ' || FIRST_NAME || ' ' || LAST_NAME AS SENTENCE FROM EMPLOYEES;
SELECT 'Percentage : '||COMMISSION_PCT AS "%", COMMISSION_PCT FROM EMPLOYEES;
SELECT EMPLOYEE_ID, SALARY, SALARY + 100 * 12 AS ANNUAL_SALARY FROM EMPLOYEES;
SELECT EMPLOYEE_ID,
  SALARY,
  (SALARY + 100) * 12 AS ANNUAL_SALARY
FROM EMPLOYEES;
SELECT SYSDATE AS CURRENT_DATE FROM DUAL;
SELECT SYSDATE+3 AS FUTURE_DATE FROM DUAL;
SELECT HIRE_DATE, HIRE_DATE + 2 AS FUTURE_HIRE_DATE FROM EMPLOYEES;
SELECT SALARY,COMMISSION_PCT, COMMISSION_PCT*SALARY FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE SALARY > 1000;
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '21-MAY-07';
SELECT * FROM EMPLOYEES WHERE SALARY < 3000;
SELECT * FROM EMPLOYEES WHERE SALARY > 2000 AND SALARY < 4000;
SELECT * FROM EMPLOYEES WHERE SALARY >= 2000 AND SALARY <= 4000;
--or
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 2000 AND 4000;
SELECT * FROM EMPLOYEES WHERE JOB_ID <> 'IT_PROG';
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '21-MAY-07' AND '27-JUN-07';
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN (605,101,151,21);
SELECT * FROM EMPLOYEES WHERE FIRST_NAME IN ('Steven','David','Adam');
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE IN ('08-MAR-08', '30-JAN-05', SYSDATE);
SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%SA_%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '_r%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'B_i%';
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'SA_REP' AND SALARY > 1000;
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'SA_REP' OR SALARY > 1000;
SELECT *
FROM EMPLOYEES
WHERE JOB_ID NOT IN('SA_REP','IT_PROG')
AND SALARY        > 10000;
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
OR (JOB_ID   = 'IT_CLERK'
AND SALARY   > 5000);
SELECT *
FROM EMPLOYEES
WHERE (JOB_ID = 'IT_PROG'
OR JOB_ID     = 'IT_CLERK')
AND SALARY    > 5000;
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES ORDER BY LAST_NAME;
SELECT FIRST_NAME,LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY;
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES ORDER BY LAST_NAME ASC;
SELECT FIRST_NAME,LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY ASC;
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES ORDER BY LAST_NAME DESC;
SELECT FIRST_NAME,LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES ORDER BY LAST_NAME, FIRST_NAME ASC;
SELECT FIRST_NAME,
  LAST_NAME
FROM EMPLOYEES
ORDER BY LAST_NAME DESC,
  FIRST_NAME DESC;
SELECT FIRST_NAME,
  COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT NULLS FIRST;
SELECT FIRST_NAME,
  COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT NULLS LAST;
SELECT FIRST_NAME,
  COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT ASC NULLS FIRST;
SELECT FIRST_NAME,
  COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT DESC NULLS FIRST;
SELECT FIRST_NAME,
  COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT ASC NULLS LAST;
SELECT FIRST_NAME,
  COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT DESC NULLS LAST;
SELECT UPPER(FIRST_NAME
  ||' '
  ||LAST_NAME) AS NAME,
  LOWER(EMAIL) AS EMAIL
FROM EMPLOYEES;
SELECT CONCAT(FIRST_NAME,CONCAT(' ', LAST_NAME)) AS NAME FROM EMPLOYEES;
SELECT LENGTH(FIRST_NAME ||' '||LAST_NAME) AS NAME_LENGTH FROM EMPLOYEES;
SELECT LPAD(LENGTH(FIRST_NAME
  ||' '
  ||LAST_NAME),5,'0') AS NAME_LENGTH
FROM EMPLOYEES;
SELECT ROUND(12.345, 2) FROM DUAL;
SELECT TRUNC(12.345, 2) FROM DUAL;
SELECT CEIL(12.345) FROM DUAL;
SELECT FLOOR(12.345) FROM DUAL;
SELECT MOD(2017,4) FROM DUAL;
SELECT LOWER(CONCAT(RPAD(EMAIL,10,'*'),'@email.com')) AS EMAIL FROM EMPLOYEES;
SELECT SYSDATE, CURRENT_DATE, SESSIONTIMEZONE, CURRENT_TIMESTAMP FROM DUAL;
SELECT SYSDATE + 2 AS FUTURE,
  SYSDATE          AS PRESENT,
  SYSDATE - 2      AS PAST
FROM DUAL;
SELECT EMPLOYEE_ID,
  SYSDATE,
  HIRE_DATE,
  ROUND((SYSDATE-HIRE_DATE)/365) AS WORKING_YEARS
FROM EMPLOYEES;
SELECT SYSdate,
  add_months(sysdate, -30) AS past,
  add_months(sysdate, 30)  AS future
FROM dual;
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '08-MAR-08';
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = '100';
SELECT * FROM EMPLOYEES WHERE SALARY >= '10000';
SELECT FIRST_NAME,
  HIRE_DATE,
  TO_CHAR(HIRE_DATE,'YYYY')                   AS JOINING_YYYY,
  TO_CHAR(HIRE_DATE,'YEAR')                   AS JOINING_YEAR,
  TO_CHAR(SYSDATE,'YEAR')                     AS CURRENT_YEAR,
  TO_CHAR(SYSDATE,'MONTH')                    AS CURRENT_MONTH,
  TO_CHAR(HIRE_DATE,'MON-YYYY')               AS JOINING_YEAR,
  TO_CHAR(HIRE_DATE,'Mon-YYYY')               AS JOINING_YEAR,
  TO_CHAR(HIRE_DATE,'DD-Month-YYYY')          AS JOINING_YEAR,
  TO_CHAR(SYSDATE,'DD-MON-YYYY : HH24-MI-SS') AS JOINING_YEAR
FROM EMPLOYEES;
SELECT SALARY   * COMMISSION_PCT BEFORE_FORMAT,
  TO_CHAR(SALARY*COMMISSION_PCT, '$09,999.99') FORMATTED
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;
SELECT SALARY,
  COMMISSION_PCT,
  SALARY + SALARY*NVL(COMMISSION_PCT,0) AS CALCULATED
FROM EMPLOYEES;
SELECT FIRST_NAME,
  LAST_NAME,
  LENGTH(FIRST_NAME) AS EXP1,
  LENGTH(LAST_NAME)  AS EXP2
FROM EMPLOYEES
WHERE NULLIF(LENGTH(FIRST_NAME),LENGTH(LAST_NAME)) IS NULL;
SELECT FIRST_NAME,
  LAST_NAME,
  LENGTH(FIRST_NAME) AS EXP1,
  LENGTH(LAST_NAME)  AS EXP2
FROM EMPLOYEES
WHERE NULLIF(LENGTH(FIRST_NAME),LENGTH(LAST_NAME)) IS NOT NULL;
SELECT STATE_PROVINCE,CITY,COALESCE(STATE_PROVINCE,CITY,'NA') FROM LOCATIONS;
SELECT FIRST_NAME,
  LAST_NAME,
  JOB_ID,
  SALARY,
  HIRE_DATE,
  CASE JOB_ID
    WHEN 'ST_MAN'
    THEN 1.20*SALARY
    WHEN 'IT_PROG'
    THEN 1.30*SALARY
    WHEN 'SA_MAN'
    THEN 1.40*SALARY
    ELSE SALARY
  END "INCREMENT"
FROM EMPLOYEES
WHERE JOB_ID IN ('ST_MAN','IT_PROG','SA_MAN')
ORDER BY 6 DESC;
SELECT FIRST_NAME,
  LAST_NAME,
  JOB_ID,
  SALARY
FROM EMPLOYEES
WHERE(
  CASE
    WHEN JOB_ID = 'SA_MAN'
    AND salary  > 1000
    THEN 1
    WHEN JOB_ID = 'IT_PROG'
    AND salary  > 5000
    THEN 1
    ELSE 0
  END) = 1;
SELECT FIRST_NAME,
  LAST_NAME,
  JOB_ID,
  SALARY,
  HIRE_DATE,
  DECODE( JOB_ID, 'ST_MAN', 1.20*SALARY, 'IT_PROG', 1.30*SALARY, 'SA_MAN', 1.40*SALARY, SALARY) AS "INCREMENT"
FROM EMPLOYEES
WHERE JOB_ID IN ('ST_MAN','IT_PROG','SA_MAN')
ORDER BY 6 DESC;
SELECT ROUND(AVG(SALARY)),
  ROUND(AVG(ALL SALARY)),
  ROUND(AVG(DISTINCT SALARY))
FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY)),
  ROUND(AVG(ALL SALARY)),
  ROUND(AVG(DISTINCT SALARY))
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';
SELECT COUNT(*),
  COUNT(MANAGER_ID),
  COUNT(ALL MANAGER_ID),
  COUNT(DISTINCT MANAGER_ID)
FROM EMPLOYEES;
SELECT COUNT(*),
  COUNT(COMMISSION_PCT),
  COUNT(ALL COMMISSION_PCT),
  COUNT(DISTINCT COMMISSION_PCT),
  COUNT(NVL(COMMISSION_PCT,0)),
  COUNT(DISTINCT NVL(COMMISSION_PCT,0))
FROM EMPLOYEES;
SELECT MAX(SALARY),
  MAX(HIRE_DATE),
  MAX(FIRST_NAME),
  MAX(COMMISSION_PCT) ,
  MAX(NVL(COMMISSION_PCT,0))
FROM EMPLOYEES;
SELECT MIN(SALARY),
  MIN(HIRE_DATE),
  MIN(FIRST_NAME),
  MIN(COMMISSION_PCT) ,
  MIN(NVL(COMMISSION_PCT,0))
FROM EMPLOYEES;
SELECT SUM(SALARY), SUM(ALL SALARY), SUM(DISTINCT SALARY) FROM EMPLOYEES;
SELECT MIN(SALARY), MAX(HIRE_DATE), AVG(SALARY), COUNT(*) FROM EMPLOYEES;
--for a single job_id
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';
-- use group by Job_id to find avg for multiple job_id's
SELECT JOB_ID,
  AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;
SELECT JOB_ID,
  AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'AC_MGR','AD_VP')
GROUP BY JOB_ID;
SELECT JOB_ID,
  AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > 10000;
SELECT JOB_ID,
  AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'AC_MGR','AD_VP')
GROUP BY JOB_ID
HAVING AVG(SALARY) > 10000 ;
SELECT JOB_ID,
  AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > 6000;
SELECT JOB_ID,
  AVG(SALARY)
FROM EMPLOYEES
WHERE MANAGER_ID > 101
GROUP BY JOB_ID
HAVING AVG(SALARY) > 6000;
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
SELECT MAX(AVG(SALARY)) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
--natural join
SELECT * FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;
SELECT * FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID, MANAGER_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID
FROM EMPLOYEES NATURAL
JOIN DEPARTMENTS;
--join with using clause
SELECT *
FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  MANAGER_ID
FROM EMPLOYEES
JOIN DEPARTMENTS USING (MANAGER_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_NAME,
  MANAGER_ID
FROM EMPLOYEES
JOIN DEPARTMENTS USING (MANAGER_ID);
--use table aliases to refer to the column name to remove ambiguity
--if the same name is present in both the tables
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_NAME,
  EMP.MANAGER_ID
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP USING (DEPARTMENT_ID);
--using on clause
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_NAME,
  EMP.MANAGER_ID
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP
ON (EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID
AND EMP.MANAGER_ID    = DEP.MANAGER_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_NAME,
  MANAGER_ID
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP USING (DEPARTMENT_ID, MANAGER_ID);
--
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_NAME,
  LOC.CITY
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP
ON (EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID)
JOIN LOCATIONS LOC
ON (DEP.LOCATION_ID = LOC.LOCATION_ID);
--
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_NAME,
  LOC.CITY
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP
ON (EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID)
JOIN LOCATIONS LOC
ON (DEP.LOCATION_ID = LOC.LOCATION_ID)
WHERE LOC.CITY      = 'Oxford' ;
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_NAME,
  LOC.CITY
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP
ON (EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID)
JOIN LOCATIONS LOC
ON (DEP.LOCATION_ID   = LOC.LOCATION_ID)
AND DEP.DEPARTMENT_ID > 107 ;
SELECT FIRST_NAME,
  LAST_NAME,
  DEP.DEPARTMENT_ID,
  DEP.DEPARTMENT_NAME,
  LOC.CITY
FROM EMPLOYEES EMP
JOIN DEPARTMENTS DEP
ON (EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID)
JOIN LOCATIONS LOC
ON (DEP.LOCATION_ID   = LOC.LOCATION_ID)
WHERE LOC.CITY        = 'Oxford'
AND DEP.DEPARTMENT_ID = 80 ;
--
SELECT FIRST_NAME,
  LAST_NAME,
  SALARY,
  JOB_TITLE,
  MIN_SALARY,
  MAX_SALARY
FROM EMPLOYEES EMP
JOIN JOBS JS
ON EMP.SALARY BETWEEN JS.MIN_SALARY AND JS.MAX_SALARY;
--self join
SELECT EMP1.EMPLOYEE_ID,
  EMP1.FIRST_NAME,
  EMP1.LAST_NAME,
  EMP1.MANAGER_ID,
  EMP1.SALARY,
  EMP2.EMPLOYEE_ID,
  EMP2.FIRST_NAME,
  EMP2.LAST_NAME,
  EMP2.MANAGER_ID,
  EMP2.SALARY
FROM EMPLOYEES EMP1
JOIN EMPLOYEES EMP2
ON (EMP1.MANAGER_ID = EMP2.EMPLOYEE_ID);
--left outer join
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  DEPARTMENT_NAME
FROM EMPLOYEES
LEFT OUTER JOIN DEPARTMENTS USING (DEPARTMENT_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  dep.DEPARTMENT_ID,
  DEP.DEPARTMENT_NAME
FROM EMPLOYEES emp
LEFT OUTER JOIN DEPARTMENTS dep
ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID ;
--right outer join
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  DEPARTMENT_NAME
FROM EMPLOYEES
RIGHT OUTER JOIN DEPARTMENTS USING (DEPARTMENT_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  dep.DEPARTMENT_ID,
  DEP.DEPARTMENT_NAME
FROM EMPLOYEES emp
RIGHT OUTER JOIN DEPARTMENTS DEP
ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID ;
--Full outer join
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  DEPARTMENT_NAME
FROM EMPLOYEES
FULL OUTER JOIN DEPARTMENTS USING (DEPARTMENT_ID);
SELECT FIRST_NAME,
  LAST_NAME,
  dep.DEPARTMENT_ID,
  DEP.DEPARTMENT_NAME
FROM EMPLOYEES emp
FULL OUTER JOIN DEPARTMENTS DEP
ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID ;
SELECT FIRST_NAME,
  LAST_NAME,
  dep.DEPARTMENT_ID,
  DEP.DEPARTMENT_NAME
FROM EMPLOYEES emp
RIGHT OUTER JOIN DEPARTMENTS DEP
ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID ;
--Full outer join
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_NAME
FROM EMPLOYEES
CROSS JOIN DEPARTMENTS;
--sub-queries
SELECT EMPLOYEE_ID,
  FIRST_NAME
  ||' '
  ||LAST_NAME AS NAME,
  SALARY
FROM EMPLOYEES
WHERE SALARY >
  (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 201
  );
-- single row subqueries
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID =
  (SELECT department_id FROM employees WHERE employee_id = 201
  );
--
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID =
  (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 201
  )
AND SALARY <
  (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 201
  );
--
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE =
  (SELECT MIN(HIRE_DATE) FROM EMPLOYEES
  );
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE =
  (SELECT MAX(HIRE_DATE) FROM EMPLOYEES
  );
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE IN
  (SELECT MAX(HIRE_DATE) FROM EMPLOYEES GROUP BY DEPARTMENT_ID
  );
--Multiple row subqueries
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE SALARY IN
  (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID
  );
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE SALARY IN
  (SELECT MIN(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID
  );
----Any
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE SALARY > ANY
  (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN'
  );
----ALL
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE SALARY > ALL
  (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN'
  );
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE SALARY < ALL
  (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN'
  );
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE SALARY = ALL
  (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN'
  );
--Multiple column subqueries
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID,SALARY) IN
  (SELECT DEPARTMENT_ID,MIN(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID
  )
ORDER BY DEPARTMENT_ID;
SELECT FIRST_NAME,
  LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID,SALARY) IN
  (SELECT DEPARTMENT_ID,MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID
  )
ORDER BY DEPARTMENT_ID;
--Set Operators
-- CREATE TABLE RETIRED_EMPLOYEES AS SELECT * FROM  EMPLOYEES WHERE DEPARTMENT_ID = 60 AND COMMISSION_PCT IS NULL;
SELECT *
FROM RETIRED_EMPLOYEES
UNION
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM RETIRED_EMPLOYEES
UNION
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;
SELECT FIRST_NAME
  ||' '
  ||LAST_NAME AS "FULL NAME",
  SALARY
FROM RETIRED_EMPLOYEES
UNION
SELECT FIRST_NAME||' '||LAST_NAME AS NAME, SALARY FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM RETIRED_EMPLOYEES
UNION
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES;
SELECT * FROM RETIRED_EMPLOYEES
UNION ALL
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM RETIRED_EMPLOYEES
UNION ALL
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM RETIRED_EMPLOYEES
UNION ALL
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES;
SELECT * FROM RETIRED_EMPLOYEES
INTERSECT
SELECT * FROM EMPLOYEES;
SELECT JOB_ID FROM JOB_HISTORY
INTERSECT
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 80;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM RETIRED_EMPLOYEES
MINUS
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
MINUS
SELECT FIRST_NAME, LAST_NAME, SALARY FROM RETIRED_EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES
UNION
SELECT NULL, NULL, JOB_ID, DEPARTMENT_ID FROM JOB_HISTORY;
SELECT FIRST_NAME,
  LAST_NAME,
  JOB_ID AS Designation,
  DEPARTMENT_ID
FROM EMPLOYEES
UNION
SELECT NULL,
  NULL,
  JOB_ID,
  DEPARTMENT_ID
FROM JOB_HISTORY
ORDER BY DEPARTMENT_ID;
SELECT FIRST_NAME, LAST_NAME, JOB_ID AS D, DEPARTMENT_ID FROM EMPLOYEES
UNION
SELECT NULL, NULL, JOB_ID, DEPARTMENT_ID D FROM JOB_HISTORY ORDER BY D DESC;
--SELECT FIRST_NAME, LAST_NAME, JOB_ID , DEPARTMENT_ID  FROM EMPLOYEES UNION
--SELECT NULL, NULL, JOB_ID, DEPARTMENT_ID D  FROM JOB_HISTORY ORDER BY D DESC;
--DML statements
INSERT
INTO JOBS
  (
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY,
    MAX_SALARY
  )
  VALUES
  (
    'GR_LDR',
    'Group leader',
    8500,
    20000
  );
INSERT
INTO JOBS
  (
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY,
    MAX_SALARY
  )
  VALUES
  (
    'PR_MGR',
    'Project Manager',
    9500,
    25000
  );
INSERT INTO JOBS VALUES
  ('GR_MGR', 'Group Manager', 4500, 15000
  );
INSERT
INTO JOBS
  (
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY
  )
  VALUES
  (
    'PR_CRD1',
    'Project Co-ordinator 1',
    4500
  );
INSERT INTO JOBS VALUES
  ('PR_CRD2', 'Project Co-ordinator 2', 4500, NULL
  );
INSERT
INTO JOB_HISTORY
  (
    EMPLOYEE_ID,
    START_DATE,
    END_DATE,
    JOB_ID,
    DEPARTMENT_ID
  )
  VALUES
  (
    120,
    TO_DATE('01/05/03','DD/MM/YY'),
    SYSDATE,
    'IT_PROG',
    60
  );
INSERT INTO EMPLOYEES_COPY
SELECT * FROM EMPLOYEES;
INSERT INTO EMPLOYEES_COPY
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
INSERT
INTO EMPLOYEES_COPY
  (
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    HIRE_DATE,
    SALARY
  )
SELECT EMPLOYEE_ID,
  FIRST_NAME,
  LAST_NAME,
  EMAIL,
  HIRE_DATE,
  SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

INSERT INTO EMPLOYEES_ADDRESSES
SELECT 
  EMPLOYEE_ID,
  FIRST_NAME,
  LAST_NAME,
  CITY||' '|| STREET_ADDRESS AS "ADDRESS"
FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID)
JOIN LOCATIONS USING (LOCATION_ID);

UPDATE EMPLOYEES_COPY SET SALARY = 1500 WHERE JOB_ID = 'IT_PROG';

SELECT * FROM EMPLOYEES_COPY;