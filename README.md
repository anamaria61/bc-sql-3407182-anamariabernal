# 🍳 Sistema de Gestión de Escuela de Cocina - JOINs en SQL

Este proyecto implementa consultas avanzadas utilizando **INNER JOIN** y **LEFT JOIN** sobre una base de datos relacional para una Escuela de Cocina. El objetivo es comprender cómo relacionar tablas mediante claves foráneas y generar reportes útiles a partir de los datos almacenados.

## 📚 Descripción del Dominio

La base de datos permite gestionar la información de una escuela de cocina mediante las siguientes entidades:

### 👨‍🎓 Students (Estudiantes)
Almacena la información de los alumnos inscritos en la escuela, incluyendo datos personales, nivel de aprendizaje y fecha de registro.

### 👨‍🍳 Chefs
Contiene los datos de los instructores encargados de impartir las clases, junto con sus especialidades culinarias y estado de actividad.

### 🍽️ Recipes (Recetas)
Catálogo de recetas enseñadas en la escuela, clasificadas por nivel de dificultad y tiempo estimado de preparación.

### 🥘 Classes (Clases)
Tabla que relaciona a los chefs con las recetas que enseñan dentro de la escuela de cocina.

---

## 🗂️ Modelo Relacional

```text
CHEFS
   │
   │ (id_chef)
   ▼
CLASSES
   ▲
   │ (id_recipe)
   │
RECIPES

STUDENTS
```

### 🔗 Relaciones

- `classes.id_chef → chefs.id_chef`
- `classes.id_recipe → recipes.id_recipe`

---

## 📊 Volumen de Datos

Para las pruebas de consultas JOIN se cargaron registros suficientes para cumplir los requisitos de la actividad:

| Tabla | Cantidad de registros |
|--------|----------------------:|
| 👨‍🎓 Students | 80 |
| 👨‍🍳 Chefs | 30 |
| 🍽️ Recipes | 30 |
| 🥘 Classes | 30 |

---

## 🔗 Consultas Implementadas

### 1️⃣ INNER JOIN entre Clases y Chefs

Permite visualizar cada clase junto con el chef encargado de impartirla.

```sql
SELECT
    c.class_name AS clase,
    ch.name_chef || ' ' || ch.last_name_chef AS chef
FROM classes c
INNER JOIN chefs ch
    ON c.id_chef = ch.id_chef;
```

#### 🎯 Objetivo
Mostrar únicamente registros que tienen relación en ambas tablas.

---

### 2️⃣ INNER JOIN con Tres Tablas

Relaciona clases, chefs y recetas.

```sql
SELECT
    c.class_name AS clase,
    ch.name_chef || ' ' || ch.last_name_chef AS chef,
    r.name_recipe AS receta
FROM classes c
INNER JOIN chefs ch
    ON c.id_chef = ch.id_chef
INNER JOIN recipes r
    ON c.id_recipe = r.id_recipe;
```

#### 🎯 Objetivo
Generar un reporte completo de las clases impartidas, mostrando instructor y receta asociada.

---

### 3️⃣ LEFT JOIN

Obtiene todas las clases, incluso aquellas que no tengan una receta asociada.

```sql
SELECT
    c.class_name AS clase,
    r.name_recipe AS receta
FROM classes c
LEFT JOIN recipes r
    ON c.id_recipe = r.id_recipe;
```

#### 🎯 Objetivo
Conservar todos los registros de la tabla principal (`classes`), independientemente de que exista relación con la tabla secundaria.

---

### 4️⃣ Detección de Registros Huérfanos

Permite identificar clases que no tienen una receta asociada.

```sql
SELECT
    c.class_name AS clase_sin_receta
FROM classes c
LEFT JOIN recipes r
    ON c.id_recipe = r.id_recipe
WHERE r.id_recipe IS NULL;
```

#### 🎯 Objetivo
Detectar registros sin relación dentro de la base de datos.

---

### 5️⃣ Reporte Agregado con COUNT()

Calcula la cantidad de clases asignadas a cada chef.

```sql
SELECT
    ch.name_chef || ' ' || ch.last_name_chef AS chef,
    COUNT(c.id_class) AS total_clases
FROM chefs ch
LEFT JOIN classes c
    ON c.id_chef = ch.id_chef
GROUP BY ch.id_chef
ORDER BY total_clases DESC;
```

#### 🎯 Objetivo
Generar estadísticas y reportes utilizando funciones de agregación junto con JOINs.

---

## 🛠️ Conceptos Aplicados

Durante esta actividad se trabajó con:

- ✅ PRIMARY KEY
- ✅ FOREIGN KEY
- ✅ Relaciones entre tablas
- ✅ INNER JOIN
- ✅ LEFT JOIN
- ✅ Alias con `AS`
- ✅ Concatenación de texto con `||`
- ✅ COUNT()
- ✅ GROUP BY
- ✅ ORDER BY

---

## ⚙️ Ejecución del Proyecto

### Crear y cargar la base de datos

```bash
sqlite3 escuela.db < starter/project.sql
```

### Acceder a SQLite

```bash
sqlite3 escuela.db
```

### Verificar tablas creadas

```sql
.tables
```

### Verificar cantidad de registros

```sql
SELECT COUNT(*) FROM students;
SELECT COUNT(*) FROM chefs;
SELECT COUNT(*) FROM recipes;
SELECT COUNT(*) FROM classes;
```

---

## 🎓 Aprendizajes

Durante esta práctica se fortalecieron los conocimientos relacionados con:

- Diseño de bases de datos relacionales.
- Implementación de claves foráneas.
- Consultas con INNER JOIN.
- Consultas con LEFT JOIN.
- Detección de registros huérfanos.
- Generación de reportes utilizando COUNT().
- Análisis de relaciones entre entidades.
- Manipulación de datos en SQLite.

---

> 💡 **Nota:** El script incluye sentencias `DROP TABLE IF EXISTS` para permitir la recreación completa de la base de datos durante las pruebas y el desarrollo del proyecto.