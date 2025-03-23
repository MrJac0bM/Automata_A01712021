:- use_module(library(pcre)).

% Expresión regular equivalente al autómata
expresion_regular("^d(ina$|o(r|l)$|r(aug|ego))").

% Predicado que verifica si una palabra es aceptada
acepta_regex(Palabra) :-
    expresion_regular(Regex),   % Obtener la expresión regular
    re_match(Regex, Palabra, []).  % Verificar si la palabra coincide

% Predicado para realizar el benchmark
benchmark(Palabra) :-
    % Medir el tiempo antes de la ejecución
    statistics(runtime, [StartTime, _]),
    
    % Ejecutar el predicado acepta_regex con la palabra
    acepta_regex(Palabra),

    % Medir el tiempo después de la ejecución
    statistics(runtime, [EndTime, _]),
    
    % Calcular el tiempo transcurrido
    Runtime is EndTime - StartTime,

     % Convertir el tiempo a milisegundos
    Runtime is Runtime / 1000000,
    
    % Mostrar el tiempo de ejecución
    write('Tiempo de ejecución para "'), write(Palabra), write('": '), write(Runtime), nl.
