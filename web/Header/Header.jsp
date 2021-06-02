<%-- 
    Document   : Header
    Created on : Jun 1, 2021, 5:35:54 PM
    Author     : bader
--%>

<%@page import="Backend.Models.Donneur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Header</title>
        
       <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
       <!-- Libraries END -->

    </head>

    
    <style type="text/css">
        /* ///////////////////////////=================== Theme.css which includes defaults =================//////////////////////////////////////////////// */
        @import "${pageContext.request.contextPath}/Theme.css";
        /* ///////////////////////////=======================================================================//////////////////////////////////////////////// */

       header
       {
            display: inline-block;
            width: 100%;
            padding: 0px 80px;
            position: relative;
            font-size: 16px;
            background-color: var(--color-primary);
            box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 1px, rgba(0, 0, 0, 0.07) 0px 2px 2px, rgba(0, 0, 0, 0.07) 0px 4px 4px, rgba(0, 0, 0, 0.07) 0px 8px 8px, rgba(0, 0, 0, 0.07) 0px 16px 16px;
        }
        .logo
        {
            float: left;
            transition: 500ms;
        }
        .logo:hover
        {
            transform: translate3d(0px, -3px, 0px); 
            transition: 500ms;
        }
        .header-logo
        {
            width: 160px;
            margin: 15px 0px;
        }
        nav
        {
            float: right;
        }
        nav ul li
        {
            display: inline-block;
            padding: 5px 25px;
        }
        nav ul li a
        {
            text-decoration: none;
            display: inline-block;
            color: whitesmoke;
            font-weight: 100;
            font-size: 18px;
            /*text-transform: uppercase;*/
            transition: 250ms;
        }
        nav ul li a:hover
        {
            color: white;
            font-weight: 700;
            font-size: 20px;
            transition: 250ms;
            
        }
        #active-tab
        {
            color: white;
            font-weight: 700;
            font-size: 20px;

        }
        .toggle-btn
        {
            display: none;
            position: absolute;
            width: 35px;
            right: 26px;
            top: 27px;
        }
        .toggle-btn span
        {
            display: inline-block;
            float: left;
            width: 100%;
            height: 3px;
            background-color: #fff952;
            margin-bottom: 8px;
            border-radius: 8px;
        }
  
       
        
        @media (max-width: 1175px) 
        {
            .toggle-btn
            {
                display: block;
            }
            nav
            {
                display: none;
                width: 100%;
                border-top: 1px solid #fff952 ;
                padding-top: 20px;
                margin-top: 20px;
                text-align: center;
            }
            nav ul
            {
                padding: 0;
            }
            nav ul li 
            {
                padding: 15px;
                width: 100%;
            }
            nav.show
            {
                display: block;
            }
        }
    </style>


    <body>
        <header>
            <div class="toggle-btn" onclick="$('nav').toggle('show');">
                <span></span>
                <span></span>
                <span class="bottom-span"></span>
            </div>
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index.jsp"><img class="header-logo" src="${pageContext.request.contextPath}/Resources/Images/Logo.png" alt="RedCell Logo"></a>
            </div>
            <nav id="nav">
                <ul>
                    <!-- Acceuil, always visible -->
                   <li><a href="${pageContext.request.contextPath}/index.jsp" id="active-tab">Acceuil</a></li>
                    <!-- Qui Somme Nous ?, always visible -->
                   <li><a href="${pageContext.request.contextPath}/About/About.jsp" >Qui Somme Nous ?</a></li>

                    <%
                        Donneur donneur = (Donneur)session.getAttribute("donneur");
                        // If donneur is logged in, show [Profil] | [Se Déconnecter] nav items
                        if(donneur != null) // Logged in
                        {%>
                             <li><a href="${pageContext.request.contextPath}/Profile/Profile.jsp">Profil</a></li>  
                             <li><a href="${pageContext.request.contextPath}/Logout/Logout.jsp">Se Déconnecter</a></li>  
                      <%} 
                        else // Donneur is not logged in, show [Connexion] | [Devenir donateur ? S'inscrire]
                        {%>
                             <li><a href="${pageContext.request.contextPath}/Login/Login.jsp">Connexion</a></li>  
                             <li><a href="${pageContext.request.contextPath}/Register/Register.jsp">Devenir donateur? S'inscrire</a></li>  
                      <%}
                    %>
                         
                </ul>
            </nav>
        </header>
    </body>
</html>
