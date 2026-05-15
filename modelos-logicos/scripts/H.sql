


#criar tabela conta
create table tbl_conta (
    id 		      int   not null primary key auto_increment,

    tipo 	            varchar(45) 	not null,
    saldo 	          double  not null,
    data_abertura     date,
    plano             varchar(45)
  
);


#criacao da tabela cliente
create table tbl_cliente(
    id 		            int   not null primary key auto_increment,

    nome 	          varchar(100) 	not null,
    cpf    	          varchar(20)  not null,
    email             varchar(254),

    id_conta          int not null,

    #fazer relacao entre duas tabelas 
    constraint			FK_CONTA_CLIENTE	      # nome do relacionamento
    foreign key			(id_conta)				      # quem sera a FK natabla FK(foren key)
    references			tbl_conta(id)			      # de onde vem a FK

);


#criar tabela estado

create table tbl_estado (
    id 		              int           not null primary key auto_increment,

    sigla 	              varchar(5) 	  not null,
    nome 	              varchar(30) 	not null
);


#criacao da tabela cidade
create table tbl_cidade(
    id 		            int   not null primary key auto_increment,
    nome 	            varchar(50) 	not null,

    id_estado           int not null,

    #fazer relacao entre duas tabelas 
    constraint			FK_ESTADO_CIDADE	      # nome do relacionamento
    foreign key			(id_estado)				      # quem sera a FK natabla FK(foren key)
    references			tbl_estado(id)			      # de onde vem a FK

);


#criacao da tabela endereco
create table tbl_endereco(
    id 		             int   not null primary key auto_increment,
    logradouro 	         varchar(100) 	not null,
    cep 	             varchar(20) 	not null,
    bairro 	             varchar(50) 	not null,
    complemento 	     varchar(20) 	not null,

    id_cidade            int not null,

    #fazer relacao entre duas tabelas 
    constraint			FK_CIDADE_ENDERECO	      # nome do relacionamento
    foreign key			(id_cidade)				        # quem sera a FK natabla FK(foren key)
    references			tbl_cidade(id)			      # de onde vem a FK

);


#criacao da tabela agencia
create table tbl_agencia(
    id 		            int   not null primary key auto_increment,
    nome       	      varchar(100) 	not null,
    gerente           varchar(100) 	not null,
    expediente 	      varchar(50) 	not null,
    telefone     	    varchar(45) 	not null,
    email        	    varchar(254) 	not null,

    id_endereco          int not null,

    #fazer relacao entre duas tabelas 
    constraint			FK_ENDERECO_AGENCIA	        # nome do relacionamento
    foreign key			(id_endereco)				        # quem sera a FK natabla FK(foren key)
    references			tbl_endereco(id)			      # de onde vem a FK

);


#criacao da tabela funcionario
create table tbl_funcionario(
    id 		            int   not null primary key auto_increment,
    nome       	      varchar(100) 	not null,
    cpf    	          varchar(20)   not null,
    salario           float        	not null,
    data_admissao 	  date         	not null,
    telefone     	    varchar(45) 	not null,
    cargo        	    varchar(45) 	not null,
    email        	    varchar(254) 	not null,

    id_agencia          int not null,

    #fazer relacao entre duas tabelas 
    constraint			FK_AGENCIA_FUNCIONARIO	    # nome do relacionamento
    foreign key			(id_agencia)				        # quem sera a FK natabla FK(foren key)
    references			tbl_agencia(id)			        # de onde vem a FK

);

#criacao da tabela endereco funcionario
create table tbl_endereco_funcionario(
    id					      int not null auto_increment primary key,


    id_endereco	              int not null,
    id_funcionario 			      int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_ENDERECO_ENDERECOFUNCIONARIO   # nome do relacionamento
    foreign key			(id_endereco)				              # quem sera a FK natabla FK(foren key)
    references			tbl_endereco(id),			            # de onde vem a FK



    ##fazer relacao entre duas tabelas 
    constraint			FK_FUNCIONARIO_ENDERECOFUNCIONARIO			# nome do relacionamento
    foreign key			(id_funcionario)				                # quem sera a FK natabla FK(foren key)
    references			tbl_funcionario(id)			                # de onde vem a FK
    
    

);


#criacao da tabela endereco cliente
create table tbl_endereco_cliente(
	id					      int not null auto_increment primary key,
  
  
    id_endereco	              int not null,
    id_cliente 			      int not null,
  
    ##fazer relacao entre duas tabelas 
    constraint			FK_ENDERECO_ENDERECOCLIENTE   # nome do relacionamento
    foreign key			(id_endereco)				              # quem sera a FK natabla FK(foren key)
    references			tbl_endereco(id),			            # de onde vem a FK
    
        
        
    ##fazer relacao entre duas tabelas 
    constraint			FK_FUNCIONARIO_ENDERECOCLIENTE			# nome do relacionamento
    foreign key			(id_cliente)				                # quem sera a FK natabla FK(foren key)
    references			tbl_cliente(id)			                # de onde vem a FK
    
    
);

