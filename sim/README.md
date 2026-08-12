# Simulación en Proteus

## Archivos

| Archivo | Qué es |
|---|---|
| `semaforo.pdsprj` | Proyecto de Proteus con el circuito completo |
| `capturas/` | Capturas de pantalla de la simulación andando |

## Cómo correrla

1. Compilar `src/main.asm` en MPLAB X. Genera `build/semaforo.hex` (no se sube).
2. Abrir `semaforo.pdsprj`.
3. Doble clic sobre el PIC → **Program File** → apuntar al `.hex` recién generado.
4. Play.

## Regla importante del equipo

`.pdsprj` es un **archivo binario**: Git no lo puede fusionar. Si dos personas lo
editan al mismo tiempo, uno de los dos cambios se pierde y hay que rehacerlo a mano.

Antes de abrir la simulación:

1. `git pull`
2. Avisar en el issue correspondiente ("tomo la simulación").
3. Editar, guardar, commit con prefijo `sim:` y `git push` en el mismo día.

No dejar el `.pdsprj` modificado sin subir de una clase para la otra.

> **Nota para la clase:** el `.pdsprj` de este repositorio es un archivo de ejemplo,
> no un proyecto de Proteus real. Sirve para mostrar en vivo cómo se comporta Git
> con un binario (`git diff` no muestra líneas, solo dice que cambió).
