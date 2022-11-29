CREATE TABLE item_orcamento (

    qt_produto integer,
    vl_produto DECIMAL(8,2),
    vl_total_item DECIMAL (8,2),
    foreign key (nr_orcamento) references orcamento(nr_orcamento),
    foreign key (cd_produto) references produto(cd_produto),
    CONSTRAINT item_orcamento_pk PRIMARY KEY (nr_orcamento,cd_produto)
);