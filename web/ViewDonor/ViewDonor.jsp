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
    if(request.getAttribute("id") == null)
    {
        response.sendRedirect("index.jsp");
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
            // get doneur id from request attribute
            String id = request.getAttribute("id").toString();
           

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
                    <div class="profile-prenom"><%= prenom %></div>&nbsp;
                    <div class="profile-nom"><%= nom %></div>
                </div>
                
                
                <div class="profile-email"><%= email %></div>

      
                <div class=<%= disponible.equals("oui") ? "profile-disponible" : "profile-indisponible" %>   >
                   <%= disponible.equals("oui") ? "Disponible" : "Indisponible" %>
                </div> 

                <div class="divider"></div>
                
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Groupe Sanguin</div>
                    <div class="profile-groupe-sanguin"><%= groupe_sanguin %></div>
                </div>

                
            </div> 



            <div class="right">
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Adresse</div>
                    <div class="profile-adresse"><%= ville %>, <%= adresse %></div>
                </div>

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Date de Naissance</div>
                    <div class="profile-date-naissance"><%= date_naissance %></div>
                </div>

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Telephone</div>
                    <div  class="profile-telephone"><%= telephone %></div>
                </div>
            </div> 

        </div>

                
                
        <%@include file="../Footer/Footer.jsp" %>
    </body>
</html>
