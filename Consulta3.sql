-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-08-30 14:06:56.59

-- tables
-- Table: Candidato
CREATE TABLE Candidato (
    nr_canditato int NOT NULL,
    nm_candidato varchar(50) NOT NULL,
    nm_fantasia varchar(50) NOT NULL,
    nr_partido int NOT NULL,
    cd_cargo int NOT NULL,
    CONSTRAINT Candidato_pk PRIMARY KEY (nr_canditato)
);

-- Table: Eleitor
CREATE TABLE Eleitor (
    nm_ título int NOT NULL,
    nm_eleitor varchar(50) NOT NULL,
    cd_logradouro varchar(100) NOT NULL,
    cd_complemento int NOT NULL,
    mn_bairro varchar(50) NOT NULL,
    mn_municipio varchar(50) NOT NULL,
    nr_cep char(8) NOT NULL,
    sg_uf char(2) NOT NULL,
    dt_nascimento date NOT NULL,
    dt_comparecimento date NOT NULL,
    dt_comparecimento date NOT NULL,
    ds_escolaridade varchar(50) NOT NULL,
    CONSTRAINT Eleitor_pk PRIMARY KEY (nm_ título)
);

-- Table: Partido
CREATE TABLE Partido (
    nr_partido int NOT NULL,
    nm_partido varchar(50) NOT NULL,
    sg_partido varchar(50) NOT NULL,
    CONSTRAINT Partido_pk PRIMARY KEY (nr_partido)
);

-- Table: cargo
CREATE TABLE cargo (
    cd_cargo int NOT NULL,
    mn_cargo varchar(50) NOT NULL,
    CONSTRAINT cargo_pk PRIMARY KEY (cd_cargo)
);

-- Table: secao
CREATE TABLE secao (
    nm_secao int NOT NULL,
    nm_local varchar(50) NOT NULL,
    ds_logradouro varchar(50) NOT NULL,
    ds_complemento varchar(30) NOT NULL,
    mn_bairro varchar(30) NOT NULL,
    mn_municipio varchar(50) NOT NULL,
    sg_uf char(2) NOT NULL,
    nr_cep char(8) NOT NULL,
    nr_zona_eletoral int NOT NULL,
    Eleitor_nm_ título int NOT NULL,
    CONSTRAINT secao_pk PRIMARY KEY (nm_secao)
);

-- Table: urna
CREATE TABLE urna (
    nr_urna int NOT NULL,
    nm_modelo varchar(30) NOT NULL,
    tp_urna varchar(1) NOT NULL,
    nm_secao int NOT NULL,
    CONSTRAINT urna_pk PRIMARY KEY (nr_urna)
);

-- Table: urna_Candidato
CREATE TABLE urna_Candidato (
    nr_canditato int NOT NULL,
    nr_urna int NOT NULL,
    CONSTRAINT urna_Candidato_pk PRIMARY KEY (nr_canditato,nr_urna)
);

-- Table: voto
CREATE TABLE voto (
    dt_registro date NOT NULL,
    hr_registro time NOT NULL,
    nm_urna int NOT NULL,
    nr_canditato int NOT NULL
);

-- Table: zona_leitoral
CREATE TABLE zona_leitoral (
    nr_zona_eletoral int NOT NULL,
    sg_uf varchar(10) NOT NULL,
    nm_cartorio varchar(50) NOT NULL,
    CONSTRAINT zona_leitoral_pk PRIMARY KEY (nr_zona_eletoral)
);

-- foreign keys
-- Reference: Candidato_Partido (table: Candidato)
ALTER TABLE Candidato ADD CONSTRAINT Candidato_Partido FOREIGN KEY Candidato_Partido (nr_partido)
    REFERENCES Partido (nr_partido);

-- Reference: Candidato_cargo (table: Candidato)
ALTER TABLE Candidato ADD CONSTRAINT Candidato_cargo FOREIGN KEY Candidato_cargo (cd_cargo)
    REFERENCES cargo (cd_cargo);

-- Reference: secao_Eleitor (table: secao)
ALTER TABLE secao ADD CONSTRAINT secao_Eleitor FOREIGN KEY secao_Eleitor (Eleitor_nm_ título)
    REFERENCES Eleitor (nm_ título);

-- Reference: secao_zona_leitoral (table: secao)
ALTER TABLE secao ADD CONSTRAINT secao_zona_leitoral FOREIGN KEY secao_zona_leitoral (nr_zona_eletoral)
    REFERENCES zona_leitoral (nr_zona_eletoral);

-- Reference: urna_Candidato_Candidato (table: urna_Candidato)
ALTER TABLE urna_Candidato ADD CONSTRAINT urna_Candidato_Candidato FOREIGN KEY urna_Candidato_Candidato (nr_urna)
    REFERENCES Candidato (nr_canditato);

-- Reference: urna_Candidato_urna (table: urna_Candidato)
ALTER TABLE urna_Candidato ADD CONSTRAINT urna_Candidato_urna FOREIGN KEY urna_Candidato_urna (nr_canditato)
    REFERENCES urna (nr_urna);

-- Reference: urna_secao (table: urna)
ALTER TABLE urna ADD CONSTRAINT urna_secao FOREIGN KEY urna_secao (nm_secao)
    REFERENCES secao (nm_secao);

-- Reference: voto_Candidato (table: voto)
ALTER TABLE voto ADD CONSTRAINT voto_Candidato FOREIGN KEY voto_Candidato (nr_canditato)
    REFERENCES Candidato (nr_canditato);

-- Reference: voto_urna (table: voto)
ALTER TABLE voto ADD CONSTRAINT voto_urna FOREIGN KEY voto_urna (nm_urna)
    REFERENCES urna (nr_urna);

-- End of file.

base_eleicoesbase_eleicoescandidatocandidato