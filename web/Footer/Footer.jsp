<%-- 
    Document   : Footer
    Created on : Jun 1, 2021, 5:36:30 PM
    Author     : bader
--%>


<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Footer</title>
        
       <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
       <!-- Libraries END -->

    </head>
   
   
    
    <body>
        <footer>
            <div class="footer-top">
            
              <div class="footer-top-items">
                <!--<h2>RedCell</h2>-->
                <img src="${pageContext.request.contextPath}/Resources/Images/LogoLight.png" width="234">
                <p class="website-description">
                    RedCell est une site web qui facilite la procédure de recherche et de don de sang.<br>
                    L’objectif principal de ce site est de faciliter le processus de recherche d'un donneur de sang et de gagner du temps en particulier dans les cas critiques où cela peut sauver des vies.
                </p>
               <!--
                <h2>SUIVEZ NOUS</h2>
                <a class="fab fa-facebook-f social-icon" href="https://www.facebook.com/"></a>
                <a class="fab fa-twitter social-icon" href="http://www.twitter.com/"></a>
                <a class="fab fa-instagram social-icon" href="http://www.instagram.com/"></a>
                 -->
              </div>
               
              <div class="footer-top-items">
                <h2>LIENS UTILES</h2>
                <ul class="links-list">
                  <li><a href="${pageContext.request.contextPath}/index.jsp">Acceuil</a></li>
                  <li><a href="${pageContext.request.contextPath}/Chercher/Chercher.jsp">Chercher des Donateurs</a></li>
                  <li><a href="${pageContext.request.contextPath}/About/About.jsp">Qui sommes nous?</a></li>
                  <%
                      // if donor is logged in, show profile link
                      if(session.getAttribute("id_donneur") != null)
                      {%>
                            <li><a href="${pageContext.request.contextPath}/Profile/Profile.jsp">Mon Profil</a></li>
                      <%}
                       else // otherwise, show register & login links
                        {%>
                            <li><a href="${pageContext.request.contextPath}/Login/Login.jsp">Connexion</a></li>
                            <li><a href="${pageContext.request.contextPath}/Register/Register.jsp">Devenir Donateur? S'inscrire</a></li>
                        <%}
                  %>
                </ul>
              </div>
              <div class="footer-top-items">
                <h2>RETROUVEZ-NOUS</h2>
                  <div class="row"><i class="fa fa-map-pin icon" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;Boulevard Al Qods Sidi Maârouf 20190 Casablanca</span></div>
                  <br>
                  <br>
                  <div class="row"><i class="fa fa-phone icon" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;+212 06 39 24 95 43</span></div>
                  <br>
                  <br>
                  <div><i class="fa fa-envelope icon" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;ouaichbadereddine@gmail.com</span></div>
              </div>
            </div>
            <div class="footer-bottom">
              © <% out.print(Calendar.getInstance().get(Calendar.YEAR)); %> RedCell All rights reserved.
            </div>
        </footer>
    </body>
    
    <style type="text/css">
        /* ///////////////////////////=================== Theme.css which includes defaults =================//////////////////////////////////////////////// */
        @import "${pageContext.request.contextPath}/Theme.css";
        /* ///////////////////////////=======================================================================//////////////////////////////////////////////// */
    
        /* FOOTER BEGIN */
        footer
        {
            display: flex;
            flex-direction: column;
            font-weight: 100;
        }
        .footer-top
        {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: space-around;
            align-items: flex-start;
            background-color: var(--color-accent);
            color: whitesmoke;
            width: 100%;
        }
        .footer-top-items
        {
            min-width: 300px;
            width: 25%;
            padding: 20px 50px 50px;
        }
        .website-description
        {
            font-size: 18px;
            font-family: var(--font-family-light);
        }
       
        .footer-bottom
        {
            background-color: var(--color-accent-dark);
            color: whitesmoke;
            text-align: center;
            padding: 10px;
            font-family: var(--font-family-thin);
        }
        .footer-top-items ul {
            padding: 0px;
            list-style: none;
        }
        .footer-top-items ul li {
            margin-bottom: 16px;
        }
        .footer-top-items ul li a{
            text-decoration: none;
            color: whitesmoke;
            transition: 500ms;

        }
        .icon{
            color: var(--color-primary);
            background-color: none;
        }
        .social-icon
        {
            color: var(--color-primary);
            background-color: none;
            text-decoration: none;
            font-size: 30px;
            padding-right: 30px;
        }
      
        .links-list a:hover
        {
            color: white;
            font-size: 17px;
            border: 1px white solid;
            border-radius: 5px;
            padding: 5px;
            transition: 500ms;
        }
        /* FOOTER END */

    </style>

</html>