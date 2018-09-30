/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicasaula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "MostrarDatosMapa", urlPatterns = {"/MostrarDatosMapa"})
public class MostrarDatosMapa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
            
            out.println("<h1>Formulario complejo at " + request.getContextPath() + "</h1>");
            out.println("<section>");
                //request.getParameterMap() -> devuelve (String, String[])
                
            Map<String,String[]> mapa = request.getParameterMap();
            String[] fecha = new String[3];
            for(Map.Entry<String, String[]> elem : mapa.entrySet()){
                if(elem.getKey().startsWith("Env")){
                    break;
                }
                if(elem.getValue().length>1){
                    out.println(elem.getKey() + ":");
                    for(String subEl : elem.getValue()){
                        out.println(subEl);out.println("<br>");
                    }
                }else{
                    switch(elem.getKey()){
                        case "Dia": fecha[0] = elem.getValue()[0]; break;
                        case "Mes": fecha[1] = elem.getValue()[0]; break;
                        case "Anio": fecha[2] = elem.getValue()[0]; break;
                        default: out.println(elem.getKey() + ":");out.println(elem.getValue()[0]);out.println("<br>"); break;
                    }
                }
            }
            if(fecha[0].length()>0 && fecha[1].length()>0 && fecha[2].length()>0){
                out.println("Fecha de nacimiento oy a ver i puedo : " + fecha[0] + " de " + nombreDeMes(Integer.parseInt(fecha[1])) + " de " + fecha[2]);
            }
            
                out.println("<br>");
            out.println("<a href=\""+request.getContextPath()+"\">Volver</a>");
            out.println("</section>");
            out.println("</main>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public String nombreDeMes(int mesNumber){
        String mes = "";
        switch(mesNumber){
            case 1: mes = "Enero";break;
            case 2: mes = "Febrero";break;
            case 3: mes = "Marzo";break;
            case 4: mes = "Abril";break;
            case 5: mes = "Mayo";break;
            case 6: mes = "Junio";break;
            case 7: mes = "Julio";break;
            case 8: mes = "Agosto";break;
            case 9: mes = "Septiembre";break;
            case 10: mes = "Octubre";break;
            case 11: mes = "Noviembre";break;
            case 12: mes = "Diciembre";break;
        }
        return mes;
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
