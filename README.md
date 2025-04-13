# To-Do App with Hive

¡Bienvenido a la aplicación To-Do que utiliza Hive para almacenar tareas! Esta aplicación te permite agregar, eliminar y marcar tareas como completadas. Puedes utilizarla tanto en dispositivos móviles (Android) como en la versión web.

## Screenshots

### Pantalla inicial:
![Pantalla principal](ruta/a/la/primera_imagen.png)

### Completar Tarea:
![Vista de tarea completada](ruta/a/la/segunda_imagen.png)

### Añadir Tarea:
![Configuración de tareas](ruta/a/la/tercera_imagen.png)

## Características

- Agregar tareas nuevas.
- Marcar tareas como completadas.
- Eliminar tareas completadas.
- Interfaz de usuario sencilla y rápida.

## Cómo usar la app

1. **Agregar tarea:**
   Para agregar una tarea, simplemente presiona el botón de "+" en la parte inferior derecha de la pantalla principal.

2. **Marcar tarea como completada:**
   Puedes marcar cualquier tarea como completada utilizando el checkbox.

3. **Eliminar tarea:**
   Si deseas eliminar una tarea, desliza hacia la izquierda en la tarea para acceder a la opción de eliminar.

4. **Eliminar tareas completadas:**
   Si deseas eliminar todas las tareas completadas, puedes hacerlo presionando el botón de la papelera en la parte inferior izquierda de la pantalla.

---

## Descargar la APK

Si prefieres usar la versión móvil de la aplicación, puedes descargar el APK desde [AQUÍ](build/app/outputs/flutter-apk/app-release.apk)  

Sigue los siguientes pasos para instalar la APK:

1. Descarga el archivo APK desde el enlace anterior.
2. Asegúrate de habilitar la opción de instalar aplicaciones de fuentes desconocidas en la configuración de tu dispositivo Android.
3. Abre el archivo APK y sigue las instrucciones en pantalla para instalar la aplicación.

---

## Usar la versión web en local

Si prefieres probar la versión web en tu máquina local, puedes hacerlo siguiendo estos pasos:
(debes tener python3 instalado)

### 1. Clonar el repositorio y crear servidor python en local

```bash
git clone https://github.com/gabmartinbr/ToDo_app_hive_db.git
cd build/web
python -m http.server 8000
```
Esto levantará un servidor local en el puerto 8000. Ahora, abre tu navegador y ve a http://localhost:8000 para ver la aplicación en acción.
