CREATE DATABASE FitnessCenter;
GO

USE FitnessCenter;

CREATE TABLE Orte (
    OrtId int not null IDENTITY, 
    PLZ varchar(10), 
    Ortname varchar(50) not null, 
    Kanton char(2), 
    CONSTRAINT pk_Orte PRIMARY KEY(OrtId)
);

CREATE TABLE Kunden (
    Kundennummer int IDENTITY(1,1) not null,
    Vorname varchar(30) not null,
    Nachname varchar(30) not null, 
    Geschlecht char(1),
    Geburtsdatum smalldatetime, 
    Wohnort int, 
    CONSTRAINT pk_Kunden PRIMARY KEY (Kundennummer), 
    CONSTRAINT fk_KundenOrte FOREIGN KEY (Wohnort) REFERENCES Orte(OrtId)
);

CREATE TABLE Mitarbeiter (
    Personalnummer int IDENTITY(1,1) not null,
    Vorname VARCHAR(30) not null,
    Nachname VARCHAR(30) not null,
    CONSTRAINT pk_Mitarbeiter PRIMARY KEY (Personalnummer)
);

ALTER TABLE Mitarbeiter ADD Monatslohn INT;

CREATE TABLE Betreuung (
    Kundennummer int not null,
    Personalnummer int not null,
    CONSTRAINT fk_BetreuungKunden FOREIGN KEY (Kundennummer) REFERENCES Kunden(Kundennummer) ON DELETE CASCADE,
    CONSTRAINT fk_BetreuungMitarbeiter FOREIGN KEY (Personalnummer) REFERENCES Mitarbeiter(Personalnummer) ON DELETE CASCADE
);

ALTER TABLE Betreuung ADD Notizen VARCHAR(MAX);
ALTER TABLE Betreuung ADD VonKKBezahlt BIT DEFAULT 0;

CREATE TABLE Krankenkassen(
    KrankenkassenID int IDENTITY(1,1) NOT NULL,
    KrankenkassenName VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Krankenkassen PRIMARY KEY (KrankenkassenID)
);

ALTER TABLE Kunden ADD Krankenkasse INT NULL
ALTER TABLE Kunden ADD CONSTRAINT fk_KundenKrankenkasse FOREIGN KEY (Krankenkasse) REFERENCES Krankenkassen(KrankenkassenID)

INSERT INTO Mitarbeiter 
    (Vorname, Nachname, Monatslohn) 
VALUES
    ('Rafael', 'Szanislo', 5500),
    ('Jürg', 'Müller', 5200),
    ('Markus', 'Meister', 4800),
    ('Franco', 'DellAmore', 5050)
;

SELECT * FROM Mitarbeiter;
