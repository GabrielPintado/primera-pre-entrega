DROP SCHEMA	IF EXISTS MUSICA_PINTADO;
CREATE SCHEMA MUSICA_PINTADO;
USE MUSICA_PINTADO;

-- Tabla artistas : Detalla los artistas dentro de la aplicación 
CREATE TABLE Artistas (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Genero VARCHAR(50),
    Pais VARCHAR(50),
    Edad INT,
    AlbumesTotal INT,
    CancionesTotal INT,
    Reproducciones INT
);

-- Tabla albumes : Detalla los albumes disponibles de la aplicación y a quien pertenece
CREATE TABLE Albumes (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Publicacion INT,
    Genero VARCHAR(50),
    Duracion INT,
    NroCanciones INT,
    ArtistaID INT UNSIGNED,
    Reproducciones INT,
    FOREIGN KEY (ArtistaID) REFERENCES Artistas(ID)
);

-- Tabla canciones : Detalla las canciones disponibles en la aplicación, a que album pertenece y a que artista pertenece
CREATE TABLE Canciones (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Duracion INT,
    Genero VARCHAR(50),
    AlbumID INT UNSIGNED,
    ArtistaID INT UNSIGNED,
    Compositores VARCHAR(100),
    Letra TEXT,
    FOREIGN KEY (AlbumID) REFERENCES Albumes(ID),
    FOREIGN KEY (ArtistaID) REFERENCES Artistas(ID)
);

-- Tabla usuarios : Detalla los datos de los usuarios de la aplicación
CREATE TABLE Usuarios (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    CorreoElectronico VARCHAR(100),
    PreferenciasMusicales VARCHAR(100),
    FechaRegistro DATE
);

-- Tabla playlists : Detalla las listas de reproducción que crean los usuarios dentro de la aplicación
CREATE TABLE Playlists (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    UsuarioID INT UNSIGNED,
    Fecha DATE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla comentarios : Detalla los comentarios que dejan los usuarios en albumes
CREATE TABLE Comentarios (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Contenido TEXT,
    FechaPublicacion DATE,
    UsuarioID INT UNSIGNED,
    AlbumID INT UNSIGNED,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
    FOREIGN KEY (AlbumID) REFERENCES Albumes(ID)
);

-- Tabla Eventos : Detalla los distintos eventos que tienen los artistas
CREATE TABLE Eventos (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ubicacion VARCHAR(100),
    Fecha DATE,
    ArtistasParticipantes VARCHAR(200)
);

-- tabla fandom : Detalla las interacciones entre los seguidores y el artista
CREATE TABLE Fandom (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Contenido TEXT,
    FechaPublicacion DATE,
    UsuarioID INT UNSIGNED,
    ArtistaID INT UNSIGNED,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
    FOREIGN KEY (ArtistaID) REFERENCES Artistas(ID)
);


