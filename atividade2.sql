create table localidade
(cd_localidade integer,
 nm_localidade varchar(50),
 constraint localidade_pk primary key (cd_localidade)
);

 

create table marca
(cd_marca   integer,
 ds_marca   varchar(30),
 primary key (cd_marca)
);

 

create table combustivel
(cd_combustivel integer,
 ds_combustivel varchar(30),
 primary key (cd_combustivel)
);

 

create table cor
(cd_cor   integer,
 ds_cor   varchar(30),
 primary key (cd_cor)
);

 

create table acessorio
(cd_acessorio  integer,
 ds_acessorio  varchar(50),
 primary key (cd_acessorio)
);
  
create table modelo
(cd_modelo integer,
 cd_marca integer,
 ds_modelo varchar(50),
 primary key (cd_modelo),
 foreign key (cd_marca) references marca(cd_marca)
);
  
create table proprietario(
cd_proprietario integer,
cd_localidade integer,
nm_proprietario varchar(50),
ds_logradouro varchar(50),
ds_complemento varchar(50),
ds_bairro varchar(50),
nr_telefone varchar(15),
ds_email varchar(50),
sg_uf char(2),

constraint proprietario_pk primary key (cd_proprietario),
constraint proprietario_localidade_fk foregin key (cd_localidade) references localidade(cd_localidade)
);


create table veiculo
(nr_placa char(7),
cd_cor integer,
cd_proprietario integer,
cd_modelo integer,
nr_ano_fab integer,
nr_ano_mod integer,
qt_km_rodado integer,
qt_portas integer,
ds_observacao varchar(100),

constraint veiculo_pk primary key (nr_placa),
constraint veiculo_cor_fk foregin key (cd_cor)
	references cor(cd_cor),
constraint veiculo_modelo_fk primary key (cd_modelo),
	references modelo(cd_modelo),
constraint veiculo_proprietario_fk foregin key
(cd_proprietario) references proprietario (cd_proprietario)
);


create table veiculo_acessorio(
nr_placa char(7),
cd_acessorio integer,

constraint veiculo_acessorio_pk 
	primary key (nr_placa, cd_acessorio),
constraint veiculo_acessorio_placa_fk foregin key (nr_placa)
	references veiculo(nr_placa),
constraint veiculo_acessorio_acessorio_fk foregin key (cd_acessorio)
	references acessorio(cd_acessorio)
);

create table veiculo_combustivel(
cd_combustivel integer,
nr_placa char(7),

constraint veiculo_combustivel_pk
	primary key (cd_combustivel, nr_placa)
);

alter table veiculo_combustivel
add constraint veic_combus_combustivel_fk foregin key (cd_combustivel)
	references combustivel(cd_combustivel),
alter table veiculo_combustivel
add constraint veic_combus_placa_fk foregin key (nr_placa)
	references veiculo(nr_placa);
