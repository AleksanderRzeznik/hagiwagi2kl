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
SELECT nazwa_produktu, cena_sprzedazy FROM produkty WHERE jednostka_miary = 'szt' ORDER BY cena_sprzedazy DESC;
ZAD11
SELECT nazwa_magazynu, miasto FROM magazyny WHERE miasto IN ('Warszawa', 'Kraków');
ZAD12
SELECT id_zamowienia FROM zamowienia WHERE koszt_dostawy = 0;
ZAD13
SELECT imie, nazwisko, pensja_podstawowa FROM pracownicy WHERE plec = 'M' AND pensja_podstawowa > 8000;
ZAD14
-----
ZAD15
SELECT nazwa_produktu FROM produkty WHERE nazwa_produktu LIKE '%Pro%';
ZAD16
SELECT k.nazwa_kategorii, AVG(p.cena_sprzedazy) AS srednia_cena FROM kategorie_produktow k JOIN produkty p ON p.id_kategorii = k.id_kategorii GROUP BY k.id_kategorii, k.nazwa_kategorii ORDER BY srednia_cena DESC;
ZAD17
SELECT nazwa_firmy, rabat_staly FROM klienci WHERE typ_klienta = 'firma' AND rabat_staly > 3 ORDER BY rabat_staly DESC;
ZAD18
