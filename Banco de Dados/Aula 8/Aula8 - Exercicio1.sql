create database petshop;
use petshop;


create table cliente(
	idCliente int primary key auto_increment, 
    nomeCliente varchar(40),
    telefone char(10),
    sexo enum('m','f'),
    bairro varchar(30)
) auto_increment=1;


create table pet (
	idPet int primary key auto_increment,
	nomePet varchar(20),
	tipo varchar(15),
	raca varchar (15),
	dataNasc date,
	fkCliente int, 
	foreign key (fkCliente) references Cliente (idCliente)
)auto_increment=101;


insert into cliente values
(null, 'Fernanda Caramico', '94568-4356', 'f', 'Parque Jaçatuba'),
(null, 'Bia Costa', '94806-0747', 'f', 'Chác St Maria'),
(null, 'Geovanna Oliveira', '95463-0956', 'f', 'Jardim Angela'),
(null, 'Aron Kim', '94553-9650', 'm', 'Bom Retiro'),
(null, 'Mauricio Oliveira', '95564-4432', 'm', 'Santo André');

insert into pet values 
(null, 'Mia', 'Gato', 'Siames', '2018-04-04', 1),
(null, 'Duquesa', 'Cachorro', 'Poodle', '2009-03-30', 2),
(null, 'Yuki', 'Gato', 'Ragdoll', '2018-04-14', 2),
(null, 'Floquinho', 'Hamster', 'Chinês', '2017-06-24', 3),
(null, 'Leão', 'Cachorro', 'Akita', '2014-08-19', 3),
(null, 'Loop', 'Cachorro', 'Pug', '2018-04-21', 4),
(null, 'Thor', 'Gato', 'Persa', '2015-05-30', 5);

select * from pet;
select * from cliente;

alter table Cliente modify nomeCliente varchar(50);
desc cliente;

select p.*, nomeCliente, telefone, sexo, bairro from Pet as p, Cliente where fkCliente = idCliente and p.tipo = 'Cachorro';

select * from pet where tipo like 'Cachorro';
select nomePet, datanasc from pet;
select * from pet order by nomePet;
select * from cliente order by bairro desc;
select * from pet where nomepet like 'L%';
select * from cliente where nomecliente like '% oliveira';

update cliente set telefone = 932000954 where idCliente=5;
select * from cliente;

select p.*, nomeCliente, telefone, sexo, bairro from Pet as p, Cliente where fkCliente = idCliente;

select * from cliente where sexo like 'f';

alter table cliente drop sexo;
select * from cliente;

delete from pet where idpet = 103;
select * from pet;

drop table pet;
drop table cliente;




