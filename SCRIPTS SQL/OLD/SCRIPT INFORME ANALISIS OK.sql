--QUERY SQL INFORME--

--Query representativas sobre

•	--¿Como impacta la edad en las posiciones de los jugadores? OK [subconsulta de JOIN]

select 
dp."Posicion", 
count(*) as "Recuento posicion", 
round(pos_avg.media_edad, 2) as media_edad
from dim_posiciones dp 
join hechos_jugadores hj 
on dp.posicion_id = hj.posicion_id
join (
    select posicion_id, avg("Edad") as media_edad
    from hechos_jugadores
    group by posicion_id
) pos_avg on dp.posicion_id = pos_avg.posicion_id
group by dp."Posicion", pos_avg.media_edad;

•	--¿Como se relacionan las características físicas de los jugadores en sus posiciones? ejemplo extremos CON ACELERACIÓN, REGATE Y VELOCIDAD MAXIMA.



select 
dp."Posicion", count(*) as "Recuento posicion", test.Aceleracion_promedio, test.Velocidad_maxima_promedio, test.Regate_promedio
from hechos_jugadores hj 
join dim_posiciones dp on dp.posicion_id = hj.posicion_id
cross join (  
    select 
    avg("Aceleración") as Aceleracion_promedio, 
    avg("Velocidad maxima en carrera") as Velocidad_maxima_promedio, 
    avg("Regate") as Regate_promedio
    from dim_habilidades_visibles
) test
where dp."Posicion" = 'EXTREMO'
group by dp."Posicion", test.Aceleracion_promedio, test.Velocidad_maxima_promedio, test.Regate_promedio;


--Query para comparar valores de la anterior con los mejores del mundo en su posición.
select distinct di."Nombre" ,di."Apellidos",dhv."Aceleración", dhv."Velocidad maxima en carrera" , dhv."Regate", rj."Reputación mundial(9999)"     
from dim_informacion di 
join rel_jugador_nacionalidad rjn  
on di."Futbolista_ID" = rjn.jugador_id 
join hechos_jugadores hj 
on rjn.jugador_id = hj.jugador_id 
join reputacion_jugadores rj 
on rj."Futbolista_ID" = hj.jugador_id 
join dim_habilidades_visibles dhv 
on dhv."Futbolista_ID" = hj.jugador_id 
join dim_posiciones dp 
on dp.posicion_id = hj.posicion_id 
where dp."Posicion" = 'EXTREMO'
and rj."Reputación mundial(9999)" >7500
order by "Reputación mundial(9999)" DESC ;