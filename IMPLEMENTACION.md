# Persona 6 — Diego Fernando Castro Orellana

## Qué te toca

Crear y completar **solo** este archivo en la **raíz** del repo (junto a `pubspec.yaml`, no dentro de `lib/`):

`DEFENSA.md`

El laboratorio pide este archivo. Sin él no hay nota de sustentación (15 %).

## Qué no tocas

- No cambies código Dart.
- No pidas código ni la estructura de la pantalla a una IA.
- No pegues el PDF del laboratorio en una IA.

## Cómo implementarlo

1. Repo:

```powershell
git clone https://github.com/Woody07-crypto/App-de-asistencia.git
cd App-de-asistencia
git pull
```

2. Copia `DEFENSA.md` de este ZIP a la raíz del repo.

3. Las tres preguntas ya tienen respuesta técnica alineada al código. Léelas y asegúrate de poder decirlas en voz alta (si la oral contradice el archivo, sustentación = 0).

4. **Registro de IA (obligatorio).** La diapositiva 6 pide transcribir cada consulta íntegra. Si omites una, cuenta como uso no declarado.

Abre otra IA (ChatGPT, Gemini, etc.). **Una conversación por prompt.** Copia cada prompt del `DEFENSA.md`, pega la respuesta completa debajo de “Respuesta (íntegra)” y llena herramienta + fecha.

Prompts permitidos (ya están en el archivo):

1. Qué es `ListView.builder`
2. Qué es `setState`
3. Qué es `StatelessWidget` y el constructor
4. Qué significa `const`
5. Diferencia entre fila como clase vs como método
6. Solo si `flutter analyze` falló: pegar el hallazgo y pedir **explicación**, no el código nuevo

No envíes: “hazme la app”, “cómo organizo la pantalla”, ni el enunciado.

5. Si alguien del equipo no usó IA, déjalo escrito. Este archivo sí documenta las 6 consultas de definición; no borres esa sección vacía: llénala.

## Cómo hacer el push

```powershell
git add DEFENSA.md
git commit -m "docs: agregar DEFENSA.md — Persona 6 Juleysi Carballo"
git push
```

O en rama:

```powershell
git checkout -b persona-6-defensa
git push -u origin persona-6-defensa
```

Haz el push **después** de pegar las respuestas de la otra IA. Un `DEFENSA.md` con “Respuesta” vacía se ve incompleto.

## Cómo saber que quedó bien

- El archivo está en la raíz, se llama exactamente `DEFENSA.md`.
- Están las 3 preguntas contestadas.
- Cada consulta a IA tiene pregunta y respuesta completas (o declaración de que no hubo ninguna).
