<%-- 
    Document   : calculadoraBasica
    Created on : Oct 9, 2018, 10:46:50 AM
    Author     : atomsk
--%>

<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    int val1 = 0;
    int val2 = 0;
    int resultado=0;
    boolean invalid = false;
    
    Calendar fecha = Calendar.getInstance();
    String fechaActual = fecha.get(Calendar.DAY_OF_MONTH) + " de " + StringUtils.capitalize(fecha.getDisplayName(Calendar.MONTH, Calendar.LONG, new Locale("es","ES"))) + " de " + fecha.get(Calendar.YEAR);
    
    String message = "Introduce valores e indica una operación.";
    String opsign = "";
    try {
	Integer.parseInt(request.getParameter("val1"));
	Integer.parseInt(request.getParameter("val2"));
    }
    catch(NumberFormatException nFE) {
	invalid=true;
	message="Por favor, introduce valores numéricos en los campos.";
    }
    if(request.getParameter("val1") != null && request.getParameter("val1").length()>0 && invalid==false){
	val1 = Integer.parseInt(request.getParameter("val1"));
    }
    if(request.getParameter("val2") != null && request.getParameter("val2").length()>0 && invalid==false){
	val2 = Integer.parseInt(request.getParameter("val2"));
    }
    
    if(request.getParameter("op") != null && request.getParameter("op").equals("")){
	message = "Error, no se seleccionó operación";
    }
    if(request.getParameter("op") != null && request.getParameter("op").equals("division") && val2 == 0){
	message = "Buen intento, no puedes dividir por 0";
	invalid = true;
    }    
    
    if(request.getParameter("op") != null && invalid == false){
	switch(request.getParameter("op")){
	    case "suma": resultado = val1 + val2;opsign = "+";break;
	    case "resta": resultado = val1 - val2;opsign = "-";break;
	    case "producto": resultado = val1 * val2;opsign = "x";break;
	    case "division": resultado = val1 / val2;opsign = "/";break;
	}
	if(!opsign.equals("")){
	    message = "El resultado de la operación " +  val1 +" "+ opsign +" "+ val2 + " = " + resultado;
	}
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
            <h1>Calculadora</h1>
            <section>
                <div class="show-message">
		    <span class="fecha"> <%=fechaActual %> </span>
		    <span><%=message %></span>
                </div>
            </section>
	    <section class="calculadora">
		<form method="get" action="<%=path %>/JSP/calculadoraBasica.jsp">
		    <input type="number" name="val1" value="<%=val1%>">
		    <input type="number" name="val2" value="<%=val2%>">
		    <br>
		    <fieldset>
			<label>Suma</label><input type="radio" name="op" value="suma" checked>
			<label>Resta</label><input type="radio" name="op" value="resta">
			<label>Producto</label><input type="radio" name="op" value="producto">
			<label>División</label><input type="radio" name="op" value="division">
			<input type="submit" value="Aplicar">
		    </fieldset>
		</form>
		    <a href="<%=path%>">Volver</a>
	    </section>
        </main>
    </body>
</html>
