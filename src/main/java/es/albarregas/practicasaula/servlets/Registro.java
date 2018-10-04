package es.albarregas.practicasaula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");
            out.println("<meta charset=\"UTF-8\">");
            //Estilos
            out.println(" <link href=\"./styles/baseStyle.css\" rel=\"stylesheet\">\n" +
    "           <link href=\"https://fonts.googleapis.com/css?family=Lato|Roboto\" rel=\"stylesheet\">");              
            out.println("</head>");
            out.println("<body>"); 
            out.println("<main>");
            out.println("<h1>Formulario registro</h1>");
            out.println("<section>");
            
            Map<String,String[]> mapa = request.getParameterMap();
            
            /*CONTEO DE ERRORES*/
            String[] campos = new String[6];
            campos[0]=mapa.get("nombre_ob")[0];
            campos[1]=mapa.get("Dia")[0];
            campos[2]=mapa.get("Mes")[0];
            campos[3]=mapa.get("Anio")[0];
            campos[4]=mapa.get("usuario_ob")[0];
            campos[5]=mapa.get("password_ob")[0];
            String[] errores = errorChecker(campos);
            String chunkAficiones = "";
            if(mapa.get("aficiones")!=null){
                for(String aficion : mapa.get("aficiones")){
                    if(aficion != null){
                        chunkAficiones += "_"+aficion;
                    }
                }
            }
            /*COMPROBAMOS SI EXISTEN ERRORES, SI NO HAY MOSTRAMOS EL RESULTADO DE LOS CAMPOS*/
            if(conteoErrores(errores)==0){
            out.println("<showthem>");
                out.println("<span>Nombre:</span><span>"+ mapa.get("nombre_ob")[0] +"</span><br>");
                out.println("<span>Apellidos:</span><span>"+ mapa.get("apellidos")[0] +"</span><br>");
                out.println("<span>Genero:</span><span>"+ mapa.get("genero")[0] +"</span><br>");
                out.println("<span>Fecha de Nacimiento:</span><span>"+ mapa.get("Dia")[0] +"/"+nombreDeMes(Integer.parseInt(mapa.get("Mes")[0]))+"/"+mapa.get("Anio")[0]+"</span><br>");
                out.println("<span>Usuario:</span><span>"+ mapa.get("usuario_ob")[0] +"</span><br>");
                out.println("<span>Contraseña:</span><span>"+ mapa.get("password_ob")[0] +"</span><br>");
                out.println("<span>Preferencias:</span><span>"+ chunkAficiones.replace('_', ',').substring(1) +"</span><br>");
            out.println("</showthem>");
            }else{//SI HAY ERRORES VOLVEMOS A MOSTRAR EL FORMULARIO
                /*INCLUSION DE MI JSCRIPT PARA RELLENAR LOS SELECT DE FECHA*/
                out.println("<script>" +
"                            document.addEventListener(\"DOMContentLoaded\", function() {" +
"                                let dias = document.getElementById('checkDias');" +
"                                let dias_content = '';" +
"                                for(let i=0;i<31;i++){" +
"                                    dias_content+='<option value=\"'+(i+1)+'\">'+(i+1)+'</option>';" +
"                                }" +
"                                dias.innerHTML=dias_content;" +
"                                let mesesStrings = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'];" +
"                                let meses = document.getElementById('checkMeses');" +
"                                let meses_content = '';" +
"                                for(let i=0;i<12;i++){" +
"                                    meses_content+='<option value=\"'+(i+1)+'\">'+(mesesStrings[i])+'</option>';" +
"                                }" +
"                                meses.innerHTML=meses_content;" +
"                                let anios = document.getElementById('checkAnios');" +
"                                let anios_content = '';" +
"                                for(let i=1970;i<2018;i++){" +
"                                    anios_content+='<option value=\"'+(i+1)+'\">'+(i+1)+'</option>';" +
"                                }" +
"                                anios.innerHTML=anios_content;" +
"                                   document.querySelector('select[name=\"Dia\"] option[value=\""+Integer.parseInt(mapa.get("Dia")[0])+"\"]').setAttribute('selected','selected');" +
"                                   document.querySelector('select[name=\"Mes\"] option[value=\""+Integer.parseInt(mapa.get("Mes")[0])+"\"]').setAttribute('selected','selected');" +
"                                   document.querySelector('select[name=\"Anio\"] option[value=\""+Integer.parseInt(mapa.get("Anio")[0])+"\"]').setAttribute('selected','selected');" +
"                            });" +
"                        </script>");
                /*   FIN DE SCRIPT   */
                /*Repintamos el formulario del html linea a linea y colamos las evaluaciones*/
                out.println("<form action=\""+request.getContextPath()+"/Registro\" method=\"post\">");
                    out.println("<fieldset>");
                    out.println("<span class=\"bloque\">Datos personales:</span>");
                    /* Comprobamos los campos uno a uno y pintamos un resultado u otro dependiendo de la evaluacion del if */
                    if(mapa.get("nombre_ob")[0].length()>0){//si hemos obtenido nombre, mapa.get("nombre_ob")[0].length() será mayor de 1
                        out.println("<label for=\"nombre\">Nombre *</label><input type=\"text\" id=\"nombre\" name=\"nombre_ob\" value=\""+mapa.get("nombre_ob")[0]+"\">");
                    }else{//si no, pintamos lo mismo pero añadimos algun flag para representar el error             vvv
                        out.println("<label for=\"nombre\">Nombre *</label><input type=\"text\" id=\"nombre\" name=\"nombre_ob\" error><div></div>");
                    }
                    if(mapa.get("apellidos")[0].length()>0){//Hacemos lo mismo con apellido
                        out.println("<label for=\"apellidos\">Apellidos</label><input type=\"text\" id=\"apellidos\" name=\"apellidos\" value=\""+mapa.get("apellidos")[0]+"\">");
                    }else{
                        out.println("<label for=\"apellidos\">Apellidos</label><input type=\"text\" id=\"apellidos\" name=\"apellidos\">");
                    }
                    out.println("<span class=\"bloque\">Género</span>");
                    out.println("<fieldset class=\"genero\">");
                        if(mapa.get("genero")[0].length()>0 && mapa.get("genero")[0].equals("Hombre")){//Con los radio tenemos que evaluar por cada uno de ellos
                            //Si llega  por verdadero, le ponemos checked
                            out.println("<input type=\"radio\" id=\"gen_hombre\" name=\"genero\" value=\"Hombre\" checked><label for=\"gen_hombre\" checked>Hombre</label>");
                        }else{
                            //Si llega por el else no lo marcamos
                            out.println("<input type=\"radio\" id=\"gen_hombre\" name=\"genero\" value=\"Hombre\" checked><label for=\"gen_hombre\">Hombre</label>");
                        }
                        out.println("<br>");
                            //Aqui igual
                        if(mapa.get("genero")[0].length()>0 && mapa.get("genero")[0].equals("Mujer")){
                            out.println("<input type=\"radio\"  id=\"gen_mujer\" name=\"genero\" value=\"Mujer\" checked><label for=\"gen_mujer\">Mujer</label>");
                        }else{
                            out.println("<input type=\"radio\"  id=\"gen_mujer\" name=\"genero\" value=\"Mujer\"><label for=\"gen_mujer\">Mujer</label>");
                        }
                    out.println("<br>");
                    out.println("</fieldset>");
                    out.println("<span class=\"bloque\">Fecha de nacimiento</span>");
                    if(errores[1].length()>0){
                        out.println("<label>Día:</label><select error id=\"checkDias\" name=\"Dia\"></select>");
                        out.println("<label>Mes:</label><select error id=\"checkMeses\" name=\"Mes\"></select>");
                        out.println("<label>Año:</label><select error id=\"checkAnios\" name=\"Anio\"></select>");
                        out.println("<input error type=\"hidden\"><div></div>");
                    }else{
                        out.println("<label>Día:</label><select id=\"checkDias\" name=\"Dia\"></select>");
                        out.println("<label>Mes:</label><select id=\"checkMeses\" name=\"Mes\"></select>");
                        out.println("<label>Año:</label><select id=\"checkAnios\" name=\"Anio\"></select>");
                    }
                    out.println("<br>");
                    out.println("<span class=\"bloque\">Informacion general:</span>");
                    if(mapa.get("usuario_ob")[0].length()>0){//si hemos obtenido nombre, mapa.get("nombre_ob")[0].length() será mayor de 1
                        out.println("<label obligatorio for=\"usuario_ob\">Usuario</label><input type=\"text\" id=\"usuario_ob\" name=\"usuario_ob\" value=\""+mapa.get("usuario_ob")[0]+"\">");
                    }else{//si no, pintamos lo mismo pero añadimos algun flag para representar el error             vvv
                        out.println("<label obligatorio for=\"usuario_ob\">Usuario</label><input type=\"text\" id=\"usuario_ob\" name=\"usuario_ob\" error><div></div>");
                    }
                    if(mapa.get("password_ob")[0].length()>0){//si hemos obtenido nombre, mapa.get("nombre_ob")[0].length() será mayor de 1
                        out.println("<label obligatorio for=\"password_ob\">Password</label><input type=\"password\" id=\"password_ob\" name=\"password_ob\" value=\""+mapa.get("password_ob")[0]+"\">");
                    }else{//si no, pintamos lo mismo pero añadimos algun flag para representar el error             vvv
                        out.println("<label obligatorio for=\"password_ob\">Password</label><input type=\"password\" id=\"password_ob\" name=\"password_ob\" error><div></div>");
                    }
                    out.println("<fieldset>");
                    out.println("<span class=\"bloque\">Preferencias:</span>");
                    
                    if(chunkAficiones.contains("Deporte")){
                        out.println("<label for=\"deporte\">Deporte</label><input type=\"checkbox\" name=\"aficiones\" value=\"Deporte\" id=\"deporte\" checked>");
                    }else{
                        out.println("<label for=\"deporte\">Deporte</label><input type=\"checkbox\" name=\"aficiones\" value=\"Deporte\" id=\"deporte\">");
                    }
                    if(chunkAficiones.contains("Musica")){
                        out.println("<label for=\"musica\">Musica</label><input type=\"checkbox\" name=\"aficiones\" value=\"Musica\" id=\"musica\" checked>");
                    }else{
                        out.println("<label for=\"musica\">Musica</label><input type=\"checkbox\" name=\"aficiones\" value=\"Musica\" id=\"musica\">");
                    }
                    if(chunkAficiones.contains("Coches")){
                        out.println("<label for=\"coches\">Coches</label><input type=\"checkbox\" name=\"aficiones\" value=\"Coches\" id=\"coches\" checked>");
                    }else{
                        out.println("<label for=\"coches\">Coches</label><input type=\"checkbox\" name=\"aficiones\" value=\"Coches\" id=\"coches\">");
                    }
                    if(chunkAficiones.contains("Cine")){
                        out.println("<label for=\"cine\">Cine</label><input type=\"checkbox\" name=\"aficiones\" value=\"Cine\" id=\"cine\" checked>");
                    }else{
                        out.println("<label for=\"cine\">Cine</label><input type=\"checkbox\" name=\"aficiones\" value=\"Cine\" id=\"cine\">");
                    }
                    out.println("</fieldset>");
                    out.println("</fieldset>");
                    out.println("<span class=\"bloque\"></span>");
                    out.println("<input type=\"submit\" name=\"Enviar\" value=\"Enviar\">");
                    out.println("<input type=\"reset\" name=\"Limpiar\" value=\"Limpiar\">");
                out.println("</form>");
            }
            
            out.println("<a href=\""+request.getContextPath()+"\">Volver</a>");
            out.println("</section>");
            out.println("</main>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public String[] errorChecker(String[] mapa){
        //METODO PARA CONTABILIZAR LOS ERRORES EN EL FORMULARIO
        String[] errores = new String[4];
        
        //Comprobamos el nombre
        errores[0] = "";
        if(mapa[0].length()==0){
            errores[0] = "No hay valor en campo Nombre";
        }

        //Comprobamos las fechas
        errores[1] = "";
        if(mapa[2].equals("2") && Integer.parseInt(mapa[1])==29 && Integer.parseInt(mapa[3])%4 != 0){
            errores[1] += "Error Bisiesto_";
        }
        if(mapa[2].equals("2") && Integer.parseInt(mapa[1])>29){
            errores[1] += "Error Febrero_";
        }
        if((mapa[2].equals("1") || mapa[2].equals("4") || mapa[2].equals("5") || mapa[2].equals("7") || mapa[2].equals("8") || mapa[2].equals("10") || mapa[2].equals("12")) && Integer.parseInt(mapa[1])>30){
            errores[1] += "Error 31 en mes de 30";
        }
        
        //Comprobamos el usuario
        errores[2] = "";
        if(mapa[4].length()==0){
            errores[2] = "No hay valor en campo Usuario";
        }
        
        //Comprobamos el password
        errores[3] = "";
        if(mapa[5].length()==0){
            errores[3] = "No hay valor en campo Password";
        }
        
        return errores;
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
    
    public int conteoErrores(String[] listaErrores){
        int nerrores=0;
        for(String item:listaErrores){
            if(item.length()>0){
                nerrores++;
            }
        }
        return nerrores;
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
