<%-- 
    Document   : Recherche
    Created on : Jun 4, 2021, 4:54:58 PM
    Author     : bader
--%>

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
        <title>Recherche</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Chercher/Chercher.css"/>
        
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


        <div class="container">
            <form action="${pageContext.request.contextPath}/Chercher" method="GET" class="search-form">                
                <div class="title">Recherchez les donneurs disponibles par :</div>
                <hr style="margin-bottom: 20px;">
                <div class="search-form-inputs-container">

                    <div class="input-form">
                       <label>Region:</label>
                        <select name="id_region">
                               <option value="">Sélectionnez une région</option>
                               <%
                                   // Get vills of selected region above
                                   final ResultSet regions = Connexion.Seconnecter().createStatement().executeQuery("SELECT DISTINCT id_region, region FROM Region ORDER BY region ASC");
                                   while(regions.next())
                                   {%>
                                            <option value=<%="'"+regions.getObject(1)+"'"%>><%= regions.getObject(2) %></option>
                                   <%}
                               %>
                        </select>
                    </div>

                    <div class="input-form">
                       <label>Ville:</label>
                        <select name="id_ville">
                               <option value="">Sélectionnez une ville</option>
                               <%
                                   // Get vills of selected region above
                                   final ResultSet villes = Connexion.Seconnecter().createStatement().executeQuery("SELECT DISTINCT id_ville, ville FROM Ville ORDER BY ville ASC");
                                   while(villes.next())
                                   {%>
                                            <option value=<%="'"+villes.getObject(1)+"'"%>><%= villes.getObject(2) %></option>
                                   <%}
                               %>
                        </select>
                    </div>

                    <div class="input-form">
                        <label>Groupe Sanguin:</label>
                        <select name="id_groupe_sanguin">
                              <option value="">Sélectionnez un groupe sanguin</option>
                               <%
                                   final ResultSet groupe_sanguines = Connexion.Seconnecter().createStatement().executeQuery("SELECT DISTINCT id_groupe_sanguin, groupe_sanguin FROM GroupeSanguin ORDER BY groupe_sanguin ASC");
                                   while(groupe_sanguines.next())
                                   {%>
                                            <option value=<%="'"+groupe_sanguines.getObject(1)+"'"%>> <%= groupe_sanguines.getObject(2) %> </option>
                                   <%}
                               %>
                        </select>                
                    </div>

                </div>

                <div class="search-form-buttons-container">
                    <!--<input type="reset" value="Reset"/>-->
                    <input type="submit"  value="Chercher"/>
                </div>
                        
                <!-- Alert Messages from Servlet BEGIN -->
                  <%
                    if(request.getAttribute("message") != null)
                    {%>
                        <div class=<%= "message-"+request.getAttribute("type")%> style="width: 100%; text-align: center;">
                            <%= request.getAttribute("message") %>
                        </div>
                    <%}
                  %>                 
                <!-- Alert Messages from Servlet END -->

            </form>


                
                


            
                <%
                    /*for(int i = 0; i < 100; i ++){
                        out.print("<div class='search-result-item'>" + i + "</div>");
                    }*/
                    if(request.getAttribute("result") != null)
                    {%>
                        <div class="search-result-container">
                       <%
                        final ResultSet R = (ResultSet)request.getAttribute("result");
                        if(!R.next())
                        {
                            // ResultSet is empty
                            out.print("<div class='empty-result'>Aucun donneur trouvé avec les critères spécifiés</div>");
                        }
                        else
                        {
                            do
                            {
                              %>
                               <div class="search-result-item">
                                   <img class="search-result-item-profile-image" src="${pageContext.request.contextPath}/Resources/Images/DefaultProfileImage.png" width="128px" alt="Profile picture"/>
                                   <div class="search-result-details">
                                       <div class="search-result-item-fullname"><%= R.getObject("prenom") + " " + R.getObject("nom") %></div>
                                        <div class="search-result-item-groupe-sanguin"><%= R.getObject("groupe_sanguin") %></div>
                                        <div class="search-result-item-region-ville"><%= "(" + R.getObject("region") + ") " + R.getObject("ville") %></div>
                                   </div>
                                </div>
                            <%}
                            while(R.next());
                        }
                        %> </div> <%
                    }
                %>
            </div>
        
        </div> 
        <%@include file="../Footer/Footer.jsp" %>
    </body>
    

</html>
