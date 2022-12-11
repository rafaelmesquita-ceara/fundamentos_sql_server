USE [BaltaPopulado]

CREATE OR ALTER VIEW vwCourses AS
    SELECT
        [Course].[Id],
        [Course].[Tag],
        [Course].[Title],
        [Course].[Url],
        [Course].[Summary],
        [Course].[CreateDate],
        [Category].[Title] AS [Category],
        [Author].[Name] AS [Author]
    FROM 
        [Course]
        INNER JOIN [Category] ON [Course].[CategoryId] = [Category].[Id]
        INNER JOIN [Author] ON [Course].[AuthorId] = [Author].[Id]
    WHERE
        [Active] = 1

SELECT * FROM vwCourses ORDER BY [CreateDate] DESC


CREATE OR ALTER VIEW vwCareers AS
    SELECT 
        [Career].[Title],
        COUNT([Id]) AS [Courses]
    FROM
        [Career]
        INNER JOIN [CareerItem] ON [CareerItem].[CareerId] = [Career].[Id]
    GROUP BY 
        [Career].[Title]

SELECT * FROM vwCareers


INSERT INTO 
    [Student]
VALUES (
    'c55390d4-71dd-4f3c-b978-d1582f51a327',
    'André Baltieri',
    'hello@balta.io',
    '12345678901',
    '11999999999',
    NULL,
    GETDATE()
)

INSERT INTO 
    [StudentCourse]
VALUES (
    '5d8cf396-e717-9a02-2443-021b00000000',
    'c55390d4-71dd-4f3c-b978-d1582f51a327',
    50,
    0,
    '2021-01-15 12:35:54',
    GETDATE()
)

SELECT 
    [Student].[Name] AS [Student],
    [Course].[Title] AS [Course],
    [StudentCourse].[Progress]
FROM
    [StudentCourse]
    INNER JOIN [Student] ON [StudentCourse].[StudentId] = [Student].[Id]
    INNER JOIN [Course] ON [StudentCourse].[CourseId] = [Course].[Id]
WHERE 
    [StudentCourse].[StudentId] = 'c55390d4-71dd-4f3c-b978-d1582f51a327'
    AND [StudentCourse].[Progress] < 100


SELECT 
    [Student].[Name] AS [Student],
    [Course].[Title] AS [Course],
    [StudentCourse].[Progress],
    [StudentCourse].[LastUpdateDate]
FROM 
    [Course]
    LEFT JOIN [StudentCourse] ON [StudentCourse].[CourseId] = [Course].[Id]
    LEFT JOIN [Student] ON [StudentCourse].[StudentId] = [Student].[Id]

