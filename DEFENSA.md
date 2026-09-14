# Defensa técnica — Ingeniebros

Laboratorio 1 · Lista dinámica y estado local · Clase 9

Persona 6 — Diego Fernando Castro Orellana

Equipo:
1. Alejandro Javier Cruz Linares
2. Ariana Marcela Martinez Brito
3. Ivan Alessandro Vazquez Martinez
4. Diego Fernando Castro Orellana
5. Diego Alberto Baños Ehlerman
6. Juleysi Nicole Carballo Martinez

## 1. Estado y ubicación

El estado de la pantalla vive en `_PantallaAsistenciaState`, el `State` del único `StatefulWidget` (`PantallaAsistencia`). Ahí está la lista `_estudiantes` y ahí ocurren los tres cambios: un registro, marcar a todos presentes y restablecer.

Lo pusimos ahí porque el encabezado fijo (`Presentes X / Y`) y la lista leen la **misma** lista. Si el estado viviera en cada `FilaAsistencia`, cada fila sabría si esa persona está presente, pero el contador del encabezado no se enteraría del cambio. Habría que “subir” el dato o duplicar estado, y el laboratorio pide un solo `StatefulWidget` con `setState`.

## 2. Reconstrucción de widgets

Cuando el usuario cambia un solo registro se llama a `setState` en `_PantallaAsistenciaState`. Eso vuelve a ejecutar el `build` de la pantalla: se recalcula el contador del encabezado y se vuelve a crear el `ListView.builder`.

No repartimos `setState` en las filas. Para no reconstruir de más:

- `ListView.builder` solo construye las filas visibles, no las doce de golpe.
- `FilaAsistencia` es un `StatelessWidget` con constructor `const`; recibe datos por parámetros y no guarda estado.
- Cada fila usa `ValueKey` con el carné para que Flutter identifique el renglón.

## 3. Extracción de componente

Extraímos `FilaAsistencia` como **clase** independiente. Criterio: es el renglón que se repite (nombre, carné, presente/ausente) y no debe tocar el estado de la pantalla. Los datos entran por el constructor; el cambio se avisa con `onCambioPresente`.

Si hubiéramos usado un **método** del `State` (por ejemplo `_fila(...)` que devuelve un `Row`), no cumpliría “componente extraído a clase propia”. Ese `Row` seguiría siendo parte del `build` del padre: no tendría identidad de widget propia ni constructor `const` de clase, y la fila podría volver a acceder al estado del `State` sin pasar por el constructor.

---

## Registro de consultas a IA

Transcribir aquí **cada** consulta real, íntegra (pregunta y respuesta). No inventar consultas que no se hayan enviado.

Prompts listos para pegar en otra IA (definición / diferencia; no piden código ni el enunciado):

### Consulta 1 — ListView.builder

- Herramienta:
- Fecha:
- Consulta (íntegra):

```
Explica qué es ListView.builder en Flutter: qué hace itemBuilder, para qué sirve itemCount y en qué se diferencia de un ListView al que se le pasan todos los children de una vez. No me des código de una app. Solo la definición y el comportamiento.
```

- Respuesta (íntegra):

### Consulta 2 — setState

- Herramienta:
- Fecha:
- Consulta (íntegra):

```
¿Qué es setState en un StatefulWidget de Flutter? ¿Qué dispara en el árbol de widgets cuando se llama? No me escribas una pantalla ni un ejemplo de app. Solo la definición y el comportamiento.
```

- Respuesta (íntegra):

### Consulta 3 — StatelessWidget

- Herramienta:
- Fecha:
- Consulta (íntegra):

```
¿Qué es un StatelessWidget en Flutter y cómo recibe datos por el constructor? ¿Por qué ese widget no debería leer el estado de otra pantalla por su cuenta? No me des código de una app. Solo la definición.
```

- Respuesta (íntegra):

### Consulta 4 — const

- Herramienta:
- Fecha:
- Consulta (íntegra):

```
En Flutter, ¿qué significa marcar un widget o un constructor con const? ¿Qué relación tiene con el analizador (flutter analyze) y con evitar reconstrucciones innecesarias? No me pidas ni me des estructura de una pantalla. Solo la definición.
```

- Respuesta (íntegra):

### Consulta 5 — clase vs método

- Herramienta:
- Fecha:
- Consulta (íntegra):

```
Ya escribí la fila de una lista de dos formas: (1) una clase StatelessWidget independiente cuyos datos entran por el constructor, y (2) un método del State que devolvía un Row. ¿Qué cambia entre esas dos formas en identidad del widget y en qué se reconstruye? No reescribas mi código. Solo la diferencia.
```

- Respuesta (íntegra):

### Consulta 6 — flutter analyze (solo si ya corrieron el comando)

- Herramienta:
- Fecha:
- Consulta (íntegra):

```
Al ejecutar flutter analyze obtuve este hallazgo exacto:

[PEGAR AQUÍ LA SALIDA REAL DEL ANALIZADOR]

¿Qué significa y por qué el analizador lo marca? No me corrijas el archivo ni me des el código nuevo. Solo la explicación del mensaje.
```

- Respuesta (íntegra):
