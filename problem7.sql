
WITH remote_job_skills AS (
SELECT
    skill_id,
    COUNT(skills_to_job.skill_id) AS skill_count
FROM skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_posts ON job_posts.job_id = skills_to_job.job_id
WHERE job_posts.job_work_from_home = TRUE
GROUP BY skills_to_job.skill_id
)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim ON remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY skill_count DESC
LIMIT 5
