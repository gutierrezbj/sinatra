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

## Correcciones fechadas

> Estas notas corrigen o unifican terminología sin reescribir las entradas anteriores, que se conservan como registro del momento en que se escribieron.

- **2026-09-19 — Nombre de la máquina.** El responsable **unifica la etiqueta de la máquina objetivo a `GARAGE1`** (ASUS ROG Zephyrus G14 GA403UV, Windows 11). Toda mención a **"SA97"** en entradas y changelogs anteriores designa **esta misma máquina**; los documentos canónicos (README, DECISIONES, checklist, specs, plantillas, BUILD_NOTES) ya usan `GARAGE1`.
- **2026-09-19 — Aprobación de 001-B.** El responsable **aprueba la spec `SINATRA_Hito001B_FLX4_Baseline.md`** (pasa de Borrador a Aprobada — lista para ejecución). Se crea la plantilla `04_TESTS/FLX4_BASELINE.md`. La **ejecución** de 001-B queda pendiente de una sesión con la FLX4 conectada; no se ha tocado hardware.
