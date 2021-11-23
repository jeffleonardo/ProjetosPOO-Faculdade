/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Windows 10
 */
@WebServlet(name = "jurosComposto", urlPatterns = {"/juros-composto.html"})
public class jurosComposto extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet jurosComposto</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try {                
                String val = request.getParameter("valor");
                String percent = request.getParameter("juros");
                String months = request.getParameter("meses");
                
                double dval = Double.parseDouble(val);
                double dpercent = Double.parseDouble(percent);
                int dmonths = Integer.parseInt(months);
                double resultado = dval*Math.pow(1+(dpercent/100), dmonths);
                
                out.print("<h4>Juros composto</h4>");
                out.print("<h4><b>Resultado</b>: "+String.format("%.2f", resultado)+"</h4>");
                
                
                
            } catch (Exception ex) {
                out.println("<p style='color:red'>"+ex.getMessage()+"</p>");
            }
            out.println("<h3><a href='index.html'>Voltar</a></h3>");
            out.println("</body>");
            out.println("</html>");
            out.println("</body>");
            out.println("</html>");
        }
    }   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
