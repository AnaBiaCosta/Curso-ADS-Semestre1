create database ex_engenheiro;
use ex_engenheiro;

create table engenheiro(
	crea int primary key,
    nomeEng varchar(45),
    salario decimal(7,2),
    sexo enum('m','f')
);

insert into engenheiro values 
	(1010, 'Bruno Toshio', 3000, 'm'),
    (1111, 'Thais Vieira', 5000, 'f'),
    (1212, 'Camila Machado', 4000, 'f'),
    (1313, 'Carlos Eduardo', 3500, 'm');

create table Acompanhante (
	crea int,
    idAcomp int,
    primary key (crea, idAcomp),
    foreign key (crea) references Engenheiro(crea),
	nomeAcomp varchar(45),
    dataNasc date,
    parentesco varchar(45)
);

insert into Acompanhante values
	(1010, 1, 'Adriana', '1994-03-30', 'Esposa'),
    (1010, 2, 'Ana Beatriz', '2001-04-14', 'Cunhada'),
    (1111, 1, 'Ana', '1970-02-13', 'Mãe'),
    (1212, 1, 'Alexandre', '2000-12-28', 'Amigo'),
    (1212, 2, 'Pietra', '2001-11-02', 'Amiga'),
    (1313, 1, 'Pedro', '1970-05-22', 'Pai');

create table Obra(
	idObra int primary key,
    nomeObra varchar(45),
    localObra varchar(45)
)auto_increment=1000;

insert into Obra values 
	(1000, 'Escola', 'São Paulo'),
    (1001, 'Hospital', 'Rio de Janeiro'),
    (1002, 'Mercado', 'Espirito Santo'),
    (1003, 'Restaurante', 'Minas Gerais');

create table Eng_Obra(
  fkCrea int,		
  foreign key(fkCrea) references Engenheiro(crea),
  fkObra int,
  foreign key(fkObra) references Obra(idObra),
  horas date,
  primary key (fkCrea, fkObra)
); 

insert into Eng_Obra values 
	(1010, 1000, '20:00:00'),
    (1111, 1001, '15:00:00'),
    (1212, 1002, '12:00:00'),
    (1313, 1003, '10:00:00');
    

-- Item A
select * from engenheiro;
select * from obra;
select * from acompanhante;
select * from eng_obra;

-- Item B
select e.*, a.* from engenheiro as e, acompanhante as a where e.crea = a.crea;

-- Item C
select e.*, a.* from engenheiro as e, acompanhante as a where e.crea = a.crea and e.crea = 1010;

-- Item D
select e.*, a.* from engenheiro as e, acompanhante as a where e.crea = a.crea and a.parentesco like 'esposa';

-- Item E
select e.*, o.*, horas from engenheiro as e, obra as o, eng_obra where e.crea = fkcrea and o.idobra = fkobra;

-- Item F
select e.*, o.*, horas from engenheiro as e, obra as o, eng_obra where e.crea = fkcrea and o.idobra = fkobra and nomeobra = 'Hospital';

-- Item G
select e.*, a.*, o.*, horas from engenheiro as e, obra as o, acompanhante as a, eng_obra where e.crea = fkcrea 
		and e.crea = a.crea and o.idobra = fkobra;
        
-- Item H
select e.*, a.*, o.*, horas from engenheiro as e, obra as o, acompanhante as a, eng_obra where e.crea = fkcrea 
		and e.crea = a.crea and o.idobra = fkobra and nomeEng like 'Camila Machado';
        
-- Item I
select e.*, a.*, o.*, horas from engenheiro as e, obra as o, acompanhante as a, eng_obra where e.crea = fkcrea 
		and e.crea = a.crea and o.idobra = fkobra and nomeObra like 'restaurante';
        
-- Item J
select sum(salario) as 'Soma dos Salários' from engenheiro;

-- Item K
select avg(salario) as 'Média dos Salários' from engenheiro;

-- Item L
select min(salario) as 'Menor salario', max(salario) as 'Maior salario' from engenheiro;

-- Item M
select distinct salario from engenheiro;

-- Item N
select count(distinct salario) as 'Quant de salarios distintos' from engenheiro;               

	

        








