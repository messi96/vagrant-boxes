create user test identified by test;
grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK,
CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM,
CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE,
CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE 
to test;

CONNECT test/test;

DROP TABLE users;

CREATE TABLE users (
    id number,
    name varchar(500),
    surname varchar(1000),
    dob date,
    credit_card varchar(32),
    cvv number
);

INSERT INTO users (id, name, surname) VALUES (1, 'luther', 'blisset');
INSERT INTO users (id, name, surname) VALUES (2, 'fluffy', 'bunny');
INSERT INTO users (id, name, surname) VALUES (3, 'wu', 'ming');
INSERT INTO users (id, name, surname) VALUES (4, 'sqlmap/1.0-dev (http://sqlmap.org)', 'user agent header');
INSERT INTO users (id, name, surname) VALUES (5, NULL, 'nameisnull');
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (6, 'Cristina', 'Jensen', '31-Jul-1947', '3740 8803 2906 433', 368);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (7, 'Brandi', 'Richardson', '06-Aug-1972', '5388 8850 8269 0335', 509);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (8, 'Jan', 'Patton', '13-Nov-1963', '4539 9992 8367 4419', 934);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (9, 'Sammy', 'Figueroa', '01-Oct-1967', '3718 4993 5037 045', 521);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (10, 'Silvia', 'Banks', '12-Jan-1965', '5122 4580 6887 1450', 904);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (11, 'Doris', 'Gibson', '17-Jul-1952', '3706 8236 1713 305', 981);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (12, 'Ellen', 'Bridges', '01-May-1971', '5316 5380 9831 3346', 934);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (13, 'Matt', 'Tran', '23-Feb-1962', '5297 7526 9706 4290', 397);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (14, 'Marvin', 'Cooper', '04-Dec-1970', '4716 2005 7104 1618', 411);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (15, 'Javier', 'Schmidt', '05-Nov-1949', '4716 2369 9892 6387', 287);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (16, 'Eugene', 'Vargas', '10-Sep-1979', '4485 5662 6661 9754', 898);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (17, 'Rolando', 'Hall', '28-Sep-1961', '5376 6231 5647 9846', 515);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (18, 'Lydia', 'Mills', '09-Dec-1945', '3478 9567 6703 247', 797);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (19, 'Marcos', 'Nguyen', '03-Jan-1964', '3734 7719 4726 856', 659);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (20, 'Van', 'Mclaughlin', '04-Dec-1948', '5417 2077 8003 0786', 841);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (21, 'Carla', 'Sanders', '03-Apr-1976', '3711 7066 7098 711', 660);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (22, 'Loretta', 'Phelps', '21-Jun-1956', '4532 0371 0530 0496', 352);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (23, 'Marshall', 'Guzman', '11-Aug-1970', '3497 7054 3603 516', 313);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (24, 'Sherri', 'Coleman', '05-Jan-1963', '3750 8429 4780 920', 664);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (25, 'Frankie', 'Fletcher', '04-Nov-1967', '4716 1101 4348 3976', 707);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (26, 'Willie', 'Bennett', '18-Sep-1973', '3432 0136 3094 426', 748);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (27, 'Tony', 'Mendoza', '14-Jan-1971', '5403 5315 7516 8535', 441);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (28, 'Vincent', 'Mcdaniel', '08-Jul-1968', '3458 1736 6941 970', 535);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (29, 'Jamie', 'Carroll', '04-Sep-1953', '3451 6715 3790 911', 957);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (30, 'Rafael', 'Hunt', '08-Mar-1952', '4024 0071 1749 3105', 303);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (31, 'Ramiro', 'Malone', '18-Apr-1979', '5585 2914 1067 3542', 671);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (32, 'Michele', 'James', '15-Feb-1976', '4556 8302 5012 9434', 198);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (33, 'Rachel', 'Daniel', '21-Apr-1948', '3499 7085 1242 705', 444);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (34, 'Bernice', 'Christensen', '22-Mar-1970', '4024 0071 3867 2315', 615);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (35, 'Annie', 'Poole', '13-Jan-1980', '5543 4285 1396 4854', 950);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (36, 'Alexandra', 'Stone', '26-May-1971', '3765 6674 9961 401', 731);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (37, 'Brittany', 'Mccoy', '12-May-1974', '5566 6531 0376 1749', 488);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (38, 'Phillip', 'Buchanan', '16-Jan-1976', '4916 5881 9156 7675', 120);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (39, 'Angelo', 'Hodges', '12-Dec-1970', '3756 6859 8179 126', 530);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (40, 'Angelica', 'Long', '25-May-1955', '4556 2788 7196 0433', 715);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (41, 'Patrick', 'Moss', '29-Aug-1955', '5566 0717 3093 3773', 341);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (42, 'Margaret', 'Thomas', '15-Jan-1959', '3461 7946 3370 838', 475);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (43, 'Michael', 'Sims', '21-May-1961', '3430 0267 4913 647', 486);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (44, 'Lindsay', 'Rowe', '12-Oct-1953', '5170 8914 2648 3769', 103);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (45, 'Luz', 'Day', '12-Sep-1977', '4716 7062 2383 5371', 444);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (46, 'Anita', 'Byrd', '19-Apr-1973', '5458 3518 1466 4200', 379);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (47, 'Erica', 'Daniels', '14-May-1960', '5410 6817 7394 1869', 276);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (48, 'Betty', 'Strickland', '28-Aug-1967', '4716 9000 6783 8753', 320);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (49, 'Denise', 'Phillips', '01-Dec-1947', '3741 7553 4230 071', 670);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (50, 'Juanita', 'Hammond', '09-Jun-1953', '4916 8373 8879 8332', 967);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (51, 'Sharon', 'Silva', '09-Feb-1957', '4066 0107 2578 8345', 191);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (52, 'Calvin', 'Bell', '14-Jan-1949', '5234 9638 9770 0288', 698);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (53, 'Ronnie', 'Haynes', '19-Sep-1954', '3455 5072 3356 778', 451);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (54, 'Laurie', 'Wise', '19-Jan-1975', '3779 7957 9041 559', 944);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (55, 'Nettie', 'Pena', '15-Jul-1966', '5233 5599 1400 5874', 180);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (56, 'Benjamin', 'Tyler', '10-Jun-1958', '3756 5611 2897 786', 927);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (57, 'Bernadette', 'Jimenez', '16-Mar-1963', '5389 0301 6442 3086', 285);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (58, 'Carroll', 'Reynolds', '10-May-1975', '5301 9253 5153 8973', 198);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (59, 'Theodore', 'Berry', '28-Jul-1978', '5193 3230 4060 2650', 572);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (60, 'Janet', 'Young', '27-Aug-1956', '4485 6631 0412 6272', 296);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (61, 'Blake', 'Marshall', '15-Oct-1950', '4024 0071 5825 7302', 675);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (62, 'Jason', 'Cortez', '11-Nov-1963', '5375 9892 4603 8475', 402);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (63, 'Al', 'Burns', '26-Sep-1969', '4556 5728 6163 9555', 432);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (64, 'Scott', 'Hanson', '24-May-1965', '5244 3878 4840 5359', 515);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (65, 'Luther', 'Hudson', '04-Apr-1973', '5437 5171 0710 8958', 773);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (66, 'Bruce', 'Steele', '26-Aug-1971', '5428 4330 4456 1609', 626);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (67, 'Rhonda', 'Griffin', '28-Jul-1950', '4716 6843 6266 0738', 107);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (68, 'Francis', 'Lowe', '07-Oct-1968', '3498 9934 2882 763', 367);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (69, 'Antonia', 'Woods', '26-Jun-1955', '4556 6816 5264 7725', 527);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (70, 'Curtis', 'Logan', '15-Dec-1960', '4532 8474 4394 4452', 935);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (71, 'Olive', 'Cobb', '17-May-1967', '4929 5372 1700 7898', 380);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (72, 'Meghan', 'Reyes', '06-Mar-1967', '4024 0071 5544 9647', 110);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (73, 'Debra', 'Reid', '10-Aug-1974', '3404 4019 5968 547', 926);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (74, 'Kristopher', 'Dixon', '14-Feb-1953', '5432 4923 6848 6581', 373);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (75, 'Dwayne', 'Wong', '30-Dec-1973', '4532 5203 4962 9697', 802);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (76, 'Faith', 'Russell', '16-Jul-1969', '4916 2107 8275 4188', 265);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (77, 'Jerald', 'Bryant', '17-Dec-1979', '4801 0572 5946 5618', 306);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (78, 'Dora', 'Cohen', '03-Aug-1957', '3463 7819 6454 386', 623);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (79, 'Justin', 'Gill', '25-Mar-1970', '4929 4619 0083 9808', 696);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (80, 'Hope', 'Cole', '10-Oct-1953', '4539 1578 4704 4781', 359);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (81, 'Jaime', 'Parks', '23-Jul-1979', '5202 9567 8287 1717', 853);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (82, 'Ray', 'Blair', '04-Jan-1973', '3453 9542 7743 552', 756);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (83, 'Ira', 'Kennedy', '24-Jan-1952', '3451 2812 0041 663', 339);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (84, 'Alejandro', 'Mitchell', '21-Feb-1967', '4024 0071 7045 2741', 727);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (85, 'Sheila', 'Hogan', '06-Aug-1955', '5407 5591 4384 5413', 291);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (86, 'Beulah', 'Summers', '04-Apr-1969', '5292 3576 7433 4909', 795);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (87, 'Willard', 'Caldwell', '28-Jan-1950', '5449 2490 9401 2409', 521);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (88, 'Edward', 'Adkins', '09-Jun-1965', '3429 8896 1177 568', 294);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (89, 'Glenn', 'Lucas', '25-May-1956', '4916 1392 5315 5288', 771);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (90, 'Antonio', 'White', '26-May-1978', '3464 7619 2373 269', 463);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (91, 'Amos', 'Bishop', '03-Sep-1967', '5562 8908 4874 3806', 647);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (92, 'Ruth', 'Wallace', '21-May-1965', '4024 0071 1690 0498', 514);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (93, 'Kara', 'Gordon', '05-Jul-1947', '5364 9836 9140 4756', 852);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (94, 'Jody', 'Jennings', '04-Nov-1963', '3768 1345 4515 984', 491);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (95, 'Terri', 'Romero', '08-Aug-1952', '5588 0486 7367 6605', 628);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (96, 'Maria', 'Farmer', '19-Feb-1964', '5283 8529 9930 8407', 499);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (97, 'Evan', 'Lynch', '08-Jul-1976', '4485 8110 3919 1057', 243);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (98, 'Alfred', 'Gonzalez', '06-Jul-1979', '4929 4310 6904 8848', 998);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (99, 'Emilio', 'Maxwell', '25-Mar-1978', '3797 2892 3668 999', 788);
INSERT INTO users (id, name, surname, dob, credit_card, cvv) VALUES (100, 'Rose', 'Terry', '13-Apr-1955', '5239 2173 5756 5789', 183);
