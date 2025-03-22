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
    estado_inicial(EstadoInicial), % Unico Estado incial que es q0
    acepta_aux(Caracteres, EstadoInicial). % Pasa la cadena de caracteres ya en array y el estado inicidal q0

% Caso base: si no quedan caracteres y estamos en un estado final, la palabra es aceptada
acepta_aux([], Estado) :- % Si la plabara termino y esta en estado final se acepta
    estado_final(Estado).

% Caso recursivo: avanzar en el autómata según las transiciones
acepta_aux([Cabeza|Cola], EstadoActual) :- %"Recursion por cola"
    transicion(EstadoActual, Cabeza, EstadoSiguiente), %"Completa la transicion Ej (q0, d, Estadofinal)"
    acepta_aux(Cola, EstadoSiguiente). %"[i,n,a],q1"


% Expresion regular "^d(ina$|o(r|l)$|r(aug|ego))"

% Alfabeto = "Dinaolreug"