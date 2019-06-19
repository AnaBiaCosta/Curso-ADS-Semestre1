create database aula13;
use aula13;

create table Grupo(
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(30),
    descricao varchar(50)
)auto_increment = 1;

insert into Grupo values 
	(null, 'Cimentool', 'Construção Civil'),
    (null, 'Smart Museum', 'Museu'),
    (null, 'Heat Watch', 'Relógio'),
    (null, 'Paiotnela', 'Panela de Pressão');
    
    
create table Professor(
	idProf int primary key auto_increment,
    nomeProf varchar(30),
    disciplina varchar(30)
)auto_increment = 10000;

insert into Professor values 
	(null, 'Yoshi', 'Algoritmo'),
    (null, 'Marise', 'Arquitetura Computacional'),
    (null, 'Célia', 'Banco de Dados'),
    (null, 'Brandão', 'Pesquisa e Inovação'),
    (null, 'Alex', 'Tecnologia da Informação');


create table Aluno(
	ra int primary key,
    nomeAluno varchar(30),
    email varchar(50),
    fkGrupo int, 
    foreign key(fkGrupo) references Grupo(idGrupo)
);

insert into Aluno values
	('01191000', 'Bia', 'bia@gmail.com', 1),
    ('01191034', 'Vitoria', 'vitoria@gmail.com', 1),
    (01191073, 'Fernanda', 'fernanda@gmail.com', 2),
    (01191026, 'Marcos', 'marcos@gmail.com', 2),
    (01191068, 'Aron', 'aron@gmail.com', 3),
    (01191032, 'Francisco', 'franscisco@gmail.com', 3),
    (01191089, 'Larissa', 'larissa@gmail.com', 4),
    (01191041, 'Michele', 'michele@gmial.com', 4);

create table Grupo_Prof(
	fkGrupo int,
    foreign key (fkGrupo) references Grupo(idGrupo),
    fkProf int,
    foreign key (fkProf) references Professor(idProf),
    data_hora datetime,
    nota int, 
    primary key (fkGrupo, fkProf)
);

insert into Grupo_Prof values 
	(1, 10000, '2019-07-03 15:00:00', 10),
    (1, 10003, '2019-07-03 15:00:00', 10),
    (2, 10000, '2019-07-03 13:30:00', 10),
    (2,  10002, '2019-07-03 13:30:00', 10),
	(3, 10004, '2019-07-03 16:00:00', 9),
    (3, 10001, '2019-07-03 16:00:00', 8),
    (4, 10003, '2019-07-03 18:30:00', 8),
    (4, 10002, '2019-07-03 18:30:00', 8);
    
    
-- Mostrando os dados de todas tabelas separadamente    
select * from Grupo;
select * from Professor;
select * from Aluno;
select * from Grupo_Prof;


-- Alunos e Cursos
select * from grupo, aluno where fkGrupo = idGrupo;
select ra, nomeAluno, email, grupo.* from aluno, grupo where fkgrupo = idGrupo;


-- Algum grupo específico
select ra, nomeAluno, email, grupo.* from aluno, grupo where fkgrupo = idGrupo and nomeGrupo = 'Cimentool';


-- Média das notas
select avg(nota) as 'Média das Notas' from Grupo_Prof;


-- Nota mínima e máxima
select min(nota) as 'Nota Mínima', max(nota) as 'Nota Máxima' from Grupo_Prof;


-- Soma das notas
select sum(nota) as 'Soma das Notas' from Grupo_Prof;

-- Dados dos professores, dos grupos, data e horário
select professor.*, grupo.*, data_hora from professor, grupo, grupo_prof where
	fkGrupo = idGrupo and fkProf = idProf;


-- Dados dos professores, dos grupos, data e horário de um grupo específico
select professor.*, grupo.*, data_hora from professor, grupo, grupo_prof where
	fkGrupo = idGrupo and fkProf = idProf and nomeGrupo = 'Smart Museum';
    

-- Nomes dos grupos que foram avaliados por um determinado professor
select nomeGrupo, nomeProf from Grupo, Professor, grupo_prof 
		where fkGrupo = idGrupo and fkProf = idProf and fkProf = '10000'; -- aparece o nome do professor
            
select nomeGrupo from Grupo, Professor, grupo_prof 
		where fkGrupo = idGrupo and fkProf = idProf and fkProf = '10000'; -- sem o nome do professor
        

-- Nome dos professores que avaliaram um determinado aluno
select a.nomeAluno from Aluno as a, Professor, Grupo, Grupo_Prof as gp
	where a.fkGrupo = idGrupo
    and gp.fkGrupo = idGrupo
    and gp.fkProf = idProf
    and nomeProf = 'Yoshi';
	

-- Nome dos professores que avaliaram um determinado grupo
select nomeProf from Professor, Grupo as g, Grupo_Prof as gp
	where gp.fkGrupo = idGrupo
    and gp.fkprof = idProf
    and nomeGrupo = 'Cimentool';
    

-- Dados dos grupos, alunos, professores, data e horario
select * from grupo, aluno as a, professor, grupo_prof as gp
	where a.fkGrupo = idGrupo
    and gp.fkgrupo = idgrupo
    and gp.fkprof = idProf; -- todas as informações, sem filtrar
    

select grupo.*, a.ra, a.nomeAluno, a.email, professor.*, data_hora 
	from grupo, aluno as a, professor, grupo_prof as gp
    where a.fkGrupo = idGrupo
    and gp.fkgrupo = idgrupo
    and gp.fkprof = idProf;
    

-- Notas distintas
select distinct(nota) from grupo_prof;


-- Professor, media e soma das notas
select idProf, round(avg(nota),2) as 'Média das notas', sum(nota) as 'Soma das Notas'
	from Professor, Grupo_Prof
    where fkProf = idProf 
    group by idProf;


-- Grupos, média e soma das notas
select sum(nota) as 'Soma das Notas', avg(nota) as 'Média das Notas' from grupo_prof order by group;


	

-- Grupo, média e soma das notas
select idGrupo, round(avg(nota),2) as 'Média das Notas', sum(nota) as 'Soma das Notas'
	from Grupo, Grupo_Prof 
    where fkGrupo = idGrupo
    group by idGrupo;
    
    
-- Professor, menor e maior nota atribuída
select idProf, min(nota) as 'Menor Nota', max(nota) as 'Maior Nota'
	from Professor, Grupo_Prof
    where fkProf = idProf
    group by idprof;
    
    
-- Grupo, menor e maior nota
select idGrupo, min(nota) as 'Menor Nota', max(nota) as 'Maior Nota'
	from Grupo, Grupo_Prof
    where fkGrupo = idGrupo
    group by idGrupo;

    


 



    
