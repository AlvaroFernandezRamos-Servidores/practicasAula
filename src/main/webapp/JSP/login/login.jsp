<%-- 
    Document   : login
    Created on : Oct 11, 2018, 4:10:06 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje="";
    String path = request.getContextPath();
    String recuerdaUser = "";
    String checked = "";
    
    Cookie[] galletas = request.getCookies();
    Cookie galleta = null;
    
    
    if(galletas != null){
	for(int i=0; i<galletas.length; i++){
	    if(galletas[i].getName().equals("recuerdame")){
		recuerdaUser = galletas[i].getValue();
	    }
	}
    }
    
    if(recuerdaUser.length()>0){
	checked = "checked";
    }
    
    if(request.getParameter("respuesta") != null && request.getParameter("respuesta").length()>0){
	mensaje = request.getParameter("respuesta").replace("%20", " ");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>Menú de Cookies</title>
    </head>
    <body>
         <main>
            <h1>Menú de Cookies</h1>
            <section>
                <div class="show-message"><%=mensaje%></div>
            </section>
            <form class="botonera" method="get" action="<%=path%>/JSP/login/controlLogin.jsp">
		<label>Usuario:</label><input type="text" name="user" value="<%=recuerdaUser%>">
		<label>Contraseña:</label><input type="password" name="passwd" value="">
		<br>
		<label>Recuerdame:</label><input type="checkbox" name="recuerdame" value="si" <%=checked%>>
		<br>
		<input type="submit" name="operacion" value="Login">
            </form>
        </main>
    </body>
</html>
