<%-- 
    Document   : controlCookies
    Created on : Oct 8, 2018, 5:37:07 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Cookie[] galletas = request.getCookies();
    Cookie galleta = null;
    String infoGalleta="";
    boolean problema = false;
    
    String path = request.getContextPath();
    
    if(galletas != null){
	for(int i=0; i<galletas.length; i++){
	    if(galletas[i].getName().equals(request.getParameter("nombreCookie"))){
		galleta = galletas[i];
	    }
	}
    }
    
    String operacion = request.getParameter("operacion");
    String mensaje = "";
    
    if(operacion != null){
	if(operacion.equals("Crear") && request.getParameter("nombreCookie") == null || request.getParameter("valorCookie") == null){
	    mensaje = "?response=Faltan campos necesarios para la creación de la cookie";mensaje.replace(" ","%20");
	}
	if(operacion.equals("Consultar") && request.getParameter("nombreCookie") == null){
	    mensaje = "?response=Necesito saber el nombre de la cookie para consultarla";mensaje.replace(" ","%20");
	}
	if((operacion.equals("Consultar") || operacion.equals("Eliminar") || operacion.equals("Modificar")) && galleta == null){
	    mensaje = "?response=La cookie seleccionada no existe";mensaje.replace(" ","%20");
	    problema=true;
	}
	if(operacion.equals("Modificar") && request.getParameter("nombreCookie") == null || request.getParameter("valorCookie") == null){
	    mensaje = "?response=Faltan campos necesarios para la modificación";mensaje.replace(" ","%20");
	}
	if(operacion.equals("Eliminar") && request.getParameter("nombreCookie") == null){
	    mensaje = "?response=Necesito saber el nombre de la cookie para eliminarla";mensaje.replace(" ","%20");
	}
    }
    if(problema == false){
	switch(request.getParameter("operacion")){
	    case "Crear":	
			    galleta = new Cookie(request.getParameter("nombreCookie"),request.getParameter("valorCookie"));
			    galleta.setMaxAge(-1);
			    response.addCookie(galleta);
			    mensaje="?response=La cookie ha sido creada exitosamente.";mensaje.replace(" ","%20");
		break;
	    case "Consultar":
			    mensaje="?cookieName="+galleta.getName()+"&cookieValue="+galleta.getValue();
		break;
	    case "Modificar":
			    galleta.setValue(request.getParameter("valorCookie"));
			    response.addCookie(galleta);
			    mensaje="?response=La cookie ha sido modificada exitosamente con valor " + request.getParameter("valorCookie") + ".";mensaje.replace(" ","%20");
		break;
	    case "Eliminar":
			    galleta.setMaxAge(0);
			    response.addCookie(galleta);
			    mensaje="?response=La cookie ha sido eliminada exitosamente.";mensaje.replace(" ","%20");
		break;
	}
    }
    
    response.sendRedirect(path+"/JSP/menuCookies.jsp"+mensaje);
%>