CREATE TABLE students(  
    id_students INTEGER PRIMARY KEY,
    name_students TEXT NOT NULL,
    age_students INTEGER NOT NULL,
    email_students TEXT NOT NULL
);

CREATE TABLE chefs(
    id_chefs INTEGER PRIMARY KEY,
    name_chefs TEXT NOT NULL,
    specialty_chefs TEXT NOT NULL,
    phone_number TEXT NOT NULL
);

INSERT INTO students(id_students, name_students, age_students, email_students) VALUES
(1, 'Alice', 25, 'alice@example.com'),
(2, 'Bob', 30, 'bob@example.com'),
(3, 'Charlie', 35, 'charlie@example.com'),
(4, 'David', 40, 'david@example.com'),
(5, 'Eve', 45, 'eve@example.com');

INSERT INTO chefs (id_chefs, name_chefs, specialty_chefs, phone_number) VALUES
(1, 'Chef Adrián', 'Alta Cocina Mexicana y Salsas', '351 234 5678'),
(2, 'Chef Isabella', 'Pastelería y Repostería Fina', '339 069 8765'),
(3, 'Chef Kenji', 'Cocina Japonesa y Arte del Sushi', '381 567 8901'),
(4, 'Chef Beatriz', 'Cocina Mediterránea y Saludable', '341 234 5678'),
(5, 'Chef Marcus', 'Técnicas Francesas y Salsas Clásicas', '312 345 6789');

SELECT * FROM students;

SELECT name_students FROM students
ORDER BY name_students ASC;

SELECT COUNT(*) AS total_students
FROM  students;


SELECT * FROM chefs;

SELECT name_chefs FROM chefs
ORDER BY name_chefs ASC;

SELECT COUNT(*) AS total_chefs
FROM chefs;