# 🍳 Sistema de Gestión - Academia de Cocina
Este proyecto contiene la estructura de base de datos y las consultas SQL para gestionar una academia de gastronomía. Permite administrar estudiantes, chefs, recetas y clases de manera eficiente.

## 📊 Estructura de la Base de Datos
El sistema se basa en 4 tablas principales:
* **students:** Registro de alumnos, su nivel y fecha de ingreso.
    * **chefs:** Personal docente y su especialidad.
    * **recipes:** Catálogo de platillos con niveles de dificultad (1-3).
    * **classes:** Tabla relacional que conecta a los chefs con las recetas que imparten.

## 🛠️ Consultas Principales
El archivo SQL incluye los siguientes casos de uso:
    1. Reporte de Estudiantes (Alias)Consulta formateada para exportar datos con encabezados claros en español.
    **SQL SELECT name_students AS "nombre estudiante", last_name AS "apellido", ...**

---

## 2. Filtros de NegocioRecetas Rápidas: 
Selección de platillos con tiempo de preparación $\le 30$ minutos.
* Segmentación de Alumnos: Filtrado de estudiantes menores de 25 años en nivel avanzado.
* Control de Personal: Identificación de chefs de "Cocina Española" que se encuentran inactivos.

---


## 3. Ordenamiento y Top-N
Muestra los 5 chefs principales ordenados alfabéticamente de forma descendente según su especialidad.

---


## 4. Paginación de DatosImplementación de navegación para la interfaz de usuario:
    **Página 1:** Primeras 3 clases registradas.
    **Página 2:** Siguientes 3 estudiantes registrados.

---

## 🚀 Cómo usarEjecute el script de creación de tablas.
Cargue los datos de prueba (INSERT INTO).
Ejecute las consultas de verificación para obtener los reportes.

---

## 📝 Notas de desarrolloLa base de datos utiliza SQLite.
Se han implementado restricciones de integridad como CHECK para la edad de los estudiantes ($\ge 16$ años) y niveles de dificultad de recetas (1 a 3).
