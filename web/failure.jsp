<!--Document   : adminactions
    Created on : 28 Jul, 2023, 4:14:58 AM
    Author     : vaibh
-->
<%
    String userid = (String) session.getAttribute("userid");
    if (userid == null) {
        session.invalidate();
        response.sendRedirect("accessdenied.html");
        return;
    }
    out.println("failure");


%>
