<%-- 
    Document   : Saludo
    Created on : Oct 1, 2018, 5:04:09 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String nombre=request.getParameter("nombre_ob"); %>
<% String apellidos=request.getParameter("apellidos"); %>
<% String genero=request.getParameter("genero"); %>
<%
    if(genero.equals("Hombre")){
        genero = "señor";
    }else{
        genero = "señora";
    }
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>Saludo</title>
    </head>
    <body> 
         <main>
            <h1>Formulario registro</h1>
            <section>
                <span>Hola <%= genero  %> <%= nombre  %> <%= apellidos  %></span>
            </section>
	    <a href="<%=path %>">Volver</a>
        </main>
    </body>
</html>
