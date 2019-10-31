import excel "C:\Users\Miguel Gutierrez\Documents\Bases_de_datos_2_entrega_id.xlsx", sheet("Hoja1") first row
*Generando id por cada departamento para utilizarlo en el panel de datos
egen departamento_id = group(Departamento)

xtset departamento_id Año, yearly

*Estadistica Descriptiva - Panel de datos
xtsum Hurtos_personas PIB_percapita Num_Colegios Total_Matriculados Desempleo Población jornada Matriculados_jornada

*Correlaciones
pwcorr hurtos_poblacion Penetracion_internet Inversio_edu Gini Pobreza_monetaria Tasa_desempleo Jornada, star(5)

*Modificando color
set scheme s1color 
*Graficas

*GRAFICA # 1 - Hurtos serie de tiempo departamento
local myopts overlay ysc(log)
xtline hurtos_poblacion if inlist(departamento_id, 1, 2, 3, 4,5),`myopts' legend(ring(0) pos(4) col(1)order(1 "Antioquia" 2 "Atlantico" 3 "Bolivar" 4 "Boyaca" 5 "Caldas"))
*GRAFICA # 2 - Colegios Jornada unica
xtline Jornada if inlist(departamento_id, 1, 2, 3, 4,5),`myopts' legend(ring(0) pos(4) col(1)order(1 "Antioquia" 2 "Atlantico" 3 "Bolivar" 4 "Boyaca" 5 "Caldas"))
