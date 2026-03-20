create schema analitica;
set search_path to analitica; 

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
--CREAMOS TABLAS DE DIMENSIONES--
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--DIMENSION JUGADOR--

create table analitica.dim_jugadores as 
select distinct
    jh."Futbolista_ID", 
    jh."Nombre",
    jh."Apellidos",
    jh."Fecha de nacimiento",
    jh."Edad",
    pd."Habilidad Actual (200)",
    pd."Habilidad Potencial (200)"
from "PF".jugadores_hechos jh
inner join "PF".potencial_dimensiones pd 
on jh."Futbolista_ID" = pd."Futbolista_ID";  -- Hago Inner porque con el join normal, los null no me dejaban hacer que la pk funcionase.

-- Agrego PK, ahora si funciona porque no hay null con el JOIN.
ALTER TABLE analitica.dim_jugadores 
ADD PRIMARY KEY ("Futbolista_ID");


select * from analitica.dim_jugadores;

--DIMENSION EQUIPO--

--select  * from jugadores_hechos;

create  table analitica.dim_equipos as
select distinct
	jh."Equipo"
from "PF".jugadores_hechos jh
where jh."Equipo" is not null and jh."Equipo" != '';
	

alter table analitica.dim_equipos
add column equipo_id serial primary key;
	
select * from analitica.dim_equipos;

--DIMENSION POSICION--

--select * from jugadores_hechos;
create table analitica.dim_posiciones as 
select distinct
	jh."Posicion"
from "PF".jugadores_hechos jh
where jh."Posicion" is not null and jh."Posicion" != '';

alter table analitica.dim_posiciones
add column posicion_id serial primary key;

--DIMENSION NACIONALIDAD-- --AY--

create table analitica.dim_nacionalidades as
with todas_nacionalidades as (
    select distinct jh."Nacionalidad 1" as nacionalidad
    from "PF".jugadores_hechos jh
    where jh."Nacionalidad 1" is not null and jh."Nacionalidad 1" != ''
    
    union
    
    select distinct jh."Nacionalidad 2" as nacionalidad
    from "PF".jugadores_hechos jh
    where jh."Nacionalidad 2" is not null and jh."Nacionalidad 2" != ''
    
    union
    
    select distinct jh."Nacionalidad 3" as nacionalidad
    from "PF".jugadores_hechos jh
    where jh."Nacionalidad 3" is not null and jh."Nacionalidad 3" != ''
)
select distinct 
    nacionalidad,
    row_number() over (order by nacionalidad) as nacionalidad_id
from todas_nacionalidades
where nacionalidad is not null 
  and nacionalidad != ''
order by nacionalidad;

-- Establecer la clave primaria
alter table analitica.dim_nacionalidades 
add primary key (nacionalidad_id);

--SELECT * FROM analitica.dim_nacionalidades

--DIMENSION NACIONALIDAD TABLA PUENTE-- --AY--

create table analitica.rel_jugador_nacionalidad as
select 
    jh."Futbolista_ID" as jugador_id,
    n.nacionalidad_id,
    case 
        when jh."Nacionalidad 1" = n.nacionalidad then 'Principal'
        when jh."Nacionalidad 2" = n.nacionalidad then 'Secundaria'
        when jh."Nacionalidad 3" = n.nacionalidad then 'Terciaria'
    end as tipo_nacionalidad
from "PF".jugadores_hechos jh
cross join analitica.dim_nacionalidades n
where (jh."Nacionalidad 1" = n.nacionalidad 
    or jh."Nacionalidad 2" = n.nacionalidad 
    or jh."Nacionalidad 3" = n.nacionalidad);

-- Añadir clave primaria compuesta
alter table analitica.rel_jugador_nacionalidad 
add primary key (jugador_id, nacionalidad_id);

-- Añadir claves foráneas
alter table analitica.rel_jugador_nacionalidad 
add constraint fk_jugador 
foreign key (jugador_id) 
references analitica.dim_jugadores ("Futbolista_ID");

alter table analitica.rel_jugador_nacionalidad 
add constraint fk_nacionalidad 
foreign key (nacionalidad_id) 
references analitica.dim_nacionalidades (nacionalidad_id);



-------------------------------------------------------------------------
-------------------------------------------------------------------------
--HECHOS--
--select* from jugadores_hechos;
create table analitica.hechos_jugadores as 
select
    jh."Futbolista_ID" as jugador_id,
    eq.equipo_id,
    pos.posicion_id,
    jh."Sueldo (Anual)" as sueldo_anual,
    jh."Apariciones con la selección nacional" as internacionalidades,
    jh."Goles con la selección nacional" as goles_seleccion,
    jh."Edad",
    case
        when jh."Edad" < 21 then 'Sub-21'
        when jh."Edad" between 21 and 26 then 'Jugador joven'
        when jh."Edad" between 27 and 31 then 'Jugador en su prime'
        when jh."Edad" >= 32 then 'Veterano'
    end as "Experiencia jugador"
from "PF".jugadores_hechos jh
left join analitica.dim_equipos eq 
on jh."Equipo" = eq."Equipo"  
left join analitica.dim_posiciones pos 
on jh."Posicion" = pos."Posicion";

------------------------------------------------------
--AÑADIR CLAVE PRIMARIA Y RELACIONES--

delete from analitica.hechos_jugadores
where jugador_id is null;
alter table analitica.hechos_jugadores
add primary key (jugador_id);

------------------------------------------------------
--Relaciones FK--
------------------------------------------------------
alter table analitica.hechos_jugadores
add constraint fk_equipo
foreign key (equipo_id) references dim_equipos(equipo_id);

alter table analitica.hechos_jugadores
add constraint fk_posicion
foreign key (posicion_id) references dim_posiciones(posicion_id);

alter table analitica.rel_jugador_nacionalidad
add constraint fk_rel_hechos
foreign key (jugador_id) references analitica.hechos_jugadores (jugador_id);


-----------------------------------------------------------------
--QUIERO AÑADIR VARIAS DIMENSIONES DE FISICO MAS A DIM_JUGADORES, COMO HAY RELACIONES, NO PUEDO DROPEAR
-----------------------------------------------------------------

select * from fisico1_dimensiones;
select * from analitica.dim_jugadores;
alter table analitica.dim_jugadores 
add column "Altura(cm)" integer,
add column "Peso(kg)" integer,
add column "Pierna Izquierda" integer,
add column "Pierna derecha" integer;

update analitica.dim_jugadores dj
set 
    "Altura(cm)" = fd."Altura(cm)",      
    "Peso(kg)" = fd."Peso(kg)",          
    "Pierna Izquierda" = fd."Pierna Izquierda",  
    "Pierna derecha" = fd."Pierna derecha"       
from "PF".fisico1_dimensiones fd
where dj."Futbolista_ID" = fd."Futbolista_ID";

--Modifico nombre de columnas--
alter table dim_jugadores
rename column "Pierna Izquierda" to "Pierna Izquierda (20)";

alter table dim_jugadores
rename column "Pierna derecha" to "Pierna Derecha (20)";

--Modifico nombre de tabla--

alter table dim_jugadores 
rename to dim_informacion;


--------------------------------------------------------------------
--------------------------------------------------------------------
--Quiero hacer una nueva tabla de dimensiones con todas las habilidades visibles.
--PK como Futbolista ID--

create table analitica.dim_habilidades_visibles as
select 
    hv.*
from "PF".habilidades_visibles_dimensione hv;

delete from analitica.dim_habilidades_visibles 
where "Futbolista_ID" is null;

alter table analitica.dim_habilidades_visibles 
add primary key ("Futbolista_ID");

--Hago la relación de tablas

alter table analitica.dim_habilidades_visibles
add constraint fk_habilidades_visibles
foreign key ("Futbolista_ID") references analitica.hechos_jugadores (jugador_id);


----------------------------------------------------------------
----------------TEST-------------

select * from dim_informacion;
select * from hechos_jugadores;
select * from rel_jugador_nacionalidad rjn 
