# SINATRA — Skin Notes · Hito 001-C

> Plantilla creada al aprobar la spec 001-C (2026-09-20). Se rellena **durante** la ejecución, no al final. No completar campos por suposición. Spec: `01_SPECS/SINATRA_Hito001C_Sinatra_Skin.md`.

## Identificación

| Campo | Valor |
|---|---|
| Fecha y hora | 2026-09-20 — Sesión 05 (ejecución) |
| Responsable | Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8) |
| Equipo | GARAGE1 — ASUS ROG Zephyrus G14 |
| Build de Mixxx | `81a5eb87` (build de 001-A) |
| Skin base | LateNight (legacy) |
| Nombre de la copia | `LateNight_Sinatra` |
| Fuente versionada | `02_MODS/skins/LateNight_Sinatra` |
| Despliegue (no versionado) | `%LOCALAPPDATA%\Mixxx\skins\LateNight_Sinatra` |
| Resultado final | **Éxito** |
| Estado de salida de 001-C | **Cerrada** |

## Fuente del procedimiento

- URL(s) doc oficial de skins de Mixxx:
- Fecha de consulta:
- Ruta de la skin base LateNight en la build:

## Duplicación

- ¿Copiada a `02_MODS/skins/LateNight_Sinatra`?: **Sí** (902 archivos, 5.5 MB) desde `C:\dev\mixxx\res\skins\LateNight`.
- Identificadores internos renombrados (dónde): `skin.xml` → `<manifest>`: title "LateNight Sinatra", author (Sinatra sobre LateNight), version `0.1-sinatra`, description y language `es`. Licencia CC BY-SA conservada con atribución.
- ¿Mixxx la muestra como skin distinta?: **Sí** — carga como "LateNight_Sinatra".
- ¿Original intacto?: **Sí** — `C:\dev\mixxx` con `git status` limpio; original no tocado.
- Despliegue: copiada a `%LOCALAPPDATA%\Mixxx\skins\LateNight_Sinatra` (no versionado) y fijada en `mixxx.cfg` (`ResizableSkin	LateNight_Sinatra`; backup en `mixxx.cfg.sinatra.bak`).

## Cambios visuales aplicados

Solo: fondo, tipografía/escala, decks, mezclador, jerarquía. Un cambio por fila.

| # | Área | Archivo | Propiedad/qué se cambió | Motivo | Reversible |
|---|---|---|---|---|---|
| 1 | Fondo | `style_palemoon.qss` | Familia de grises de fondo → tintes azul profundo (mantiene luminosidad): `#0c0c0c→#0a0f1e`, `#0f0f0f→#0c1122`, `#151517→#101627`, `#171719→#12182b`, `#19191a→#141b2f`, `#1c1c1c→#161e34`, `#1e1e20→#182038`, `#212123→#1b243d`, `#292929→#212c48` | Identidad "azul profundo nocturno"; acentos teal existentes (#146674/#257b82) conservados como cian | sí |
| 2 | Carga QSS | `skin.xml` (esquema PaleMoon) | `<Style src="skins:LateNight/style_palemoon.qss"/>` → `<Style src="skin:style_palemoon.qss"/>` | Cargar MI QSS azul (prefijo `skin:` singular = carpeta de la skin) sin duplicar el resto | sí |
| 3 | Acento | `style_palemoon.qss` | Acento naranja `#b24c12` → **cian Sinatra `#18b8d8`** (5×); grises residuales `#080808→#070b16`, `#151515→#141b2f`, `#040404→#05070f` | Acento propio cian coherente con el navy; uniformar fondos | sí |
| 4 | Tipografía | `style_palemoon.qss` | Regla nueva: `font-family: "Bahnschrift","Segoe UI",sans-serif` para labels/tabla/botones | Identidad tipográfica (Bahnschrift, condensada, nativa Win11) | sí |

### Problema resuelto — Pantalla negra tras el repunte

- **Síntoma:** tras copiar y repuntar `skins:LateNight/`→`skins:LateNight_Sinatra/` en todos los archivos (1109 refs), Mixxx cargaba la skin pero la ventana salía **casi toda negra**.
- **Causa (diagnóstico en log + fuente):** el prefijo `skins:` (plural) resuelve **solo** contra `getResourcePath()+"skins/"` = `C:/dev/mixxx/res/skins/` (`legacyskinparser.cpp:423-424`, `:2685`). Como la copia vive en la carpeta de usuario, `skins:LateNight_Sinatra/...` no existía en `res/skins` → `Could not open template file` para mixer/decks/library/etc.
- **Solución:** **revertido el repunte** (todo lo estructural y los SVG tiran del LateNight del sistema, que sí resuelve) y cargada **solo** la QSS propia con el prefijo **`skin:`** (singular = carpeta de la skin actual; patrón válido, usado por Deere 374×). Sin tocar `res/skins`; árbol de Mixxx limpio.
- **Aprendizaje:** una copia de skin fuera de `res/skins` **no** puede auto-referenciarse con `skins:<nombre>/`; para archivos propios se usa `skin:` (singular) o rutas relativas.

## Carga y usabilidad

- ¿La skin Sinatra carga sin romper el layout?: **Sí** — log: `Loaded skin "LateNight_Sinatra"`. Mixxx arranca con ventana usable.
- ¿Arranca a estado usable?: **Sí** (idéntica a LateNight de momento; aún sin cambios visuales aplicados).
- Mensajes/errores relevantes: diálogo normal de primera carga ("¿ocultar barra de menú?").

## Verificación con la FLX4

- ¿Los controles del baseline (001-B) siguen operando con la nueva skin?: **Sí** — carga de pista desde la consola y audio por auriculares respondiendo con la skin Sinatra cargada.
- Anomalías visuales/funcionales: ninguna; render completo, texto legible, sin errores de parsing en el log.

## Verificación de alcance

- [x] Solo se modificó la copia; el original de la skin quedó intacto.
- [x] No se tocó el repo de Mixxx (sin commits dentro); árbol limpio.
- [x] No se hizo trabajo QML.
- [x] No se añadió funcionalidad ni controles nuevos (solo visual).
- [x] No se creó ni publicó un fork.
- [x] Sin binarios pesados en Git (la copia de skin va a `02_MODS/skins/`, ~5.5 MB de SVG/PNG propios del asset; capturas a `artifacts/`).

## Estado final del árbol de Mixxx

```text
git status --porcelain            -> (vacío: árbol de Mixxx limpio)
git status --porcelain res/skins/LateNight -> (vacío: original intacto)
Ningún commit dentro de C:\dev\mixxx.
```

## Conclusión

- ¿001-C cumple todos los criterios de aceptación?: **Sí.** Skin copiada e identificada como Sinatra (`LateNight_Sinatra`), original intacto, carga y es usable, cambios solo visuales (fondo azul, acento cian, tipografía Bahnschrift), y verificada con la FLX4.
- Criterios pendientes: ninguno. La skin es un primer look intencionadamente sobrio (la calidad estética no es criterio de cierre).
- Estado de salida (uno solo, según la sección 9 de la spec):
  - [x] **Cerrada**
  - [ ] Abierta con bloqueo diagnosticado
  - [ ] Requiere nueva decisión/spec
- Justificación del estado: existe una capa visual propia, aislada y usable, construida sin fork y sin tocar Mixxx (refuerza ADR-001). Se documentó y resolvió un bloqueo (pantalla negra por el prefijo `skins:`). Árbol de Mixxx limpio.
- Próximo paso autorizado: **ninguno automático.** Cerrar 001-C habilita *solicitar* la spec independiente de **001-D — QML spike**; no habilita empezarla. Requiere aprobación explícita del responsable.
