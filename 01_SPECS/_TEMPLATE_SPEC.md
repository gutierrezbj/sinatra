# Spec — SINATRA Hito NNN-X · Título corto

> Copiar esta plantilla como `SINATRA_HitoNNNX_Titulo.md`. Rellenar todos los campos de cabecera antes de pedir aprobación. Una spec sin aprobador y fecha de aprobación no autoriza trabajo.

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | AAAA-MM-DD |
| Estado | Borrador / En revisión / Aprobada — lista para ejecución / En ejecución / Cerrada / Abierta con bloqueo diagnosticado / Requiere nueva decisión |
| Autor | |
| Aprobador | |
| Fecha de aprobación | |
| Tipo | investigación técnica / experimento acotado / modificación aislada |
| Proyecto | Sinatra · Proyecto Radio |
| Decisión vigente | ADR-NNN — ver `00_DOCS/DECISIONES.md` |
| Depende de | fase anterior cerrada, ADR aplicable |

## 1. Objetivo

Una frase medible. Qué se consigue y qué no valida esta fase.

## 2. Entorno objetivo

Equipo, sistema, rutas, toolchain. Las versiones exactas se registran durante la ejecución, no aquí.

## 3. Dentro del alcance

Lista cerrada de lo autorizado.

## 4. Fuera del alcance

Lista cerrada de lo prohibido en esta fase. Es la fuente única de guardarraíles de la fase; `AGENTS.md` solo resume.

## 5. Restricciones

Condiciones que aplican durante toda la fase (separación de repos, registro de desviaciones, qué cuenta como resultado válido).

## 6. Procedimiento de alto nivel

Pasos numerados. No congelar comandos que dependan de documentación externa viva; indicar de dónde se toman y dónde se registran.

## 7. Entregables

Lista numerada. Incluir siempre: notas de ejecución, evidencia textual en `04_TESTS/evidence/`, checklist actualizada y entrada de bitácora.

## 8. Criterios de aceptación

Lista verificable. Cada criterio debe poder comprobarse con evidencia, no con opinión.

## 9. Estados de salida

Toda fase termina en uno de estos tres estados, que se registra en la cabecera de la spec, en el checklist y en la bitácora:

1. **Cerrada.** Todos los criterios de aceptación cumplidos y puerta de salida del checklist completada. Habilita pedir la spec de la fase siguiente.
2. **Abierta con bloqueo diagnosticado.** Un fallo reproducido y diagnosticado impide cumplir algún criterio, pero la solución cabe dentro del alcance de esta spec. Se continúa en una sesión nueva con la misma spec.
3. **Requiere nueva decisión/spec.** Cumplir el objetivo exige salir del alcance, violar una restricción o reabrir una ADR. Se detiene el trabajo y se solicita la decisión antes de continuar.

Un éxito parcial no es cierre.

## 10. Changelog

| Versión | Fecha | Cambio | Autor |
|---|---|---|---|
| 0.1 | AAAA-MM-DD | Borrador inicial | |
