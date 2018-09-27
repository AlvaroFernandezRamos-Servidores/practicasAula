/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "verCabeceras", urlPatterns = {"/verCabeceras"})
public class verCabeceras extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //request.getHeader(name)
//        Enumeration headers = request.getHeaderNames();
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet verCabeceras</title>"); 
            out.println("<meta charset=\"UTF-8\">");
            out.println(" <link href=\"./styles/baseStyle.css\" rel=\"stylesheet\">\n" +
"           <link href=\"https://fonts.googleapis.com/css?family=Lato|Roboto\" rel=\"stylesheet\">");             
            out.println("</head>");
            out.println("<body>");
            out.println("<main>");
            out.println("<section>");
            out.println("<h1>MOSTRAR CABECERAS</h1>");
//            for (Iterator it = Collections.list(headers).iterator(); it.hasNext();) {
//                String key = (String) it.next();
//                out.println("<span>"+key+":</span>");
//                out.println("<span>"+request.getHeader(key)+"</span>");
//            }
            Map<String, String> mapa = new HashMap<String, String>();
            Enumeration cabeceras = request.getHeaderNames();
            while (cabeceras.hasMoreElements()) {
                String key = (String) cabeceras.nextElement();
                String value = request.getHeader(key);
                mapa.put(key, value);
                out.println("<span>"+key+":</span>");
                out.println("<span>"+value+"</span>");
                out.println("<br>");
            }

            out.println("</section>");
            out.println("</main>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
