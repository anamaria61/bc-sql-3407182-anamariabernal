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
ALTER TABLE classes ADD COLUMN class_duration REAL DEFAULT 2.0; --horas
-- ============================================
-- CONSULTA 1: Filtro con BETWEEN
-- ============================================
-- TODO: Filtra registros de tu entidad principal usando un rango
--       (precio, cantidad, fecha, id, etc.)
-- SELECT ...
-- FROM   tu_tabla
-- WHERE  columna_numerica BETWEEN valor_min AND valor_max;


-- ============================================
-- CONSULTA 2: Filtro con IN
-- ============================================
-- TODO: Filtra por una lista de categorías, estados o ids relevantes
-- SELECT ...
-- FROM   tu_tabla
-- WHERE  columna_categorica IN (valor1, valor2, valor3);


-- ============================================
-- CONSULTA 3: Búsqueda de texto con LIKE
-- ============================================
-- TODO: Busca registros cuyo nombre o descripción contenga un patrón
-- SELECT ...
-- FROM   tu_tabla
-- WHERE  columna_texto LIKE '%patron%';


-- ============================================
-- CONSULTA 4: Filtro combinado (≥ 3 operadores)
-- ============================================
-- TODO: Combina BETWEEN, IN y/o LIKE con AND/OR
--       Usa paréntesis si mezclas AND y OR
-- SELECT ...
-- FROM   tu_tabla
-- WHERE  condicion1
--   AND  condicion2
--   AND  condicion3
-- ORDER BY columna_relevante;