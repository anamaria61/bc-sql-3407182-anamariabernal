DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS recipes;

-- ============================================
-- TABLA 1: Entidad principal de tu dominio
-- ============================================

CREATE TABLE students(  
    id_students INTEGER PRIMARY KEY AUTOINCREMENT,
    name_students TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age_students INTEGER CHECK(age_students >= 16),
    email_students TEXT NOT NULL UNIQUE,
    registration_date DATE NOT NULL,
    level TEXT NOT NULL
);

CREATE TABLE recipes (
    id_recipe INTEGER PRIMARY KEY AUTOINCREMENT,
    name_recipe TEXT NOT NULL,
    difficulty_level INTEGER CHECK(difficulty_level BETWEEN 1 AND 3),
    prep_time_minutes INTEGER
);

-- ============================================
-- TABLA 2: Segunda entidad de tu dominio
-- ============================================

CREATE TABLE IF NOT EXISTS chefs (
    id_chefs INTEGER PRIMARY KEY AUTOINCREMENT,
    name_chef TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE,
    specialty_chef TEXT NOT NULL,
    is_active   INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 3: Tercera entidad o tabla de relación
-- ============================================

--RELACIÓN ENTRE LOS CHEFS Y LAS RECETAS
CREATE TABLE IF NOT EXISTS classes (
    id_class INTEGER PRIMARY KEY AUTOINCREMENT,
    class_name TEXT NOT NULL,
    id_chef INTEGER,
    id_recipe INTEGER,
    FOREIGN KEY (id_chef) REFERENCES chefs(id_chefs),
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);

-- ============================================
-- VERIFICACIÓN
-- ============================================

.tables
PRAGMA table_info(recipes);
PRAGMA table_info(chefs);
PRAGMA table_info(classes);


-- ============================================
-- SEMANA 03 — INSERT INTO, UPDATE, DELETE
-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

INSERT INTO students (name_students, last_name, age_students, email_students, registration_date, level) VALUES
('Juan', 'Pérez', 20, 'juan.perez@email.com', '2024-01-15', 'Principiante'),
('María', 'Rodríguez', 19, 'm.rodriguez88@gmail.com', '2024-01-16', 'Intermedio'),
('Carlos', 'Sánchez', 25, 'csanchez_chef@outlook.com', '2024-01-20', 'Avanzado'),
('Valentina', 'Gómez', 17, 'valen.gomez@estudiantes.edu', '2024-02-01', 'Principiante'),
('Andrés', 'López', 32, 'alopez_gastronomia@yahoo.com', '2024-02-05', 'Intermedio'),
('Camila', 'Torres', 21, 'camila.torres.co@email.com', '2024-02-10', 'Principiante'),
('Mateo', 'Ramírez', 28, 'mramirez_2024@gmail.com', '2024-02-12', 'Avanzado'),
('Isabella', 'Castro', 23, 'isabella.castro@icloud.com', '2024-02-15', 'Intermedio'),
('Sebastián', 'Morales', 18, 'sebas.mo@email.com', '2024-02-20', 'Principiante'),
('Luciana', 'Herrera', 26, 'lu.herrera97@outlook.com', '2024-02-25', 'Avanzado'),
('Daniel', 'Vargas', 30, 'dvargas_pro@gmail.com', '2024-03-01', 'Intermedio'),
('Gabriela', 'Mendoza', 22, 'gaby.mendoza@email.com', '2024-03-05', 'Principiante'),
('Felipe', 'Rojas', 19, 'felipe.rojas.dev@estudiantes.edu', '2024-03-10', 'Intermedio'),
('Mariana', 'Ortiz', 24, 'mari_ortiz_24@gmail.com', '2024-03-12', 'Avanzado'),
('Nicolás', 'Jiménez', 27, 'nico.jimenez.cocina@email.com', '2024-03-15', 'Principiante');

INSERT INTO recipes (name_recipe, difficulty_level, prep_time_minutes) VALUES
('Paella Valenciana', 3, 90),
('Macarons de Frambuesa', 3, 120),
('Fettuccine Alfredo', 1, 25),
('Sushi Roll California', 2, 45),
('Hamburguesa de Lentejas', 1, 35),
('Soufflé de Queso', 3, 60),
('Pan de Masa Madre', 3, 240),
('Tacos al Pastor', 2, 50),
('Hummus Clásico', 1, 15),
('Ratatouille', 2, 70),
('Tiramisú', 2, 40),
('Gazpacho Andaluz', 1, 20),
('Curry de Pollo', 2, 45),
('Brownie de Chocolate', 1, 40),
('Risotto de Hongos', 2, 50);

INSERT INTO chefs (name_chef, last_name, phone_number, specialty_chef, is_active) VALUES
('Adrián', 'García', '3001234567', 'Cocina Española', 0),
('Elena', 'Martínez', '3109876543', 'Repostería Francesa', 1),
('Marco', 'Rossi', '3202233445', 'Pasta Italiana', 1),
('Yuki', 'Tanaka', '3153344556', 'Sushi y Ramen', 0),
('Lucía', 'Fernández', '3114455667', 'Cocina Vegana', 1),
('Jean', 'Pierre', '3125566778', 'Alta Cocina', 1),
('Sandra', 'López', '3136677889', 'Panadería Artesanal', 1),
('Ricardo', 'Gómez', '3147788990', 'Parrilla y Asados', 0),
('Ana', 'Torres', '3168899001', 'Cocina Mexicana', 1),
('Liam', 'Smith', '3179900112', 'Comida Callejera', 1),
('Sonia', 'Castillo', '3180011223', 'Postres Saludables', 1),
('Mateo', 'Díaz', '3191122334', 'Comida Mediterránea', 1),
('Carmen', 'Ruiz', '3212233445', 'Cocina Típica', 0),
('Hassan', 'Ali', '3223344556', 'Cocina Árabe', 1),
('Sofía', 'Vega', '3234455667', 'Coctelería y Tapas', 0);

INSERT INTO classes (class_name, id_chef, id_recipe) VALUES
('Masterclass de Arroces', 1, 1),
('Taller de Dulces Franceses', 2, 2),
('Pasta Desde Cero', 3, 3),
('Noche de Sushi', 4, 4),
('Cocina Green', 5, 5),
('Secretos del Soufflé', 6, 6),
('Iniciación al Pan', 7, 7),
('Fiesta del Taco', 9, 8),
('Sabores del Oriente', 14, 9),
('Vegetales al Horno', 12, 10),
('Postres Italianos', 3, 11),
('Cocina Fría de Verano', 13, 12),
('Especias del Mundo', 14, 13),
('Repostería para Niños', 11, 14),
('Arroz Cremoso Gourmet', 6, 15),
('Cocina de Autor', 12, 1),
('Pastelería Avanzada', 15, 2);

-- ============================================
-- PARTE 2: UPDATE
-- ============================================
-- Actualiza una columna de una fila específica (por PK)
-- Actualización del apellido de Jean (id=6) a Piezas
UPDATE chefs
SET last_name = 'Piezas'
WHERE id_chefs = 6;

SELECT id_chefs, name_chef, last_name
FROM chefs
WHERE id_chefs = 6;

-- Actualiza múltiples columnas de una fila
--Actualizar fecha de registro y el email de Sebastián Morales (id=9)
UPDATE students
SET registration_date = '2026-02-20',
    email_students = 'sebas_18.mo@email.com'
WHERE id_students = 9;

SELECT id_students, name_students, email_students, registration_date, level
FROM students
WHERE id_students = 9;

-- Actualiza múltiples filas con una condición de negocio
-- Aplicar un aumento de 15 minutos en la duración de las recetas de nivel de dificultadad 3.
UPDATE recipes
SET prep_time_minutes = prep_time_minutes + 15
WHERE difficulty_level = 3;

SELECT id_recipe, name_recipe, prep_time_minutes
FROM recipes
WHERE difficulty_level = 3;

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

SELECT id_class, class_name, id_recipe
FROM classes
WHERE id_chef IN (10, 12, 15);
DELETE FROM classes 
WHERE id_chef IN (10, 12, 15);