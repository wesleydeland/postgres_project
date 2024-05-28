CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_send BOOLEAN,
    status VARCHAR(50)
);

SELECT *
FROM job_applied;

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_send,
    status
)
VALUES
(
    1,
    '2024-05-05',
    TRUE,
    'resume.pdf',
    TRUE,
    'SUBMITTED'
),
(
    2,
    '2024-05-06',
    TRUE,
    'resume2.pdf',
    false,
    'SUBMITTED'
);

ALTER TABLE job_applied
    ADD contact VARCHAR(50);

ALTER TABLE job_applied 
    RENAME COLUMN contact TO contact_name
;

ALTER TABLE job_applied
    ALTER COLUMN contact_name TYPE TEXT;

UPDATE job_applied
SET contact = 'Wesley Deland'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'James Deland'
WHERE job_id = 2;

DROP TABLE job_applied;