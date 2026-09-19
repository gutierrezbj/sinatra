# SINATRA — Registro de decisiones

Registro de decisiones de rumbo y arquitectura en formato ADR. Una decisión no se edita para cambiar su sentido: si cambia, se añade una entrada nueva que la sustituye y se enlaza desde la anterior.

Estados posibles: **Vigente** · **Sustituida por ADR-NNN** · **Retirada**.

---

## ADR-001 · No crear un fork de Mixxx todavía

**Estado:** Vigente  
**Fecha:** 2026-09-18 · ratificada 2026-09-19  
**Responsable:** Juan Ramón Gutiérrez  
**Afecta a:** Hito 001 completo (001-A a 001-D) y a la revisión de rumbo posterior

### Contexto

Sinatra quiere explorar una experiencia DJ más clara y moderna (modos Learn, DJ y Radio) sin reescribir un motor de audio. Mixxx ofrece un motor maduro y libre, soporte de controladoras (incluida la DDJ-FLX4), skins clásicas y una ruta QML en desarrollo.

Al arrancar el proyecto no se sabe cuánto de la experiencia deseada puede construirse encima de Mixxx sin tocar el motor. Crear un fork antes de saberlo compromete a mantener una divergencia sin evidencia de que sea necesaria.

### Decisión

No crear ni publicar un fork de Mixxx en esta etapa. Se trabaja sobre el repositorio oficial sin modificar. Los experimentos de Sinatra (skins, mappings, QML) se hacen sobre copias aisladas e identificadas, fuera del árbol de Mixxx, dentro de `02_MODS/`.

Ruta ratificada: **Windows 11 en GARAGE1 → Mixxx como motor → FLX4 → interfaz Sinatra → QML → Learn.**

### Alternativas consideradas

1. **Fork de Mixxx desde el inicio.** Descartada: obliga a mantener divergencia y a seguir el upstream antes de saber si hace falta tocar el motor.
2. **Motor propio.** Descartada: reescribir infraestructura de audio queda fuera del objetivo, que es interfaz y experiencia.
3. **Construir sobre una aplicación comercial (djay u otras).** Descartada como plataforma. djay queda únicamente como referencia de experiencia móvil.
4. **Aplicación móvil como primer objetivo.** Descartada en esta etapa. Queda como posible evolución futura; no forma parte del alcance actual ni autoriza una aplicación móvil.

### Consecuencias

- Sin coste de mantenimiento de fork ni de sincronización con upstream durante el Hito 001.
- Todo lo que se construya queda limitado a lo que Mixxx expone sin modificar código: skins, QSS, QML, mappings y configuración.
- El Hito 001 sirve para medir ese límite con evidencia antes de decidir arquitectura.
- Cualquier necesidad de tocar motor, pipeline de audio o código funcional obliga a parar y reabrir esta decisión, no a saltársela.
- Las implicaciones de licencia (GPL) solo se revisan si se plantea distribución.

### Condiciones para reconsiderarla

Se reabre esta decisión, con una ADR nueva, si se da cualquiera de estas:

- 001-C o 001-D demuestran con evidencia que la experiencia objetivo no puede construirse con skins, QML o mappings sin tocar código de Mixxx.
- Se necesita modificar motor, pipeline de audio o código funcional para un objetivo de Sinatra.
- Se plantea distribuir Sinatra a terceros.
- La ruta QML de Mixxx cambia o se abandona en upstream de forma que invalida 001-D.
- El responsable del proyecto cambia el rumbo (por ejemplo, prioriza la versión móvil).

La revisión formal está prevista en la sección "Revisión de rumbo" de `SINATRA_Hito001_Checklist_Tecnico.md`, tras cerrar 001-D.
