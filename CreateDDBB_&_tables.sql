CREATE DATABASE IF NOT EXISTS Proyecto;

USE Proyecto;

-- Tabla usuario
CREATE TABLE IF NOT EXISTS usuario (
    userid INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    mail VARCHAR(100) UNIQUE NOT NULL,
    passwd VARCHAR(255) NOT NULL,
    rol ENUM('Alumno', 'Profesor', 'Administrador') NOT NULL,
    cardid VARCHAR(50) UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla aula
CREATE TABLE IF NOT EXISTS aula (
    aulaid INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(200),
    deviceid VARCHAR(50) UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla horario
CREATE TABLE IF NOT EXISTS horario (
    horarioid INT AUTO_INCREMENT PRIMARY KEY,
    dia ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    hini TIME NOT NULL,
    hfin TIME NOT NULL,
    aulaid INT NOT NULL,
    userid INT NOT NULL,
    FOREIGN KEY (aulaid) REFERENCES aula(aulaid) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (userid) REFERENCES usuario(userid) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla asignatura
CREATE TABLE IF NOT EXISTS asignatura (
    asignid INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    userid INT NOT NULL,
    horarioid INT NOT NULL,
    FOREIGN KEY (userid) REFERENCES usuario(userid) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (horarioid) REFERENCES horario(horarioid) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla fichaje
CREATE TABLE IF NOT EXISTS fichaje (
    fichajeid INT AUTO_INCREMENT PRIMARY KEY,
    hentr DATETIME NOT NULL,
    hsal DATETIME,
    cardid VARCHAR(50) NOT NULL,
    deviceid VARCHAR(50) NOT NULL,
    FOREIGN KEY (cardid) REFERENCES usuario(cardid) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (deviceid) REFERENCES aula(deviceid) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
