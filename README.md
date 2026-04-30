Mi dominio es Escuela de Cocina 🍳

📊 Estructura de la Base de Datos
La base de datos se compone de dos tablas principales:

1. Tabla students
Almacena la información académica y de contacto de los alumnos.

    id_students:  Identificador único (Primary Key).

    name_students:  Nombre completo del estudiante.

    age_students:  Edad.

    email_students:  Correo electrónico de contacto.

2. Tabla chefs
Almacena el perfil profesional de los instructores de cocina.

    id_chefs:  Identificador único (Primary Key).

    name_chefs:  Nombre del chef.

    specialty_chefs:  Área de especialización culinaria.

    phone_number:  Número telefónico de contacto.

🚀 Instalación y Ejecución
Para levantar la base de datos y visualizar los resultados directamente desde tu terminal, sigue estos pasos:

1. Requisitos previos
Asegúrate de tener instalado SQLite3 en tu sistema. Puedes verificarlo ejecutando sqlite3 --version en tu terminal.

2. Ejecución del Script
Para crear la base de datos (denominada cooking_school.db), cargar las tablas y ejecutar las consultas automáticas, utiliza el siguiente comando:

Desde la consola de Git Bash
sqlite3 cooking_school.db < starter/project.sql
    Nota: Este comando redirige el contenido de tu archivo .sql al motor de SQLite, procesando todas las instrucciones de forma secuencial.

🔍 Consultas Incluidas
El script incluye las siguientes operaciones de lectura:

Listado Completo: Visualización de todos los registros de ambas tablas.

Ordenamiento Alfabético: Consultas configuradas para listar nombres de estudiantes y chefs de la A a la Z.

Métricas Rápidas: Uso de la función COUNT(*) para obtener el total de registros en cada categoría.

📝 Ejemplo de Consulta Principal
SQL
-- Obtener el total de chefs registrados
SELECT COUNT(*) AS total_chefs FROM chefs;

-- Listar estudiantes ordenados por nombre
SELECT name_students FROM students
ORDER BY name_students ASC;

📝 Ejemplo de Código

    CREATE TABLE students(  
        id_students INTEGER PRIMARY KEY,
        name_students TEXT NOT NULL,
        age_students INTEGER NOT NULL,
        email_students TEXT NOT NULL
    );