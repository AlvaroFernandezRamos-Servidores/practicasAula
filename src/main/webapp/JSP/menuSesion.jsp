<%-- 
    Document   : menuSesion
    Created on : Oct 9, 2018, 11:35:19 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    
    String cookieName = "";
    String cookieValue = "";
    String mensaje = "";
    
    if(request.getParameter("response") != null){
	mensaje = request.getParameter("response").replace("%20"," ");
    }
    
    if(request.getParameter("paramName") != null && request.getParameter("paramVal") != null){
	mensaje = "Parámetro con clave: " +request.getParameter("paramName")+ " y valor: " +request.getParameter("paramVal"); 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>Menú de Sesión</title>
    </head>
    <body>
         <main>
            <h1>Menú de Sesión</h1>
            <section>
                <div class="show-message">
		    <%=mensaje%>
                </div>
            </section>
            <form class="botonera" method="get" action="<%=path%>/JSP/controlSesion.jsp">
		<label>Clave:</label><input type="text" name="paramName" value="">
		<label>Valor:</label><input type="text" name="paramVal" value="">
		<br>
		<input type="submit" name="operacion" value="Crear">
		<input type="submit" name="operacion" value="Consultar">
		<input type="submit" name="operacion" value="Modificar">
		<input type="submit" name="operacion" value="Eliminar">
            </form>
        </main>
    </body>
</html>

    