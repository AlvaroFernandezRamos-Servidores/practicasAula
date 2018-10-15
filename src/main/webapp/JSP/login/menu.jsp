<%-- 
    Document   : menu
    Created on : Oct 11, 2018, 4:11:07 PM
    Author     : atomsk
--%>

<%@page import="java.util.Locale"%>
<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    ArrayList data = (ArrayList) sesion.getAttribute("userData");
    // DEBIDO A LO QUE TE HE PUESTO EN controlLogin.jsp AQUÍ SIEMPRE ACCEDES A get(0)
    String mensaje="Bienvenido "+data.get(0);
    String visitas="";
    Cookie[] galletas = request.getCookies();
    Cookie galleta = null;
    Date loginDate = new Date();
    String path = request.getContextPath();
    
    if(galletas != null){
	for(int i=0; i<galletas.length; i++){
	    if(galletas[i].getName().equals(data.get(0))){
		galleta = galletas[i];
		Date previous = new Date(Long.parseLong(galleta.getValue()));
		Calendar cal = Calendar.getInstance();
		cal.setTime(previous);
		visitas = "Estuviste aquí por última vez el "+cal.get(Calendar.DAY_OF_MONTH) + " de " + StringUtils.capitalize(cal.getDisplayName(Calendar.MONTH, Calendar.LONG, new Locale("es","ES"))) + " de " + cal.get(Calendar.YEAR) + " a las " + (previous.getHours() < 10?"0"+previous.getHours():previous.getHours()) + ":" + (previous.getMinutes() < 10?"0"+previous.getMinutes():previous.getMinutes());
		galleta.setValue(Long.toString(loginDate.getTime()));
		response.addCookie(galleta);
                // TENDRÍAS QUE ROMPER EL FOR
	    }
	}
    }
    
    if(galleta == null){
	galleta = new Cookie((String) data.get(0),Long.toString(loginDate.getTime()));
	galleta.setMaxAge(-1);
	response.addCookie(galleta);
	visitas = "Ésta es tu primera visita!";
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>Menú de Usuario</title>
    </head>
    <body>
         <main>
            <h1>Menú de Usuario</h1>
            <section>
                <div class="show-message"><%=mensaje%><%=visitas%></div>
		<br>
		<span>Disfruta de la gran cantidad de opciones a tu disposición.</span>
		<br>
		<a href="<%=path%>/JSP/login/logout.jsp">Cerrar sesión</a>
            </section>
        </main>
    </body>
</html>
