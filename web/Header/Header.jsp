<%-- 
    Document   : Header
    Created on : Jun 1, 2021, 5:35:54 PM
    Author     : bader
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Header</title>
        
       <!-- Libraries BEGIN -->
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/Libraries/font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Libraries/jquery/jquery-3.6.0.min.js"></script>
       <!-- Libraries END -->

    </head>


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
                    <li><a href="${pageContext.request.contextPath}/index.jsp" id="${pageContext.request.requestURI.equals('/RedCell/index.jsp') ? 'active-tab' : ''}">Acceuil</a></li>
                   
                    <!-- Chercher des donateurs, always visible -->
                   <li><a href="${pageContext.request.contextPath}/Chercher/Chercher.jsp" id="${pageContext.request.requestURI.equals('/RedCell/Chercher/Chercher.jsp') ? 'active-tab' : ''}">Chercher des Donateurs</a></li>
                   
                    <!-- Qui Somme Nous ?, always visible -->
                   <li><a href="${pageContext.request.contextPath}/About/About.jsp" id="${pageContext.request.requestURI.equals('/RedCell/About/About.jsp') ? 'active-tab' : ''}">Qui Somme Nous ?</a></li>

                    <%
                         final boolean isLoggedIn = session.getAttribute("id") != null && session.getAttribute("nom") != null && session.getAttribute("prenom") != null;
                        // If donneur is logged in, show [Profil] | [Se Déconnecter] nav items
                        if(isLoggedIn) // Logged in
                        {%>
                             <li><a href="${pageContext.request.contextPath}/Profile/Profile.jsp" id="${pageContext.request.requestURI.equals('/RedCell/Profile/Profile.jsp') ? 'active-tab' : ''}">Profil</a></li>  
                             <li>
                               <form action="${pageContext.request.contextPath}/Authentication" method="POST">
                                 <!--<li><a href="${pageContext.request.contextPath}/Logout/Logout.jsp" name="operation" value="Se Deconnecter">Se Déconnecter</a></li> -->
                                   <input type="submit" name="operation" value="Se Deconnecter" class="se-deconnecter-button" /> 
                                </form>
                             </li>
                      <%} 
                        else // Donneur is not logged in, show [Connexion] | [Devenir donateur ? S'inscrire]
                        {%>
                             <li><a href="${pageContext.request.contextPath}/Login/Login.jsp" id="${pageContext.request.requestURI.equals('/RedCell/Login/Login.jsp') ? 'active-tab' : ''}">Connexion</a></li>  
                             <li><a href="${pageContext.request.contextPath}/Register/Register.jsp" id="${pageContext.request.requestURI.equals('/RedCell/Register/Register.jsp') ? 'active-tab' : ''}">Devenir Donateur? S'inscrire</a></li>  
                      <%}
                    %>
                         
                </ul>
            </nav>
        </header>
    </body>
    
    
    
    
        <style type="text/css">
        /* ///////////////////////////=================== Theme.css which includes defaults =================//////////////////////////////////////////////// */
        @import "${pageContext.request.contextPath}/Theme.css";
        /* ///////////////////////////=======================================================================//////////////////////////////////////////////// */

       header
       {
            display: inline-block;
            width: 100%;
            padding: 0px 33px;
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
            transform: translate3d(0px, 3px, 3px); 
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
            font-size: 17px;
            /*text-transform: uppercase;*/
            transition: 300ms;
            border-radius: 6px;
        }
        nav ul li a:hover
        {
            color: white;
            font-weight: 700;
            font-size: 20px;
            border: 1px white solid;
            padding: 5px;
            transition: 300ms;
            border-radius: 6px;
            font-size: 18px;
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
            width: 33px;
            right: 26px;
            top: 23px;
            /*      
            right: 26px;
            top: 27px;
            */
        }
        .toggle-btn span
        {
            display: inline-block;
            float: left;
            width: 100%;
            height: 3px;
            background-color: whitesmoke;
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
                border-top: 1px solid whitesmoke;
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
        
        .se-deconnecter-button
        {
            background-color: var(--color-primary);
            color: whitesmoke;
            font-size: 17px;
            border-radius: 6px;
            padding: 5px;
            border: 0;
            transition: 300ms;
        }
        .se-deconnecter-button:hover
        {
            font-size: 18px;
            background-color: var(--color-accent);
            cursor: pointer;
            transition: 300ms;
        }
    </style>
</html>
