/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    private int getResultSetSize(final ResultSet R)
    {
        int size = 0;
        try {
            R.last();
            size = R.getRow();
            R.beforeFirst();
        }
        catch(final SQLException ex) {
            ex.printStackTrace();
            return 0;
        }
        return size;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //processRequest(request, response);
            
            String id_region = request.getParameter("id_region");
            String id_ville = request.getParameter("id_ville");
            String id_groupe_sanguin = request.getParameter("id_groupe_sanguin");
            
            System.out.println("id_region" +id_region);
            System.out.println("id_ville" +id_ville);
            System.out.println("id_groupe_sanguin" +id_groupe_sanguin);
            
            String req = "SELECT prenom, nom, (SELECT region FROM Region WHERE id_region = d.id_region) as region, (SELECT ville FROM Ville WHERE id_ville = d.id_ville) as ville, (SELECT groupe_sanguin FROM GroupeSanguin WHERE id_groupe_sanguin = d.id_groupe_sanguin) as groupe_sanguin FROM Donneur d WHERE disponible = 'oui'";
            //String req = "SELECT prenom, nom, region, ville, groupe_sanguin FROM Donneur d JOIN Region r on d.id_region = d.id_region JOIN Ville v ON v.id_ville = d.id_ville JOIN GroupeSanguin g on g.id_groupe_sanguin = d.id_groupe_sanguin  WHERE disponible = 'oui' ";
            if(!id_ville.isEmpty())
                req += " AND id_ville = " + id_ville;
            else if(!id_region.isEmpty() && id_ville.isEmpty()) // search either by ville or region, not both at the same time
                req += " AND id_region = " + id_region;
            else if(!id_groupe_sanguin.isEmpty())
                req += " AND id_groupe_sanguin = " + id_groupe_sanguin;
            else // all empty 
            {
                request.setAttribute("type", "warn");
                request.setAttribute("message", "Au moins un critère de recherche doit être sélectionné");
                request.getRequestDispatcher("/Chercher/Chercher.jsp").forward(request, response);
                return;
            }
            req += " ORDER BY nom ASC";
                
            System.out.println(req);
            
            ResultSet R = Connexion.Seconnecter().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(req);
             
            request.setAttribute("result", R);
            request.setAttribute("type", "info");
            request.setAttribute("message", "Trouvé " +getResultSetSize(R)+" donateurs");

            request.getRequestDispatcher("/Chercher/Chercher.jsp").forward(request, response);
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(Chercher.class.getName()).log(Level.SEVERE, null, ex);
        }
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
