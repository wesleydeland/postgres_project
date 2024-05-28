SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'CDT' AS posted_date,
EXTRACT(MONTH FROM job_posted_date) AS month,
EXTRACT(YEAR FROM job_posted_date) AS year
FROM job_postings_fact
LIMIT 100

SELECT
COUNT(job_id) AS job_count,
EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_count DESC
LIMIT 100;

CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT (MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT (MONTH FROM job_posted_date) = 3;