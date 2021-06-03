/*
--- Blood Types ---
O positive: 35%
O negative: 13%
A positive: 30%
A negative: 8%
B positive: 8%
B negative: 2%
AB positive: 2%
AB negative: 1%
*/

CREATE USER RedCell IDENTIFIED BY RedCell;
GRANT ALL PRIVILEGES TO RedCell;

DROP SEQUENCE ID_COUNTER;
CREATE SEQUENCE ID_COUNTER START WITH 1 INCREMENT BY 1;

DROP TABLE Donneur;
CREATE TABLE Donneur
(
	id NUMBER PRIMARY KEY,
    prenom VARCHAR2(20) NOT NULL,
    nom VARCHAR2(20) NOT NULL,
    ville VARCHAR2(30) NOT NULL,
    adresse VARCHAR2(100) NOT NULL,
    groupe_sanguin VARCHAR2(3) NOT NULL,
    date_naissance DATE NOT NULL,
    telephone VARCHAR2(15) NOT NULL,
    email VARCHAR2(128) NOT NULL UNIQUE,
    password VARCHAR2(256) NOT NULL,
    disponible VARCHAR2(3) DEFAULT 'oui',
    
    
    -- CHECKS --
    CONSTRAINT check_group_sanguin check(upper(groupe_sanguin) in ('A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-')),
    CONSTRAINT check_email check(REGEXP_LIKE(email, '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')),
    CONSTRAINT check_telephone check(REGEXP_LIKE(telephone, '^(\+[0-9]{1,3}|0)([ \-_/]*)(\d[ \-_/]*){9}$')),
    CONSTRAINT check_disponible check(lower(disponible) in ('oui', 'non'))
);
COMMIT;

INSERT INTO Donneur VALUES(ID_COUNTER.nextval, 'Ahmed', 'Mouataz', 'Casablanca', 'Sbata Jamila 3 Rue 256 N.4 Apt 8', 'O+', TO_DATE('1986/07/19', 'yyyy/mm/dd'), '0625102340', 'ahmed-mouataz@gmail.com', '123456', 'oui');
INSERT INTO Donneur VALUES(ID_COUNTER.nextval, 'Oumaima', 'Kadour', 'Rabat', 'Agdal 25 Angle Rue jabal Tazaka et Rue baht N.2', 'O-', TO_DATE('1995/02/09', 'yyyy/mm/dd'), '0660145820', 'oumaima.kadour@hotmail.com', '123456', 'oui');
INSERT INTO Donneur VALUES(ID_COUNTER.nextval, 'Imran', 'Miftah', 'Casablanca', 'Anfa 17, Rue Martil Quartier Val', 'A+', TO_DATE('1976/07/19', 'yyyy/mm/dd'), '+212662014582', 'imran_miftah@gmail.com', '123456', 'oui');
INSERT INTO Donneur VALUES(ID_COUNTER.nextval, 'Khadija', 'Salah', 'Kenitra', 'Parc industriel INDUSPARC Batiment B2', 'A-', TO_DATE('1976/07/19', 'yyyy/mm/dd'), '+212696012546', 'khadijasalah@gmail.com', '123456', 'oui');
INSERT INTO Donneur VALUES(ID_COUNTER.nextval, 'Khalid', 'Atfaoui', 'Temara', '458 Avenue My Ali Cherif', 'B+', TO_DATE('1976/07/19', 'yyyy/mm/dd'), '0664012589', 'atfaoui-khalid1998@gmail.com', '123456', 'oui');


SELECT * FROM DONNEUR;
DELETE FROM Donneur;

update donneur set disponible = 'oui' where id = 3;

