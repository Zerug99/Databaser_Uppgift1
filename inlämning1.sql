CREATE DATABASE pj_bokhandel; -- Här kommer skapas databasen vid namnet pj_bokhandel


USE pj_bokhandel; -- pj_bokhandel här selectar man sin databas, detta behövs skrivas så man är i rätt läge när man ska börja skriva in tabellerna och inserta values.  

-- Nedanför ser man skapandet av en av tabellerna Kunder. Inom parenteserna anger man varje attribut med vilken datatyp som ska användas.
CREATE TABLE kunder (  -- Create Table skapar tabellen Kunder. 

KundID INT AUTO_INCREMENT PRIMARY KEY, -- skapar attributen och anger det som PK och automatisk utdelning av INT, alltså det delar ut en unikt siffra och man slipper göra det manuellt . PK står för primärnyckel och är som ett unikt identifierar för varje rad. 


Namn VARCHAR (255) NOT NULL, --  VARCHAR betyder att man kommer anger datatyp (tecken) och 255 är hur många tecken det får bli, NOT NULL betyder att namn måste alltid ha ett värde och får inte vara NOT NULL

E_POST VARCHAR (255) UNIQUE,-- UNIQUE betyder att en kund kan inte använda en existerande E_Post. Det ska vara unika.

Telefon VARCHAR (255) NOT NULL, 

Adress VARCHAR (255) NOT NULL
);


CREATE TABLE böcker ( -- Här skapas en ny tabell och datatypen här är DECIMAL (10,2,) detta anger hur många siffror det får vara totalt 10 och 2 står för hur många decimaler det får vara. (  ); Inom dessa skriver man koden och avlsutar på );

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



CREATE TABLE orderrader ( -- brygg - tabell som indirekt kopplar ihop beställningar och böcker. Orderrader tabellen är också kopplad till dem.  

OrderradID INT AUTO_INCREMENT PRIMARY KEY,

ISBN VARCHAR (255) NOT NULL,

OrderID INT NOT NULL,

Antal INT NOT NULL,

FOREIGN KEY (ISBN) REFERENCES Böcker(ISBN), -- FK i Orderrader refererar till Böcker ISBN PK

FOREIGN KEY (OrderID) REFERENCES beställningar(OrderID)
);

-- kod för att inserta value för att sedan kunna hämta upp den senare i rad 77

INSERT INTO Kunder (Namn, E_Post, Telefon, Adress) VALUES -- Man srkiver först vilken tabell man vill lägga in datan och sedan vilka attributer som ska få sinna values.
("Patryk Jersak", "patryk@test.com", 0123456789, "Algatan 46"); -- Viktigt att ha (); för att se början av radet och slutet. Man srkiver i ordning och använder " " mellan stringen. Symbolen , markerar slutet av värde 



-- kod för att ta fram datan

SELECT Telefon FROM Kunder WHERE Namn = "Patryk Jersak"; -- detta kommer hämta bara en specfikt information om angiven kund, bra när man behöver bara ett sorts data och inte belastar servern med att hämta all data.

SELECT * FROM Kunder; -- detta kommer att prompta till att hämta (all) inforamtion från tabellen kunder.
