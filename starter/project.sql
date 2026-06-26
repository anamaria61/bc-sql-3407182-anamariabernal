-- ============================================
-- PROYECTO SEMANAL: DDL de tu Dominio
-- Semana 02 — DDL: Diseño de Esquemas
-- ============================================

DROP TABLE IF EXISTS chefs;

-- ============================================
-- TABLA 1: Entidad principal de tu dominio
-- ============================================
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