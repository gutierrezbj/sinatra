# Pruebas y evidencia

Esta carpeta contiene plantillas, notas de ejecución y evidencia textual reproducible.

## Dos carpetas, dos reglas

| Carpeta | Contenido | Git |
|---|---|---|
| `evidence/` | Texto pequeño, útil y sanitizado: salidas de `git status`/`git log`, versiones de herramientas, fragmentos de log recortados al error relevante, listados de configuración. | **Versionada.** |
| `artifacts/` | Binarios, capturas de pantalla, instaladores, builds, logs completos. | **Ignorada.** |

Reglas para `evidence/`:

- Límite aproximado de **100 KB por archivo**. Si un log lo supera, recortar al fragmento relevante y anotar qué se omitió.
- **Nunca** incluir credenciales, tokens, variables de entorno sensibles, volcados completos del entorno, rutas con nombre de usuario ni datos personales. Sanitizar antes de guardar.
- Nombre descriptivo con fase y fecha, por ejemplo `001A_2026-09-25_mixxx_git_status_pre_build.txt`.
- Cada archivo debe estar referenciado desde las notas de build o la bitácora; evidencia huérfana no sirve.

## Durante 001-A

1. Copiar `BUILD_NOTES.template.md` como `BUILD_NOTES.md`.
2. Completarla durante la ejecución, no al final de memoria.
3. Guardar la evidencia textual en `evidence/` y lo pesado en `artifacts/`.
4. Referenciar cada evidencia desde las notas por su nombre.

La baseline de la FLX4 pertenece a 001-B; su plantilla se crea al aprobar esa spec, no antes.
