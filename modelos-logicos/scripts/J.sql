#criar tabela restaurante
create table tbl_restaurante (
    id 		            int   not null primary key auto_increment,

    nome 	            varchar(100) 	not null,
    email        	    varchar(254) 	not null,
    telefone     	    varchar(45) 	not null,
    classificacao 	  varchar(30)  not null

);

#criacao da tabela cidade
create table tbl_cidade(
    id 		                          int   not null primary key auto_increment,
    nome 	                          varchar(50) 	not null,
    estado                          varchar(50) 	not null,
		uf 	                            varchar(3)  	not null,	    
    pais 	                          varchar(50) 	not null,
    regio 	                        varchar(50) 	not null,
    quantidade_pontos_turisticos    int
);


#criacao da tabela endereco
create table tbl_endereco(
    id 		               int          not null primary key auto_increment,
    logradouro 	         varchar(100) not null,
    cep 	               varchar(20) 	not null,
    bairro 	             varchar(50) 	not null,
    complemento 	       varchar(20) 	not null,
    numero               int          not null
);

#criacao da tabela telefone
create table tbl_telefone(
    id 		               int     not null primary key auto_increment,
    telefone             varchar(50)    not null
);

#criacao da tabela hotel
create table tbl_hotel(
    id 		            int           not null primary key auto_increment,
    nome       	      varchar(100) 	not null,
    clasificacao      varchar(45) 	not null,
    email        	    varchar(254) 	not null

);

#criacao da tabela cliente
create table tbl_cliente(
    id 		            int   not null primary key auto_increment,
    nome       	      varchar(100) 	not null,
    cpf    	          varchar(20)   not null,
    sexo    	        varchar(20)   not null,

    telefone     	    varchar(45) 	not null,
    classificacao     varchar(45) 	not null,
    email        	    varchar(254) 	not null


);

#criacao da tabela restaurante cidade
create table tbl_restaurante_cidade(
    id 		            int   not null primary key auto_increment,

    id_endereco       int not null,
    id_restaurante    int not null,
    id_telefone       int not null,
    id_cidade    int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_ENDERECO_RESTAURANTECIDADE			# nome do relacionamento
    foreign key			(id_endereco)				# quem sera a FK natabla FK(foren key)
    references			tbl_endereco(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas 
    constraint			FK_RESTAURANTE_RESTAURANTECIDADE			# nome do relacionamento
    foreign key			(id_restaurante)				# quem sera a FK natabla FK(foren key)
    references			tbl_restaurante(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas
    constraint			FK_TELEFONE_RESTAURANTECIDADE			# nome do relacionamento
    foreign key			(id_telefone)				# quem sera a FK natabla FK(foren key)
    references			tbl_telefone(id),			# de onde vem a FK 

    ##fazer relacao entre duas tabelas 
    constraint			FK_CIDADE_RESTAURANTECIDADE			# nome do relacionamento
    foreign key			(id_cidade)				# quem sera a FK natabla FK(foren key)
    references			tbl_cidade(id)			# de onde vem a FK

);

#criacao da tabela hotel cidade
create table tbl_hotel_cidade(
    id 		            int   not null primary key auto_increment,
    valor             varchar(45),
    id_endereco       int not null,
    id_hotel    int not null,
    id_telefone       int not null,
    id_cidade    int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_ENDERECO_HOTELCIDADE			# nome do relacionamento
    foreign key			(id_endereco)				# quem sera a FK natabla FK(foren key)
    references			tbl_endereco(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas 
    constraint			FK_HOTEL_HOTELCIDADE			# nome do relacionamento
    foreign key			(id_hotel)				# quem sera a FK natabla FK(foren key)
    references			tbl_hotel(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas
    constraint			FK_TELEFONE_HOTELCIDADE			# nome do relacionamento
    foreign key			(id_telefone)				# quem sera a FK natabla FK(foren key)
    references			tbl_telefone(id),			# de onde vem a FK 

    ##fazer relacao entre duas tabelas 
    constraint			FK_CIDADE_HOTELCIDADE			# nome do relacionamento
    foreign key			(id_cidade)				# quem sera a FK natabla FK(foren key)
    references			tbl_cidade(id)			# de onde vem a FK

);

#criacao da tabela atracao
create table tbl_atracao(
    id 		            int           not null primary key auto_increment,
    nome       	      varchar(100) 	not null,
    clasificacao      varchar(45) 	not null,
    email        	    varchar(254) 	not null,
    hora        	    time ,

    id_endereco       int not null,
    id_cidade         int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_ENDERECO_ATRACAO			# nome do relacionamento
    foreign key			(id_endereco)				# quem sera a FK natabla FK(foren key)
    references			tbl_endereco(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas 
    constraint			FK_CIDADE_ATRACAO			# nome do relacionamento
    foreign key			(id_cidade)				# quem sera a FK natabla FK(foren key)
    references			tbl_cidade(id)			# de onde vem a FK

);

#criacao da tabela reserva cliente hotell
create table tbl_reserva_cliente_hotel(
    id 		            int           not null primary key auto_increment,
    chekin       	    date 	not null,
    checkout          date 	not null,

    id_cliente        int not null,
    id_hotel_cidade   int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_CLIENTE_RESERVACLIENTEHOTEL			# nome do relacionamento
    foreign key			(id_cliente)				# quem sera a FK natabla FK(foren key)
    references			tbl_cliente(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas 
    constraint			FK_HOTELCIDADE_RESERVACLIENTEHOTEL			# nome do relacionamento
    foreign key			(id_hotel_cidade)				# quem sera a FK natabla FK(foren key)
    references			tbl_hotel_cidade(id)			# de onde vem a FK

);

#criacao da tabela reserva cliente restaurante
create table tbl_reserva_cliente_restaurante(
    id 		            int           not null primary key auto_increment,
    data         	    date 	not null,
    hora              time 	not null,

    id_cliente        int not null,
    id_restaurante_cidade   int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_CLIENTE_RESERVACLIENTERESTAURANTE			# nome do relacionamento
    foreign key			(id_cliente)				# quem sera a FK natabla FK(foren key)
    references			tbl_cliente(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas 
    constraint			FK_HOTELCIDADE_RESERVACLIENTERESTAURANTE			# nome do relacionamento
    foreign key			(id_restaurante_cidade)				# quem sera a FK natabla FK(foren key)
    references			tbl_restaurante_cidade(id)			# de onde vem a FK

);

#criacao da tabela pessoa atracao
create table tbl_pessoa_atracao(
    id 		            int           not null primary key auto_increment,
    dia         	    date 	not null,
    hora              time 	not null,
    valor             float,

    id_cliente        int not null,
    id_atracao        int not null,

    ##fazer relacao entre duas tabelas 
    constraint			FK_CLIENTE_PESSOAATRACAO			# nome do relacionamento
    foreign key			(id_cliente)				# quem sera a FK natabla FK(foren key)
    references			tbl_cliente(id),			# de onde vem a FK

    ##fazer relacao entre duas tabelas 
    constraint			FK_HOTELCIDADE_PESSOAATRACAO			# nome do relacionamento
    foreign key			(id_atracao)				# quem sera a FK natabla FK(foren key)
    references			tbl_atracao(id)			# de onde vem a FK

);


