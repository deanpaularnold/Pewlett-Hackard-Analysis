--PH Assignment code

SELECT emp_no, first_name, last_name
FROM employees;

SELECT title, from_date, to_date
FROM titles;

SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS ti
        ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
		
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
		emp_no,
        first_name,
        last_name,
        title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (emp_no)
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM mentorship_eligibility;










