/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bader
 */
public class Chercher extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Chercher</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Chercher at " + request.getContextPath() + "</h1>");
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
        
       /* String libelle = request.getParameter("libelle");
        String date_debut = request.getParameter("date_debut");
        String date_fin = request.getParameter("date_fin");

        String req = "SELECT * FROM Cours WHERE 1=1 ";
        if (!libelle.isEmpty()) {
            req += "AND lower(Libelle) = '" + libelle.toLowerCase() + "' ";
        }
        if (!date_debut.isEmpty()) {
            req += "AND DateDebut = TO_DATE('" + date_debut + "', 'yyyy-mm-dd')"; //input type="data" returns date with format yyyy-mm-dd => 2021-06-15
        }
        if (!date_fin.isEmpty()) {
            req += "AND DateFin = TO_DATE('" + date_fin + "', 'yyyy-mm-dd')";
        }
        System.out.println(req);

        ResultSet R = Connexion.Seconnecter().createStatement().executeQuery(req);
        request.setAttribute("resultat", R);
        request.getRequestDispatcher("chercher_cours.jsp").forward(request, response);*/

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
