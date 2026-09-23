# SINATRA — Bitácora

Registro cronológico de sesiones técnicas y de aprendizaje. Una entrada por sesión, siguiendo la plantilla. **Las nuevas sesiones se añaden al final del archivo.** No se reescriben entradas anteriores para maquillar resultados; una corrección se anota fechada dentro de la entrada afectada.

## Plantilla de entrada

Copiar tal cual, al final del archivo, con el mismo nivel de encabezado que las entradas existentes:

```markdown
## AAAA-MM-DD · Sesión NN · Título corto

**Fase:** 001-A / 001-B / 001-C / 001-D  
**Responsable:**  
**Commit Mixxx:** (SHA o "no aplica")  
**Objetivo de la sesión:**

### Qué se hizo

-

### Resultado

- (estado de salida si la sesión cierra una fase: cerrada / abierta con bloqueo diagnosticado / requiere nueva decisión/spec)

### Qué funcionó

-

### Qué falló o quedó incierto

-

### Decisiones y razones

-

### Qué aprendimos

-

### Evidencia relacionada

- (commit de Sinatra, archivos en `04_TESTS/evidence/`, notas de build)

### Siguiente paso

-
```

---

## 2026-09-18 · Sesión 00 · Preparación del laboratorio

> Entrada completada el 2026-09-19 para ajustarla a la plantilla (faltaban responsable, resultado, qué funcionó, qué falló, aprendizaje y evidencia). El contenido original se conserva; solo se añaden secciones.

**Fase:** 001-A  
**Responsable:** Juan Ramón Gutiérrez  
**Commit Mixxx:** no aplica (no se tocó Mixxx)  
**Objetivo de la sesión:** preparar la estructura documental de Sinatra antes de actuar sobre Mixxx.

### Qué se hizo

- Se creó el repositorio documental base con separación entre docs, specs, mods, notas y pruebas.
- Se definió el alcance estricto de 001-A.
- Se dejaron bloqueadas por diseño las fases FLX4, skin y QML hasta cerrar la build limpia.

### Resultado

- Estructura documental creada y versionada. 001-A queda preparada, no ejecutada.

### Qué funcionó

- La separación de carpetas y la plantilla de BUILD_NOTES quedaron utilizables desde el primer commit.
- Acotar 001-A a "solo compilar y arrancar" evitó mezclar objetivos.

### Qué falló o quedó incierto

- La propia entrada de bitácora no siguió la plantilla completa.
- La Decisión 001 quedó citada en varios documentos pero sin registro propio.
- El estado de 001-A se escribió en tres sitios con tres redacciones distintas.
- Las prohibiciones se copiaron en README, AGENTS y spec, con deriva ya visible en los entregables.

### Decisiones y razones

- Mixxx permanecerá en un repositorio oficial independiente; Sinatra no empieza como fork.
- Los comandos de build no se congelan en la spec: se tomarán de la documentación oficial vigente durante la ejecución y se registrarán en las notas de build.

### Qué aprendimos

- Documentar antes de ejecutar funciona, pero la documentación también necesita una fuente única por concepto o se degrada igual que el código.

### Evidencia relacionada

- Commit `28ef790` — "docs: initialize Sinatra technical workspace".

### Siguiente paso

- Ejecutar `01_SPECS/SINATRA_Hito001A_Build_Limpia.md` en SA97.

---

## 2026-09-19 · Sesión 01 · Consolidación documental

**Fase:** 001-A (Fase 0 previa: gobernanza)  
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code  
**Commit Mixxx:** no aplica (no se tocó Mixxx)  
**Objetivo de la sesión:** auditar el diseño del workspace, corregir incoherencias y dejar la gobernanza consolidada antes de ejecutar 001-A. Ratificar el rumbo.

### Qué se hizo

- Auditoría de estructura, spec, checklist, bitácora, plantillas y `.gitignore`.
- Ratificada la ruta: Windows 11 en SA97 → Mixxx → FLX4 → interfaz Sinatra → QML → Learn. Móvil queda como evolución futura; djay solo como referencia.
- Creado `00_DOCS/DECISIONES.md` con ADR-001 (no fork): contexto, alternativas, consecuencias y condiciones de revisión.
- Spec 001-A a v1.1: cabecera formal (versión, fecha, estado, autor, aprobador, changelog), fuente única de alcance, tres estados de salida.
- `AGENTS.md` y `README.md` desduplicados: enlazan a la spec; AGENTS conserva un resumen de guardarraíles.
- Estado formal pasa a la cabecera de la spec; el checklist queda como progreso operativo.
- Creada `01_SPECS/_TEMPLATE_SPEC.md`.
- `04_TESTS/evidence/` pasa a versionarse (texto pequeño y sanitizado, ~100 KB por archivo); `04_TESTS/artifacts/` sigue ignorada.
- `BUILD_NOTES.template.md`: filas para entorno oficial de dependencias y opciones QML observadas, marcadas "verificar en la guía oficial"; conclusión con los tres estados de salida.
- Sesión 00 completada según plantilla; fijado el orden de entradas (nuevas al final).

### Resultado

- Fase 0 cerrada con el commit "docs: consolidate Sinatra governance". 001-A sigue **Aprobada — lista para ejecución**, no ejecutada.

### Qué funcionó

- La auditoría encontró deriva real entre documentos antes de que hubiera trabajo técnico encima.

### Qué falló o quedó incierto

- 001-A no pudo ejecutarse en esta sesión: el agente corría en un contenedor Linux efímero, no en SA97/Windows 11. No se simuló la compilación.
- Los detalles del entorno oficial de dependencias de Mixxx y de las opciones QML no se verificaron contra la guía oficial; quedan como campos a comprobar durante la ejecución.

### Decisiones y razones

- Ratificada ADR-001 sin cambios.
- Un éxito parcial nunca cuenta como cierre: se formalizan tres estados de salida por fase.

### Qué aprendimos

- Con varias copias de la misma regla, la deriva aparece en el primer commit. Fuente única y enlaces.

### Evidencia relacionada

- Commit "docs: consolidate Sinatra governance" en la rama `claude/revision-general-ulbeby`.

### Siguiente paso

- Ejecutar 001-A en SA97 siguiendo la spec v1.1 y registrar en `04_TESTS/BUILD_NOTES.md`. Segundo commit previsto: "docs: record Mixxx clean build baseline".

---

## 2026-09-19 · Sesión 02 · Build limpia de Mixxx (ejecución de 001-A)

**Fase:** 001-A
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8)
**Commit Mixxx:** `81a5eb877f15140136ec07148f3df3d1065cba6c` (`main`, 2026-09-19)
**Objetivo de la sesión:** ejecutar 001-A de verdad sobre Windows 11 (por fin en el equipo real, no en contenedor Linux): compilar Mixxx `main` sin modificaciones y arrancarlo desde la build local.

### Qué se hizo

- Inventario real del entorno: ROG Zephyrus G14 GA403UV (hostname `GARAGE1`), Win 11 Home build 26200, Ryzen 9 8945HS x64, 31 GB RAM, 330 GB libres. git 2.51 y Python 3.13.7 presentes; **VS 2022 y CMake ausentes**.
- Confirmado repo SINATRA en rama `claude/revision-general-ulbeby`, limpio y al día; ambas rutas (`C:\ProyectosIA\Sinatra`, `C:\dev\mixxx`) fuera de OneDrive.
- Consultada la guía oficial (Compiling On Windows, mixxxdj/mixxx wiki, 2026-09-19). Todos los comandos salen de ahí.
- Provisto el toolchain oficial: VS 2022 Community + workload "Desktop development with C++" (winget), que aporta MSVC 14.44, CMake 3.31.6 y Ninja 1.12.1.
- Clonado el repo oficial en `C:\dev\mixxx` (sin fork). Registrado remoto, rama, commit y estado limpio antes de compilar.
- `tools\windows_buildenv.bat setup` → deps `mixxx-deps-2.7-x64-windows-1c20f84a` (SHA256 verificado). Configure con `cmake` + toolchain vcpkg (Qt 6.10). Build `cmake --build .`: 1150/1150, exit 0, sin errores, en ~3 min 41 s. `mixxx.exe` generado.
- Prueba de arranque: ventana `Mixxx` abierta, responsiva, init completo (Media Foundation + FFmpeg 7.1, dispositivos de audio), viva >30 s; cerrada sin colgarse.
- BUILD_NOTES.md rellenado durante la ejecución; evidencia sanitizada en `04_TESTS/evidence/` (estado del árbol + extracto de log, <100 KB, sin rutas de usuario).

### Resultado

- **001-A CERRADA** (estado de salida 1 de la sección 9). Todos los criterios de aceptación cumplidos y puerta de salida del checklist completada, salvo la aprobación para avanzar a 001-B, que es acción posterior del responsable.

### Qué funcionó

- Empezar por el inventario reveló de inmediato el hueco de toolchain, evitando falsos arranques.
- El entorno de deps precompiladas (vcpkg 2.7) hizo la build trivial y muy rápida una vez presente VS.
- Tomar los comandos de la guía oficial y del propio `windows_buildenv.bat` (no de memoria) dio la configuración correcta a la primera.

### Qué falló o quedó incierto

- `CloseMainWindow()` devolvió `False` (probable diálogo de primer arranque con el foco); el cierre se hizo con `Stop-Process`. No hubo crash, pero el cierre "de ventana" no fue por WM_CLOSE. Aceptable para 001-A; a vigilar si en fases futuras se requiere un cierre 100 % por UI.
- Discrepancia de nombre: la spec etiqueta el equipo "SA97"; el hostname real es `GARAGE1` (mismo modelo G14). Anotado; el responsable decide si renombrar la etiqueta.
- Aviso benigno: no hay traducciones "qt" para `es_ES` (usa las de "mixxx"). No afecta.

### Decisiones y razones

- Instalar VS 2022 Community + CMake se trató como **preparación de toolchain oficial (sección 3)**, dentro del alcance; no como desviación ni alternativa de terceros.
- Se usó el comando de configure exacto que imprime `windows_buildenv.bat` (solo `-DCMAKE_TOOLCHAIN_FILE`), sin añadir flags de Sinatra, para reproducir la build oficial tal cual.

### Qué aprendimos

- En `main`, el soporte QML es una opción CMake explícita y activa por defecto: `QML:BOOL=ON` (sobre `QT6:BOOL=ON`). Es la palanca concreta a estudiar en 001-D, sin tocarla antes.
- El commit compilado (PR #17101) es justamente trabajo sobre la skin **LateNight QML**, señal de que la ruta QML ya vive en el árbol oficial.

### Evidencia relacionada

- `04_TESTS/BUILD_NOTES.md` (notas completas de build 001-A).
- `04_TESTS/evidence/001A_mixxx_tree_state.txt` y `001A_mixxx_startup_log.txt`.
- Commit de Sinatra: "docs: record Mixxx clean build baseline" en `claude/revision-general-ulbeby`.

### Siguiente paso

- Decisión del responsable: aprobar (o no) el avance a **001-B — FLX4 baseline**, que requiere una spec independiente propia antes de tocar la controladora. Hasta entonces, 001-B/C/D, Learn, DJ y Radio siguen bloqueados. La build local queda lista para reusarse (`cmake --build .` en `build/x64-portable`).

---

## 2026-09-19 · Sesión 03 · Preparación de 001-B sin hardware

**Fase:** 001-B (preparación; sin ejecución)
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8)
**Commit Mixxx:** `81a5eb87` (solo lectura del árbol; sin cambios)
**Objetivo de la sesión:** al no tener la FLX4 a mano, adelantar todo lo que no necesita hardware para que la ejecución de 001-B sea enchufar y validar.

### Qué se hizo

- Inspeccionado (solo lectura) el mapping oficial en el árbol de Mixxx: `Pioneer-DDJ-FLX4.midi.xml` + `Pioneer-DDJ-FLX4-script.js` — "Pioneer DDJ-FLX4" (autor Robert904, basado en DDJ-400), schemaVersion 1, mixxxVersion 2.6, base firmware 1.02, 281 controles de entrada y 112 salidas (LEDs).
- Consultada la doc oficial de Mixxx para la FLX4 (manual 2.4) y referencias de comunidad (2026-09-19).
- Pre-rellenada la parte sin hardware de `04_TESTS/FLX4_BASELINE.md` (fuente, mapping, ruteo de audio objetivo, sección de preparación).
- Corregida la spec 001-B a v1.1 desde la fuente oficial.

### Resultado

- Preparación completada. 001-B **sigue sin ejecutarse** (sin hardware); no cambia su estado (Aprobada — lista para ejecución).

### Qué funcionó

- Consultar la fuente oficial antes de fijar nada evitó un error real: el driver ASIO **no** es necesario (la FLX4 es class-compliant).

### Qué falló o quedó incierto

- Todo lo que depende del hardware (detección real, audio, respuesta de controles, LEDs, latencia) queda pendiente por no tener la FLX4.
- Sample rate y búfer óptimos se decidirán en ejecución.

### Decisiones y razones

- Corrección de la spec (no driver, WASAPI, Master 1-2 / Cue 3-4) tratada como ajuste de exactitud dentro del mismo alcance, con la aprobación vigente; registrada en changelog v1.1.
- No se reordenó la hoja de ruta: se mantiene 001-B como siguiente, solo pendiente de hardware.

### Qué aprendimos

- La FLX4 no necesita drivers en Windows y su interfaz integrada expone Master (1-2) y Cue (3-4); el mic no vuelve al PC.

### Evidencia relacionada

- `04_TESTS/FLX4_BASELINE.md` (prep sin hardware) · spec 001-B v1.1 · mapping oficial en `C:\dev\mixxx\res\controllers`.

### Siguiente paso

- Con la FLX4 conectada a GARAGE1: detección → audio Master+Cue → batería de controles → latencia → registro y cierre de 001-B.

---

## 2026-09-20 · Sesión 04 · Ejecución y cierre de 001-B (FLX4 baseline)

**Fase:** 001-B
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8)
**Commit Mixxx:** `81a5eb87` (build de 001-A; no se recompiló)
**Objetivo de la sesión:** con la DDJ-FLX4 ya conectada a GARAGE1, verificar y documentar el baseline: detección, audio y todos los controles con el mapping oficial, sin tocar Mixxx.

### Qué se hizo

- Confirmada la detección de la FLX4 en Windows (class-compliant, sin drivers) y en Mixxx.
- Configurado el audio: WASAPI, Master 1-2 y Headphones 3-4 sobre "Línea (2- DDJ-FLX4)".
- Cargado a mano el mapping oficial "Pioneer DDJ-FLX4" (no se auto-cargó) y activado.
- Sesión guiada (el responsable movió los controles físicos): audio Master+Cue por auriculares, jogs (scratch y pitch bend), play/pause, CUE, SHIFT+jog (search), faders de canal, crossfader, EQ, filtro/CFX, TRIM, tempo, hot cues, beat loop y Beat FX. Todo OK.
- Confirmada la **sincronización bidireccional** (mover en consola se refleja en software y viceversa; LEDs).
- Registrada latencia (11 ms) y resuelta la anomalía "Invalid sample rate" pasando 44.1→48 kHz.
- Evidencia sanitizada del log (detección + enumeración WASAPI de la FLX4 con 4 canales) en `evidence/001B_flx4_detection.txt`.

### Resultado

- **001-B CERRADA** (estado de salida 1). Todos los criterios cumplidos, con una limitación documentada no bloqueante (ver abajo).

### Qué funcionó

- La preparación sin hardware de la Sesión 03 hizo que la ejecución fuera rápida y sin sorpresas de configuración.
- Guiar paso a paso a un usuario nuevo (el responsable empezaba de cero con DJ) funcionó: se validó todo el hardware sin tocar código.

### Qué falló o quedó incierto

- **RCA MASTER OUT no verificada:** no hay altavoces (perdidos en tránsito, DHL). La señal Master sí se validó por monitorización de auriculares; falta solo la comprobación física del conector RCA. Es una limitación, no un defecto; no reabre la fase.
- Algunos presets de Beat FX son poco perceptibles (normal según efecto/profundidad).
- El preset del mapping no se auto-carga en Mixxx; hay que seleccionarlo a mano (comportamiento normal de Mixxx, anotado).

### Decisiones y razones

- El error "Invalid sample rate" se resolvió alineando Mixxx al formato del dispositivo (48 kHz), config de entorno dentro del alcance; no se tocó Mixxx ni el mapping.
- Se cierra como Cerrada pese a la RCA sin verificar porque el criterio de audio Master quedó validado por otra vía (monitorización) y la limitación es por falta de hardware ajeno, no por fallo; documentada de forma explícita.

### Qué aprendimos

- La FLX4 expone 4 canales por WASAPI (Master 1-2 + Cue 3-4) sin drivers; el mic no vuelve al PC.
- Regla útil para el usuario: para cargar/expulsar, pausar primero.

### Evidencia relacionada

- `04_TESTS/FLX4_BASELINE.md` (registro completo) · `04_TESTS/evidence/001B_flx4_detection.txt` · spec 001-B v1.2.

### Siguiente paso

- Decisión del responsable: aprobar (o no) el avance a **001-C — Sinatra Skin**, que requiere su propia spec independiente. Recomendable (no bloqueante) una comprobación de 2 min de las salidas RCA cuando lleguen los altavoces. La build local y la config de la FLX4 quedan listas para reusar.

---

## 2026-09-20 · Sesión 05 · Ejecución y cierre de 001-C (Sinatra Skin)

**Fase:** 001-C
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8)
**Commit Mixxx:** `81a5eb87` (solo lectura/copia; sin cambios)
**Objetivo de la sesión:** crear la primera identidad visual propia de Sinatra como copia aislada de LateNight, sin tocar el original ni el repo de Mixxx, y verificarla con la FLX4.

### Qué se hizo

- Duplicada la skin LateNight (902 archivos, 5.5 MB) a `02_MODS/skins/LateNight_Sinatra`; renombrado el manifiesto (title "LateNight Sinatra", atribución CC BY-SA conservada).
- Desplegada en la carpeta de skins de usuario de Mixxx y fijada en `mixxx.cfg`.
- Aplicada identidad visual: fondo azul profundo (familia de grises → tintes navy), acento cian `#18b8d8` y tipografía Bahnschrift.
- Verificado con la FLX4: carga de pista desde la consola y audio por auriculares respondiendo con la skin puesta.
- Documentado en `04_TESTS/SKIN_NOTES.md`; capturas de verificación (no versionadas).

### Resultado

- **001-C CERRADA** (estado de salida 1). Capa visual propia, aislada, cargando y usable, sin fork y sin tocar Mixxx.

### Qué funcionó

- Copiar + repuntar solo la QSS propia vía prefijo `skin:` permitió customizar sin duplicar toda la lógica ni tocar el original.
- Verificar con captura de pantalla (el agente) evitó dar por bueno un render roto.

### Qué falló o quedó incierto

- **Pantalla negra** tras repuntar `skins:LateNight/`→`skins:LateNight_Sinatra/` en todos los archivos: el prefijo `skins:` resuelve solo contra `res/skins` del sistema, no contra la carpeta de usuario. Diagnosticado en el log y en el código de Mixxx (`legacyskinparser.cpp:423-424`), y resuelto revirtiendo el repunte y cargando la QSS propia con `skin:` (singular). Aprendizaje clave sobre skins de Mixxx.
- La skin es, a propósito, LateNight con identidad visual propia; la ambición de UX real (modo Learn) queda para el camino QML (001-D) y posteriores.

### Decisiones y razones

- No desplegar en `res/skins` (aunque haría resolver `skins:<copia>`) para no ensuciar el árbol de Mixxx: se usó `skin:` en su lugar.
- Alcance mantenido en lo visual; nada de funcionalidad ni QML. Streaming (emisión) reconocido como posible en Mixxx pero reservado al futuro modo Radio.

### Qué aprendimos

- Una copia de skin fuera de `res/skins` no puede auto-referenciarse con `skins:<nombre>/`; para sus propios archivos se usa `skin:` (singular) o rutas relativas.
- Mixxx (motor libre) + FLX4 + piel propia sin fork le planta cara a rekordbox.

### Evidencia relacionada

- `04_TESTS/SKIN_NOTES.md` · skin en `02_MODS/skins/LateNight_Sinatra` · spec 001-C v1.1.

### Siguiente paso

- Practicar con la herramienta (objetivo del responsable). Y, cuando decida, valorar el avance a **001-D — QML spike** (requiere spec propia). La emisión/streaming pertenece al futuro modo Radio, no a esta fase.

---

## 2026-09-20/21 · Sesión 06 · Ejecución y cierre de 001-D (QML spike) — GO para Learn

**Fase:** 001-D
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8)
**Commit Mixxx:** `81a5eb87` (solo lectura/copia; sin cambios)
**Objetivo de la sesión:** responder si el modo Learn es viable — ¿puede un QML propio leer el motor de Mixxx en vivo y dar feedback, sin fork?

### Qué se hizo

- Confirmada la API en el código de Mixxx: `import Mixxx 1.0` + `Mixxx.ControlProxy { group; key }` con `.value` reactivo.
- Copia aislada de la skin QML → `02_MODS/skins/LateNightQML_Sinatra`; inyectado un indicador "SINATRA Learn" en `main.qml` que lee `[Channel1],bpm` y `[Channel2],bpm` y da feedback (verde "✓ igualados" con tolerancia 0.5 BPM).
- Resueltos tres bloqueos de integración: (1) skins QML solo cargan con `--developer`; (2) junction `<Mixxx>/qml`→`res/qml` para la librería QML compartida; (3) junction `skins/LateNight`→`res/skins/LateNight` para assets SVG. Y un bug propio: los `ControlProxy` deben crearse tras `Mixxx.Core.ready` (via `Loader`), o quedan a 0.
- Probado en vivo con la FLX4: dos pistas a 100 BPM → verde; desplazar tempo (consola o software) → "✗" al instante; re-sincronizar → verde. Reacción < 1 s.
- Creado un lanzador de Escritorio `Mixxx Sinatra.cmd` (arranca con `--developer`).

### Resultado

- **001-D CERRADA con recomendación GO.** El modo Learn es **técnicamente viable** sobre Mixxx en QML, sin fork.

### Qué funcionó

- Leer el motor y dar feedback reactivo en QML es trivial (~40 líneas). La mecánica núcleo de Learn está demostrada.
- Verificar con captura/log y recarga en caliente (`Ctrl+Shift+R`) aceleró la depuración.

### Qué falló o quedó incierto

- **Empaquetado:** una skin QML fuera de `res/skins` no es autocontenida (developer mode + deps compartidas vía junctions). Antes de construir Learn hay que decidir cómo se distribuye.
- Las skins QML de Mixxx son "developer preview" → hay algo de riesgo de inestabilidad/cambios upstream a vigilar.

### Decisiones y razones

- No desplegar en `res/skins` (ensuciaría Mixxx): se usaron junctions en la carpeta de usuario, documentados como coste de acoplamiento.
- Tolerancia de 0.5 BPM en el "igualado": realista para DJ (no hace falta clavar el decimal) y ajustable.

### Qué aprendimos

- `ControlProxy` da acceso a toda la superficie de controles de Mixxx desde QML; el timing (crear tras `ready`) importa.
- El sueño de Learn (ejercicios + feedback en cabina) es construible; el trabajo gordo será la UI/lógica de lecciones y el empaquetado, no el acceso al motor.

### Evidencia relacionada

- `04_TESTS/QML_SPIKE_NOTES.md` · skin en `02_MODS/skins/LateNightQML_Sinatra` · spec 001-D v1.1 · lección semilla `05_LEARN/L01`.

### Siguiente paso

- **Revisión de rumbo del Hito 001** (001-A…D cerradas): decidir con evidencia si se abre el **modo Learn** (spec propia, con plan de empaquetado) y si se mantiene o revisa ADR-001 (no fork). Decisión del responsable.

---

## 2026-09-23 · Sesión 07 · Primera sesión de práctica real — cabina completa y M2

**Fase:** Curso (05_LEARN). No es ejecución de spec: **sesión de práctica del alumno**, sin cambios en Mixxx ni en las skins.
**Responsable:** Juan Ramón Gutiérrez, con agente Claude Code (Opus 5)
**Commit Mixxx:** sin cambios (solo lectura de `res/controllers` y `src/engine` para diagnóstico)
**Objetivo de la sesión:** estrenar los monitores recién llegados (**DM-50D-BT**) y hacer el M2 — entender por dónde sale el sonido y cómo dirigirlo.

### Qué se hizo

- Conectados los monitores por **RCA al MASTER OUT**; verificada la cadena completa (altavoces = máster, casco = preescucha). Queda cerrado el pendiente no bloqueante de 001-B.
- Recorridos los tres bloques del M2 (solo altavoces → solo casco → la ventana `∩ MIX`). El alumno acabó **explicando el sistema de monitorización con sus propias palabras**.
- Primera transición básica (subir fader 2 / bajar fader 1), siguiendo el tutorial oficial de rekordbox.
- Dos incidencias perseguidas hasta el final y documentadas en `05_LEARN/BUGS.md`: **#07** (consola muda por modo Bluetooth) y **#08** (el `∩ MIX` en `MST` daba silencio).
- El M0a creció con tres apartados nacidos de dudas reales del alumno: **§2.6** (software vs hardware), **§2.7** (leer las luces) y el **quinto CUE** (activo #48). Mapa corregido con una foto cenital de la consola de GARAGE1.
- Arrancado `05_LEARN/DIARIO.md` con la entrada de la Sesión 01 y el tablero de niveles.

### Resultado

- **M2 comprendido** (nivel 2 en el tablero; falta repetir 3 días para fijarlo con la Regla 3×5). Cabina completa y operativa.
- **#07 y #08 cerrados.** Ninguno era un defecto de Sinatra.

### Qué funcionó

- **Bisección → medición → experimento de control.** Para el #08: ratón vs mando físico; luego `--controller-debug` (21.904 muestras, recorrido 0→16383 limpio); luego Mixxx de serie sin Sinatra; luego una versión del mapping a 7 bits. Ocho hipótesis descartadas con datos.
- El **RESET total + construir de uno en uno** desatascó al alumno cuando «sonaba todo por todos lados». Vale como protocolo didáctico.
- Que el alumno **insistiera** cuando el agente daba por cerrado el caso. Ocurrió tres veces; las tres tenía razón.

### Qué falló o quedó incierto

- El agente **cerró el #08 en falso** con una hipótesis no verificada («no había máster que oír») y tuvo que reabrirlo. Queda como aviso: no cerrar sin reproducir.
- El **mapping oficial de Mixxx no contempla el `CUE` de máster** (ni MASTER LEVEL, ∩ LEVEL o MIC LEVEL, que sí mandan MIDI en `0xB6` ctrl `0x05`/`0x08`/`0x0D`). Candidato a propuesta upstream — como documentación, no como bug.

### Decisiones y razones

- **No tocar `C:\dev\mixxx`** en ningún momento del diagnóstico (ADR-001): la variante del mapping a 7 bits se creó en la carpeta de usuario y se borró al descartarla.
- **Documentar los hallazgos en el M0a en caliente**, no al final: cada duda del alumno se convirtió en apartado del curso el mismo día.
- **No cerrar bugs sin reproducir**, a raíz del fallo de esta sesión.

### Qué aprendimos

- **Causa real del #08:** el `∩ MIX` actúa a la vez como control MIDI y como **cruce de hardware** dentro de la FLX4 hacia su propia monitorización del máster — que está muda hasta que se pulsa el **`CUE` de máster**. Misma lógica que las mesas DJM.
- **Para Learn:** el alumno no podía saber que existía un botón imprescindible. «Estás en MST y el CUE de máster está apagado» es un checkpoint automático evidente, del mismo tipo que el indicador de BPM igualados de 001-D.
- **Sobre el método del curso:** el M0a (conocer la consola) no se aprende leyendo, sino **tocando y rompiendo**. Una tarde de depuración enseñó más que dos semanas de sesiones cortas. Palabras del alumno: *«ya sé por dónde sale el sonido y cómo sacarlo»*.
- Queda **mucho por entender y tocar** — esto es el punto de partida del curso, no su final.

### Evidencia relacionada

- `05_LEARN/BUGS.md` #07 y #08 (con todas las hipótesis descartadas) · `05_LEARN/M00a_mapa_de_activos_FLX4.md` §2.6, §2.7, activo #48, E8, E9 · `05_LEARN/DIARIO.md` Sesión 01 · página Notion «Tu música y tus entrenos».

### Siguiente paso

- **Práctica:** M0a **E1** (censo de los 48 activos) con la Regla 3×5, y repetir el M2 tres días para fijarlo.
- **Pendiente de decisión del responsable:** sigue abierta la **revisión de rumbo del Hito 001** — si se abre el **modo Learn** con spec propia y plan de empaquetado.
- **Opcional, sin prisa:** proponer a Mixxx la documentación del `CUE` de máster de la FLX4.

---

## Correcciones fechadas

> Estas notas corrigen o unifican terminología sin reescribir las entradas anteriores, que se conservan como registro del momento en que se escribieron.

- **2026-09-19 — Nombre de la máquina.** El responsable **unifica la etiqueta de la máquina objetivo a `GARAGE1`** (ASUS ROG Zephyrus G14 GA403UV, Windows 11). Toda mención a **"SA97"** en entradas y changelogs anteriores designa **esta misma máquina**; los documentos canónicos (README, DECISIONES, checklist, specs, plantillas, BUILD_NOTES) ya usan `GARAGE1`.
- **2026-09-19 — Aprobación de 001-B.** El responsable **aprueba la spec `SINATRA_Hito001B_FLX4_Baseline.md`** (pasa de Borrador a Aprobada — lista para ejecución). Se crea la plantilla `04_TESTS/FLX4_BASELINE.md`. La **ejecución** de 001-B queda pendiente de una sesión con la FLX4 conectada; no se ha tocado hardware.
- **2026-09-20 — Aprobación de 001-C.** El responsable **aprueba la spec `SINATRA_Hito001C_Sinatra_Skin.md`** (v1.0, Aprobada — lista para ejecución), con skin base **LateNight** y nombre **`LateNight_Sinatra`**. Se crea la plantilla `04_TESTS/SKIN_NOTES.md`. La **ejecución** (duplicar y editar la copia) queda pendiente; aún no se ha tocado ninguna skin.
- **2026-09-20 — Aprobación de 001-D.** El responsable **aprueba la spec `SINATRA_Hito001D_QML_Spike.md`** (v1.0, Aprobada — lista para ejecución). Criterio de éxito fijado: indicador QML "✓ igualados" cuando |BPM1−BPM2| < 0.5, reacción < 1 s. Se crea la plantilla `04_TESTS/QML_SPIKE_NOTES.md`. La **ejecución** del spike queda pendiente; aún no se ha escrito QML.
