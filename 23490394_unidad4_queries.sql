SELECT * from profesor;

UPDATE Estudiante
SET Direccion = 'Calle Actualizada 456'
WHERE IDEstudiante = 1;

UPDATE Profesor
SET Email = 'carlos.ramirez.actualizado@uni.edu'
WHERE IDProfesor = 1;

UPDATE Carreras
SET TituloOtorgado = 'Ingeniero en Sistemas'
WHERE IDCarrera = 1;

select *from carreras;

DELETE FROM Aula
WHERE NombreAula = 'Taller de Electrónica';

select * from aula;

Select e.nombre, e.apellido from estudiante e;

SELECT * FROM Curso WHERE Creditos = '3';

SELECT Estudiante.Nombre AS NombreEstudiante, Curso.NombreCurso AS NombreCurso
FROM Inscripcion
INNER JOIN Estudiante ON Inscripcion.IDEstudiante = Estudiante.IDEstudiante
INNER JOIN Curso ON Inscripcion.IDCurso = Curso.IDCurso;

SELECT Estudiante.Nombre AS NombreEstudiante, Curso.NombreCurso AS NombreCurso
FROM Estudiante
LEFT JOIN Inscripcion ON Estudiante.IDEstudiante = Inscripcion.IDEstudiante
LEFT JOIN Curso ON Inscripcion.IDCurso = Curso.IDCurso;

SELECT Curso.NombreCurso AS NombreCurso, Estudiante.Nombre AS NombreEstudiante
FROM Inscripcion
RIGHT JOIN Curso ON Inscripcion.IDCurso = Curso.IDCurso
LEFT JOIN Estudiante ON Inscripcion.IDEstudiante = Estudiante.IDEstudiante;

SELECT Curso.NombreCurso, COUNT(Inscripcion.IDEstudiante) AS CantidadEstudiantes
FROM Curso
LEFT JOIN Inscripcion ON Curso.IDCurso = Inscripcion.IDCurso
GROUP BY Curso.NombreCurso;

SELECT * FROM Estudiante
WHERE FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';

SELECT * FROM Curso
ORDER BY NombreCurso ASC;

WITH InscripcionesPorEstudiante AS (
    SELECT IDEstudiante, COUNT(*) AS TotalInscripciones
    FROM Inscripcion
    GROUP BY IDEstudiante
)
SELECT E.Nombre, E.Apellido, I.TotalInscripciones
FROM InscripcionesPorEstudiante I
JOIN Estudiante E ON I.IDEstudiante = E.IDEstudiante
ORDER BY I.TotalInscripciones DESC
LIMIT 3;

WITH ConteoInscripciones AS (
    SELECT C.IDCurso, C.NombreCurso, C.IDDepatamento, COUNT(I.IDEstudiante) AS TotalInscritos
    FROM Curso C
    LEFT JOIN Inscripcion I ON C.IDCurso = I.IDCurso
    GROUP BY C.IDCurso, C.NombreCurso, C.IDDepatamento
),
CursoMaximoPorDepartamento AS (
    SELECT CI.IDDepatamento, CI.NombreCurso, CI.TotalInscritos,
    ROW_NUMBER() OVER (PARTITION BY CI.IDDepatamento ORDER BY CI.TotalInscritos DESC) AS Rnk
    FROM ConteoInscripciones CI
)
SELECT D.NombreDepartamento, CMPD.NombreCurso, CMPD.TotalInscritos
FROM CursoMaximoPorDepartamento CMPD
JOIN Departamentos D ON CMPD.IDDepatamento = D.IDDepartamento
WHERE CMPD.Rnk = 1;

SELECT P.Nombre, P.Apellido, COUNT(CP.IDCurso) AS CantidadCursos
FROM Profesor P
INNER JOIN CursosProfesor CP ON P.IDProfesor = CP.IDProfesor
GROUP BY P.IDProfesor, P.Nombre, P.Apellido
HAVING COUNT(CP.IDCurso) > 2;

WITH PromediosPorCurso AS (
    SELECT PC.IDPrograma, C.IDCurso, C.NombreCurso, AVG(I.Calificacion) AS PromedioCalificacion
    FROM ProgramasCurso PC
    INNER JOIN Curso C ON PC.IDCurso = C.IDCurso
    INNER JOIN Inscripcion I ON C.IDCurso = I.IDCurso
    GROUP BY PC.IDPrograma, C.IDCurso, C.NombreCurso
),
CursoTopPorPrograma AS (
    SELECT P.IDPrograma, P.NombreCurso, P.PromedioCalificacion,
    ROW_NUMBER() OVER (PARTITION BY P.IDPrograma ORDER BY P.PromedioCalificacion DESC) AS Rnk
    FROM PromediosPorCurso P
)
SELECT PE.NombrePrograma, CTPP.NombreCurso, CTPP.PromedioCalificacion
FROM CursoTopPorPrograma CTPP
INNER JOIN ProgramasEstudios PE ON CTPP.IDPrograma = PE.IDPrograma
WHERE CTPP.Rnk = 1;
