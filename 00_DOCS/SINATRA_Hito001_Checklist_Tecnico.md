# SINATRA — Hito 001 · Checklist técnico

**Nombre:** Hacer que Frankenstein respire  
**Máquina objetivo:** SA97 · ASUS Zephyrus G14 · Windows 11  
**Estado formal de cada fase:** vive en la cabecera de su spec en `01_SPECS/`. Este documento registra únicamente progreso operativo (qué pasos se han hecho).

## Regla de avance

Cada fase se cierra con evidencia y una entrada en `03_NOTAS/BITACORA.md`, y termina en uno de los tres estados de salida definidos en su spec: cerrada, abierta con bloqueo diagnosticado o requiere nueva decisión/spec. No se comienza la fase siguiente por conveniencia ni mientras queden criterios de aceptación pendientes.

## 001-A — Build limpia de Mixxx

Spec: `01_SPECS/SINATRA_Hito001A_Build_Limpia.md` · v1.2 · Aprobada — lista para ejecución

- [ ] Confirmar que el repo de Mixxx está fuera de OneDrive, preferiblemente en `C:\dev\mixxx`; si ya existe, inspeccionar su estado antes de actuar.
- [ ] Registrar versión de Windows, build, CPU/arquitectura y espacio disponible.
- [ ] Registrar remoto, rama, commit exacto de Mixxx, fecha y estado inicial del árbol.
- [ ] Verificar Visual Studio 2022 y el workload **Desktop development with C++**.
- [ ] Verificar Git, CMake, Python y demás herramientas requeridas por el procedimiento oficial.
- [ ] Registrar el entorno oficial de dependencias de Mixxx (versión/hash), según la guía oficial.
- [ ] Ejecutar el procedimiento oficial de compilación para Windows.
- [ ] Documentar cualquier desviación antes de aplicarla.
- [ ] Conseguir una compilación completa sin cambios funcionales.
- [ ] Arrancar `Mixxx.exe` desde la build local, comprobar que abre y cerrar de forma normal.
- [ ] Anotar opciones de compilación relevantes para una futura prueba QML, sin activarlas.
- [ ] Confirmar que no se modificaron motor, audio, skins ni mappings; árbol de Mixxx limpio.
- [ ] Completar `04_TESTS/BUILD_NOTES.md` a partir de la plantilla.
- [ ] Guardar evidencia textual sanitizada en `04_TESTS/evidence/`; nada pesado en Git.
- [ ] Actualizar el estado en la cabecera de la spec con el estado de salida alcanzado.
- [ ] Registrar cierre y aprendizaje en la bitácora.

### Puerta de salida 001-A

- [ ] Build reproducible documentada.
- [ ] Aplicación local arranca.
- [ ] Árbol de trabajo de Mixxx sin cambios funcionales realizados por Sinatra.
- [ ] `BUILD_NOTES.md` completo.
- [ ] Aprobación explícita para avanzar a 001-B.

## 001-B — FLX4 baseline

**Bloqueado hasta cerrar 001-A.**

- [ ] Crear y aprobar una spec propia.
- [ ] Conectar la Pioneer DJ DDJ-FLX4 a la build local.
- [ ] Verificar audio principal y preescucha.
- [ ] Probar decks, transporte, jogs, tempo, mixer, EQ, filtro, faders y crossfader.
- [ ] Probar pads, hot cues, loops, FX y LEDs.
- [ ] Registrar latencia y anomalías.
- [ ] Completar `04_TESTS/FLX4_BASELINE.md` (su plantilla se crea al aprobar la spec de 001-B, no antes).

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

