# Semáforo con cuenta regresiva — PIC16F887

Proyecto de cátedra de **Electrónica Digital II**. Semáforo vehicular de tres luces con
cuenta regresiva en display de 7 segmentos, programado en assembler para PIC16F887 y
verificado en Proteus.

Este repositorio se usa como **ejemplo en vivo** durante la clase de Git + GitHub: la
estructura de carpetas, los mensajes de commit, los issues y el tablero son los que
esperamos que use cada equipo en su propio proyecto.

---

## Estado actual

| Función | Estado |
|---|---|
| Secuencia verde → amarillo → rojo | Funcionando |
| Cuenta regresiva en el display | Funcionando |
| Tiempos configurables sin recompilar | En progreso |
| Botón de cruce peatonal | Pendiente |
| Modo nocturno (amarillo intermitente) | Bloqueado |

Lo que falta está cargado como issues. El tablero está en la pestaña **Projects**.

---

## Estructura del repositorio

```
.
├── README.md               ← lo primero que se ve al abrir el repo
├── COMO-TRABAJAMOS.md      ← acuerdos del equipo: commits, issues, tablero
├── .gitignore              ← lo que no se sube
├── .gitattributes          ← qué archivos Git trata como binarios
├── src/                    ← código fuente
│   ├── main.asm
│   └── inc/
│       ├── config.inc
│       ├── display7seg.inc
│       └── retardos.inc
├── sim/                    ← simulación de Proteus
│   ├── README.md
│   ├── semaforo.pdsprj
│   └── capturas/
├── hardware/               ← conexiones y esquemático
│   └── conexiones.md
├── docs/                   ← documentación e informe
│   ├── bitacora.md
│   ├── glosario-git.md
│   ├── checklist-buenas-practicas.md
│   └── plantilla-issue.md
└── .github/                ← plantillas de issues y de pull request
```

Regla general: el código va en `src/` y **lo que genera el compilador nunca se sube**
(`build/`, `.hex`, `.cof`, `.lst` están en el `.gitignore`).

---

## Cómo empezar

```bash
# 1. Clonar (una sola vez por computadora)
git clone https://github.com/USUARIO/ed2-semaforo.git
cd ed2-semaforo

# 2. Verificar que quedó bien
git status
git log --oneline
git remote -v
```

El ciclo de todos los días:

```bash
git pull                                  # traer lo que hicieron los demás
# ... editar ...
git status                                # ¿qué cambié?
git add src/main.asm
git commit -m "feat: descripción en presente"
git push
```

---

## Convención de mensajes de commit

```
tipo: qué hace el cambio, en presente y en una línea
```

| Tipo | Cuándo se usa |
|---|---|
| `feat` | función nueva |
| `fix` | corrección de un error |
| `docs` | documentación, README, informe |
| `sim` | cambios en la simulación de Proteus |
| `chore` | configuración del repositorio (`.gitignore`, plantillas) |

Ejemplos reales de este repositorio:

```
feat: mostrar la cuenta regresiva en el display de 7 segmentos
fix: corregir el orden de los segmentos en el dígito 6
sim: agregar el circuito de simulación en Proteus
docs: documentar las conexiones del hardware
```

Si el mensaje necesita un "y" en el medio, probablemente sean dos commits.

---

## Cómo se trabaja acá

1. Buscás un issue sin asignar en el tablero y te lo asignás.
2. Lo movés a **En progreso** *cuando empezás*, no cuando terminás.
3. Hacés los commits que hagan falta, mencionando el issue: `feat: ... (#4)`.
4. Cuando cumplís todos los criterios de aceptación, cerrás el issue.

El detalle completo está en [COMO-TRABAJAMOS.md](COMO-TRABAJAMOS.md).

## Integrantes

| Rol | Integrante |
|---|---|
| Firmware | *(completar)* |
| Simulación | *(completar)* |
| Documentación | *(completar)* |
