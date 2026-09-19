# Spec — SINATRA Hito 001-A · Build limpia

| Campo | Valor |
|---|---|
| Versión | 1.3 |
| Fecha | 2026-09-19 |
| Estado | **Cerrada** — build limpia reproducida y arranque verificado en Sesión 02 (ver `04_TESTS/BUILD_NOTES.md`) |
| Autor | Juan Ramón Gutiérrez |
| Aprobador | Juan Ramón Gutiérrez |
| Fecha de aprobación | 2026-09-19 |
| Tipo | investigación técnica reproducible |
| Proyecto | Sinatra · Proyecto Radio |
| Decisión vigente | ADR-001 — no fork · ver `00_DOCS/DECISIONES.md` |
| Depende de | Sesión 00 (estructura documental) cerrada |

Esta spec es la fuente única de alcance, entregables, criterios de aceptación y estado formal de 001-A. `AGENTS.md` y `README.md` enlazan aquí; el checklist registra progreso operativo.

## 1. Objetivo

Conseguir una compilación reproducible y sin modificaciones del branch `main` de Mixxx en Windows 11, y arrancar la aplicación desde esa build local.

Esta fase valida únicamente el entorno de construcción. No valida la DDJ-FLX4, no crea la interfaz Sinatra y no evalúa QML.

## 2. Entorno objetivo

- **Equipo:** SA97 — ASUS Zephyrus G14.
- **Sistema:** Windows 11.
- **Código Mixxx:** repositorio oficial independiente, fuera de OneDrive; ruta recomendada `C:\dev\mixxx`.
- **Proyecto Sinatra:** repositorio separado, fuera de OneDrive; ruta recomendada `C:\ProyectosIA\Sinatra`.
- **Toolchain base:** Visual Studio 2022, workload Desktop development with C++, Git, CMake, Python si la guía oficial lo exige, entorno oficial de dependencias de Mixxx y el procedimiento oficial de Mixxx para Windows.

Las versiones exactas deben registrarse durante la ejecución; no se fijan por memoria ni por suposición.

## 3. Dentro del alcance

- Inventariar el entorno real de SA97 y registrar versiones.
- Preparar o verificar el toolchain oficial.
- Clonar o actualizar el repositorio oficial de Mixxx en su ubicación independiente; si ya existe, inspeccionar su estado antes de actuar y no sobrescribir trabajo existente.
- Registrar remoto, rama, commit exacto, fecha y estado inicial del árbol.
- Ejecutar la configuración y compilación oficiales.
- Resolver bloqueos de entorno estrictamente necesarios, documentando causa y solución.
- Arrancar Mixxx desde la build local, comprobar que abre sin fallo inmediato y cerrar de forma normal.
- Anotar, sin activarlas, las opciones de compilación que la guía oficial mencione como relevantes para una futura prueba QML.
- Dejar notas suficientes para repetir el proceso en SA97.

## 4. Fuera del alcance

Fuente única de guardarraíles de esta fase.

- Crear o publicar un fork.
- Modificar código funcional de Mixxx.
- Tocar el motor o pipeline de audio.
- Modificar skins, QSS, QML o recursos visuales.
- Modificar mappings XML o JavaScript de controladores.
- Conectar o probar la DDJ-FLX4.
- Empezar 001-B, 001-C, 001-D, Learn, DJ o Radio.
- Copiar el repositorio o los artefactos de build de Mixxx dentro de SINATRA.
- Hacer commits dentro del repositorio oficial de Mixxx.
- Redistribuir binarios.
- Versionar binarios, dependencias, credenciales o evidencia pesada.
- Instalar alternativas o dependencias ajenas al procedimiento oficial sin documentar antes por qué son necesarias.
- Introducir una arquitectura propia sin una decisión posterior.

## 5. Restricciones

1. El repo de Mixxx y este repo permanecen separados.
2. No se avanza a 001-B durante esta tarea.
3. Cualquier desviación del procedimiento oficial debe registrarse con motivo, impacto y alternativa considerada antes de aplicarse.
4. No se guardan credenciales, binarios ni dependencias descargadas en este repositorio.
5. Un fallo de compilación es un resultado válido si queda reproducido y diagnosticado; no autoriza a cambiar el producto. Su clasificación se hace con los estados de salida de la sección 9.
6. Una desviación de alcance nunca se resuelve en silencio: se detiene el trabajo y se registra.

## 6. Procedimiento de alto nivel

1. Inventariar el entorno real (Windows y build, CPU/arquitectura, espacio disponible, Visual Studio 2022 y workload C++, Git, CMake, Python y otras herramientas exigidas, entorno oficial de dependencias de Mixxx) y registrar versiones.
2. Confirmar la ubicación independiente de ambos repositorios, fuera de OneDrive.
3. Consultar la documentación oficial vigente de Mixxx para Windows. No usar comandos recordados ni tutoriales de terceros como fuente principal.
4. Obtener Mixxx desde su repositorio oficial y fijar el commit de trabajo. Registrar remoto, rama, SHA, fecha y estado del árbol antes de compilar.
5. Seguir la guía oficial para ese commit y ejecutar una build sin modificaciones.
6. Registrar cada comando real mientras se ejecuta; no reconstruirlo después de memoria.
7. Ante un fallo: capturar el error relevante, diagnosticar, aplicar solo soluciones justificadas y documentadas; si requiere ampliar el alcance, detenerse.
8. Arrancar el ejecutable generado, comprobar que abre, cerrar de forma normal y verificar que el árbol de Mixxx sigue sin cambios funcionales.
9. Registrar comandos, tiempos, advertencias, fallos y soluciones en `04_TESTS/BUILD_NOTES.md`; guardar evidencia textual sanitizada en `04_TESTS/evidence/`.
10. Actualizar checklist, estado de esta spec y añadir la entrada de cierre en `03_NOTAS/BITACORA.md`.

Los comandos concretos se toman de la documentación oficial vigente al ejecutar la fase; esta spec no los congela para evitar instrucciones obsoletas.

## 7. Entregables

1. Compilación exitosa del commit exacto registrado.
2. Mixxx arrancando desde la build local.
3. `04_TESTS/BUILD_NOTES.md` completo, creado desde la plantilla, con herramientas, versiones, entorno de dependencias, comandos, configuración, duración, errores, soluciones, resultado, estado final de Git y opciones relevantes para QML observadas pero no activadas.
4. Evidencia textual sanitizada en `04_TESTS/evidence/` del estado del árbol y de que no se hicieron cambios funcionales.
5. Checklist técnico actualizado.
6. Estado de esta spec actualizado en la cabecera.
7. Entrada de bitácora con resultado y próximo paso recomendado.

## 8. Criterios de aceptación

- Se conoce y registra el commit exacto compilado.
- Las herramientas, sus versiones y el entorno de dependencias quedan documentados.
- Los comandos esenciales pueden repetirse sin depender de memoria o historial de terminal.
- La compilación termina correctamente.
- La aplicación arranca desde el artefacto local y cierra de forma normal.
- No existen cambios de Sinatra en motor, audio, skins ni mappings; el árbol de Mixxx queda limpio.
- Los problemas y soluciones quedan explicados de forma que otra sesión pueda continuar.
- No se ha iniciado ninguna tarea de 001-B.

## 9. Estados de salida

001-A termina en exactamente uno de estos estados, registrado en la cabecera de esta spec, en el checklist y en la bitácora:

1. **Cerrada.** Todos los criterios de aceptación cumplidos y puerta de salida del checklist completada. Habilita solicitar la spec independiente de 001-B — FLX4 baseline. No habilita empezarla.
2. **Abierta con bloqueo diagnosticado.** Un fallo reproducido y diagnosticado impide cumplir algún criterio, pero su resolución cabe dentro de esta spec (por ejemplo, una dependencia del toolchain mal instalada). Se continúa en una sesión nueva con esta misma spec.
3. **Requiere nueva decisión/spec.** Cumplir el objetivo exige salir del alcance de la sección 4, violar una restricción o reabrir ADR-001. Se detiene el trabajo y se solicita la decisión antes de continuar.

Un éxito parcial no es cierre.

## 10. Changelog

| Versión | Fecha | Cambio | Autor |
|---|---|---|---|
| 1.0 | 2026-09-18 | Spec inicial de 001-A | Juan Ramón Gutiérrez |
| 1.1 | 2026-09-19 | Cabecera formal (versión, estado, autor, aprobador). Spec pasa a ser fuente única de alcance. Añadidos: estados de salida, checklist y estado de spec como entregables, evidencia en `04_TESTS/evidence/`, inventario de entorno de dependencias, anotación de opciones QML sin activar, prohibición de commits en el repo de Mixxx. | Juan Ramón Gutiérrez |
| 1.2 | 2026-09-19 | Ruta recomendada de SINATRA en SA97 pasa a `C:\ProyectosIA\Sinatra`. | Juan Ramón Gutiérrez |
| 1.3 | 2026-09-19 | **Estado → Cerrada.** Ejecutada en Sesión 02: toolchain oficial provisto (VS 2022 Community + workload C++), Mixxx `main` `81a5eb87` compilado con deps 2.7 (1150/1150, exit 0) y arrancado desde build local. Árbol de Mixxx limpio, sin fork. Cumple todos los criterios de aceptación (sección 8). | Juan Ramón Gutiérrez (con agente Claude Code) |
