<%-- 
    Document   : index
    Created on : Jun 1, 2021, 5:33:21 PM
    Author     : bader
--%>


<%@page import="Backend.Connexion"%>
<%@page import="java.sql.ResultSet"%>
<%
//@include file="LoginGuard.jsp" 
%>
<%
    //User currUser = null;
    //currUser = (User) session.getAttribute("user");
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
        <title>RedCell</title>
        
        <!-- Style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css"/>
                
        <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
        <!-- Libraries END -->

        
    </head>
    <body class="background-image">
        
        <%@include file="Header/Header.jsp" %>
        
        
        <%
            ResultSet  R = Connexion.Seconnecter().createStatement().executeQuery("SELECT * FROM Donneur");
            while(R.next())
            {
                out.print("<p>" + R.getObject("id") + " " + R.getObject("prenom") + "</p>");
            }
         
        %>
            <h1>Hello World!</h1>
        
        
        <%@include file="Footer/Footer.jsp" %>

    </body>
</html>
