# SINATRA — Build Notes · Hito 001-A

> Documento de ejecución de 001-A. Se rellena **durante** la ejecución, no al final.

## Identificación

| Campo | Valor |
|---|---|
| Fecha y hora | 2026-09-19 13:49 (UTC+02:00) — inicio de sesión 02 |
| Responsable | Juan Ramón Gutiérrez, con agente Claude Code (Opus 4.8) |
| Equipo | GARAGE1 — ASUS ROG Zephyrus G14 GA403UV *(etiqueta unificada a GARAGE1 el 2026-09-19; antes "SA97")* |
| Windows (edición/build) | Windows 11 Home · build 26200 |
| Arquitectura | x64 · AMD Ryzen 9 8945HS w/ Radeon 780M · 31.3 GB RAM · 330 GB libres en C: |
| Ruta repo Mixxx | `C:\dev\mixxx` (fuera de OneDrive) |
| Remoto Git | `https://github.com/mixxxdj/mixxx.git` (oficial, sin fork) |
| Rama | `main` |
| Commit exacto | `81a5eb877f15140136ec07148f3df3d1065cba6c` (2026-09-19 10:00:31 +0200 · "Merge pull request #17101 …fix/latenightqml-toolbar-options-fonts") |
| Estado del árbol antes de compilar | Limpio (`git status --porcelain` sin salida) |
| Resultado final | Pendiente |
| Estado de salida de 001-A | Pendiente |

> **Nota (resuelta):** durante 001-A la spec etiquetaba la máquina como "SA97" mientras el hostname real es `GARAGE1` (mismo ASUS ROG Zephyrus G14). El responsable **unificó la etiqueta a `GARAGE1` el 2026-09-19**; toda referencia a "SA97" en docs anteriores designa esta misma máquina.

## Toolchain

| Herramienta o componente | Versión | Cómo se verificó |
|---|---|---|
| Visual Studio 2022 | **Ausente al inicio** → instalado Community 17.14.x en esta sesión (winget) | `vswhere` sin instancias al inicio; tras instalar, presente |
| Desktop development with C++ | Instalado (workload `Microsoft.VisualStudio.Workload.NativeDesktop`, `--includeRecommended`) | winget override; `vcvars64.bat` presente |
| MSVC | 14.44.35207 | carpeta `VC\Tools\MSVC` |
| Windows SDK | 10.0.26100.0 (también SDKs antiguos presentes) | `Windows Kits\10\bin` |
| Git | 2.51.0.windows.1 | `git --version` |
| CMake | 3.31.6-msvc6 (bundled con el workload C++ de VS 2022) | `cmake.exe --version` en `Common7\IDE\...\CMake\bin` |
| Ninja | 1.12.1 (bundled con VS 2022) | `ninja.exe --version` en `...\CMake\Ninja` |
| PowerShell / terminal | Windows PowerShell 5.1 + Git Bash | entorno de la sesión |
| Python (si la guía lo exige) | 3.13.7 | `python --version` |
| **Entorno oficial de dependencias de Mixxx** | Línea **2.7**, paquete `mixxx-deps-2.7-x64-windows-1c20f84a` · SHA256 `77b75ab17f06e07b1c140e90f86aafb8658d66d8d581d488ab9b9545996fdc6e` · triplet `x64-windows` · URL `https://downloads.mixxx.org/dependencies/2.7/Windows/mixxx-deps-2.7-x64-windows-1c20f84a.zip`. La descarga+verificación la dispara el `cmake` configure vía vcpkg, no el .bat. | `tools/windows_buildenv.bat` del commit + guía oficial |
| Otros exigidos por la guía oficial | Rust + sccache son **opcionales** (aceleran build); no se instalan en 001-A | Guía oficial |

## Fuente del procedimiento

- URL de la guía oficial usada: `https://github.com/mixxxdj/mixxx/wiki/Compiling-On-Windows`
- Fecha de consulta: **2026-09-19**
- Rama/versión de documentación: wiki oficial de `mixxxdj/mixxx` (rama de trabajo = `main` del repo).

Procedimiento oficial resumido (verbatim de la guía, para trazabilidad):

1. Instalar Visual Studio 2022 Community (o Build Tools) con workload **Desktop development with C++**. VS 2019/2017 quedan descartados por CMake demasiado antiguo.
2. Clonar el repo oficial.
3. Ejecutar `MIXXX_REPO\tools\windows_buildenv.bat` para descargar el entorno de dependencias y generar `CMakeSettings.json`.
4. Abrir "x64 Native Tools Command Prompt for VS2022" y:
   ```
   cd MIXXX_REPO
   mkdir build\x64__portable
   cd build\x64__portable
   cmake -DCMAKE_INSTALL_PREFIX=MIXXX_REPO\install\x64_portable -DDEBUG_ASSERTIONS_FATAL=ON -DHSS1394=ON -DKEYFINDER=OFF -DLOCALECOMPARE=ON -DMAD=ON -DMEDIAFOUNDATION=ON -DSTATIC_DEPS=ON -DBATTERY=ON -DBROADCAST=ON -DBULK=ON -DHID=ON -DLILV=ON -DOPUS=ON -DQTKEYCHAIN=ON -DVINYLCONTROL=ON ..\..
   cmake --build .
   ```

## Comandos ejecutados

```powershell
# Directorio: C:\ProyectosIA\Sinatra  (inventario de entorno, solo lectura)
Get-CimInstance Win32_ComputerSystem / Win32_OperatingSystem / Win32_Processor  # equipo, SO, CPU
git --version            # 2.51.0.windows.1
cmake --version          # ausente en PATH
python --version         # 3.13.7
vswhere -all -products * # sin instancias de VS
winget --version         # v1.29.290

# Directorio: (proceso del sistema) — preparación de toolchain oficial
winget install --id Microsoft.VisualStudio.2022.Community `
  --override "--add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --quiet --norestart --wait"

# Directorio: C:\dev — obtención del código oficial
git clone https://github.com/mixxxdj/mixxx.git mixxx

# Configure — en "x64 Native Tools" (vcvars64), una sola sesión cmd:
#   Directorio: C:\dev\mixxx
call "C:\...\VC\Auxiliary\Build\vcvars64.bat"
call tools\windows_buildenv.bat setup           # genera CMakeSettings.json, exporta MIXXX_VCPKG_ROOT, etc.
mkdir build\x64-portable & cd build\x64-portable
#   Directorio: C:\dev\mixxx\build\x64-portable
cmake -DCMAKE_TOOLCHAIN_FILE=%MIXXX_VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake C:\dev\mixxx

# Build — misma sesión con vcvars64:
#   Directorio: C:\dev\mixxx\build\x64-portable
cmake --build .
```

## Configuración

- Generador CMake: **Ninja** (fijado por `windows_buildenv.bat`; CMake 3.31.6 bundled de VS).
- Arquitectura: x64.
- Toolchain: vcpkg (`%MIXXX_VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake`), deps 2.7 verificadas por SHA256.
- Qt encontrado: **6.10**.
- Configure: **OK (exit 0)** — "Configuring done (155.3s) · Generating done (1.9s)". Build files en `C:\dev\mixxx\build\x64-portable`.
- Opciones no predeterminadas: **ninguna añadida por Sinatra**. Se usó exactamente el comando oficial (solo `-DCMAKE_TOOLCHAIN_FILE`), dejando el resto en los defaults del proyecto/buildenv.
- Motivo: reproducir la build oficial sin desviaciones.

## Opciones relevantes para una futura prueba QML

> *Verificar en la guía oficial.* Anotar solo lo que la documentación o la configuración de CMake del commit compilado expongan. **No activar ninguna en 001-A.**

| Opción observada | Valor por defecto en este commit | Dónde se documenta | ¿Activada en esta build? |
|---|---|---|---|
| **`QML`** (opción CMake propia de Mixxx) | **`ON`** (default del proyecto en este commit; confirmado en `CMakeCache.txt`) | `CMakeCache.txt` de `build/x64-portable` | Sí, por **default oficial**. No la fijó Sinatra; no se modificó. Es la palanca a estudiar en 001-D. |
| `QT6` | `ON` (default) | `CMakeCache.txt` / `windows_buildenv.bat` | Sí (default; QML depende de Qt6) |
| Módulos Qt6 QtQuick/QML en deps | Presentes: `Qt6Qml`, `Qt6QmlModels`, `Qt6QuickControls2` (Basic/Fusion), `Qt6QuickDialogs2`, `Qt6LabsQmlModels`, etc. | deps `mixxx-deps-2.7-x64-windows-1c20f84a` | Disponibles; se compilan shaders QSB del `rendergraph` (stack QtQuick) |
| Skin **LateNight QML** | Incluida en `main` (commit = PR #17101 sobre "latenightqml") | árbol del commit `81a5eb87` | Se construye por defecto; **no se tocó nada de QML como trabajo de Sinatra** |

## Resultado de compilación

- Inicio: 2026-09-19 13:57:13
- Fin: 2026-09-19 14:00:54
- Duración aproximada: ~3 min 41 s (Ninja, 16 hilos; deps precompiladas vcpkg)
- Pasos Ninja: 1150/1150 completados
- Ejecutable generado en: `C:\dev\mixxx\build\x64-portable\mixxx.exe` (~12.38 MB)
- Errores: **0** (`FAILED` = 0; sin líneas de error de compilación)
- Advertencias relevantes: ninguna que bloquee; build termina con `exit 0` tras desplegar runtime Qt6 (windeployqt) en el directorio de build.

## Prueba de arranque

- Comando o método de arranque: `Start-Process C:\dev\mixxx\build\x64-portable\mixxx.exe` (desde el artefacto local).
- ¿Abre la ventana principal?: **Sí** — `MainWindowTitle='Mixxx'`, `Responding=True`, proceso vivo >30 s, ~220 MB de working set.
- ¿Llega al estado usable sin cerrarse?: **Sí** — el log muestra inicialización completa: traducciones, recursos `res/`, proveedores de audio (Microsoft Media Foundation 10.0.26100, FFmpeg 7.1), enumeración de dispositivos. Sin crash.
- Método de cierre: `CloseMainWindow()` devolvió `False` (probable diálogo de primer arranque con el foco, sin `MainWindowHandle` activo en ese instante), por lo que se cerró con `Stop-Process`. **No fue un crash**; el proceso terminó limpio y sin colgarse.
- Mensajes relevantes: 1 aviso benigno — no encontró traducciones "qt" para `es_ES` (usa las de "mixxx"). Nada bloqueante.
- Evidencia asociada: `04_TESTS/evidence/001A_mixxx_startup_log.txt` (extracto sanitizado del arranque).

## Problemas y soluciones

### Problema 1 — Toolchain ausente (VS 2022 y CMake)

- **Síntoma:** al inventariar, no hay Visual Studio 2022 ni CMake en la máquina.
- **Causa confirmada:** máquina sin entorno de compilación C++ preparado.
- **Diagnóstico realizado:** `vswhere` sin instancias; `cmake --version` ausente en PATH.
- **Solución aplicada:** instalar VS 2022 Community + workload "Desktop development with C++" (incluye CMake), que es el toolchain oficial exigido por la guía. Dentro del alcance (sección 3 de la spec: preparar/verificar toolchain oficial).
- **Fuente de la solución:** guía oficial de Mixxx (Compiling On Windows).
- **Impacto/reversibilidad:** instalación estándar; desinstalable desde Visual Studio Installer.
- **¿Es reproducible?:** sí, vía winget con el override documentado.

## Verificación de alcance

- [x] No se modificó código funcional de Mixxx.
- [x] No se tocó el motor ni el pipeline de audio.
- [x] No se tocaron skins, QSS ni QML.
- [x] No se tocaron mappings XML ni JavaScript.
- [x] No se conectó ni probó la DDJ-FLX4.
- [x] No se creó ni publicó un fork (repo oficial `mixxxdj/mixxx`, sin commits dentro).
- [x] No se incluyeron binarios, dependencias o credenciales en SINATRA (todo en `C:\dev\mixxx`, gitignorado).

## Estado final del árbol de Mixxx

```text
git log -1  ->  81a5eb877f15140136ec07148f3df3d1065cba6c
                Merge pull request #17101 (…fix/latenightqml-toolbar-options-fonts)
git status --porcelain  ->  (vacío: sin cambios en archivos versionados)
Artefactos generados (ignorados por .gitignore de Mixxx): build/ install/ buildenv/ CMakeSettings.json
Ningún commit realizado dentro de C:\dev\mixxx.
```

Evidencia completa sanitizada: `04_TESTS/evidence/001A_mixxx_tree_state.txt`.

## Reproducción resumida

1. Instalar VS 2022 Community + workload "Desktop development with C++" (incluye CMake 3.31 y Ninja): `winget install --id Microsoft.VisualStudio.2022.Community --override "--add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --quiet --norestart --wait"`.
2. `git clone https://github.com/mixxxdj/mixxx.git C:\dev\mixxx`.
3. En "x64 Native Tools Command Prompt for VS2022" (o `call vcvars64.bat`): `cd C:\dev\mixxx` → `tools\windows_buildenv.bat setup` → `mkdir build\x64-portable & cd build\x64-portable` → `cmake -DCMAKE_TOOLCHAIN_FILE=%MIXXX_VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake C:\dev\mixxx` → `cmake --build .`.
4. Arrancar `C:\dev\mixxx\build\x64-portable\mixxx.exe`.

## Conclusión

- ¿001-A cumple todos los criterios de aceptación?: **Sí** (sección 8 de la spec).
- Criterios pendientes: ninguno de compilación/arranque. Queda como acción del responsable, fuera de 001-A, la **aprobación explícita para avanzar a 001-B**.
- Estado de salida (uno solo, según la sección 9 de la spec):
  - [x] **Cerrada**
  - [ ] Abierta con bloqueo diagnosticado
  - [ ] Requiere nueva decisión/spec
- Justificación del estado: commit exacto registrado; toolchain y entorno de deps documentados con versiones; comandos reproducibles; build completa sin errores (1150/1150, exit 0); `mixxx.exe` arranca desde el artefacto local, alcanza estado usable y se cierra sin crash; árbol de Mixxx limpio y sin fork. El único aviso (traducciones "qt" `es_ES`) es benigno y no afecta la aceptación.
- Próximo paso autorizado: **ninguno automático.** Cerrar 001-A habilita *solicitar* una spec independiente para 001-B (FLX4 baseline); **no** habilita empezarla. Requiere aprobación explícita del responsable.
