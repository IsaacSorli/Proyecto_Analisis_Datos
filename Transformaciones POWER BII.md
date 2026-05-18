
***Proyecto de final de Bootcamp de Análisis de Datos***

*Carga de datos y primeras medidas*

-Cargué los datos desde SQL, revisé las relaciones del modelo estrella y que se pudiese trabajar con los datos de todas las tablas.
-Realicé las primeras medidas manualmente para establecer mis primeros KPI (habilidad potencial y margen de mejora).


---------------------------------------------------------------------------------------------------------------------------


*Dirección del objetivo del trabajo*

-Después de darle unas vueltas a los comentarios de Guille sobre el público al que va dirigido el trabajo y el objetivo de este, entendí que, al final, era mejor dirigirlo al objetivo de armar el mejor equipo posible añadiendo las restricciones y objetivos marcados de antemano (presupuesto, características de los jugadores, nacionalidad...).
-Una vez realizado el equipo, mi objetivo es simular una temporada en múltiples ocasiones, para luego cerrar el trabajo analizando los registros y resultados.


---------------------------------------------------------------------------------------------------------------------------


*Avance con los KPI*


-Para poder estandarizar y medir a los jugadores por posición en el campo, necesito convertirlo a datos, por lo que comencé a armar KPI de cada posición del equipo (delantero, extremo, centrocampista...) y así luego poder agruparlos.
-Al terminar mi primer KPI de delantero, vi que daba un resultado ilógico y se rompía la tabla. Después de identificar el problema, vi que la forma más sencilla de solucionarlo sin tener que hacer modificaciones en mi modelo de estrella era añadir los KPI como columna añadida a la tabla de dimensiones de habilidades.
-Mi razonamiento fue el siguiente: cada jugador registrado en el juego es el hecho de la tabla de hechos y los KPI miden las habilidades de cada jugador; cada registro en habilidades pertenece al mismo registro del jugador en la tabla de hechos, por lo que si añado el KPI individualizado de cada posición en la tabla de dimensiones, será la opción más coherente y práctica.
-He hecho los KPI de cada posición en el campo.
##Preguntar a Guille por los filtros, no trabajan bien al ordenar##