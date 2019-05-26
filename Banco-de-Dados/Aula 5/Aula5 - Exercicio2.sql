create database exercicios;
use exercicios;

create table Album (
idAlbum int primary key auto_increment,
nomeAlbum varchar(40),
gravadora varchar(40)
)auto_increment=100;

create table Musica (
idMusica int primary key auto_increment,
nomeMusica varchar(40),
artista varchar(40),
genero varchar(40),
fkAlbum int,
foreign key (fkAlbum) references Album(idAlbum)
)auto_increment=1;

insert into Album values 
(null, 'Wings', 'BigHit'),
(null, 'The Day', 'JYP'),
(null, 'Dont Mess Up My Tempo', 'SM'),
(null, 'Play', 'SM');

select * from album;

insert into Musica values 
(null, 'Lie', 'Jimin', 'k-pop', 100),
(null, 'Mama', 'JHope', 'kpop', 100),
(null, 'Congratulations', 'Day6', 'j-rock', 101),
(null, 'Colors', 'Day6', 'j-rock', 101),
(null, 'Tempo', 'EXO', 'k-pop', 102),
(null, 'Ooh La La La', 'EXO', 'kpop', 102),
(null, 'Black Suit', 'Super Junior', 'kpop', 103),
(null, 'One More Chance', 'Super Junior', 'kpop', 103);

select * from musica;

select m.*, nomeAlbum, gravadora from musica as m, album where fkalbum = idalbum;
select m.*, nomeAlbum, gravadora from musica as m, album where fkalbum = idAlbum and nomeAlbum = 'The Day';
select m.*, nomeAlbum, gravadora from musica as m, album where fkAlbum = idAlbum and gravadora = 'SM';


