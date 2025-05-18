SELECT DISTINCT u.nev, k.osszeg
FROM ugyfel u
JOIN kolcson k ON u.ugyfel_id = k.ugyfel_id;

SELECT u.nev, k.osszeg, k.kamat, (k.osszeg * k.kamat / 100) AS kamat_osszeg
FROM kolcson k
JOIN ugyfel u ON k.ugyfel_id = u.ugyfel_id;

SELECT * FROM torlesztes
WHERE EXTRACT(MONTH FROM fizetesi_datum) = 3;

SELECT ui.nev, SUM(k.osszeg) AS kezelt_osszeg
FROM kolcson k
JOIN ugyintezo ui ON k.ugyintezo_id = ui.ugyintezo_id
GROUP BY ui.nev;

SELECT AVG(futamido_honap) AS atlagos_futamido FROM kolcson;

SELECT u.nev, t.fizetesi_datum, t.fizetett_osszeg
FROM torlesztes t
JOIN kolcson k ON t.kolcson_id = k.kolcson_id
JOIN ugyfel u ON k.ugyfel_id = u.ugyfel_id
ORDER BY u.nev, t.fizetesi_datum;