create database Personal;
use Personal;

create table T_Personal (
	idPersonal int primary key auto_increment,
    nomePersonal varchar(40),
    area varchar(40),
    telefone char(10),
    fkConselheiro int
    )auto_increment= 1;
    
alter table T_Personal add foreign key (fkconselheiro) references T_Personal(idPersonal);
desc t_personal;
    
insert into T_Personal (idPersonal, nomePersonal, area, telefone) values 
	(null, 'Paulo', 'Musculação', '95436-0953'),
    (null, 'Bruno', 'Pilates', '94325-7628'),
    (null, 'Fernanda', 'Boxe', '92134-7659'),
    (null, 'Chris', 'Yoga', '93210-3425');
        
update t_personal set fkConselheiro = 3 where idPersonal in (1,4);
select * from t_personal;

create table aluno (
	idAluno int primary key auto_increment,
    nomeAluno varchar(40),
    bairro varchar(40),
    dataNasc date, 
    fkPersonal int,
    foreign key (fkPersonal) references t_personal(idPersonal)
    )auto_increment=1000;
    
insert into aluno values
	(null, 'Bianca', 'Lagoa Bonita', '2000-02-18', 2),
    (null, 'José', 'Bairro B', '1998-03-20', 4),
    (null, 'Luis', 'Capão Redondo', '1994-01-30', 1),
    (null, 'Geovanna', 'Bairro C', '2001-09-20', 3),
    (null, 'Marcos', 'Jadim Belo', '1999-04-25', 4),
    (null, 'Jennifer', 'Interlagos', '2001-05-14', 2);

select * from t_personal;
select * from aluno;

select p.*, idAluno, nomeAluno, bairro, datanasc from t_personal as p, aluno where fkpersonal = idpersonal;
select p.*, idAluno, nomeAluno, bairro, datanasc from t_personal as p, aluno where fkpersonal = idpersonal 
and nomePersonal = 'chris';

select p.*, c.* from t_personal as p, t_personal as c where p.fkconselheiro = c.idPersonal;

select p.*, c.* from t_personal as p, t_personal as c where p.fkconselheiro = c.idPersonal and 
p.nomePersonal = 'paulo';

select * from t_personal;
select * from aluno;

select p.*, a.*,  c.* from aluno as a, t_personal as p, t_personal as c where a.fkpersonal = p.idpersonal and 
	p.fkconselheiro = c.idpersonal;

select p.*, idAluno, nomeAluno, bairro, datanasc, c.idpersonal, c.nomepersonal, c.area, c.telefone
from aluno as a, t_personal as p, t_personal as c where a.fkpersonal = p.idpersonal and 
	p.fkconselheiro = c.idpersonal;



p.idpersonal, p.nomepersonal, p.area, p.telefone, idaluno, nomeAluno, bairro, datanasc, p.fkconselheiro, 
c.area, c.telefone from t_personal as p, t_personal as c, aluno where p.fkconselheiro = c.idpersonal;



