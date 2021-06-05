<%-- 
    Document   : Login
    Created on : Jun 2, 2021, 4:58:14 PM
    Author     : bader
--%>
<%
    // If Donor is already logged in, send him/her to Acceuil Page, not need to login when u already are logged in.
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
        
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Login/Login.css"/>
        
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
            
            
           <img  class="left" src="${pageContext.request.contextPath}/Resources/Images/undraw_doctors_hwty.png" alt="RedCell"/>


            <div class="right">
                <form action="${pageContext.request.contextPath}/Authentication" method="POST" >

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

                <div class="title">
                        Connectez-vous à votre compte 
                    </div>

                    <div class="input-form">
                       <label>Email:</label>
                       <input type="email" name="email" placeholder="Email..." required/>
                    </div>

                    <div class="input-form">
                        <label>Mot de passe:</label>
                        <input type="password" name="password" placeholder="Mot de passe..." required/>
                    </div>

                     <div class="input-form-button">
                        <input type="submit" name="operation" value="Connexion" />
                    </div>

                    <div class="register-hint">
                        Vous n'avez pas de compte ? <a href="${pageContext.request.contextPath}/Register/Register.jsp"> Inscrivez-vous ici</a>
                    </div>
                </form>
            </div>

        </div>
                
                
        <%@include file="../Footer/Footer.jsp" %>
    </body>
</html>
