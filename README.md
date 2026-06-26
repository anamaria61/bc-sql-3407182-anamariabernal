Markdown
# 🎓 SQL Cooking School - Evolución de Datos

Este repositorio documenta la expansión de la base de datos para la Escuela de Gastronomía, enfocándose en la **alteración de esquemas**, **actualización de métricas financieras** y el uso de **operadores avanzados de filtrado**.

---

## 🚀 Nuevas Funcionalidades (Semana 05)

En esta fase, hemos enriquecido el modelo de datos agregando dimensiones numéricas y financieras para un control más detallado:

---

### 🛠️ Alteraciones de Esquema (ALTER TABLE)
Se han añadido columnas estratégicas para mejorar la analítica del negocio:
* **Recetas:** `calories` (energía) y `servings` (porciones).
* **Estudiantes:** `final_grade` (rendimiento) y `registration_value` (cobros).
* **Chefs:** `salary` (nómina) y `years_experience` (seniority).
* **Clases:** `max_capacity` (logística) y `class_duration` (tiempos).

---

## 📊 Consultas Avanzadas (DQL)

Hemos implementado filtros de alta precisión utilizando operadores lógicos avanzados:

---

### 1. Rangos Financieros (`BETWEEN`)
Identificamos estudiantes según su rango de inversión en matrícula:

* SELECT name_students, registration_value
* FROM students
* WHERE registration_value BETWEEN 70000.00 AND 90000.00;

---

### 2. Segmentación por Categorías (IN)
Filtramos clases asignadas a un grupo específico de instructores (IDs: 3, 4, 5):

* SELECT class_name, id_chef 
* FROM classes
* WHERE id_chef IN (3, 4, 5);

---

### 3. Búsqueda de Patrones (LIKE)
Búsqueda inteligente de recetas que contienen fragmentos de texto específicos (ej. "am"):

* SELECT name_recipe 
* FROM recipes
* WHERE name_recipe LIKE '%am%';

-------------

### 4. Súper Filtro de Talento (Combinado)
Consulta compleja para identificar chefs con un perfil específico:

* **Salario: Entre 1.2M y 1.5M.**

* **Experiencia: De 1 a 3 años.**

* **Nombre: Que contenga la letra 'a'.**

* **Orden: Descendente por salario.**

---

## 📈 Resumen de Datos Insertados
Se han incorporado 15 nuevos perfiles de estudiantes con sus respectivas notas finales y valores de matrícula, lo que permite realizar pruebas de rendimiento académico y proyecciones financieras.

---

## ⚙️ Ejecución
Para actualizar la base de datos con estos nuevos cambios, ejecuta:

* Bash
* sqlite3 cooking_school.db < semana_05_filtros.sql
* Proyecto desarrollado para el módulo de Manipulación de Datos en SQL.


---

