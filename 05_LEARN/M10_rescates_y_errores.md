# Módulo 10 · Rescates y errores — v2

**Objetivo:** que cuando algo descarrile —la mezcla **o la herramienta**— lo arregles en **menos de 8 beats** o lo conviertas en algo que parezca hecho aposta. Un DJ tranquilo no es el que no falla: es el que **sabe qué hacer** cuando falla. Y como tu cabina es también un proyecto en construcción, aquí entran los **fallos de la herramienta** (y el `BUGS.md`).

**Tiempo:** 2 semanas de escalera + repaso mensual. **Necesitas:** tu par de entreno, ganas de romperlo a propósito, y alguien que te «sabotee» (o tú con los ojos cerrados).

---

## 1. Las tres reglas

1. **La música no se para nunca.** El silencio es el único error que todos notan.
2. **No toques el MASTER en pánico.** Solo empeora.
3. **El público nota la reacción, no el error.** Cara de póker. Sin muecas, sin «perdón».

Y la regla de los 3 segundos: si en **3 segundos** no sabes qué está pasando, **corte en el 1** de la que suena bien y a otra cosa.

## 2. Los rescates de mezcla, de suave a duro

| # | Rescate | Cuándo | Qué tocas |
|---|---|---|---|
| R0 | **Volver al cue** | B descarrila **en el casco** (nadie la oye) | **CUE de plato** o **pad 1** de B; realinea; entra en el siguiente bloque |
| R1 | **Nudge** | Galope leve (fase) | **Borde del jog** de la que entra, toques cortos, dirección correcta (M1b) |
| R2 | **Beat jump** | A tiempo pero frase cruzada | **BEAT JUMP** ±4 / ±8 |
| R3 | **Corte en el 1** | Descarrile evidente | **Crossfader** (o fader) de golpe en el siguiente 1 de la **buena** |
| R4 | **Fundido con filtro** | Todo perdido, sin 1 claro | **CFX** de la mala a la izquierda + **fader** abajo en 4 compases |
| R5 | **Echo out de emergencia** | Hay que cortar ya pero que suene «a propósito» | **Beat FX Echo ON + fader a cero** en el próximo 1 (M7 E2) |
| R6 | **Loop de contención** | La buena se acaba y no tienes nada | **4 BEAT** en la buena y prepara con calma (M6) |

## 3. El panic checklist (10 segundos, en este orden)

Cuando **no suena lo que debería**, sigue la cadena de M0:
1. ¿**PLAY**? (¿el deck parpadea?)
2. ¿**Fader** arriba? ¿**Crossfader** en el lado correcto?
3. ¿**CUE de canal** como toca? ¿**HEADPHONES MIX** hacia donde quiero oír?
4. ¿**TRIM** a cero por accidente? ¿**LOW / CFX** a tope?
5. ¿**MASTER LEVEL** movido?
6. ¿Mixxx da **error de audio**? (48000 Hz; ver BUGS #01)

Escríbelo en una tarjeta pegada a la consola hasta que te salga solo.

## 4. Fallos de la herramienta (los tuyos, no los del DJ)

| Síntoma | Probable | Qué hacer en directo | Después |
|---|---|---|---|
| La FLX4 **deja de responder** | USB flojo / se durmió el puerto | Sigue con **ratón/teclado** en Mixxx (play, faders en pantalla); reconecta el USB en una intro | Anotar en BUGS; cable/puerto |
| **Sin audio** de repente | Dispositivo perdido (Windows cambió salida) | Preferencias → Hardware de sonido → reelegir FLX4 → Aplicar; o reinicia con el **lanzador** | BUGS; fijar la FLX4 como salida |
| **Chasquidos** | Búfer justo / CPU | Sube el búfer un escalón (M2); cierra otras apps | Anotar valor bueno |
| **Mixxx se congela** | Raro; a veces por biblioteca/análisis | Espera 10 s; si no, cierra y relanza con el lanzador; el cfg y los cues persisten | BUGS con contexto |
| La **skin no carga** / se ve rara | Modo developer / recursos (BUGS #02-#04) | Lanzador `Mixxx Sinatra.cmd`; si sigue, cambia a la skin legacy `LateNight_Sinatra` desde Preferencias → Interfaz | BUGS |
| **Rejilla mal** en una pista | Análisis | R1/R2 en directo; después M6b (ajustar beatgrid) | Marcar pista |
| **Pista no carga** («no se puede cargar sobre una en reproducción») | Normal | Pausa el deck o usa el otro | — |

Regla: **en directo, resuelve o rodea; después, documenta.** Cada línea nueva de `BUGS.md` es una mejora de Sinatra (y una idea para Learn).

---

## 5. Escalera de niveles (Regla 3×5)

**N1 · R1 y R2.** Sabotaje de fase → nudge en < 8 beats; frase cruzada → un beat jump. 5 de 5 cada uno, 3 días.
**N2 · R3 y R5.** Descarrile → corte en el 1 (o echo out) que **suena intencional** en la grabación. 5 de 5, 3 días.
**N3 · Checklist.** Alguien «rompe» algo de la consola; lo encuentras en < 10 s sin mirar la pantalla. 5 de 5, 3 días.
**N4 · Herramienta.** Simulas 3 fallos de la tabla del punto 4 (desconectar USB, cambiar salida de Windows, cargar sobre deck sonando) y **no paras la música** en ninguno. 3 de 3, 2 días.
**N5 · En set.** En un set de 30 con público de confianza, provocas un error por transición y lo rescatas; nadie sabe dónde. 3 sets.

## 6. Ejercicios

### E1 · «Romper y arreglar» (N1)
Igualadas. Toque de jog → galope → nudge en dirección correcta (< 8 beats). Arranca B en el 3 → frase cruzada → beat jump. Con los ojos cerrados: primero oír, luego actuar.

### E2 · «El corte que parece aposta» (N2)
Desalinea B con un toque largo. Cuenta A. En su siguiente 1: crossfader de golpe. Prepara B (R0) y entra en el siguiente bloque. Variante con **echo out** (R5).

### E3 · «Fundido de emergencia» (N2)
Pista con rejilla rara o breakdown sin bombo (no encuentras el 1). CFX de la mala a la izquierda + fader abajo en 4 compases. La buena sigue sola.

### E4 · «Panic drill» (N3)
Cinco rondas: alguien mueve TRIM a cero / MIX al revés / CUE apagado / crossfader al otro lado / deck en pausa. Checklist, < 10 s.

### E5 · «Simulacro de herramienta» (N4)
Con una mezcla sonando: (1) desconecta el USB de la FLX4 → sigue con ratón/teclado, reconecta en una intro; (2) cambia la salida de Windows a los altavoces del portátil → recupera la FLX4 en Preferencias; (3) intenta cargar sobre un deck sonando → pausa/otro deck. Cero silencio.

### E6 · «Error en público» (N5)
Con 2-3 amigos, un error provocado por transición y rescate con cara de póker. Pregunta después si lo notaron.

## 7. Errores típicos

- **Parar el deck.** Silencio total.
- **Subir/bajar el MASTER** en pánico.
- **Mirar la pantalla** buscando qué pasa. Consola primero, checklist mental.
- **Insistir con el jog** en un descarrile grande. 8 beats y, si no, corte.
- **Pedir perdón por el micro.**
- **Arreglar la herramienta en mitad del set.** Rodea; documenta después.

## 8. Reto del módulo

Set de 4 canciones con un error distinto por transición (galope, frase cruzada, descarrile, **fallo de herramienta simulado**) y su rescate. En la grabación, un oyente no sabe dónde estuvieron. Tres sets, tres días. Y `BUGS.md` con al menos una entrada nueva tuya.
