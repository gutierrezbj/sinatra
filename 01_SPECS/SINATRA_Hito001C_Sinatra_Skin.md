# Spec — SINATRA Hito 001-C · Sinatra Skin

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-09-20 |
| Estado | **Borrador — pendiente de revisión y aprobación** |
| Autor | Juan Ramón Gutiérrez (borrador preparado con agente Claude Code) |
| Aprobador | *(pendiente)* |
| Fecha de aprobación | *(pendiente)* |
| Tipo | modificación visual aislada |
| Proyecto | Sinatra · Proyecto Radio |
| Decisión vigente | ADR-001 — no fork · ver `00_DOCS/DECISIONES.md` |
| Depende de | **001-B cerrada** (baseline FLX4 verificado) **+ aprobación explícita** de esta spec |

> **Este documento es un borrador.** Sin aprobador y fecha de aprobación **no autoriza ningún trabajo**: no duplicar skins, no editar QSS/XML, no desplegar nada. Es la base para que el responsable revise alcance y guardarraíles antes de habilitar 001-C.

## 1. Objetivo

Crear la **primera identidad visual propia de Sinatra** como una **copia aislada de una skin existente de Mixxx**, modificando **solo** su aspecto (fondo, tipografía/escala, disposición de decks y mezclador, jerarquía visual), sin tocar el original ni el motor, y comprobar que **carga y es usable con la DDJ-FLX4**.

Esta fase valida que se puede construir una capa visual propia encima de Mixxx **sin fork y sin modificar el upstream** (refuerza ADR-001). **No** evalúa QML (eso es 001-D) ni añade funcionalidad nueva.

## 2. Entorno objetivo

- **Equipo:** `GARAGE1` (ASUS ROG Zephyrus G14 GA403UV), Windows 11.
- **Build de Mixxx:** la de 001-A en `C:\dev\mixxx\build\x64-portable\mixxx.exe` (commit `81a5eb87`).
- **Hardware:** DDJ-FLX4 (baseline de 001-B) para la verificación de uso real.
- **Skin base (a fijar en aprobación):** una skin **legacy (no QML)** existente de Mixxx. Recomendada: **LateNight** (la que el responsable ya usa). La skin QML queda reservada para 001-D.
- **Ubicación de la copia (propuesta):**
  - **Fuente versionada** de la skin Sinatra: `02_MODS/skins/` de este repo (carpeta ya reservada para copias aisladas de skins).
  - **Despliegue para que Mixxx la cargue:** carpeta de skins de usuario de Mixxx (`%LOCALAPPDATA%\Mixxx\skins\`), **fuera del repo de Mixxx**. Así Mixxx la ve sin modificar su repositorio.

Las rutas y nombres exactos de archivos de la skin base se registran durante la ejecución.

## 3. Dentro del alcance

- Identificar la skin base legacy y **duplicarla** con un nombre propio: **`LateNight_Sinatra`** (o `Sinatra`), sin tocar la original.
- Guardar la copia como **fuente versionada** en `02_MODS/skins/` y **desplegarla** en la carpeta de skins de usuario de Mixxx para poder cargarla.
- Modificar **únicamente** aspecto visual de la copia:
  - Fondo (color/imagen).
  - Tipografía y escala.
  - Disposición/estilo de **decks** y **mezclador**.
  - Jerarquía visual (tamaños, contraste, énfasis).
- Cargar la skin Sinatra en Mixxx y comprobar que **arranca, se ve y es usable**.
- **Verificar uso real con la FLX4:** que los controles (los ya validados en 001-B) siguen operando con la nueva skin.
- Documentar cambios, capturas (en `04_TESTS/artifacts/`, ignoradas por Git) y evidencia textual sanitizada; registrar checklist, estado de spec y bitácora.

## 4. Fuera del alcance

Fuente única de guardarraíles de esta fase.

- Crear o publicar un fork.
- **Modificar la skin original** o cualquier archivo dentro del repo de Mixxx (`C:\dev\mixxx`); ningún commit dentro de él.
- Tocar motor, pipeline de audio o mappings de la FLX4.
- **Trabajo QML / QtQuick** (reservado para 001-D).
- Añadir controles nuevos, lógica o funcionalidad: 001-C es **solo visual**.
- Cambiar el comportamiento de la skin más allá de lo estético listado en la sección 3.
- Redistribuir la skin o la build.
- Versionar binarios pesados: los assets de imagen razonables de la skin sí pueden versionarse en `02_MODS/skins/` (es su propósito); cualquier asset pesado va a `04_TESTS/artifacts/` y se documenta.

## 5. Restricciones

1. El repo de Mixxx y el de SINATRA permanecen separados; ningún commit dentro de `C:\dev\mixxx`.
2. Se trabaja **siempre sobre la copia**; el original de la skin no se toca (se verifica su intacto al cerrar).
3. La fuente de la skin Sinatra vive versionada en `02_MODS/skins/`; el despliegue a la carpeta de usuario de Mixxx no se versiona.
4. Cambios mínimos y reversibles; cada cambio visual documentado (qué archivo, qué propiedad, por qué).
5. No se avanza a 001-D durante esta tarea.
6. Un resultado visual "provisional pero cargando y usable" es válido si queda documentado; la ambición estética no es criterio de cierre.
7. Una desviación de alcance nunca se resuelve en silencio: se detiene el trabajo y se registra.

## 6. Procedimiento de alto nivel

1. Confirmar 001-B cerrada y localizar la skin base legacy en la build (registrar ruta y archivos clave: `skin.xml`/`.qml` no, QSS, imágenes).
2. Consultar la documentación oficial vigente de Mixxx sobre skins (estructura, dónde se colocan las skins de usuario, cómo se seleccionan). Registrar URL y fecha.
3. **Duplicar** la skin base a `02_MODS/skins/LateNight_Sinatra`, renombrando identificadores internos para que Mixxx la muestre como skin distinta.
4. Desplegar la copia en `%LOCALAPPDATA%\Mixxx\skins\` (o el mecanismo oficial de skins de usuario).
5. Seleccionar la skin Sinatra en Mixxx (Preferencias → Interfaz) y confirmar que arranca sin romper el layout.
6. Aplicar cambios visuales acotados (fondo, tipografía/escala, decks, mezclador, jerarquía), uno a uno, registrando cada uno.
7. **Verificar con la FLX4** que los controles siguen usables con la nueva skin.
8. Comprobar que la skin original y el repo de Mixxx siguen intactos (`git status` limpio; sin commits dentro).
9. Capturar evidencia (capturas a `artifacts/`, notas a `evidence/`), actualizar checklist, estado de esta spec y bitácora.

Los pasos concretos de estructura de skins se toman de la documentación oficial vigente; esta spec no los congela.

## 7. Entregables

1. Skin **`LateNight_Sinatra`** (copia aislada) versionada en `02_MODS/skins/`, con identidad visual propia mínima.
2. Notas de la modificación (nueva plantilla `04_TESTS/SKIN_NOTES.md`, creada al aprobar esta spec) con: skin base, archivos tocados, cada cambio visual y su motivo, cómo se despliega y cómo se revierte.
3. Evidencia: capturas antes/después en `04_TESTS/artifacts/` (ignoradas por Git) y notas textuales sanitizadas en `04_TESTS/evidence/`.
4. Confirmación de que la skin original y el árbol de Mixxx siguen intactos.
5. Checklist técnico actualizado.
6. Estado de esta spec actualizado en la cabecera con el estado de salida alcanzado.
7. Entrada de bitácora (Sesión NN) con resultado y próximo paso.

## 8. Criterios de aceptación

- Existe una skin **copiada e identificada como Sinatra**, distinta del original, versionada en `02_MODS/skins/`.
- La skin original de Mixxx **no fue modificada**; el árbol de Mixxx queda limpio y sin commits.
- La skin Sinatra **carga en Mixxx y es usable** (arranca, layout no roto).
- Se aplicaron y registraron cambios visuales **solo** en fondo, tipografía/escala, decks, mezclador y jerarquía.
- **Uso real verificado con la FLX4:** los controles del baseline de 001-B siguen operando con la nueva skin.
- Cada cambio queda documentado de forma reproducible y reversible.
- No se hizo trabajo QML ni se añadió funcionalidad.
- No se ha iniciado ninguna tarea de 001-D.

> Nota: la calidad estética **no** es criterio de cierre. El objetivo es demostrar una capa visual propia, aislada y usable; el pulido llega después.

## 9. Estados de salida

001-C termina en exactamente uno de estos estados, registrado en la cabecera de esta spec, en el checklist y en la bitácora:

1. **Cerrada.** Todos los criterios de aceptación cumplidos y puerta de salida del checklist completada. Habilita solicitar la spec independiente de 001-D — QML spike. No habilita empezarla.
2. **Abierta con bloqueo diagnosticado.** Un fallo reproducido y diagnosticado impide cumplir algún criterio, pero su resolución cabe dentro de esta spec (p. ej. la skin no carga por un identificador mal renombrado). Se continúa en una sesión nueva con esta misma spec.
3. **Requiere nueva decisión/spec.** Cumplir el objetivo exige salir del alcance de la sección 4 (p. ej. tocar QML, editar el original, modificar el motor) o reabrir ADR-001. Se detiene el trabajo y se solicita la decisión antes de continuar.

Un éxito parcial no es cierre.

## 10. Changelog

| Versión | Fecha | Cambio | Autor |
|---|---|---|---|
| 0.1 | 2026-09-20 | Borrador inicial de 001-C (Sinatra Skin), tras el cierre de 001-B. Enfoque: copia aislada de una skin legacy (LateNight), fuente en `02_MODS/skins/`, despliegue en carpeta de usuario de Mixxx, solo cambios visuales, verificación con FLX4. QML reservado para 001-D. Pendiente de revisión y aprobación. | Juan Ramón Gutiérrez (con agente Claude Code) |
