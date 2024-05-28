-- ? Questions to Answer
-- 1. What are the top-paying jobs for my role?
-- 2. What are the skills required for these top-paying roles?
-- 3. What are the most in-demand skills for my role?
-- 4. What are the top skills based on salary for my role?
-- 5. What are the most optimal skills to learn?
-- a. Optimal: High Demand AND High Paying

--1

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact AS jobs
LEFT JOIN company_dim ON jobs.company_id = company_dim.company_id
WHERE job_title_short LIKE 'Software%Engineer%' AND 
      salary_year_avg IS NOT NULL AND 
      job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;