create table genero
(cd_genero integer,
ds_genero varchar(30),
primary key (cd_genero)
);

create table censura
(cd_censura integer,
ds_censura VARCHAR(50),
primary key (cd_censura)
);

create table ator
(cd_ator integer,
nm_ator varchar(50),
primary key (cd_ator)
);

create table filme
(cd_filme integer,
cd_censura integer,
cd_genero  integer,
nm_filme VARCHAR(50),
ds_sinopse VARCHAR(250),
nr_duracao VARCHAR(20),
dt_lancamento DATE,
fl_dublado char(1),
primary key (cd_filme)
);


alter table filme
add foreign key (cd_censura) REFERENCES censura(cd_censura);

alter table filme
add FOREIGN key (cd_genero) REFERENCES genero (cd_genero);

filme_atorcreate table filme_ator
(cd_filme integer,
cd_ator integer,
primary key (cd_filme, cd_ator),
foreign key (cd_filme) references filme(cd_filme),
foreign key (cd_ator) references ator(cd_ator)
);


INSERT INTO ator VALUES (1234,"Larissa");
INSERT INTO ator VALUES (4321,"Julia");
INSERT INTO ator VALUES (3421,"Lucas");
INSERT INTO ator VALUES (2341,"Roberta");
INSERT INTO ator VALUES (1534,"Regina");

INSERT INTO genero VALUES (1, "Romance");
INSERT INTO genero VALUES (2, "Ação");
INSERT INTO genero VALUES (3, "Terror");

INSERT INTO censura VALUES (1,"Maiores de 12 anos");
INSERT INTO censura VALUES (2,"Maiores de 18 anos");
INSERT INTO censura VALUES (3,"Para todas as idades");

INSERT INTO filme VALUES (123,1,1,"Um amor para recordar","Um jovem do ensino médio se apaixona pela filha do pastor e vive uma paixão cheia de surpresas", "Uma hora", "2002/01/25", "S");
INSERT INTO filme VALUES (143,3,2,"Interestelar","Cientistas querem descobrir o que acontece no buraco negro", "três horas", "2002/01/25", "S");
INSERT INTO filme VALUES (321,1,1,"A orfã","Uma série de eventos alarmantes faz com que algum mal esteja por trás do rosto angelical da filha adotada", "duas hora", "2009/07/24", "S");
INSERT INTO filme VALUES (900,1,3,"ABC do amor","Um romance inocente e infantil", "duas hora", "2008/05/14", "S");
INSERT INTO filme VALUES (156,1,3,"Ainda amo você","Um romance inocente e infantil", "duas hora", "2010/03/24", "S");

INSERT INTO filme_ator VALUES (123, 1234);
INSERT INTO filme_ator VALUES (123, 3421);
INSERT INTO filme_ator VALUES (321, 1234);
INSERT INTO filme_ator VALUES (900, 2341);

