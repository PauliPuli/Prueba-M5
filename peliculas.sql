create table peliculas (id int primary key, pelicula varchar (255), anno int);

create table tags (id int primary key, tag varchar (30));



--Insertaremos películas a la tabla película.
insert into peliculas values 
(1,'Wall-E', 2008),
(2, 'Parásitos', 2019),
(3, '¡Adiós, Lenin!', 2003),
(4,'Orgullo y prejuicio',2005),
(5, 'E.T', 1982);

select * from peliculas;

--Insertamos los tags en la tabla tag

insert into tags values
(1, 'Ciencia Ficción'),
(2, 'Comedia'),
(3, 'Romance'),
(4, 'Drama'),
(5, 'Humor negro');

select * from tags;

--Tabla intermedia
create table tagxpelicula (id_pelicula int, id_tag int, constraint fk_pelicula foreign key (id_pelicula) references peliculas (id), constraint fk_tag foreign key (id_tag) references tags (id));

select * from tagxpelicula;

insert into tagxpelicula values
(1,1), (1,2), (1,3),
(2, 4), (2,5),
(3,2), (3,4),
(4,3), (4,4),
(5,1), (5,2),(5,4);

--Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.

select pelicula, COUNT(id_tag) from tagxpelicula join peliculas on peliculas.id = tagxpelicula.id_pelicula group by pelicula;
