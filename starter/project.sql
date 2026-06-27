PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS recipes;

-- ============================================
-- TABLA 1: Entidad principal de tu dominio
-- ============================================

CREATE TABLE students(  
    id_student INTEGER PRIMARY KEY AUTOINCREMENT,
    name_student TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age_student INTEGER CHECK(age_student >= 16),
    email_student TEXT NOT NULL UNIQUE,
    registration_date_student DATE NOT NULL,
    level TEXT NOT NULL
);

CREATE TABLE recipes (
    id_recipe INTEGER PRIMARY KEY AUTOINCREMENT,
    name_recipe TEXT NOT NULL,
    difficulty_level_recipe INTEGER CHECK(difficulty_level_recipe BETWEEN 1 AND 3),
    prep_time_minutes_recipe INTEGER
);

-- ============================================
-- TABLA 2: Segunda entidad de tu dominio
-- ============================================

CREATE TABLE IF NOT EXISTS chefs (
    id_chef INTEGER PRIMARY KEY AUTOINCREMENT,
    name_chef TEXT NOT NULL,
    last_name_chef TEXT NOT NULL,
    phone_number_chef TEXT NOT NULL UNIQUE,
    specialty_chef TEXT NOT NULL,
    is_active   INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 3: Tercera entidad o tabla de relación
-- ============================================

--RELACIÓN ENTRE LOS CHEFS Y LAS RECETAS
CREATE TABLE IF NOT EXISTS classes (
    id_class INTEGER PRIMARY KEY AUTOINCREMENT,kakakakakakakkak
    class_name TEXT NOT NULL,
    id_chef INTEGER,
    id_recipe INTEGER,
    FOREIGN KEY (id_chef) REFERENCES chefs(id_chef),
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);

-- ============================================
-- TODO: Insertar datos de prueba realistas
-- ============================================

--STUDENTS (80 registros)
INSERT INTO students (name_student, last_name, age_student, email_student, registration_date_student, level) VALUES
('Juan','Pérez',20,'juan.perez@email.com','2024-01-15','Principiante'),
('María','Rodríguez',19,'maria.rodriguez@email.com','2024-01-16','Intermedio'),
('Carlos','Sánchez',25,'carlos.sanchez@email.com','2024-01-20','Avanzado'),
('Valentina','Gómez',17,'valentina.gomez@email.com','2024-02-01','Principiante'),
('Andrés','López',32,'andres.lopez@email.com','2024-02-05','Intermedio'),
('Camila','Torres',21,'camila.torres@email.com','2024-02-10','Principiante'),
('Mateo','Ramírez',28,'mateo.ramirez@email.com','2024-02-12','Avanzado'),
('Isabella','Castro',23,'isabella.castro@email.com','2024-02-15','Intermedio'),
('Sebastián','Morales',18,'sebastian.morales@email.com','2024-02-20','Principiante'), 
('Luciana','Herrera',26,'luciana.herrera@email.com','2024-02-25','Avanzado'),
('Daniel','Vargas',30,'daniel.vargas@email.com','2024-03-01','Intermedio'),
('Gabriela','Mendoza',22,'gabriela.mendoza@email.com','2024-03-05','Principiante'),
('Felipe','Rojas',19,'felipe.rojas@email.com','2024-03-10','Intermedio'),
('Mariana','Ortiz',24,'mariana.ortiz@email.com','2024-03-12','Avanzado'),
('Nicolás','Jiménez',27,'nicolas.jimenez@email.com','2024-03-15','Principiante'),
('Laura','Ríos',22,'laura.rios@email.com','2024-03-18','Intermedio'),
('Pedro','Mora',24,'pedro.mora@email.com','2024-03-20','Avanzado'),
('Juliana','León',21,'juliana.leon@email.com','2024-03-22','Principiante'),
('Santiago','Ruiz',29,'santiago.ruiz@email.com','2024-03-25','Intermedio'),
('Sara','Cárdenas',23,'sara.cardenas@email.com','2024-03-27','Avanzado'),
('David','Navarro',26,'david.navarro@email.com','2024-04-01','Principiante'),
('Paula','Gil',20,'paula.gil@email.com','2024-04-02','Intermedio'),
('Julián','Suárez',31,'julian.suarez@email.com','2024-04-03','Avanzado'),
('Natalia','Vega',22,'natalia.vega@email.com','2024-04-04','Principiante'),
('Miguel','Parra',27,'miguel.parra@email.com','2024-04-05','Intermedio'),
('Karen','Acosta',24,'karen.acosta@email.com','2024-04-06','Avanzado'),
('Esteban','Silva',19,'esteban.silva@email.com','2024-04-07','Principiante'),
('Tatiana','Luna',21,'tatiana.luna@email.com','2024-04-08','Intermedio'),
('Kevin','Arias',23,'kevin.arias@email.com','2024-04-09','Avanzado'),
('Diana','Mejía',25,'diana.mejia@email.com','2024-04-10','Principiante'),
('Oscar','Pineda',28,'oscar.pineda@email.com','2024-04-11','Intermedio'),
('Mónica','Reyes',22,'monica.reyes@email.com','2024-04-12','Avanzado'),
('Cristian','Bautista',20,'cristian.bautista@email.com','2024-04-13','Principiante'),
('Angie','Forero',21,'angie.forero@email.com','2024-04-14','Intermedio'),
('Jhon','Galindo',24,'jhon.galindo@email.com','2024-04-15','Avanzado'),
('Lorena','Rincón',26,'lorena.rincon@email.com','2024-04-16','Principiante'),
('Mauricio','Prieto',30,'mauricio.prieto@email.com','2024-04-17','Intermedio'),
('Viviana','Peña',22,'viviana.pena@email.com','2024-04-18','Avanzado'),
('Alejandro','Beltrán',27,'alejandro.beltran@email.com','2024-04-19','Principiante'),
('Carolina','Moya',23,'carolina.moya@email.com','2024-04-20','Intermedio'),
('Ricardo','Salazar',29,'ricardo.salazar@email.com','2024-04-21','Avanzado'),
('Daniela','Nieto',20,'daniela.nieto@email.com','2024-04-22','Principiante'),
('Samuel','Camacho',18,'samuel.camacho@email.com','2024-04-23','Intermedio'),
('Andrea','Benítez',24,'andrea.benitez@email.com','2024-04-24','Avanzado'),
('Jonathan','Cuevas',25,'jonathan.cuevas@email.com','2024-04-25','Principiante'),
('Melissa','Valencia',22,'melissa.valencia@email.com','2024-04-26','Intermedio'),
('Tomás','Quintero',26,'tomas.quintero@email.com','2024-04-27','Avanzado'),
('Yuliana','Soto',21,'yuliana.soto@email.com','2024-04-28','Principiante'),
('Brayan','Murillo',23,'brayan.murillo@email.com','2024-04-29','Intermedio'),
('Luisa','Cifuentes',28,'luisa.cifuentes@email.com','2024-04-30','Avanzado'),
('Alejandra','Pardo',22,'alejandra.pardo@email.com','2024-05-01','Principiante'),
('Emilio','Valdés',27,'emilio.valdes@email.com','2024-05-02','Intermedio'),
('Natalia','Cepeda',19,'natalia.cepeda@email.com','2024-05-03','Avanzado'),
('Sergio','Barrios',24,'sergio.barrios@email.com','2024-05-04','Principiante'),
('Paola','Duarte',21,'paola.duarte@email.com','2024-05-05','Intermedio'),
('Javier','Cabrera',30,'javier.cabrera@email.com','2024-05-06','Avanzado'),
('Karen','Montoya',18,'karen.montoya@email.com','2024-05-07','Principiante'),
('Diego','Fuentes',26,'diego.fuentes@email.com','2024-05-08','Intermedio'),
('Laura','Benavides',23,'laura.benavides@email.com','2024-05-09','Avanzado'),
('Cristina','Amaya',20,'cristina.amaya@email.com','2024-05-10','Principiante'),
('Fernando','Sierra',28,'fernando.sierra@email.com','2024-05-11','Intermedio'),
('Valeria','Correa',22,'valeria.correa@email.com','2024-05-12','Avanzado'),
('Andrés','Zamora',31,'andres.zamora@email.com','2024-05-13','Principiante'),
('Julieta','Escobar',25,'julieta.escobar@email.com','2024-05-14','Intermedio'),
('Camilo','Velasco',29,'camilo.velasco@email.com','2024-05-15','Avanzado'),
('Daniela','Rosero',21,'daniela.rosero@email.com','2024-05-16','Principiante'),
('Miguel','Bohórquez',24,'miguel.boho@email.com','2024-05-17','Intermedio'),
('Tatiana','Patiño',26,'tatiana.patino@email.com','2024-05-18','Avanzado'),
('Kevin','Maldonado',19,'kevin.maldonado@email.com','2024-05-19','Principiante'),
('Lorena','Santacruz',27,'lorena.santacruz@email.com','2024-05-20','Intermedio'),
('Bruno','Rincón',22,'bruno.rincon@email.com','2024-05-21','Avanzado'),
('Carla','Téllez',23,'carla.tellez@email.com','2024-05-22','Principiante'),
('Mauricio','Bustos',32,'mauricio.bustos@email.com','2024-05-23','Intermedio'),
('Silvia','Galvis',20,'silvia.galvis@email.com','2024-05-24','Avanzado'),
('Jorge','Méndez',28,'jorge.mendez@email.com','2024-05-25','Principiante'),
('Verónica','Becerra',24,'veronica.becerra@email.com','2024-05-26','Intermedio'),
('Iván','Saavedra',25,'ivan.saavedra@email.com','2024-05-27','Avanzado'),
('Patricia','Rueda',29,'patricia.rueda@email.com','2024-05-28','Principiante'),
('Leonardo','Meza',21,'leonardo.meza@email.com','2024-05-29','Intermedio'),
('Mónica','Villamizar',23,'monica.villamizar@email.com','2024-05-30','Avanzado');


--CHEFS (30 registros)
INSERT INTO chefs (name_chef, last_name_chef, phone_number_chef, specialty_chef, is_active) VALUES
('Adrián','García','3001234567','Cocina Española',1),
('Elena','Martínez','3001234568','Repostería Francesa',1),
('Marco','Rossi','3001234569','Pasta Italiana',1),
('Yuki','Tanaka','3001234570','Sushi y Ramen',1),
('Lucía','Fernández','3001234571','Cocina Vegana',1),
('Jean','Pierre','3001234572','Alta Cocina',1),
('Sandra','López','3001234573','Panadería Artesanal',1),
('Ricardo','Gómez','3001234574','Parrilla y Asados',1),
('Ana','Torres','3001234575','Cocina Mexicana',1),
('Liam','Smith','3001234576','Comida Callejera',1),
('Sonia','Castillo','3001234577','Postres Saludables',1),
('Mateo','Díaz','3001234578','Comida Mediterránea',1),
('Carmen','Ruiz','3001234579','Cocina Típica',1),
('Hassan','Ali','3001234580','Cocina Árabe',1),
('Sofía','Vega','3001234581','Tapas y Coctelería',1),
('Roberto','Salinas','3501110001','Cocina Peruana',1),
('Patricia','Núñez','3501110002','Pastelería Creativa',1),
('Gustavo','Lara','3501110003','Carnes Maduradas',1),
('Melissa','Campos','3501110004','Cocina Vegetariana',1),
('Óscar','Villalba','3501110005','Panadería Gourmet',1),
('Claudia','Pérez','3501110006','Comida Colombiana',1),
('Renato','Silva','3501110007','Cocina Brasileña',1),
('Helena','Costa','3501110008','Cocina Portuguesa',1),
('Tomás','Rivera','3501110009','Mariscos y Pescados',1),
('Carolina','Vargas','3501110010','Postres Internacionales',1),
('Alberto','Mora','3501110011','Cocina Asiática',1),
('Paula','Herrera','3501110012','Cocina Fusión',1),
('Nicolás','Acuña','3501110013','Parrilla Argentina',1),
('Diana','Pardo','3501110014','Alta Repostería',1),
('Sebastián','Luna','3501110015','Tapas Españolas',1);


--RECIPES (30 registros)
INSERT INTO recipes (name_recipe, difficulty_level_recipe, prep_time_minutes_recipe) VALUES
('Paella Valenciana',3,90),
('Macarons de Frambuesa',3,120),
('Fettuccine Alfredo',1,25),
('Sushi Roll California',2,45),
('Hamburguesa de Lentejas',1,35),
('Soufflé de Queso',3,60),
('Pan de Masa Madre',3,240),
('Tacos al Pastor',2,50),
('Hummus Clásico',1,15),
('Ratatouille',2,70),
('Tiramisú',2,40),
('Gazpacho Andaluz',1,20),
('Curry de Pollo',2,45),
('Brownie de Chocolate',1,40),
('Risotto de Hongos',2,50),
('Lomo Saltado',2,40),
('Cheesecake de Maracuyá',2,90),
('Bife de Chorizo',3,60),
('Lasaña Vegetariana',2,50),
('Croissants Artesanales',3,180),
('Ajiaco Santafereño',2,75),
('Feijoada Brasileña',3,120),
('Bacalao a la Portuguesa',2,70),
('Ceviche Mixto',2,30),
('Pavlova de Frutas',3,100),
('Pad Thai',3,55),
('Pollo Teriyaki',2,45),
('Choripán Argentino',1,25),
('Éclair de Chocolate',3,90),
('Patatas Bravas',1,20);

--CLASSES (30 registros)
INSERT INTO classes (class_name, id_chef, id_recipe) VALUES
('Masterclass de Arroces',1,1),
('Taller de Dulces Franceses',2,2),
('Pasta Desde Cero',3,3),
('Noche de Sushi',4,4),
('Cocina Green',5,5),
('Secretos del Soufflé',6,6),
('Iniciación al Pan',7,7),
('Fiesta del Taco',9,8),
('Sabores del Oriente',14,9),
('Vegetales al Horno',12,10),
('Postres Italianos',3,11),
('Cocina Fría de Verano',13,12),
('Especias del Mundo',14,13),
('Repostería para Niños',11,14),
('Arroz Cremoso Gourmet',6,15),
('Sabores del Perú',16,16),
('Técnicas de Cheesecake',17,17),
('Maestría en Carnes',18,18),
('Cocina Verde Gourmet',19,19),
('Panadería Europea',20,20),
('Tradición Colombiana',21,21),
('Festival Brasileño',22,22),
('Especialidades Portuguesas',23,23),
('Mariscos para Todos',24,24),
('Postres de Autor',25,25),
('Street Food Asiático',26,26),
('Fusión Contemporánea',27,27),
('Parrilla Profesional',28,28),
('Alta Pastelería Francesa',29,29),
('Tapas y Aperitivos',30,30);

-- Incluir al menos 1 registro "huérfano" en main_items
INSERT INTO classes
(class_name, id_chef, id_recipe)
VALUES
('Taller de Innovación Culinaria', 15, NULL),
('Laboratorio de Cocina Creativa', 8, NULL),
('Clase Experimental', 10, NULL);

-- ============================================
-- CONSULTA 1: INNER JOIN principal
-- Mostrar cada clase con el chef encargado
-- Muestra solo los registros con relación en ambas
-- ============================================
SELECT
    c.class_name AS clase,
    ch.name_chef || ' ' || ch.last_name_chef AS chef --|| une los textos y '' pone un espacio entre ellos
FROM classes c
INNER JOIN chefs ch ON c.id_chef = ch.id_chef;

-- ============================================
-- CONSULTA 2: JOIN con tres tablas
-- Mostrar clase, chef y receta:
-- ============================================

SELECT 
    c.class_name AS clase,
    ch.name_chef || '' || ch.last_name_chef AS chef,
    r.name_recipe AS receta
FROM classes c
INNER JOIN chefs ch ON c.id_chef = ch.id_chef
INNER JOIN recipes r ON c.id_recipe = r.id_recipe;


-- ============================================
-- CONSULTA 3: LEFT JOIN — todos los registros
-- Mostrar todas las clases aunque no tengan receta
-- ============================================

SELECT 
    c.class_name AS clase,
    r.name_recipe AS receta
FROM classes C
LEFT JOIN recipes r ON c.id_recipe = r.id_recipe;

-- ============================================
-- CONSULTA 4: Detectar huérfanos (registros sin actividad)
-- Agregar WHERE para Buscar clases sin receta
-- ============================================

SELECT
    c.class_name AS clase,
    r.name_recipe AS receta
FROM classes c
LEFT JOIN recipes r ON r.id_recipe = c.id_recipe
WHERE r.id_recipe IS NULL;

-- ============================================
-- CONSULTA 5: Reporte agregado con LEFT JOIN + COUNT
-- Cantidad de clases por chef
-- ============================================

SELECT
    ch.name_chef  AS chef,
    COUNT(c.id_class)  AS total_clases          
FROM chefs ch  
LEFT JOIN classes c ON c.id_chef = ch.id_chef
GROUP BY ch.id_chef
ORDER BY total_clases DESC;