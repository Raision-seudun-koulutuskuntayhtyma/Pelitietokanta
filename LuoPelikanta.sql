-- Create tables and references for database Pelikanta
-- ====================================================

USE Pelikanta
GO

CREATE TABLE Julkaisija (
                JulkaisijaID INT IDENTITY NOT NULL,
                JulkaisijanNimi VARCHAR(30) NOT NULL,
                CONSTRAINT Julkaisija_pk PRIMARY KEY (JulkaisijaID)
)

-- Comment for table [Julkaisija]: Pelin tehneen firman tiedot


CREATE TABLE Kaveri (
                KaveriID INT IDENTITY NOT NULL,
                Etunimi VARCHAR(20) NOT NULL,
                Sukunimi VARCHAR(20) NOT NULL,
                CONSTRAINT Kaveri_pk PRIMARY KEY (KaveriID)
)

-- Comment for table [Kaveri]: Kaverit, jotka pelaavat


CREATE TABLE Alusta (
                AlustaID INT NOT NULL,
                AlustanNimi VARCHAR(20) NOT NULL,
                CONSTRAINT Alusta_pk PRIMARY KEY (AlustaID)
)

-- Comment for table [Alusta]: Millä laitteella peliä pelataan


CREATE TABLE Ikaryhma (
                IkaryhmaID INT IDENTITY NOT NULL,
                Ikaryhmateksti VARCHAR(20) NOT NULL,
                CONSTRAINT Ikaryhma_pk PRIMARY KEY (IkaryhmaID)
)

-- Comment for table [Ikaryhma]: Pelin kohderyhmä tai ikäraja


CREATE TABLE Genre (
                GenreID INT IDENTITY NOT NULL,
                GenreNimi VARCHAR(30) NOT NULL,
                CONSTRAINT Genre_pk PRIMARY KEY (GenreID)
)

-- Comment for table [Genre]: Pelin tyyppi

-- Comment for column [GenreID]: Jokaiselle genrelle automaattisesti annettava ID


CREATE TABLE Peli (
                PeliID INT NOT NULL,
                Nimi VARCHAR(30) NOT NULL,
                JulkaisijaID INT NOT NULL,
                GenreID INT NOT NULL,
                IkaryhmaID INT NOT NULL,
                CONSTRAINT Peli_pk PRIMARY KEY (PeliID)
)

-- Comment for table [Peli]: Pelin tiedot

-- Comment for column [GenreID]: Jokaiselle genrelle automaattisesti annettava ID


CREATE TABLE Pisteet (
                KaveriID INT NOT NULL,
                PeliID INT NOT NULL,
                Maksimipisteet INT NOT NULL,
                Paivamaara DATETIME,
                CONSTRAINT Pisteet_pk PRIMARY KEY (KaveriID, PeliID)
)

-- Comment for table [Pisteet]: Mitä pisteitä kukin kaveri on saanut jostain pelistä


CREATE TABLE Pelialusta (
                PeliID INT NOT NULL,
                AlustaID INT NOT NULL,
                MuistinMaara INT,
                Naytonohjain VARCHAR(100),
                Tallennustila INT,
                Prosessori VARCHAR(20),
                CONSTRAINT Pelialusta_pk PRIMARY KEY (PeliID, AlustaID)
)

ALTER TABLE Peli ADD CONSTRAINT Julkaisija_Peli_fk
FOREIGN KEY (JulkaisijaID)
REFERENCES Julkaisija (JulkaisijaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pisteet ADD CONSTRAINT Kaveri_Pisteet_fk
FOREIGN KEY (KaveriID)
REFERENCES Kaveri (KaveriID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pelialusta ADD CONSTRAINT Alusta_Pelialusta_fk
FOREIGN KEY (AlustaID)
REFERENCES Alusta (AlustaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Ikaryhma_Peli_fk
FOREIGN KEY (IkaryhmaID)
REFERENCES Ikaryhma (IkaryhmaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Genre_Peli_fk
FOREIGN KEY (GenreID)
REFERENCES Genre (GenreID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pelialusta ADD CONSTRAINT Peli_Pelialusta_fk
FOREIGN KEY (PeliID)
REFERENCES Peli (PeliID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pisteet ADD CONSTRAINT Peli_Pisteet_fk
FOREIGN KEY (PeliID)
REFERENCES Peli (PeliID)
ON DELETE NO ACTION
ON UPDATE NO ACTION