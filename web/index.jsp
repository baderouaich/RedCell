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

        <!-- Libraries CSS BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <!-- Libraries CSS END -->



    </head>
  
    
    <body class="background-image">

        <%@include file="Header/Header.jsp" %>



        <!-- Carousel Slider BEGIN (items will be inserted with jQuery) -->
        <div class="carousel">
          
        </div>
        <!-- Carousel Slider END -->


        
        
        <div class="donors-by-region-container">
            <div class="donors-by-region-container-title">Nombre de Donneurs disponibles en ce moment par région :</div>

            <%
                //String req = "SELECT COUNT(d.id_donneur) as total, region FROM Donneur d NATURAL JOIN Region WHERE disponible = 'oui' GROUP BY region ORDER BY region ASC";
                String req = "SELECT COUNT(distinct d.id_donneur) as total, region FROM Donneur d NATURAL JOIN Ville v JOIN Region r ON r.id_region = v.id_region WHERE disponible = 'oui' GROUP BY region ORDER BY region ASC";
                ResultSet R = Connexion.Seconnecter().createStatement().executeQuery(req);
                while(R.next())
                {%>
                    <div class="donors-by-region-item">
                        <div class="donors-by-region-item-title"><%= R.getString("region") %></div>
                        <div class="divider"></div>
                        <div class="donors-by-region-item-total"><%= R.getString("total") %> Donneurs</div>
                    </div>
                <%}
            %>
        </div>
        
        
        
        
        
        <% 
            // if user is not logged in, ask him/her to register and become a donor
           if(session.getAttribute("id_donneur") == null) 
           {%>
                <div class="become-donor-container">
                    <div>Votre don de sang sauve des vies.</div>
                    <a href="${pageContext.request.contextPath}/Register/Register.jsp">Devenez un donneur de sang et faites une différence</a>
                </div>
           <%}           
         %>

        <%@include file="Footer/Footer.jsp" %>

                
        
        <!-- Libraries JS BEGIN -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
        <!-- Slick (Carousel Slider Library) BEGIN -->
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Libraries/slick/slick.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Libraries/slick/slick-theme.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/slick/slick.min.js"></script>
        <!-- Slick (Carousel Slider Library) END -->
        <!-- Libraries JS END -->
        
        <!-- Default Scripts BEGIN -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Carousel.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Alerts.js"></script>
        <!-- Default Scripts END -->

    </body>

    
    
    
</html>
