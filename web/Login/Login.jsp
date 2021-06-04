<%-- 
    Document   : Login
    Created on : Jun 2, 2021, 4:58:14 PM
    Author     : bader
--%>
<%
    // If Donor is already logged in, send him/her to Acceuil Page, not need to login when u already are logged in.
    if(session.getAttribute("id") != null && session.getAttribute("prenom") != null &&
       session.getAttribute("nom") != null)
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
        
    </head>
    <body class="background-image">
        
        <%@include file="../Header/Header.jsp" %>

        
        
        
        <div class="container">
            
            <form action="../Authentication" method="POST" class="login-form">
                <!-- Error Messages from Authentication Servlet BEGIN -->
                <%
                    if(request.getAttribute("message") != null)
                    {%>
                    <div class="message-error">
                        <%= request.getAttribute("message") %>
                    </div>
                    <%}
                %>                 
                <!-- Error Messages from Authentication Servlet END -->
                
                
                 <h1 class="title">Connexion</h1>
                 <hr style="width: 100%;">
                 <br>
                
                
                <div class="input-form">
                    <label>Email<span style="color:red;">*</span> :</label>
                    <input type="email" name="email"  placeholder="Email..." required/>
                </div>

                <div class="input-form">
                    <label>Mot de passe<span style="color:red;">*</span> :</label>
                    <input type="password" name="password"  placeholder="Mot de passe..." required/>
                </div>
                
                
                <input class="login-button" type="submit" name="operation" value="Connexion"/>

            </form>

        </div>
        
        
        
        
        <%@include file="../Footer/Footer.jsp" %>
        
    </body>
</html>
