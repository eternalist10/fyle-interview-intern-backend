-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherAssignmentCounts AS (
    SELECT 
        teacher_id, 
        COUNT(*) AS total_assignments
    FROM 
        assignments
    WHERE 
        state = 'GRADED'
    GROUP BY 
        teacher_id
),
TopTeacher AS (
    SELECT 
        teacher_id
    FROM 
        TeacherAssignmentCounts
    ORDER BY 
        total_assignments DESC
    LIMIT 1
)
SELECT 
    teacher_id,
    COUNT(*) AS grade_A_count
FROM 
    assignments
WHERE 
    teacher_id = (SELECT teacher_id FROM TopTeacher)
    AND grade = 'A'
    AND state = 'GRADED'
GROUP BY 
    teacher_id;