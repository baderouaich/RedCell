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
    </head>
   
    
    <style type="text/css">
        @import "Theme.css";
        
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
        .footer-bottom
        {
            background-color: var(--color-accent-dark) ;
            color: whitesmoke;
            text-align: center;
            padding: 10px;
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
        }
        .icon{
            color: var(--color-primary);
            background-color: none;
        }
        .social-icon{
            color: var(--color-primary);
            background-color: none;
            text-decoration: none;
            font-size: 30px;
            padding-right:30px ;
        }
        /* FOOTER END */

    </style>
    
    <body>
        <footer class="footer">
            <div class="footer-top">
            
              <div class="footer-top-items">
                <h2>RedCell</h2>
                <p>
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
                <ul>
                  <li><a href="${pageContext.request.contextPath}/index.jsp">Acceuil</a></li>
                  <li><a href="${pageContext.request.contextPath}/Prestataires/Prestataires.html">Prestataires</a></li>
                  <li><a href="${pageContext.request.contextPath}/About/About.html">Qui sommes nous?</a></li>
                  <li><a href="${pageContext.request.contextPath}/Contact/Contact.html">Contactez nous</a></li>
                </ul>
              </div>
              <div class="footer-top-items">
                <h2>RETROUVEZ-NOUS</h2>
                  <i class="fa fa-map-pin icon" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;Boulevard Al Qods Sidi Maârouf 20190 Casablanca</span>
                  <br>
                  <br>
                  <i class="fa fa-phone icon" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;+212 05 22 33 44 55</span>
                  <br>
                  <br>
                  <i class="fa fa-envelope icon" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;ouaichbadereddine@gmail.com</span>
              </div>
            </div>
            <div class="footer-bottom">
              © <% out.print(Calendar.getInstance().get(Calendar.YEAR)); %> RedCell All rights reserved.
            </div>
        </footer>
    </body>
    
   
  </html>