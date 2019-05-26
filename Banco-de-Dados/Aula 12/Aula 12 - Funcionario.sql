-- VERIFICAR ITENS 17, 

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
-- inserindo a funcionaria Cecilia Ribeiro
-- O comando não vai funcionar porque o idFun não é auto_increment, assim, não pode ser null

-- Item 3
-- inserindo a funcionaria Alice sousa com salario 2800 no sistema
-- O comando não vai funcionar porque já existe uma funcionária Alice Sousa com o mesmo idFun 3

-- Item 4 
-- inserindo a funcionaria Cecilia Ribeiro com depto 107
-- O comando não vai funcionar pois o departamento 107 não existe

-- Item 5
-- inserindo funcionaria Cecília Ribeiro
insert into funcionario values 
	(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
    
-- Item 6
-- excluindo a tupla da tabela FuncProj
-- O comando funcionou pois além de estarmos apagando apenas o relacionamento da funcionario com o projeto, inserimos a chave primária corretamente,
-- pois o comando delete só funciona com a chave primária, essa que no caso, é composta 
delete from FuncProj where fkproj = 3 and fkfunc = 10;

-- Item 7
-- excluindo tupla da tabela funcionario que está referenciada na tabela funcionario (relacionamento recursivo / auto relacionamento)
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
select * from funcionario where salario between 2000 and 4000;

-- Item 18
-- exibir os nomes e os salarios dos funcionarios cujos nomes comecam com a letra j
select * from funcionario where nomeFun like 'j%';

-- Item 19
-- exibir os nomes e os salarios dos funcionarios cujos nomes terminam com a letra a
select * from funcionario where nomeFun like '%a';

-- Item 20
-- exibir os nomes dos funcionarios que tem a letra 'n' como terceira letra do nome
select * from funcionario where nomeFun like '___n%';

-- Item 21
-- exibir os nomes e as datas de nascimento dos funcionarios cujos nomes tenham a letra s como a 5a letra de tras para frente
select nomeFun, datanasc from funcionario where nomeFun like '%s____';

-- Item 22
-- exibir os dados dos funcionarios que trabalham no depto pesquisa
select * from funcionario where fkdepto = 105;

-- Item 23
-- exibir os dados dos funcs que trabalham no depto pesquisa e tenham salario acima de 3500
select * from funcionario where fkdepto = 105 and salario > 3500;

-- Item 24
 -- exibir os dados dos funcs que trabalham no depto pesquisa e tenham o nome com inicial j
 select * from funcionario where fkdepto = 105 and nomeFun like 'j%';
 
 -- Item 25
 -- exibir o idfunc e o nome de cada func, juntamente com o idfunc e o nome do supervisor. faça com que o titulo da coluna seja idfunc 
 -- para funcionario e idsupervisor para o id do supervisor 
 
select f.idfun as idFuncionario, f.nomefun, s.idfun as idSupervisor, s.nomefun 
							from funcionario as f, funcionario as s where f.idsupervisor = s.idfun;

-- Item 26
-- exibir para cada projeto localizado em sp o id, num do departamento que o controla, nome e data de nasc do gerente
select p.idProj, d.iddepto, f.nomefun, f.datanasc from projeto as p, departamento as d, funcionario as f
				where p.fkdepto = d.iddepto and d.idgerente = f.idfun and localproj = 'são paulo' ;

-- Item 27
-- exibir o idfunc e o nome do funcionario, o projeto e o nome do projeto em que trabalha, a qtd de horas que trabalha nesse projeto
select * from funcionario as f, projeto as p, funcproj as fp where fp.fkproj = p.idproj and fp.fkfunc = f.idfun;

select f.idfun, f.nomefun, p.idproj, p.nomeproj, fp.horas from funcionario as f, projeto as p, funcproj as fp 
		where fp.fkproj = p.idproj and fp.fkfunc = f.idfun;

-- Item 28
-- exibir os nomes dos funcs que nasceram antes de 1980
select nomefun, datanasc from funcionario where datanasc < '1980';

-- Item 29
-- aplique um reajuste de 10% nos salarios dos funcionarios que trabalham no dept pesquisa
-- exemplo de como fazer: update produtos set preco_custo = preco_custo * 0.5 
select * from funcionario; 
update funcionario set salario = (salario + (salario * 0.1)) where fkdepto = 105;

-- Item 30
-- exibir a qtd de salarios diferentes q existem na empresa
select count(distinct salario) from funcionario;  

-- Item 31
-- exibir a qtd de locais deferentes de projeto
select count(distinct localProj) from projeto;  

-- Item 32
-- exibir o salario medio da empresa e a soma dos salarios
select avg(salario) as 'Salário Médio', sum(salario) as 'Soma dos Salários' from funcionario;

-- Item 33
-- exibir o menor e o maior salario da empresa
select min(salario) as 'Salário Mínimo', max(salario) as 'Salário Máximo' from funcionario;

-- Item 34
-- exibir o iddepto, o salario medio e a soma do salario de cada departamento (agrupado por depto)
select fkdepto as 'idDepto', avg(salario) as 'Salário Médio', sum(salario) as 'Soma dos Salários' from funcionario group by fkdepto;

-- Item 35
-- exibir o iddepto, o menor e o maior salario de cada departamento (agrupado por departamento)
select fkdepto as 'idDepto', min(salario) as 'Salário Mínimo', max(salario) as 'Salário Máximo' from funcionario group by fkdepto;

-- Item 36
-- inserir mais os seguintes funcionarios na tabela funcionario:
insert into funcionario values 
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', null),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', null);

-- Item 37
-- inserir mais o seguinte depto na tabela departamento
insert into departamento values 
(110, 'RH', 3, '2018-11-10');

-- Item 38
-- exibir os dados de todos os funcionarios (inclusive os que não estão alocados em nenhum departamento) e os dados dos departamento em que trabalham
select * from funcionario departamento where fkdepto = iddepto; -- dessa forma, os funcionarios que não tem departamento não aparecem
-- USAR LEFT JOIN,  | (FUNCIONARIO ----- FUNCIONARIO & DEPARTAMENTO) ----- DEPARTAMENTO |
select * from funcionario left join departamento on fkdepto = iddepto; 


-- Item 39
-- exibir os dados dos funcionarios que estão alocados em departamentos e os dados de todos os departamentos (mesmo os que não têm funcionários alocados)
-- USAR RIGHT JOIN  | FUNCIONARIO ----- (FUNCIONÁRIO & DEPARTAMENTO ----- DEPARTAMENTO |
select * from funcionario right join departamento on fkdepto = iddepto; 



 
    
    



