-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-08-30 12:58:39.955

-- tables
-- Table: aluno
CREATE TABLE aluno (
    cd_aluno int NOT NULL,
    nm_aluno varchar(50) NOT NULL,
    db_email varchar(50) NOT NULL,
    CONSTRAINT aluno_pk PRIMARY KEY (cd_aluno)
);

-- Table: area
CREATE TABLE area (
    cd_area int NOT NULL,
    mn_area varchar(30) NOT NULL,
    CONSTRAINT area_pk PRIMARY KEY (cd_area)
);

-- Table: curso
CREATE TABLE curso (
    cd_curso int NOT NULL,
    nm_curso varchar(50) NOT NULL,
    nr_horas int NOT NULL,
    cd_professor int NOT NULL,
    cd_area int NOT NULL,
    CONSTRAINT curso_pk PRIMARY KEY (cd_curso)
);

-- Table: curso_aluno
CREATE TABLE curso_aluno (
    cd_curso int NOT NULL,
    cd_aluno int NOT NULL,
    CONSTRAINT curso_aluno_pk PRIMARY KEY (cd_curso,cd_aluno)
);

-- Table: curso_disciplina
CREATE TABLE curso_disciplina (
    cd_curso int NOT NULL,
    cd_disciplina int NOT NULL,
    CONSTRAINT curso_disciplina_pk PRIMARY KEY (cd_curso,cd_disciplina)
);

-- Table: disciplina
CREATE TABLE disciplina (
    cd_disciplina int NOT NULL,
    nm_disciplina varchar(50) NOT NULL,
    db_objetivos varchar(100) NOT NULL,
    db_conteudos varchar(200) NOT NULL,
    nr_horas int NOT NULL,
    CONSTRAINT disciplina_pk PRIMARY KEY (cd_disciplina)
);

-- Table: historico_aluno
CREATE TABLE historico_aluno (
    vl_media  decimal(4,2) NOT NULL,
    fl_frequencia  char(1) NOT NULL,
    cd_aluno int NOT NULL,
    cd_turma int NOT NULL
);

-- Table: professor
CREATE TABLE professor (
    cd_professor int NOT NULL,
    nm_professor varchar(50) NOT NULL,
    db_email varchar(50) NOT NULL,
    cd_area int NOT NULL,
    CONSTRAINT professor_pk PRIMARY KEY (cd_professor)
);

-- Table: turma
CREATE TABLE turma (
    cd_turma int NOT NULL,
    dt_inicio date NOT NULL,
    dt_termino date NOT NULL,
    fl_turno char(1) NOT NULL,
    cd_disciplina int NOT NULL,
    cd_professor int NOT NULL,
    CONSTRAINT turma_pk PRIMARY KEY (cd_turma)
);

-- foreign keys
-- Reference: curso_aluno_aluno (table: curso_aluno)
ALTER TABLE curso_aluno ADD CONSTRAINT curso_aluno_aluno FOREIGN KEY curso_aluno_aluno (cd_aluno)
    REFERENCES aluno (cd_aluno);

-- Reference: curso_aluno_curso (table: curso_aluno)
ALTER TABLE curso_aluno ADD CONSTRAINT curso_aluno_curso FOREIGN KEY curso_aluno_curso (cd_curso)
    REFERENCES curso (cd_curso);

-- Reference: curso_area (table: curso)
ALTER TABLE curso ADD CONSTRAINT curso_area FOREIGN KEY curso_area (cd_area)
    REFERENCES area (cd_area);

-- Reference: curso_disciplina_curso (table: curso_disciplina)
ALTER TABLE curso_disciplina ADD CONSTRAINT curso_disciplina_curso FOREIGN KEY curso_disciplina_curso (cd_curso)
    REFERENCES curso (cd_curso);

-- Reference: curso_disciplina_disciplina (table: curso_disciplina)
ALTER TABLE curso_disciplina ADD CONSTRAINT curso_disciplina_disciplina FOREIGN KEY curso_disciplina_disciplina (cd_disciplina)
    REFERENCES disciplina (cd_disciplina);

-- Reference: curso_professor (table: curso)
ALTER TABLE curso ADD CONSTRAINT curso_professor FOREIGN KEY curso_professor (cd_professor)
    REFERENCES professor (cd_professor);

-- Reference: entity_1_aluno (table: historico_aluno)
ALTER TABLE historico_aluno ADD CONSTRAINT entity_1_aluno FOREIGN KEY entity_1_aluno (cd_aluno)
    REFERENCES aluno (cd_aluno);

-- Reference: entity_1_turma (table: historico_aluno)
ALTER TABLE historico_aluno ADD CONSTRAINT entity_1_turma FOREIGN KEY entity_1_turma (cd_turma)area
    REFERENCES turma (cd_turma);

-- Reference: professor_area (table: professor)
ALTER TABLE professor ADD CONSTRAINT professor_area FOREIGN KEY professor_area (cd_area)
    REFERENCES area (cd_area);

-- Reference: turma_disciplina (table: turma)
ALTER TABLE turma ADD CONSTRAINT turma_disciplina FOREIGN KEY turma_disciplina (cd_disciplina)
    REFERENCES disciplina (cd_disciplina);

-- Reference: turma_professor (table: turma)
ALTER TABLE turma ADD CONSTRAINT turma_professor FOREIGN KEY turma_professor (cd_professor)
    REFERENCES professor (cd_professor);

-- End of file.

