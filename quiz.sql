--Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos.

create table preguntas (id int primary key, Pregunta varchar(255), R_correcta varchar );

insert into preguntas values 
(1,'¿Quién escribió "Don Quijote de la Mancha"?','Miguel de Cervantes'),
(2, '¿Cuál es el río más largo del mundo?', 'Amazonas'),
(3, '¿Cuál es el océano más grande del mundo?', 'Pacífico'),
(4, 'Si 50 es el 100%, ¿cuánto es el 90%?', '45'),
(5, '¿Cuál es el nombre del proceso mediante el cual las plantas convierten la luz solar en energía?', 'Fotosíntesis');

select * from preguntas;

-- Tabla Usuarios
create table Usuarios (id int primary key, Nombre varchar (255), Edad int);
insert into Usuarios values 
(1, 'Pedro', 36),
(2, 'Juan', 27),
(3, 'Sofía', 13),
(4, 'Ana', 41),
(5, 'Alex', 19);

select * from Usuarios;

-- Tabla intermedia Respuestas
create table Respuestas (id_respuesta serial primary key, respuesta varchar, usuario_id int, pregunta_id int,
constraint fk_usuario foreign key (usuario_id) references Usuarios (id), 
constraint fk_pregunta foreign key (pregunta_id) references Preguntas(id));

--pregunta 1
insert into Respuestas (respuesta, usuario_id, pregunta_id) values 
('No constesta', 1, 1),
('Miguel de Cervantes', 2, 1),
('No sabe', 3, 1),
('Miguel de Cervantes',4, 1),
('Homero', 5, 1);

--pregunta 2
insert into Respuestas (respuesta, usuario_id, pregunta_id) values 
('Nilo', 1, 2),
('Nilo', 2, 2),
('Amazonas', 3, 2),
('Ganges',4, 2),
('Nilo', 5, 2);

--pregunta 3
insert into Respuestas (respuesta, usuario_id, pregunta_id) values 
('Atlántico', 1, 3),
('Antártico', 2, 3),
('Antártico', 3, 3),
('Ártico',4, 3),
('Ártico', 5, 3);

--Pregunta 4
insert into Respuestas (respuesta, usuario_id, pregunta_id) values 
('90', 1, 4),
('40', 2, 4),
('No sabe', 3, 4),
('35',4, 4),
('No sabe', 5, 4);

--pregunta 5
insert into Respuestas (respuesta, usuario_id, pregunta_id) values 
('Alimentación lumínica', 1, 5),
('Fotosíntesis', 2, 5),
('Fotosíntesis', 3, 5),
('Fotosíntesis',4, 5),
('No sabe', 5, 5);

select * from Respuestas;


-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).
select COUNT(respuesta), usuario_id from respuestas join Preguntas on preguntas.r_correcta = respuestas.respuesta group by usuario_id;


--7.Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.
select COUNT(usuario_id), pregunta from respuestas right join preguntas on preguntas.r_correcta = respuestas.respuesta group by id order by id;

--8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.
create table Respuestas (id_respuesta serial primary key, respuesta varchar, usuario_id int, pregunta_id int,
constraint fk_usuario foreign key (usuario_id) references Usuarios (id) on delete cascade, 
constraint fk_pregunta foreign key (pregunta_id) references Preguntas(id));

delete from usuarios where id = 1;
delete from usuarios where id = 5;

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

alter table usuarios add check (edad >=18);
delete from usuarios where edad <=18;

insert into Usuarios values 
(6, 'Marta', 30);

-- 10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único.
alter table usuarios add column email varchar unique;
select * from usuarios;

update usuarios set email = 'juan@email.com' where id= 2;
