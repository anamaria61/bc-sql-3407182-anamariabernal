# 🍳 Sistema de Gestión de Escuela de Cocina - SQL

Este proyecto contiene el diseño e implementación de una base de datos relacional para gestionar una escuela de cocina. Incluye la definición de esquemas, manejo de entidades de estudiantes, chefs, recetas y clases, además de operaciones fundamentales de manipulación de datos (DML).

## 📊 Modelo de Datos

La base de datos está compuesta por las siguientes entidades principales:

1.  **Students (Estudiantes):** Registro de alumnos con validación de edad mínima (16 años) y niveles de aprendizaje.
2.  **Chefs:** Información de instructores, especialidades y estado de actividad.
3.  **Recipes (Recetas):** Catálogo de platos con niveles de dificultad (1 al 3) y tiempos de preparación.
4.  **Classes (Clases):** Tabla relacional que vincula a los chefs con las recetas que imparten.



---

## 🚀 Estructura de las Tablas

### Estudiantes (`students`)
| Campo | Tipo | Restricción |
| :--- | :--- | :--- |
| `id_students` | INTEGER | PRIMARY KEY |
| `name_students`| TEXT | NOT NULL |
| `age_students` | INTEGER | CHECK (>= 16) |
| `email_students`| TEXT | UNIQUE, NOT NULL |

### Recetas (`recipes`)
| Campo | Tipo | Restricción |
| :--- | :--- | :--- |
| `id_recipe` | INTEGER | PRIMARY KEY AUTOINCREMENT |
| `difficulty_level`| INTEGER | CHECK (1-3) |

### Chefs (`chefs`)
| Campo | Tipo | Restricción |
| :--- | :--- | :--- |
| `id_chefs` | INTEGER | PRIMARY KEY AUTOINCREMENT |
| `is_active` | INTEGER | DEFAULT 1 (Activo) |

---

## 🛠️ Operaciones Implementadas

El script incluye ejemplos prácticos de:

* **Inserción masiva de datos:** Carga inicial de 15 registros por tabla para pruebas de entorno.
* **Actualizaciones (UPDATE):**
    * Modificación de datos específicos por ID.
    * Actualización masiva basada en lógica de negocio (ej. incrementar tiempo de preparación en recetas de dificultad alta).
* **Eliminación Segura (DELETE):** Limpieza de registros en tablas relacionadas utilizando condiciones específicas.
* **Verificación:** Uso de comandos `PRAGMA` y `SELECT` para validar la integridad de los datos.

## ⚙️ Cómo ejecutar el script

Este código está diseñado para ser ejecutado en **SQLite**.

1.  Asegúrate de tener instalado SQLite en tu sistema.
2.  Carga el archivo mediante la terminal:
    ```bash
    sqlite3 escuela_cocina.db < script.sql
    ```
3.  O copia y pega el contenido en cualquier cliente SQL (DBeaver, DB Browser for SQLite, etc.).

---
> **Nota:** El script incluye sentencias `DROP TABLE` al inicio para permitir una ejecución limpia desde cero en entornos de desarrollo.