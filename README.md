# Proyecto: Autómata Finito Determinista (AFD) para palabras en Sindarin

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


# Expresión Regular

Para reconocer las palabras `dina`, `dol`, `dor`, `drego` y `draug`, se utiliza la siguiente expresión regular:

## ``` ^d(ina$|o(r|l)$|r(aug|ego)$)```

Esta expresión regular valida las palabras de acuerdo con las siguientes reglas:

- **`^d`**: La palabra debe comenzar con "d".
- **`(ina$|o(r|l)$|r(aug|ego))`**: La palabra debe terminar con una de las siguientes secuencias:
  - **`ina$`**: La palabra termina con "ina" (como "dina").
  - **`o(r|l)$`**: La palabra termina con "o" seguido de "r" o "l" (como "dol" o "dor").
  - **`r(aug|ego)`**: La palabra contiene "r" seguido de "aug" o "ego" (como "draug" o "drego").

## Análisis de Complejidad

### Complejidad Temporal y Espacial

#### Expresión Regular:

- **Complejidad Temporal**: O(n), donde *n* es el tamaño de la entrada. La expresión regular realiza solo una pasada por la cadena de caracteres.
- **Complejidad Espacial**: O(1), ya que la expresión regular no requiere espacio adicional basado en el tamaño de la entrada.

#### Autómata Finito Determinista (AFD):

- **Complejidad Temporal**: O(n), ya que se recorre cada caracter de la palabra solo una vez.
- **Complejidad Espacial**: O(s), donde *s* es el número de estados, ya que el autómata necesita almacenar las transiciones y los estados definidos.


## Pruebas Automatizadas

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

### Benchmark de Soluciones

Se realizó una comparación de tiempos de ejecución entre la expresión regular y el autómata determinista:


