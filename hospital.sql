create schema hospital;

use hospital;

create table medico
(
	crm int not null primary key,
    nome varchar(45) not null,
    email varchar(45) not null
);

create table endereço
(
	id_endereço int not null auto_increment primary key,
    logradouro varchar(45) not null,
    cep int not null,
    bairro varchar(45) not null,
    cidade varchar(45) not null,
    estado varchar(45) not null
);

create table paciente 
(
cpf char(11) not null primary key,
nome varchar(45) not null,
email varchar(45) not null,
id_endereço int,
foreign key (id_endereço) references endereço (id_endereço)
);

create table telefone 
(
id_telefone int not null primary key,
numero varchar(45) not null,
tipo varchar(45) not null,
crm int,
cpf char(11),
foreign key (crm) references medico(crm),
foreign key (cpf) references paciente(cpf)
);

create table consulta 
(
id_consulta int not null auto_increment primary key,
data_consulta datetime not null,
tipo varchar(45) not null,
crm int,
cpf char(11),
foreign key (crm) references medico(crm),
foreign key (cpf) references paciente (cpf)
);

create table plano_saude 
(
id_plano_saude int not null auto_increment primary key,
numero int not null,
tipo varchar(45) not null,
cpf char(11),
foreign key (cpf) references paciente (cpf)
);

create table medicamento 
(
id_medicamento int not null auto_increment primary key,
nome varchar(45) not null,
tipo varchar(45) not null,
posologia varchar(45) not null
);

create table exame 
(
id_exame int not null auto_increment primary key,
nome varchar(45)
);

create table prescrição
(
id_prescrição int not null auto_increment primary key,
dosagem varchar(45),
observação varchar(100),
resultado varchar(100),
id_medicamento int,
id_exame int,
foreign key (id_medicamento) references medicamento (id_medicamento),
foreign key (id_exame) references exame (id_exame)
);

