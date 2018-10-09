<%-- 
    Document   : menuCookies
    Created on : Oct 8, 2018, 5:36:54 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();    
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
                </div>
            </section>
            <form class="botonera" method="get">
		<button type="submit" formaction="<%=path %>/JSP/contadorVisitas.jsp">Recargar</button>
		<button type="submit" formaction="<%=path %>/JSP/contadorVisitas.jsp" name="borrar" value="delete">Destruir Cookie</button>
		<button type="submit" formaction="<%=path %>">Volver</button>
            </form>
        </main>
    </body>
</html>
