# SINATRA — Hito 001 · Checklist técnico

**Nombre:** Hacer que Frankenstein respire  
**Máquina objetivo:** GARAGE1 · ASUS ROG Zephyrus G14 (GA403UV) · Windows 11 *(antes etiquetada "SA97"; unificada a GARAGE1 el 2026-09-19)*  
**Estado formal de cada fase:** vive en la cabecera de su spec en `01_SPECS/`. Este documento registra únicamente progreso operativo (qué pasos se han hecho).

## Regla de avance

Cada fase se cierra con evidencia y una entrada en `03_NOTAS/BITACORA.md`, y termina en uno de los tres estados de salida definidos en su spec: cerrada, abierta con bloqueo diagnosticado o requiere nueva decisión/spec. No se comienza la fase siguiente por conveniencia ni mientras queden criterios de aceptación pendientes.

## 001-A — Build limpia de Mixxx

Spec: `01_SPECS/SINATRA_Hito001A_Build_Limpia.md` · v1.3 · **Cerrada** (2026-09-19, Sesión 02)

- [x] Confirmar que el repo de Mixxx está fuera de OneDrive, preferiblemente en `C:\dev\mixxx`; si ya existe, inspeccionar su estado antes de actuar. → clonado limpio en `C:\dev\mixxx`, fuera de OneDrive.
- [x] Registrar versión de Windows, build, CPU/arquitectura y espacio disponible. → Win 11 Home 26200, Ryzen 9 8945HS x64, 31 GB RAM, 330 GB libres.
- [x] Registrar remoto, rama, commit exacto de Mixxx, fecha y estado inicial del árbol. → `mixxxdj/mixxx`, `main`, `81a5eb87`, árbol limpio.
- [x] Verificar Visual Studio 2022 y el workload **Desktop development with C++**. → ausente al inicio; instalado Community 17.14 + NativeDesktop.
- [x] Verificar Git, CMake, Python y demás herramientas requeridas por el procedimiento oficial. → git 2.51, CMake 3.31.6 (bundled VS), Ninja 1.12.1, Python 3.13.7.
- [x] Registrar el entorno oficial de dependencias de Mixxx (versión/hash), según la guía oficial. → `mixxx-deps-2.7-x64-windows-1c20f84a` (SHA256 verificado).
- [x] Ejecutar el procedimiento oficial de compilación para Windows. → `windows_buildenv.bat setup` + `cmake` (toolchain vcpkg, Ninja) + `cmake --build`.
- [x] Documentar cualquier desviación antes de aplicarla. → sin desviaciones del procedimiento; instalación de toolchain documentada.
- [x] Conseguir una compilación completa sin cambios funcionales. → 1150/1150, exit 0, sin errores.
- [x] Arrancar `Mixxx.exe` desde la build local, comprobar que abre y cerrar de forma normal. → ventana `Mixxx` abierta, responsiva, sin crash; cerrada sin colgarse.
- [x] Anotar opciones de compilación relevantes para una futura prueba QML, sin activarlas. → `QML:BOOL=ON` (default), `QT6:BOOL=ON`; no modificadas.
- [x] Confirmar que no se modificaron motor, audio, skins ni mappings; árbol de Mixxx limpio. → `git status --porcelain` vacío.
- [x] Completar `04_TESTS/BUILD_NOTES.md` a partir de la plantilla.
- [x] Guardar evidencia textual sanitizada en `04_TESTS/evidence/`; nada pesado en Git.
- [x] Actualizar el estado en la cabecera de la spec con el estado de salida alcanzado.
- [x] Registrar cierre y aprendizaje en la bitácora.

### Puerta de salida 001-A

- [x] Build reproducible documentada.
- [x] Aplicación local arranca.
- [x] Árbol de trabajo de Mixxx sin cambios funcionales realizados por Sinatra.
- [x] `BUILD_NOTES.md` completo.
- [ ] Aprobación explícita para avanzar a 001-B. → **pendiente del responsable** (acción posterior al cierre; cerrar 001-A solo habilita *solicitar* la spec de 001-B).

## 001-B — FLX4 baseline

Spec: `01_SPECS/SINATRA_Hito001B_FLX4_Baseline.md` · v1.2 · **Cerrada** (2026-09-20, Sesión 04).

- [x] Crear y aprobar una spec propia. → aprobada v1.0.
- [x] Crear la plantilla `04_TESTS/FLX4_BASELINE.md` (se crea al aprobar la spec). → creada.
- [x] Preparación sin hardware (Sesión 03): mapping oficial inspeccionado (solo lectura), doc oficial de audio consultada, `FLX4_BASELINE.md` pre-rellenado. → hecho.
- [x] Conectar la Pioneer DJ DDJ-FLX4 (class-compliant, sin driver) y configurar audio en Mixxx (Master 1-2 / Cue 3-4, WASAPI 48 kHz). → hecho (Sesión 04).
- [x] Conectar la Pioneer DJ DDJ-FLX4 a la build local. → detectada; mapping oficial cargado a mano y activado.
- [x] Verificar audio principal y preescucha. → Cue y Master OK vía auriculares; RCA MASTER OUT no verificado (sin altavoces, en tránsito) — limitación documentada.
- [x] Probar decks, transporte, jogs, tempo, mixer, EQ, filtro, faders y crossfader. → todos OK.
- [x] Probar pads, hot cues, loops, FX y LEDs. → hot cues OK, beat loop OK, Beat FX OK (algunos sutiles), LEDs/sync bidireccional OK.
- [x] Registrar latencia y anomalías. → 11 ms; anomalía "Invalid sample rate" (44.1→48 kHz) resuelta y documentada.
- [x] Completar `04_TESTS/FLX4_BASELINE.md`. → completo, con evidencia `evidence/001B_flx4_detection.txt`.

### Puerta de salida 001-B

- [x] FLX4 detectada con mapping oficial.
- [x] Audio Master + Cue por la FLX4 (RCA física pendiente de altavoces).
- [x] Todos los bloques de control ejercitados y registrados.
- [x] Árbol de Mixxx sin cambios; mapping oficial sin editar.
- [ ] Aprobación explícita para avanzar a 001-C. → **pendiente del responsable**.

## 001-C — Sinatra Skin

**Bloqueado hasta cerrar 001-B.**

- [ ] Crear y aprobar una spec propia.
- [ ] Duplicar una skin; nunca modificar el original.
- [ ] Identificarla como `Sinatra` o `LateNight_Sinatra`.
- [ ] Cambiar solamente fondo, tipografía/escala, decks, mixer y jerarquía visual.
- [ ] Verificar uso real con la FLX4.

## 001-D — QML spike

**Bloqueado hasta cerrar 001-C.**

- [ ] Crear y aprobar una spec propia.
- [ ] Definir una pregunta técnica única y medible.
- [ ] Construir el experimento mínimo.
- [ ] Documentar controles expuestos, límites, acoplamiento y coste estimado.
- [ ] Detenerse y evaluar antes de ampliar el frontend.

## Revisión de rumbo

- [ ] Comparar skin clásica y QML con evidencia.
- [ ] Revisar límites entre interfaz y motor.
- [ ] Revisar implicaciones GPL solo si se plantea distribución.
- [ ] Mantener o reconsiderar la Decisión 001 (no fork) según las condiciones de `00_DOCS/DECISIONES.md`; si cambia, nueva ADR.

