### 🎯 Objetivo

Aplicar restricciones (Constraints) y el manejo de valores NULL dentro de una base de datos relacional, utilizando consultas con IS NULL y la función COALESCE() para mejorar la calidad e integridad de los datos.

--- 

## 🔒 Constraints Implementados
|Constraint | Descripción| Ejemplo |
| :--- | : --- | :--- |
|PRIMARY KEY|	Identifica de forma única cada registro	| id_students, id_recipe | 
|NOT NULL|	Impide valores vacíos	| name_students, class_name | 
|UNIQUE|	Evita registros duplicados	| email_students, phone_number | 
|CHECK|	Valida reglas de negocio	| age_students >= 16 | 
|DEFAULT|	Asigna valores por defecto	| is_active DEFAULT 1 | 
|FOREIGN| KEY|	Mantiene la integridad referencial	| id_chef, id_recipe | 

# Mostrar recetas con tiempo de preparación no definido
SELECT
    id_recipe,
    name_recipe
FROM recipes
WHERE prep_time_minutes IS NULL;

* **Resultado esperado:** 
    * Ensalada Fresca 1 Tiempo no definido
    * Pizza Artesanal 2 Tiempo no definido
    * Crema de Verduras 1 Tiempo no definido