% de los medicos sabemos su nombre , edad, especialidad
medico(juan, 25, pediatra).
medico(maria, 30, ginecologa).
medico(maria, 30, obtetricia).
medico(maria, 30, gastroenterologa).
medico(sofia, 20, enfermera).
medico(sofia, 20, anestesista).


%medico especialidad años en esa especialidad
anios(juan, pediatra, 35).
anios(maria, ginecologa, 5).
anios(maria, obstetricia, 2).
anios(sofia, enfermera, 1).

%de que se ocupa cada profesion 
ocupacion(oncologia,cancer).
ocupacion(obstetricia, embarazo).
ocupacion(obstetricia, parto).
ocupacion(gastroenterologia, higado).
ocupacion(gastroenterologia, estomago).

%paciente compuesto por nombre y sintomas 
paciente(estela, higado).
paciente(estela, embarazo).
paciente(cristian, estomago).

%------------------------------------

%Punto 0--

%De que especialidad no Hay Medicos
nohayMedicos(Especialidad):-
    not(medico(_,_,Especialidad)).

%Punto 0--

% medicos con mas de 1 especialidad
masDeUnaEspecialidad(Medico):-
    medico(Medico,_,Especialidad1),
    medico(Medico,_,Especialidad2),
    Especialidad1 \= Especialidad2.

%Punto 1--

% si un medico tiene mas años en una Especialidad que de su edad
inconsistencia(Medico):-
    medico(Medico,Edad,Especialidad),
    anios(Medico,Especialidad,Anios),
    Anios > Edad.

%Punto 2-- 

% que son los que la mayor parte de su vida han desempeñado dicha especialidad. 
muchaExperiencia(Medico):-
    medico(Medico,Edad,Especialidad),
    anios(Medico,Especialidad,Anios),
    Anios > (Edad*0.5).

%Punto 3-- 

%Buscar doctor segun el sintoma del paciente
doctorSegunPaciente(Paciente):-
    paciente(Paciente,Sintoma),
    forall(medico(Medico,_,Especialidad), ocupacion(Especialidad,Sintoma)).

%Los predicados son inversibles si al preguntar podemos saber de forma generica mediante un parametro, quienes cumplen la condicion del predicado

%Ejemplos----

%Punto 0

%masDeUnaEspecialidad(Medico).
%Medico = maria

%Punto 1

%inconsistencia(Medico).
%Medico = juan

%Punto 2

%muchaExperiencia(Medico).
%Medico = juan


