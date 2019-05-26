create database PraticaPrograma;
use PraticaPrograma;

create table emissora (
	idEmissora int primary key auto_increment,
    nomeEmissora varchar(40),
    telefone char(10),
    dataNasc date)auto_increment=100;
    
insert into emissora values 
	(null, 'Globo', '91234-5667', '1954-03-12'),
    (null, 'SBT', '95463-3221', '1987-06-21'),
    (null, 'GNT', '94356-2325', '1948-04-10'),
    (null, 'PlayTV', '95430-5267', '1943-04-21'),
    (null, 'Band', '95432-0546', '1943-07-15');
    
create table programa (
	idPrograma int primary key auto_increment,
    nomePrograma varchar(40),
    genero varchar(40),
    hora time,
    fkEmissora int,
    foreign key (fkEmissora) references Emissora(idEmissora)
    )auto_increment=200;
    
insert into programa values 
	(null, 'Jornal Nacional', 'noticia', '20:00:00', 100),
    (null, 'Bom dia SP', 'noticia', '12:00:00', 100),
    (null, 'Esquadrão da Moda', 'moda', '21:00:00', 101),
    (null, 'Que Seja Doce', 'culinaria', '20:30:00', 102),
    (null, 'Decora', 'culinaria', '19:00:00', 102),
    (null, 'Bunka Pop', 'entretenimento', '11:00:00', 103),
    (null, 'Panico na Band', 'comedia', '21:00:00', 104); 
    
create table produto (
	idProduto int primary key auto_increment,
    nomeProduto varchar(40),
    marca varchar(40),
    fkPrograma int,
    foreign key (fkPrograma) references Programa(idPrograma)
    )auto_increment=300;
    
insert into produto values 
	(null, 'Caderno', 'tilibra', 205),
    (null, 'Sofá', 'Casas Bahia', 206),
    (null, 'Faca', 'Tramontina', 204),
    (null, 'Blusa', 'Renner', 203),
    (null, 'Celular', 'Samsung', 202),
    (null, 'Leite', 'Ninho', 201),
    (null, 'Shampoo', 'Pantene', 200);
    
select * from emissora;
select * from programa;
select * from produto;

select nomeEmissora, telefone from emissora where nomeEmissora like 'G%';
select * from programa order by genero desc;
select * from programa where genero like 'culinaria';
select * from emissora where nomeEmissora like '%n_';
select * from emissora order by datanasc;

update programa set genero = 'cultura pop' where idprograma = 205;
select * from programa;

select e.*, idprograma, nomeprograma, genero, hora from emissora as e, programa where fkemissora = idemissora;

select e.*, idprograma, nomeprograma, genero, hora from emissora as e, programa 
	where fkemissora = idemissora and nomeemissora = 'PlayTV';
    
select idPrograma, nomePrograma, genero, hora, idproduto, nomeproduto, marca from programa, produto
	where fkprograma = idprograma;
    
select idPrograma, nomePrograma, genero, hora, idproduto, nomeproduto, marca from programa, produto
	where fkprograma = idprograma and nomePrograma = 'Esquadrão da Moda';
    
select e.*, idPrograma, nomePrograma, genero, hora, idproduto, nomeproduto, marca from emissora as e,
	programa, produto where fkprograma = idprograma and fkemissora = idemissora;
    
delete from produto where idproduto = 301;