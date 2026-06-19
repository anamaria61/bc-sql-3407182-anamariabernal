# 🍳 Sistema de Gestión de Escuela de Cocina - NULL y Constraints en SQL

Este proyecto corresponde a la **Semana 07**, enfocada en el manejo de valores **NULL**, el uso de **restricciones (Constraints)** y funciones de tratamiento de datos en SQLite. Se realizaron consultas para identificar valores nulos, insertar registros con información incompleta y mostrar resultados más amigables mediante el uso de `COALESCE()` y `CAST()`.

---

## 📚 Descripción del Dominio

La base de datos representa una **Escuela de Cocina**, donde se gestionan:

* 👨‍🎓 Estudiantes (`students`)
* 👨‍🍳 Chefs (`chefs`)
* 🍽️ Recetas (`recipes`)
* 🥘 Clases (`classes`)

Para esta actividad se trabajó principalmente con la tabla **recipes**, analizando registros que contienen valores nulos en el tiempo de preparación.

---

## 🛠️ Conceptos Aplicados

Durante esta práctica se utilizaron los siguientes conceptos de SQL:

* ✅ Restricciones (`NOT NULL`, `UNIQUE`, `CHECK`, `FOREIGN KEY`)
* ✅ Valores `NULL`
* ✅ Consulta con `IS NULL`
* ✅ Inserción de registros con valores nulos
* ✅ Función `COALESCE()`
* ✅ Conversión de tipos mediante `CAST()`
* ✅ Verificación de integridad de datos

---

## 📊 Estructura de la Tabla Utilizada

### 🍽️ Recipes (`recipes`)

| Campo               | Tipo    | Restricción               |
| ------------------- | ------- | ------------------------- |
| `id_recipe`         | INTEGER | PRIMARY KEY AUTOINCREMENT |
| `name_recipe`       | TEXT    | NOT NULL                  |
| `difficulty_level`  | INTEGER | CHECK (1-3)               |
| `prep_time_minutes` | INTEGER | Permite NULL              |

---

## 🔍 Consultas Implementadas

### 1️⃣ Verificar registros con valores NULL

Se contó la cantidad de recetas que no tienen definido el tiempo de preparación.

```sql
SELECT COUNT(*)
FROM recipes
WHERE prep_time_minutes IS NULL;
```

#### 🎯 Objetivo

Identificar cuántos registros contienen información faltante.

---

### 2️⃣ Insertar registros con valores NULL

Se agregaron nuevas recetas sin especificar el tiempo de preparación.

```sql
INSERT INTO recipes
(name_recipe, difficulty_level, prep_time_minutes)
VALUES
('Ensalada Fresca', 1, NULL),
('Pizza Artesanal', 2, NULL),
('Crema de Verduras', 1, NULL);
```

#### 🎯 Objetivo

Simular escenarios reales donde cierta información aún no está disponible.

---

### 3️⃣ Mostrar registros con valores NULL

Se listaron únicamente las recetas cuyo tiempo de preparación no ha sido definido.

```sql
SELECT id_recipe, name_recipe
FROM recipes
WHERE prep_time_minutes IS NULL;
```

#### 🎯 Objetivo

Filtrar registros que contienen datos faltantes.

---

### 4️⃣ Reemplazar NULL utilizando COALESCE()

Se utilizó `COALESCE()` para mostrar un texto descriptivo cuando el tiempo de preparación es nulo.

```sql
SELECT
    name_recipe,
    COALESCE(
        CAST(prep_time_minutes AS TEXT),
        'Tiempo no definido'
    ) AS tiempo_preparacion
FROM recipes;
```

#### 🎯 Objetivo

Presentar resultados más claros y comprensibles para el usuario.

---

## 💡 Funciones Utilizadas

### 🔄 CAST()

Convierte un valor de un tipo de dato a otro.

```sql
CAST(prep_time_minutes AS TEXT)
```

En este caso, convierte el tiempo de preparación de tipo numérico a texto.

---

### 🔄 COALESCE()

Devuelve el primer valor que no sea `NULL`.

```sql
COALESCE(valor, 'Texto alternativo')
```

Ejemplo:

```sql
COALESCE(prep_time_minutes, 'Tiempo no definido')
```

Si `prep_time_minutes` contiene `NULL`, se mostrará:

```text
Tiempo no definido
```

---

## 🎓 Aprendizajes

Durante esta práctica se fortalecieron conocimientos relacionados con:

* Manejo de valores nulos en bases de datos.
* Identificación de registros incompletos.
* Uso de filtros mediante `IS NULL`.
* Inserción de datos con campos opcionales.
* Conversión de tipos de datos utilizando `CAST()`.
* Presentación de resultados amigables con `COALESCE()`.
* Aplicación de restricciones para garantizar la integridad de la información.

---

## ⚙️ Ejecución del Proyecto

### Crear o cargar la base de datos

```bash
sqlite3 escuela.db < starter/project.sql
```

### Acceder a SQLite

```bash
sqlite3 escuela.db
```

### Ejecutar consultas

```sql
SELECT * FROM recipes;
```

---

> 💡 **Nota:** Esta práctica demuestra cómo trabajar correctamente con valores `NULL` sin afectar la integridad de la base de datos y cómo presentar información más clara mediante funciones SQL especializadas.
