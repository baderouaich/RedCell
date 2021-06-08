<%-- 
    Document   : About
    Created on : Jun 2, 2021, 5:17:46 PM
    Author     : bader
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${pageContext.request.contextPath}/Resources/Images/BloodDrop.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/About/About.css"/>
      
        <!-- Default Scripts BEGIN -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Alerts.js"></script>
        <!-- Default Scripts END -->
    </head>
    <body class="background-image">
        <%@include file="../Header/Header.jsp" %>

        
        <div class="header-container">
            Qui est Redcell ?
        </div>
        
        
        <div class="container">
            
            
            <img class="left" src="${pageContext.request.contextPath}/Resources/Images/undraw_gifts_btw0.png" >
            
            <div class="right">
                <div>
                    RedCell est un projet de site web de fin d'études destiné à faciliter la procédure de recherche d'un donneur et de don de sang. Son principal objectif est d'accélérer la procédure de recherche d'un donneur et de pouvoir le contacter le plus rapidement possible, notamment dans les cas critiques.                </div>
                </div>
            
                
            </div>
        
        
        <%@include file="../Footer/Footer.jsp" %>
    </body>
</html>
