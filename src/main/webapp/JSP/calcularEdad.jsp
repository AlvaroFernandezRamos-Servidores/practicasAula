<%-- 
    Document   : calcularEdad
    Created on : Oct 1, 2018, 5:25:58 PM
    Author     : atomsk
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombre = request.getParameter("nombre");
    String fecha = request.getParameter("fecha");
    String[] fechas = fecha.split("-");
    boolean error = false;
    
    LocalDate ahora = LocalDate.now();
    LocalDate nacimiento = LocalDate.of(Integer.parseInt(fechas[0]),Integer.parseInt(fechas[1]),Integer.parseInt(fechas[2]));
    Period lapso = Period.between(nacimiento, ahora);
    if(lapso.getYears() < 0 || lapso.getMonths() < 0 || lapso.getDays() < 0){
        error = true;
    }
    String path = request.getContextPath();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../styles/baseStyle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <main>
            <section>
                 <div class="show-message">
                    <span>Hola <%=nombre %></span>
                    <% String message = "";
                    if (error == true){
                        message = "Aún no has nacido, listillo";
                    }else{
                        message+=", tienes ";
                        if(lapso.getYears()>0){
                            if(lapso.getYears()==1){
                                message+= lapso.getYears() + " año, ";
                            }else{
                                message+= lapso.getYears() + " años, ";
                            }
                        }
                        if(lapso.getMonths()>0){
                            if(lapso.getMonths()==1){
                                message+= lapso.getMonths() + " mes, ";
                            }else{
                                message+= lapso.getMonths() + " meses, ";
                            }
                        }
                        if(lapso.getDays()>0){
                            if(lapso.getDays()==1){
                                message+= lapso.getDays() + " día";
                            }else{
                                message+= lapso.getDays() + " días";
                            }
                        }
                        if(message.startsWith(",")){
                            message = message.substring(1);
                        }
                        if(message.endsWith(", ")){
                            message = message.substring(0, message.length()-2);
                        }
                        message += ".";
                        if(message.lastIndexOf(",") != -1){
                            message = new StringBuilder(message).replace(message.lastIndexOf(","), message.lastIndexOf(",")+1," y ").toString();
                        }
                    }%>
                    <span><%=message %></span>
                </div>
                <a href="<%=path %>">Volver</a>
            </section>
        </main>
    </body>
</html>
