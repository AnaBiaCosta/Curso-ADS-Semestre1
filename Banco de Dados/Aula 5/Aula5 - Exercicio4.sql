create database formatura;
use formatura;

create table projeto (
	idProjeto int primary key auto_increment, 
    nomeProjeto varchar (40), 
    descProjeto varchar (100)
)auto_increment = 200;


create table aluno (
	ra int primary key auto_increment,
    nomeAluno varchar (40),
    telefone char (10),
    fkProjeto int,
    foreign key (fkProjeto) references Projeto (idProjeto),
    fkRepresentante int, 
    foreign key (fkRepresentante) references Aluno (ra)
)auto_increment=1;


create table acompanhante (
	ra int, 
    idAcomp int,
    primary key (ra, idAcomp),
    foreign key (ra) references aluno (ra),
    nomeAcomp varchar(40),
    parentesco varchar(20)
);


insert into projeto values 
(null, 'Cimentool', 'Construção Civil'),
(null, 'Via Láctea', 'Doação de Leite Materno'),
(null, 'Vaicina', 'Vacinação');


insert into aluno (ra, nomeAluno, telefone, fkProjeto) values 
(null, 'Bia Costa', '94806-0747', 200),
(null, 'Fernanda Caramico', '95435-4564', 201),
(null, 'Geovanna Oliveira', '95432-4567', 202), 
(null, 'Luis Fernando', '94332-5467', 200),
(null, 'Marcos Paulo', '98544-9344', 201);


update aluno set fkRepresentante = 1 where ra in (1, 2, 3, 4, 5);


insert into acompanhante values 
(1, 1, 'Adriana', 'Irmã'),
(1, 2, 'Maria', 'Mãe'),
(2, 3, 'Mariana', 'Ana Maria'),
(2, 4, 'Jorge', 'Pai'),
(3, 5, 'Julia', 'Mãe'),
(3, 6, 'Paula', 'Mãe'),
(4, 8, 'Bruno', 'Amigo'),
(5, 9, 'Pedro', 'Pai'),
(5, 10, 'Vitóra', 'Amiga');


select * from aluno;
select * from projeto;
select * from acompanhante;

select a.*, nomeProjeto, descProjeto from aluno as a, projeto where fkprojeto = idprojeto;
select a.*, nomeAcomp, parentesco from aluno as a, acompanhante as ac where a.ra = ac.ra;

select a.ra, a.nomeAluno, a.telefone, a.fkprojeto, a.fkrepresentante, b.nomeAluno, b.telefone, 
		b.fkprojeto from aluno as a, aluno as b where a.fkrepresentante = b.ra; 
        -- Lembrar que A = ALUNOS e B = REPRESENTANTE ou seja, UM representante Tem VÁRIOS alunos
        -- A.UMALUNO = B.REPRESENTANTE (pois ele está para vários alunos)
        
select a.*, nomeProjeto, descProjeto from Aluno as a, projeto where fkProjeto = idProjeto and nomeProjeto = 'Cimentool';

select a.nomeAluno, a.telefone, a.fkrepresentante, p.*, ac.nomeAcomp, ac.parentesco 
		from aluno as a, projeto as p, acompanhante as ac where a.ra = ac.ra and fkprojeto = idprojeto; 

        
        










    


