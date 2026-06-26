# 🍳 Sistema de Gestión Gastronómica: Diseño de Esquemas (DDL)

Este proyecto presenta el diseño de una base de datos relacional para una **Escuela de Cocina**, enfocándose en la integridad de los datos mediante el uso de restricciones (constraints) de SQL en **SQLite3**.

## 🏗️ Arquitectura de la Base de Datos

El esquema se divide en tres entidades principales que permiten gestionar el flujo educativo de la escuela:

1.  **Recipes (Recetas):** El catálogo de platillos.
2.  **Chefs (Instructores):** El personal docente especializado.
3.  **Classes (Clases):** La entidad de relación que conecta a un instructor con una receta específica.

---

## 🛡️ Implementación de Constraints (Restricciones)

Para garantizar que la información sea verídica y consistente, se han aplicado los siguientes candados lógicos:

### 1. Integridad de Entidad (Primary Keys)
Cada tabla cuenta con un `id` único autoincremental (`PRIMARY KEY AUTOINCREMENT`), asegurando que no existan registros duplicados y facilitando la indexación.

### 2. Validación de Datos (CHECK Constraints)
* **Dificultad controlada:** En la tabla `recipes`, el campo `difficulty_level` solo acepta valores entre **1 y 3** mediante un constraint `CHECK`. Esto evita errores de rango en la calificación de las recetas.
* **Estado lógico:** En la tabla `chefs`, el campo `is_active` utiliza un valor por defecto (`DEFAULT 1`) y está pensado para manejar estados binarios (Activo/Inactivo).

### 3. Integridad de Dominio (NOT NULL & UNIQUE)
* **Campos Obligatorios:** Se aplicó `NOT NULL` en nombres, especialidades y contactos para evitar registros incompletos.
* **No Duplicidad:** El campo `phone_number` en la tabla de chefs cuenta con el constraint `UNIQUE`, impidiendo que dos instructores compartan el mismo número de contacto.

### 4. Integridad Referencial (Foreign Keys)
La tabla `classes` actúa como el motor relacional del sistema:
* `id_chef` referencia a `id_chefs` en la tabla de instructores.
* `id_recipe` referencia a `id_recipe` en la tabla de recetas.
* **Nota:** Se requiere ejecutar `PRAGMA foreign_keys = ON;` para activar la validación de estas llaves en SQLite.

---

## 🚀 Ejecución del Script

Para reconstruir el esquema y verificar las tablas, ejecuta el siguiente comando en tu terminal:

```bash
sqlite3 my_school.db < project2.sql

🛠️ Comandos de Verificación incluidos
El script finaliza con comandos administrativos para validar la estructura:

.tables: Lista las tablas creadas.

PRAGMA table_info(): Despliega los metadatos y constraints de cada columna.
....