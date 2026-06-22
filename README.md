***Proyecto de final de Bootcamp Análisis de Datos***


***Información, objetivos y estructura***


*Información*

- Football Manager 2023 es un videojuego de Sports Interactive y Sega. Consiste en un simulador de dirección deportiva con una extensa base de datos, la cual se involucra directamente en la simulación y el funcionamiento de la partida.

- Cada futbolista registrado cuenta con una serie de valores numéricos distribuidos en sus habilidades, los cuales están directamente relacionados con la simulación de los partidos. Cuanto más altos son los números, mejores son sus características y tienden a tener mejores registros.



*Objetivos*


- El principal objetivo del proyecto es organizar un equipo titular con el cual, usando herramientas de análisis de datos, podamos maximizar su rendimiento y estudiar su impacto en el equipo.

- Para conseguir ese objetivo, nos tendremos que ceñir a las mismas normas que los equipos de la Primera División española y también a ciertas limitaciones, para poder afrontar la construcción de este equipo de una forma más equilibrada y realista.

- Otros objetivos serán la búsqueda de patrones relacionados con sus habilidades por posición, edad, salario o incluso nacionalidad, y ver si estos afectan a los jugadores.


*Estructura*

- El proyecto consta de varias partes. La primera sirve como introducción a los conceptos de este videojuego: qué es, cómo funciona, los objetivos y su motivación.

- Una segunda parte centrada en los procesos de limpieza y adaptación del conjunto de datos, su transformación para trabajar con varias herramientas y, finalmente, su carga en Power BI para ser graficado.

- La tercera parte se centra en la estadística y otras técnicas analíticas utilizadas para trabajar en la búsqueda e interpretación de patrones.

- La cuarta parte consta de los resultados de la elección del equipo. Se han simulado 100 temporadas para tener una muestra y poder interpretar los resultados.

- La última parte son las conclusiones del proyecto.


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

***DIARIO DE AVANCES***

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

***Actualizaciones y avance***

*Tareas pendientes de hacer: (Update 05/03/2026)*

- Hacer el diccionario del dataset (Prioridad Baja)

- Hacer carga del dataset a SQL (Prioridad Alta)

- Crear vistas del dataset desde SQL (Prioridad Alta)

- Cargar vistas de SQL a Power BI (Resolver antes prioridad Alta)

- Revisar los KPI seleccionados (Resolver antes prioridad Alta)

- Planificar esquema de estructura en los dashboards (Resolver antes prioridad Alta)

- Hacer los dashboards (Resolver antes prioridad Alta)


---------------------------------------------------------------------------------------------------------------------------

Hablado con el profe 05/03/2026

- Pasar el formato a .md

- Visualizar la tabla de dimensiones mas reducida sobre las dimensiones que me llevaran a mis kpi / evitar dolores de cabeza con tablas enormes.

- Separar en Excel varios archivos por cada tabla y luego cargarlas, es otro camino.

- Pasar transaccional/luego estrella/ dimensiones.

- visualizar KPI para reducir las dimensiones a las que usaré.

---------------------------------------------------------------------------------------------------------------------------

Actualización ideas y cambio de dirección 13/05/2026

- Lo hablado en clase y dandole vueltas al objetivo del trabajo, me le faltaba una idea clara central sobre la que desarrollar.

- El objetivo de armar un equipo con un limite de presupuesto y buscando las mejores habilidades / proyección.

- Añadiré un nuevo objetivo, una vez tenga el equipo estructurado, realizaré simulaciones de 1 temporada para recoger esos datos y tener una lectura final del proyecto.

- Añadiré KPI que den una valoración de cada posición en un jugador usando los valores estadisticos de esa posición y así poder clasificarlos.
(ejemplo, para la posicion de delantero un KPI que agrupe Finalizar, Definición dentro del área, Cabezazo, Primer toque, Decisión ,Anticipación,Juego sin balón.)

- He estado mucho tiempo intentandolo hacer por medida, como estaba teniendo problemas en conseguir la cifra(mismo resultado unico o en blanco), he pasado a hacerlo añadiendo una columna y lo hare de todas las posiciones.

---------------------------------------------------------------------------------------------------------------------------

Solución de los KPI y nuevas medidas añadidas 19/05/2026

-Solucioné los errores que estaba teniendo debido a que habia unas columnas añadidas no normalizadas correctamente con su formato, el cual generaba estos errores.
-Nuevos KPI y medidas añadidas para no tener que andar con filtros manuales en cada grafico que tenia que realizar.

-KPI Delantero columna creada

---------------------------------------------------------------------------------------------------------------------------

Modificaciones tablas y nuevos KPI 18/05/2026

- He creado un MD donde se especifican mejor los cambios hechos a las tablas para los KPI.
- Tablas de KPI por posición creadas.
- A la hora de pasarlo a una tabla para testear información, no ordena bien los datos, mirar con Guille a ver que pasa.


---------------------------------------------------------------------------------------------------------------------------

Nuevas medidas e inicio de la estructura 21/05/2026

- Hablé con Guille sobre como dirigir la parte de la simulación, falta ver metodo de extracción de los datos simulados para decidir.
- Opciones: 1) 1 temporada muchas veces para ver los resultados y analizar vs 5 temporadas de una misma plantilla y analizar.
- He comenzado con las estructuras de las diapositivas, primero deberia ser la de presentación y despues las de datos, para introducir los datos he hecho una con jugadores totales, promedios por posición y una relación de factores fisicos y de edad por posición.
- Siguiente paso, plantear la diapositiva de habilidad actual, potencial y mirar de comenzar a plantear la agrupación por posiciones.


---------------------------------------------------------------------------------------------------------------------------

Actualización, cambios y orden 08/06/2026

- No habia actualizado el documento, toca updatear.
- Creadas subcarpetas para redistribuir los archivos y tenerlo todo mas ordenado.
- Creación del archivo de informe y actualización, hasta parte de sql hecho.
- Parte de antes de las QUERY en principio revisada ortograficamente.
- query de sql tanto analiticas como de informe creadas y subidas en su carpeta.



---------------------------------------------------------------------------------------------------------------------------

Actualización, analisis 13/06/2026


- Realización de la parte de tecnicas analiticas, arbol de decision hecho y 11 jugadores elegidos.
- Revision del dashboard y hecha la parte de arbol de decision y equipo.

------------------------------------------------------------------------------------------------------------------------------------

Actualización 16/06/2026

-Restructuración del informe como le comenté a Guille, ahora si que está basado en la plantilla de la información.
-Hechas las simulaciones, complementados los informes ejecutivo, la parte del informe y el dashboard con los resultados.
-Revision y pulido del dashboard, homogenizado y con la base de presentación mas trabajada.

---------------------------------------------------------------------------------------------------------------------------

Actualización 22/06/2026

- Subida de todos los datos y proyecto compartido.
- Preparar la defensa 

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
