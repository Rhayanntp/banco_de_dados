drop database instagram;
create database instagram;
use instagram;

create table usuarios (
id int not null unique auto_increment primary key,
nome varchar(50) not null unique,
email varchar(100) not null unique,
data_criacao date not null
);
create table postagens (
id int not null unique auto_increment,
texto varchar(50),
data_publicacao date not null,
imagem varchar(45)
);
create table comntarios (
id int not null unique auto_increment,
texto varchar(100),
data_postagem date not null,
foreign key (postagens_id) references postagens (id),
foreign key (usuarios_id) references usuarios (id)
);
create table cutidas (
foreign key (postagens_id) references postagens (id),
foreign key (usuarios_id) references usuarios (id)
);