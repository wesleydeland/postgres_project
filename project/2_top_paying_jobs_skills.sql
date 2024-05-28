-- 2. What are the skills required for these top-paying roles?

-- Question: What skills are required for the top-paying software engineer jobs?
-- - Use the top 20 highest-paying software engineer jobs from first query
-- - Add the specific skills required for these roles
-- - Why? It provides a detailed look at which high-paying jobs demand certain skills,
--     helping job seekers understand which skills to develop that align with top salaries

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact AS jobs
    LEFT JOIN company_dim ON jobs.company_id = company_dim.company_id
    WHERE job_title_short LIKE 'Software%Engineer%' AND 
        salary_year_avg IS NOT NULL AND 
        job_location = 'Anywhere'
    ORDER BY salary_year_avg DESC
    LIMIT 20
)

SELECT 
    jobs.*,
    skills_dim.skills
FROM top_paying_jobs AS jobs
INNER JOIN skills_job_dim ON jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

-- The most common skills across the top paying software engineer jobs in 2023 are:

-- Python (13 mentions): A versatile and widely-used programming language suitable for various applications including web development, data analysis, artificial intelligence, and more.
-- AWS (Amazon Web Services) (8 mentions): A comprehensive cloud computing platform by Amazon, offering a wide range of services from storage to machine learning.
-- MongoDB (8 mentions): A popular NoSQL database known for its scalability and flexibility in handling large volumes of data.
-- JavaScript (7 mentions): Essential for front-end development, enabling interactive and dynamic web applications.
-- SQL (7 mentions): A standard language for managing and manipulating relational databases.
-- TypeScript (6 mentions): A superset of JavaScript that adds static types, enhancing code quality and maintainability.
-- Snowflake (6 mentions): A cloud-based data warehousing service known for its performance and scalability.
-- React (6 mentions): A JavaScript library for building user interfaces, particularly single-page applications.
-- Ruby (6 mentions): A dynamic programming language often used for web development, especially known for the Ruby on Rails framework.
