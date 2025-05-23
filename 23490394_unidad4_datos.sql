--Insertar en Departamento
INSERT INTO Departamentos(NombreDepartamento, Edificio) VALUES
('Ingeniería de Sistemas', 'Edificio A'),
('Matemáticas', 'Edificio B'),
('Humanidades', 'Edificio C');

-- Insertar en Campus
INSERT INTO Campus (NombreCampus, DireccioCampus) VALUES
('Campus Central', 'Av. Universitaria 1000'),
('Campus Norte', 'Calle Ciencia 123');

-- Insertar en Carreras
INSERT INTO Carreras (NombreCarrera, TituloOtorgado) VALUES
('Ingeniería de Sistemas', 'Ingeniero de Sistemas'),
('Matemáticas Aplicadas', 'Licenciado en Matemáticas');

-- Insertar en Estudiantes
INSERT INTO Estudiante(Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera) VALUES
('Juan', 'Pérez', '2000-05-15', 'Calle 123', 'juan.perez@example.com', 1),
('María', 'López', '1999-08-23', 'Av. Principal 456', 'maria.lopez@example.com', 2);

-- Insertar en Profesores
INSERT INTO Profesor(Nombre, Apellido, Titulo, IDDepartamento, Email) VALUES
('Carlos', 'Ramírez', 'Dr. en Computación', 1, 'carlos.ramirez@uni.edu'),
('Ana', 'Gómez', 'MSc. en Matemáticas', 2, 'ana.gomez@uni.edu');

-- Insertar en Cursos
INSERT INTO Curso (NombreCurso, Descripcion, Creditos, Semestre, IDDepatamento, IDCampus) VALUES
('Estructuras de Datos', 'Curso avanzado de estructuras', '4', '2025-1', 1, 1),
('Álgebra Lineal', 'Espacios vectoriales y matrices', '3', '2025-1', 2, 1);

-- Insertar en Inscripciones
INSERT INTO Inscripcion (IDEstudiante, IDCurso, Calificacion) VALUES
(1, 1, 85),
(2, 2, 90);

INSERT INTO Aula (NombreAula, Capacidad, Ubicacion)
VALUES
  ('Aula 101', '40', 'Edificio A - Primer piso'),
  ('Aula 102', '35', 'Edificio A - Primer piso'),
  ('Laboratorio de Computo', '25', 'Edificio B - Segundo piso'),
  ('Taller de Electrónica', '20', 'Edificio C - Planta baja'),
  ('Aula Magna', '100', 'Edificio Principal - Auditorio'),
  ('Sala de Conferencias', '60', 'Edificio D - Tercer piso');

-- Insertar en Horarios
INSERT INTO Horario (IDCurso, idaula,Fechainicio, Fechafin, Horainicio, Horafin) VALUES
(1, 2,'2025-03-01', '2025-06-30', '08:00', '10:00'),
(2, 3,'2025-03-01', '2025-06-30', '10:00', '12:00');

-- Insertar en CursosProfesores
INSERT INTO CursosProfesor (IDCurso, IDProfesor) VALUES
(1, 1),
(2, 2);

-- Insertar en ProgramasEstudio
INSERT INTO ProgramasEstudios (NombrePrograma, Descripcionprograma) VALUES
('Ingeniería de Software', 'Formación en desarrollo y análisis de software'),
('Matemáticas Puras', 'Estudios teóricos en matemática pura');

-- Insertar en ProgramasCursos
INSERT INTO ProgramasCurso (IDPrograma, IDCurso) VALUES
(1, 1),
(2, 2);
