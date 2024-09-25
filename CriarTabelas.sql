DROP SCHEMA IF EXISTS Dom;
CREATE SCHEMA IF NOT EXISTS Dom;
USE Dom;

CREATE TABLE IF NOT EXISTS Cliente (
    idCliente INT NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Nif VARCHAR(45),
    Nome VARCHAR(45) NOT NULL,
    PRIMARY KEY(idCliente)
);
CREATE TABLE IF NOT EXISTS Telemóvel (
	NrTelemóvel VARCHAR(45) NOT NULL,
    TCliente INT NOT NULL,
	FOREIGN KEY(TCliente)
		REFERENCES Cliente(idCliente)
);
CREATE TABLE IF NOT EXISTS Item (
    idItem INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
    Descrição VARCHAR(100) NOT NULL,
    Preço DECIMAL(5,2) NOT NULL,
    Stock INT NULL,
    PRIMARY KEY(idItem)
);
CREATE TABLE IF NOT EXISTS Estafeta (
    idEstafeta INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
    Salário DECIMAL(5,2) NOT NULL,
    Ativo VARCHAR(3) NOT NULL,
    CONSTRAINT cnt_Ativo_Estafeta CHECK (Ativo IN ('Sim','Não')),
	PRIMARY KEY(idEstafeta)
);
CREATE TABLE IF NOT EXISTS Administrativo (
    idAdministrativo INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
    Salário DECIMAL(5,2) NOT NULL,
    Ativo VARCHAR(3) NOT NULL,
    CONSTRAINT cnt_Ativo_Administrativo CHECK (Ativo IN ('Sim','Não')),
	PRIMARY KEY(idAdministrativo)
);
CREATE TABLE IF NOT EXISTS Transporte (
    Matricula VARCHAR(8) NOT NULL,
	CustoPortes DECIMAL(5,2) NOT NULL,
	PRIMARY KEY(Matricula)
);
CREATE TABLE IF NOT EXISTS Pedido (
    idPedido INT NOT NULL,
    DataR DATETIME,
    DataE DATETIME,
    DataP DATETIME NOT NULL,
    Estado VARCHAR(45) NOT NULL,
    CONSTRAINT cnt_Estado CHECK (Estado IN ('Processamento','Enviado','Recebido')),
    Preço DECIMAL(10,2) NOT NULL,
    Rua VARCHAR(45) NOT NULL,
    Localidade VARCHAR(45) NOT NULL,
    CodPostal VARCHAR(45) NOT NULL,
    PCliente INT NOT NULL,
    PEstafeta INT NOT NULL,
    PTransporte VARCHAR(8) NOT NULL,
    PAdministrativo INT NOT NULL,
    PRIMARY KEY(idPedido),
	FOREIGN KEY (PCliente) 
		REFERENCES Cliente(idCliente),
	FOREIGN KEY (PEstafeta) 
		REFERENCES Estafeta(idEstafeta),
	FOREIGN KEY (PTransporte) 
		REFERENCES Transporte(Matricula),
	FOREIGN KEY (PAdministrativo) 
		REFERENCES ADministrativo(idAdministrativo)
);

CREATE TABLE IF NOT EXISTS Item_has_Pedidos (
    IPitem INT NOT NULL,
	IPPedido INT NOT NULL,
    PreçoTotal DECIMAL(6,2) NOT NULL,
    Quantidade INT NOT NULL,
	FOREIGN KEY(IPitem)
		REFERENCES Item(idItem),
	FOREIGN KEY(iPPedido)
		REFERENCES Pedido(idPedido)
);

Set SQL_SAFE_Updates=1;