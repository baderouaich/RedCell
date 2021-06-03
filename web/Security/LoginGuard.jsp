<%-- 
    Document   : LoginGuard
    Created on : Jun 2, 2021, 6:42:48 PM
    Author     : bader
--%>


<%
    /* Login Guard: to be placed above any protected page which requires login such as Profile.jsp*/
    
    // If Donor is not logged in, send him/her to Acceuil Page
    if(session.getAttribute("id") == null ||
       session.getAttribute("prenom") == null ||
       session.getAttribute("nom") == null)
    {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>