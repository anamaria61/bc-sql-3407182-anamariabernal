
# 📊 SQL Cooking School - Analytics & Business Intelligence

En esta sexta etapa del proyecto, hemos implementado **Funciones de Agregación** y **Agrupamiento de Datos**. El objetivo es transformar los registros individuales en reportes estadísticos que permitan entender la salud financiera y académica de la escuela.

## 📈 Reportes Estadísticos (Semana 06)

El análisis se centra en métricas clave como ingresos por matrículas, rendimiento por niveles y gestión de nómina de instructores.

### 1. Indicadores Globales de Rendimiento
Utilizamos `COUNT`, `SUM` y `AVG` para obtener una visión general e inmediata del estado de la escuela:
* **Total de Estudiantes:** Volumen actual de la comunidad académica.
* **Capitalización:** Suma total de los valores de matrícula recaudados.
* **Ticket Promedio:** El valor medio invertido por cada estudiante.

```sql
SELECT
    COUNT(*) AS total_estudiantes,
    SUM(registration_value) AS suma,
    ROUND(AVG(registration_value), 2) AS promedio_estudiantes
FROM students;
```

### 2. Análisis de Extremos (Benchmarks)
Identificación de los valores límites (MIN y MAX) para entender el rango de precios en los servicios educativos ofrecidos.

### 3. Subtotales por Nivel Académico (GROUP BY)
Este reporte segmenta la población estudiantil por su nivel (Principiante, Intermedio, Avanzado), permitiendo identificar qué categorías tienen mayor demanda y cuál es su aporte promedio al ingreso total.

Nivel | Total Estudiantes | Inversión Promedio |
|-----|-------------------|--------------------|
| Principiante | [Count] | [Avg] |
| Intermedio | [Count] | [Avg] |
| Avanzado | [Count] | [Avg] |

### 4. Filtros de Segmentación Especializada (HAVING)
A diferencia de WHERE, utilizamos HAVING para filtrar grupos ya procesados. En este caso, el reporte se enfoca en analizar la estructura salarial de los Chefs que superan el umbral de mercado de $1,500,000.00.

    ```sql
    SELECT salary, COUNT(*) AS total
    FROM chefs
    GROUP BY salary
    HAVING salary > 1500000.00;
    ```

### 🛠️ Herramientas de Análisis Utilizadas
* **Funciones de Agregado:** COUNT, SUM, AVG, MIN, MAX.
* **Clasificación:** GROUP BY para categorización de registros.
* **Condicionales de Grupo:** HAVING para filtros post-agrupamiento.
* **Formateo:** ROUND para limpieza de datos decimales.

### ⚙️ Cómo generar los reportes
Para visualizar estos resultados en tu terminal de SQLite, ejecuta:
Bashsqlite3 cooking_school.db < semana_06_reportes.sql

Este módulo demuestra la capacidad de extraer conocimiento accionable a partir de datos crudos.
---

### 💡 Un par de consejos técnicos para tu código:

### 1.  **En el Reporte 4 (HAVING):**
    Tu consulta actual agrupa por `salary`. Esto significa que si tienes dos chefs ganando exactamente lo mismo (ej. 1,600,000), te dirá `Total: 2`. Sin embargo, en reportes de nómina suele ser más útil agrupar por **especialidad** y filtrar por el promedio del salario. Por ejemplo:
    ```sql
    SELECT specialty_chef, AVG(salary) as promedio
    FROM chefs
    GROUP BY specialty_chef
    HAVING promedio > 1500000.00;
    ```
    *Esto te diría qué especialidades son las más costosas para la escuela.*

### 2.  **Limpieza de Datos:**
    Has usado `ROUND(..., 2)`, lo cual es excelente para que el README y los reportes se vean limpios y profesionales.
  