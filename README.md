# practicasAula
## [27/09/2018] Añadidos los ficheros del proyecto:
- Formulario Simple.
- Formulario Complejo.
- Formulario Registro (Incompleto).
    
## [28/09/2018] Completado Formulario Registro.

## [1/10/2018] Se incluye formulario en dos pasos.

    El formulario consta de un html y un servlet de control, los parámetros se envían desde el html de inserción la primera vez y desde el servlet las subsiguientes, que dependiendo del resultado puede mostrar una pantalla donde se listan los errores en los campos. La navegación continua llamándose el servlet a sí mismo para mostrar el formulario con los campos erróneos indicados, si los hubiere.
    Se recorren los parámetros con un Map, y se controla cada uno de los campos con distintas cláusulas if/else.
    Cuando la inserción es completa y correcta los valores se muestran en una pantalla de lectura.
    
## [4/10/2018] Incluidos los ejercicios con JSP

- Saludo
- Calculo de edad
        Utilizando páginas JSP se crean funcionalidades básicas. La primera es un saludo que muestra nombre, apellidos y tratamiento (dependiendo del género) basandose en parámetros recibidos de un formulario html.
        En el calculo de edad recibimos una fecha desde un formulario con un input de tipo Date, y en el control jsp se calcula el número de días, meses y años de vida del individuo tratado. Controla errores para valores imposibles, como fechas posteriores a la actual.
        
## [8/10/2018] Incluida funcion de contador de visitas por cookies

    Mediante el uso de cookies se lleva el control de las visitas a la página, estableciendo una cookie cuando no exista, incrementando el valor de las visitas si ésta existe en las navegaciones subsiguientes y permitiendo la eliminación de la cookie y notificándolo por pantalla.
    
## [9/10/2018] Incluida práctica de calculadora básica en JSP

    Esta práctica consta de dos JSP, una de inserción y otra de control de datos. Los parámetros se definen en la JSP de inserción y son tratados en la segunda JSP, donde, después de operar con ellos, son enviados como valores en la URL (tipo GET) hasta la primera, que los muestra.

## [10/10/2018] Incluidas funcionalidades de control de cookies, contador de visitas con sesión y control de atributos de sesión:
- Control de cookies:
        Funcionalidad que permite al usuario:
            - Crear una cookie con unos valores concretos.
            - Consultar una cookie existente, mostrando un error si la cookie no existe.
            - Modificar una cookie existente, mostrando error si la cookie no existe o no se introduce un nuevo valor.
            - Eliminar una cookie existente, indicando un error si la cookie introducida no encuentra coincidencias.
- Contador de visitas con sesión
        Funcionalidad que contabiliza las visitas a esta JSP pero mediante el uso de atributos de sesión (request.getSession()), de manera similar al conteo de visitas con cookies.
- Control de atributos de sesión
        Funcionalidad que permite al usuario:
            - Crear un atributo determinado en la sesión con unos valores concretos.
            - Consultar un atributo existente, mostrando un error si el atributo no existe.
            - Modificar un atributo existente, mostrando error si el atributo no existe o no se introduce un nuevo valor.
            - Eliminar un atributo existente, indicando un error el atributo introducido no encuentra coincidencias.

## [11/10/2018] Incluida funcionalidad de Login
    La funcionalidad de Login consiste en 4 JSP relacionadas entre sí de la siguiente manera:
    
 -Login.jsp: 
    Presenta un formulario de entrada donde el usuario puede introducir el nombre de usuario y contraseña. Adicionalmente puede marcar un check si desea que el sistema recuerda el userName.
 -controlLogin.jsp:
    Controller, no tiene visualización. Valida que los valores del formulario de login lleguen y lleguen bien. De ser así redirige la navegación hasta el menú de usuario. De lo contrario navega de vuelta a login.jsp con parámetros que describen el error en la validación.
 -menu.jsp:
    Esta vista muestra al usuario un mensaje de saludo, indicando si es la primera vez que hizo login o la fecha de su último acceso al sistema. En la parte inferior existe un enlace que permite al usuario cerrar la sesión.
 -logout.jsp:
    Este controller invalida la sesión y navega hasta la página de login.
