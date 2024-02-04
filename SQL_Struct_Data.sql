--TABULKY:
CREATE TABLE kategória (
  id_kategorie INTEGER NOT NULL,
  typ_vozidla VARCHAR2(30) NOT NULL,
  cena_za_den FLOAT NOT NULL,
  PRIMARY KEY (id_kategorie)
);

CREATE TABLE miesto (
  miesto_prenájmu_id INTEGER NOT NULL,
  mesto VARCHAR2(30) NOT NULL,
  ulica_a_c_domu VARCHAR2(50) NOT NULL,
  psč INTEGER NOT NULL,
  tel_cislo VARCHAR2(15),
  email VARCHAR2(60),
  PRIMARY KEY (miesto_prenájmu_id)
);

CREATE TABLE platba (
  platba_id INTEGER NOT NULL,
  dátum_vytvorenia_platby DATE NOT NULL,
  popis VARCHAR2(300),
  typ_platby VARCHAR2(50) NOT NULL,
  celková_suma FLOAT NOT NULL,
  PRIMARY KEY (platba_id)
);

CREATE TABLE rezervácia (
  rezervácia_id INTEGER NOT NULL,
  dátum_vytvorenia_rezervácie DATE NOT NULL,
  začiatok_prenájmu DATE NOT NULL,
  koniec_prenájmu DATE NOT NULL,
  stav_rezervácie VARCHAR2(20) NOT NULL,
  miesto_prenájmu_id INTEGER NOT NULL,
  platba_id INTEGER NOT NULL,
  PRIMARY KEY (rezervácia_id),
  FOREIGN KEY (miesto_prenájmu_id) REFERENCES miesto(miesto_prenájmu_id),
  FOREIGN KEY (platba_id) REFERENCES platba(platba_id)
);

CREATE TABLE vozidlo (
  vozidlo_id INTEGER NOT NULL,
  špz VARCHAR2(7) NOT NULL,
  názov VARCHAR2(100) NOT NULL,
  popis VARCHAR2(250),
  farba VARCHAR2(30),
  počet_miest INTEGER NOT NULL,
  image VARCHAR2(350) NOT NULL,
  id_kategorie INTEGER NOT NULL,
  rezervácia_id INTEGER,
  PRIMARY KEY (vozidlo_id),
  FOREIGN KEY (id_kategorie) REFERENCES kategória(id_kategorie),
  FOREIGN KEY (rezervácia_id) REFERENCES rezervácia(rezervácia_id)
);

CREATE TABLE kartové_údaje (
  kartové_údaje_id INTEGER NOT NULL,
  držiteľ_karty VARCHAR2(30) NOT NULL,
  číslo_karty INTEGER NOT NULL,
  dátum_spotreby VARCHAR2(7) NOT NULL,
  cvv INTEGER NOT NULL,
  platba_id INTEGER NOT NULL,
  PRIMARY KEY (kartové_údaje_id),
  FOREIGN KEY (platba_id) REFERENCES platba(platba_id)
);


CREATE TABLE zákazník (
  zakazník_id INTEGER NOT NULL,
  vodičský_preukaz_čislo VARCHAR2(30) NOT NULL,
  titul VARCHAR2(50),
  meno VARCHAR2(30) NOT NULL,
  priezvisko VARCHAR2(30) NOT NULL,
  email VARCHAR2(60) NOT NULL,
  tel_cislo VARCHAR2(15) NOT NULL,
  mesto VARCHAR2(35) NOT NULL,
  ulica_a_c_domu VARCHAR2(40) NOT NULL,
  psč INTEGER NOT NULL,
  kartové_údaje_id INTEGER NOT NULL,
  PRIMARY KEY (zakazník_id),
  FOREIGN KEY (kartové_údaje_id) REFERENCES kartové_údaje(kartové_údaje_id)
);

--UDAJE:
-- TABULKA KARTOVÉ UDAJE
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (1, 'Nissie Challens', '3569952900181271', '2025-10', 540, 31);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (2, 'Gordy Durning', '6381346281479355', '2023-08', 198, 87);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (3, 'Taddeo Gehricke', '06048325383568104', '2019-12', 281, 91);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (4, 'Koressa Bryde', '3539013449991113', '2024-09', 370, 54);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (5, 'Kelsy Crannis', '5602225778470330', '2023-07', 521, 9);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (6, 'Guglielma Rance', '3576789793545274', '2027-04', 758, 13);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (7, 'Evvie Tibbs', '3556222033503170', '2025-07', 376, 54);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (8, 'Edouard Orpin', '56022235988169650', '2022-06', 394, 92);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (9, 'Henrie Jeroch', '5602258793701264', '2028-09', 968, 92);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (10, 'Zebedee Osinin', '3578830446885051', '2019-12', 229, 43);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (11, 'Kellen Gouldeby', '5602238057466176', '2028-09', 976, 95);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (12, 'Lorine Keepence', '6381296611523564', '2026-08', 219, 36);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (13, 'Hilton Landsborough', '3569753857920616', '2028-04', 837, 19);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (14, 'Elliott Annable', '3559336453071489', '2024-07', 148, 45);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (15, 'Doris Gommowe', '6397588078247642', '2019-12', 341, 53);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (16, 'Giles Burns', '6377264837444433', '2021-09', 872, 82);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (17, 'Rowe Barnham', '3529495196512162', '2023-09', 292, 27);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (18, 'Vassily Mattisssen', '3560551481815361', '2023-11', 720, 40);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (19, 'Regan Bunclark', '3585860028032724', '2022-03', 570, 3);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (20, 'Blayne Davidge', '0604385961918336', '2025-08', 815, 52);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (21, 'Tallie Doggart', '3529148537843313', '2022-04', 341, 69);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (22, 'Vin Kun', '56022145345322738', '2024-01', 972, 45);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (23, 'Josselyn Dockery', '3571458763516740', '2018-07', 186, 1);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (24, 'Dario Stocking', '676339259307847658', '2020-02', 327, 40);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (25, 'Alberto Andrieu', '5602245920211010', '2028-03', 532, 91);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (26, 'Maddalena Godbold', '3570776867933953', '2025-03', 123, 96);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (27, 'Saleem Millson', '560223714398130757', '2020-11', 996, 22);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (28, 'Spenser Wilkowski', '3533118107703431', '2022-04', 363, 93);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (29, 'Sally O''Lagen', '3577936752994253', '2019-05', 832, 35);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (30, 'Carver Armin', '3555312086967835', '2025-12', 904, 54);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (31, 'Melody Huggett', '4844050658902371', '2028-05', 510, 83);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (32, 'Lurette Reddick', '3579795089599377', '2018-07', 931, 12);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (33, 'Mersey Dionis', '30151595836078', '2021-07', 659, 76);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (34, 'Caritta Cahani', '3560788994017784', '2022-12', 883, 26);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (35, 'Lucille Batcheldor', '3576281490858663', '2025-10', 113, 48);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (36, 'Calypso MacGee', '560222251101511644', '2020-11', 811, 13);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (37, 'Aarika Imlock', '676702645321341968', '2020-03', 996, 64);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (38, 'Winne Gingedale', '56022377994123675', '2026-11', 605, 23);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (39, 'Fredek Seyler', '5173829260991114', '2027-08', 509, 26);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (40, 'Evangeline Lethby', '372301386818704', '2026-02', 406, 39);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (41, 'Rockey Morgue', '67596867477827878', '2027-06', 825, 41);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (42, 'Charis MacPaden', '561037809272537335', '2023-04', 560, 53);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (43, 'Peadar Metherell', '3562297482389927', '2026-12', 980, 8);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (44, 'Raychel Severns', '5610256431004323', '2027-10', 371, 93);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (45, 'Ashbey Sparham', '30525977384320', '2024-03', 671, 57);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (46, 'Korella Blankhorn', '375237253983576', '2019-04', 323, 46);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (47, 'Kameko Streight', '67599998215865545', '2024-08', 162, 82);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (48, 'Gerald Steanyng', '5222066871699205', '2027-03', 836, 6);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (49, 'Berny Merrigan', '50188663805777673', '2024-04', 588, 47);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (50, 'Kristopher Korneichik', '5100141187868047', '2027-04', 315, 99);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (51, 'Helge Maymond', '3542796422887465', '2020-04', 620, 54);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (52, 'Earl Trehearne', '3554981086709776', '2018-09', 698, 60);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (53, 'Viva Hatliffe', '4017951687946', '2025-09', 805, 20);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (54, 'Agneta Cogle', '3544115875728704', '2022-08', 411, 5);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (55, 'Bevin Reddell', '4936202441701326', '2020-08', 343, 38);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (56, 'Raphael Gerssam', '3563915053113256', '2027-08', 700, 13);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (57, 'Tessa Melland', '3540470665429060', '2020-12', 135, 52);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (58, 'Ansel Elphinstone', '6334894549722718', '2024-08', 323, 16);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (59, 'Jeanne Worsam', '5007667000264661', '2027-04', 153, 31);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (60, 'Cyrillus Zarb', '5018935519039692815', '2019-03', 696, 72);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (61, 'Leeann Dwire', '5602251073777872', '2023-02', 982, 26);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (62, 'Eugenie Mohan', '3539296635445727', '2019-01', 979, 90);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (63, 'Rusty Smiley', '4017958618159', '2022-10', 864, 36);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (64, 'Dag Ackwood', '5335189669121705', '2018-08', 278, 41);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (65, 'Urban Browning', '3563496264644496', '2021-08', 679, 45);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (66, 'Ida Goodlip', '3578954210237859', '2022-10', 406, 9);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (67, 'Karel Habden', '372301130407424', '2025-02', 753, 18);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (68, 'Aubine Giles', '490572067070582184', '2025-06', 728, 64);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (69, 'Leila Fareweather', '4405235553765640', '2021-10', 960, 13);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (70, 'Rennie Grcic', '3581644046102592', '2021-07', 183, 6);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (71, 'Arlyne Alejo', '3534551598575737', '2026-05', 798, 40);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (72, 'Cele Rudeyeard', '5100179930544135', '2025-02', 438, 80);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (73, 'Florentia Sheed', '589365265259279321', '2024-11', 451, 69);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (74, 'Benjy Tottem', '30577178850708', '2025-04', 519, 22);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (75, 'Christopher Hyder', '201476376091178', '2027-07', 204, 100);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (76, 'Ciro Bench', '3550097856438704', '2020-06', 844, 69);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (77, 'Breena Thickpenny', '56022281281345555', '2018-08', 785, 80);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (78, 'Karel Dark', '5610514634495040988', '2026-02', 852, 5);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (79, 'Cthrine Stockell', '374288541996194', '2026-05', 472, 7);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (80, 'Harris Luety', '3580972554569287', '2025-09', 308, 54);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (81, 'Ulrica Landrieu', '3552080018857852', '2021-07', 812, 54);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (82, 'Gannie Essberger', '3584454154353012', '2018-07', 713, 28);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (83, 'Reynold Watts', '5108753374833634', '2026-05', 806, 39);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (84, 'Sheela Bogue', '3578039003081126', '2026-11', 764, 61);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (85, 'Amandi Huckfield', '50208857545662007', '2025-03', 692, 100);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (86, 'Corene Louch', '5189450964697220', '2024-01', 623, 39);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (87, 'Christiano Delamaine', '3577029553738648', '2022-04', 407, 57);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (88, 'Jannelle Amis', '36214176596018', '2019-02', 610, 77);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (89, 'Michaeline Plampin', '3586057626781674', '2023-05', 981, 59);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (90, 'L;urette Baynon', '5602229778109153', '2022-11', 358, 8);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (91, 'Sidney Bovaird', '5602254338563640', '2028-07', 188, 14);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (92, 'Andra Kauble', '4903409477483807', '2025-11', 235, 39);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (93, 'Lynnette Koubu', '5588420187202618', '2026-07', 461, 51);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (94, 'Bessie Cloney', '5344613788893075', '2023-11', 804, 8);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (95, 'Debera Pendrey', '5602240918977227876', '2021-06', 267, 31);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (96, 'Rossy Oldall', '4508947184901305', '2029-03', 880, 60);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (97, 'Morey Addams', '4017951149074160', '2022-08', 861, 70);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (98, 'Mel Motten', '5602221429414579', '2023-06', 694, 89);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (99, 'Abie Statter', '6373831649653148', '2024-02', 974, 22);
insert into kartové_údaje (kartové_údaje_id, držiteľ_karty, číslo_karty, dátum_spotreby, cvv, platba_id) values (100, 'Hadria Sparrowe', '374288234456936', '2026-08', 463, 39);

--TABULKA KATEGORIA
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (1, 'van', 219.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (2, 'luxury', 239.2);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (3, 'sedan', 178.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (4, 'luxury', 218.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (5, 'supersport', 141.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (6, 'classic', 197.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (7, 'luxury', 191.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (8, 'classic', 69.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (9, 'supersport', 114.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (10, 'cabrio', 150.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (11, 'cabrio', 246.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (12, 'supersport', 115.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (13, 'van', 125.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (14, 'luxury', 247.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (15, 'luxury', 101.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (16, 'luxury', 87.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (17, 'sedan', 85.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (18, 'sedan', 227.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (19, 'sedan', 58.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (20, 'cabrio', 222.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (21, 'cabrio', 52.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (22, 'supersport', 80.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (23, 'supersport', 122.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (24, 'luxury', 132.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (25, 'van', 149.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (26, 'van', 240.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (27, 'classic', 214.3);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (28, 'classic', 98.2);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (29, 'sedan', 152.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (30, 'supersport', 61.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (31, 'classic', 229.3);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (32, 'cabrio', 175.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (33, 'sedan', 245.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (34, 'supersport', 138.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (35, 'van', 108.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (36, 'supersport', 83.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (37, 'supersport', 220.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (38, 'cabrio', 228.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (39, 'sedan', 241.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (40, 'luxury', 137.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (41, 'supersport', 178.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (42, 'van', 107.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (43, 'luxury', 120.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (44, 'sedan', 228.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (45, 'sedan', 68.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (46, 'luxury', 62.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (47, 'sedan', 186.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (48, 'luxury', 148.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (49, 'sedan', 58.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (50, 'supersport', 108.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (51, 'supersport', 121.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (52, 'luxury', 160.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (53, 'sedan', 175.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (54, 'sedan', 154.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (55, 'van', 248.2);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (56, 'sedan', 245.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (57, 'sedan', 213.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (58, 'sedan', 62.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (59, 'van', 237.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (60, 'cabrio', 170.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (61, 'sedan', 77.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (62, 'cabrio', 178.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (63, 'classic', 203.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (64, 'cabrio', 110.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (65, 'supersport', 138.3);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (66, 'luxury', 223.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (67, 'luxury', 131.9);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (68, 'classic', 77.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (69, 'van', 148.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (70, 'supersport', 201.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (71, 'supersport', 100.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (72, 'luxury', 73.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (73, 'luxury', 192.3);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (74, 'sedan', 246.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (75, 'sedan', 219.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (76, 'supersport', 64.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (77, 'van', 249.2);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (78, 'luxury', 244.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (79, 'classic', 109.5);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (80, 'supersport', 238.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (81, 'sedan', 205.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (82, 'supersport', 216.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (83, 'luxury', 158.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (84, 'supersport', 144.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (85, 'classic', 239.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (86, 'luxury', 143.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (87, 'cabrio', 140.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (88, 'supersport', 248.8);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (89, 'luxury', 92.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (90, 'supersport', 214.3);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (91, 'supersport', 118.0);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (92, 'sedan', 247.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (93, 'cabrio', 87.7);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (94, 'luxury', 81.2);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (95, 'classic', 94.1);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (96, 'sedan', 54.2);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (97, 'van', 151.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (98, 'classic', 158.6);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (99, 'classic', 107.4);
insert into kategória (id_kategorie, typ_vozidla, cena_za_den) values (100, 'classic', 114.3);

--TABULKA MIESTO
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (1, 'Bratsigovo', 'Apt 467', 47117, 'ipulster0@ning.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (2, 'Trà My', 'Apt 590', 88218, 'eceaser1@reddit.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (3, 'Kowala', '13th Floor', 96144, 'geakens2@thetimes.co.uk');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (4, 'Thới Bình', 'Room 299', 13304, 'jbrittlebank3@archive.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (5, 'Bergen op Zoom', 'Suite 92', 44876, 'oudall4@github.io');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (6, 'Lapinjärvi', 'Suite 100', 15293, 'gdibson5@craigslist.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (7, 'Ocoruro', 'Apt 1653', 62104, 'bbloodworth6@cafepress.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (8, 'Henglu', 'Room 97', 47085, 'rtremain7@va.gov');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (9, 'Klutuk', '11th Floor', 45733, 'fdelayglesias8@home.pl');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (10, 'Dongming', 'Apt 39', 61814, 'cbickford9@usnews.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (11, 'Pétionville', 'Suite 79', 37362, 'ahurna@pagesperso-orange.fr');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (12, 'Changle', 'Apt 908', 27486, 'bmethb@ocn.ne.jp');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (13, 'Macamic', 'Suite 91', 37211, 'brossic@symantec.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (14, 'Stockholm', 'Room 1047', 75810, 'amoormand@wikia.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (15, 'Malá Strana', '15th Floor', 16514, 'pcounselle@ehow.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (16, 'Pertunmaa', 'Suite 66', 20415, 'fpurcellf@mit.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (17, 'Ängelholm', 'PO Box 15415', 74309, 'vduxbarryg@buzzfeed.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (18, 'Pucangkrajan', 'PO Box 19179', 78305, 'jdreush@bloomberg.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (19, 'Tournon-sur-Rhône', '3rd Floor', 35473, 'mcabani@tumblr.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (20, 'Vishnyeva', '18th Floor', 10785, 'nszymanzykj@ted.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (21, 'Gao', 'Apt 1663', 73423, 'pluckhamk@blogspot.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (22, 'Ketapang', 'PO Box 25836', 67643, 'mginnellyl@princeton.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (23, 'Bandar-e Torkaman', 'Room 639', 87746, 'ffidockm@de.vu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (24, 'Baisha', 'Apt 1265', 90186, 'dmayon@opensource.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (25, 'Waerana', 'Suite 57', 54696, 'shargroveso@stumbleupon.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (26, 'Burujul', '13th Floor', 87217, 'umcginleyp@earthlink.net');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (27, 'La Coipa', 'Suite 86', 95826, 'cchampneysq@sohu.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (28, 'Riobamba', '17th Floor', 39154, 'lquodlingr@ox.ac.uk');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (29, 'Padasuka', 'Apt 772', 55169, 'rsapsfordes@example.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (30, 'Vostochnoe Degunino', 'PO Box 51801', 67523, 'cpretleyt@hatena.ne.jp');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (31, 'San Andrés', 'Suite 41', 63990, 'ldableu@oakley.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (32, 'Osypenko', 'PO Box 35305', 48928, 'zbanvillev@yellowpages.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (33, 'Daşoguz', 'Apt 1891', 50232, 'vegleofgermanyw@sakura.ne.jp');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (34, 'La Maná', 'PO Box 16836', 46702, 'aedgecumbex@facebook.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (35, 'Jardín', 'Room 757', 39511, 'vbreamy@usa.gov');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (36, 'Troitsk', '15th Floor', 97548, 'jtorrz@webmd.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (37, 'Siennica Różana', 'Room 1002', 37615, 'frochester10@disqus.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (38, 'Agdangan', 'Suite 79', 90242, 'bpaterno11@edublogs.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (39, 'Pergamino', 'Room 545', 15296, 'ngiveen12@elegantthemes.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (40, 'Täby', 'Apt 1345', 40180, 'kabsalom13@zdnet.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (41, 'Qiansuo', '1st Floor', 21851, 'zshrigley14@wikia.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (42, 'Belén de Umbría', 'Room 909', 12197, 'efinnemore15@si.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (43, 'Sambongpari', 'Suite 57', 19189, 'wisacsson16@samsung.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (44, 'Hŭngnam', 'Suite 18', 56410, 'flovewell17@eventbrite.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (45, 'Nizwá', '19th Floor', 44506, 'rhandford18@unesco.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (46, 'Cumedak', 'Room 802', 35937, 'fcaskey19@scientificamerican.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (47, 'Wenshang', 'PO Box 42559', 39622, 'ewitherby1a@chronoengine.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (48, 'Nelahozeves', 'PO Box 76259', 80682, 'lrushby1b@google.com.hk');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (49, 'Shāhdādkot', 'Suite 76', 33441, 'rkilmurray1c@typepad.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (50, 'San Juan', 'Apt 1593', 81111, 'aheaney1d@ted.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (51, 'Kertasari', 'Apt 1031', 71949, 'ndimaria1e@posterous.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (52, 'Trélazé', 'Room 1024', 43394, 'cgurton1f@weibo.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (53, 'Yélimané', '9th Floor', 20576, 'lbane1g@twitter.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (54, 'Kedrovoye', '6th Floor', 44838, 'rzohrer1h@unc.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (55, 'Guiniculalay', 'PO Box 42758', 80645, 'cscobbie1i@vimeo.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (56, 'Mejdan - Obilićevo', 'Apt 97', 22692, 'gceney1j@sbwire.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (57, 'Shuangquan', 'PO Box 3901', 98314, 'lradolf1k@issuu.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (58, 'Qianhong', '1st Floor', 63465, 'mmaisey1l@drupal.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (59, 'Kubangsari', 'PO Box 89616', 52939, 'ayarn1m@github.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (60, 'Shimen', 'Suite 74', 42532, 'bfalkinder1n@xinhuanet.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (61, 'Strání', 'PO Box 80705', 49205, 'lloughnan1o@eepurl.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (62, 'Sanban', 'Room 300', 24422, 'delphey1p@indiatimes.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (63, 'Knoxville', 'PO Box 90043', 57040, 'dcharlo1q@cbsnews.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (64, 'Pristina', 'Room 1972', 49401, 'lleal1r@hao123.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (65, 'Yunmeng Chengguanzhen', 'Apt 1010', 75789, 'bfazan1s@hc360.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (66, 'Rixinhe', 'Room 1319', 58303, 'udavinet1t@cnn.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (67, 'Nanuque', 'Room 121', 19688, 'fohear1u@mapy.cz');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (68, 'San Agustín', 'Room 558', 26109, 'gsouthern1v@harvard.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (69, 'Asemanis', 'Room 1049', 54778, 'jdehooge1w@salon.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (70, 'Dimitrovgrad', 'Room 585', 40227, 'sgillingham1x@comsenz.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (71, 'Bangluo', 'Room 771', 85572, 'dstag1y@utexas.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (72, 'Bilajer', 'PO Box 82699', 96331, 'bgollard1z@pagesperso-orange.fr');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (73, 'San Rafael Petzal', 'Room 1012', 52472, 'ejacquemet20@gravatar.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (74, 'Yong’an', 'Room 635', 69201, 'eblair21@issuu.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (75, 'Tikiw', '15th Floor', 54408, 'bhughesdon22@skype.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (76, 'Tijão', 'PO Box 80729', 81797, 'rdemendoza23@cnet.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (77, 'Sempu', '10th Floor', 16255, 'gdavidov24@google.ca');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (78, 'Praimarada', 'PO Box 13987', 20717, 'heschalette25@ovh.net');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (79, 'Sinfra', 'Suite 57', 43292, 'zeusden26@indiegogo.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (80, 'Adzopé', 'PO Box 80743', 33459, 'mhaeslier27@techcrunch.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (81, 'Pont-Audemer', 'Suite 69', 36477, 'tduchan28@yolasite.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (82, 'Belogorsk', 'Suite 15', 66389, 'lkittle29@shop-pro.jp');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (83, 'Chocianów', 'Suite 56', 45969, 'sepiscopi2a@etsy.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (84, 'Maluanluan', 'PO Box 36696', 32768, 'rmurfett2b@nationalgeographic.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (85, 'Lubumbashi', 'Room 692', 75065, 'hskittle2c@geocities.jp');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (86, 'Shijiazhuang', 'Apt 1714', 78111, 'awilstead2d@parallels.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (87, 'Margahayu', 'Suite 57', 97979, 'klink2e@webmd.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (88, 'Tisma', 'Suite 51', 26252, 'mswalwel2f@purevolume.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (89, 'Cilated', 'Room 1573', 77166, 'cmckinty2g@51.la');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (90, 'Shaheying', 'Suite 22', 17295, 'kgunter2h@xinhuanet.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (91, 'Paseh', 'Suite 32', 96839, 'kskea2i@cnn.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (92, 'K’olīto', 'Apt 1484', 96895, 'dredmore2j@berkeley.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (93, 'Japeri', 'Room 1548', 47088, 'vclowser2k@elegantthemes.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (94, 'Tamiso', '8th Floor', 97564, 'sklein2l@quantcast.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (95, 'Yajiang', 'Suite 90', 50412, 'mbalnave2m@mashable.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (96, 'Shanghe', 'PO Box 42498', 70262, 'kevesque2n@1688.com');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (97, 'Biliri', 'Suite 3', 82798, 'lchampain2o@mozilla.org');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (98, 'Bąków', '5th Floor', 25533, 'kkalker2p@nasa.gov');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (99, 'Skála', 'Apt 11', 65452, 'jstern2q@si.edu');
insert into miesto (miesto_prenájmu_id, mesto, ulica_a_c_domu, psč, email) values (100, 'Sugcad', 'Room 1975', 49603, 'tzanioletti2r@acquirethisname.com');

--TABULKA PLATBA
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (1, '01-Aug-2019', null, 'Credit Card', 936.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (2, '12-Apr-2020', null, 'Cash', 171.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (3, '23-Aug-2021', null, 'Credit Card', 508.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (4, '22-Jun-2020', 'vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum', 'Credit Card', 237.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (5, '11-May-2022', null, 'Credit Card', 601.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (6, '12-Apr-2019', null, 'Bank Transfer', 532.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (7, '12-Sep-2020', null, 'Debit Card', 425.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (8, '07-Jul-2019', null, 'Debit Card', 510.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (9, '10-Jul-2019', null, 'Cash', 933.9);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (10, '20-Sep-2022', null, 'Debit Card', 368.9);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (11, '11-Dec-2021', 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', 'Bank Transfer', 273.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (12, '30-Dec-2019', 'libero nam dui proin leo odio porttitor id consequat in consequat', 'Cash', 867.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (13, '07-Jun-2020', null, 'Bank Transfer', 395.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (14, '01-Sep-2021', null, 'Cash', 234.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (15, '07-Sep-2019', null, 'Credit Card', 318.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (16, '07-Sep-2020', 'nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo', 'Cash', 175.9);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (17, '30-Mar-2020', 'odio cras mi pede malesuada in imperdiet et commodo vulputate justo', 'Credit Card', 326.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (18, '17-Aug-2022', null, 'Debit Card', 349.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (19, '27-Aug-2019', null, 'Cash', 217.0);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (20, '08-Apr-2020', null, 'Credit Card', 951.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (21, '26-Jun-2019', null, 'Credit Card', 223.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (22, '05-Feb-2023', null, 'Credit Card', 654.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (23, '18-Jun-2022', null, 'Cash', 179.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (24, '11-Sep-2020', 'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non', 'Credit Card', 933.9);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (25, '20-Mar-2019', 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', 'Bank Transfer', 495.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (26, '02-Jan-2023', null, 'Debit Card', 914.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (27, '30-Jan-2023', null, 'Debit Card', 900.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (28, '16-Feb-2022', 'consequat metus sapien ut nunc vestibulum ante ipsum primis in', 'Bank Transfer', 279.9);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (29, '03-Mar-2022', null, 'Cash', 882.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (30, '25-Jun-2019', null, 'Credit Card', 513.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (31, '27-Mar-2019', 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim', 'Debit Card', 993.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (32, '20-Jan-2022', null, 'Cash', 590.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (33, '29-Jan-2022', null, 'Cash', 179.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (34, '20-Feb-2022', null, 'Debit Card', 544.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (35, '06-Oct-2019', null, 'Bank Transfer', 541.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (36, '27-Jun-2022', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', 'Debit Card', 506.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (37, '29-Mar-2022', 'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam', 'Cash', 702.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (38, '05-Mar-2022', 'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non', 'Bank Transfer', 343.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (39, '30-Mar-2021', 'morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit', 'Bank Transfer', 314.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (40, '20-Sep-2020', 'primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum', 'Debit Card', 707.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (41, '18-Oct-2022', null, 'Credit Card', 722.0);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (42, '24-Aug-2019', null, 'Bank Transfer', 313.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (43, '05-Sep-2022', null, 'Credit Card', 225.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (44, '15-Apr-2020', 'ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'Cash', 247.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (45, '19-Jun-2022', 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec', 'Bank Transfer', 513.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (46, '03-Jul-2019', null, 'Debit Card', 323.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (47, '24-Dec-2021', null, 'Bank Transfer', 856.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (48, '18-Oct-2022', null, 'Cash', 163.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (49, '10-Aug-2020', 'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor', 'Cash', 168.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (50, '15-Oct-2019', null, 'Credit Card', 904.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (51, '07-Jun-2022', null, 'Cash', 430.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (52, '21-May-2022', 'semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat', 'Credit Card', 291.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (53, '08-Dec-2019', 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 'Debit Card', 322.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (54, '05-Apr-2021', 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', 'Debit Card', 929.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (55, '28-Feb-2019', null, 'Credit Card', 401.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (56, '18-Mar-2023', null, 'Bank Transfer', 213.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (57, '20-Jan-2019', null, 'Bank Transfer', 900.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (58, '15-Oct-2022', null, 'Credit Card', 529.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (59, '27-Jan-2021', null, 'Credit Card', 490.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (60, '12-May-2020', 'vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 'Cash', 964.9);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (61, '25-Aug-2020', 'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', 'Debit Card', 668.3);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (62, '30-May-2022', null, 'Debit Card', 623.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (63, '30-Apr-2020', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'Credit Card', 947.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (64, '11-Jun-2020', null, 'Bank Transfer', 425.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (65, '02-Jun-2021', 'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor', 'Credit Card', 482.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (66, '23-Nov-2019', null, 'Credit Card', 752.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (67, '22-Apr-2021', 'leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa', 'Bank Transfer', 535.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (68, '24-May-2019', null, 'Credit Card', 597.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (69, '27-Mar-2019', null, 'Cash', 374.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (70, '17-Aug-2022', 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis', 'Credit Card', 250.4);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (71, '01-Jun-2020', null, 'Cash', 980.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (72, '11-May-2020', null, 'Bank Transfer', 814.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (73, '08-Oct-2022', null, 'Bank Transfer', 226.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (74, '16-Nov-2020', null, 'Bank Transfer', 864.0);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (75, '13-Apr-2021', null, 'Debit Card', 631.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (76, '11-May-2019', 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 'Cash', 803.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (77, '10-Sep-2019', 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante', 'Bank Transfer', 824.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (78, '17-Jan-2023', 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet', 'Bank Transfer', 949.3);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (79, '07-Dec-2019', null, 'Credit Card', 852.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (80, '16-Apr-2020', 'fermentum donec ut mauris eget massa tempor convallis nulla neque libero', 'Debit Card', 542.0);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (81, '06-Nov-2019', null, 'Bank Transfer', 318.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (82, '01-Apr-2023', null, 'Cash', 435.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (83, '07-Jan-2021', null, 'Bank Transfer', 599.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (84, '05-Oct-2020', 'felis ut at dolor quis odio consequat varius integer ac leo', 'Credit Card', 969.5);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (85, '01-Jul-2019', null, 'Cash', 292.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (86, '02-Dec-2021', 'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede', 'Cash', 730.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (87, '24-Feb-2023', 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 'Credit Card', 418.2);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (88, '06-Jan-2023', null, 'Bank Transfer', 885.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (89, '31-Mar-2023', 'sed tristique in tempus sit amet sem fusce consequat nulla nisl', 'Bank Transfer', 862.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (90, '16-Jul-2022', null, 'Cash', 467.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (91, '06-Feb-2023', null, 'Debit Card', 516.0);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (92, '05-May-2022', null, 'Credit Card', 494.1);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (93, '24-Aug-2022', null, 'Bank Transfer', 730.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (94, '01-Jan-2021', null, 'Credit Card', 373.8);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (95, '27-Jul-2019', null, 'Credit Card', 558.6);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (96, '11-Jun-2020', 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut', 'Debit Card', 700.3);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (97, '30-Dec-2022', null, 'Debit Card', 606.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (98, '15-Oct-2021', 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', 'Bank Transfer', 933.3);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (99, '12-May-2021', null, 'Cash', 687.7);
insert into platba (platba_id, dátum_vytvorenia_platby, popis, typ_platby, celková_suma) values (100, '02-Dec-2022', 'in tempus sit amet sem fusce consequat nulla nisl nunc nisl', 'Bank Transfer', 498.6);

--TABULKA REZERVACIA
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (1, '29-Jun-2019', '12-Jun-2021', '14-Nov-2022', 'Pending', 1, 1);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (2, '21-Aug-2017', '05-Apr-2022', '04-Feb-2018', 'Pending', 2, 2);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (3, '30-Dec-2021', '18-Dec-2021', '01-Mar-2023', 'Pending', 3, 3);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (4, '24-Mar-2023', '16-Dec-2019', '14-Dec-2020', 'Completed', 4, 4);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (5, '10-Sep-2018', '07-Dec-2022', '20-Apr-2021', 'Cancelled', 5, 5);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (6, '17-Apr-2019', '13-Nov-2019', '03-Feb-2021', 'Pending', 6, 6);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (7, '26-Sep-2017', '16-Sep-2019', '24-Jul-2018', 'Cancelled', 7, 7);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (8, '20-Jul-2020', '08-Jan-2023', '19-Jun-2020', 'Completed', 8, 8);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (9, '23-Jan-2021', '11-Nov-2021', '19-Sep-2021', 'Pending', 9, 9);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (10, '24-Dec-2020', '12-Feb-2023', '05-Apr-2018', 'Cancelled', 10, 10);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (11, '06-Mar-2018', '07-Dec-2020', '27-Feb-2023', 'Cancelled', 11, 11);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (12, '21-Feb-2020', '01-Nov-2018', '28-Jan-2018', 'Pending', 12, 12);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (13, '06-Jun-2022', '01-Feb-2022', '05-Mar-2020', 'Completed', 13, 13);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (14, '21-Nov-2020', '13-Jun-2022', '21-Sep-2020', 'Pending', 14, 14);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (15, '28-Oct-2022', '06-Aug-2019', '09-May-2019', 'Cancelled', 15, 15);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (16, '06-Jul-2017', '24-May-2021', '02-Sep-2022', 'Cancelled', 16, 16);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (17, '10-Sep-2022', '27-Apr-2021', '13-Jan-2020', 'Completed', 17, 17);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (18, '09-May-2021', '22-Oct-2022', '20-Dec-2017', 'Pending', 18, 18);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (19, '13-May-2020', '21-Jan-2018', '29-Jun-2019', 'Pending', 19, 19);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (20, '11-Apr-2020', '12-Oct-2019', '15-Oct-2019', 'Completed', 20, 20);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (21, '03-Aug-2018', '04-Sep-2022', '24-Apr-2018', 'Cancelled', 21, 21);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (22, '13-Jan-2020', '14-Jul-2021', '03-Jul-2022', 'Completed', 22, 22);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (23, '16-Mar-2019', '20-Apr-2022', '24-Dec-2019', 'Pending', 23, 23);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (24, '20-Mar-2019', '02-Nov-2019', '17-Oct-2021', 'Pending', 24, 24);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (25, '26-Apr-2022', '22-Oct-2020', '06-Apr-2022', 'Cancelled', 25, 25);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (26, '09-Apr-2019', '25-May-2020', '02-Oct-2022', 'Pending', 26, 26);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (27, '21-Sep-2022', '25-Jan-2020', '25-Mar-2019', 'Pending', 27, 27);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (28, '26-Sep-2021', '09-Dec-2018', '03-Nov-2022', 'Pending', 28, 28);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (29, '10-Jun-2021', '18-Nov-2022', '26-May-2018', 'Completed', 29, 29);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (30, '23-Feb-2018', '10-Oct-2021', '29-Dec-2022', 'Completed', 30, 30);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (31, '17-Feb-2020', '07-Nov-2018', '08-Apr-2023', 'Pending', 31, 31);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (32, '31-Jul-2021', '28-Jan-2023', '27-Apr-2022', 'Pending', 32, 32);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (33, '15-Sep-2018', '12-Oct-2017', '13-Nov-2017', 'Completed', 33, 33);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (34, '19-Dec-2017', '26-Sep-2022', '17-May-2018', 'Completed', 34, 34);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (35, '10-Jan-2018', '14-Apr-2020', '24-Oct-2021', 'Completed', 35, 35);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (36, '19-Aug-2017', '27-Mar-2019', '07-Apr-2023', 'Completed', 36, 36);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (37, '30-Mar-2018', '12-Feb-2023', '05-Mar-2022', 'Completed', 37, 37);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (38, '16-Mar-2018', '22-May-2020', '03-Aug-2018', 'Completed', 38, 38);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (39, '17-Oct-2018', '16-Apr-2019', '11-Sep-2021', 'Cancelled', 39, 39);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (40, '17-Jun-2022', '28-Jun-2022', '13-Jan-2023', 'Cancelled', 40, 40);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (41, '20-Nov-2022', '29-Dec-2019', '03-Sep-2020', 'Completed', 41, 41);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (42, '16-Aug-2019', '03-Feb-2021', '03-Feb-2021', 'Pending', 42, 42);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (43, '13-Jun-2022', '13-Aug-2022', '12-May-2020', 'Cancelled', 43, 43);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (44, '17-Sep-2022', '05-Dec-2018', '31-Jan-2019', 'Completed', 44, 44);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (45, '29-Apr-2018', '28-May-2017', '24-Nov-2017', 'Cancelled', 45, 45);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (46, '14-Feb-2022', '24-Feb-2019', '20-Jun-2021', 'Cancelled', 46, 46);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (47, '17-Jul-2018', '26-Jul-2020', '09-Apr-2020', 'Completed', 47, 47);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (48, '28-Sep-2020', '12-Jan-2019', '08-Apr-2022', 'Pending', 48, 48);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (49, '16-May-2022', '29-Sep-2021', '23-Aug-2022', 'Completed', 49, 49);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (50, '26-May-2017', '26-Dec-2022', '10-Jun-2020', 'Cancelled', 50, 50);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (51, '24-Dec-2018', '22-Aug-2022', '31-Dec-2018', 'Completed', 51, 51);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (52, '13-Dec-2017', '24-Dec-2022', '11-Feb-2022', 'Completed', 52, 52);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (53, '30-Oct-2020', '13-Aug-2022', '30-Sep-2018', 'Pending', 53, 53);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (54, '24-Dec-2017', '25-Jul-2022', '15-Aug-2022', 'Cancelled', 54, 54);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (55, '17-May-2018', '30-Dec-2022', '16-Apr-2017', 'Completed', 55, 55);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (56, '06-Nov-2018', '24-Dec-2021', '07-Sep-2018', 'Completed', 56, 56);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (57, '12-Aug-2020', '03-Jun-2020', '03-Feb-2023', 'Pending', 57, 57);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (58, '22-Jun-2018', '20-Feb-2023', '19-Nov-2019', 'Cancelled', 58, 58);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (59, '21-Apr-2021', '31-Dec-2021', '02-Apr-2018', 'Cancelled', 59, 59);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (60, '31-Mar-2023', '05-Jan-2022', '16-Oct-2019', 'Pending', 60, 60);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (61, '14-Mar-2019', '31-Jan-2022', '06-Oct-2019', 'Pending', 61, 61);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (62, '13-Apr-2023', '30-Apr-2019', '11-Jan-2019', 'Completed', 62, 62);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (63, '12-Nov-2022', '22-May-2017', '14-Nov-2020', 'Pending', 63, 63);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (64, '30-May-2018', '15-Apr-2017', '18-Aug-2017', 'Cancelled', 64, 64);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (65, '10-Apr-2022', '27-Feb-2019', '30-Jun-2019', 'Cancelled', 65, 65);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (66, '26-Nov-2019', '28-Feb-2022', '29-Apr-2018', 'Cancelled', 66, 66);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (67, '05-Mar-2019', '27-Nov-2017', '10-Oct-2022', 'Completed', 67, 67);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (68, '15-Jan-2023', '03-May-2017', '14-Dec-2019', 'Pending', 68, 68);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (69, '10-Apr-2019', '01-Dec-2019', '18-Aug-2019', 'Completed', 69, 69);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (70, '03-Feb-2021', '04-Aug-2017', '27-Apr-2019', 'Pending', 70, 70);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (71, '21-Sep-2021', '15-Mar-2018', '13-Feb-2022', 'Completed', 71, 71);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (72, '28-Nov-2019', '01-Dec-2018', '18-Apr-2020', 'Pending', 72, 72);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (73, '04-Jun-2020', '08-Jan-2019', '17-Jun-2018', 'Cancelled', 73, 73);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (74, '19-Feb-2020', '29-May-2021', '28-Oct-2017', 'Cancelled', 74, 74);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (75, '10-Nov-2018', '25-Nov-2018', '08-Jan-2018', 'Pending', 75, 75);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (76, '29-Dec-2022', '23-Feb-2021', '23-Dec-2017', 'Completed', 76, 76);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (77, '25-Jul-2020', '16-Jul-2020', '06-May-2020', 'Pending', 77, 77);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (78, '01-Aug-2019', '15-Nov-2020', '10-Aug-2018', 'Completed', 78, 78);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (79, '25-Mar-2023', '23-Apr-2018', '01-Oct-2019', 'Cancelled', 79, 79);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (80, '26-Mar-2021', '11-Oct-2017', '14-Jul-2022', 'Cancelled', 80, 80);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (81, '20-Nov-2022', '26-Jan-2023', '21-Sep-2020', 'Pending', 81, 81);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (82, '04-Oct-2021', '04-Apr-2020', '12-Jul-2019', 'Completed', 82, 82);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (83, '18-Sep-2022', '11-Mar-2020', '29-Dec-2017', 'Completed', 83, 83);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (84, '21-May-2017', '14-Feb-2021', '29-Jun-2021', 'Completed', 84, 84);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (85, '12-Jun-2020', '22-Nov-2017', '07-Sep-2022', 'Cancelled', 85, 85);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (86, '26-Jul-2017', '08-Feb-2022', '11-Oct-2020', 'Completed', 86, 86);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (87, '28-Apr-2022', '18-Jul-2018', '11-Jun-2021', 'Cancelled', 87, 87);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (88, '19-Oct-2019', '09-Jan-2018', '21-Dec-2018', 'Completed', 88, 88);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (89, '19-Dec-2018', '23-May-2019', '08-Sep-2019', 'Pending', 89, 89);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (90, '11-May-2017', '08-Aug-2019', '13-Jul-2019', 'Completed', 90, 90);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (91, '29-Jun-2020', '05-Nov-2019', '14-Dec-2022', 'Completed', 91, 91);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (92, '21-Jul-2020', '29-May-2018', '28-Dec-2018', 'Cancelled', 92, 92);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (93, '28-Feb-2018', '01-Mar-2019', '24-Aug-2017', 'Pending', 93, 93);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (94, '05-Jun-2018', '26-Sep-2019', '17-Jan-2023', 'Cancelled', 94, 94);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (95, '08-Aug-2022', '31-Mar-2018', '05-Oct-2020', 'Completed', 95, 95);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (96, '21-Oct-2017', '12-Apr-2021', '03-Oct-2020', 'Completed', 96, 96);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (97, '01-Jan-2022', '29-Mar-2018', '15-Apr-2020', 'Pending', 97, 97);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (98, '09-Mar-2021', '25-Jun-2017', '14-Apr-2019', 'Pending', 98, 98);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (99, '13-Apr-2021', '13-Oct-2018', '05-Dec-2021', 'Completed', 99, 99);
insert into rezervácia (rezervácia_id, dátum_vytvorenia_rezervácie, začiatok_prenájmu, koniec_prenájmu, stav_rezervácie, miesto_prenájmu_id , platba_id) values (100, '27-Mar-2020', '29-Feb-2020', '16-Oct-2020', 'Pending', 100, 100);

--TABULKA VOZIDLO
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (1, 'ik371yz', 'Mitsubishi', 'Outlander', 'Crimson', 6, 'http://dummyimage.com/220x100.png/ff4444/ffffff', 1, 1);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (2, 'fk567ri', 'Chevrolet', 'Silverado', 'Green', 2, 'http://dummyimage.com/171x100.png/5fa2dd/ffffff', 2, 2);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (3, 'tf208km', 'Chevrolet', 'Uplander', 'Purple', 3, 'http://dummyimage.com/245x100.png/ff4444/ffffff', 3, 3);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (4, 'xr727dq', 'Hyundai', 'Elantra', 'Mauv', 4, 'http://dummyimage.com/156x100.png/5fa2dd/ffffff', 4, 4);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (5, 'ti817bj', 'Pontiac', 'Montana', 'Red', 3, 'http://dummyimage.com/160x100.png/dddddd/000000', 5, 5);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (6, 'cb606ke', 'Land Rover', 'Discovery Series II', 'Blue', 6, 'http://dummyimage.com/170x100.png/cc0000/ffffff', 6, 6);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (7, 'de392zz', 'Toyota', 'Tacoma', 'Turquoise', 6, 'http://dummyimage.com/101x100.png/dddddd/000000', 7, 7);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (8, 'na085ai', 'Nissan', 'Frontier', 'Pink', 2, 'http://dummyimage.com/119x100.png/dddddd/000000', 8, 8);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (9, 'hg784uc', 'Cadillac', 'SRX', 'Goldenrod', 5, 'http://dummyimage.com/114x100.png/5fa2dd/ffffff', 9, 9);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (10, 'jn633oq', 'Buick', 'LeSabre', 'Teal', 4, 'http://dummyimage.com/138x100.png/5fa2dd/ffffff', 10, 10);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (11, 'kq697wq', 'Maserati', 'Quattroporte', 'Goldenrod', 7, 'http://dummyimage.com/240x100.png/dddddd/000000', 11, 11);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (12, 'rg690ds', 'Honda', 'Fit', 'Maroon', 6, 'http://dummyimage.com/150x100.png/5fa2dd/ffffff', 12, 12);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (13, 'vn942hs', 'Mitsubishi', 'Galant', 'Pink', 2, 'http://dummyimage.com/107x100.png/ff4444/ffffff', 13, 13);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (14, 'tl057uz', 'Geo', 'Prizm', 'Orange', 2, 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', 14, 14);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (15, 'vf177cz', 'BMW', '745', 'Violet', 6, 'http://dummyimage.com/219x100.png/5fa2dd/ffffff', 15, 15);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (16, 'zc601oy', 'Dodge', 'Dakota', 'Goldenrod', 7, 'http://dummyimage.com/132x100.png/cc0000/ffffff', 16, 16);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (17, 'gl069zc', 'Jaguar', 'S-Type', 'Purple', 4, 'http://dummyimage.com/231x100.png/cc0000/ffffff', 17, 17);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (18, 'rn491gg', 'Chevrolet', 'Lumina', 'Yellow', 7, 'http://dummyimage.com/229x100.png/ff4444/ffffff', 18, 18);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (19, 'cn133dj', 'Renault', 'Alliance', 'Red', 6, 'http://dummyimage.com/107x100.png/dddddd/000000', 19, 19);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (20, 'vl839oh', 'BMW', 'Alpina B7', 'Teal', 4, 'http://dummyimage.com/149x100.png/ff4444/ffffff', 20, 20);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (21, 'ke716dg', 'Chevrolet', 'G-Series 1500', 'Pink', 7, 'http://dummyimage.com/228x100.png/dddddd/000000', 21, 21);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (22, 'cn051tu', 'Audi', '5000S', 'Crimson', 4, 'http://dummyimage.com/212x100.png/cc0000/ffffff', 22, 22);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (23, 'wm077vy', 'Jaguar', 'XK Series', 'Turquoise', 4, 'http://dummyimage.com/212x100.png/5fa2dd/ffffff', 23, 23);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (24, 'ki389fv', 'Ford', 'Explorer', 'Khaki', 6, 'http://dummyimage.com/104x100.png/ff4444/ffffff', 24, 24);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (25, 'rp809tg', 'Lotus', 'Elan', 'Aquamarine', 4, 'http://dummyimage.com/204x100.png/5fa2dd/ffffff', 25, 25);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (26, 'cs094bw', 'Kia', 'Sportage', 'Maroon', 7, 'http://dummyimage.com/161x100.png/cc0000/ffffff', 26, 26);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (27, 'ld980ao', 'Porsche', 'Panamera', 'Crimson', 3, 'http://dummyimage.com/214x100.png/cc0000/ffffff', 27, 27);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (28, 'bs266eo', 'Honda', 'Prelude', 'Aquamarine', 7, 'http://dummyimage.com/248x100.png/dddddd/000000', 28, 28);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (29, 'np970jc', 'Volvo', 'C70', 'Turquoise', 7, 'http://dummyimage.com/108x100.png/dddddd/000000', 29, 29);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (30, 'nb480pu', 'Ford', 'F-Series', 'Turquoise', 7, 'http://dummyimage.com/238x100.png/dddddd/000000', 30, 30);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (31, 'nk446oi', 'Mitsubishi', 'Precis', 'Goldenrod', 3, 'http://dummyimage.com/135x100.png/cc0000/ffffff', 31, 31);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (32, 'vg055bq', 'Ford', 'E350', 'Crimson', 6, 'http://dummyimage.com/185x100.png/ff4444/ffffff', 32, 32);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (33, 'ks334ai', 'Audi', 'A8', 'Pink', 7, 'http://dummyimage.com/221x100.png/cc0000/ffffff', 33, 33);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (34, 'mk653gz', 'Pontiac', 'Bonneville', 'Goldenrod', 2, 'http://dummyimage.com/108x100.png/dddddd/000000', 34, 34);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (35, 'wu524hr', 'Nissan', 'Maxima', 'Green', 2, 'http://dummyimage.com/171x100.png/cc0000/ffffff', 35, 35);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (36, 'cu566dy', 'Spyker', 'C8', 'Green', 4, 'http://dummyimage.com/159x100.png/5fa2dd/ffffff', 36, 36);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (37, 'on407yo', 'Toyota', 'Camry', 'Violet', 5, 'http://dummyimage.com/116x100.png/cc0000/ffffff', 37, 37);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (38, 'wh896tb', 'Buick', 'Skylark', 'Puce', 6, 'http://dummyimage.com/203x100.png/dddddd/000000', 38, 38);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (39, 'uo078nz', 'Mercury', 'Sable', 'Crimson', 2, 'http://dummyimage.com/174x100.png/5fa2dd/ffffff', 39, 39);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (40, 'ns065ce', 'Acura', 'NSX', 'Puce', 5, 'http://dummyimage.com/184x100.png/ff4444/ffffff', 40, 40);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (41, 'bz826mc', 'Ford', 'Contour', 'Yellow', 3, 'http://dummyimage.com/185x100.png/5fa2dd/ffffff', 41, 41);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (42, 'ku098xz', 'Oldsmobile', 'Aurora', 'Crimson', 5, 'http://dummyimage.com/150x100.png/dddddd/000000', 42, 42);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (43, 'ni866cl', 'Ford', 'Explorer Sport Trac', 'Yellow', 7, 'http://dummyimage.com/198x100.png/5fa2dd/ffffff', 43, 43);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (44, 'uq640hd', 'Volkswagen', 'Eos', 'Indigo', 4, 'http://dummyimage.com/110x100.png/5fa2dd/ffffff', 44, 44);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (45, 'zu461st', 'Chrysler', 'Sebring', 'Green', 4, 'http://dummyimage.com/189x100.png/ff4444/ffffff', 45, 45);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (46, 'wm486wr', 'Ford', 'LTD Crown Victoria', 'Yellow', 3, 'http://dummyimage.com/189x100.png/cc0000/ffffff', 46, 46);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (47, 'gx763um', 'Ford', 'Taurus', 'Indigo', 2, 'http://dummyimage.com/150x100.png/cc0000/ffffff', 47, 47);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (48, 'kr665di', 'Toyota', 'Venza', 'Aquamarine', 4, 'http://dummyimage.com/162x100.png/5fa2dd/ffffff', 48, 48);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (49, 'wj396lf', 'Volvo', 'C70', 'Orange', 5, 'http://dummyimage.com/124x100.png/cc0000/ffffff', 49, 49);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (50, 'cr139xt', 'Ford', 'Fusion', 'Green', 3, 'http://dummyimage.com/180x100.png/ff4444/ffffff', 50, 50);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (51, 'yc540tm', 'Mercedes-Benz', 'SLS-Class', 'Green', 4, 'http://dummyimage.com/197x100.png/ff4444/ffffff', 51, 51);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (52, 'iv946iy', 'Toyota', 'Prius', 'Red', 5, 'http://dummyimage.com/231x100.png/cc0000/ffffff', 52, 52);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (53, 'jw453ai', 'GMC', 'Sierra 2500', 'Yellow', 6, 'http://dummyimage.com/154x100.png/cc0000/ffffff', 53, 53);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (54, 'eu275oh', 'Chrysler', 'Town & Country', 'Violet', 4, 'http://dummyimage.com/209x100.png/ff4444/ffffff', 54, 54);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (55, 'fg637yy', 'Scion', 'tC', 'Purple', 4, 'http://dummyimage.com/188x100.png/dddddd/000000', 55, 55);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (56, 'us108cq', 'Ford', 'Expedition EL', 'Turquoise', 6, 'http://dummyimage.com/219x100.png/5fa2dd/ffffff', 56, 56);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (57, 'kt771ga', 'Chevrolet', 'Blazer', 'Khaki', 2, 'http://dummyimage.com/242x100.png/cc0000/ffffff', 57, 57);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (58, 'yo664nl', 'Audi', 'S5', 'Khaki', 7, 'http://dummyimage.com/142x100.png/ff4444/ffffff', 58, 58);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (59, 'ge021bn', 'Acura', 'TL', 'Turquoise', 5, 'http://dummyimage.com/143x100.png/cc0000/ffffff', 59, 59);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (60, 'sp165hr', 'Ford', 'Probe', 'Crimson', 3, 'http://dummyimage.com/187x100.png/cc0000/ffffff', 60, 60);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (61, 'ey264fl', 'Jaguar', 'S-Type', 'Green', 7, 'http://dummyimage.com/244x100.png/cc0000/ffffff', 61, 61);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (62, 'ql769kk', 'Dodge', 'Ram 2500 Club', 'Teal', 3, 'http://dummyimage.com/156x100.png/dddddd/000000', 62, 62);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (63, 'jg626gx', 'Subaru', 'Tribeca', 'Mauv', 2, 'http://dummyimage.com/147x100.png/cc0000/ffffff', 63, 63);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (64, 'pl248sw', 'Lexus', 'LS', 'Pink', 2, 'http://dummyimage.com/118x100.png/5fa2dd/ffffff', 64, 64);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (65, 'df954dy', 'Ford', 'Econoline E150', 'Red', 3, 'http://dummyimage.com/223x100.png/ff4444/ffffff', 65, 65);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (66, 'ni451ic', 'Audi', 'A6', 'Khaki', 6, 'http://dummyimage.com/239x100.png/ff4444/ffffff', 66, 66);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (67, 'kp585xv', 'Infiniti', 'IPL G', 'Teal', 7, 'http://dummyimage.com/211x100.png/cc0000/ffffff', 67, 67);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (68, 'bs095cj', 'Mazda', '626', 'Goldenrod', 7, 'http://dummyimage.com/148x100.png/5fa2dd/ffffff', 68, 68);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (69, 'rv399bl', 'Volvo', 'V70', 'Purple', 4, 'http://dummyimage.com/112x100.png/5fa2dd/ffffff', 69, 69);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (70, 'mf434hn', 'Porsche', '928', 'Green', 5, 'http://dummyimage.com/231x100.png/dddddd/000000', 70, 70);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (71, 'ae508ox', 'Ford', 'Mustang', 'Indigo', 2, 'http://dummyimage.com/130x100.png/dddddd/000000', 71, 71);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (72, 'xn992pm', 'Chevrolet', 'Tracker', 'Khaki', 6, 'http://dummyimage.com/176x100.png/cc0000/ffffff', 72, 72);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (73, 'zx377fy', 'Honda', 'Accord', 'Pink', 6, 'http://dummyimage.com/115x100.png/ff4444/ffffff', 73, 73);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (74, 'gc790up', 'Volvo', 'C70', 'Goldenrod', 6, 'http://dummyimage.com/149x100.png/dddddd/000000', 74, 74);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (75, 'iv969qg', 'Lexus', 'ES', 'Maroon', 7, 'http://dummyimage.com/217x100.png/5fa2dd/ffffff', 75, 75);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (76, 'je844hx', 'Lincoln', 'Town Car', 'Goldenrod', 7, 'http://dummyimage.com/211x100.png/ff4444/ffffff', 76, 76);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (77, 'er310nn', 'Jaguar', 'XK Series', 'Teal', 4, 'http://dummyimage.com/169x100.png/5fa2dd/ffffff', 77, 77);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (78, 'qi619xs', 'Honda', 'Fit', 'Orange', 7, 'http://dummyimage.com/250x100.png/ff4444/ffffff', 78, 78);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (79, 'vr579xv', 'Ford', 'F-Series', 'Purple', 6, 'http://dummyimage.com/205x100.png/5fa2dd/ffffff', 79, 79);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (80, 'gg270ll', 'Mercedes-Benz', 'M-Class', 'Teal', 7, 'http://dummyimage.com/240x100.png/cc0000/ffffff', 80, 80);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (81, 'ho577de', 'Eagle', 'Vision', 'Goldenrod', 2, 'http://dummyimage.com/197x100.png/5fa2dd/ffffff', 81, 81);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (82, 'pr669yk', 'GMC', 'Sonoma', 'Purple', 2, 'http://dummyimage.com/240x100.png/cc0000/ffffff', 82, 82);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (83, 'sx904hy', 'Volkswagen', 'Fox', 'Aquamarine', 2, 'http://dummyimage.com/201x100.png/ff4444/ffffff', 83, 83);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (84, 'wn417js', 'Nissan', 'Cube', 'Orange', 5, 'http://dummyimage.com/193x100.png/5fa2dd/ffffff', 84, 84);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (85, 'ji484wn', 'Lamborghini', 'Countach', 'Blue', 6, 'http://dummyimage.com/233x100.png/cc0000/ffffff', 85, 85);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (86, 'ak673ta', 'Bentley', 'Continental GT', 'Teal', 2, 'http://dummyimage.com/182x100.png/dddddd/000000', 86, 86);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (87, 'vi398ma', 'Mercedes-Benz', 'C-Class', 'Crimson', 6, 'http://dummyimage.com/149x100.png/ff4444/ffffff', 87, 87);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (88, 'ke541ux', 'Plymouth', 'Reliant', 'Pink', 3, 'http://dummyimage.com/150x100.png/dddddd/000000', 88, 88);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (89, 'nj127pk', 'Nissan', 'Sentra', 'Red', 6, 'http://dummyimage.com/151x100.png/5fa2dd/ffffff', 89, 89);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (90, 'jz087df', 'Oldsmobile', 'Silhouette', 'Fuscia', 7, 'http://dummyimage.com/170x100.png/5fa2dd/ffffff', 90, 90);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (91, 'zx584mm', 'BMW', '5 Series', 'Yellow', 4, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 91, 91);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (92, 'eg847sc', 'Mercedes-Benz', 'M-Class', 'Blue', 3, 'http://dummyimage.com/165x100.png/5fa2dd/ffffff', 92, 92);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (93, 'lw063nx', 'Toyota', 'Echo', 'Teal', 6, 'http://dummyimage.com/146x100.png/cc0000/ffffff', 93, 93);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (94, 'mj275he', 'Suzuki', 'Daewoo Lacetti', 'Crimson', 3, 'http://dummyimage.com/228x100.png/ff4444/ffffff', 94, 94);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (95, 'ci399xl', 'Pontiac', 'Grand Am', 'Purple', 6, 'http://dummyimage.com/139x100.png/ff4444/ffffff', 95, 95);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (96, 'je947ai', 'Audi', 'S8', 'Goldenrod', 5, 'http://dummyimage.com/106x100.png/dddddd/000000', 96, 96);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (97, 'na918je', 'Infiniti', 'QX', 'Mauv', 3, 'http://dummyimage.com/105x100.png/cc0000/ffffff', 97, 97);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (98, 'yj463nb', 'Mercury', 'Mountaineer', 'Violet', 3, 'http://dummyimage.com/184x100.png/ff4444/ffffff', 98, 98);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (99, 'zw700cz', 'Lotus', 'Elan', 'Turquoise', 2, 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', 99, 99);
insert into vozidlo (vozidlo_id, špz, názov, popis, farba, počet_miest, image, id_kategorie, rezervácia_id) values (100, 'nd009zm', 'Ford', 'Bronco', 'Crimson', 3, 'http://dummyimage.com/109x100.png/5fa2dd/ffffff', 100, 100);

--TABULKA ZAKAZNIK
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (1, '5020853275', null, 'Marty', 'Pittam', 'mpittam0@google.co.jp', '8599381203', 'Trelleborg', 'PO Box 49856', 18229, 1);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (2, '0600826945', 'Dr', 'Annetta', 'Spoole', 'aspoole1@infoseek.co.jp', '5501100031', 'Strachówka', 'Room 200', 21120, 2);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (3, '6311171945', 'Mr', 'Augie', 'Heggadon', 'aheggadon2@github.com', '9063481421', 'Lokokrangan', 'Apt 1527', 56820, 3);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (4, '3402463520', 'Dr', 'Mateo', 'Dundendale', 'mdundendale3@ning.com', '1999545408', 'La Tebaida', 'Apt 653', 23624, 4);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (5, '6416614960', 'Ms', 'Krista', 'Dallewater', 'kdallewater4@dion.ne.jp', '4331449973', 'Pilpichaca', 'Apt 705', 41649, 5);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (6, '0638345235', null, 'Bruis', 'Assel', 'bassel5@wordpress.org', '4124355742', 'Shīnḏanḏ', 'Apt 1979', 18996, 6);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (7, '2036675778', 'Mr', 'Stevie', 'Millimoe', 'smillimoe6@ustream.tv', '6192670015', 'Quebrada de Arena', '8th Floor', 16406, 7);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (8, '4492978690', 'Mr', 'Cari', 'Hanniger', 'channiger7@amazon.com', '9049941328', 'Qo‘qon', '2nd Floor', 70265, 8);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (9, '7195663582', 'Ms', 'Carmelina', 'Gillfillan', 'cgillfillan8@google.com.br', '6336948955', 'Ivanteyevka', 'Apt 497', 54056, 9);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (10, '7329294489', null, 'Barrie', 'Garrat', 'bgarrat9@virginia.edu', '1166607330', 'Joaquín Suárez', 'Room 110', 29093, 10);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (11, '5603474033', 'Dr', 'Joyous', 'Doorey', 'jdooreya@pagesperso-orange.fr', '9201789183', 'Cabrero', 'Apt 1104', 48047, 11);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (12, '1941657524', 'Rev', 'Ira', 'Cloy', 'icloyb@g.co', '4081258079', 'Richky', 'Room 884', 83886, 12);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (13, '8929847897', 'Rev', 'Merrielle', 'Hulbert', 'mhulbertc@rediff.com', '9338961232', 'Huichang', '10th Floor', 54429, 13);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (14, '7842718555', 'Dr', 'Nara', 'Sjostrom', 'nsjostromd@mtv.com', '7889711589', 'Qingshan', 'PO Box 69039', 13265, 14);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (15, '5901177797', null, 'Sabrina', 'Dettmar', 'sdettmare@comcast.net', '1683836887', 'Shimen', 'Apt 1119', 57468, 15);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (16, '9730587892', 'Honorable', 'Peterus', 'Bertolin', 'pbertolinf@cafepress.com', '3185156049', 'Pontevedra', 'Apt 1507', 68697, 16);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (17, '0974679127', 'Dr', 'Page', 'Cowwell', 'pcowwellg@bloglovin.com', '8683224989', 'Pará de Minas', 'Apt 599', 59297, 17);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (18, '9926265677', 'Mrs', 'See', 'Vickars', 'svickarsh@devhub.com', '4996524088', 'Netvořice', 'PO Box 61844', 32157, 18);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (19, '5561045083', 'Mr', 'Arlina', 'Commin', 'acommini@livejournal.com', '5943978900', 'Kabanga', '12th Floor', 19635, 19);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (20, '4544361745', 'Dr', 'Prescott', 'McCathy', 'pmccathyj@toplist.cz', '5877982886', 'Kālābāgh', 'Apt 1965', 10420, 20);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (21, '2655232070', 'Mrs', 'Lexie', 'O''Lennachain', 'lolennachaink@edublogs.org', '8989697092', 'Dongyuan', 'PO Box 71634', 94084, 21);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (22, '1665641223', null, 'Marguerite', 'Gland', 'mglandl@t.co', '9633798175', 'Amuru', 'Apt 1778', 27131, 22);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (23, '7736734445', 'Mrs', 'Sigrid', 'Cumbridge', 'scumbridgem@cdbaby.com', '6901295514', 'Xinghe Chengguanzhen', 'PO Box 30554', 78438, 23);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (24, '7356963434', null, 'Amandi', 'Ravilious', 'araviliousn@blogspot.com', '9883523234', 'Lawonda', 'Apt 521', 84941, 24);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (25, '0407123563', 'Ms', 'Donni', 'Trahar', 'dtraharo@businesswire.com', '5203268733', 'Rongcheng', 'Suite 1', 78165, 25);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (26, '2438041943', 'Rev', 'Betty', 'Aberkirder', 'baberkirderp@naver.com', '7445490407', 'Jaroměřice', '19th Floor', 81003, 26);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (27, '2931192341', 'Mrs', 'Innis', 'Mitrovic', 'imitrovicq@friendfeed.com', '4562364044', 'Ashgabat', 'Suite 94', 86574, 27);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (28, '1629365688', 'Dr', 'Consuelo', 'Roly', 'crolyr@bigcartel.com', '2679821485', 'Taimaman', 'Apt 1657', 52792, 28);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (29, '1538342073', 'Ms', 'Ali', 'Spatari', 'aspataris@home.pl', '6447296002', 'Jianchang', '13th Floor', 11472, 29);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (30, '6673071389', null, 'Sherilyn', 'Moyles', 'smoylest@omniture.com', '3313553428', 'Rizó', '12th Floor', 15163, 30);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (31, '6871768556', null, 'Patrizia', 'Gullivent', 'pgulliventu@tmall.com', '7527363145', 'Mogapi', '19th Floor', 75535, 31);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (32, '3591691593', 'Mr', 'Keen', 'Luten', 'klutenv@timesonline.co.uk', '2676817617', 'Panguna', 'Suite 39', 40859, 32);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (33, '5101250325', 'Honorable', 'Marena', 'Hickinbottom', 'mhickinbottomw@weebly.com', '5827828146', 'Famaillá', 'Room 1565', 17921, 33);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (34, '3504422084', 'Rev', 'Faustine', 'Lade', 'fladex@last.fm', '9756357219', 'Gongqiao', 'PO Box 89275', 14082, 34);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (35, '9476881682', 'Mrs', 'Katrina', 'Admans', 'kadmansy@163.com', '4271751543', 'Dalovice', 'Apt 1276', 13979, 35);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (36, '6532262161', 'Mrs', 'Leoine', 'Organer', 'lorganerz@ucoz.com', '5374622964', 'Épinal', 'Apt 167', 23827, 36);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (37, '4856177230', null, 'Andy', 'Northin', 'anorthin10@illinois.edu', '4482059859', 'Akhfennir', 'Apt 898', 94423, 37);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (38, '6472046425', 'Dr', 'Dickie', 'Klaesson', 'dklaesson11@loc.gov', '6276989523', 'Wuhu', '3rd Floor', 17343, 38);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (39, '3754373285', 'Ms', 'Alanna', 'Braunthal', 'abraunthal12@engadget.com', '9434859162', 'Wohyń', 'PO Box 81390', 70310, 39);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (40, '3588911146', 'Ms', 'Curtis', 'Sollowaye', 'csollowaye13@github.io', '6766696191', 'Fayaoué', '15th Floor', 79619, 40);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (41, '2011319749', null, 'Glenna', 'Olivo', 'golivo14@51.la', '2618965114', 'Salamá', 'Room 193', 88147, 41);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (42, '5770754508', 'Ms', 'Corri', 'Braben', 'cbraben15@free.fr', '1089993404', 'Haukivuori', 'Suite 85', 61704, 42);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (43, '2386055183', 'Rev', 'Donnie', 'Molineux', 'dmolineux16@meetup.com', '5196503078', 'Chor', 'Apt 120', 91016, 43);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (44, '5376191958', 'Dr', 'Ivory', 'Opfer', 'iopfer17@ucla.edu', '2681060118', 'Nanhuatang', 'Suite 87', 91002, 44);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (45, '1751764273', null, 'Goldy', 'De Lacey', 'gdelacey18@godaddy.com', '3198436342', 'Cumanayagua', 'Apt 1236', 44392, 45);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (46, '9800425829', 'Mr', 'Kenna', 'Chrichton', 'kchrichton19@storify.com', '2217881620', 'Divichibazar', 'Room 1766', 41568, 46);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (47, '2322954330', 'Honorable', 'Rhetta', 'Orbine', 'rorbine1a@samsung.com', '1939185880', 'Wenbi', '4th Floor', 47617, 47);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (48, '0269540466', 'Dr', 'Barbaraanne', 'Bettam', 'bbettam1b@cnbc.com', '2935900309', 'Zheleznodorozhnyy', '5th Floor', 45582, 48);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (49, '5132057462', 'Rev', 'Kinna', 'Walne', 'kwalne1c@taobao.com', '9689365410', 'Chybie', 'PO Box 96242', 21246, 49);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (50, '1416053867', 'Mr', 'Guy', 'Heffer', 'gheffer1d@sbwire.com', '4523180250', 'Guanba', 'Apt 1697', 47417, 50);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (51, '7643791422', null, 'Xymenes', 'Tume', 'xtume1e@cafepress.com', '2489643329', 'Heby', 'Suite 96', 76789, 51);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (52, '6236375712', null, 'Parker', 'Commin', 'pcommin1f@wikia.com', '1083863613', 'Paris 02', 'Room 323', 30002, 52);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (53, '1213922364', null, 'Gabriel', 'Lawly', 'glawly1g@samsung.com', '9727833382', 'Keboireng', 'Apt 59', 96422, 53);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (54, '3064593285', 'Mr', 'Wallie', 'Hymor', 'whymor1h@sakura.ne.jp', '6325928101', 'Arbaoua', 'PO Box 65964', 54869, 54);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (55, '5609178940', null, 'Domenico', 'Coleson', 'dcoleson1i@pcworld.com', '6927552306', 'Krinichnaya', 'Apt 1626', 19733, 55);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (56, '2843314801', null, 'Evaleen', 'Thaxter', 'ethaxter1j@yale.edu', '2234306050', 'Vnorovy', 'Apt 2000', 26837, 56);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (57, '7801445074', null, 'Babette', 'Alsford', 'balsford1k@un.org', '3128795623', 'Dongxing', 'Suite 9', 66114, 57);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (58, '2553237278', null, 'Duffie', 'Fido', 'dfido1l@comcast.net', '5265178561', 'Sao Hai', 'Suite 59', 97821, 58);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (59, '6843757995', null, 'Mabelle', 'Maggiori', 'mmaggiori1m@mashable.com', '7888154911', 'Kibonsod', 'Room 273', 14149, 59);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (60, '5520195560', null, 'Goddard', 'Cushelly', 'gcushelly1n@theguardian.com', '3936626890', 'Tukan', 'PO Box 11308', 76201, 60);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (61, '3542728101', 'Mr', 'Nicolis', 'Stolze', 'nstolze1o@sfgate.com', '8127485584', 'Jangheung', '10th Floor', 12544, 61);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (62, '3423849762', 'Dr', 'Larina', 'Chartman', 'lchartman1p@ibm.com', '7835375828', 'Komorní Lhotka', 'PO Box 21858', 68945, 62);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (63, '4269596929', null, 'Clari', 'Lamonby', 'clamonby1q@gnu.org', '8539639549', 'Maracás', 'Apt 210', 82730, 63);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (64, '2964848297', 'Mrs', 'Silvain', 'Tuson', 'stuson1r@hc360.com', '6779732835', 'Denyshi', 'PO Box 72452', 80086, 64);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (65, '3374298621', null, 'Riannon', 'Mylan', 'rmylan1s@facebook.com', '7819876378', 'Nakusp', 'Room 1181', 60556, 65);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (66, '5631418282', null, 'Rafe', 'Fidoe', 'rfidoe1t@ovh.net', '9605255610', 'Jiaokui', 'Suite 10', 19345, 66);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (67, '7515382872', null, 'Marya', 'Bischop', 'mbischop1u@google.ru', '9732586711', 'Markovo', 'Room 864', 64129, 67);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (68, '4724212608', 'Ms', 'Grata', 'Stihl', 'gstihl1v@ca.gov', '7386976089', 'Yanguan', 'Suite 73', 86370, 68);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (69, '5268636529', 'Mrs', 'Julianna', 'Geekie', 'jgeekie1w@ebay.com', '3488974639', 'Harstad', 'Apt 917', 39263, 69);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (70, '6334403524', null, 'Vina', 'Schult', 'vschult1x@instagram.com', '7261843540', 'Caicun', 'Room 1639', 94744, 70);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (71, '2036646123', 'Dr', 'Herby', 'Fort', 'hfort1y@who.int', '3529033010', 'Kawambwa', 'Room 883', 95677, 71);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (72, '9679888649', 'Rev', 'Montgomery', 'Rawlings', 'mrawlings1z@reverbnation.com', '3488811463', 'Macayug', 'PO Box 80279', 90913, 72);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (73, '9077077170', 'Honorable', 'Ameline', 'Harold', 'aharold20@ca.gov', '6268050793', 'Yanjiang', 'PO Box 73763', 58200, 73);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (74, '5945814121', 'Ms', 'Ingeborg', 'Cadge', 'icadge21@about.me', '6154215760', 'Salinggara', '7th Floor', 62049, 74);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (75, '4141515191', 'Rev', 'Jourdain', 'Oldershaw', 'joldershaw22@photobucket.com', '9138315505', 'Kansas City', 'Suite 65', 46212, 75);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (76, '8752932575', 'Mr', 'Godfree', 'Ovenell', 'govenell23@goo.ne.jp', '9435625842', 'Hevlín', 'PO Box 28608', 27386, 76);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (77, '1723022764', 'Dr', 'Corbin', 'Coggell', 'ccoggell24@salon.com', '1655759001', 'Lanxi', 'Room 642', 14918, 77);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (78, '1957988045', 'Dr', 'Sandie', 'Sibbit', 'ssibbit25@weebly.com', '5609469646', 'Saint Petersburg', 'Apt 1114', 33550, 78);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (79, '7300822517', 'Mr', 'Estrella', 'Pitherick', 'epitherick26@ucoz.ru', '4244737351', 'Summerside', 'Suite 93', 58189, 79);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (80, '9633165237', 'Rev', 'Ardis', 'Pieracci', 'apieracci27@fda.gov', '8534579374', 'Quma', 'Suite 40', 69944, 80);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (81, '5823182120', 'Honorable', 'Zaneta', 'Gerlack', 'zgerlack28@ezinearticles.com', '1541685567', 'Rotterdam', 'Room 366', 12445, 81);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (82, '6875226324', 'Dr', 'Torie', 'Rable', 'trable29@artisteer.com', '5011598023', 'Zhexiao', '10th Floor', 30722, 82);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (83, '1265765642', null, 'Holmes', 'Logsdale', 'hlogsdale2a@time.com', '4737005604', 'Diawara', 'Room 122', 87792, 83);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (84, '5717880480', null, 'Lusa', 'Pitfield', 'lpitfield2b@dailymail.co.uk', '4842701700', 'Reading', 'PO Box 91213', 48579, 84);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (85, '3716170062', 'Dr', 'Sandor', 'Brownsell', 'sbrownsell2c@plala.or.jp', '6997076517', 'Dakhla', 'Suite 4', 33651, 85);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (86, '9879297571', 'Dr', 'Diane', 'Ruggs', 'druggs2d@behance.net', '5851047613', 'Dengmingsi', 'Apt 1311', 88533, 86);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (87, '0696974517', null, 'Evy', 'Piotrowski', 'epiotrowski2e@stanford.edu', '6479919735', 'Shuanglu', 'PO Box 96616', 94366, 87);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (88, '5202393628', 'Ms', 'Kellyann', 'Hardin', 'khardin2f@zimbio.com', '4178922981', 'Cisoka', 'Suite 98', 55001, 88);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (89, '2794857967', 'Dr', 'Gwenneth', 'Josephoff', 'gjosephoff2g@livejournal.com', '2798569599', 'Jiḩānah', 'Room 1709', 64858, 89);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (90, '9317036074', 'Ms', 'Gunner', 'Elger', 'gelger2h@sciencedaily.com', '5594554963', 'Tim', 'Room 373', 86030, 90);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (91, '9125489798', 'Dr', 'Emili', 'Crut', 'ecrut2i@boston.com', '2093387704', 'Chrysó', '2nd Floor', 10453, 91);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (92, '3743935007', null, 'Donella', 'Tingcomb', 'dtingcomb2j@gravatar.com', '6371071979', 'Oroquieta', 'Room 63', 74264, 92);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (93, '3085109234', 'Mr', 'Georgia', 'Needs', 'gneeds2k@cmu.edu', '2095955052', 'Jiji', 'Room 49', 60666, 93);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (94, '3243114071', 'Honorable', 'Konstantine', 'Buglass', 'kbuglass2l@berkeley.edu', '7144680883', 'Donskoy', '12th Floor', 42694, 94);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (95, '6902945713', 'Honorable', 'Gilbertine', 'Bridywater', 'gbridywater2m@tumblr.com', '8361046558', 'Dongen', '19th Floor', 57895, 95);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (96, '3649738643', null, 'Ashien', 'Shepley', 'ashepley2n@ox.ac.uk', '8315194556', 'Sanok', 'PO Box 40283', 12391, 96);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (97, '5294698935', 'Mrs', 'Humbert', 'Moorey', 'hmoorey2o@slate.com', '8792590431', 'Atamanovka', 'Suite 6', 42885, 97);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (98, '5488886648', 'Ms', 'Renee', 'Le - Count', 'rlecount2p@creativecommons.org', '2667633227', 'Bogandinskiy', 'Room 450', 76256, 98);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (99, '5842063840', 'Honorable', 'Javier', 'Sudlow', 'jsudlow2q@hc360.com', '4633716847', 'Babica', 'Suite 41', 42779, 99);
insert into zákazník (zakazník_id, vodičský_preukaz_čislo, titul, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id) values (100, '1922716472', 'Mr', 'Seana', 'Malicki', 'smalicki2r@xrea.com', '5559284305', 'Papeete', 'PO Box 97851', 31142, 100);


--FUNKCIA = pocet_vozidiel_v_kategorii:
--Funkcií dáme vstupny parameter jednu lubovnolnú kategoriu vozidla napr. suv a funkcia prejde všetky riadky z tabulky a vráti počet daných aut ktoré patri do zvolenej kategórie. Vo funkcii si definujeme premenné používame cyklus a kurzor. 

CREATE OR REPLACE FUNCTION pocet_vozidiel_v_kategorii(p_typ_vozidla IN VARCHAR2) -- Vytvorenie funkcie pocet_vozidiel_v_kategorii, zadavame vstupny parameter VARCHAR2 typ kategorie
  RETURN INTEGER -- Vracia INTEGER, kolko aut je v danej kategorii
IS
   pocet INTEGER := 0; -- deklaruje sa premenna pocet a inicializuje sa na 0
  CURSOR kurzor_vozidla IS -- Kurzor s názvom "kurzor_vozidla"
     SELECT v.vozidlo_id, k.id_kategorie, k.typ_vozidla -- definuje sa kurzor s SQL parametrami
  	 FROM vozidlo v
  	 JOIN kategória k ON v.id_kategorie = k.id_kategorie 
  	 WHERE k.typ_vozidla = p_typ_vozidla;
BEGIN
  FOR p_vozidlo IN kurzor_vozidla LOOP -- začiatok cyklu 
    pocet := pocet + 1; -- incrementuje sa hodnota počitadla
  END LOOP; -- koniec cyklu
  RETURN pocet; -- vrátenie hodnoty 
END; -- skončenie funkcie


--PROCEDÚRA = spravene_rezervacie:
--Zoznam všetkých rezervácií, ktoré majú stav rezervácie "Completed". Následne nám procedúra pomocou DBMS_output.put_line vypíše v riadku ID rezervácie, ID Miesto rezervácie, Začiatok rezervácie a skončenie rezervácie. V procedúre si definujeme 4 premenné, používame explicitný kurzor s SQL parametrami, a cyklus pre prechadzanie údajov v tabulke.
CREATE OR REPLACE PROCEDURE UF.spravene_rezervacie IS --Vytvorenie procedúry s názvom "spravene_rezervácie"
  r_rezervácia_id rezervácia.rezervácia_id%TYPE; -- Definovanie premenných 
  r_miesto_prenájmu_id rezervácia.miesto_prenájmu_id%TYPE;
  r_začiatok_prenájmu rezervácia.začiatok_prenájmu%TYPE;
  r_koniec_prenájmu rezervácia.koniec_prenájmu%TYPE;
  
  CURSOR rezervacia_kurzor IS -- Explicitný kurzor s názvom "rezervacia_kurzor"
    SELECT DISTINCT rezervácia_id, miesto_prenájmu_id, začiatok_prenájmu, koniec_prenájmu -- Vybratie stlpcov
    FROM rezervácia r -- Z tabulky rezervácia
    WHERE stav_rezervácie = 'Completed'; -- Vybratie iba stlpcov kde stav je "Completed"
BEGIN -- Začiatok
  OPEN rezervacia_kurzor; -- Otvorenie kurzora
  LOOP -- Cyklus
    FETCH rezervacia_kurzor INTO r_rezervácia_id, r_miesto_prenájmu_id, r_začiatok_prenájmu, r_koniec_prenájmu;
    EXIT WHEN rezervacia_kurzor%NOTFOUND; -- Ukážeme cyklu, kedy sa má zastaviť
    -- Ak by kurzor prešiel celú tabuľku a už by nebol ďalší riadok, tak výraz "rezervacia_kurzor%NOTFOUND" bude mať hodnotu TRUE a cyklus sa ukončí
    DBMS_OUTPUT.PUT_LINE('ID Rezervácie: ' || r_rezervácia_id || ', ID Miesto Rezervácie: ' || r_miesto_prenájmu_id || ', Začiatok rezervácie: ' || r_začiatok_prenájmu || ', Skončenie rezervácie: ' || r_koniec_prenájmu); -- Vypíšeme na obrazovku hodnoty premenných aktuálneho riadku kurzora
  END LOOP; -- Ukončenie cyklu
  
  CLOSE rezervacia_kurzor; -- Zatvorenie kurzora
END; -- Ukončenie precedúry

---Otestovanie procedúry
BEGIN
  spravene_rezervacie;
END;


--TRIGGER:
--Trigger na ošetrenie minimálnej vysky platby
CREATE OR REPLACE TRIGGER UF.minimalna_vyska_sumy --Vytvorenie triggeru s názvom "minimalna_vyska_sumy"
BEFORE INSERT ON platba -- Trigger sa spustí pred vložením údajov do tabulky platba 
FOR EACH ROW
BEGIN -- Začiatok
  IF :new.celková_suma <= 0 THEN -- Podmienka, Ak nová hodnota v stlpci bude menšia alebo rovná 0, spustí sa kód
    RAISE_APPLICATION_ERROR(-20001, 'Celková suma musí byť kladné číslo.'); -- Chybová hláška a pokus o vloženie údajov bude zamietnutý
  END IF; - Ukončenie IF statmentu
END; -- Ukončenie triggeru

--PLÁNOVAČ:
--Každí den o 12 hod. spustí 1x vytvorenú procedúru "spravené rezervácie". 
BEGIN -- Začiatok bloku PL/SQL programu
DBMS_SCHEDULER.CREATE_JOB(
job_name => 'spravene_rezervacie_job', -- Vytvorenie nového jobu s názvom "spravene_rezervacie_job"
job_type => 'STORED_PROCEDURE', 
job_action => 'spravene_rezervacie', -- spustenie procedúry "spravene_rezervácie"
start_date => SYSTIMESTAMP, -- Den štartu
repeat_interval => 'FREQ=DAILY;BYHOUR=12;BYMINUTE=0;BYSECOND=0', -- Interval opakovania na každý den o 12 hod.
comments => 'denne o 12 hod', -- Komentár
enabled => TRUE); -- Zapnutie úlohy
END; -- Koniec bloku PL/SQL programu

--2.
BEGIN -- Začiatok bloku PL/SQL programu
DBMS_SCHEDULER.CREATE_SCHEDULE(
schedule_name => 'spravene_rezervacie_scheldure', -- Vytvorenie nového plánu s názvom "spravene_rezervacie_scheldure"
repeat_interval => 'FREQ=DAILY;BYHOUR=12;BYMINUTE=0;BYSECOND=0', -- Interval opakovania na každý den o 12 hod.
comments => 'denne o 12 hod'); -- Komentár
END; -- Koniec bloku PL/SQL programu

--TABULKA PRIKAZOV:
--1a 
SELECT COUNT(*) FROM vozidlo; -- Spočítanie vozidiel

-- 1a 
SELECT SUM(cena_za_den) FROM kategória; --Spraví súčet cien za den k daným kategoriám

--1a 
SELECT MIN(cena_za_den) FROM kategória; -- Najdenie najmenšej ceny za den

--1a 
SELECT MAX(cena_za_den) FROM kategória; -- Najdenie najvacšej ceny za den

--1a 
SELECT AVG(celková_suma) FROM platba; -- Najdenie priermernej ceny za den

--1b 
SELECT id_kategorie, COUNT(*) as total_vehicles FROM vozidlo GROUP BY id_kategorie HAVING COUNT(*) < 5; -- Vracia počet vozidiel kde ich je menej ako 5

--2a 
SELECT miesto_prenájmu_id, COUNT(*) as total_reservations FROM rezervácia WHERE MIESTO_PRENÁJMU_ID > 5 GROUP BY miesto_prenájmu_id HAVING COUNT(*) < 5 ORDER BY total_reservations DESC; -- Vybratie všetkych miest na rezerváciu ktoré maju viac ako 5 rezervácií a ID je viac ako 5

--3a 
SELECT mesto FROM miesto UNION SELECT mesto FROM zákazník; -- Zlučenie 2 tabuliek mesto a miesto

--3b 
SELECT mesto FROM miesto MINUS SELECT mesto FROM zákazník; -- Prienik 2 tabuliek mesto a miesto

--3c 
SELECT mesto FROM MIESTO m INTERSECT SELECT mesto FROM ZÁKAZNÍK; -- Vybratie iba tych miest ktoré sa nachadzajú aj v tabulke mesto a miesto

--4a

-- Všetky záznamy z tabuľky rezerváci a vybratie všetkych záznomov, ktoré majú mesto začínajúce na písmeno "B"
SELECT *
FROM rezervácia
WHERE miesto_prenájmu_id IN (
  SELECT miesto_prenájmu_id
  FROM miesto
  WHERE mesto
  LIKE 'B%'
);


--4b
-- Všetky záznamy z tabuľky vozidlo  a vybratie všetkych záznomov, ktoré majú typ vozidla sedan
SELECT *
FROM vozidlo
WHERE id_kategorie IN (
  SELECT id_kategorie
  FROM kategória
  WHERE typ_vozidla = 'sedan'
);


--4c
-- Všetky záznamy z tabuľky rezervácia  a vybratie všetkych záznomov, kde mesto začína písmenom "A"
SELECT *
FROM rezervácia
WHERE miesto_prenájmu_id IN (
  SELECT miesto_prenájmu_id
  FROM miesto
  WHERE MESTO LIKE 'A%'
);

--4d
-- Všetky záznamy z tabuľky vozidlo kde rezervácia je "Completed"
SELECT *
FROM vozidlo v
WHERE EXISTS (
  SELECT *
  FROM rezervácia r
  WHERE r.rezervácia_id = v.vozidlo_id
  AND r.stav_rezervácie = 'Completed'
);

--4d
--Všetky záznamy z tabuľky kategória a vozidlo a vybratie či existuje aspon jednom vozidlo ktoré ma pocet miest < 5
SELECT *
FROM kategória k
WHERE NOT EXISTS (
  SELECT *
  FROM vozidlo v
  WHERE v.id_kategorie = k.id_kategorie
  AND v.počet_miest < 5
);

--5a
-- Zobrazenie typ vozidla, nazov a pocet miest
SELECT 
  k.typ_vozidla, 
  v.názov, 
  COUNT(v.vozidlo_id) OVER (PARTITION BY v.id_kategorie ORDER BY v.názov) AS pocet_vozidiel 
FROM 
  kategória k 
  JOIN vozidlo v ON k.id_kategorie = v.id_kategorie;

--5b
-- Vráti počet výskytov typu pozidla
SELECT DISTINCT typ_vozidla, COUNT(*) OVER (PARTITION BY typ_vozidla) AS pocet
FROM kategória;

--6a
SELECT rezervácia_id, začiatok_prenájmu, ADD_MONTHS(začiatok_prenájmu, 3) AS koniec_prenájmu
FROM rezervácia;

--6a
SELECT rezervácia_id, MONTHS_BETWEEN(koniec_prenájmu, začiatok_prenájmu) AS pocet_mesiacov
FROM rezervácia;

--6b
SELECT rezervácia_id, TO_CHAR(začiatok_prenájmu, 'DD/MM/YYYY') AS začiatok, TO_CHAR(koniec_prenájmu, 'DD/MM/YYYY') AS koniec
FROM rezervácia;

--6b
SELECT TO_DATE('21-APR-2023', 'DD-MON-YYYY') AS datum FROM dual;

--7a
-- Zobrazí namiesto null - "Nezadany titul" v tabulke zakaznik
SELECT NVL(titul, 'Nezadaný titul') AS titul
FROM zákazník;

--8a
--Zoradí zakazníkov v tabulke pomocou funkcie 
SELECT 
  ZAKAZNÍK_ID, 
  meno, 
  priezvisko, 
  mesto, 
  RANK() OVER(ORDER BY mesto DESC) as poradie_zoradenia
FROM 
  zákazník;

--8b
-- Použitie funkcie row number na očislovanie riadkov
SELECT ROW_NUMBER() OVER (ORDER BY cena_za_den DESC) AS poradie, typ_vozidla, cena_za_den
FROM kategória;

--9a
--Zmenší text priezviska z tabulky zakaznik
SELECT LOWER(priezvisko)
FROM ZÁKAZNÍK z ;

--9b
-- Zaokruhli cenu v stlpci cena za den v tabulke kategoria
SELECT ROUND(cena_za_den * 1.2, 2) AS cena_s_dph
FROM kategória;

--9c
-- Spojenie stlpcov mesto a cena za den z tabulky miesto a kategoria
SELECT DISTINCT UPPER(mesto) || ' (' || ROUND(cena_za_den, 2) || '€)' AS vysledok
FROM miesto, kategória;

--10a
-- Spojenie tabuliek vozidlo a kategoria pomocou JOIN
SELECT *
FROM vozidlo
JOIN kategória ON vozidlo.id_kategorie = kategória.id_kategorie;

--11a
-- Zobrazenie všetkych zakazníkov ktorí nežijú v Trnave 
SELECT *
FROM ZÁKAZNÍK z 
WHERE mesto NOT IN ('Trnava');

--12a
-- Zobrazenie záznamu kde ID = 2 z tabulky rezervácia
SELECT *
FROM rezervácia
WHERE miesto_prenájmu_id = 2;

--13a
-- Spojenie tabuliek vozidlo a kategoria pomocou JOIN
SELECT *
FROM vozidlo v
JOIN kategória k ON v.id_kategorie = k.id_kategorie;

--13b
-- Spojenie tabuliek kategoria a vozidlo pomocou natural join
SELECT *
FROM kategória
NATURAL JOIN vozidlo;

--13b
-- Spojenie tabuliek kategoria a vozidlo pomocou JOIN s USING 
SELECT *
FROM kategória
JOIN vozidlo USING (id_kategorie);

--13c
-- Spojenia tabuliek miesto a rezervácia pomocou LEFT JOIN
SELECT *
FROM miesto
LEFT JOIN rezervácia ON miesto.miesto_prenájmu_id = rezervácia.miesto_prenájmu_id;

--13c
-- Spojenie tabuliek mesto a rezervácia pomocou right outer join
SELECT *
FROM miesto
RIGHT OUTER JOIN rezervácia
ON miesto.miesto_prenájmu_id = rezervácia.miesto_prenájmu_id;

--13d
-- Spojenie tabuliek mesto a rezervácia pomocou full outer join
SELECT *
FROM vozidlo
FULL OUTER JOIN rezervácia
ON vozidlo.rezervácia_id = rezervácia.rezervácia_id;

--14a
-- Spojenie 2 tabuliek vozidlo, kategoria, rezervácia
SELECT *
FROM vozidlo v
JOIN kategória k ON v.id_kategorie = k.id_kategorie
JOIN rezervácia r ON v.rezervácia_id = r.rezervácia_id;

--15a
-- Vytvorenie pohladu 
CREATE VIEW pohlad_zakaznikov AS
SELECT z.zakazník_id, z.meno, z.priezvisko, r.začiatok_prenájmu, r.koniec_prenájmu, v.názov, k.typ_vozidla
FROM zákazník z
LEFT 
JOIN platba p ON z.kartové_údaje_id = p.PLATBA_ID 
LEFT JOIN rezervácia r ON p.platba_id = r.platba_id
LEFT JOIN vozidlo v ON r.rezervácia_id = v.rezervácia_id
LEFT JOIN kategória k ON v.id_kategorie = k.id_kategorie;

--16a
--Zobrazezie zakaznikov ktorí maju aspon jednu rezerváciu 
SELECT p.zakazník_id, p.meno, p.priezvisko, COUNT(*) AS pocet_prenajmov
FROM pohlad_zakaznikov p
GROUP BY p.zakazník_id, p.meno, p.priezvisko
HAVING COUNT(*) >= 1;

--17a
--Vloženie záznamu do tabulky zakazník
INSERT INTO zákazník (ZAKAZNÍK_ID,vodičský_preukaz_čislo, meno, priezvisko, email, tel_cislo, mesto, ulica_a_c_domu, psč, kartové_údaje_id)
VALUES (101, '1234567890', 'Mária', 'Nováková', 'maria.novakova@email.com', '0911122333', 'Bratislava', 'Hlavná 1', 81101,
  (SELECT kartové_údaje_id FROM kartové_údaje WHERE číslo_karty = 3569952900181271));

--18a
-- Aktualizácia záznamu v tabulke kategoria
UPDATE kategória 
SET cena_za_den = (
  SELECT počet_miest
  FROM vozidlo
  WHERE kategória.id_kategorie = vozidlo.vozidlo_id
) * 1.1
WHERE kategória.TYP_VOZIDLA = 'luxury'

--19a
-- Vymazanie záznamu v tabulke vozidlo 
DELETE FROM vozidlo
WHERE id_kategorie = (
  SELECT id_kategorie
  FROM kategória
  WHERE typ_vozidla = 'sedan'
) AND rezervácia_id IS NULL;