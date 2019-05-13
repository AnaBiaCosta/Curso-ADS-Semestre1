create database exercicios;
use exercicios;

create table Pais (
	idPais int primary key auto_increment,
	nomePais varchar(30),
	capital varchar(30)
	)auto_increment=100;


create table Atleta (
	idAtleta int primary key auto_increment,
	nomeAtleta varchar(40),
	modalidade varchar(40),
	qntMedalhas int, 
	fkPais int,
    foreign key (fkPais) references Pais(idPais)
) auto_increment=1;

insert into Pais values 
(null, 'Japão', 'Tokyo'),
(null, 'Brasil', 'Brasilia'),
(null, 'Coreia do Sul', 'Seul'),
(null, 'Inglaterra', 'Londres'),
(null, 'França', 'Paris');

select * from Pais;

insert into Atleta values 
(null, 'Leonardo', 'Patinação', '4', '101'),
(null, 'Yuri', 'Patinação', '5', '100'),
(null, 'John', 'Golf', '2', '103'),
(null, 'Jung', 'Golf', '4', '102'),
(null, 'Bruno', 'Tenis', '1', '100'),
(null, 'Louis', 'Tenis', '6', '104'),
(null, 'Takeshi', 'Tenis', '3', '100');

select * from atleta;

select a.*, capital, nomePais from atleta as a, pais where fkPais = idPais;  
select a.*, capital, nomePais from atleta as a, pais where fkPais = idPais and nomePais = 'Japão';



