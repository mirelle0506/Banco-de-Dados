create schema floricultura;

use floricultura;

create table cliente
(
    id_cliente int not null auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(20) not null,
    email varchar(100) not null
);

create table local_entrega
(
    id_local_entrega int not null auto_increment primary key,
    logradouro varchar(100) not null,
    numero varchar(10) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    cep varchar(10) not null,
    complemento varchar(100)
);

create table tipo_produto
(
    id_tipo_produto int not null auto_increment primary key,
    descricao varchar(50) not null
);

create table produto
(
    id_produto int not null auto_increment primary key,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    id_tipo_produto int not null,
    foreign key (id_tipo_produto) references tipo_produto(id_tipo_produto)
);

create table encomenda
(
    id_encomenda int not null auto_increment primary key,
    data_encomenda datetime not null,
    status varchar(40) not null,
    id_cliente int not null,
    id_local_entrega int not null,
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_local_entrega) references local_entrega(id_local_entrega)
);

create table item_encomenda
(
    id_item_encomenda int not null auto_increment primary key,
    quantidade int not null,
    valor_unitario decimal(10,2) not null,
    id_encomenda int not null,
    id_produto int not null,
    foreign key (id_encomenda) references encomenda(id_encomenda),
    foreign key (id_produto) references produto(id_produto)
);
