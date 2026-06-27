
-- ============================================
-- PROYECTO SEMANAL: Funciones de Agregación
-- Semana 06 — COUNT, SUM, AVG, GROUP BY, HAVING
-- ============================================

-- NOTA: Usa el esquema de tu Semana 03. Adapta nombres al dominio.

-- ============================================
-- REPORTE 1: Totales globales
-- ============================================
-- TODO: Cuenta todos los registros y calcula suma/promedio
--       de la columna numérica más relevante de tu dominio
SELECT
	COUNT(*) AS total_estudiantes,
	SUM(registration_value) AS suma,
	ROUND(AVG(registration_value)) AS promedio_estudiantes
FROM students;

-- ============================================
-- REPORTE 2: Extremos
-- ============================================
-- TODO: Obtén el valor mínimo y máximo de la columna numérica
SELECT
	MIN(registration_value) AS minimo, 
	MAX(registration_value) AS maximo
FROM students;

-- ============================================
-- REPORTE 3: Subtotales por categoría (GROUP BY)
-- ============================================
-- TODO: Agrupa por la columna de categoría/tipo principal de tu dominio
--       y calcula COUNT + AVG o SUM para cada grupo
SELECT
	level,
	COUNT(*)     AS total
	ROUND(AVG(registration_value)) AS promedio
	FROM   students
	GROUP BY level
	ORDER BY total DESC;


-- ============================================
-- REPORTE 4: Filtro de grupos (HAVING)
-- ============================================
-- TODO: Muestra solo los grupos que superen un umbral de negocio
SELECT
	salary,
	COUNT(*) AS total
	FROM chefs
	GROUP BY salary
	HAVING salary > 1500000.00;