<%-- 
    Document   : Register
    Created on : Jun 2, 2021, 4:59:13 PM
    Author     : bader
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Backend.Connexion"%>
<%
    // If Donor is already logged in, send him/her to Acceuil Page, not need to register when u are already logged 
    if(session.getAttribute("id_donneur") != null)
    {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${pageContext.request.contextPath}/Resources/Images/BloodDrop.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Register</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Register/Register.css"/>
        
        <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
        <!-- Libraries END -->

        <!-- Default Scripts BEGIN -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Scripts.js"></script>
        <!-- Default Scripts END -->
    </head>
    
    
    <body>

        <%@include file="../Header/Header.jsp" %>


          <div class="container">
     
              
            <img  class="right" src="${pageContext.request.contextPath}/Resources/Images/undraw_gifts_btw0.png" alt="RedCell"/>

            <form action="${pageContext.request.contextPath}/Authentication" method="POST" class="register-form">
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
                <img src="${pageContext.request.contextPath}/Resources/Images/LogoDark.png" alt="RedCell" width="256px"/>
                <hr style="width: 100%;">

                <div class="title">S'inscrire</div>

                <p class="description">
                    Vous voulez sauver des vies ? inscrivez-vous pour devenir donateur !<br>
                    Quand quelqu'un a besoin de sang, il vous contactera avec les détails que vous avez fournis ci-dessous.<br>
                        <span>(N.B : vous pouvez vous désinscrire à tout moment)</span>
                </p>

                <div class="input-form">
                    <label>Prenom<span style="color:red;">*</span> :</label>
                    <input type="text" name="prenom" placeholder="Prenom..." required/>
                </div>

                <div class="input-form">
                    <label>Nom<span style="color:red;">*</span> :</label>
                    <input type="text" name="nom" placeholder="Nom..." required/>
                </div>
                
                    
                <div class="input-form">
                    <label>Ville<span style="color:red;">*</span> :</label>
                    <select name="id_ville" required>
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
                    <label>Groupe Sanguin<span style="color:red;">*</span> :</label>
                    <select name="id_groupe_sanguin" required>
                           <%
                               final ResultSet groupe_sanguines = Connexion.Seconnecter().createStatement().executeQuery("SELECT DISTINCT id_groupe_sanguin, groupe_sanguin FROM GroupeSanguin ORDER BY groupe_sanguin ASC");
                               while(groupe_sanguines.next())
                               {%>
                                        <option value=<%="'"+groupe_sanguines.getObject(1)+"'"%>> <%= groupe_sanguines.getObject(2) %> </option>
                               <%}
                           %>
                    </select>
                </div>
                    

                <div class="input-form">
                    <label>Date de Naissance<span style="color:red;">*</span> :</label>
                    <input type="date" value='1999-07-18' name="date_naissance" required/>
                </div>


                <div class="input-form">
                    <label>Telephone<span style="color:red;">*</span> :</label>
                    <input type="tel" name="telephone"  placeholder="Telephone..." required/>
                </div>

                <div class="input-form">
                    <label>Email<span style="color:red;">*</span> :</label>
                    <input type="email" name="email"  placeholder="Email..." required/>
                </div>

                <div class="input-form">
                    <label>Mot de passe<span style="color:red;">*</span> :</label>
                    <input type="password" name="password"  placeholder="Mot de passe..." required/>
                </div>

                
              <div class="button-container">
                <input class="register-button" type="submit" name="operation" value="S'inscrire"/>
              </div>
               
              <div class="login-hint">
                        Vous avez déjà un compte ? <a href="${pageContext.request.contextPath}/Login/Login.jsp"> Connectez-vous ici</a>
             </div>

            </form>
       

        </div>


        
        

        <%@include file="../Footer/Footer.jsp" %>

    </body>
</html>
