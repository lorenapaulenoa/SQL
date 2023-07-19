create database if not exists biblioteca
character set latin1
collate latin1_spanish_ci;

use biblioteca;

create table if not exists generos
(id_genero int auto_increment primary key,
genero varchar(255) not null default'');

create table if not exists idiomas
(id_idioma int auto_increment primary key,
idioma varchar(255) not null default'');

create table if not exists autores
(id_autor int auto_increment primary key,
nombre varchar(255) not null default'',
apellidos varchar(255) not null default'');

create table if not exists editoriales
(id_editorial int auto_increment primary key,
nombre varchar(255) not null default'',
tlfno int(9) not null default 0);

alter table editoriales
drop fec_publicacion;

create table if not exists formatos
(id_formato int auto_increment primary key,
formato varchar(255) not null default'');

create table if not exists colecciones
(id_coleccion int auto_increment primary key,
coleccion varchar(255) not null default'',
ISBN_coleccion varchar (20) not null unique);


create table if not exists libros
(id_libro int auto_increment primary key,
libro varchar(255) not null default'',
ISBN varchar(20) not null unique,
volumen int (4) not null default 0,
id_genero int not null,
index(id_genero),
 foreign key (id_genero) references generos(id_genero) on update cascade on delete cascade,
id_idioma int not null,
 index(id_idioma),
 foreign key (id_idioma) references idiomas(id_idioma) on update cascade on delete cascade,
id_editorial int not null,
index(id_editorial),
 foreign key (id_editorial) references editoriales(id_editorial) on update cascade on delete cascade,
id_formato int not null,
index(id_formato),
 foreign key (id_formato) references formatos(id_formato) on update cascade on delete cascade,
id_coleccion int not null,
index(id_coleccion),
 foreign key (id_coleccion) references colecciones(id_coleccion) on update cascade on delete cascade); 


create table if not exists libros_autores
(id_libro int not null,
index (id_libro),
foreign key (id_libro) references libros (id_libro) on delete cascade on update cascade,
id_autor int not null,
index (id_autor),
foreign key (id_autor) references autores (id_autor) on delete cascade on update cascade,
primary key (id_libro,id_autor));

insert into generos (genero) values
('Narrativo'),
('Lírico'),
('Dramático'),
('Didáctico');

insert into idiomas (idioma) values
('Castellano'),
('Inglés'),
('Francés'),
('Alemán');

insert into autores (nombre, apellidos) values
('Arthur','Golden'),
('Joanne','K. Rowling'),
('Suzanne','Collins'),
('Verónica','Roth'),
('Carmen','Gil'),
('Elizabeth','Cole'),
('Antonie','de Saint-Exupery'),
('Miguel','de Cervantes Saavedra'),
('Antonio','Machado'),
('William','Shakespeare'),
('Emma','Chichester'),
('Vox Editorial',''),
('Enid','Blyton'),
('Elisabetta','Dami'),
('Antonio','Flórez Lage'),
('Arturo','Pérez-Reverte'),
('Luz','Gabás'),
('Cristina','Campos'),
('Antonio','Mercero'),
('Jorge','Díaz'),
('Agustín','Martinez');

insert into editoriales (nombre,tlfno) values
('Debolsillo',933660300),
('Salamandra Ediciones',913095343),
('Editorial Molino',932170088),
('Ediciones SM',914228800),
('Independently published',0),
('Total Book',986226317),
('Amazon',911230413),
('Albin Michel Jeunesse',142791000),
('Vox Editorial',932413505),
('CBJ',922371817),
('Alfaguara',915358190),
('Editorial Planeta',932283700),
('Pepito Pérez',927551478);

insert into formatos (formato) values
('Físico'),
('Eléctronico');

insert into colecciones (coleccion,ISBN_coleccion) values
('No colección',0),
('Colección libros Harry Potter',978-8418173196),
('Colección libros Los Juegos del Hambre',978-8427225183),
('Colección libros Divergente',978-8413144986);

  -- había olvidado añador al id_colección de la tabla libros el valor por defecto 1 ( correspondiente a 'No colección')

alter table libros
change id_coleccion id_coleccion int not null default 1;


insert into libros (libro,ISBN,volumen,id_genero,id_idioma,id_editorial,id_formato,id_coleccion)
values
('Memorias de una geisha','978-8466330077',0,1,1,1,1,1),
('Harry Potter y la piedra filosofal','978-8418173004',1,1,1,2,1,2),
('Harry Potter y la cámara secreta','978-8478884957',2,1,1,2,1,2),
('Harry Potter y el prisionero de Azkaban','978-8418173028',3,1,1,2,1,2),
('Harry Potter y el cáliz de fuego','978-8418173110',4,1,1,2,1,2),
('Harry Potter y la Orden del Fénix','978-8478887422',5,1,1,2,1,2),
('Harry Potter y el misterio del príncipe','978-8478889907',6,1,1,2,1,2),
('Harry Potter y las reliquias de la muerte','978-8418173134',7,1,1,2,1,2),
('Los Juegos del Hambre','978-8427202122',1,1,1,3,1,3),
('En llamas','978-8427202139',2,1,1,3,1,3),
('Sinsajo','978-8427202146',3,1,1,3,1,3),
('Balada de pájaros cantores y serpientes','978-8427220287',4,1,1,3,1,3),
('Divergente','978-8427201187',1,1,1,1,1,4),
('Insurgente','978-8491870562',2,1,1,1,1,4),
('Leal','978-8427206861',3,1,1,1,1,4),
('Cuatro','978-8427208063',4,1,1,1,1,4),
('Un cuento para cada letra','978-8413188409',0,4,1,4,1,1),
('Soy más fuerte que la ira','979-8521222728',0,4,1,5,1,1),
('The Little Prince','978-6079723927',0,1,2,6,1,1),
('Poesías sueltas','B006C9Y6DU',0,2,1,7,2,1),
('Poesías Completas Antonio Machado (Poesía Siglo XX nº1)','B079W9XPY7',0,2,1,7,2,1),
('Macbeth Classics Edition','B0BRKCCR6Y',0,3,2,7,2,1),
('Romeo and Juliet','B0BRKDPB4X',0,3,2,7,2,1),
('Plein d´amour à partager: Une aventure de Pop le chien','978-2226396570',0,1,3,8,1,1),
('Diccionario Pocket English','978-8499742090',0,4,1,9,1,1),
('Fünf Freunde 06. Fünf Freunde auf der Felseninsel','978-3570171646',0,1,4,10,1,1),
('Geronimo Stilton, Tome 50: Bizarres, bizarres ces fromages!','978-2226193612',0,1,3,8,1,1),
('Poesía en la memoria','B098VR9H32',0,2,1,5,1,1),
('El italiano: una novela de amor, mar y guerra ','978-8420460499',0,1,1,11,1,1),
('Lejos de Luisiana','978-8408265603',0,1,1,12,1,1),
('Historia de mujeres casadas','978-8408265610',0,1,1,12,1,1),
('Historia de mujeres casadas','978-8408265611',0,1,3,11,1,1),
('Historia de mujeres casadas','978-8408265612',0,1,4,4,1,1),
('La novia gitana','978-8420433189',0,1,1,11,1,1);

insert into libros_autores (id_libro,id_autor)values
(1,1),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,3),
(10,3),
(11,3),
(12,3),
(13,4),
(14,4),
(15,4),
(16,4),
(17,5),
(18,6),
(19,7),
(20,8),
(21,9),
(22,10),
(23,10),
(24,11),
(25,12),
(26,13),
(27,14),
(28,15),
(29,16),
(30,17),
(31,18),
(32,18),
(33,18),
(34,19),
(34,20),
(34,21);


--TABLA AUTORES
    --1.Consultar todos los autores dados de alta en nuestra base de datos
 
 select nombre,apellidos
 from autores;
 
--TABLA FORMATOS
    --1.Consultar todos los formatos dados de alta en nuestra base de datos

 select formato
 from formatos;
 
--TABLA COLECCIONES
    --1.Consultar cuántas colecciones que tenemos en nuestra biblioteca

select count(coleccion)
from colecciones; 

select coleccion
from colecciones; 
 
--TABLA IDIOMAS
    --1.Consultar todos los idiomas dados de alta en nuestra base de datos

select idioma
from idiomas; 
 
--TABLA GÉNEROS
    --1.Consultar los distintos géneros
 
 select genero
 from generos;
 
--TABLA EDITORIALES
    --1.Consultar todas las editoriales dados de alta en nuestra base de datos
 
 select nombre
 from editoriales;
 
--TABLA LIBROS
    --1.Consultar el título de los libros que tienes repetidos y el número de veces que lo tienes repetidos
 
 select libro, count(*)
 from libros
 group by libro
 having count(*)>1;
 
    --2.Consultar los títulos de los libros que tienes repetidos indicando si alguno pertenece a alguna colección
 
 select* from colecciones;
 /*
+--------------+-----------------------------------------+----------------+
| id_coleccion | coleccion                               | ISBN_coleccion |
+--------------+-----------------------------------------+----------------+
|            1 | No colección                            | 0              |
|            2 | Colección libros Harry Potter           | -8418172218    |
|            3 | Colección libros Los Juegos del Hambre  | -8427224205    |
|            4 | Colección libros Divergente             | -8413144008    |
+--------------+-----------------------------------------+----------------+
*/

 select l.libro, c.coleccion
 from libros l, colecciones c 
 where l.id_coleccion = c.id_coleccion
 and l.id_coleccion > 1
 and libro in (select libro
                from libros
                group by libro
                having count(*)>1);

------------ Los libros repetidos no pertencen a ninguna colección -------------------                

 
    --3.Consultar los títulos de los libros que están repetidos y han sido editados en distintas editoriales, su ISBN y la editorial que la ha editado 
 
 select l.libro, l.ISBN, e.nombre
 from libros l, editoriales e 
 where l.id_editorial = e.id_editorial
 and libro in (select libro
                from libros
                group by libro
                having count(*)>1);

    --4.Consultar cuál es la editorial que ha publicado más libros y cuántos libros ha publicado
 
 
select e.nombre, count(l.id_editorial)
from editoriales e, libros l 
where e.id_editorial = l.id_editorial
group by l.id_editorial
having count(l.id_editorial) = (select count(l.id_editorial)
                                from libros l 
                                group by l.id_editorial
                                order by count(l.id_editorial) desc
                                limit 1);


    --5.Consultar los títulos agrupados por formato
 
 select l.libro, f.formato
 from libros l, formatos f 
 where l.id_formato = f.id_formato
 order by formato;

    --6.Consultar los libros que hay en cada una de las colecciones
 
 select l.libro, c.coleccion
 from libros l, colecciones c 
 where l.id_coleccion = c.id_coleccion
 and c.id_coleccion not in (1);


    --7.Consultar cuántos libros tienes de un idioma distinto al castellano
 
 
 select count(id_libro)
 from libros l, idiomas i
 where l.id_idioma = i.id_idioma
 and 
 idioma not like 'Castellano';


--TABLA AUTORES_LIBROS
 
    --1.Consultar todos los títulos y autores que tienes en tu biblioteca ordenados por alfabéticamente por autor y por título

select l.libro, a.nombre, a.apellidos
from libros l, libros_autores li, autores a 
where 
    l.id_libro = li.id_libro
AND
    li.id_autor = a.id_autor
ORDER by a.nombre, a.apellidos, l.libro;

 
    --2.Consultar aquellos títulos que han sido publicados por varios autores indicando los autores que lo han escrito
 
 select l.libro, a.nombre, a.apellidos
 from libros l, libros_autores li, autores a
 where l.id_libro = li.id_libro
 and  li.id_autor = a.id_autor
 and li.id_libro in (select id_libro from libros_autores group by id_libro having count(*)>1);


    --3.Consultar todos los libros de un determinado autor

select l.libro, concat (a.nombre,' ',a.apellidos) as 'Nombre Completo'
from libros l, libros_autores li, autores a 
where l.id_libro = li.id_libro
and  li.id_autor = a.id_autor
and a.nombre like 'Antonio'
and a.apellidos like 'Machado';

   --4.Consultar si tenemos un libro de un determinado ISBN

select libro, ISBN
from libros 
where ISBN = '978-8427202146';

    --5.Consultar si tenemos un libro de un determinado autor y con un determinado ISBN
 
select l.libro, l.ISBN, concat (a.nombre,' ',a.apellidos) as 'Nombre Completo'
from libros l, libros_autores li, autores a 
where l.id_libro = li.id_libro
and  li.id_autor = a.id_autor
and a.nombre like 'Suzanne'
and a.apellidos like 'Collins'
and l.ISBN like '978-8427202146';


