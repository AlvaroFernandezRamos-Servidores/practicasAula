<%-- 
    Document   : visitasSesion
    Created on : Oct 10, 2018, 10:42:42 AM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String visitas = (String) sesion.getAttribute("Visitas");
    String mensaje="";
    
    String path = request.getContextPath();
    int nvisitas =0;
    if(visitas != null && visitas.length()>0){
	nvisitas = Integer.parseInt(visitas) + 1;
    }else{
	nvisitas=1;
    }
    
    if(nvisitas >= 1){
	if(nvisitas==1){
	    mensaje="<span><strong>¡Sesión creada!</strong></span><br><span>Numero de visitas: </span><span>"+nvisitas+"</span><br>";
	}
	sesion.setAttribute("Visitas",Integer.toString(nvisitas));
    }
    
    if(request.getParameter("borrar")!= null){
	nvisitas = -1;
	sesion.invalidate();
    }
    
    switch(nvisitas){
	case -1: mensaje = "Se ha eliminado la sesión"; break;
	case 0:break;
	case 1:break;
	default: mensaje="<span>Numero de visitas: </span><span>"+nvisitas+"</span><br>"; break;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>Conteo de visitas</title>
    </head>
    <body>
         <main>
            <h1>Conteo de visitas</h1>
            <section>
                <div class="show-message">
		    <%=mensaje %>
                </div>
            </section>
            <form class="botonera" method="get">
		<button type="submit" formaction="<%=path %>/JSP/visitasSesion.jsp">Recargar</button>
		<button type="submit" formaction="<%=path %>/JSP/visitasSesion.jsp" name="borrar" value="delete">Destruir Sesión</button>
		<button type="submit" formaction="<%=path %>">Volver</button>
            </form>
        </main>
    </body>
</html>