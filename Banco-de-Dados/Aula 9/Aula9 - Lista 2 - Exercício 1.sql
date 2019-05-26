create database PraticaJogador;
use PraticaJogador;

create table Timee (
	idTimee int primary key auto_increment,
    nomeTimee varchar(40),
    nomeTecnico varchar (40),
    dataNasc date
    )auto_increment=100;
    
insert into Timee values 
	(null, 'Palmeiras', 'Luis', '1999-03-20'),
    (null, 'São Paulo', 'José', '1943-12-31'),
    (null, 'Flamento', 'Bruno', '1983-05-12'),
    (null, 'Santos', 'Felipe', '1998-02-23');

create table Jogador (
	idJogador int primary key auto_increment,
    nomeJogador varchar(40),
    posicao varchar(40),
    telefone char(10),
    fkTimee int, 
    foreign key (fkTimee) references Timee(idTimee),
    fkConselheiro int
    )auto_increment=1;
   
insert into Jogador (idJogador, nomeJogador, posicao, telefone, fkTimee) values
	(null, 'Fernando', 'Atacante', '93245-6854', 100),
    (null, 'Paulo', 'Atacante', '96543-7896', 101),
    (null, 'Guilherme', 'Centro Avante', '96548-0943', 101),
    (null, 'Gustavo', 'Atacante', '95437-2345', 102),
    (null, 'Carlos', 'Lateral', '93217-9648', 103),
    (null, 'Pedro', 'Lateral', '95438-0965', 103);
    
alter table Jogador add foreign key (fkConselheiro) references Jogador(idJogador);

update jogador set fkConselheiro = 1 where idJogador = 2;
update jogador set fkConselheiro = 2 where idJogador = 3;
update jogador set fkConselheiro = 3 where idJogador = 5;
update jogador set fkConselheiro = 4 where idJogador = 1;
update jogador set fkConselheiro = 5 where idJogador = 6;
update jogador set fkConselheiro = 6 where idJogador = 4;

select * from timee;
select * from jogador; 

select nomeTimee, nomeTecnico from timee where nomeTimee like 'p%';
select * from jogador order by posicao desc;
select * from jogador where posicao like 'atacante';
select * from timee where nometecnico like '%n_';
select * from timee order by nometecnico;

update jogador set posicao = 'Goleiro' where idjogador = 2; 
select * from jogador;

select t.*, idJogador, nomeJogador, posicao, telefone, fkconselheiro 
	from timee as t, jogador where fktimee = idtimee;
    
select t.*, idJogador, nomeJogador, posicao, telefone, fkconselheiro 
	from timee as t, jogador where fktimee = idtimee and nometimee = 'são paulo';
    
select j.*, c.nomejogador, c.posicao, c.telefone, c.fktimee 
		from jogador as j, jogador as c where j.fkconselheiro = c.idjogador;
        -- lembrando sempre que ALUNO e depois REPRESENTANTE;

select j.idjogador, j.nomejogador, j.posicao, j.telefone, j.fktimee, 
		nometimee, nometecnico, datanasc, j.fkconselheiro,
		c.nomejogador, c.posicao, c.telefone, c.fktimee
		from jogador as j, jogador as c, timee as t where j.fkconselheiro = c.idjogador and j.fktimee = idtimee;
        -- NÃO ESQUECER DE VER O APELIDO NA HORA DE IGUALAR AS COLUNAS
        
select * from jogador as j, jogador as c where j.fkconselheiro = c.idjogador;

select j.idjogador, j.nomejogador, j.posicao, j.telefone, j.fktimee, 
		nometimee, nometecnico, datanasc, j.fkconselheiro,
		c.nomejogador, c.posicao, c.telefone, c.fktimee
		from jogador as j, jogador as c, timee as t where j.fkconselheiro = c.idjogador and j.fktimee = idtimee
        and j.nomejogador = "paulo";

select * from jogador;

delete from jogador where idjogador = 1;


