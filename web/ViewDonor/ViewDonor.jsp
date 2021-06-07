<%-- 
    Document   : ViewDonor
    Created on : Jun 3, 2021, 9:23:54 PM
    Author     : bader
--%>

<!--
Détails du donateur page
On click at donor in search result, visitor will be sent here with request attribute of donor's id
-->

<%
    // Check if we received Donneur id with request, otherwise go back to index.jsp or Search.jsp in future
    if(request.getParameter("id_donneur") == null)
    {
        
        request.setAttribute("type", "error");
        request.setAttribute("message", "Aucun identifiant de donneur n'a été spécifié");
        request.getRequestDispatcher("/Chercher/Chercher.jsp").forward(request, response);
        return;
    }
    // check if donor disponible
    // check if donor is current logged in donor
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
        <title>Voir Donateur</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/ViewDonor/ViewDonor.css"/>
        
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
            // get doneur id from request attribute
            String id_donneur = request.getParameter("id_donneur").toString();
           

            String req = "SELECT * FROM Donneur NATURAL JOIN Ville NATURAL JOIN Region NATURAL JOIN GroupeSanguin WHERE LOWER(disponible)='oui' AND id_donneur = " + id_donneur;
            System.out.println(req);
            ResultSet R = Connexion.Seconnecter().createStatement().executeQuery(req);
            if(!R.next())
            {
                request.setAttribute("type", "error");
                request.setAttribute("message", "Le donneur a été supprimé ou n'est pas disponible pour recevoir des demandes de don de sang.");
                request.getRequestDispatcher("/Chercher/Chercher.jsp").forward(request, response);
                return;
            }

            String prenom = R.getObject("prenom").toString();
            String nom = R.getObject("nom").toString();
            String region = R.getObject("region").toString();
            String ville = R.getObject("ville").toString();
            String groupe_sanguin = R.getObject("groupe_sanguin").toString();
            String date_naissance = R.getObject("date_naissance").toString();
            String telephone = R.getObject("telephone").toString();
            String email = R.getObject("email").toString();
            String disponible = R.getObject("disponible").toString();

        %>

    
            <!-- Left part contains all doneur info, will be shown to visitor and profile owner -->
            <div class="container">
                <div class="donneur-details">
                    <div class="donneur-details-header">
                        <img src="${pageContext.request.contextPath}/Resources/Images/DefaultProfileImage.png" class="profile-image"/>

                        <div class="profile-full-name-container">
                            <div class="profile-prenom"><%= prenom%></div>&nbsp;
                            <div class="profile-nom"><%= nom%></div>
                        </div>

                        <div class=<%= disponible.equals("oui") ? "profile-disponible" : "profile-indisponible"%>   >
                            <%= disponible.equals("oui") ? "Disponible" : "Indisponible"%>
                        </div> 
                    </div>


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
                        <div class="profile-section-title">Email</div>
                        <div  class="profile-email"><%= email %></div>
                    </div>
                    
                    <div class="divider"></div>

                    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                        <div class="profile-section-title">Telephone</div>
                        <div  class="profile-telephone"><%= telephone%></div>
                    </div>
                    
                </div>
            </div> 


                
                
        <%@include file="../Footer/Footer.jsp" %>
    </body>
</html>
