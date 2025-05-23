create table Estudiante
(
    IDEstudiante SERIAL primary key not null,
    Nombre VARCHAR(100)not null ,
    apellido VARCHAR(100)NOT NULL ,
    FechaNacimiento VARCHAR(100)NOT  NULL,
    Direccion VARCHAR(100)NOT NULL,
    Ciudad VARCHAR (100)NOT  NULL,
    Email VARCHAR(100) not null unique
);

create table Curso
(
    IDCurso SERIAL primary key  not null,
    NombreCurso VARCHAR (100) not null,
    Descripcion VARCHAR(100)not null,
    Creditos VARCHAR(100)not null,
    Semestre varchar (100)not null,

    IDDepatamento integer not null references Departamentos(IDDepartamento)
);
create table Inscripcion
(
    IDInscripciones SERIAL primary key not null,
    IDEstudiante integer not null references Estudiante(IDEstudiante),
    IDCurso integer not null references Curso(IDCurso),
    FechaInscripcion date default current_date,
    calificacion decimal(10,2) not null
);

create table Profesor
(
    IDProfesor SERIAL primary key not null,
    Nombre VARCHAR(100) not null,
    Apellido VARCHAR(100)not null,
    Titulo VARCHAR(100)not null ,
    IDDepartamento integer not null references Departamentos(IDDepartamento)
);

create table Departamentos
(
    IDDepartamento serial PRIMARY KEY ,
    NombreDepartamento VARCHAR(100)not null,
    Edificio VARCHAR(100)not null
);

create table Aula
(
    IDAula serial PRIMARY KEY not null,
    NombreAula VARCHAR(100) not null,
    Capacidad VARCHAR(100),
    Ubicacion VARCHAR(100)
);
create table Horario
(
    IDHorarios serial primary key ,
    IDCurso integer not null references Curso(IDCurso) ,
    IDAula integer not null references Aula(IDAula),
    Fechafin date,
    Fechainicio date,
    Horainicio time,
    Horafin time
);
create table CursosProfesor
(
  IDCursoProfesor serial PRIMARY KEY,
  IDCurso integer not null references Curso(IDCurso),
  IDProfesor integer not null references Profesor(IDProfesor)
);
create table ProgramasEstudios
(
    IDPrograma serial PRIMARY KEY ,
    NombrePrograma varchar(100),
    Descripcionprograma VARCHAR(100)
);
create table ProgramasCurso
(
    IDProgramaCurso serial primary key,
    IDPrograma      integer not null references ProgramasEstudios (IDPrograma) ,
    IDCurso         integer not null references Curso(IDCurso)
);
create table Campus
(
    IDCampus serial primary key,
    NombreCampus varchar(100)not null,
    DireccioCampus varchar(100)not null
);
create table Carreras
(
  IDCarrera serial PRIMARY KEY ,
  NombreCarrera varchar(100),
  TituloOtorgado varchar(100)
);

alter table Estudiante
add column IDCarrera  integer not null references Carreras(IDCarrera);

alter table Curso
add column IDCampus  integer not null references Campus(IDCampus);

alter table Profesor
add column Email varchar(100)not null;

alter table Estudiante
drop column Ciudad;
