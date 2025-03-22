:- use_module(library(pcre)). 

% Expresión regular equivalente al autómata
expresion_regular("^d(ina$|o(r|l)$|r(aug|ego))"). 

% 1er caso: "Debe empezar con d y terminar con ina" dina 
% 2do caso : "Debe empezar con d debe tener una o y terminar con o u l" dol y dor 
% 3er caso : "Debe empezar con d debe tener un r y puede terminar en aug o en ego"  drego draug

% Predicado que verifica si una palabra es aceptada
acepta_regex(Palabra) :-
    expresion_regular(Regex),   % Obtener la expresión regular
    re_match(Regex, Palabra, []).  % Verificar si la palabra coincide
