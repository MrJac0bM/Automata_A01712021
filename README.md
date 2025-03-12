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

## Implementación del AFD

### Expresión Regular

Para reconocer las palabras `dina`, `dol`, `dor`, `drego` y `draug`, se utiliza la siguiente expresión regular:
