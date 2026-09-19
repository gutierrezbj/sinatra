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
