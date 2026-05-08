create database db_lista_exercicios_01; #Cria meu database da lista de exercicios

use db_lista_exercicios_01; #Usando o database


#CRIAÇÃO DAS TABELAS ->

create table tbl_contrato (
	id 				int not null primary key auto_increment,
	numero 			varchar(50),
	data_inicio 	date,
    data_fim 		date,
	valor 			decimal(10.2),
    objeto_servico 	varchar(50)
);
    
#Permite ver a estrutura da tabela
desc tbl_contrato;
desc tbl_estado;
desc tbl_cidade;
desc tbl_endereco;
desc tbl_cliente;
desc tbl_advogado;

create table tbl_estado (
	id 		int not null primary key auto_increment,
    sigla 	varchar(3)
);


#Modificando a estrutura de um atributo
alter table tbl_estado
	modify column sigla varchar(3) not null;
    

show tables;


create table tbl_cidade (
	id 		int not null primary key auto_increment,
    nome 	varchar(100) not null,
    regiao 	varchar(30) not null
);


#CRIAÇÃO DE TABELAS COM  CHAVE ESTRANGEIRA ->

create table tbl_endereco (
	id 			int not null primary key auto_increment,
    logradouro 	varchar(200) not null,
    bairro 		varchar(100) not null,
    
    id_cidade int not null,
    
    constraint FK_ENDERECO_CIDADE
    foreign key (id_cidade)
    references tbl_cidade(id)
);


create table tbl_cliente (
	id 					int not null primary key auto_increment,
    nome 				varchar(150),
    cpf 				varchar (25) not null,
    data_nascimento 	date not null,
    sexo 				varchar(3) not null,
    email 				varchar(255),
    
    id_endereco int not null,
    
    #Relacionamento entre duas tabelas FK ->
    constraint FK_CLIENTE_ENDERECO #Nome do relacionamento
    
    #Quem sera a FK natabla FK(foren key)
	foreign key (id_endereco) 
    
    #De onde vem a FK
	references tbl_endereco(id)
);


create table tbl_advogado (
	id 				int not null primary key auto_increment,
    nome 			varchar(100) not null,
    cpf 			varchar(30) not null,
    especialidade 	varchar(100) not null,
    admissao 		date not null,
    data_nascimento date not null,
    oab 			int not null,
    salario 		decimal(10.2) not null,
    email 			varchar(255) not null,
    
    id_endereco int not null,
    
    constraint FK_ADVOGADO_ENDERECO
    foreign key(id_endereco)
    references tbl_endereco(id)
);

















































