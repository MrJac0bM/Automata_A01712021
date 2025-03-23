% Definición de los estados
estado(q0).
estado(q1).
estado(q2).
estado(q3).
estado(q4).
estado(q5).
estado(q6).
estado(q7).
estado(q8).
estado(q9). 
estado(q10).
estado(q11).
estado(q12).
estado(q13).
estado(q14).

% Estado inicial
estado_inicial(q0).

% Estados finales 
estado_final(q4). 

% Transiciones existentes
transicion(q0, d, q1). %"dina"
transicion(q1, i, q2). %"dina"
transicion(q2, n, q3). %"dina"
transicion(q3, a, q4). %"dina"

transicion(q1, o, q5). %"dol" y "dor"
transicion(q5, l, q4). % "dol"
transicion(q5, r, q4). %"dol"

transicion(q1, r, q6). % Transición para "drego" y "draug"
transicion(q6, e, q7). % Transición para "drego"
transicion(q7, g, q8). % Transición para "drego"
transicion(q8, o, q4). % Transición para "drego"

transicion(q6, a, q9). % Transición para "draug"
transicion(q9, u, q10). % Transición para "draug"
transicion(q10, g, q4). % Transición para "draug"

% Función para verificar si una palabra es aceptada
acepta(Palabra) :-
    atom_chars(Palabra, Caracteres), % Convierte la palabra en una lista de caracteres
    estado_inicial(EstadoInicial), % Unico Estado inicial que es q0
    acepta_aux(Caracteres, EstadoInicial). % Pasa la cadena de caracteres ya en array y el estado inicial q0

% Caso base: si no quedan caracteres y estamos en un estado final, la palabra es aceptada
acepta_aux([], Estado) :- 
    estado_final(Estado).

% Caso recursivo: avanzar en el autómata según las transiciones
acepta_aux([Cabeza|Cola], EstadoActual) :- 
    transicion(EstadoActual, Cabeza, EstadoSiguiente), 
    acepta_aux(Cola, EstadoSiguiente).

% Predicado para realizar el benchmark
benchmark(Palabra) :-
    % Medir el tiempo antes de la ejecución
    statistics(runtime, [StartTime, _]),
    
    % Ejecutar el predicado acepta con la palabra
    acepta(Palabra),
    
    % Medir el tiempo después de la ejecución
    statistics(runtime, [EndTime, _]),
    
    % Calcular el tiempo transcurrido en microsegundos
    RuntimeMicroseconds is EndTime - StartTime,
    
    % Convertir el tiempo a milisegundos
    RuntimeMilliseconds is RuntimeMicroseconds / 1000000,
    
    % Mostrar el tiempo de ejecución en milisegundos
    format('Tiempo de ejecución para "~w": ~5f milisegundos~n', [Palabra, RuntimeMilliseconds]).
