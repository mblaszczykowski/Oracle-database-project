---- Usuwanie tabel i sekwencji ----

DROP TABLE adres_klienta CASCADE CONSTRAINTS;
DROP TABLE kategoria CASCADE CONSTRAINTS;
DROP TABLE klient CASCADE CONSTRAINTS;
DROP TABLE paragon CASCADE CONSTRAINTS;
DROP TABLE pozycja_paragonu CASCADE CONSTRAINTS;
DROP TABLE pracownik CASCADE CONSTRAINTS;
DROP TABLE produkt CASCADE CONSTRAINTS;
DROP TABLE zamowienie CASCADE CONSTRAINTS;
DROP SEQUENCE sekwencja_produkt;
DROP SEQUENCE sekwencja_kategoria;
DROP SEQUENCE sekwencja_paragon;
DROP SEQUENCE sekwencja_pozycja_paragonu;
DROP SEQUENCE sekwencja_klient;
DROP SEQUENCE sekwencja_adres;
DROP SEQUENCE sekwencja_zamowienie;
DROP SEQUENCE sekwencja_pracownik;
DROP VIEW wyswietl_cala_oferte;
DROP VIEW zarobki_wedlug_miesiecy;
DROP VIEW najlepiej_sprzedajace_sie_marki;
DROP VIEW miasta_najwiecej_zamowien;