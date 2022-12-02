/* Problem: Amber's conglomerate corporation just acquired some new
companies. Each of the companies follows this hierarchy:

Founder -> Lead Manager -> Senior Manager -> Manager -> Employee

Given the table schemas below, write a query to print the company_code,
founder name, total number of lead managers, total number of senior
managers, total number of managers, and total number of employees. Order
your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For
example, if the company_codes are C_1, C_2, and C_10, then the ascending
company_codes will be C_1, C_10, and C_2. */

-- Tables have duplicate values, so we must count using DISTINCT.
-- We need to join all tables so that we can properly count while
-- grouping by each level of the hierarchy.
SELECT C.company_code,
       C.founder,
       Count(DISTINCT L.lead_manager_code),
       Count(DISTINCT S.senior_manager_code),
       Count(DISTINCT M.manager_code),
       Count(DISTINCT E.employee_code)
FROM   company C
       INNER JOIN lead_manager L
               ON C.company_code = L.company_code
       INNER JOIN senior_manager S
               ON L.lead_manager_code = S.lead_manager_code
       INNER JOIN manager M
               ON S.senior_manager_code = M.senior_manager_code
       INNER JOIN employee E
               ON M.manager_code = E.manager_code
GROUP  BY C.company_code,
          C.founder
ORDER  BY C.company_code;
