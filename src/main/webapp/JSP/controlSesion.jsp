<%-- 
    Document   : controlSesion
    Created on : Oct 9, 2018, 11:48:49 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    HttpSession sesion = request.getSession();
    boolean problema = false;
    String operacion = request.getParameter("operacion");
    String mensaje = "";
    String nombre = "";
    String valor = "";
    
    nombre = request.getParameter("paramName");
    valor = request.getParameter("paramVal");
    
    //session.setAttribute("UserName", username);
    //String attr = (String)request.getAttribute("attr");
    //session.invalidate();
    
    String value = (String) sesion.getAttribute(nombre);
    
    
    if(operacion != null){
	if(operacion.equals("Crear") && ((nombre == null || nombre.length()<1) || (valor == null || valor.length()<1))){
	    mensaje = "?response=Faltan campos necesarios para la creacion del parametro";mensaje.replace(" ","%20");
	    problema=true;
	}
	if(operacion.equals("Crear") && value.length()>0){
	    mensaje = "?response=Ya existe una entrada con la clave "+nombre;mensaje.replace(" ","%20");
	    problema=true;
	}
	if(operacion.equals("Consultar") && (nombre == null || nombre.length()<1)){
	    mensaje = "?response=Necesito saber el nombre del parametro para consultarlo";mensaje.replace(" ","%20");
	    problema=true;
	}
	if((operacion.equals("Consultar") || operacion.equals("Eliminar") || operacion.equals("Modificar"))){
	    if(value == null || value.length()==0){
		mensaje = "?response=El parametro seleccionado no existe";mensaje.replace(" ","%20");
		problema=true;
	    }
	}
	if(operacion.equals("Modificar") && ((nombre == null || nombre.length()<1) || (valor == null || valor.length()<1))){
	    mensaje = "?response=Faltan campos necesarios para la modificacion";mensaje.replace(" ","%20");
	    problema=true;
	}
	if(operacion.equals("Eliminar") && (nombre == null || nombre.length()<1)){
	    mensaje = "?response=Necesito saber el nombre del parametro para eliminarlo";mensaje.replace(" ","%20");
	    problema=true;
	}
    }
    if(problema == false){
	switch(request.getParameter("operacion")){
	    case "Crear":	
			    sesion.setAttribute(nombre, valor);
			    mensaje="?response=El parametro ha sido creado exitosamente.";mensaje.replace(" ","%20");
		break;
	    case "Consultar":
			    mensaje="?paramName="+nombre+"&paramVal="+value+"&valLength="+value.length();
		break;
	    case "Modificar":
			    session.setAttribute(nombre, valor);
			    mensaje="?response=El parametro ha sido modificado exitosamente con valor " + valor + ".";mensaje.replace(" ","%20");
		break;
	    case "Eliminar":
			    sesion.removeAttribute(nombre);
			    mensaje="?response=El atributo ha sido eliminado exitosamente.";mensaje.replace(" ","%20");
	    break;
	}
    }
    
    response.sendRedirect(path+"/JSP/menuSesion.jsp"+mensaje);
%>
