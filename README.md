# Proyecto: Autómata Finito Determinista (AFD) 

## Introducción

El idioma élfico es un idioma dentro del universo ficticio creado por J.R.R. Tolkien (Wikipedia, 2024). Tolkien, quien era filólogo de profesión, dedicó muchos años a la creación y desarrollo de estas lenguas élficas. Entre las más elaboradas se encuentran el **quenya**, hablado por los Altos Elfos Noldor, y el **sindarin**, utilizado por los Elfos Grises. Estas lenguas están inspiradas en idiomas reales como el finlandés, el galés y el latín, con una gramática y fonética bien estructuradas.

## Palabras en Sindarin

Las palabras del idioma sindarin que se utilizarán en este proyecto son:

- **Dina**: Significa 'silencio' o 'guarda silencio'.
- **Dol**: Significa 'cabeza', a menudo empleado para nombrar colinas y montañas.
- **Dôr**: Palabra sindarin para 'tierra' o 'territorio'.
- **Draug**: Significa 'lobo'.
- **Drego**: Verbo en sindarin que significa 'huir' o 'escapar'.

## Descripción del Proyecto

El proyecto implementa dos soluciones principales para resolver el problema de validar las palabras en sindarin: un Autómata Finito Determinista (AFD) y una expresión regular.

- Autómata Finito Determinista (AFD): Un modelo matemático que procesa cadenas de símbolos y decide si pertenecen al lenguaje aceptado, basado en un conjunto finito de estados y transiciones.

- Expresión Regular: Una herramienta basada en patrones que valida las cadenas de caracteres utilizando un conjunto de reglas sintácticas.

Ambas soluciones están diseñadas para aceptar las mismas palabras, y se presentan como alternativas para resolver el mismo problema de validación de palabras en sindarin.

---

## Evolución del Autómata: De Múltiples Estados Finales a Uno Solo

En la primera versión del autómata, se utilizaron **múltiples estados finales** para reconocer cada palabra individualmente. Esto implicaba que cada palabra válida (`dina`, `dol`, `dor`, `drego`, `draug`) tenía su propio estado final. Si bien este enfoque es funcional, puede volverse redundante y difícil de mantener a medida que el lenguaje crece.

En la **segunda versión**, se optimizó el autómata reduciendo los estados finales a **uno solo**. Este enfoque, conocido como **unificación de estados finales**, simplifica el diseño del autómata y lo hace más eficiente. Como señala Hopcroft, Motwani y Ullman (2007) en su libro *Introduction to Automata Theory, Languages, and Computation*:

> "La reducción de estados finales a uno solo no solo simplifica el diseño del autómata, sino que también facilita su implementación y mantenimiento."

Este cambio se refleja en el diagrama del autómata, donde todas las transiciones válidas convergen en un único estado final, marcando la aceptación de las palabras del lenguaje.



## Implementación del AFD
A continuación, se presenta el diagrama que ilustra cómo las palabras pasan a través de los estados del autómata hasta llegar al estado final
![image](https://github.com/user-attachments/assets/fd4878a4-bce7-4d2f-972d-7279ef9dc359)
Este diagrama muestra cómo las palabras son procesadas por el autómata y validadas a través de sus transiciones.


## Expresión Regular

Para reconocer las palabras `dina`, `dol`, `dor`, `drego` y `draug`, se utiliza la siguiente expresión regular:

## ``` ^d(ina$|o(r|l)$|r(aug|ego)$)```

Esta expresión regular valida las palabras de acuerdo con las siguientes reglas:

- **`^d`**: La palabra debe comenzar con "d".
- **`(ina$|o(r|l)$|r(aug|ego))`**: La palabra debe terminar con una de las siguientes secuencias:
  - **`ina$`**: La palabra termina con "ina" (como "dina").
  - **`o(r|l)$`**: La palabra termina con "o" seguido de "r" o "l" (como "dol" o "dor").
  - **`r(aug|ego)`**: La palabra contiene "r" seguido de "aug" o "ego" (como "draug" o "drego").
 
# Implementación
## Transiciones entre estados:
```prolog
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
```

## Estado Final:
Solamente existe un estado final el cual es q4:
```prolog
estado_final(q4).
```
## Estado inicial:
Solamente existe un estado inicial el cual es el punto de entrada y es q0:
```prolog
estado_inicial(q0).
```

## Validación de cadenas de texto:

### Caso Base:
Si la cadena esta vacia o se llega al final el estado EstadoActual debe ser el estado final de lo contrario se rechaza la cadena 
```prolog
acepta_aux([], Estado) :- 
    estado_final(Estado)..
```

### Caso Recursivo:
Este caso procesa toda la lista y en cada iteración va actualizando el estado actual hasta llegar al caso base
```prolog
acepta_aux([Cabeza|Cola], EstadoActual) :- 
    transicion(EstadoActual, Cabeza, EstadoSiguiente), 
    acepta_aux(Cola, EstadoSiguiente)..
```

### Caso Llamada a la función principal:
Se procesa la palabra y se convierte a un arreglo cada caracter de la palabra, se establece el estado inicial y se inicia la validación desde el estado inicial 
```prolog
acepta(Palabra) :-
    atom_chars(Palabra, Caracteres), % Convierte la palabra en una lista de caracteres
    estado_inicial(EstadoInicial), % Unico Estado inicial que es q0
    acepta_aux(Caracteres, EstadoInicial). % Pasa la cadena de caracteres ya en array y el estado inicial q0
```

## Análisis de Complejidad

### Complejidad Temporal y Espacial

#### Expresión Regular:

- **Complejidad Temporal**: O(n), donde *n* es el tamaño de la entrada. La expresión regular realiza solo una pasada por la cadena de caracteres.
- **Complejidad Espacial**: O(1), ya que la expresión regular no requiere espacio adicional basado en el tamaño de la entrada.

#### Autómata Finito Determinista (AFD):

- **Complejidad Temporal**: O(n), ya que se recorre cada caracter de la palabra solo una vez.
- **Complejidad Espacial**: O(s), donde *s* es el número de estados, ya que el autómata necesita almacenar las transiciones y los estados definidos.


## Pruebas 

Se han implementado pruebas automatizadas para validar el correcto funcionamiento del AFD y la expresión regular. Estas pruebas incluyen:

- Verificación de palabras válidas y no válidas.
- Evaluación del rendimiento con entradas de distintos tamaños.

### Casos de Prueba

Se realizaron diversas pruebas para validar el correcto funcionamiento del sistema.

#### Restricción a Minúsculas:

- **Entrada válida**: `"dina"`, `"dol"`, `"dor"`, `"draug"`, `"drego"`.
- **Entrada inválida**: `"Dina"`, `"Dol"`, `"DOR"`, `"Draug"`, `"Drego"` (mayúsculas no permitidas).

#### Palabras no válidas:

- `"dragon"`, `"drek"`, `"dorito"`, `"dinal"` (palabras que no cumplen con el patrón esperado).
- `"ddina"`, `"dolp"`, `"dorrr"` (palabras con caracteres extra o repetidos).

#### Palabras largas que cumplen con el patrón:

- `"dinadina"`, `"dolor"`, `"dorlor"` (se espera que no sean aceptadas porque contienen partes válidas pero no son exactas a las palabras permitidas).

### Prueba de Automata 
![image](https://github.com/user-attachments/assets/e3d6096e-dbf5-4dd9-b1d5-a8137b5897bd)

### Prueba con Regex
![image](https://github.com/user-attachments/assets/fdcbc140-ed86-4a41-adc7-a294b8f63538)



## Benchmark de Soluciones

Para comparar el rendimiento de ambas soluciones (expresión regular y autómata finito determinista), se implementó un benchmark en Prolog. Se midió el tiempo de ejecución de cada método utilizando el predicado `statistics(runtime, [Time,_])`, que permite obtener el tiempo transcurrido en milisegundos.

A continuación, se presenta la implementación utilizada para medir los tiempos de ejecución:

### Implementación en Autómata :
```prolog
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
```

### Implementación en Regex:
```prolog
benchmark(Palabra) :-
    % Medir el tiempo antes de la ejecución
    statistics(runtime, [StartTime, _]),
    
    % Ejecutar el predicado acepta_regex con la palabra
    acepta_regex(Palabra),

    % Medir el tiempo después de la ejecución
    statistics(runtime, [EndTime, _]),
    
    % Calcular el tiempo transcurrido
    Runtime is EndTime - StartTime,
    
    % Mostrar el tiempo de ejecución
    write('Tiempo de ejecución para "'), write(Palabra), write('": '), write(Runtime), nl.

```
### Resultados 
| Método               | Tiempo de ejecución |
|----------------------|--------------------|
| **AFD**             | 0.00002 ms           |
| **Expresión Regular** | 0.000015 ms          |


## Referencias:
- SWI-Prolog -- library(pcre): Perl compatible regular expression matching for SWI-Prolog. (s/f). Swi-prolog.org. Recuperado el 23 de marzo de 2025, de https://www.swi-prolog.org/pldoc/man?section=pcre

- SWI-Prolog -- statistics/2. (s/f). Swi-prolog.org. Recuperado el 23 de marzo de 2025, de https://www.swi-prolog.org/pldoc/man?predicate=statistics/2

- Wikipedia contributors. (s/f). Sindarin. Wikipedia, The Free Encyclopedia. https://es.wikipedia.org/w/index.php?title=Sindarin&oldid=164227280

- SWI-Prolog -- atom_chars/2. (s/f). Swi-prolog.org. Recuperado el 23 de marzo de 2025, de https://www.swi-prolog.org/pldoc/man?predicate=atom_chars/2

- (S/f). Uba.ar. Recuperado el 23 de marzo de 2025, de https://www-2.dc.uba.ar/staff/becher/Hopcroft-Motwani-Ullman-2001.pdf




