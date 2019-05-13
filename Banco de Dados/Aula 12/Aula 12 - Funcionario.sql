create database ExercicioAula12;
use ExercicioAula12;

create table departamento(
	idDepto int primary key,
    nomeDepto varchar(45),
    idGerente int, 
    dataInicioGer date
);

alter table Departamento add foreign key (idGerente) references Funcionario(idFun);
desc departamento;

insert into departamento values 
	(105, 'Pesquisa', 2, '2008-05-22'),
    (104, 'Administração', 7, '2015-01-01'),
    (103, 'Matriz', 8, '2001-06-19');
    
create table Funcionario(
	idFun int primary key,
    nomeFun varchar(30),
    salario int,
    sexo enum('m', 'f'),
    idSupervisor int,
    dataNasc date, 
    fkDepto int, 
	foreign key (fkDepto) references Departamento(idDepto)
    );
    
    alter table Funcionario add foreign key (idSupervisor) references Funcionario(idFun);
    desc funcionario;
    
    
insert into funcionario values 
	(1, 'João Silva', 3500, 'm', 2, '1985-01-09', 105),
    (2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
    (3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
    (4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
    (5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
    (6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
    (7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
    (8, 'Juliano Brito', 5500, 'm', null, '1957-11-10', 103); 

create table Projeto (
	idProj int primary key, 
    nomeProj varchar(30),
    localProj varchar(30),
    fkDepto int,
    foreign key (fkDepto) references Departamento(idDepto)
    );
    
    desc projeto;

insert into Projeto values
	(1, 'Produto X', 'Santo André', 105),
    (2, 'Produto Y', 'Itu', 105),
    (3, 'Produto Z', 'São Paulo', 105),
    (10, 'Informatização', 'Mauá', 104),
    (20, 'Reorganização', 'São Paulo',  103),
    (30, 'Benefícios', 'Mauá', 104);
    
create table FuncProj(
	fkFunc int, 
    fkProj int, 
    foreign key (fkFunc) references Funcionario(idFun),
    foreign key (fkProj) references Projeto(idProj),
    primary key (fkFunc, fkProj),
    horas decimal(3,1)
);

desc funcProj;

insert into FuncProj values
	(1, 1, 32.5),
    (1, 2, 7.5),
    (5, 3, 40.0),
    (6, 1, 20.0),
    (6, 2, 20.0),
    (2, 2, 10.0),
    (2, 3, 10.0),
    (2, 10, 10.0),
    (2, 20, 10.0),
    (3, 30, 30.0),
    (3, 10, 10.0),
    (7, 10, 35.0),
    (7, 30, 5.0),
    (4, 30, 20.0),
    (4, 20, 15.0),
    (8, 20, null);


-- Item 1
select * from departamento;
select * from funcionario;
select * from projeto;
select * from funcProj;

-- Item 2
-- O comando não vai funcionar porque o idFun não é auto_increment, assim, não pode ser null

-- Item 3
-- O comando não vai funcionar porque já existe uma funcionária Alice Sousa com o mesmo idFun 3

-- Item 4 
-- O comando não vai funcionar pois o departamento 107 não existe

-- Item 5
insert into funcionario values 
	(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
    
-- Item 6
-- O comando funcionou pois além de estarmos apagando apenas o relacionamento da funcionario com o projeto, inserimos a chave primária corretamente,
-- pois o comando delete só funciona com a chave primária, essa que no caso, é composta 
delete from FuncProj where fkproj = 3 and fkfunc = 10;

-- Item 7
-- O comando não vai funcionar devido à restrição da chave estrangeira
delete from funcionario where idfun = 4;

-- Item 8
-- O comando não vai funcionar devido à restrição da chave estrangeira
delete from funcionario where idfun = 2;

-- Item 9
update funcionario set salario = '2800' where idFun = 3;

-- Item 10 
-- O comando não vai funcionar devido à restrição da chave estrangeira com a tabela Departamento
update funcionario set fkdepto = 101 where idFun = 3;

-- Item 11
-- O comando não vai funcionar pois o departamento 107 não existe

-- Item 12
-- exibir a data de nasc e o salario do funcionario joao silva
select dataNasc, salario from funcionario where idFun= 1;

-- Item 13
-- exibir uma lista apenas dos salarios de todos os funcionarios
select dataNasc, salario from funcionario;

-- Item 14
-- exibir uma lista apenas dos salarios distintos de todos os funcionarios
select count(distinct salario) as 'Quant de salarios distintos' from funcionario;

-- Item 15
-- exibir os dados dos funcionarios ordenados pelo nome
select * from funcionario order by nomeFun;

-- Item 16
-- exibir os dados dos funcionarios ordenados pelo salario, de forma decrescente
select * from funcionario order by salario desc;

-- Item 17 
-- exibir os dados dos funcionarios que tenham o salario entre 2000 e 4000

 

    
    
    



