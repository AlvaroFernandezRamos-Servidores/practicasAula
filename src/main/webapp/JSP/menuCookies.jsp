<%-- 
    Document   : menuCookies
    Created on : Oct 8, 2018, 5:36:54 PM
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
    
    if(request.getParameter("cookieName") != null && request.getParameter("cookieValue") != null){
	mensaje = "Cookie con clave: " +request.getParameter("cookieName")+ " y valor: " +request.getParameter("cookieValue"); 
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
         <main>
            <h1>Menú de Cookies</h1>
            <section>
                <div class="show-message">
		    <%=mensaje%>
                </div>
            </section>
            <form class="botonera" method="get" action="<%=path%>/JSP/controlCookies.jsp">
		<label>Clave:</label><input type="text" name="nombreCookie" value="">
		<label>Valor:</label><input type="text" name="valorCookie" value="">
		<br>
		<input type="submit" name="operacion" value="Crear">
		<input type="submit" name="operacion" value="Consultar">
		<input type="submit" name="operacion" value="Modificar">
		<input type="submit" name="operacion" value="Eliminar">
            </form>
        </main>
    </body>
</html>
