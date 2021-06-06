<%-- 
    Document   : Profile
    Created on : Jun 2, 2021, 5:11:57 PM
    Author     : bader
--%>
<%
    /* Login Guard: to be placed above any protected page which requires login such as Profile.jsp*/

    // If Donor is not logged in, send him/her to Acceuil Page
    if (session.getAttribute("id_donneur") == null) 
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

        <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
        <!-- Libraries END -->
        
        <!-- Default Scripts BEGIN -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Scripts.js"></script>
        <!-- Default Scripts END -->
    </head>


    
    <body class="background-image">
        <%@include file="../Header/Header.jsp" %>

        <%            
            if (session.getAttribute("id_donneur") == null)// extra check, just to make sure
            {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
            
            // get donneur id stored in session
            String id_donneur = session.getAttribute("id_donneur").toString();

            /*
            Method 1:
            String req = "SELECT "+
                "prenom," +
                "nom,"+
                "(SELECT region FROM Region WHERE id_region = d.id_region),"+
                "(SELECT ville FROM Ville WHERE id_ville = d.id_ville),"+
                "(SELECT groupe_sanguin FROM GroupeSanguin WHERE id_groupe_sanguin = d.id_groupe_sanguin),"+
                "date_naissance,"+
                "telephone,"+
                "email,"+
                "password,"+
                "disponible"+
                " FROM Donneur d  WHERE id_donneur = " + id_donneur;
            */
            String req = "SELECT * FROM Donneur NATURAL JOIN Region NATURAL JOIN Ville NATURAL JOIN GroupeSanguin WHERE id_donneur = " + id_donneur;
            System.out.println(req);
            
            ResultSet R = Connexion.Seconnecter().createStatement().executeQuery(req);
            R.next();

            String prenom = R.getObject("prenom").toString();
            String nom = R.getObject("nom").toString();
            String region = R.getObject("region").toString();
            String ville = R.getObject("ville").toString();
            String groupe_sanguin = R.getObject("groupe_sanguin").toString();
            String date_naissance = R.getObject("date_naissance").toString();
            String telephone = R.getObject("telephone").toString();
            String email = R.getObject("email").toString();
            //String password =  R.getObject(9).toString(); no need
            String disponible = R.getObject("disponible").toString();

        %>


        
        
        <div class="container">
            <!-- Left part contains all doneur info, will be shown to visitor and profile owner -->
            <div class="left">
                <img src="${pageContext.request.contextPath}/Resources/Images/DefaultProfileImage.png" class="profile-image"/>


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
                    <div class="profile-section-title">Region - Ville</div>
                    <div class="profile-region-ville"><%= region %> - <%= ville %></div>
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
                <!-- Alert Messages from Servlet BEGIN -->
                <%
                    if(request.getAttribute("message") != null)
                    {%>
                        <div class=<%= "message-"+request.getAttribute("type")%> style="width: fit-content;">
                            <%= request.getAttribute("message") %>
                        </div>
                    <%}
                  %>                 
                <!-- Alert Messages from Servlet END -->
            
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
                            <select name="id_ville" required>
                                   <%
                                       // Get vills of selected region above
                                       final ResultSet villes = Connexion.Seconnecter().createStatement().executeQuery("SELECT DISTINCT id_ville, ville FROM Ville ORDER BY ville ASC");
                                       while(villes.next())
                                       {%>
                                       <option value=<%="'"+villes.getObject(1)+"'"%>  <%= ville.equals(villes.getObject(2)) ? "selected" : null %>><%= villes.getObject(2) %></option>
                                       <%}
                                   %>
                            </select>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Region: </label>
                            <input type="text" value=<%= "'" + region + "'" %> placeholder="Region..." readonly/><!-- ignored - disabled -->
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Groupe Sanguin: </label>
                            <select name="id_groupe_sanguin" required>
                                   <%
                                       final ResultSet groupe_sanguines = Connexion.Seconnecter().createStatement().executeQuery("SELECT DISTINCT id_groupe_sanguin, groupe_sanguin FROM GroupeSanguin ORDER BY groupe_sanguin ASC");
                                       while(groupe_sanguines.next())
                                       {%>
                                       <option value=<%="'"+groupe_sanguines.getObject(1)+"'"%>  <%= groupe_sanguin.equals(groupe_sanguines.getObject(2)) ? "selected" : null %>> <%= groupe_sanguines.getObject(2) %> </option>
                                       <%}
                                   %>
                            </select>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Date de Naissance: </label>
                            <input type="date" name="date_naissance" value=<%= "'" + date_naissance + "'" %> placeholder="Date de naissance..."/>
                        </div>
                    </div>
                </div>


                <div class="divider"></div>

                <div class="profile-modify-section">
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Telephone: </label>
                            <input type="tel" name="telephone" value=<%= "'" + telephone + "'" %> placeholder="telephone..."/>
                        </div>
                    </div>
                    <div class="profile-modify-input-form">
                        <div style="display: flex; flex-direction: column;  justify-content: center;">   
                            <label>Email: </label>
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
                            <label>Si vous n'êtes pas prêt à apparaître dans les résultats de recherche et à recevoir des demandes de don de sang pour le moment, vous pouvez changer votre statut de disponible à non disponible:</label>
                            <div class="profile-modify-disponible">Disponible: <input type="checkbox" name="disponible" value=<%= "'" + disponible + "'" %> <%= disponible.equals("oui") ? "checked" : null %>></div>
                        </div>
                    </div>
                </div>



                <div class="buttons-container">
                    <button class="modifier-profile-button fa fa-save" onclick="OnOperationButtonClicked(this);" type="submit" name="operation" value="Modifier">&nbsp;&nbsp;&nbsp;Modifier</button>
                    <button class="supprimer-compte-button fa fa-trash" onclick="OnOperationButtonClicked(this);" type="submit" name="operation" value="Supprimer mon compte">&nbsp;&nbsp;&nbsp;Supprimer mon compte</button>
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
