USE takenny_freight;

# CLIENT/CARRIER Tables
DELETE FROM carrier WHERE carrier = "TEST";
INSERT INTO carrier (carrier, `name`) VALUES ("TEST","TEST");

DELETE FROM client WHERE client = "TEST";
INSERT INTO client VALUES
('TEST', 'TEST', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', NULL, '', '', '', 
 '', '', NULL, NULL, '0', '0', '0', '', NULL, NULL, NULL, '', NULL);

# FREIGHT
DELETE FROM nfreight WHERE carrier = "TEST";
INSERT INTO nfreight VALUES
(NULL, NULL, '', 'MANU', 'TEST', 'TEST', 'TEST', NULL, NULL, '2018-04-16', '', '', '', '', '', '', 
 '', '', '', '101 Perkvine Cir', 'Cary', 'NC', '27519', 'US', '', '5.000000', '100.0000',
 '100.0000', '', '', '0', NULL, NULL, NULL, NULL, '0', '', '', '', '', '', NULL, '', NULL, NULL, 
NULL, NULL, NULL, 'TEST', NULL, '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', 
NULL, NULL, NULL, '', NULL, NULL, '1', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '',
 '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '', '');