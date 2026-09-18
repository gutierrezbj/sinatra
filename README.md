# SINATRA

Sinatra es un laboratorio personal para explorar una experiencia DJ más clara y moderna usando Mixxx como motor, sin reescribir la infraestructura de audio.

El proyecto se organiza alrededor de tres modos futuros:

- **Learn:** aprender pinchando, con ejercicios y feedback dentro de la cabina.
- **DJ:** una cabina clara, progresiva y conectada con hardware real.
- **Radio:** emisión, AutoDJ, micrófono y continuidad con Radio Pirata.

## Estado actual

**Exploración técnica · Hito 001-A en preparación.**

La Decisión 001 sigue vigente: **no crear un fork de Mixxx todavía**. Primero se comprobará, con una compilación limpia y experimentos aislados, cuánto puede construirse encima de Mixxx sin tocar el motor.

El foco inmediato es conseguir una build reproducible y sin modificaciones del branch `main` de Mixxx en Windows 11, dentro de la máquina SA97 (ASUS Zephyrus G14).

## Separación de responsabilidades

Este repositorio contiene únicamente la documentación, las especificaciones, las notas, las pruebas y, más adelante, copias aisladas de mods de Sinatra.

El código de Mixxx debe clonarse por separado, fuera de OneDrive, por ejemplo:

```text
C:\dev\mixxx       # repositorio oficial de Mixxx
C:\SINATRA         # este repositorio
```

No se debe copiar Mixxx dentro de este repositorio ni usar este proyecto como fork.

## Estructura

```text
SINATRA/
├── 00_DOCS/       # documentos maestros y checklists globales
├── 01_SPECS/      # una especificación aprobada por cambio
├── 02_MODS/       # futuras copias aisladas de skins y mappings
│   ├── skins/
│   └── controllers/
├── 03_NOTAS/      # bitácora de trabajo y aprendizaje
└── 04_TESTS/      # plantillas, evidencias y resultados de pruebas
```

## Reglas de trabajo

1. **SDD-first:** se escribe y aprueba una spec antes de modificar o programar.
2. **Un paso cada vez:** no se inicia una fase hasta cerrar la anterior.
3. **Upstream intacto:** en 001-A no se modifica código, skin ni mapping de Mixxx.
4. **Mods aislados:** cuando llegue su fase, se duplica el recurso original y se trabaja sobre una copia identificada como Sinatra.
5. **Bitácora obligatoria:** cada sesión registra lo realizado, lo aprendido, los fallos y el siguiente paso.
6. **Evidencia antes que intuición:** las decisiones de arquitectura se toman después de las pruebas de skin y QML, no antes.

## Ruta del Hito 001

1. **001-A — Build limpia:** compilar y arrancar Mixxx sin modificaciones.
2. **001-B — FLX4 baseline:** verificar controles, audio, LEDs y latencia con la DDJ-FLX4.
3. **001-C — Sinatra Skin:** primera modificación visual aislada sobre una copia de una skin existente.
4. **001-D — QML spike:** evaluar la ruta QML con un experimento acotado.
5. **Evaluación:** parar y decidir el siguiente rumbo con evidencia.

El alcance activo está definido en [`01_SPECS/SINATRA_Hito001A_Build_Limpia.md`](01_SPECS/SINATRA_Hito001A_Build_Limpia.md).

