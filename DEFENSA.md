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
- `FilaAsistencia` es un `StatelessWidget`. Su constructor *puede* ser `const`, pero en la lista no se crea con `const` porque el callback cambia en cada ítem. Lo que sí evita trabajo extra es no guardar estado en la fila: solo recibe datos y avisa el cambio.
- Cada fila usa `ValueKey` con el carné para que Flutter identifique el renglón.

## 3. Extracción de componente

Extraímos `FilaAsistencia` como **clase** independiente. Criterio: es el renglón que se repite (nombre, carné, presente/ausente) y no debe tocar el estado de la pantalla. Los datos entran por el constructor; el cambio se avisa con `onCambioPresente`.

Si hubiéramos usado un **método** del `State` (por ejemplo `_fila(...)` que devuelve un `Row`), no cumpliría “componente extraído a clase propia”. Ese `Row` seguiría siendo parte del `build` del padre: no tendría identidad de widget propia ni constructor `const` de clase, y la fila podría volver a acceder al estado del `State` sin pasar por el constructor.

---

## Registro de consultas a IA

### Consulta 1 — ListView.builder

- Herramienta: Gemini
- Fecha: 13/09/2026
- Consulta (íntegra):

```
Explica qué es ListView.builder en Flutter: qué hace itemBuilder, para qué sirve itemCount y en qué se diferencia de un ListView al que se le pasan todos los children de una vez. No me des código de una app. Solo la definición y el comportamiento.
```

- Respuesta (íntegra):
-Concepto clave: Es un constructor lazy de listas en Flutter.
-Que hace itemCount?: Define la cantidad total de elementos que contiene la lista.
-Que hace itemBuilder?: Función creadora que se ejecuta solo cuando un elemento va a entrar en pantalla, volviendose visible para el usuario.
-Diferencia principal con un ListView normal: Mientras que el ListView tradicional crea todos sus children a la vez al cargarse, consumiendo demasiada memoria RAM en el proceso, el ListView.builder solo construye e instancia en memoria los widgets que tengan el espacio adecuado para la pantalla del dispositivo del usuario a medida que este haga scroll. 

### Consulta 2 — setState

- Herramienta: Gemini
- Fecha: 13/09/2026
- Consulta (íntegra):

```
¿Qué es setState en un StatefulWidget de Flutter? ¿Qué dispara en el árbol de widgets cuando se llama? No me escribas una pantalla ni un ejemplo de app. Solo la definición y el comportamiento.
```

- Respuesta (íntegra):
-Concepto clave: Es el método que le avisa al framework de Flutter que el estado interno de un StatefulWidget ha cambiado.
-Qué dispara en el árbol?: Marca el widget dirty el cual programa la reejecución de su método build(), provocando así que la interfaz gráfica se vuelva a dibujar en pantalla actualizando únicamente los elementos cuya información sufrió cambios.

### Consulta 3 — StatelessWidget

- Herramienta: Gemini
- Fecha: 13/09/2026
- Consulta (íntegra):

```
¿Qué es un StatelessWidget en Flutter y cómo recibe datos por el constructor? ¿Por qué ese widget no debería leer el estado de otra pantalla por su cuenta? No me des código de una app. Solo la definición.
```

- Respuesta (íntegra):
-Concepto clave: Es un widget inmutable que no posee un estado interno que cambie con el tiempo.
-Paso de datos por cada constructor: Recibe toda la información que necesita para dibujarse desde afuera.
-Por qué no debe leer el estado del padre?: Debe ser un componente puro e independiente, ya que si se intentara acceder o manipular directamente el estado de una pantalla externa por su cuenta, rompería el principio de encapsulamiento y modularidad, haciendo que sea imposible reutilizarlo en otras partes del código.

### Consulta 4 — const

- Herramienta: Gemini
- Fecha: 13/09/2026
- Consulta (íntegra):

```
En Flutter, ¿qué significa marcar un widget o un constructor con const? ¿Qué relación tiene con el analizador (flutter analyze) y con evitar reconstrucciones innecesarias? No me pidas ni me des estructura de una pantalla. Solo la definición.
```

- Respuesta (íntegra):
-Concepto clave: Indica que el widget es una constante en tiempo de compilación. Sus valores y estructura nunca cambiarán tras ser creado.
-Relación con el analizador y rendimiento: Le indica a Flutter que el widget puede ser reutilizado en memoria exactamente como está. Por ejemplo, si un widget padre se vuelve a dibujar, Flutter se salta la reconstrucción de los widgets marcados con const, optimizando el rendimiento. El analizador exige colocar const en constructores elegibles como una buena práctica de código. 

### Consulta 5 — clase vs método

- Herramienta: Gemini
- Fecha: 13/09/2026
- Consulta (íntegra):

```
Ya escribí la fila de una lista de dos formas: (1) una clase StatelessWidget independiente cuyos datos entran por el constructor, y (2) un método del State que devolvía un Row. ¿Qué cambia entre esas dos formas en identidad del widget y en qué se reconstruye? No reescribas mi código. Solo la diferencia.
```

- Respuesta (íntegra):
-Diferencia de identidad: 
Una clase StatelessWidget independiente crea un nodo propio con identidad única en el árbol de widgets (Element Tree), permitiendo aprovechar constructores const y evitar re-renderizados si sus propiedades no cambiaron.
Un método auxiliar que devuelve un Row dentro de la misma clase no crea un componente independiente; Flutter lo interpreta simplemente como código expandido del build padre.
-Reconstrucción: Con el método auxiliar, cada vez que la pantalla principal llama a setState, la fila se ve obligada a reconstruirse por completo al ser parte directa de ese mismo ciclo.

