SELECT employee_id,
       emp_name,
       phone_number,
       '(02)' || SUBSTR(phone_number, 4) AS new_phone_number
  FROM employees;

SELECT employee_id AS 사원번호,
       emp_name AS 사원명,
       hire_date AS 입사일자,
       TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS 근속년수
  FROM employees
 WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) >= 10
 ORDER BY 근속년수 DESC, 입사일자;

SELECT cust_name,
       cust_main_phone_number,
       REPLACE(cust_main_phone_number, '-', '/') AS new_phone_number
  FROM customers;

SELECT cust_name,
       cust_main_phone_number,
       TRANSLATE(cust_main_phone_number, '0123456789', 'acielsifke') AS new_phone_number
  FROM customers;

SELECT cust_name,
       cust_year_of_birth,
       DECODE(TRUNC((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) / 10),
              3, '30대',
              4, '40대',
              5, '50대',
                 '기타') AS generation
  FROM customers;

SELECT cust_name,
       cust_year_of_birth,
       CASE WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 10  THEN '10세 미만'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 20  THEN '10대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 30  THEN '20대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 40  THEN '30대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 50  THEN '40대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 60  THEN '50대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 70  THEN '60대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 80  THEN '70대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 90  THEN '80대'
            WHEN TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth < 100 THEN '90대'
            ELSE '100세 이상'
       END AS generation
  FROM customers;
