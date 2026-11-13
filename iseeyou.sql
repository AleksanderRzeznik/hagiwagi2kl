-- 1
CREATE VIEW Aktywni_Klienci AS
SELECT
    k.imie,
    k.nazwisko,
    MAX(w.data_wypozyczenia) AS data_ostatniego_wypozyczenia
FROM Klienci k
INNER JOIN Wypozyczenia w
    ON k.id_klienta = w.id_klienta
WHERE w.data_wypozyczenia >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY k.id_klienta, k.imie, k.nazwisko;


-- 2
CREATE VIEW Czas_Wypozyczen_Klientow AS
SELECT
    k.imie,
    k.nazwisko,
    COALESCE(
        SUM(
            DATEDIFF(
                COALESCE(w.data_zwrotu, CURDATE()),
                w.data_wypozyczenia
            )
        ), 0
    ) AS laczny_czas_wypozyczen_dni
FROM Klienci k
LEFT JOIN Wypozyczenia w
    ON k.id_klienta = w.id_klienta
GROUP BY k.id_klienta, k.imie, k.nazwisko;


-- 3
CREATE VIEW Najwiecej_Wydajacy_Klienci AS
SELECT
    k.imie,
    k.nazwisko,
    SUM(w.kwota) AS laczna_kwota_wypozyczen
FROM Klienci k
INNER JOIN Wypozyczenia w
    ON k.id_klienta = w.id_klienta
GROUP BY k.id_klienta, k.imie, k.nazwisko;


-- 4
CREATE VIEW Najdluzsze_Wypozyczenia AS
SELECT
    w.data_wypozyczenia,
    w.data_zwrotu,
    k.nazwisko,
    s.marka,
    s.model,
    DATEDIFF(
        COALESCE(w.data_zwrotu, CURDATE()),
        w.data_wypozyczenia
    ) AS czas_wypozyczenia_dni
FROM Wypozyczenia w
INNER JOIN Klienci k
    ON w.id_klienta = k.id_klienta
INNER JOIN Samochody s
    ON w.id_samochodu = s.id_samochodu
WHERE DATEDIFF(
    COALESCE(w.data_zwrotu, CURDATE()),
    w.data_wypozyczenia
) > 30;


-- 5
CREATE VIEW Dostepne_Samochody AS
SELECT
    s.marka,
    s.model,
    s.numer_rejestracyjny,
    GROUP_CONCAT(
        DISTINCT CONCAT(
            se.opis,
            ' (',
            DATE_FORMAT(se.data_serwisu, '%Y-%m-%d'),
            ')'
        )
        SEPARATOR ', '
    ) AS informacje_o_serwisie
FROM Samochody s
LEFT JOIN Serwisy se
    ON s.id_samochodu = se.id_samochodu
WHERE s.status = 'dostępny'
GROUP BY
    s.id_samochodu,
    s.marka,
    s.model,
    s.numer_rejestracyjny;


-- 6
CREATE VIEW Liczba_Wypozyczen_Wedlug_Marki AS
SELECT
    s.marka,
    COUNT(w.id_wypozyczenia) AS liczba_wypozyczen
FROM Samochody s
LEFT JOIN Wypozyczenia w
    ON s.id_samochodu = w.id_samochodu
GROUP BY s.marka;


-- 7
CREATE VIEW Klienci_Bez_Wypozyczen AS
SELECT
    k.id_klienta,
    k.imie,
    k.nazwisko,
    k.email,
    k.data_rejestracji
FROM Klienci k
LEFT JOIN Wypozyczenia w
    ON k.id_klienta = w.id_klienta
WHERE w.id_wypozyczenia IS NULL;


------------------------------------------

SELECT * FROM Aktywni_Klienci;

SELECT * FROM Czas_Wypozyczen_Klientow;

SELECT * FROM Najwiecej_Wydajacy_Klienci
ORDER BY laczna_kwota_wypozyczen DESC;

SELECT * FROM Najdluzsze_Wypozyczenia;

SELECT * FROM Dostepne_Samochody;

SELECT * FROM Liczba_Wypozyczen_Wedlug_Marki;

SELECT * FROM Klienci_Bez_Wypozyczen;
-------------------------------------------
-- 8
CREATE VIEW widok_auta_w_serwisie AS
SELECT marka, model, rok_produkcji, numer_rejestracyjny
FROM Samochody
WHERE status = 'serwis';


-- 9
CREATE VIEW widok_koszty_serwisu AS
SELECT 
    Samochody.marka,
    Samochody.model,
    Samochody.numer_rejestracyjny,
    COUNT(Serwisy.id_serwisu) AS liczba_serwisow,
    SUM(Serwisy.koszt) AS laczny_koszt
FROM Samochody
JOIN Serwisy ON Samochody.id_samochodu = Serwisy.id_samochodu
GROUP BY Samochody.id_samochodu, Samochody.marka, Samochody.model, Samochody.numer_rejestracyjny
ORDER BY laczny_koszt DESC;


-- 10
CREATE VIEW widok_oceny_samochodow AS
SELECT
    Samochody.marka,
    Samochody.model,
    COUNT(Opinie.id_opinii) AS liczba_opinii,
    ROUND(AVG(Opinie.ocena), 2) AS srednia_ocena
FROM Samochody
JOIN Opinie ON Samochody.id_samochodu = Opinie.id_samochodu
GROUP BY Samochody.id_samochodu, Samochody.marka, Samochody.model;


-- 11
CREATE VIEW widok_niezaplacone_faktury AS
SELECT
    Faktury.id_faktury AS numer_faktury,
    Faktury.data_faktury,
    Faktury.kwota_calosci,
    Klienci.imie,
    Klienci.nazwisko
FROM Faktury
JOIN Wypozyczenia ON Faktury.id_wypozyczenia = Wypozyczenia.id_wypozyczenia
JOIN Klienci ON Wypozyczenia.id_klienta = Klienci.id_klienta
WHERE Faktury.zaplacono = 'nie';


-- 12
CREATE VIEW widok_trwajace_wypozyczenia AS
SELECT
    Klienci.imie,
    Klienci.nazwisko,
    Samochody.marka,
    Samochody.model,
    Wypozyczenia.data_wypozyczenia,
    DATEDIFF(CURDATE(), Wypozyczenia.data_wypozyczenia) AS liczba_dni
FROM Wypozyczenia
JOIN Klienci ON Wypozyczenia.id_klienta = Klienci.id_klienta
JOIN Samochody ON Wypozyczenia.id_samochodu = Samochody.id_samochodu
WHERE Wypozyczenia.status = 'wypożyczony';


-- 13
CREATE VIEW widok_metody_platnosci AS
SELECT
    metoda_platnosci,
    COUNT(id_platnosci) AS liczba_platnosci,
    SUM(kwota) AS laczna_kwota
FROM Platnosci
GROUP BY metoda_platnosci;


-- 14
CREATE VIEW widok_wypozyczenia_rocznie AS
SELECT
    YEAR(data_wypozyczenia) AS rok,
    COUNT(id_wypozyczenia) AS liczba_wypozyczen,
    SUM(kwota) AS suma_kwot
FROM Wypozyczenia
GROUP BY YEAR(data_wypozyczenia)
ORDER BY rok ASC;


-- 15
CREATE VIEW widok_staz_pracownikow AS
SELECT
    imie,
    nazwisko,
    stanowisko,
    TIMESTAMPDIFF(YEAR, data_zatrudnienia, CURDATE()) AS staz_w_latach
FROM Pracownicy;


-- 16
CREATE VIEW widok_klienci_miasta AS
SELECT
    SUBSTRING_INDEX(adres, ',', 1) AS miasto,
    COUNT(id_klienta) AS liczba_klientow
FROM Klienci
GROUP BY SUBSTRING_INDEX(adres, ',', 1);

--17
--a
SELECT *
FROM widok_koszty_serwisu
WHERE laczny_koszt > 2000;


--b
CREATE OR REPLACE VIEW widok_oceny_samochodow AS
SELECT
    Samochody.marka,
    Samochody.model,
    COUNT(Opinie.id_opinii) AS liczba_opinii,
    ROUND(AVG(Opinie.ocena), 2) AS srednia_ocena
FROM Samochody
JOIN Opinie ON Samochody.id_samochodu = Opinie.id_samochodu
GROUP BY Samochody.id_samochodu, Samochody.marka, Samochody.model
HAVING AVG(Opinie.ocena) >= 4;


--c
DROP VIEW widok_auta_w_serwisie;

----------------------------------------

SHOW FULL TABLES WHERE Table_type = 'VIEW';
