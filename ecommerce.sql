-- criação do banco de dados para cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;
DROP DATABASE ecommerce;

-- criar tabela cliente
DROP TABLE clients;
CREATE TABLE clients(
	idClient INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fstName VARCHAR(10) NOT NULL,
    midName VARCHAR(3),
    surName VARCHAR(20),
    tipo CHAR(2),
    CPF CHAR(11) NOT NULL,
		CONSTRAINT unique_cpf_client UNIQUE (CPF),
    address VARCHAR(45),
    dtNascimento DATE
);



desc clients;

-- criar tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    fstName VARCHAR(10) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico','Vestimenta','Briquedos','Móveis') NOT NULL,
    feedback FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- criar tabela pagamento
CREATE TABLE payment(
	idPClient INT,
    idPayment INT,
		PRIMARY KEY (idClient, idPayment),
    typePayment ENUM('Boleto','Cartão'),
	limitAvailable FLOAT,
		CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient),
		CONSTRAINT fk_payment_order FOREIGN KEY (idPayment) REFERENCES orders(idOrder)
);

ALTER TABLE payment CHANGE COLUMN idClient idPClient INT;

DELETE FROM payment;

-- criar tabela pedido
drop table orders;
CREATE TABLE orders(
 	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em Processamento',
    orderDescription VARCHAR(225),
    shipping FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    code INT,
		CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

desc orders;

-- criar tabela estoque
CREATE TABLE storages(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(225),
    quantity INT DEFAULT 0
);

DROP TABLE storages;

-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(225) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
		CONSTRAINT unique_supplier unique (CNPJ),
    contact CHAR(11) NOT NULL
);

-- criar tabela vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(225) NOT NULL,
    AbstName VARCHAR(225),
    CNPJ CHAR(15),
		CONSTRAINT unique_cnpj_seller unique (CNPJ),
    CPF CHAR(9),
		CONSTRAINT unique_cpf_seller unique (CPF),
    location VARCHAR(225),
    contact CHAR(11) NOT NULL
);

CREATE TABLE productSeller(
	idProdSeller INT,
		CONSTRAINT fk_product_seller FOREIGN KEY (idProdSeller) REFERENCES seller(idSeller),
	idProduct INT,
		CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
	prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idProdSeller, idProduct)
);

CREATE TABLE productOrder(
	idPOproduct INT,
		CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    idPOorder INT,
		CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder),
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder)
);

CREATE TABLE storageLocation(
	idLproduct INT,
		CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
	idLstorage INT,
		CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES storages(idProdStorage),
    location VARCHAR(225) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage)
);

SHOW TABLES;