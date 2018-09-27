/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author atomsk
 */
@WebServlet(name = "controlServlet", urlPatterns = {"/controlServlet"})
public class controlServlet extends HttpServlet {
    public controlServlet(){
        super();
        System.out.println("Creando servlet");
    }
    
    public void init(ServletConfig config){
        System.out.println("Ejecutando método INIT en " + config.getServletName());
    }
    
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Ejecutando método SERVICE");
    }
    
    public void destroy(){
        System.out.println("Ejecutando método DESTROY");
    }

}
