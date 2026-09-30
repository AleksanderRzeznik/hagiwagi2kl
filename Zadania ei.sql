SELECT * FROM produkty WHERE id_kategorii = 12;
zad 2
SELECT * FROM klienci WHERE miasto = "Warszawa";
zad 3
SELECT imie, nazwisko FROM pracownicy WHERE dzial = "Sprzedaż" GROUP BY nazwisko ASC;
zad 4
SELECT nazwa_produktu, cena_sprzedazy FROM produkty WHERE cena_sprzedazy > 5000;
zad 5
SELECT id_zamowienia, data_zamowienia, status_zamowienia FROM zamowienia where status_zamowienia = "zrealizowane";
zad 6
SELECT * FROM producenci GROUP BY nazwa ASC;
zad 7
SELECT nr_faktury, kwota_brutto, data_wystawienia FROM faktury WHERE data_wystawienia BETWEEN '2023-03-01' AND '2023-03-31';
zad 8
SELECT imie, nazwisko, data_zatrudnienia FROM pracownicy WHERE data_zatrudnienia BETWEEN '2020-01-01' AND '2100-01-01';
ZAD 9
SELECT imie, nazwisko FROM klienci WHERE imie LIKE "a%";-- 10
zad10
SELECT nazwa, cena_sprzedazy
FROM produkty
WHERE jednostka_miary = 'szt'
ORDER BY cena_sprzedazy DESC;
ZAD11
SELECT nazwa, miasto
FROM magazyny
WHERE miasto IN ('Warszawa', 'Kraków');
ZAD12
SELECT id_zamowienia
FROM zamowienia
WHERE koszt_dostawy = 0;
ZAD13
SELECT imie, nazwisko, pensja_podstawowa
FROM pracownicy
WHERE plec = 'M' AND pensja_podstawowa > 8000;
ZAD14
SELECT nazwa
FROM kategorie
WHERE nadrzedna_kategoria_id IS NULL;
ZAD15
SELECT nazwa
FROM produkty
WHERE nazwa LIKE '%Pro%';
ZAD16
SELECT k.nazwa, AVG(p.cena_sprzedazy) AS srednia_cena
FROM kategorie k
JOIN produkty p ON p.kategoria_id = k.id_kategorii
GROUP BY k.id_kategorii, k.nazwa
ORDER BY srednia_cena DESC;
ZAD17
SELECT nazwa_firmy, rabat_staly
FROM klienci
WHERE typ_klienta = 'firma'
  AND rabat_staly > 3
ORDER BY rabat_staly DESC;
ZAD18
SELECT
    CASE WHEN k.typ_klienta = 'firma'
         THEN k.nazwa_firmy
         ELSE CONCAT(k.imie, ' ', k.nazwisko)
    END AS klient,
    COUNT(z.id_zamowienia) AS liczba_zamowien
FROM klienci k
JOIN zamowienia z ON z.klient_id = k.id_klienta
GROUP BY k.id_klienta, klient
ORDER BY liczba_zamowien DESC;
ZAD19
SELECT
    MONTH(data_wystawienia) AS numer_miesiaca,
    CASE MONTH(data_wystawienia)
        WHEN 1 THEN 'Styczeń' WHEN 2 THEN 'Luty' WHEN 3 THEN 'Marzec'
        WHEN 4 THEN 'Kwiecień' WHEN 5 THEN 'Maj' WHEN 6 THEN 'Czerwiec'
        WHEN 7 THEN 'Lipiec' WHEN 8 THEN 'Sierpień' WHEN 9 THEN 'Wrzesień'
        WHEN 10 THEN 'Październik' WHEN 11 THEN 'Listopad' WHEN 12 THEN 'Grudzień'
    END AS nazwa_miesiaca,
    SUM(kwota_brutto) AS suma_faktur
FROM faktury
WHERE YEAR(data_wystawienia) = 2023
GROUP BY MONTH(data_wystawienia)
ORDER BY numer_miesiaca;
ZAD20
SELECT p.nazwa, COUNT(DISTINCT s.id_magazynu) AS liczba_magazynow
FROM produkty p
JOIN stany_magazynowe s ON s.produkt_id = p.id_produktu
GROUP BY p.id_produktu, p.nazwa
HAVING COUNT(DISTINCT s.id_magazynu) > 1
ORDER BY liczba_magazynow DESC;
ZAD21
SELECT
    p.imie, p.nazwisko,
    m.imie AS manager_imie,
    m.nazwisko AS manager_nazwisko
FROM pracownicy p
LEFT JOIN pracownicy m ON p.manager_id = m.id_pracownika
ZAD22
SELECT p.kod_produktu, p.nazwa, SUM(s.ilosc) AS suma_ilosci
FROM produkty p
JOIN stany_magazynowe s ON s.produkt_id = p.id_produktu
GROUP BY p.id_produktu, p.kod_produktu, p.nazwa
HAVING SUM(s.ilosc) > 0;
ZAD23
SELECT id_zamowienia, data_zamowienia
FROM zamowienia
WHERE data_zamowienia BETWEEN '2023-03-10' AND '2023-03-20';
ZAD24
SELECT
    nazwa,
    ROUND(cena_sprzedazy - cena_zakupu, 2) AS marza,
    ROUND((cena_sprzedazy - cena_zakupu) / cena_zakupu * 100, 2) AS procent_marzy
FROM produkty
WHERE cena_sprzedazy - cena_zakupu > 2000;
ZAD25
SELECT
    CASE WHEN k.typ_klienta = 'firma'
         THEN k.nazwa_firmy
         ELSE CONCAT(k.imie, ' ', k.nazwisko)
    END AS klient,
    COUNT(z.id_zamowienia) AS liczba_zamowien
FROM klienci k
JOIN zamowienia z ON z.klient_id = k.id_klienta
GROUP BY k.id_klienta, klient
HAVING COUNT(z.id_zamowienia) > 2
ORDER BY liczba_zamowien DESC;
ZAD26
SELECT d.nazwa AS dzial,
       ROUND(AVG(YEAR(CURRENT_DATE) - YEAR(p.data_urodzenia)), 1) AS sredni_wiek
FROM dzialy d
JOIN pracownicy p ON p.dzial_id = d.id_dzialu
GROUP BY d.id_dzialu, d.nazwa;

ZAD27
SELECT numer_faktury, kwota_brutto, termin_platnosci,
       DATEDIFF(CURRENT_DATE, termin_platnosci) AS dni_zaleglosci
FROM faktury
WHERE status_platnosci = 'oczekuje na płatność';
ZAD28
SELECT p.kod_produktu, p.nazwa,
       s.ilosc AS aktualny_stan,
       p.minimalny_stan,
       p.minimalny_stan - s.ilosc AS roznica
FROM produkty p
JOIN stany_magazynowe s ON s.produkt_id = p.id_produktu
WHERE s.id_magazynu = 1
  AND s.ilosc < p.minimalny_stan;
ZAD29
SELECT id_dostawy, numer_przesylki,
       DATEDIFF(data_dostawy_rzeczywistej, data_wysylki) AS dni_realizacji
FROM dostawy
WHERE data_dostawy_rzeczywistej IS NOT NULL
ORDER BY dni_realizacji;
ZAD30
SELECT stanowisko,
       COUNT(*) AS liczba_pracownikow,
       SUM(pensja_podstawowa) AS suma_pensji,
       AVG(pensja_podstawowa) AS srednia_pensja
FROM pracownicy
GROUP BY stanowisko
ORDER BY suma_pensji DESC;
ZAD31
SELECT p.nazwa, p.kod_produktu,
       SUM(pz.ilosc) AS sprzedana_ilosc,
       ROUND(SUM(pz.cena_jednostkowa * pz.ilosc * (1 - pz.rabat / 100)), 2) AS przychod
FROM produkty p
JOIN pozycje_zamowienia pz ON pz.produkt_id = p.id_produktu
GROUP BY p.id_produktu, p.nazwa, p.kod_produktu
ORDER BY przychod DESC;
ZAD32
SELECT p.nazwa,
       SUM(pz.ilosc) AS sprzedana_ilosc,
       ROUND(SUM(pz.cena_jednostkowa * pz.ilosc * (1 - pz.rabat / 100)), 2) AS przychod
FROM produkty p
JOIN pozycje_zamowienia pz ON pz.produkt_id = p.id_produktu
GROUP BY p.id_produktu, p.nazwa
ORDER BY sprzedana_ilosc DESC
LIMIT 5;
ZAD33
SELECT
    CASE WHEN k.typ_klienta = 'firma'
         THEN k.nazwa_firmy
         ELSE CONCAT(k.imie, ' ', k.nazwisko)
    END AS klient,
    COUNT(DISTINCT z.id_zamowienia) AS liczba_zamowien,
    ROUND(AVG(wartosc_zamowienia), 2) AS srednia_wartosc
FROM klienci k
JOIN zamowienia z ON z.klient_id = k.id_klienta
JOIN (
    SELECT id_zamowienia,
           SUM(cena_jednostkowa * ilosc * (1 - rabat / 100)) AS wartosc_zamowienia
    FROM pozycje_zamowienia
    GROUP BY id_zamowienia
) x ON x.id_zamowienia = z.id_zamowienia
GROUP BY k.id_klienta, klient
HAVING COUNT(DISTINCT z.id_zamowienia) > 1;
ZAD34
SELECT p.nazwa, p.kod_produktu
FROM produkty p
LEFT JOIN pozycje_zamowienia pz ON pz.produkt_id = p.id_produktu
WHERE pz.produkt_id IS NULL;
ZAD35
SELECT p.imie, p.nazwisko, p.stanowisko,
       SUM(f.kwota_brutto) AS wartosc_zamowien
FROM pracownicy p
JOIN zamowienia z ON z.pracownik_id = p.id_pracownika
JOIN faktury f ON f.zamowienie_id = z.id_zamowienia
GROUP BY p.id_pracownika, p.imie, p.nazwisko, p.stanowisko
HAVING SUM(f.kwota_brutto) > 100000;
ZAD36
SELECT pr.nazwa,
       COUNT(DISTINCT p.id_produktu) AS liczba_produktow,
       ROUND(SUM(pz.cena_jednostkowa * pz.ilosc * (1 - pz.rabat / 100)), 2) AS wartosc_sprzedazy
FROM producenci pr
JOIN produkty p ON p.producent_id = pr.id_producenta
JOIN pozycje_zamowienia pz ON pz.produkt_id = p.id_produktu
GROUP BY pr.id_producenta, pr.nazwa
ORDER BY wartosc_sprzedazy DESC;
ZAD37
SELECT p.nazwa,
       SUM(pz.ilosc) AS liczba_sprzedanych,
       COUNT(DISTINCT r.id_reklamacji) AS liczba_reklamacji,
       ROUND(COUNT(DISTINCT r.id_reklamacji) / SUM(pz.ilosc) * 100, 2) AS procent_reklamacji
FROM produkty p
JOIN pozycje_zamowienia pz ON pz.produkt_id = p.id_produktu
JOIN reklamacje r ON r.produkt_id = p.id_produktu
GROUP BY p.id_produktu, p.nazwa;
ZAD38
SELECT z.id_zamowienia, z.data_zamowienia, z.rabat,
       CASE WHEN k.typ_klienta = 'firma'
            THEN k.nazwa_firmy
            ELSE CONCAT(k.imie, ' ', k.nazwisko)
       END AS klient
FROM zamowienia z
JOIN klienci k ON k.id_klienta = z.klient_id
WHERE z.rabat > (SELECT AVG(rabat) FROM zamowienia);
ZAD39
SELECT MONTH(z.data_zamowienia) AS numer_miesiaca,
       CASE MONTH(z.data_zamowienia)
           WHEN 1 THEN 'Styczeń' WHEN 2 THEN 'Luty' WHEN 3 THEN 'Marzec'
           WHEN 4 THEN 'Kwiecień' WHEN 5 THEN 'Maj' WHEN 6 THEN 'Czerwiec'
           WHEN 7 THEN 'Lipiec' WHEN 8 THEN 'Sierpień' WHEN 9 THEN 'Wrzesień'
           WHEN 10 THEN 'Październik' WHEN 11 THEN 'Listopad' WHEN 12 THEN 'Grudzień'
       END AS nazwa_miesiaca,
       COUNT(DISTINCT z.id_zamowienia) AS liczba_zamowien,
       ROUND(SUM(f.kwota_brutto), 2) AS wartosc_sprzedazy,
       ROUND(AVG(f.kwota_brutto), 2) AS srednia_wartosc_zamowienia
FROM zamowienia z
JOIN faktury f ON f.zamowienie_id = z.id_zamowienia
WHERE YEAR(z.data_zamowienia) = 2023
GROUP BY MONTH(z.data_zamowienia)
ORDER BY numer_miesiaca;
