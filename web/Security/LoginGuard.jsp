<%-- 
    Document   : LoginGuard
    Created on : Jun 2, 2021, 6:42:48 PM
    Author     : bader
--%>

<%
    if(session.getAttribute("donneur") == null)
        response.sendRedirect("/index.jsp");
%>