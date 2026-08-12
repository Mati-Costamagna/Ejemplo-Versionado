# Conexiones del circuito

## Alimentación y reloj

| Pin | Conexión |
|---|---|
| VDD (11, 32) | +5 V |
| VSS (12, 31) | GND |
| MCLR (1) | +5 V con resistencia de 10 kΩ |
| OSC1 / OSC2 (13, 14) | Cristal de 4 MHz + 2 capacitores de 22 pF a GND |

## Luces del semáforo

| Pin | Señal | Componente |
|---|---|---|
| RB0 | Rojo | LED + R 330 Ω a GND |
| RB1 | Amarillo | LED + R 330 Ω a GND |
| RB2 | Verde | LED + R 330 Ω a GND |

## Display de 7 segmentos (doble, cátodo común)

| Pin | Segmento |
|---|---|
| RD0 | a |
| RD1 | b |
| RD2 | c |
| RD3 | d |
| RD4 | e |
| RD5 | f |
| RD6 | g |

Multiplexado:

| Pin | Dígito |
|---|---|
| RC0 | Decenas |
| RC1 | Unidades |

Cada segmento lleva su resistencia de 220 Ω.

## Entradas

| Pin | Función | Notas |
|---|---|---|
| RA0 | Pulsador de cruce peatonal | Pull-up de 10 kΩ. Todavía no implementado en firmware (issue #4) |

## Pendiente

- [ ] Medir el consumo real con los dos dígitos encendidos.
- [ ] Verificar el brillo del display con 220 Ω; puede necesitar 150 Ω.
