-- Création de la base de données
CREATE DATABASE TESTSQL

-- Création de la table TRANSACTIONS
use TESTSQL
CREATE TABLE TRANSACTIONS (date DATE, order_id int, client_id int, prop_id int, prod_price float, prod_qty int)
;

-- Insertion des valeurs dans la table TRANSACTIONS
use TESTSQL
INSERT INTO TRANSACTIONS
VALUES
  ( '01/01/20', 1234, 999, 490756, 50, 1),
  ( '03/01/19', 1234, 999, 389728, 3.56, 4),
  ( '03/01/19', 3456, 845, 490756, 50, 2),
  ( '04/01/19', 3456, 845, 549380, 300, 1),
  ( '31/12/19', 3456, 845, 293718, 10, 6)
;

-- Création de la table PRODUCT_NOMENCLATURE
use TESTSQL
CREATE TABLE PRODUCT_NOMENCLATURE (product_id int, product_type varchar(50), product_name varchar(50))

-- Insertion des valeurs dans la table PRODUCT_NOMENCLATURE
use TESTSQL
INSERT INTO PRODUCT_NOMENCLATURE
VALUES
  ( 490756, 'MEUBLE', 'Chaise' ),
  ( 389728, 'DECO', 'Boule de Noël' ),
  ( 549380, 'MEUBLE', 'Canapé' ),
  ( 293718, 'DECO', 'Mug' );
;

select * FROM TRANSACTIONS as t
where  t.date >= '01-01-2020' and t.date <= '03-01-2020'
;







