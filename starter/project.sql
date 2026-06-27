-- ============================================
-- PROYECTO SEMANAL: Consultas SELECT
-- Semana 04 — SELECT, WHERE, ORDER BY, LIMIT/OFFSET
-- ============================================
-- CONSULTA 1: Listado general con columnas explícitas
-- ============================================

-- Lista al menos 4 columnas de tu entidad principal
--       usando alias en español para cada columna
SELECT
    name_students AS "nombre estudiante",
    last_name AS "apellido",
    email_students AS "correo",
    level AS nivel
FROM students;

-- ============================================
-- CONSULTA 2: Filtro por condición simple
-- ============================================
-- Filtra filas usando una condición de igualdad o comparación

SELECT 
    name_recipe AS "nombre receta",
    difficulty_level AS "nivel dificultad",
    prep_time_minutes AS "tiempo preparación"
FROM recipes
WHERE prep_time_minutes <= 30;
                                                    
-- ============================================
-- CONSULTA 3: Filtro combinado (AND u OR)
-- ============================================
--Estudiantes con menos de 25 años y con un nivel avanzado
SELECT name_students, last_name, age_students, level
FROM   students
WHERE  age_students < 25
  AND  level = 'Avanzado';

--Recetas que se demoren un tiempo promedio y tengan un nivel medio
SELECT name_recipe, difficulty_level, prep_time_minutes
FROM   recipes
WHERE  prep_time_minutes <= 60
   OR  difficulty_level = 2;

--Chef que enseñe 'Cocina española y esté inactivo
SELECT name_chef, last_name, specialty_chef, is_active
FROM   chefs
WHERE  specialty_chef = 'Cocina Española'
  AND  is_active = 0;


-- ============================================
-- CONSULTA 4: Top-N con ORDER BY + LIMIT
-- ============================================
-- Recupera los 5 primeros registros según un criterio de negocio

SELECT 
    name_chef AS "nombre chef",
    specialty_chef As "especialidad"
FROM chefs
ORDER BY specialty_chef DESC
LIMIT 5;

--============================================
-- CONSULTA 5: Paginación (página 1 y página 2)
-- ============================================
-- Implementa 2 páginas de 3 registros cada una
--       ordenados por un criterio relevante para tu dominio
-- Página 1:

SELECT id_class, class_name, id_chef, id_recipe
FROM classes
ORDER BY id_recipe ASC
LIMIT 3 OFFSET 0;

-- Página 2:

SELECT name_students, last_name, email_students, level
FROM students
ORDER BY level ASC
LIMIT 3 OFFSET 3;
