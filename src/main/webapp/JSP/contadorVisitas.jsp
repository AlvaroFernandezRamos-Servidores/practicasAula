<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie[] galletas = request.getCookies();
    Cookie galleta = null;
    String caducidad = "";
    String infoGalleta="";
    
    String path = request.getContextPath();    
    
    int visitas = 0;
    if(galletas != null){
	for(int i=0; i<galletas.length; i++){
	    if(galletas[i].getName().equals("conteoVisitas")){
		galleta = galletas[i];
		visitas = Integer.parseInt(galleta.getValue()) + 1;
		galleta.setValue(Integer.toString(visitas));
		response.addCookie(galleta);
	
		switch(galleta.getMaxAge()){
		    case -1: caducidad = "La cookie expirará cuando se cierre el navegador." ;break;
		    default: caducidad = "La cookie expirará en " + galleta.getMaxAge()/1000 + " segundos." ;break;
		}
	    }
	}
    }
    if(visitas == 0){
        galleta = new Cookie("conteoVisitas","1");
        galleta.setMaxAge(-1);
        response.addCookie(galleta);
        visitas++;
	infoGalleta="<span>Nombre de la cookie: </span><span>"+galleta.getName()+"</span><br><span>Numero de visitas: </span><span>"+galleta.getValue()+"</span><br><span>Caducidad de la cookie: </span><span>"+caducidad+"</span><br>";
    }
    
    Map<String,String[]> mapa = request.getParameterMap();
    if(mapa.get("borrar") != null){
	galleta.setMaxAge(0);
	response.addCookie(galleta);
	visitas = -1;
    }
    switch(visitas){
	case -1: infoGalleta = "Se ha eliminado la cookie"; break;
	case 0:break;
	default: infoGalleta="<span>Nombre de la cookie: </span><span>"+galleta.getName()+"</span><br><span>Numero de visitas: </span><span>"+galleta.getValue()+"</span><br>"; break;
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
            <h1>Conteo de visitas</h1>
            <section>
                <div class="show-message">
		    <%=infoGalleta %>
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
