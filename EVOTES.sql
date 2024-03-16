CREATE TABLE `Candidato`  (
  `ID` int NOT NULL,
  `Nombre` varchar(50) NULL,
  `CargargoID` int NULL,
  `InstitucionID` int NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `CandidatoSalon`  (
  `ID` int NOT NULL,
  `CandidatoID` int NULL,
  `SalonID` int NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Cargo`  (
  `ID` int NOT NULL,
  `NombreCargo` varchar(255) NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `CedeJornada`  (
  `ID` int NOT NULL,
  `SedeID` int NULL,
  `JornadaID` int NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Curso`  (
  `ID` int NOT NULL,
  `Nombre` varchar(50) NULL,
  `JornadaID` int NOT NULL,
  `InstitucionID` int NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `default`  ();

CREATE TABLE `Grado`  (
  `ID` int NOT NULL,
  `Nombre` varchar(255) NULL,
  `CursoID` int NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `InstitucionEducativa`  (
  `ID` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Departamento` varchar(50) NOT NULL,
  `CodigoDane` varcharv NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `JornadaAcademica`  (
  `ID` int NOT NULL,
  `Nombre` varchar(30) NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `ResultadoVotacion`  (
  `ID` int NOT NULL,
  `CandidatoID` int NOT NULL,
  `CantidadVotos` int NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `SalonClases`  (
  `ID` int NOT NULL,
  `Nombre` varchar(255) NULL,
  `CursoID` int NULL,
  `SedeID` int NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Sede`  (
  `ID` int NOT NULL,
  `Nombre` varchar(255) NULL,
  `Direccion` varchar(255) NULL,
  `Departamento` varchar(255) NULL,
  `InstitucionID` int NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `table_1`  ();

CREATE TABLE `Usuario`  (
  `ID` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `Rol` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Votacion`  (
  `ID` int NOT NULL,
  `CandidatoID` int NULL,
  `FechaHora` datetime NULL,
  `UsuarioID` int NULL,
  PRIMARY KEY (`ID`)
);

ALTER TABLE `Candidato` ADD CONSTRAINT `CargoID` FOREIGN KEY (`CargargoID`) REFERENCES `Cargo` (`ID`);
ALTER TABLE `Candidato` ADD CONSTRAINT `InstitucionID` FOREIGN KEY (`InstitucionID`) REFERENCES `InstitucionEducativa` (`Id`);
ALTER TABLE `CandidatoSalon` ADD CONSTRAINT `CandidatoID` FOREIGN KEY (`CandidatoID`) REFERENCES `Candidato` (`ID`);
ALTER TABLE `CandidatoSalon` ADD CONSTRAINT `SalonID` FOREIGN KEY (`SalonID`) REFERENCES `SalonClases` (`ID`);
ALTER TABLE `CedeJornada` ADD CONSTRAINT `SedeID` FOREIGN KEY (`SedeID`) REFERENCES `Sede` (`ID`);
ALTER TABLE `CedeJornada` ADD CONSTRAINT `JornadaID` FOREIGN KEY (`JornadaID`) REFERENCES `JornadaAcademica` (`Id`);
ALTER TABLE `Curso` ADD CONSTRAINT `JornadaID` FOREIGN KEY (`JornadaID`) REFERENCES `JornadaAcademica` (`ID`);
ALTER TABLE `Curso` ADD CONSTRAINT `InstitucionID` FOREIGN KEY (`InstitucionID`) REFERENCES `InstitucionEducativa` (`ID`);
ALTER TABLE `Grado` ADD CONSTRAINT `CursoID` FOREIGN KEY (`CursoID`) REFERENCES `Curso` (`ID`);
ALTER TABLE `ResultadoVotacion` ADD CONSTRAINT `CandidatoID` FOREIGN KEY (`CandidatoID`) REFERENCES `Candidato` (`ID`);
ALTER TABLE `SalonClases` ADD CONSTRAINT `CursoID` FOREIGN KEY (`CursoID`) REFERENCES `Curso` (`ID`);
ALTER TABLE `Sede` ADD CONSTRAINT `InstitucionID` FOREIGN KEY (`InstitucionID`) REFERENCES `InstitucionEducativa` (`Id`);
ALTER TABLE `Votacion` ADD CONSTRAINT `CandidatoID` FOREIGN KEY (`CandidatoID`) REFERENCES `Candidato` (`ID`);
ALTER TABLE `Votacion` ADD CONSTRAINT `UsuarioID` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`ID`);

