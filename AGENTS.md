# Instrucciones para agentes — SINATRA

Estas reglas aplican a todo el repositorio. Una spec más específica puede reducir el alcance, pero no ampliarlo sin autorización expresa del responsable del proyecto.

## Contexto

Sinatra explora una experiencia DJ moderna apoyada en Mixxx. Mixxx es el motor; Sinatra estudia la interfaz y la experiencia. La decisión vigente es **no crear un fork todavía** ([ADR-001](00_DOCS/DECISIONES.md)).

## Dónde vive cada cosa

| Qué | Dónde |
|---|---|
| Decisiones de rumbo y arquitectura | `00_DOCS/DECISIONES.md` |
| Alcance, entregables, aceptación y **estado formal** de la fase activa | la spec activa en `01_SPECS/` |
| Progreso operativo por fase | `00_DOCS/SINATRA_Hito001_Checklist_Tecnico.md` |
| Registro de sesiones | `03_NOTAS/BITACORA.md` |
| Plantillas | `01_SPECS/_TEMPLATE_SPEC.md` · `04_TESTS/BUILD_NOTES.template.md` |
| Evidencia textual versionada | `04_TESTS/evidence/` |
| Artefactos pesados, ignorados por Git | `04_TESTS/artifacts/` |

## Alcance activo

**Hito 001-A — Build limpia**, definido íntegramente en [`01_SPECS/SINATRA_Hito001A_Build_Limpia.md`](01_SPECS/SINATRA_Hito001A_Build_Limpia.md).

La spec es la fuente única de alcance, entregables y criterios de aceptación; este archivo no los repite. Leerla completa antes de actuar.

## Forma de trabajo obligatoria

1. **SDD-first.** Leer la spec activa completa antes de actuar. No implementar trabajo que no esté descrito y autorizado en una spec aprobada.
2. **Inspeccionar antes de cambiar.** Verificar entorno, rutas, estado Git, commit y documentación oficial vigente. Si algo ya existe, no sobrescribirlo ni eliminarlo sin inspeccionarlo.
3. **Separar repositorios.** Mixxx debe vivir fuera de este repositorio y fuera de OneDrive, preferiblemente en `C:\dev\mixxx`. SINATRA contiene documentación, specs, futuras copias de mods, notas y evidencia.
4. **Usar upstream oficial.** Se trabaja con el repositorio oficial de Mixxx, sin fork y sin commits dentro de él.
5. **Cambios mínimos y reversibles.** Una desviación del procedimiento oficial requiere diagnóstico, razón y registro antes de aplicarse.
6. **No adivinar.** Registrar versiones, comandos y resultados observados; no completar datos desde memoria. No simular una ejecución que no se ha hecho.

## Guardarraíles críticos

Resumen de lo que ninguna sesión puede hacer sin una nueva decisión o spec. El detalle vive en la sección "Fuera del alcance" de la spec activa.

- No crear ni publicar un fork de Mixxx.
- No modificar código funcional, motor, pipeline de audio, skins, QSS, QML ni mappings de Mixxx.
- No conectar ni probar la DDJ-FLX4; no empezar 001-B, 001-C, 001-D, Learn, DJ ni Radio.
- No copiar Mixxx ni sus artefactos de build dentro de SINATRA.
- No versionar binarios, dependencias, credenciales ni evidencia pesada.

Si el objetivo requiere violar un guardarraíl, detenerse y solicitar una nueva decisión o spec. Un bloqueo no autoriza a ampliar el alcance ni a avanzar en silencio.

## Regla de bitácora

Cada sesión añade una entrada **al final** de `03_NOTAS/BITACORA.md` siguiendo la plantilla del propio archivo, incluso si no se consiguió el objetivo. Debe indicar responsable, objetivo, acciones, resultado, qué funcionó, qué falló, decisiones, aprendizaje, evidencia y siguiente paso. No se reescriben entradas anteriores para ocultar errores o cambiar el historial; una corrección se anota fechada.

## Cierre y avance

Toda fase termina en uno de los tres estados de salida definidos en su spec: **cerrada**, **abierta con bloqueo diagnosticado** o **requiere nueva decisión/spec**. Un éxito parcial no es cierre.

No declarar 001-A cerrada hasta cumplir todos los criterios de aceptación de la spec y la puerta de salida del checklist. No avanzar a 001-B sin autorización expresa y una spec independiente aprobada.
