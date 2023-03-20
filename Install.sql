---- Tworzenie sekwencji, zeby nie pomylic sie podczas nadawania ID ----

CREATE SEQUENCE sekwencja_produkt
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_kategoria
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_paragon
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_pozycja_paragonu
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_klient
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_adres
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_zamowienie
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;
CREATE SEQUENCE sekwencja_pracownik
increment by 1 start with 1
maxvalue 9999999999 minvalue 1 cache 20;



---- Tworzenie tabel ----

CREATE TABLE adres_klienta (
    id_adresu    NUMBER(4) NOT NULL,
    wojewodztwo       VARCHAR2(30) NOT NULL,
    miasto       VARCHAR2(30) NOT NULL,
    kod_pocztowy VARCHAR2(6) NOT NULL,
    ulica        VARCHAR2(30) NOT NULL,
    nr_domu      VARCHAR2(10) NOT NULL
);

ALTER TABLE adres_klienta ADD CONSTRAINT adres_pk PRIMARY KEY ( id_adresu );

CREATE TABLE kategoria (
    id_kategorii    NUMBER(4) NOT NULL,
    nazwa_kategorii VARCHAR2(30) NOT NULL
);

ALTER TABLE kategoria ADD CONSTRAINT kategoria_pk PRIMARY KEY ( id_kategorii );

CREATE TABLE klient (
    id_klienta       NUMBER(4) NOT NULL,
    imie_klienta     VARCHAR2(20) NOT NULL,
    nazwisko_klienta VARCHAR2(30) NOT NULL,
    email_klienta    VARCHAR2(40) NOT NULL,
    id_adresu        NUMBER(4) NOT NULL
);

ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( id_klienta );

CREATE TABLE paragon (
    id_paragonu   NUMBER(4) NOT NULL,
    data_paragonu DATE NOT NULL,
    id_klienta    NUMBER(4) NOT NULL,
    id_zamowienia NUMBER(4) NOT NULL
);

ALTER TABLE paragon ADD CONSTRAINT paragon_pk PRIMARY KEY ( id_paragonu );

CREATE TABLE pozycja_paragonu (
    id_pozycji    NUMBER(4) NOT NULL,
    ilosc_pozycji NUMBER(4) NOT NULL,
    id_produktu   NUMBER(4) NOT NULL,
    id_paragonu   NUMBER(4) NOT NULL
);

ALTER TABLE pozycja_paragonu ADD CONSTRAINT pozycja_paragonu_pk PRIMARY KEY ( id_pozycji );

CREATE TABLE pracownik (
    id_pracownika            NUMBER(4) NOT NULL,
    data_zatrudnienia        DATE NOT NULL,
    imie_pracownika          VARCHAR2(20) NOT NULL,
    nazwisko_pracownika      VARCHAR2(30) NOT NULL,
    wynagrodzenie_pracownika NUMBER(6) NOT NULL
);

ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk PRIMARY KEY ( id_pracownika );

CREATE TABLE produkt (
    id_produktu    NUMBER(4) NOT NULL,
    nazwa_produktu VARCHAR2(30) NOT NULL,
    marka          VARCHAR2(30) NOT NULL,
    podkategoria   VARCHAR2(30) NOT NULL,
    id_kategorii   NUMBER(4) NOT NULL,
    cena_produktu  NUMBER(8, 2) NOT NULL
);

ALTER TABLE produkt ADD CONSTRAINT produkt_pk PRIMARY KEY ( id_produktu );

CREATE TABLE zamowienie (
    id_zamowienia     NUMBER(4) NOT NULL,
    data_zamowienia   DATE NOT NULL,
    status_zamowienia VARCHAR2(20) NOT NULL,
    id_pracownika     NUMBER(4) NOT NULL,
    id_klienta        NUMBER(4) NOT NULL
);

ALTER TABLE zamowienie ADD CONSTRAINT zamowienie_pk PRIMARY KEY ( id_zamowienia );

ALTER TABLE klient
    ADD CONSTRAINT klient_adres_fk FOREIGN KEY ( id_adresu )
        REFERENCES adres_klienta ( id_adresu );

ALTER TABLE paragon
    ADD CONSTRAINT paragon_klient_fk FOREIGN KEY ( id_klienta )
        REFERENCES klient ( id_klienta );

ALTER TABLE paragon
    ADD CONSTRAINT paragon_zamowienie_fk FOREIGN KEY ( id_zamowienia )
        REFERENCES zamowienie ( id_zamowienia );

ALTER TABLE pozycja_paragonu
    ADD CONSTRAINT pozycja_paragonu_paragon_fk FOREIGN KEY ( id_paragonu )
        REFERENCES paragon ( id_paragonu );

ALTER TABLE pozycja_paragonu
    ADD CONSTRAINT pozycja_paragonu_produkt_fk FOREIGN KEY ( id_produktu )
        REFERENCES produkt ( id_produktu );

ALTER TABLE produkt
    ADD CONSTRAINT produkt_kategoria_fk FOREIGN KEY ( id_kategorii )
        REFERENCES kategoria ( id_kategorii );

ALTER TABLE zamowienie
    ADD CONSTRAINT zamowienie_klient_fk FOREIGN KEY ( id_klienta )
        REFERENCES klient ( id_klienta );

ALTER TABLE zamowienie
    ADD CONSTRAINT zamowienie_pracownik_fk FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );





---- Dodawanie danych ----
 
--- Dodawanie kategorii produktow
INSERT INTO kategoria
VALUES(sekwencja_kategoria.nextval,'Laptopy i komputery');
INSERT INTO kategoria
VALUES(sekwencja_kategoria.nextval,'Smartfony i smartwatche');
INSERT INTO kategoria
VALUES(sekwencja_kategoria.nextval,'Gaming');
INSERT INTO kategoria
VALUES(sekwencja_kategoria.nextval,'Podzespoły komputerowe');
INSERT INTO kategoria
VALUES(sekwencja_kategoria.nextval,'Urządzenia peryferyjne');


--- Dodawanie produktow

-- do kategorii Laptopy i komputery
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Macbook Air M1','Apple','Laptopy',1,5200.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Dell XPS15','Dell','Laptopy',1,4000.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Acer Nitro 50','Acer','Komputery',1,3700.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Macbook Pro 16 M1 Max','Apple','Laptopy',1,15000.00);

-- do kategorii Smartfony i smartwatche
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Samsung Galaxy S22 Ultra','Samsung','Smartfony',2,5200.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'iPhone 13','Apple','Smartfony',2,4400.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Apple Watch Ultra','Apple','Smartwatche',2,5000.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Apple Watch S8','Apple','Smartwatche',2,2900.00);

-- do kategorii Gaming
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'XBOX 360','Microsoft','Konsole',3,2200.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'PlayStation 4','SONY','Konsole',3,3000.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Quest Pro','Meta','Gogle VR',3,10000.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'PlayStation 5','Apple','Konsole',3,5000.00);

-- do kategorii Podzespoły komputerowe
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Procesor i5-11400f','Intel','Procesory',4,700.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Procesor AMD Ryzen 5 3600','AMD','Procesory',4,500.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'GeForce RTX 2060 Super','Nvidia','Karty graficzne',4,2100.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Z390','MSI','Płyty główne',4,600.00);

-- do kategorii Urządzenia peryferyjne
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'SteelSeries Apex 5','SteelSeries','Klawiatury',5,599.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'MSI Optix','MSI','Monitory',5,1700.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Silver Monkey M40','Silver Monkey','Myszki',5,70.00);
INSERT INTO produkt
VALUES(sekwencja_produkt.nextval,'Logitech MX Master 3','Logitech','Myszki',5,540.00);


--- Dodawanie adresów klientów
INSERT INTO adres_klienta
VALUES(sekwencja_adres.nextval,'Mazowieckie','Warszawa','01-100','Testowa 1','3');
INSERT INTO adres_klienta
VALUES(sekwencja_adres.nextval,'Mazowieckie','Piaseczno','01-101','Testowa 2','4/2');
INSERT INTO adres_klienta
VALUES(sekwencja_adres.nextval,'Mazowieckie','Warszawa','01-102','Testowa 3','2/1');
INSERT INTO adres_klienta
VALUES(sekwencja_adres.nextval,'Śląśkie','Częstochowa','02-201','Testowa 4','12');
INSERT INTO adres_klienta
VALUES(sekwencja_adres.nextval,'Śląśkie','Kłobuck','02-202','Testowa 5','123');


--- Dodawanie klientów
INSERT INTO klient
VALUES(sekwencja_klient.nextval,'Jan','Abacki','test1@gmail.com',1);
INSERT INTO klient
VALUES(sekwencja_klient.nextval,'Dariusz','Babacki','test2@gmail.com',2);
INSERT INTO klient
VALUES(sekwencja_klient.nextval,'Paweł','Cabacki','test3@gmail.com',4);
INSERT INTO klient
VALUES(sekwencja_klient.nextval,'Mariusz','Cabacki','test4@gmail.com',5);
INSERT INTO klient
VALUES(sekwencja_klient.nextval,'Marian','Dabacki','test5@gmail.com',4);
INSERT INTO klient
VALUES(sekwencja_klient.nextval,'Bogdan','Fabacki','test6@gmail.com',2);


--- Dodawanie pracowników
INSERT INTO pracownik
VALUES(sekwencja_pracownik.nextval,'2018-11-06','Jarosław','Testowy',3000);
INSERT INTO pracownik
VALUES(sekwencja_pracownik.nextval,'2016-08-04','Paweł','Bestowy',4000);
INSERT INTO pracownik
VALUES(sekwencja_pracownik.nextval,'2012-09-02','Krzysztof','Cestowy',6000);


--- Dodawanie zamówień
INSERT INTO zamowienie
VALUES(sekwencja_zamowienie.nextval,'2022-04-11','W trakcie realizacji',1,1);
INSERT INTO zamowienie
VALUES(sekwencja_zamowienie.nextval,'2020-06-03','Zrealizowane',2,2);
INSERT INTO zamowienie
VALUES(sekwencja_zamowienie.nextval,'2021-04-01','W trakcie realizacji',3,3);
INSERT INTO zamowienie
VALUES(sekwencja_zamowienie.nextval,'2021-06-03','Zrealizowane',1,3);
INSERT INTO zamowienie
VALUES(sekwencja_zamowienie.nextval,'2021-01-05','Zrealizowane',2,4);


--- Dodawanie paragonów
INSERT INTO paragon
VALUES(sekwencja_paragon.nextval,'2022-04-11',1,1);
INSERT INTO paragon
VALUES(sekwencja_paragon.nextval,'2020-06-03',2,2);
INSERT INTO paragon
VALUES(sekwencja_paragon.nextval,'2021-04-01',3,3);
INSERT INTO paragon
VALUES(sekwencja_paragon.nextval,'2021-06-03',3,4);
INSERT INTO paragon
VALUES(sekwencja_paragon.nextval,'2021-01-05',4,5);


--- Dodawanie pozycji do paragonów

-- paragon 1
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,1,3,1);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,2,2,1);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,1,8,1);
-- paragon 2
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,3,4,2);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,2,5,2);
-- paragon 3
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,1,6,3);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,2,13,3);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,3,9,3);
-- paragon 4
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,4,15,4);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,2,11,4);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,1,1,4);
-- paragon 5
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,1,14,5);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,2,20,5);
INSERT INTO pozycja_paragonu
VALUES(sekwencja_pozycja_paragonu.nextval,3,18,5);





---- Perspektywy ----

-- Wyswietl oferte sklepu
CREATE OR REPLACE VIEW wyswietl_cala_oferte AS
SELECT nazwa_kategorii, podkategoria, nazwa_produktu, marka, cena_produktu
FROM kategoria, produkt
WHERE kategoria.id_kategorii=produkt.id_kategorii
ORDER BY kategoria.id_kategorii, podkategoria;
    SELECT * FROM wyswietl_cala_oferte;


-- Wyswietl zarobki wedlug miesiecy
CREATE OR REPLACE VIEW zarobki_wedlug_miesiecy AS
SELECT extract(year FROM data_paragonu) AS rok, extract(month FROM data_paragonu) AS miesiac, sum(ilosc_pozycji*cena_produktu) AS kwota
FROM produkt, paragon, pozycja_paragonu 
WHERE paragon.id_paragonu=pozycja_paragonu.id_paragonu AND pozycja_paragonu.id_produktu=produkt.id_produktu
GROUP BY extract(year FROM data_paragonu),extract(month FROM data_paragonu)
ORDER BY extract(year FROM data_paragonu),extract(month FROM data_paragonu);
    SELECT *  FROM zarobki_wedlug_miesiecy;


-- Pokaz najlepiej sprzedajace sie marki
CREATE OR REPLACE VIEW najlepiej_sprzedajace_sie_marki AS
SELECT marka, sum(ilosc_pozycji) AS ilosc, sum(ilosc_pozycji * cena_produktu) AS laczna_kwota 
FROM produkt, pozycja_paragonu
WHERE produkt.id_produktu=pozycja_paragonu.id_produktu
GROUP BY marka
ORDER BY count(ilosc_pozycji) DESC;
    SELECT * FROM najlepiej_sprzedajace_sie_marki ORDER BY laczna_kwota DESC;


-- Pokaz z jakich miast jest najwiecej zamowien
CREATE OR REPLACE VIEW miasta_najwiecej_zamowien AS
SELECT miasto, count(*) AS zamowien
FROM adres_klienta, klient, zamowienie
WHERE adres_klienta.id_adresu=klient.id_adresu AND klient.id_klienta=zamowienie.id_klienta
GROUP BY miasto
ORDER BY count(*) DESC;
    SELECT * FROM miasta_najwiecej_zamowien;