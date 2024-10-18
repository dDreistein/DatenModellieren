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

ALTER TABLE Kunden ADD Krankenkasse VARCHAR(50)

INSERT INTO Mitarbeiter 
    (Vorname, Nachname, Monatslohn) 
VALUES
    ('Rafael', 'Szanislo', 5500),
    ('Jürg', 'Müller', 5200),
    ('Markus', 'Meister', 4800),
    ('Franco', 'DellAmore', 5050)
;

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES
('Beatrix', 'Hugentobler', 'w', '19630324', (SELECT OrtId FROM Orte WHERE PLZ='6032'), 'CSS Versicherung'),
('Viktor', 'Meyer', 'm', '19601218', (SELECT OrtId FROM Orte WHERE PLZ='6012'), 'Group Mutuel'),
('Yanick', 'Merz', 'm', '19960803', (SELECT OrtId FROM Orte WHERE PLZ='6043'), NULL),
('Joshua', 'Pfister', 'm', '20010528', (SELECT OrtId FROM Orte WHERE PLZ='6030'), 'Concordia'),
('Franziska', 'Tobler', 'w', '19750304', (SELECT OrtId FROM Orte WHERE PLZ='6000'), 'CSS Versicherung'),
('Michele', 'd’Angelo', 'm', '20020630', (SELECT OrtId FROM Orte WHERE PLZ='6003'), 'CSS Versicherung'),
('Petra', 'Nussbaumer', 'w', '19690825', (SELECT OrtId FROM Orte WHERE PLZ='6016'), 'Group Mutuel'),
('Admir', 'Smajic', 'm', '19630907', (SELECT OrtId FROM Orte WHERE PLZ='6020'), 'CSS Versicherung'),
('Lars', 'Ramseier', 'm', '19990125', (SELECT OrtId FROM Orte WHERE Ortname='Gisikon'), NULL),
('Erna', 'Tschurtschenthaler', 'w', '19891113', (SELECT OrtId FROM Orte WHERE PLZ='6024'), 'CSS Versicherung');

