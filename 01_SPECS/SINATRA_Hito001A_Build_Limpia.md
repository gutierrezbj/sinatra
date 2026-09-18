# Spec — SINATRA Hito 001-A · Build limpia

**Estado:** lista para ejecución  
**Tipo:** investigación técnica reproducible  
**Proyecto:** Sinatra · Proyecto Radio  
**Decisión vigente:** no fork

## 1. Objetivo

Conseguir una compilación reproducible y sin modificaciones del branch `main` de Mixxx en Windows 11, y arrancar la aplicación desde esa build local.

Esta fase valida únicamente el entorno de construcción. No valida la DDJ-FLX4, no crea la interfaz Sinatra y no evalúa QML.

## 2. Entorno objetivo

- **Equipo:** SA97 — ASUS Zephyrus G14.
- **Sistema:** Windows 11.
- **Código Mixxx:** repositorio oficial independiente, fuera de OneDrive; ruta recomendada `C:\dev\mixxx`.
- **Proyecto Sinatra:** repositorio separado; ruta recomendada `C:\SINATRA`.
- **Toolchain base:** Visual Studio 2022, workload Desktop development with C++, Git, CMake y procedimiento oficial de Mixxx para Windows.

Las versiones exactas deben registrarse durante la ejecución; no se fijan por memoria ni por suposición.

## 3. Dentro del alcance

- Preparar o verificar el toolchain oficial.
- Clonar o actualizar el repositorio oficial de Mixxx en su ubicación independiente.
- Registrar rama y commit exactos.
- Ejecutar la configuración y compilación oficiales.
- Resolver bloqueos de entorno estrictamente necesarios, documentando causa y solución.
- Arrancar Mixxx desde la build local.
- Dejar notas suficientes para repetir el proceso en SA97.

## 4. Fuera del alcance

- Crear o publicar un fork.
- Modificar código funcional de Mixxx.
- Tocar el motor o pipeline de audio.
- Modificar skins, QSS, QML o recursos visuales.
- Modificar mappings XML o JavaScript de controladores.
- Conectar o probar la DDJ-FLX4.
- Implementar Learn, DJ o Radio.
- Redistribuir binarios.
- Introducir una arquitectura propia o dependencias ajenas al procedimiento oficial sin una decisión posterior.

## 5. Restricciones

1. El repo de Mixxx y este repo permanecen separados.
2. No se avanza a 001-B durante esta tarea.
3. Cualquier desviación del procedimiento oficial debe registrarse con motivo, impacto y alternativa considerada.
4. No se guardan credenciales, binarios ni dependencias descargadas en este repositorio.
5. Un fallo de compilación es un resultado válido si queda reproducido y diagnosticado; no autoriza a cambiar el producto.

## 6. Procedimiento de alto nivel

1. Inventariar el entorno y registrar versiones.
2. Confirmar la ubicación independiente de ambos repositorios.
3. Obtener Mixxx desde su repositorio oficial y fijar el commit de trabajo.
4. Seguir la guía oficial vigente de compilación en Windows.
5. Ejecutar una build sin modificaciones.
6. Arrancar el ejecutable generado.
7. Registrar comandos, tiempos, advertencias, fallos y soluciones en `04_TESTS/BUILD_NOTES.md`.
8. Añadir una entrada de cierre en `03_NOTAS/BITACORA.md`.

Los comandos concretos se toman de la documentación oficial vigente al ejecutar la fase; esta spec no los congela para evitar instrucciones obsoletas.

## 7. Entregables

1. Compilación exitosa del commit registrado.
2. Mixxx arrancando desde la build local.
3. `04_TESTS/BUILD_NOTES.md` completo, creado desde la plantilla incluida.
4. Evidencia textual de que no se hicieron cambios funcionales.
5. Entrada de bitácora con resultado y próximo paso recomendado.

## 8. Criterios de aceptación

- Se conoce y registra el commit exacto compilado.
- Las herramientas y sus versiones quedan documentadas.
- Los comandos esenciales pueden repetirse sin depender de memoria o historial de terminal.
- La compilación termina correctamente.
- La aplicación arranca desde el artefacto local.
- No existen cambios de Sinatra en motor, audio, skins ni mappings.
- Los problemas y soluciones quedan explicados de forma que otra sesión pueda continuar.
- No se ha iniciado ninguna tarea de 001-B.

## 9. Condición de cierre

001-A solo se considera cerrada cuando todos los criterios de aceptación están cumplidos y la checklist está actualizada. El siguiente encargo será una spec independiente para 001-B — FLX4 baseline.

