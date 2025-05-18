CREATE TABLE ugyfel (
    ugyfel_id INT PRIMARY KEY,
    nev VARCHAR(100),
    szul_datum DATE,
    email VARCHAR(100),
    telefonszam VARCHAR(20)
);

CREATE TABLE ugyintezo (
    ugyintezo_id INT PRIMARY KEY,
    nev VARCHAR(100),
    munkakor VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE kolcson (
    kolcson_id INT PRIMARY KEY,
    ugyfel_id INT,
    ugyintezo_id INT,
    osszeg DECIMAL(10,2),
    kamat FLOAT,
    futamido_honap INT,
    igenyles_datuma DATE,
    FOREIGN KEY (ugyfel_id) REFERENCES ugyfel(ugyfel_id),
    FOREIGN KEY (ugyintezo_id) REFERENCES ugyintezo(ugyintezo_id)
);

CREATE TABLE torlesztes (
    torlesztes_id INT PRIMARY KEY,
    kolcson_id INT,
    fizetesi_datum DATE,
    fizetett_osszeg DECIMAL(10,2),
    FOREIGN KEY (kolcson_id) REFERENCES kolcson(kolcson_id)
);