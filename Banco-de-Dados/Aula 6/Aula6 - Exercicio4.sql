create database exercicios;
use exercicios;

create table Dentista(
	idDentista int primary key auto_increment,
    nomeDentista varchar(40),
    email varchar(40)
)auto_increment=100;

insert into Dentista values 
	(null, 'Paula', 'paula@dentista.com'),
	(null, 'Marcos', 'marcos@dentista.com'),
	(null, 'Liane', 'liane@dentista.com'),
	(null, 'Fernanda', 'fernanda@dentista.com');

select * from dentista;

create table paciente(
	idPaciente int primary key auto_increment,
    nomePaciente varchar (40),
    idade int,
    fkdentista int,
    foreign key (fkdentista) references dentista(iddentista)
    )auto_increment=200;
    
insert into paciente values 
	(null, 'Bia', 18, 102),
    (null, 'Helen', 19, 103),
    (null, 'Lucas', 23, 100),
    (null, 'Luis', 43, 101),
    (null, 'Diego', 20, 102);
    
select * from dentista;
select * from paciente;

select * from dentista where nomeDentista like '%a';

select p.*, nomedentista, email from paciente as p, dentista where fkdentista = iddentista;

update paciente set idade = 29 where idpaciente = 201;

select * from paciente;
delete from paciente where idpaciente = 203;





    


