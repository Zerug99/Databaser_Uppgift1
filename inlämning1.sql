CREATE DATABASE pj_bokhandel; 


USE pj_bokhandel; 

-- Nedanför ser man skapandet av en av tabellerna Kunder. Inom parenteserna anger man varje attribut med vilken datatyp som ska användas.
CREATE TABLE kunder (  - Kunder är Entitet och nedanför anger man attributer 

KundID INT AUTO_INCREMENT PRIMARY Key, -- skapar attributen och anger det som PK och automatisk utdelning av INT, alltså det delar ut en unikt siffra och man slipper göra det manuellt . PK står för primärnyckel och är som ett unikt identifierar för varje rad. 


Namn VARCHAR (255) NOT NULL, --  Varchar betyder att man kommer anger datatyp (tecken) och 255 är hur många tecken det får bli, NOT NULL betyder att namn måste alltid ha ett värde och får inte vara NOT NULL

E_POST VARCHAR (255) UNIQUE,-- UNIQUE betyder att en kund kan inte använda en existerande E_Post. Det ska vara unika. 

Telefon VARCHAR (255) NOT NULL, 

Adress VARCHAR (255) NOT NULL
);


CREATE TABLE böcker ( -- Här skapas en ny tabell och en ny datatyp här är DECIMAL, detta anger hur många siffror det får vara totalt - 10 och 2 står för hur många decimaler det får vara. (); Inom dessa skriver man koden och avlsutar på );

ISBN VARCHAR(255) PRIMARY KEY, 

Titel VARCHAR(255) NOT NULL,

Författare VARCHAR(255) NOT NULL,

Pris DECIMAL(10,2)NOT NULL, 

Lagerstatus INT NOT NULL
);




CREATE TABLE beställningar (

OrderID INT AUTO_INCREMENT PRIMARY KEY,

KundID INT NOT NULL,

Datum DATE NOT NULL,

Totalbelopp DECIMAL NOT NULL,

FOREIGN KEY (KundID) REFERENCES Kunder(KundID) -- Här anger man En FK och pekar ut vart den ska referera till vilket är då till tabellen där PK finns och själva namnet på PK. Detta skapar en relation mellan tabellen. Beställning är kopplad till 1 kund. Viktigt att man anger rätt value i KundID, där ska det inte vara på auto.  
);



CREATE TABLE orderrader ( --Detta är vårt brygg - tabell som indirekt kopplar ihop beställningar och böcker tabellen ihop och är också kopplad till dem.  

OrderradID INT AUTO_INCREMENT PRIMARY KEY,

ISBN VARCHAR (255) NOT NULL,

OrderID INT NOT NULL,

Antal INT NOT NULL,

FOREIGN KEY (ISBN) REFERENCES Böcker(ISBN), --Här kopplar vi igen som vi gjorde innan fast nu i böcker tabellen 

FOREIGN KEY (OrderID) REFERENCES beställningar(OrderID)
);




