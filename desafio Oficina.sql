-- Criação do Banco de Dados Oficina Mecanica


CREATE DATABASE Oficina;
USE Oficina;


-- Criação tabela Cliente
CREATE TABLE Cliente (
	cpfCliente VARCHAR (11) NOT NULL,
    nomeCliente VARCHAR(45) NOT NULL,
    endCliente VARCHAR (45) NOT NULL,
    foneCliente VARCHAR (15) NOT NULL,
    Primary Key (cpfCliente),
    Constraint cpf_Cliente UNIQUE (cpfCliente)
);
    
-- Criação tabela Veiculo
CREATE TABLE Veiculo ( 
	idVeiculo VARCHAR (11) NOT NULL,
    modVeiculo VARCHAR (20) NOT NULL,
    anoVeiculo VARCHAR (20) NOT NULL,
    corVeiculo VARCHAR (15) NOT NULL,
    Cliente_cpfCliente VARCHAR (11) NOT NULL,
    Primary Key (idVehicle),
	Constraint fk_cpfCliente Foreign Key (cpfCliente) References Cliente (cpfCliente)
);


-- Criação Tabela Ordem de Serviço
CREATE TABLE Ordem_de_Serviço (
	idOS VARCHAR (15) Primary Key,
    statusOS VARCHAR (20),
    dtConclusao DATETIME NOT NULL, 
    Cliente_cpfCliente VARCHAR (11) NOT NULL,
    ServPecas_idServ INT NOT NULL,
    ServPecas_idPec VARCHAR (45) NOT NULL,
    Mecanico_idMec VARCHAR (11) NOT NULL,
    Constraint fk_cpfCliente Foreign Key (cpfCliente) References Cliente (cpfCliente),
    Constraint fk_idServ Foreign Key (idServ) References ServPecas (idServ),
    Constraint fk_idPec Foreign Key (idPec) References ServPecas (idPec),
    Constraint fk_idMec Foreign Key (idMec) References Mecanico (idMec)
);

-- Criação Tabela ServPecas
CREATE TABLE ServPecas (
	idServ VARCHAR (25) NOT NULL,
    descServ VARCHAR (30) NOT NULL,
    valorServ DECIMAL (5,2) NOT NULL,
    idPec VARCHAR (25) NOT NULL,
    descPec VARCHAR (30) NOT NULL,
    valorPec DECIMAL (5,2) NOT NULL,
    estoquePec ENUM ('Sem Estoque','Em Estoque') DEFAULT 'Em Estoque',
    Primary Key (idServ, idPec)      
);

-- Criação Tabela Mecanico
create table Mecanico (
	idMec VARCHAR (11) NOT NULL,
    tipoMec VARCHAR (45) NOT NULL,
    nomeMec VARCHAR (45) NOT NULL,
	endMec VARCHAR (45) NOT NULL,
    foneMec VARCHAR (15) NOT NULL,
    Primary Key(idMec),    
);

