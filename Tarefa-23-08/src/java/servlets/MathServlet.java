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
@WebServlet(name = "MathServlet", urlPatterns = {"/operacoesMatematicas.html"})
public class MathServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MathServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            try {                
                String numA = request.getParameter("n1");
                String numB = request.getParameter("n2");
                String opcao = request.getParameter("op");
                
                double dnumA = Double.parseDouble(numA);
                double dnumB = Double.parseDouble(numB);
                double resultado = 0;
                
                if(opcao.equals("+")){
                    resultado = dnumA+dnumB;
                }else if(opcao.equals("-")){
                    resultado = dnumA-dnumB;
                }else if(opcao.equals("x")){
                    resultado = dnumA*dnumB;
                }else if(opcao.equals("/")){
                    resultado = dnumA/dnumB;
                }
                
                out.print("<h4><b>Resultado</b>: "+resultado+"</h4>");
                
            } catch (Exception ex) {
                out.println("<p style='color:red'>"+ex.getMessage()+"</p>");
            }
            out.println("<h3><a href='index.html'>Voltar</a></h3>");
            out.println("</body>");
            out.println("</html>");   
          
        }
    }
}
