create database PraticaLivro;
use PraticaLivro;

create table Editora (
	idEditora int primary key auto_increment,
    nomeEditora varchar(40),
    cidade varchar(40),
    dataFund date
    )auto_increment=100;
    
insert into Editora values 
	(null, 'Arqueiro', 'São Paulo', '1983-12-28'),
    (null, 'Moderna', 'Rio de Janeiro', '1980-04-19'),
    (null, 'Novo Século', 'Espirito Santo', '2000-05-28'),
    (null, 'Única', 'Minas Gerais', '1954-02-17');
    
create table Autor (
	idAutor int primary key auto_increment,
    nomeAutor varchar(40),
    nacionalidade varchar(40),
    sexo enum('m','f')
    )auto_increment=200;

insert into Autor values
	(null, 'Pedro Bandeira', 'Brasileiro', 'm'),
    (null, 'Rupi Kaur', 'Indiana', 'f'),
    (null, 'David Levitan', 'Americano', 'm'),
    (null, 'Cecilia Meireles', 'Brasileira', 'f'),
    (null, 'Haruki Murakami', 'Japonês', 'm');
    
create table Livro (
	idLivro int primary key auto_increment,
    nomeLivro varchar(40),
    genero varchar(40),
    ano date,
    fkEditora int, 
    foreign key (fkEditora) references Editora(idEditora),
    fkAutor int,
    foreign key (fkAutor) references Autor(idAutor)
    )auto_increment=300;

select * from autor;
insert into Livro values 
	(null, 'A Droga da Obediência', 'aventura', '2000-02-12', 101, 200),
    (null, 'O que o sol faz com as flores', 'poesia', '2018-09-29', 102, 201),
    (null, 'Outros jeitos de usar a boca', 'poesia', '2017-03-14', 102, 201),
    (null, 'Garoto encontra garoto', 'romance', '2015-03-16', 100, 202),
    (null, 'O menino Azul', 'poesia', '2004-09-18', 102, 203),
    (null, 'Kafka a biera mar', 'misterio', '1999-02-10', 103, 204);
    
select * from editora;
select * from autor;
select *from livro; 

select l.*, nomeAutor, nacionalidade, sexo from livro as l, autor where fkAutor = idAutor;
select l.*, nomeAutor, nacionalidade, sexo from livro as l, autor where fkAutor = idAutor and genero = 'poesia';
select e.*, idLivro, nomeLivro, genero, ano, fkautor from editora as e, livro 
	where fkeditora = ideditora;

select e.*, idLivro, nomeLivro, genero, ano, fkautor from editora as e, livro 
	where fkeditora = ideditora and cidade = 'rio de janeiro';
    
select e.*, idLivro, nomeLivro, genero, ano, fkautor, nomeautor, nacionalidade, sexo 
	from editora as e, livro, autor where fkautor=idautor and fkeditora = ideditora;
    
update editora set cidade = 'Belo Horizonte' where ideditora = '100';
select * from editora;

delete from livro where idlivro = '303';
select * from livro;


    
    