<%-- 
    Document   : calculadoraBasica
    Created on : Oct 9, 2018, 10:46:50 AM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    int val1 = 0;
    int val2 = 0;
    int resultado=0;
    boolean invalid = false;
    
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
	    case "division": resultado = val1 / val2;opsign = "%";break;
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
		    <span><%=message %></span>
                </div>
            </section>
	    <section class="calculadora">
		<form method="get" action="<%=path %>/JSP/calculadoraBasica.jsp">
		    <input type="number" name="val1" value="<%=val1%>">
		    <input type="number" name="val2" value="<%=val2%>">
		    <br>
		    <input type="submit" name="op" value="suma">
		    <input type="submit" name="op" value="resta">
		    <input type="submit" name="op" value="producto">
		    <input type="submit" name="op" value="division">
		</form>
	    </section>
        </main>
    </body>
</html>
