-- DELIVERABLE 1
-- Get retirement data for job titles
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retrieve number of employees by most recent job title who are about to retire 
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- DELIVERABLE 2
-- Mentorship Eligibility table, holds employees who are eligible to participate in a mentorship program
SELECT  DISTINCT ON (emp_no) 
        e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        ti.title
INTO mentorship_eligibility
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN titles ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;