drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);


alter table pizzas add column custo decimal(15,2);
update pizzas set custo = valor * 0.60;

select * from pizzas where valor >= 17;

select * from pizzas where valor <= 17;

select * from pizzas where valor = 17;

select * from pizzas where valor != 17;
select * from pizzas where valor <> 17;

select * from pizzas where valor <=> null;
select * from pizzas where valor is null;

select * from pizzas where valor > 15 and valor < 20;
select * from pizzas where valor between 16 and 19;

select * from pizzas where valor < 17 or valor > 17;

select * from pizzas where not (valor < 17 or valor > 17);

select * from pizzas where valor >= 17 and valor <= 20;
select * from pizzas where valor between 17 and 20;

select * from pizzas where valor < 17 or valor > 20;
select * from pizzas where valor not between 17 and 20;

select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20,99);

select * from pizzas where valor is not null;
select * from pizzas where valor > 0;

select * from pizzas where nome like 'e%';
select * from pizzas where nome like '%a';
select * from pizzas where nome like '%a%';
select * from pizzas where nome like '%l%';

select * from pizzas order by nome;
select * from pizzas order by nome desc;
select * from pizzas order by valor desc, nome asc;

select * from pizzas limit 2;

select distinct valor from pizzas order by valor;



-- 9
select avg(valor) as media from pedidos;

-- 11
select max(valor) as maior_valor from pedidos;

-- 12 
select min(valor) as menor_valor from pedidos;

-- 13
select nome, count(pedidos.id) as quantidade_de_pedidos from clientes
left join pedidos on clientes.id = pedidos.cliente_id
group by nome;

-- 14
select nome, valor as maior_valor from pedidos
inner join clientes on clientes.id = pedidos.cliente_id
order by valor desc
limit 1;

-- 2
select count(*) from pedidos;

-- 6
select sum(valor) from pedidos;

-- 1
select clientes.nome, pedidos.id as pedido, clientes.nome from pedidos
inner join clientes on pedidos.cliente_id = clientes.id;

-- 3
select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos
inner join clientes on pedidos.cliente_id = clientes.id
where data > '2016-12-15';

-- 15
select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;

-- 8
select clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from clientes
inner join pedidos on pedidos.cliente_id = clientes.id
where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';

-- 16
select count(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Bruna Dantas';

-- 10
select clientes.id, clientes.nome, sum(pedidos.valor) as valor_total, count(pedidos.id) from pedidos
left join clientes on clientes.id = pedidos.cliente_id
group by clientes.id, clientes.nome;

-- 4
select count(*) as total_pedido from pedidos
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Alexandre Santos';

-- 5
select nome, telefone, pedidos.id as pedido, data, valor from clientes
right join pedidos on clientes.id = pedidos.cliente_id;

-- 7
select clientes.id, clientes.nome, sum(pedidos.valor) as valor_gasto from clientes
inner join pedidos on pedidos.cliente_id = clientes.id
group by clientes.id, clientes.nome;

-- 19
select nome, valor as menor_valor from pedidos
inner join clientes on clientes.id = pedidos.cliente_id
order by valor
limit 1;

-- 17
select max(valor) as maior, min(valor) as minimo from pedidos
inner join clientes on pedidos.cliente_id = clientes.id
where nome = 'Laura Madureira';

-- 18
select clientes.nome, sum(quantidade) as total_pizzas from itens_pedido
inner join pedidos on  itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
group by nome;

-- 20
select nome, pedidos.id as pedido, data valor from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

-- 21
select nome, sum(valor) as valor_total from clientes
left join pedidos on pedidos.cliente_id = clientes.id
group by nome;

-- 22
select nome, sum(valor) as total from pedidos
inner join clientes on clientes.id = pedidos.cliente_id
group by nome
order by valor desc
limit 3;



