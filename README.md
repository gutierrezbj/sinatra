# SINATRA

Sinatra es un laboratorio personal para explorar una experiencia DJ más clara y moderna usando Mixxx como motor, sin reescribir la infraestructura de audio.

El proyecto se organiza alrededor de tres modos futuros:

- **Learn:** aprender pinchando, con ejercicios y feedback dentro de la cabina.
- **DJ:** una cabina clara, progresiva y conectada con hardware real.
- **Radio:** emisión, AutoDJ, micrófono y continuidad con Radio Pirata.

## Rumbo y decisión vigente

Ruta ratificada: **Windows 11 en SA97 → Mixxx como motor → FLX4 → interfaz Sinatra → QML → Learn.**

La [Decisión 001](00_DOCS/DECISIONES.md) sigue vigente: **no crear un fork de Mixxx todavía**. Primero se comprueba, con una build limpia y experimentos aislados, cuánto puede construirse encima de Mixxx sin tocar el motor. La versión móvil queda como posible evolución futura y no forma parte del alcance actual.

## Fase activa

**Hito 001-A — Build limpia** en SA97 (ASUS Zephyrus G14, Windows 11).

- Estado formal, alcance, entregables y aceptación: [`01_SPECS/SINATRA_Hito001A_Build_Limpia.md`](01_SPECS/SINATRA_Hito001A_Build_Limpia.md)
- Progreso operativo: [`00_DOCS/SINATRA_Hito001_Checklist_Tecnico.md`](00_DOCS/SINATRA_Hito001_Checklist_Tecnico.md)
- Reglas para quien trabaja aquí, humano o agente: [`AGENTS.md`](AGENTS.md)

## Separación de responsabilidades

Este repositorio contiene únicamente documentación, especificaciones, notas, evidencia textual y, más adelante, copias aisladas de mods de Sinatra.

El código de Mixxx debe clonarse por separado, fuera de OneDrive:

```text
C:\dev\mixxx       # repositorio oficial de Mixxx
C:\ProyectosIA\Sinatra   # este repositorio
```

No se debe copiar Mixxx dentro de este repositorio ni usar este proyecto como fork.

## Estructura

```text
SINATRA/
├── AGENTS.md          # reglas de trabajo para humanos y agentes
├── README.md
├── 00_DOCS/           # decisiones (ADR) y checklists globales
├── 01_SPECS/          # una especificación aprobada por cambio, más plantilla
├── 02_MODS/           # futuras copias aisladas de skins y mappings
│   ├── skins/
│   └── controllers/
├── 03_NOTAS/          # bitácora de trabajo y aprendizaje
└── 04_TESTS/          # plantillas, notas de build y evidencia
    ├── evidence/      # texto pequeño y sanitizado, versionado
    └── artifacts/     # binarios, capturas y builds, ignorado por Git
```

## Cómo se trabaja

Tres principios; el detalle está en `AGENTS.md` y en cada spec.

1. **SDD-first:** nada se ejecuta sin una spec aprobada.
2. **Un paso cada vez:** una fase no empieza hasta cerrar la anterior con evidencia y bitácora.
3. **Upstream intacto:** Mixxx no se modifica; los mods de Sinatra son copias aisladas e identificadas.

## Ruta del Hito 001

1. **001-A — Build limpia:** compilar y arrancar Mixxx sin modificaciones.
2. **001-B — FLX4 baseline:** verificar controles, audio, LEDs y latencia con la DDJ-FLX4.
3. **001-C — Sinatra Skin:** primera modificación visual aislada sobre una copia de una skin existente.
4. **001-D — QML spike:** evaluar la ruta QML con un experimento acotado.
5. **Revisión de rumbo:** parar y decidir el siguiente paso con evidencia; incluye mantener o reconsiderar la Decisión 001.
