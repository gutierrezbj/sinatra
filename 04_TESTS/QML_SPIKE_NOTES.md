# SINATRA — QML Spike Notes · Hito 001-D

> Plantilla creada al aprobar la spec 001-D (2026-09-20). Se rellena **durante** la ejecución, no al final. Spec: `01_SPECS/SINATRA_Hito001D_QML_Spike.md`.

## Identificación

| Campo | Valor |
|---|---|
| Fecha y hora | |
| Responsable | |
| Equipo | GARAGE1 — ASUS ROG Zephyrus G14 |
| Build de Mixxx | `81a5eb87` (QML:BOOL=ON, Qt6) |
| Pregunta única | ¿Puede un QML propio leer un control del motor en vivo y dar feedback ante una condición simple, sin fork? |
| Criterio de éxito | Indicador "✓ igualados" cuando \|BPM1−BPM2\| < 0.5, reacción < 1 s |
| Resultado final | Éxito / Parcial / Fallo |
| Recomendación Learn | GO / NO-GO / GO con condiciones |
| Estado de salida de 001-D | Cerrada / Abierta con bloqueo diagnosticado / Requiere nueva decisión/spec |

## Fuente del procedimiento

- URL(s) doc oficial QML de Mixxx (API de controles, estructura de skin/módulo QML):
- Fecha de consulta:
- Referencias en el código de Mixxx (LateNightQML, API QML):

## Mecanismo de acceso a controles (hallazgos)

- ¿Cómo lee un QML un control del motor? (objeto/proxy, sintaxis):
- ¿Cómo se observa un cambio en vivo?:
- Controles usados (grupo/clave): p. ej. `[Channel1],bpm`, `[Channel2],bpm`
- ¿Cómo se carga el QML sobre la build de 001-A? (skin QML aislada / punto de carga):

## Experimento

- Componente creado (ruta, copia aislada):
- Condición implementada:
- Cómo se provocó (software / FLX4):

## Resultado

- ¿El indicador reacciona al igualar BPM?:
- Latencia de reacción observada:
- Capturas (en `artifacts/`):

## Controles expuestos · límites · acoplamiento · coste

- Controles que la API QML permitió exponer:
- Límites encontrados (qué NO se pudo):
- Acoplamiento con el motor (¿frágil?, ¿depende de internals?):
- Coste estimado de construir Learn por esta vía (orden de magnitud):

## Verificación de alcance

- [ ] Un solo experimento; no se amplió el frontend.
- [ ] Copia aislada; original no tocado.
- [ ] No se tocó el motor, audio ni mappings; sin commits dentro de `C:\dev\mixxx`.
- [ ] No se creó ni publicó un fork.
- [ ] No se construyó el modo Learn (solo el spike).

## Estado final del árbol de Mixxx

```text
# git status --porcelain (vacío = limpio).
```

## Conclusión

- ¿La pregunta quedó respondida (sí/no) con evidencia?:
- Recomendación go/no-go para Learn y por qué:
- Estado de salida (uno solo, sección 10 de la spec):
  - [ ] Cerrada
  - [ ] Abierta con bloqueo diagnosticado
  - [ ] Requiere nueva decisión/spec
- Próximo paso autorizado:
