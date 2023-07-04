# AWS-Deploy

Este flujo de trabajo despliega una imagen Docker en AWS y lanza una instancia EC2 utilizando una plantilla de lanzamiento preconfigurada. También recupera la dirección IP pública de la instancia EC2 y comenta la dirección IP en un commit en GitHub.

## Descripción del workflow

El workflow se activa cuando se realiza un push o una pull request en la rama `main` o `master`.

1. Verificar el código: Este paso verifica el código del repositorio utilizando la acción `actions/checkout`.

2. Iniciar sesión en el Registro de Contenedores de GitHub: Este paso inicia sesión en el Registro de Contenedores de GitHub utilizando el token de acceso personal proporcionado (`PERSONAL_ACCESS_TOKEN`) para autenticar el inicio de sesión de Docker.

3. Construir y enviar la imagen Docker: Este paso construye y etiqueta la imagen Docker, y la envía al Registro de Contenedores de GitHub.

4. Configurar las credenciales de AWS: Este paso configura las credenciales de AWS utilizando la clave de acceso ID (`AWS_ACCESS_KEY_ID`) y la clave de acceso secreta (`AWS_SECRET_ACCESS_KEY`) proporcionadas.

5. Lanzar instancia EC2 desde la plantilla de lanzamiento: Este paso lanza una instancia EC2 utilizando la plantilla de lanzamiento especificada (`lt-0d54503baa0a64beb`).

6. Obtener información de la instancia: Este paso obtiene la dirección IP pública de la instancia EC2 lanzada y la establece como variable de entorno.

7. Comentar la dirección IP: Este paso comenta la dirección IP de la instancia EC2 en un commit utilizando la acción `peter-evans/commit-comment`. Utiliza el token de acceso personal (`PERSONAL_ACCESS_TOKEN`) para autenticar el comentario.

8. Mostrar la dirección IP: Este paso simplemente muestra la dirección IP de la instancia EC2 en los logs del workflow.

## INFORMACIÓN IMPORTANTE

La plantilla para este despliegue es `lt-0d54503baa0a64beb`. Configura una instancia EC2 y utiliza 'User Data' en ella para instalar dependencias y ejecutar el proyecto.

## Requisitos previos

- Clave de acceso ID y clave de acceso secreta de AWS con los permisos adecuados. Se configuran como secretos en el repositorio de GitHub con los nombres `AWS_ACCESS_KEY_ID` y `AWS_SECRET_ACCESS_KEY`.

- Token de acceso personal con los alcances necesarios para iniciar sesión en el Registro de Contenedores de GitHub y comentar en los commits. Se configura como un secreto en el repositorio de GitHub con el nombre `PERSONAL_ACCESS_TOKEN`.
  - La razón por la que estoy utilizando un PAT en lugar de GITHUB_TOKEN es porque tuve algunos problemas inesperados al usarlo, así que ten en cuenta que:
  - **ESTO NO ES BUENA PRÁCTICA**

- El ID de la plantilla de lanzamiento debe ser (`lt-0d54503baa0a64beb`) si deseas ejecutar este proyecto. Esta es la versión 10 de la plantilla.
