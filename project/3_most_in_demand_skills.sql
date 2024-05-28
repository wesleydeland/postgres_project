-- 3. What are the most in-demand skills for my role?

-- Question: What are the most in-demand skills for data analysts?
-- - Join job postings to inner join table similar to query 2
-- - Identify the top 5 in-demand skills for a data analyst.
-- - Focus on all job postings.
-- - Why? Retrieves the top 5 skills with the highest demand in the job market,
-- providing insights into the most valuable skills for job seekers.

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim ON jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE jobs.job_title_short LIKE 'Software%Engineer%'
GROUP BY skills
ORDER BY demand DESC
LIMIT 5;