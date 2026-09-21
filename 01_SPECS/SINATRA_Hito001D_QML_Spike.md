# Spec — SINATRA Hito 001-D · QML spike (¿es viable el modo Learn?)

| Campo | Valor |
|---|---|
| Versión | 1.1 |
| Fecha | 2026-09-21 |
| Estado | **Cerrada — GO.** QML lee el motor en vivo y da feedback (Sesiones 05-06). Ver `04_TESTS/QML_SPIKE_NOTES.md` |
| Autor | Juan Ramón Gutiérrez (borrador preparado con agente Claude Code) |
| Aprobador | Juan Ramón Gutiérrez |
| Fecha de aprobación | 2026-09-20 |
| Tipo | experimento técnico acotado |
| Proyecto | Sinatra · Proyecto Radio |
| Decisión vigente | ADR-001 — no fork · ver `00_DOCS/DECISIONES.md` |
| Depende de | **001-C cerrada** (skin propia) **+ aprobación explícita** de esta spec |

> **Spec aprobada el 2026-09-20.** Autoriza ejecutar el spike con este alcance: un único componente QML sobre la build de 001-A, copia aislada, sin fork ni tocar el motor. Termina en una recomendación go/no-go para el modo Learn.

## 1. Objetivo

Responder, con un experimento **mínimo y medible**, a la pregunta que decide todo el futuro de Sinatra:

> **¿Se puede construir la base del modo Learn —una interfaz propia en QML, encima de Mixxx, que lea el estado en vivo del motor y dé feedback en tiempo real— sin forkear ni modificar el motor?**

Learn necesita UI propia con lógica (mostrar un ejercicio, detectar si se hizo bien, dar feedback). Eso una skin legacy no lo hace; QML sí. Esta fase **no construye Learn**: solo prueba si el camino es viable y a qué coste.

## 2. Pregunta técnica única (medible)

**¿Puede un componente QML propio, cargado sobre la build de Mixxx de 001-A, leer un control del motor en vivo (p. ej. el BPM o el estado de reproducción de un deck) y cambiar su presentación cuando se cumple una condición sencilla?**

Criterio de éxito medible (**fijado en aprobación, 2026-09-20**):
- Un indicador QML propio que pase a **"✓ igualados"** cuando la diferencia de BPM entre Deck 1 y Deck 2 sea **< 0.5 BPM**, y vuelva a "✗" al desigualarse, con **reacción visible < 1 s**. Enlaza con Learn/Lección 01 ("igualar el tempo").

## 3. Entorno objetivo

- **Equipo:** `GARAGE1` (ASUS ROG Zephyrus G14), Windows 11.
- **Build de Mixxx:** la de 001-A (`81a5eb87`), con `QML:BOOL=ON` y Qt 6 (ya confirmado en 001-A).
- **Hardware:** FLX4 disponible para probar el feedback con controles reales (opcional para el mínimo; el estado se puede provocar también desde el software).
- **Punto de partida QML:** la infraestructura QML de Mixxx en `main` (skin **LateNightQML** y API QML de Mixxx). El mecanismo exacto de acceso a controles se toma de la **documentación oficial vigente** (registrar URL y fecha).

## 4. Dentro del alcance

- Consultar la documentación oficial de Mixxx sobre **QML y su API de controles** (cómo un QML lee/observa un `control` del motor).
- Construir **un único** componente QML mínimo que:
  - lea un control en vivo (BPM o play de un deck), y
  - cambie su presentación al cumplirse una condición simple (feedback).
- Cargarlo sobre la build de 001-A por el mecanismo oficial (skin QML aislada o el punto de carga que indique la doc), **sin editar el original** (copia aislada, como en 001-C).
- Medir y documentar: **qué controles se pueden exponer, límites, acoplamiento con el motor y coste estimado** de construir Learn por esta vía.
- Emitir una **recomendación go/no-go** para el modo Learn.

## 5. Fuera del alcance

Fuente única de guardarraíles de esta fase.

- Construir el modo Learn (lecciones, múltiples ejercicios, progreso, persistencia). Esto es **solo** el spike.
- Crear o publicar un fork.
- Modificar el motor, el pipeline de audio, los mappings o cualquier archivo del repo de Mixxx; ningún commit dentro de `C:\dev\mixxx`.
- Editar la skin/QML original de Mixxx (se trabaja sobre copia aislada).
- Ampliar el frontend más allá del único experimento (regla: **parar y evaluar antes de ampliar**).
- Añadir dependencias o herramientas fuera del procedimiento oficial sin documentar antes por qué.

## 6. Restricciones

1. Repos separados; ningún commit dentro de `C:\dev\mixxx`.
2. Un solo experimento, una sola pregunta. Nada de "ya que estoy, añado…".
3. Trabajo sobre copia aislada; el original no se toca.
4. Cambios mínimos y reversibles; cada decisión documentada.
5. Un resultado negativo bien diagnosticado (p. ej. "la API QML no expone X") es **resultado válido**: informa el go/no-go, no autoriza forzar el motor.
6. Se detiene y evalúa antes de ampliar el frontend (lo dice el objetivo).
7. Una desviación de alcance nunca se resuelve en silencio: se para y se registra.

## 7. Procedimiento de alto nivel

1. Confirmar 001-C cerrada y la build de 001-A con QML disponible.
2. Consultar la doc oficial de QML de Mixxx: cómo se estructura una skin/módulo QML y cómo un QML observa un control del motor. Registrar URL y fecha.
3. Fijar el criterio de éxito medible (sección 2) con el responsable.
4. Construir el componente QML mínimo en una **copia aislada**.
5. Cargarlo sobre la build de 001-A y provocar la condición (desde software o con la FLX4).
6. Observar el feedback; medir latencia de reacción y anotar qué controles fueron accesibles.
7. Documentar controles expuestos, límites, acoplamiento y **coste estimado** de Learn.
8. Verificar que el original y el repo de Mixxx siguen intactos.
9. Escribir la **recomendación go/no-go** y registrar checklist, estado de spec y bitácora.

## 8. Entregables

1. Componente QML mínimo del spike (copia aislada, versionado en `02_MODS/`).
2. Notas del experimento (`04_TESTS/QML_SPIKE_NOTES.md`, creada al aprobar) con: pregunta, mecanismo de acceso a controles, qué se pudo/no se pudo, latencia, límites, acoplamiento, **coste estimado** y **go/no-go**.
3. Evidencia textual sanitizada en `04_TESTS/evidence/`; capturas en `04_TESTS/artifacts/`.
4. Confirmación de árbol de Mixxx intacto.
5. Checklist técnico actualizado.
6. Estado de esta spec actualizado en la cabecera.
7. Entrada de bitácora con resultado y recomendación.

## 9. Criterios de aceptación

- La pregunta técnica única quedó respondida **sí o no**, con evidencia.
- Si es "sí": existe un QML propio que lee un control en vivo y da feedback ante una condición simple, cargado sobre la build de 001-A.
- Si es "no": queda **reproducido y diagnosticado** por qué (qué límite de la API/QML lo impide).
- Documentados: controles expuestos, límites, acoplamiento y coste estimado de Learn.
- Emitida una recomendación **go/no-go** para el modo Learn.
- No se tocó el motor, los mappings ni el original; árbol de Mixxx limpio, sin fork.
- No se amplió el frontend más allá del spike.

> Nota: el objetivo **no** es que quede bonito ni completo, sino **saber si la vía Learn es viable** antes de invertir en ella.

## 10. Estados de salida

1. **Cerrada.** La pregunta quedó respondida con evidencia y hay recomendación go/no-go; puerta de salida del checklist completada. Habilita **decidir el rumbo** (revisión del Hito 001) y, si procede, solicitar la spec del modo Learn.
2. **Abierta con bloqueo diagnosticado.** Un fallo reproducido impide completar el experimento pero su solución cabe en esta spec (p. ej. cargar mal el QML). Se continúa en sesión nueva con esta misma spec.
3. **Requiere nueva decisión/spec.** Lograr el objetivo exige salir del alcance (tocar el motor, forkear) o reabrir ADR-001. Se detiene y se solicita la decisión.

Un éxito parcial no es cierre.

## 11. Changelog

| Versión | Fecha | Cambio | Autor |
|---|---|---|---|
| 0.1 | 2026-09-20 | Borrador inicial de 001-D (QML spike), enfocado a la pregunta que decide el modo Learn: ¿se puede leer el motor y dar feedback en QML sobre Mixxx sin fork? Experimento único y medible. | Juan Ramón Gutiérrez (con agente Claude Code) |
| 1.0 | 2026-09-20 | **Aprobada** por el responsable. Criterio de éxito fijado: indicador QML "✓ igualados" cuando |BPM1−BPM2| < 0.5, reacción < 1 s. Habilita la ejecución del spike. | Juan Ramón Gutiérrez |
| 1.1 | 2026-09-21 | **Estado → Cerrada (GO).** Spike ejecutado (Sesiones 05-06): indicador QML aislado en `LateNightQML_Sinatra` que lee `[ChannelN],bpm` vía `Mixxx.ControlProxy` y da feedback reactivo en vivo (verde "✓ igualados", vuelve a "✗" al desigualar, < 1 s), probado desde consola y software. Recomendación **GO** para Learn con nota de empaquetado (developer mode + deps compartidas). Sin fork; originales de Mixxx intactos. | Juan Ramón Gutiérrez (con agente Claude Code) |
