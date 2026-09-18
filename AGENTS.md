# Instrucciones para agentes — SINATRA

Estas reglas aplican a todo el repositorio. Una spec más específica puede reducir el alcance, pero no ampliarlo sin autorización expresa del responsable del proyecto.

## Contexto

Sinatra explora una experiencia DJ moderna apoyada en Mixxx. Mixxx es el motor; Sinatra estudia la interfaz y la experiencia. La decisión vigente es **no crear un fork todavía**.

## Alcance activo

El único trabajo autorizado actualmente es **Hito 001-A — Build limpia**, definido en:

`01_SPECS/SINATRA_Hito001A_Build_Limpia.md`

Objetivo: conseguir y documentar una compilación reproducible, sin modificaciones, del branch `main` de Mixxx en Windows 11 y arrancar la aplicación desde la build local.

## Forma de trabajo obligatoria

1. **SDD-first.** Leer la spec activa completa antes de actuar. No implementar trabajo que no esté descrito y autorizado en una spec.
2. **Inspeccionar antes de cambiar.** Verificar entorno, rutas, estado Git, commit y documentación oficial vigente.
3. **Separar repositorios.** Mixxx debe vivir fuera de este repositorio y fuera de OneDrive, preferiblemente en `C:\dev\mixxx`. SINATRA contiene documentación, specs, futuras copias de mods, notas y pruebas.
4. **Usar upstream oficial.** Para 001-A se trabaja con el repositorio oficial de Mixxx, sin crear fork.
5. **Cambios mínimos y reversibles.** Una desviación del procedimiento oficial requiere diagnóstico, razón y registro antes de aplicarse.
6. **No adivinar.** Registrar versiones, comandos y resultados observados; no completar datos desde memoria.

## Prohibiciones en 001-A

- No crear ni publicar un fork de Mixxx.
- No modificar código funcional de Mixxx.
- No tocar el motor ni el pipeline de audio.
- No modificar skins, QSS, QML ni recursos visuales.
- No modificar mappings XML o JavaScript de controladores.
- No conectar ni probar la DDJ-FLX4.
- No empezar 001-B, 001-C, 001-D, Learn, DJ o Radio.
- No copiar el repositorio ni los artefactos de build de Mixxx dentro de SINATRA.
- No versionar binarios, dependencias, credenciales ni evidencia pesada.
- No instalar alternativas o dependencias ajenas al procedimiento oficial sin documentar antes por qué son necesarias.

Si el objetivo requiere violar una prohibición, detenerse y solicitar una nueva decisión o spec. Un bloqueo no autoriza a ampliar el alcance.

## Entregables de 001-A

1. Compilación exitosa del commit exacto registrado.
2. Mixxx arrancando desde la build local.
3. `04_TESTS/BUILD_NOTES.md`, creado desde la plantilla y completado con herramientas, versiones, comandos, problemas, soluciones y resultado.
4. Evidencia textual del estado del árbol y de que no se hicieron cambios funcionales.
5. Checklist técnica actualizada.
6. Entrada de sesión en `03_NOTAS/BITACORA.md`.

## Regla de bitácora

Cada sesión debe añadir una entrada a `03_NOTAS/BITACORA.md`, incluso si no se consiguió compilar. Debe indicar objetivo, acciones, resultado, fallos, decisiones, aprendizaje, evidencia y siguiente paso. No se reescriben entradas anteriores para ocultar errores o cambiar el historial.

## Cierre y avance

No declarar 001-A terminada hasta cumplir todos los criterios de aceptación de la spec y completar la puerta de salida del checklist. No avanzar a 001-B sin autorización expresa y una spec independiente aprobada.

