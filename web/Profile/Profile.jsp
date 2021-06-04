<%-- 
    Document   : Profile
    Created on : Jun 2, 2021, 5:11:57 PM
    Author     : bader
--%>
<%
    /* Login Guard: to be placed above any protected page which requires login such as Profile.jsp*/

    // If Donor is not logged in, send him/her to Acceuil Page
    if (session.getAttribute("id") == null
            || session.getAttribute("prenom") == null
            || session.getAttribute("nom") == null) 
    {
        request.setAttribute("message", "Vous devez d'abord vous connecter pour accéder à votre profil");
        request.getRequestDispatcher("/Login/Login.jsp").forward(request, response);
        return;

       // response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

%>


<%@page import="Backend.Connexion"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${pageContext.request.contextPath}/Resources/Images/BloodDrop.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Profile/Profile.css"/>


    </head>


    <body>
        <%@include file="../Header/Header.jsp" %>

        <%            
            if (session.getAttribute("id") == null)// extra check, just to make sure
            {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
            
            // get doneur id stored in session
            String id = session.getAttribute("id").toString();

            String req = "SELECT * FROM Donneur WHERE id = " + id;
            System.out.println(req);
            ResultSet R = Connexion.Seconnecter().createStatement().executeQuery(req);
            R.next();

            String prenom = R.getObject(2).toString();
            String nom = R.getObject(3).toString();
            String ville = R.getObject(4).toString();
            String adresse = R.getObject(5).toString();
            String groupe_sanguin = R.getObject(6).toString();
            String date_naissance = R.getObject(7).toString();
            String telephone = R.getObject(8).toString();
            String email = R.getObject(9).toString();
            //String password =  R.getObject(10).toString(); no need
            String disponible = R.getObject(11).toString();

        %>


        
        
        <div class="container">
            <!-- Left part contains all doneur info, will be shown to visitor and profile owner -->
            <div class="left">
                <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="profile-image"/>


                <div class="profile-full-name-container">
                    <div class="profile-prenom"><%= prenom%></div>&nbsp;
                    <div class="profile-nom"><%= nom%></div>
                </div>


                <div class="profile-email"><%= email%></div>


                <div class=<%= disponible.equals("oui") ? "profile-disponible" : "profile-indisponible"%>   >
                    <%= disponible.equals("oui") ? "Disponible" : "Indisponible"%>
                </div> 

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Groupe Sanguin</div>
                    <div class="profile-groupe-sanguin"><%= groupe_sanguin%></div>
                </div>

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Adresse</div>
                    <div class="profile-adresse"><%= ville%>, <%= adresse%></div>
                </div>

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Date de Naissance</div>
                    <div class="profile-date-naissance"><%= date_naissance%></div>
                </div>

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Telephone</div>
                    <div  class="profile-telephone"><%= telephone%></div>
                </div>
            </div> 



          <form class="right" action="${pageContext.request.contextPath}/MiseAJour" method="POST" onsubmit="return OnModifyFormSubmit();">
            <!-- Error Messages from MiseAJour Servlet BEGIN -->
            <%
                if(request.getAttribute("message") != null)
                {
                    if((Boolean)request.getAttribute("isError"))
                    {%>
                    <div class="message-error" style="width: fit-content">
                             <%= request.getAttribute("message") %>
                        </div>
                     <%}else{%>
                        <div class="message-info" style="width: fit-content">
                            <%= request.getAttribute("message") %>
                        </div>

               <%}
                }
              %>                 
            <!-- Error Messages from MiseAJour Servlet END -->
            
                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column; justify-content: center;">   
                            <label>Prenom: </label>
                            <input type="text" name="prenom" value=<%= "'" + prenom + "'" %> placeholder="Prenom..."/>
                        </div>
                    </div>                    <div class="profile-modify-input-form">
                    <div style="display: flex; flex-direction: column; justify-content: center;">   
                            <label>Nom: </label>
                            <input type="text" name="nom" value=<%= "'" + nom + "'" %> placeholder="Nom..."/>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Ville: </label>
                            <input type="text" name="ville" value=<%= "'" + ville + "'" %> placeholder="Ville..."/>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Adresse: </label>
                            <input type="text" name="adresse" value=<%= "'" + adresse + "'" %> placeholder="Adresse..."/>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Groupe Sanguin </label>
                            <select name="groupe_sanguin">
                                <option value="O+"  <%=  groupe_sanguin.equals("O+") ? "selected" : null %>>O+</option>
                                <option value="O-"  <%=  groupe_sanguin.equals("O-") ? "selected" : null %>>O-</option>
                                <option value="A+"  <%=  groupe_sanguin.equals("A+") ? "selected" : null %>>A+</option>
                                <option value="A-"  <%=  groupe_sanguin.equals("A-") ? "selected" : null %>>A-</option>
                                <option value="B+"  <%=  groupe_sanguin.equals("B+") ? "selected" : null %>>B+</option>
                                <option value="B-"  <%=  groupe_sanguin.equals("B-") ? "selected" : null %>>B-</option>
                                <option value="AB+" <%=  groupe_sanguin.equals("AB+") ? "selected" : null %>>AB+</option>
                                <option value="AB-" <%=  groupe_sanguin.equals("AB-") ? "selected" : null %>>AB-</option>
                            </select>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Date de Naissance </label>
                            <input type="date" name="date_naissance" value=<%= "'" + date_naissance + "'" %> placeholder="Date de naissance..."/>
                        </div>
                    </div>
                </div>


                <div class="divider"></div>

                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Telephone </label>
                            <input type="tel" name="telephone" value=<%= "'" + telephone + "'" %> placeholder="telephone..."/>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Email </label>
                            <input type="email" name="email" value=<%= "'" + email + "'" %> placeholder="Email..."/>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Mot de Passe Précédent: </label>
                            <input type="password" name="old_password" value="" placeholder="Mot de Passe Précédent..."/>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Nouveau Mot de Passe: </label>
                            <input type="password" name="new_password" value="" placeholder="Nouveau Mot de Passe..."/>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>


                <div class="profile-modify-input-form">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: row; flex-wrap: wrap;  justify-content: space-around;">  
                            <label>Si vous n'êtes pas prêt à recevoir des demandes de don de sang pour le moment, vous pouvez modifier votre statut entre disponible et indisponible:</label>
                            <div class="profile-modify-disponible">Disponible: <input type="checkbox" name="disponible" value=<%= "'" + disponible + "'" %> <%= disponible.equals("oui") ? "checked" : null %>></div>
                        </div>
                    </div>
                </div>



                <div class="buttons-container">
                    <button class="modifier-profile-button fa fa-save" onclick="OnOperationButtonClicked(this);" type="submit" name="operation" value="Modifier">&nbsp;Modifier</button>
                    <button class="supprimer-compte-button fa fa-trash" onclick="OnOperationButtonClicked(this);" type="submit" name="operation" value="Supprimer mon compte">&nbsp;Supprimer mon compte</button>
                </div>
                
            </form>  

        </div>

        <%@include file="../Footer/Footer.jsp" %>
    </body>
    
    
    <script>
        var operation;
        function OnModifyFormSubmit()
        {
            if(!operation)
                   return false;
               
            if(operation.value === "Modifier")
            {
                let yes = confirm("Êtes-vous sûr de vouloir appliquer ces changements ?");
                return yes;
            }
            if(operation.value === "Supprimer mon compte")
            {
                let yes = confirm(`
                !! ATTENTION !!
                Êtes-vous sûr de vouloir supprimer votre compte de donateur? Nous effacerons définitivement toutes vos données de notre base de données.
                ***CETTE ÉTAPE NE PEUT ÊTRE ANNULÉE****
                `);
                return yes;
            }
            return true;
        }
        
        function OnOperationButtonClicked(op)
        {
            this.operation = op;
        }
    </script>
    
</html>
