create database db_I; #Cria meu database 

use db_I;


#criar tabela projeto
create table tbl_projeto (
    id 		            int   not null primary key auto_increment,

    nome 	            varchar(100) 	not null,
    responsavel 	    varchar(100)  not null,
    status            varchar(50),
    data_comeco       date,
    data_fim          date

  
);


#criacao da tabela dependente
create table tbl_dependente(
    id 		            int   not null primary key auto_increment,

    nome 	            varchar(100) 	not null,
    sexo    	        varchar(20)  not null,
    parentesco        varchar(54)

);


#criar tabela departamento
create table tbl_departamento (
    id 		              int           not null primary key auto_increment,

    nome 	              varchar(100) 	not null,
    responsavel         varchar(100) 	not null,
    localizacao         varchar(100) 	not null,
    telefone            varchar(50) 	not null,
    email               varchar(254) 	not null,
    tipo                varchar(54) 	not null,
    capacidade          varchar(25) 	not null
  
);


#criacao da tabela profisional
create table tbl_profisional(
    id 		            int   not null primary key auto_increment,
    nome       	      varchar(100) 	not null,
    cpf    	          varchar(20)   not null,
    sexo    	        varchar(20)   not null,
    salario           float        	not null,
    data_admissao 	  date         	not null,
    telefone     	    varchar(45) 	not null,
    cargo        	    varchar(45) 	not null,
    email        	    varchar(254) 	not null

);






#criacao da tabela departamento projeto
create table tbl_departamento_projeto(
    id					              int not null auto_increment primary key,


    id_departamento	              int not null,
    id_projeto 			              int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_DEPARTAMENTO_DEPARTAMENTOPROJETO   # nome do relacionamento
    foreign key			(id_departamento)				              # quem sera a FK natabla FK(foren key)
    references			tbl_departamento(id),			            # de onde vem a FK



    ##fazer relacao entre duas tabelas 
    constraint			FK_PROJETO_DEPARTAMENTOPROJETO			# nome do relacionamento
    foreign key			(id_projeto)				                # quem sera a FK natabla FK(foren key)
    references			tbl_projeto(id)			                # de onde vem a FK
    
    

);




