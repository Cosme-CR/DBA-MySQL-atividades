create database db_lista_exercicios_01; #Cria meu database da lista de exercicios

use db_lista_exercicios_01; #Usando o database


#CRIAÇÃO DAS TABELAS ->

create table tbl_contrato (
	id 				int not null primary key auto_increment,
	numero 			varchar(50),
	data_inicio 	date,
    data_fim 		date,
	valor 			decimal(10.2),
    objeto_servico varchar(50)
    );