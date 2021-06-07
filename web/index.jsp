<%-- 
    Document   : index
    Created on : Jun 1, 2021, 5:33:21 PM
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
        <title>RedCell</title>
        
        <!-- Style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css"/>
                
        <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
        <!-- Libraries END -->

        <!-- Default Scripts BEGIN -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Scripts.js"></script>
        <!-- Default Scripts END -->

    </head>
    <body class="background-image">
        
        <%@include file="Header/Header.jsp" %>
        
        <div class="container">
            
        </div>
        
        <%@include file="Footer/Footer.jsp" %>

    </body>
</html>
