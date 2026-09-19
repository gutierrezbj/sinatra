# Spec — SINATRA Hito 001-B · FLX4 baseline

| Campo | Valor |
|---|---|
| Versión | 1.1 |
| Fecha | 2026-09-19 |
| Estado | **Aprobada — lista para ejecución** |
| Autor | Juan Ramón Gutiérrez (borrador preparado con agente Claude Code) |
| Aprobador | Juan Ramón Gutiérrez |
| Fecha de aprobación | 2026-09-19 |
| Tipo | investigación técnica reproducible |
| Proyecto | Sinatra · Proyecto Radio |
| Decisión vigente | ADR-001 — no fork · ver `00_DOCS/DECISIONES.md` |
| Depende de | **001-A cerrada** (build limpia reproducida, commit `81a5eb87`) **+ aprobación explícita** de esta spec |

> **Spec aprobada el 2026-09-19.** Autoriza ejecutar 001-B siguiendo este alcance. La ejecución requiere una sesión con la **DDJ-FLX4 conectada** al equipo `GARAGE1`; hasta que se realice, no se ha tocado hardware. 001-C/D, Learn, DJ y Radio siguen bloqueados.

## 1. Objetivo

Verificar que la **Pioneer DJ DDJ-FLX4** funciona como controladora baseline contra la **build local de Mixxx de 001-A**, usando el **mapping oficial de Mixxx sin modificarlo**, y dejar registrado su comportamiento real: salida de audio principal y preescucha, controles de transporte y mezcla, pads/FX/LEDs, y latencia observada.

Esta fase valida únicamente la integración hardware↔build con recursos oficiales. **No** crea ni edita mappings, **no** crea la interfaz Sinatra (001-C) y **no** evalúa QML (001-D).

## 2. Entorno objetivo

- **Equipo:** el mismo de 001-A — `GARAGE1` (ASUS ROG Zephyrus G14 GA403UV), Windows 11.
- **Build de Mixxx:** el artefacto local de 001-A en `C:\dev\mixxx\build\x64-portable\mixxx.exe`, del commit `81a5eb877f15140136ec07148f3df3d1065cba6c` (`main`). Si se recompila, registrar el commit real usado.
- **Hardware:** Pioneer DJ DDJ-FLX4 + cable USB; auriculares para preescucha.
- **Interfaz de audio (fijada):** la **tarjeta de sonido integrada de la propia FLX4**. Según el manual oficial de Mixxx, la FLX4 es **class-compliant (audio y MIDI) y no requiere instalar drivers** en Windows. Configuración de sonido en Mixxx: **Master → canales 1-2** y **Headphones → canales 3-4** del dispositivo FLX4. Los controles de auriculares (HEADPHONES MIXING/LEVEL, CUE por canal) son hardware.
  - **Sound API:** usar **WASAPI** (reportado como funcional por la comunidad Mixxx en Windows). ASIO es **opcional**, solo si se busca menor latencia; no es obligatorio ni bloqueante.
  - *Nota:* la entrada de micrófono (TS 1/4") **no se enruta al PC**, así que no es grabable/emitible ni configurable como entrada. Fuera del alcance del baseline.
  - *Fallback degradado (no objetivo):* si no hubiera salida conectada a la FLX4, usar el audio integrado del G14 solo para Master, sin Cue separado. Se marca explícitamente como baseline parcial.
- **Mapping:** el mapping oficial de la DDJ-FLX4 incluido en Mixxx (XML + JS), **tal cual**, sin edición.
- **Documentación de referencia:** manual/wiki oficial de Mixxx para la FLX4 y para configuración de sonido, consultada en la fecha de ejecución (registrar URL y fecha).

Las versiones exactas (Mixxx, mapping, drivers, latencias) se registran durante la ejecución, no aquí.

## 3. Dentro del alcance

- Arrancar la build local de 001-A (recompilar solo si es necesario, registrando el commit).
- Conectar la FLX4 y confirmar que Windows la reconoce **sin instalar drivers** (class-compliant). Solo si se justifica por latencia, evaluar el driver ASIO oficial de Pioneer como opción documentada (no obligatorio).
- Conectar la DDJ-FLX4 por USB y confirmar que Windows y Mixxx la detectan (MIDI y audio).
- Configurar en Mixxx los dispositivos de sonido sobre la interfaz de la FLX4: **Master → canales 1-2** y **Headphones/Cue → canales 3-4**. Registrar Sound API (WASAPI por defecto), dispositivo, sample rate y tamaño de búfer usados.
- Cargar el **mapping oficial** de la FLX4 en Mixxx.
- Ejercitar de forma sistemática y registrar el resultado de:
  - Audio: salida principal y preescucha (cue) en ambos decks.
  - Transporte: play/pause, cue, carga de pista, jogs (scratch y pitch bend), tempo/pitch fader.
  - Mezcla: crossfader, line faders, EQ (3 bandas), filtro, ganancia; y headphone mix/cue.
  - Performance pads: hot cues, loops, y modos de pad disponibles; FX.
  - LEDs e iluminación: feedback de estado (play, cue, pad activo) coherente con la acción.
- Medir/estimar la **latencia** de audio (valor de búfer configurado y latencia percibida) y anotar cualquier anomalía (xruns, cortes, controles muertos, mapeos raros).
- Documentar todo en `04_TESTS/FLX4_BASELINE.md` (plantilla creada al aprobar esta spec) y guardar evidencia textual sanitizada en `04_TESTS/evidence/`.

## 4. Fuera del alcance

Fuente única de guardarraíles de esta fase.

- Crear o publicar un fork.
- Modificar código funcional de Mixxx (motor, pipeline de audio).
- **Modificar, editar o "arreglar" el mapping** de la FLX4 (XML o JavaScript). Si el mapping oficial falla, se documenta como hallazgo; no se corrige aquí.
- Modificar skins, QSS, QML ni recursos visuales.
- Crear la skin Sinatra (eso es 001-C) o cualquier experimento QML (001-D).
- Iniciar Learn, DJ o Radio.
- Copiar el repositorio o artefactos de build de Mixxx dentro de SINATRA.
- Hacer commits dentro del repositorio oficial de Mixxx.
- Versionar binarios, grabaciones de audio, capturas pesadas, credenciales o evidencia pesada (van a `04_TESTS/artifacts/`, ignorado por Git).
- Instalar drivers o software ajenos al procedimiento oficial sin documentar antes por qué son necesarios.

## 5. Restricciones

1. El repo de Mixxx y el de SINATRA permanecen separados; ningún commit dentro de `C:\dev\mixxx`.
2. Solo se usa el mapping oficial, sin editarlo.
3. No se avanza a 001-C durante esta tarea.
4. Cualquier desviación del procedimiento oficial se registra con motivo, impacto y alternativa antes de aplicarse.
5. Un fallo reproducido y diagnosticado (controlador no detectado, control muerto, latencia inaceptable, LED sin feedback) es un **resultado válido**: se documenta, no autoriza a modificar Mixxx ni el mapping.
6. Seguridad: volumen inicial bajo para proteger oídos y equipo; verificar salidas antes de subir nivel.
7. Una desviación de alcance nunca se resuelve en silencio: se detiene el trabajo y se registra.

## 6. Procedimiento de alto nivel

1. Confirmar 001-A cerrada y localizar la build local; registrar el commit de Mixxx en uso.
2. Consultar la documentación oficial vigente de Mixxx para la FLX4 y configuración de sonido; registrar URL y fecha.
3. Conectar la FLX4 por USB. Confirmar detección en Windows y en Mixxx.
4. Configurar los dispositivos de sonido (Master y Cue) y registrar API/dispositivo/sample rate/búfer.
5. Cargar el mapping oficial de la FLX4.
6. Ejecutar la batería de pruebas de la sección 3 en orden, registrando por cada bloque: qué se probó, resultado observado y cualquier anomalía.
7. Registrar latencia (búfer configurado + percepción) y estabilidad (xruns/cortes).
8. Ante un fallo: capturar el síntoma, diagnosticar, y **no** modificar Mixxx ni el mapping; si resolverlo exige salir del alcance, detenerse y solicitar decisión.
9. Verificar que el árbol de Mixxx sigue sin cambios funcionales (`git status` limpio) y que no hubo commits dentro de él.
10. Completar `04_TESTS/FLX4_BASELINE.md`, guardar evidencia sanitizada, actualizar checklist, estado de esta spec y añadir entrada de bitácora.

Los pasos concretos de configuración se toman de la documentación oficial vigente al ejecutar la fase; esta spec no los congela.

## 7. Entregables

1. `04_TESTS/FLX4_BASELINE.md` completo (plantilla creada al aprobar esta spec), con: build/commit usado, hardware, configuración de audio (API/dispositivo/sample rate/búfer), mapping y versión, resultados por bloque de controles, latencia, anomalías y conclusión.
2. Evidencia textual sanitizada en `04_TESTS/evidence/` (p. ej. extracto del log de Mixxx con detección de la controladora y de dispositivos de audio; sin rutas de usuario ni datos sensibles). Capturas o audio, si los hay, en `04_TESTS/artifacts/` (ignorado por Git).
3. Confirmación del estado limpio del árbol de Mixxx.
4. Checklist técnico actualizado.
5. Estado de esta spec actualizado en la cabecera con el estado de salida alcanzado.
6. Entrada de bitácora (Sesión NN) con resultado, aprendizaje y próximo paso.

## 8. Criterios de aceptación

- La FLX4 es detectada por Mixxx con el mapping oficial cargado.
- Suena audio por la salida principal y por la preescucha (cue) en ambos decks, con la configuración de audio registrada.
- Se ha ejercitado y registrado el resultado de: transporte, jogs, tempo, crossfader, line faders, EQ, filtro, ganancia, hot cues, loops y FX.
- Los LEDs/iluminación dan feedback coherente con la acción, o se documenta dónde no lo dan.
- Latencia y estabilidad (búfer, xruns/cortes) quedan registradas.
- Toda anomalía queda descrita de forma reproducible para una sesión futura.
- No existen cambios de Sinatra en Mixxx ni en el mapping; el árbol de Mixxx queda limpio y sin commits.
- No se ha iniciado ninguna tarea de 001-C.

> Nota: "todo funciona" **no** es requisito de cierre. El objetivo es un baseline **documentado**; un control que no responda con el mapping oficial es un hallazgo válido, no un fallo de la fase, siempre que quede reproducido.

## 9. Estados de salida

001-B termina en exactamente uno de estos estados, registrado en la cabecera de esta spec, en el checklist y en la bitácora:

1. **Cerrada.** Todos los criterios de aceptación cumplidos y puerta de salida del checklist completada. Habilita solicitar la spec independiente de 001-C — Sinatra Skin. No habilita empezarla.
2. **Abierta con bloqueo diagnosticado.** Un fallo reproducido y diagnosticado impide cumplir algún criterio, pero su resolución cabe dentro de esta spec (p. ej. reconfigurar audio, reintentar detección). Se continúa en una sesión nueva con esta misma spec.
3. **Requiere nueva decisión/spec.** Cumplir el objetivo exige salir del alcance de la sección 4 (p. ej. editar el mapping, tocar el motor) o reabrir ADR-001. Se detiene el trabajo y se solicita la decisión antes de continuar.

Un éxito parcial no es cierre.

## 10. Changelog

| Versión | Fecha | Cambio | Autor |
|---|---|---|---|
| 0.1 | 2026-09-19 | Borrador inicial de 001-B (FLX4 baseline), preparado tras el cierre de 001-A. Interfaz de audio fijada a la tarjeta integrada de la FLX4 (Master + Cue por la controladora, driver oficial Pioneer ASIO en Windows), con fallback degradado al audio del G14. | Juan Ramón Gutiérrez (con agente Claude Code) |
| 1.0 | 2026-09-19 | **Aprobada** por el responsable (Juan Ramón Gutiérrez). Etiqueta de equipo unificada a `GARAGE1`. Habilita la ejecución de 001-B en una sesión con la FLX4 conectada. | Juan Ramón Gutiérrez |
| 1.1 | 2026-09-19 | **Corrección desde doc oficial** (prep sin hardware): la FLX4 es class-compliant y **no requiere driver** en Windows (ASIO opcional). Configuración de sonido fijada: Master 1-2, Headphones 3-4; Sound API WASAPI. Añadida nota de mic no enrutado. Sin cambio de alcance. | Juan Ramón Gutiérrez (con agente Claude Code) |
