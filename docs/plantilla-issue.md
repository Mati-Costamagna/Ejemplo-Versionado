# Plantilla de issues — para copiar y pegar

Este repositorio ya tiene las plantillas cargadas: al apretar **New issue** aparecen
solas y GitHub arma el formulario. Esta página es la versión en texto, para tener a
mano, para pegar en un repositorio que todavía no las tenga configuradas, o para
escribir el issue en papel antes de cargarlo.

---

## 1. User Story

Para una funcionalidad nueva. Título: `[US] descripción corta`

```markdown
**Como** <quién la usa>
**Quiero** <qué tiene que poder hacer>
**Para que** <beneficio concreto>

### Criterios de aceptación
- [ ] 
- [ ] 
- [ ] 

### Notas técnicas
<archivos que se tocan, pines, dependencias con otros issues>

### Definición de terminado
- [ ] Se cumplen todos los criterios de aceptación
- [ ] El código está pusheado a `main`
- [ ] Funciona en la simulación de Proteus
- [ ] La documentación quedó actualizada si hacía falta
```

**Ejemplo completo:**

```markdown
**Como** conductor que se acerca al cruce
**Quiero** ver cuántos segundos faltan para que cambie la luz
**Para que** pueda decidir si frenar o avanzar sin quedar en la mitad del cruce

### Criterios de aceptación
- [ ] El display muestra los segundos restantes de la fase actual
- [ ] La cuenta llega a 0 justo cuando cambia la luz
- [ ] Los números de 0 a 9 se muestran con un solo dígito, sin cero adelante
- [ ] Funciona en las tres fases

### Notas técnicas
Toca src/inc/display7seg.inc. Multiplexado de dos dígitos por RC0 y RC1.
```

### La regla de la tercera línea

El **Para que** es el que más cuesta y el más importante. Si no se puede completar,
probablemente la tarea no haga falta, o está mal planteada.

| Floja | Buena |
|---|---|
| Programar el display | **Como** conductor **quiero** ver los segundos restantes **para que** pueda decidir si frenar |
| Arreglar el código del timer | **Como** equipo **queremos** usar TMR0 en lugar de retardos bloqueantes **para que** el pulsador responda durante la cuenta |
| Hacer el informe | **Como** docente **quiero** un README con el esquemático **para que** pueda evaluar sin abrir Proteus |

Lo que está a la izquierda no dice ni para quién ni para qué.

---

## 2. Error (bug)

Título: `[BUG] descripción corta`

```markdown
### Qué pasa
<una o dos frases, sin interpretaciones>

### Cómo reproducirlo
1. 
2. 
3. 

### Qué debería pasar
<comportamiento esperado>

### Dónde aparece
Simulación / circuito físico / los dos / al compilar

### Último commit en el que anda bien
<hash corto, se saca con git log --oneline>
```

---

## 3. Tarea

Para lo que no es una funcionalidad: documentación, configuración, mediciones.
Título: `[TAREA] descripción corta`

```markdown
### Qué hay que hacer

### Por qué

### Cómo sabemos que está terminada
- [ ] 
- [ ] 
```

---

## Cómo se escribe un criterio de aceptación

Un criterio de aceptación se responde con **sí o no**. Si hay que discutirlo, no es
un criterio.

| No sirve | Sirve |
|---|---|
| El display anda bien | La cuenta llega a 0 justo cuando cambia la luz |
| Que sea rápido | El refresco es de al menos 50 Hz, sin parpadeo visible |
| Código prolijo | Cada rutina tiene un comentario de encabezado con entradas y salidas |

Se escriben **antes** de programar, no después. Son la definición de terminado.

---

## Después de crear el issue

1. **Etiqueta**: `user story`, `bug`, `tarea`, `documentación`, `simulación`.
2. **Responsable**: alguien concreto. Un issue sin responsable no avanza.
3. **Tablero**: agregarlo al Project del equipo.
4. **Milestone**: la entrega a la que corresponde.

Y cuando trabajes en él, mencionalo en los commits:

```bash
git commit -m "feat: mostrar la cuenta regresiva en el display (#1)"
git commit -m "fix: corregir el rebote del pulsador, closes #12"
```
