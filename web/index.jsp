<%-- 
    Document   : index
    Created on : Jun 1, 2021, 5:33:21 PM
    Author     : bader
--%>


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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RedCell</title>
        
        <!-- Style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css"/>
                
        <!-- Libraries -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>

        
    </head>
    <body>
        
        <%@include file="Header.jsp" %>
        
        
            <h1>Hello World!</h1>
        
        
        <%@include file="Footer.jsp" %>

    </body>
</html>
