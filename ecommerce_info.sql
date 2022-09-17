USE ecommerce;
SHOW TABLES;
DROP DATABASE ecommerce;

DROP TABLE clients;
DESC clients;
INSERT INTO clients (fstName, midName, surName, CPF, tipo, address, dtNascimento)
	VALUES 
		('Ardith','J','Lanfear','923294905','PJ','Doe Crossing Junction','14.10.2021'),
        ('Ambrosius','F','Scola','488748888','PF','Shopko Circle','15.05.2004'),
        ('Ray','H','Rushforth','461463327','PF','Clarendon Alley','19.12.2022'),
        ('Eden','A','Greenrod','172999642','PJ','Shoshone Terrace','26.09.2021'),
        ('Shaylah','L','Wrightim','225301698','PJ','Mockingbird Avenue','18.05.2011');
        
SELECT * FROM clients;
SELECT concat(fstName, ' ', surName) AS client, idOrder AS request, orderStatus AS stCompra FROM clients c, orders o WHERE c.idClient = idOrderClient ORDER BY idOrder;

DESC orders;
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, shipping, paymentCash,code)
	VALUES 
		(1,default,'aplicativo',null,1,134806493),
        (2,default,null,null,1,666333111),
        (3,'Confirmado','web site',50,0,222333555),
        (4,default,'aplicativo',null,1,999777666);
        
SELECT * FROM orders;


DESC product;
INSERT INTO product (fstName, classification_kids, category, feedback, size)
	VALUES 
		('Fone',false,'Eletrônico','4',null),
        ('Boneca',true,'Briquedos','3',null),
        ('Camiseta',false,'Vestimenta','5',null),
        ('Sofá',false,'Móveis','2',null),
        ('Fire Stick',false,'Eletrônico','3',null);
        
SELECT * FROM product;

DESC productOrder;
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	VALUES 
		(1,5,2,null),
        (2,5,1,null),
        (2,6,1,null),
        (3,7,1,null);

SELECT * FROM productOrder;

DESC seller;
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact)
	VALUES 
		('05 Grayhawk Hill','Wisoky, Bartell and Jacobs','542386673385968','470213568','3945 Everett Court','12181800190'),
		('29 Columbus Park','Streich, McKenzie and Klein','381115840677649','478545330','294 Northfield Point','11666895664'),
		('7316 Nelson Parkway','Bednar, Smitham and Yost','491313582412372','666326727','89 Truax Trail','11195638079');
        
SELECT * FROM seller;

DESC storageLocation;
INSERT INTO storageLocation (location)
	VALUES 
		('8400 Laurel Lane'),
        ('3 Charing Cross Trail'),
        ('27 Center Center'),
        ('449 Dahle Junction'),
        ('2313 Anzinger Terrace');

SELECT * FROM storageLocation;

DESC storages;
INSERT INTO storages (storageLocation, quantity)
	VALUES 
		('575 La Follette Alley','12'),
        ('682 Fallview Trail','76'),
        ('2 Arapahoe Way','32'),
        ('41 Prairie Rose Hill','62'),
        ('80270 Quincy Circle','81');

SELECT * FROM storages;

DESC supplier;
INSERT INTO supplier (SocialName, CNPJ, contact)
	VALUES 
		('Keebler','301813230223214','7914934410'),
        ('Schuppe','397832182114380','4100552229'),
        ('Schmidit','202746449080862','7135314941'),
        ('Herman','173655430408397','5239396416'),
        ('Lebsack','507683184405887','5679788944');
        
SELECT * FROM supplier;