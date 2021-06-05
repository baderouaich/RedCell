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
import javax.servlet.http.HttpSession;

/**
 *
 * @author bader
 */
public class Authentication extends HttpServlet {

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
            out.println("<title>Servlet Authentication</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Authentication at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

 
    
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
    
    
    private boolean isDonorAlreadyExists(final String email)
    {
        try 
        {
            String req = "SELECT id_donneur FROM Donneur WHERE email = '"+ email + "'";
            return Connexion.Seconnecter().createStatement().executeQuery(req).next();
        } 
        catch (SQLException ex)
        {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
            return true;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
            String operation = request.getParameter("operation");
            switch(operation)
            {
                //#####################################################################################################//
                case "S'inscrire": // Register
                try 
                {
                    String prenom = request.getParameter("prenom");
                    String nom = request.getParameter("nom");
                    String id_ville = request.getParameter("id_ville");
                    String id_groupe_sanguin = request.getParameter("id_groupe_sanguin");
                    String date_naissance = request.getParameter("date_naissance");
                    String telephone = request.getParameter("telephone");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    // Validate fields
                    if(prenom.isEmpty() || nom.isEmpty() || id_ville.isEmpty() ||
                       id_groupe_sanguin.isEmpty() || date_naissance.isEmpty() || telephone.isEmpty() ||
                       email.isEmpty() || password.isEmpty())
                    {
                        Reply(request, response, "/Register/Register.jsp", "Tous les champs doivent être remplis", "warn");
                        return;
                    }
                    
                    // Check if user already has an account with same email
                    if(isDonorAlreadyExists(email))
                    {
                        Reply(request, response, "/Register/Register.jsp", "Utilisateur avec le même e-mail déjà existe", "warn");
                        return;
                    }
                    
/*
CREATE TABLE Donneur
(
    id_donneur NUMBER PRIMARY KEY,
    prenom VARCHAR2(20) NOT NULL,
    nom VARCHAR2(20) NOT NULL,
    id_region NUMBER NOT NULL, -- ID Region
    id_ville NUMBER NOT NULL, -- ID Ville
    id_groupe_sanguin  NUMBER NOT NULL, -- ID Groupe Sanguin
    date_naissance DATE NOT NULL,
    telephone VARCHAR2(15) NOT NULL UNIQUE,
    email VARCHAR2(128) NOT NULL UNIQUE,
    password VARCHAR2(256) NOT NULL,
    disponible VARCHAR2(3) DEFAULT 'oui',
    
    -- FOREIGN KEYS --
    CONSTRAINT DFK_id_region FOREIGN KEY(id_region) REFERENCES Region(id_region) ON DELETE CASCADE,
    CONSTRAINT DFK_id_ville FOREIGN KEY(id_ville) REFERENCES Ville(id_ville) ON DELETE CASCADE,
    CONSTRAINT DFK_id_groupe_sanguin FOREIGN KEY(id_groupe_sanguin) REFERENCES GroupeSanguin(id_groupe_sanguin) ON DELETE CASCADE,
    
    -- CHECKS --
    CONSTRAINT DCHECK_email check(REGEXP_LIKE(email, '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')),
    CONSTRAINT DCHECK_telephone check(REGEXP_LIKE(telephone, '^(\+[0-9]{1,3}|0)([ \-_/]*)(\d[ \-_/]*){9}$')),
    CONSTRAINT DCHECK_disponible check(lower(disponible) in ('oui', 'non'))
);
*/
                    // Register user into the database
                    String req = "INSERT INTO Donneur VALUES("
                            + "ID_COUNTER.nextval, "
                            + "'" + prenom + "', "
                            + "'" + nom + "', "
                            + "(" + "SELECT id_region FROM Ville WHERE id_ville = "+ id_ville + "), "
                            + "" + id_ville + ", "
                            + "" + id_groupe_sanguin + ", "
                            + "TO_DATE('" + date_naissance + "', 'yyyy-mm-dd'), "
                            + "'" + telephone + "', "
                            + "'" + email + "', " 
                            + "'" + password + "', " 
                            + "'" + "oui" + "')";
                   System.out.println(req);
                  
                   int r = Connexion.Seconnecter().createStatement().executeUpdate(req);
                   if(r != 0)
                   {
                        // Donor successfully registered, Send him/her to login page. 
                        response.sendRedirect("Login/Login.jsp");
                   }
                   else // Failed to insert doneur to database
                   {
                        Reply(request, response, "/Register/Register.jsp", "Échec de l'insertion du donneur dans la base de données", "error");
                   }
                   
                }
                catch(final Exception e)
                {
                      Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, e);
                      Reply(request, response, "/Register/Register.jsp", "Erreur Interne du Serveur: " + e.getMessage(), "error");
                }
                break;
                //#####################################################################################################//

                
                
                
                
                
                
                
                
                //#####################################################################################################//
                case "Connexion":
                try 
                {
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    // Validate fields
                    if(email.isEmpty() || password.isEmpty())
                    {
                        Reply(request, response, "Login/Login.jsp", "Tous les champs doivent être remplis", "warn");
                        return;
                    }
                        
                    
                    // Check if donor already has an account in the database
                    if(!isDonorAlreadyExists(email))
                    {
                        Reply(request, response, "/Login/Login.jsp", "Il n'y a pas d'utilisateur enregistré avec le même email", "warn");
                        return;
                    }
                    
                    
                    ResultSet R = Connexion.Seconnecter().createStatement().executeQuery("SELECT id_donneur, prenom, nom FROM Donneur WHERE email = '" + email + "' AND password = '" + password + "'");
                    if(R.next())
                    {
                        //Login Successfull!, set session data
                        HttpSession session = request.getSession();
                        session.setAttribute("id_donneur", R.getObject(1));
                        session.setAttribute("prenom", R.getObject(2));
                        session.setAttribute("nom", R.getObject(3));
                        
                        // Send user to Profile page
                        response.sendRedirect("Profile/Profile.jsp");
                    }
                    else
                    {
                        // Login failure.
                        Reply(request, response, "/Login/Login.jsp", "Erreur de connexion, e-mail ou mot de passe incorrect", "error");
                    }                    
                   
                   
                }
                catch(final Exception e)
                {
                      Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, e);
                      Reply(request, response, "/Login/Login.jsp", "Erreur Interne du Serveur: " + e.getMessage(), "error");
                }
                break;
                //#####################################################################################################//

                
                
                
                
                
                
                
                
                //#####################################################################################################//
                case "Se Deconnecter":
                {
                    HttpSession session = request.getSession();
                    // delete session from server
                    session.invalidate();
                    //Redirect donor to login page
                    response.sendRedirect("Login/Login.jsp");
                    break;
                } 
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
