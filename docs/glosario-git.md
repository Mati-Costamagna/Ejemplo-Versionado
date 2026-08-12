# Glosario de comandos

## En tu máquina

| Comando | Qué hace |
|---|---|
| `git status` | Qué cambió y qué está pendiente de confirmar |
| `git diff` | Qué cambió exactamente, línea por línea |
| `git add archivo` | Elegir qué entra en el próximo commit |
| `git add .` | Agregar todo lo modificado |
| `git commit -m "..."` | Confirmar los cambios en el repositorio local |
| `git log --oneline` | Ver el historial, un commit por línea |
| `git log --oneline --graph` | El historial con las ramas dibujadas |
| `git restore archivo` | Descartar los cambios no confirmados de un archivo |
| `git config --global --list` | Ver con qué nombre y correo estás firmando |

## El remoto

| Comando | Qué hace |
|---|---|
| `git clone URL` | Traer un repositorio completo por primera vez |
| `git pull` | Bajar lo que hicieron los demás |
| `git push` | Subir tus commits al repositorio remoto |
| `git remote -v` | Ver a qué repositorio remoto está conectada la carpeta |
| `git fetch` | Bajar los cambios sin aplicarlos todavía |

## Comandos de Bash que hacen falta

| Comando | Qué hace |
|---|---|
| `pwd` | En qué carpeta estás parado |
| `ls -la` | Listar archivos, incluidos los ocultos |
| `cd ruta` | Entrar a una carpeta (`..` sube un nivel) |
| `mkdir carpeta` | Crear una carpeta |
| `touch archivo.txt` | Crear un archivo vacío |
| `cat archivo.txt` | Mostrar el contenido de un archivo |
| `rm archivo.txt` | Borrar un archivo (`-r` para una carpeta) |

La tecla **Tab** autocompleta rutas y comandos.
