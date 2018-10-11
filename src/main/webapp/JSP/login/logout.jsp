<%-- 
    Document   : logout
    Created on : Oct 11, 2018, 4:10:57 PM
    Author     : atomsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    String path = request.getContextPath();
    
    response.sendRedirect(path+"/JSP/login/login.jsp");
%>
