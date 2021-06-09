/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import Backend.Models.Donneur;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
public class MiseAJour extends HttpServlet {

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
            out.println("<title>Servlet MiseAJour</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MiseAJour at " + request.getContextPath() + "</h1>");
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

    
    
    private void Reply(HttpServletRequest request, HttpServletResponse response, String path, String message, String message_type)
    {
        try 
        {
            System.out.println("Replying " + path + " with message: " + message);
            request.setAttribute("type", message_type);
            request.setAttribute("message", message);
            request.getRequestDispatcher(path).forward(request, response);
        } 
        catch (ServletException | IOException ex) 
        {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private boolean isOldPasswordValid(final String id_donneur, final String old_password)
    {
        try 
        {
            ResultSet R =  Connexion.Seconnecter().createStatement().executeQuery("SELECT id_donneur FROM Donneur WHERE password = '" + old_password + "' AND id_donneur = "+ id_donneur);
            return R.next();
        } catch (SQLException ex) {
            Logger.getLogger(MiseAJour.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException 
    {
        String operation = request.getParameter("operation");
        switch(operation)
        {
            //#####################################################################################################//
            case "Modifier":
            try {
               
                String id_donneur = request.getSession().getAttribute("id_donneur").toString();
                String prenom = request.getParameter("prenom");
                String nom = request.getParameter("nom");
                String id_ville = request.getParameter("id_ville");
                String id_groupe_sanguin = request.getParameter("id_groupe_sanguin");
                String date_naissance = request.getParameter("date_naissance");
                String telephone = request.getParameter("telephone");
                String email = request.getParameter("email");
                String old_password = request.getParameter("old_password");
                String new_password = request.getParameter("new_password");
                String disponible = request.getParameter("disponible"); disponible = disponible == null ? "non" : "oui";
                        
                
                System.out.println("id_donneur: " + id_donneur);
                System.out.println("prenom: " + prenom);
                System.out.println("nom: " + nom);
                System.out.println("id_ville: " + id_ville);
                System.out.println("id_groupe_sanguin: " + id_groupe_sanguin);
                System.out.println("date_naissance: " + date_naissance);
                System.out.println("telephone: " + telephone);
                System.out.println("email: " + email);
                System.out.println("old_password: " + old_password);
                System.out.println("new_password: " + new_password);
                System.out.println("disponible: " + disponible);
                
                
                // Validate fields
                if(prenom.isEmpty() || nom.isEmpty() || id_ville.isEmpty() ||
                   id_groupe_sanguin.isEmpty() || date_naissance.isEmpty() || telephone.isEmpty() ||
                   email.isEmpty() || disponible.isEmpty())
                {
                    Reply(request, response, "/Profile/Profile.jsp", "Tous les champs sont obligatoires pour modifier votre profil", "warn");
                    return;
                }
                
                // Update Donneur's profile  
                String req = "UPDATE Donneur SET "
                        + "prenom = '" + prenom + "', "
                        + "nom = '" + nom + "', "
                        + "id_ville = " + id_ville + ", "
                        + "id_groupe_sanguin = " + id_groupe_sanguin + ", "
                        + "date_naissance = TO_DATE('" + date_naissance.replace("-", "/") + "', 'yyyy/mm/dd'), "
                        + "telephone = '" + telephone + "', "
                        + "email = '" + email + "', "
                        + "disponible = '" + disponible + "' ";
                if(!old_password.isEmpty() && !new_password.isEmpty())
                {
                  if(isOldPasswordValid(id_donneur, old_password))
                  {
                      req += ", password = '"+new_password+"' ";
                  }
                  else
                  {
                    Reply(request, response, "/Profile/Profile.jsp", "Le mot de passe précédent n'est pas correct", "error");
                    return;
                  }
                }
                req += " WHERE id_donneur = "+id_donneur;
                
                System.out.println(req);     
                
                
                int r = Connexion.Seconnecter().createStatement().executeUpdate(req);
                if(r != 0)
                {
                    Reply(request, response, "/Profile/Profile.jsp", "Les détails du profil ont été modifiés avec succès", "info");
                }
                else
                {
                    Reply(request, response, "/Profile/Profile.jsp", "Échec de la modification des détails du profil", "error");
                }
            } 
            catch (final Exception ex) 
            {
                Logger.getLogger(MiseAJour.class.getName()).log(Level.SEVERE, null, ex);
                Reply(request, response, "/Profile/Profile.jsp", "Erreur Interne du Serveur: " + ex.getMessage(), "error");
            }
            break;
            //#####################################################################################################//
            
            
            
            

            //#####################################################################################################//
            case "Supprimer mon compte":
            try
            {
                String id = request.getSession().getAttribute("id_donneur").toString();
                String req = "DELETE FROM Donneur WHERE id_donneur = "+id+"";
                System.out.println(req);
                int r = Connexion.Seconnecter().createStatement().executeUpdate(req);
                if(r != 0)
                {
                    // Logout donor
                    request.getSession().invalidate();
                    Reply(request, response, "/Register/Register.jsp", "Nous sommes désolés de vous voir partir... Nous avons supprimé toutes vos données des bases de données. N'hésitez pas à revenir à tout moment, il y a encore beaucoup de personnes qui ont besoin de dons de sang.", "warn");
                }
                else
                {
                    Reply(request, response, "/Profile/Profile.jsp", "Échec de la suppression de votre compte de la base de données", "error");
                }                
            }
            catch (final Exception ex) 
            {
                Logger.getLogger(MiseAJour.class.getName()).log(Level.SEVERE, null, ex);
                Reply(request, response, "/Profile/Profile.jsp", "Erreur Interne du Serveur: " + ex.getMessage(), "error");
            }
            break;
            //#####################################################################################################//

        }

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
