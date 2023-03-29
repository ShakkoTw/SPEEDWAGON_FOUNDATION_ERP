CREATE TABLE utenti (
  idutente INT AUTO_INCREMENT PRIMARY KEY,
  cognome VARCHAR(32) NOT NULL,
  nome VARCHAR(32) NOT NULL,
  email VARCHAR(64) NOT NULL,
  password VARCHAR(64) NOT NULL,
  telefono CHAR(10) NOT NULL
);

INSERT INTO utenti (cognome, nome, email, password, telefono) VALUES
("Joestar", "Jonathan", "jojo.jonathan@jojo.com", "Za_Warudo_123!", "1234567890"),
("Brando", "Dio", "dio.brando@jojo.com", "MudaMudaMuda!321", "0987654321"),
("Kujo", "Jotaro", "jotaro.kujo@jojo.com", "OraOraOra_777#", "2345678901"),
("Higashikata", "Josuke", "josuke.higashikata@jojo.com", "DORARARA-2468", "3456789012"),
("Nijimura", "Okuyasu", "okuyasu.nijimura@jojo.com", "Za_Hando!!555", "4567890123"),
("Kishibe", "Rohan", "rohan.kishibe@jojo.com", "Heaven's_Door_789^", "5678901234"),
("Hirose", "Koichi", "koichi.hirose@jojo.com", "Echoes_Act_3&999", "6789012345"),
("Zeppeli", "William", "william.zeppeli@jojo.com", "SUNLIGHT_YELLOW_7*", "7890123456"),
("Speedwagon", "Robert E.O.", "reo.speedwagon@jojo.com", "Speedwagon_Foundation_000", "8901234567"),
("Joestar", "Jolyne", "jolyne.joestar@jojo.com", "Stone_Free_246!", "2345678901"),
("Joestar", "Johnny", "johnny.higashikata@jojo.com", "Tusk_Act_4&777", "4567890123"),
("Pucci", "Enrico", "enrico.pucci@jojo.com", "Made_in_Heaven_123^", "6789012345");

CREATE TABLE prodotti (
  idprodotto INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(32) NOT NULL,
  descrizione VARCHAR(250) NOT NULL,
  prezzo_produzione FLOAT(6,2) NOT NULL,
  prezzo_vendita FLOAT(6,2) NOT NULL
);

INSERT INTO prodotti (nome, descrizione, prezzo_produzione, prezzo_vendita) VALUES 
("Eraser Gun", "Una pistola ad acqua con una speciale soluzione detergente al suo interno. Rimuove anche le macchie più ostinate!", 3.50, 9.99),
("Stardust Polish", "Un detergente per pavimenti che, grazie alla sua formula speciale, lascia una finitura lucida e liscia come lo Stardust Crusaders!", 4.20, 11.99),
("Hammer Soaker", "Un potente detergente per la pulizia delle superfici più dure. I suoi effetti sono talmente potenti da fare tremare gli avversari come il famoso martello di Wamuu!", 5.00, 14.99),
("Stand Off", "Un detergente spray che rimuove le macchie più ostinate senza lasciare traccia, come se gli avversari non fossero mai esistiti!", 2.80, 8.99),
("Red Stone Polish", "Un detergente per superfici in metallo che lascia una finitura brillante e rossa come il potere del Red Stone of Aja!", 3.70, 10.99),
("The World Cleanser", "Un detergente multiuso che pulisce tutto in un attimo, come se il tempo si fermasse!", 4.50, 12.99),
("Gold Experience Spray", "Un detergente spray che pulisce le superfici in modo delicato e crea una finitura dorata come il potere del Gold Experience!", 3.20, 9.99),
("Killer Queen Powder", "Una polvere per la pulizia delle superfici che si attiva al contatto, come il potere del Killer Queen!", 3.50, 11.99),
("Purple Haze Wipes", "Dei panni umidificati con una speciale soluzione detergente, che eliminano le macchie come il veleno di Purple Haze!", 2.50, 7.99),
("The Hand Scrubber", "Uno scrubber per la pulizia delle superfici che cancella ogni traccia, come se fosse il potere di The Hand!", 4.00, 11.99);

CREATE TABLE clienti (
  idcliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(32) NOT NULL,
  cognome VARCHAR(32) NOT NULL,
  email VARCHAR(64) NOT NULL,
  telefono CHAR(10) NOT NULL,
  citta VARCHAR(32) NOT NULL,
  via VARCHAR(32) NOT NULL,
  ncivico VARCHAR(3) NOT NULL,
  cap CHAR(5) NOT NULL
);

INSERT INTO clienti (nome, cognome, email, telefono, citta, via, ncivico, cap)
VALUES
("Eren", "Jaeger", "eren.jaeger@aot.com", "1234567890", "Roma", "Via del Corso", "1", "00186"),
("Mikasa", "Ackerman", "mikasa.ackerman@aot.com", "2345678901", "Milano", "Corso Buenos Aires", "2", "20124"),
("Armin", "Arlert", "armin.arlert@aot.com", "3456789012", "Napoli", "Via Toledo", "3", "80134"),
("Levi", "Ackerman", "levi.ackerman@aot.com", "4567890123", "Firenze", "Via dei Calzaiuoli", "4", "50122"),
("Erwin", "Smith", "erwin.smith@aot.com", "5678901234", "Torino", "Via Roma", "5", "10123"),
("Reiner", "Braun", "reiner.braun@aot.com", "6789012345", "Palermo", "Via della Libertà", "6", "90139"),
("Annie", "Leonhart", "annie.leonhart@aot.com", "7890123456", "Bologna", "Via dell'Indipendenza", "7", "40121"),
("Jean", "Kirstein", "jean.kirstein@aot.com", "8901234567", "Venezia", "Calle Larga XXII Marzo", "8", "30124"),
("Sasha", "Braus", "sasha.braus@aot.com", "9012345678", "Genova", "Via XX Settembre", "9", "16121"),
("Connie", "Springer", "connie.springer@aot.com", "0123456789", "Bari", "Via Sparano", "10", "70122");

CREATE TABLE ordini (
  idordine INT AUTO_INCREMENT PRIMARY KEY,
  data_creazione DATE NOT NULL,
  data_consegna DATE,
  legidcliente INT NOT NULL,
  legidprodotto INT NOT NULL,
  legidutente INT NOT NULL,
  FOREIGN KEY (legidcliente) REFERENCES clienti (idcliente)
  ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (legidprodotto) REFERENCES prodotti (idprodotto)
  ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (legidutente) REFERENCES utenti (idutente)
  ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO ordini (data_creazione, data_consegna, legidcliente, legidprodotto, legidutente) VALUES
('2022-01-01', '2022-01-05', 3, 7, 10),
('2022-02-05', '2022-02-10', 8, 2, 6),
('2022-03-12', '2022-03-20', 2, 5, 8),
('2022-04-10', '2022-04-15', 6, 3, 4),
('2022-05-20', '2022-05-25', 1, 1, 2),
('2022-06-18', '2022-06-22', 4, 4, 12),
('2022-07-10', '2022-07-15', 9, 8, 5),
('2022-08-22', '2022-08-25', 5, 6, 9),
('2022-09-05', '2022-09-10', 7, 10, 1),
('2022-10-15', '2022-10-20', 10, 9, 3),
('2022-11-20', '2022-11-25', 3, 2, 11),
('2022-12-18', '2022-12-22', 2, 5, 7);

--
SELECT clienti.cognome, clienti.nome, prodotti.nome, utenti.cognome, utenti.nome
FROM ordini
INNER JOIN clienti ON (legidcliente=idcliente)
INNER JOIN prodotti ON (legidprodotto=idprodotto)
INNER JOIN utenti ON (legidutente=idutente);