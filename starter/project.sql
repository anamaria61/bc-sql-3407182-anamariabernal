-- ============================================
-- SEMANA 07 - NULL Y CONSTRAINTS
-- ESCUELA DE COCINA
-- ============================================

PRAGMA foreign_keys = ON;

--Verificar que la tabla recipes tenga valores NULL
SELECT COUNT(*)
FROM recipes
WHERE prep_time_minutes IS NULL;

-- Insertar nuevos registros con NULL
INSERT INTO recipes
(name_recipe, difficulty_level, prep_time_minutes)
VALUES
('Ensalada Fresca', 1, NULL),
('Pizza Artesanal', 2, NULL),
('Crema de Verduras', 1, NULL);


INSERT INTO recipes
(name_recipe, difficulty_level, prep_time_minutes)
VALUES
('Crema de Verduras', 1, NULL);

--Mostrar items donde prep_time_minutes IS NULL

SELECT id_recipe, name_recipe
FROM   recipes
WHERE  prep_time_minutes IS NULL;

-- Reemplazar NULL con COALESCE

SELECT
    name_recipe,
    COALESCE(
        CAST(prep_time_minutes AS TEXT), --convertir un dato de un tipo a otro
        'Tiempo no definido'
    ) AS tiempo_preparacion
FROM recipes;

-- SELECT COUNT(*)
-- FROM recipes

-- SELECT COUNT(*)
-- FROM chefs