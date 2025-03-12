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

Para este proyecto, se implementará un **Autómata Finito Determinista (AFD)**. Estos autómatas son modelos matemáticos que procesan cadenas de símbolos y determinan si pertenecen a un lenguaje específico. Su funcionamiento se basa en un conjunto finito de estados, transiciones entre ellos y una función que define cómo cambia el estado según la entrada recibida.

En este caso, el AFD se diseñará para reconocer palabras en sindarin y validar si pertenecen al conjunto definido previamente.

---

## Evolución del Autómata: De Múltiples Estados Finales a Uno Solo

En la primera versión del autómata, se utilizaron **múltiples estados finales** para reconocer cada palabra individualmente. Esto implicaba que cada palabra válida (`dina`, `dol`, `dor`, `drego`, `draug`) tenía su propio estado final. Si bien este enfoque es funcional, puede volverse redundante y difícil de mantener a medida que el lenguaje crece.

En la **segunda versión**, se optimizó el autómata reduciendo los estados finales a **uno solo**. Este enfoque, conocido como **unificación de estados finales**, simplifica el diseño del autómata y lo hace más eficiente. Como señala Hopcroft, Motwani y Ullman (2007) en su libro *Introduction to Automata Theory, Languages, and Computation*:

> "La reducción de estados finales a uno solo no solo simplifica el diseño del autómata, sino que también facilita su implementación y mantenimiento."

Este cambio se refleja en el diagrama del autómata, donde todas las transiciones válidas convergen en un único estado final, marcando la aceptación de las palabras del lenguaje.

## Implementación del AFD


### Expresión Regular

Para reconocer las palabras `dina`, `dol`, `dor`, `drego` y `draug`, se utiliza la siguiente expresión regular:
# ^d(ina$|o(r|l)$|r(aug|ego))


