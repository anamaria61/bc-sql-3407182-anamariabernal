-- ============================================
-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — BETWEEN, IN, LIKE
-- ============================================

-- Nuevas columnas numéricas para cada tabla.

--Recipes
ALTER TABLE recipes ADD COLUMN calories INTEGER DEFAULT 0; --calorias
ALTER TABLE recipes ADD COLUMN servings INTEGER DEFAULT 1; --porciones

--Students 
ALTER TABLE students ADD COLUMN final_grade REAL DEFAULT 0.0; --nota final
ALTER TABLE students ADD COLUMN registration_value DECIMAL(10, 2) DEFAULT 0.0; --valor de matricula

--Chefs
ALTER TABLE chefs ADD COLUMN salary DECIMAL(10,2) DEFAULT 0.0; --salario
ALTER TABLE chefs ADD COLUMN years_experience Integer DEFAULT 1 
CHECK(years_experience >= 0); --años de experiencia

--Classes
ALTER TABLE classes ADD COLUMN max_capacity INTEGER DEFAULT 20; --máxima capacidad
ALTER TABLE classes ADD COLUMN class_duration REAL DEFAULT 2.0; --
                                                        

UPDATE students SET registration_value = 85000.00 WHERE id_students = 1;
UPDATE students SET registration_value = 75000.00 WHERE id_students = 2;
UPDATE chefs SET salary = 1300000.00, years_experience = 2 WHERE last_name LIKE '%a%';
--Nuevos inserts
INSERT INTO students (name_students, last_name, age_students, email_students, registration_date, level, final_grade, registration_value) VALUES
('Alejandro', 'Ruiz', 22, 'aruiz_chef@gmail.com', '2024-04-01', 'Intermedio', 4.5, 85000.00),
('Valeria', 'Montoya', 19, 'val.montoya@email.com', '2024-04-03', 'Principiante', 3.8, 70000.00),
('Ricardo', 'Patiño', 35, 'rpatino_gastronomia@outlook.com', '2024-04-05', 'Avanzado', 4.9, 95000.00),
('Elena', 'Guerrero', 20, 'eguerrero.cocina@gmail.com', '2024-04-10', 'Intermedio', 4.2, 82000.00),
('Hugo', 'Salazar', 28, 'hsalazar_pro@yahoo.com', '2024-04-12', 'Principiante', 3.5, 70000.00),
('Beatriz', 'Cano', 24, 'bcano88@gmail.com', '2024-04-15', 'Avanzado', 4.7, 90000.00),
('Samuel', 'Escobar', 31, 'sam.escobar@email.com', '2024-04-18', 'Intermedio', 4.0, 80000.00),
('Natalia', 'Cardona', 18, 'ncardona.chef@icloud.com', '2024-04-20', 'Principiante', 4.1, 75000.00),
('Javier', 'Bermúdez', 26, 'jbermudez_2024@gmail.com', '2024-04-22', 'Avanzado', 4.8, 92000.00),
('Laura', 'Posada', 23, 'lposada_estudiante@outlook.com', '2024-04-25', 'Intermedio', 3.9, 81000.00),
('Tomás', 'Giraldo', 29, 'tgiraldo.pro@email.com', '2024-05-01', 'Principiante', 3.2, 70000.00),
('Isabel', 'Velasco', 21, 'isabel.velasco@gmail.com', '2024-05-03', 'Avanzado', 5.0, 100000.00),
('Manuel', 'Zapata', 27, 'mzapata_cocina@yahoo.com', '2024-05-05', 'Intermedio', 4.3, 83000.00),
('Paula', 'Quintero', 25, 'pquintero_chef@email.com', '2024-05-08', 'Principiante', 3.7, 72000.00),
('Esteban', 'Mejía', 33, 'emejia_gastronomia@gmail.com', '2024-05-10', 'Avanzado', 4.6, 94000.00);

-- ============================================
-- CONSULTA 1: Filtro con BETWEEN
-- ============================================
-- TODO: Filtra registros de tu entidad principal usando un rango
SELECT name_students, registration_value
FROM students
WHERE registration_value BETWEEN 70000.00 AND 90000.00;

-- ============================================
-- CONSULTA 2: Filtro con IN
-- ============================================
SELECT class_name, id_chef
FROM classes
WHERE id_chef IN (3, 4, 5);

-- ============================================
-- CONSULTA 3: Búsqueda de texto con LIKE
-- ============================================
SELECT name_recipe, prep_time_minutes
FROM recipes
WHERE name_recipe LIKE '%am%';

-- ============================================
-- CONSULTA 4: Filtro combinado (≥ 3 operadores)
-- ============================================
-- TODO: Combina BETWEEN, IN y/o LIKE con AND/OR
SELECT last_name, years_experience, salary
FROM chefs
WHERE salary BETWEEN 1200000.00 AND 1500000.00
    AND years_experience BETWEEN 1 AND 3
    AND last_name LIKE'%a%';
    ORDER BY salary DESC;
