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

    
    private void Reply(HttpServletRequest request, HttpServletResponse response, String path, String message)
    {
        try 
        {
            System.out.println("Replying " + path + " with message: " + message);
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
            String req = "SELECT id FROM Donneur WHERE email = '"+ email + "'";
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
                    String ville = request.getParameter("ville");
                    String adresse = request.getParameter("adresse");
                    String groupe_sanguin = request.getParameter("groupe_sanguin");
                    String date_naissance = request.getParameter("date_naissance");
                    String telephone = request.getParameter("telephone");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    // Validate fields
                    if(prenom.isEmpty() || nom.isEmpty() || ville.isEmpty() || adresse.isEmpty() ||
                       groupe_sanguin.isEmpty() || date_naissance.isEmpty() || telephone.isEmpty() ||
                       email.isEmpty() || password.isEmpty())
                    {
                        Reply(request, response, "/Register/Register.jsp", "Tous les champs doivent être remplis");
                        return;
                    }


                    // Check if user already has an account with same email
                    if(isDonorAlreadyExists(email))
                    {
                        Reply(request, response, "/Register/Register.jsp", "L'utilisateur avec le même e-mail déjà existe");
                        return;
                    }
                    
                    
                    // Register user into the database
                    String req = "INSERT INTO Donneur VALUES("
                            + "ID_COUNTER.nextval, "
                            + "'" + prenom + "', "
                            + "'" + nom + "', "
                            + "'" + ville + "', "
                            + "'" + adresse + "', "
                            + "'" + groupe_sanguin + "', "
                            + "TO_DATE('" + date_naissance.replace("-", "/") + "', 'yyyy/mm/dd'), "
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
                        Reply(request, response, "/Register/Register.jsp", "Échec de l'insertion du donneur dans la base de données");
                   }
                   
                }
                catch(final Exception e)
                {
                      Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, e);
                      Reply(request, response, "/Register/Register.jsp", "Erreur Interne du Serveur: " + e.getMessage());
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
                        Reply(request, response, "Login/Login.jsp", "Tous les champs doivent être remplis");
                        return;
                    }
                        
                    
                    // Check if donor already has an account in the database
                    if(!isDonorAlreadyExists(email))
                    {
                        Reply(request, response, "/Login/Login.jsp", "Il n'y a pas d'utilisateur enregistré avec le même email");
                        return;
                    }
                    
                    
                    ResultSet R = Connexion.Seconnecter().createStatement().executeQuery("SELECT id, prenom, nom FROM Donneur WHERE email = '" + email + "' AND password = '" + password + "'");
                    if(R.next())
                    {
                        //Login Successfull!, set session data
                        HttpSession session = request.getSession();
                        session.setAttribute("id", R.getObject(1));
                        session.setAttribute("prenom", R.getObject(2));
                        session.setAttribute("nom", R.getObject(3));
                        
                        // Send user to Profile page
                        response.sendRedirect("Profile/Profile.jsp");
                    }
                    else
                    {
                        // Login failure.
                        Reply(request, response, "/Login/Login.jsp", "Erreur de connexion, e-mail ou mot de passe incorrect");
                        return;
                    }
                    
                    
                   
                }
                catch(final Exception e)
                {
                      Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, e);
                      Reply(request, response, "/Register/Register.jsp", "Erreur Interne du Serveur: " + e.getMessage());
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
