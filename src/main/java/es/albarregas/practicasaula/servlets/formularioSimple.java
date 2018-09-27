/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author atomsk
 */
@WebServlet(name = "formularioSimple", urlPatterns = {"/formularioSimple"})
public class formularioSimple extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String requestType)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet formularioSimple</title>");
            out.println("<meta charset=\"UTF-8\">");
            out.println(" <link href=\"./styles/baseStyle.css\" rel=\"stylesheet\">\n" +
"           <link href=\"https://fonts.googleapis.com/css?family=Lato|Roboto\" rel=\"stylesheet\">");        
            out.println("</head>");
            out.println("<body>");
            out.println("<main>");
            if(requestType.equals("get")){
                out.println("<h1>Formulario simple at " + request.getContextPath() + "</h1>");
                out.println("<section>");
                //request.getParameterMap() -> devuelve (String, String[])
                
                Map<String,String[]> mapa = request.getParameterMap();
                for(Map.Entry<String, String[]> elem : mapa.entrySet()){
                    if(elem.getKey().startsWith("Env")){
                        break;
                    }
                    out.println(elem.getKey() + ":");
                    if(elem.getValue().length>1){
                        for(String subEl : elem.getValue()){
                            out.println(subEl);
                        }
                    }else{
                        out.println(elem.getValue()[0]);
                    }
                    out.println("<br>");
                }
            }else if(requestType.equals("post")){
            out.println("<h1>Formulario complejo at " + request.getContextPath() + "</h1>");
            out.println("<section>");
                //request.getParameterMap() -> devuelve (String, String[])
                
                Map<String,String[]> mapa = request.getParameterMap();
                for(Map.Entry<String, String[]> elem : mapa.entrySet()){
                    if(elem.getKey().startsWith("Env")){
                        break;
                    }
                    out.println(elem.getKey() + ":");
                    if(elem.getValue().length>1){
                        for(String subEl : elem.getValue()){
                            out.println(subEl);
                        }
                    }else{
                        out.println(elem.getValue()[0]);
                    }
                    out.println("<br>");
                }
                
            }
            
            out.println("<a href=\""+request.getContextPath()+"\">Volver</a>");
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
        processRequest(request, response, "get");
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
        processRequest(request, response, "post");
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
/*
Enumeration<String> params = request.getParameterNames();
while (params.hasMoreElements()){
    String nombre = params.nextElement();
    if(!nombre.startsWith("Env")){
        out.println(nombre + " - " + request.getParameter(nombre));
    }
}
Object obj = request.getAttribute("nombre");
if(request.getParameter("nombre") != null && request.getParameter("email")!=null){
    //esto está mal
    out.println("El nombre es " + request.getParameter("nombre") + " y el mail es "+ request.getParameter("email"));
    if(request.getParameter("se ha marcado") != null){
        out.println("alalal" + request.getParameter("marcar"));
    }
}else{
    out.println("Pon valores, desgraciado.");
    out.println("<a href=\"formulario.html\">Volver</a>");
}
*/
