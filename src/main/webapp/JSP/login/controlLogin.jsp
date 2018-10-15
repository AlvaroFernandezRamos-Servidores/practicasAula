<%-- 
    Document   : controlLogin
    Created on : Oct 11, 2018, 4:10:16 PM
    Author     : atomsk
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = "Juanito";
    String passwd = "1234";
    String mensaje = "?respuesta=";
    String path = request.getContextPath();
    boolean todocorrecto = false;
    
    if((request.getParameter("user")!=null && request.getParameter("user").length()>0) && (request.getParameter("passwd")!=null && request.getParameter("passwd").length()>0)){
	if(request.getParameter("user").equals(usuario)){
	    todocorrecto = true;
	}else{
	    todocorrecto = false;
	    mensaje += "El usuario no es correcto ";
	}
	if(todocorrecto == true && request.getParameter("passwd").equals(passwd)){
	    todocorrecto = true;
	}else{
	    todocorrecto = false;
	    mensaje += "La password no es correcta";
	}
    }else if(request.getParameter("user")==null || request.getParameter("user").length()<1){
	    mensaje += "No se ha introducido un nombre de usuario";
    }else if(request.getParameter("passwd")==null || request.getParameter("passwd").length()<1){
	    mensaje += "No se ha introducido una password";
    }
    

    if(todocorrecto){
	if(request.getParameter("recuerdame")!=null && request.getParameter("recuerdame").length()>0){
	    Cookie recuerdame = new Cookie("recuerdame",request.getParameter("user"));
	    recuerdame.setMaxAge(60 * 60 * 24);//Caducidad de recuerdame establecida a 1 día humano
	    response.addCookie(recuerdame);
	}
	HttpSession sesion = request.getSession();
	ArrayList data = new ArrayList<String>();
	data.add(request.getParameter("user"));
        // TAL Y COMO SE HA ENFOCADO EL EJERCICIO ALMACENAR UN ARRAYLIST EN LA SESIÓN NO TIENE SENTIDO
	sesion.setAttribute("userData", data);
	response.sendRedirect(path+"/JSP/login/menu.jsp");
    }else{
	mensaje.replace(" ", "%20");
	response.sendRedirect(path+"/JSP/login/login.jsp"+mensaje);
    }
%>