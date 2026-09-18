# SINATRA — Hito 001 · Checklist técnico

**Nombre:** Hacer que Frankenstein respire  
**Estado:** 001-A preparado · resto bloqueado  
**Máquina objetivo:** SA97 · ASUS Zephyrus G14 · Windows 11

## Regla de avance

Cada fase se cierra con evidencia y una entrada en `03_NOTAS/BITACORA.md`. No se comienza la fase siguiente por conveniencia ni mientras queden criterios de aceptación pendientes.

## 001-A — Build limpia de Mixxx

- [ ] Confirmar que el repo de Mixxx está fuera de OneDrive, preferiblemente en `C:\dev\mixxx`.
- [ ] Registrar versión de Windows y arquitectura.
- [ ] Registrar commit exacto de Mixxx usado.
- [ ] Verificar Visual Studio 2022 y el workload **Desktop development with C++**.
- [ ] Verificar Git y CMake requeridos por el procedimiento oficial.
- [ ] Ejecutar el procedimiento oficial de compilación para Windows.
- [ ] Documentar cualquier desviación antes de aplicarla.
- [ ] Conseguir una compilación completa sin cambios funcionales.
- [ ] Arrancar `Mixxx.exe` desde la build local.
- [ ] Confirmar que no se modificaron motor, audio, skins ni mappings.
- [ ] Completar `04_TESTS/BUILD_NOTES.md` a partir de la plantilla.
- [ ] Añadir evidencia suficiente sin incluir binarios ni archivos pesados en Git.
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
- [ ] Completar `04_TESTS/FLX4_BASELINE.md`.

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
- [ ] Mantener o reconsiderar la Decisión 001: no fork.

