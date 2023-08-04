<%-- 
    Document   : loginresponse
    Created on : 25 Jul, 2023, 3:29:40 AM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String userid = (String) request.getAttribute("userid");
    String result = (String) request.getAttribute("result");

    if (userid != null && result != null) {
        HttpSession sess = request.getSession();
        sess.setAttribute("userid", userid);
        String url = "";
        if (result.equalsIgnoreCase("Admin")) {
            url = "AdminControllerServlet;jsessionid=" + sess.getId();
        } else {
            url = "VoterControllerServlet;jsessionid=" + sess.getId();
        }
        out.println(url);

    } else {
        out.println("error");
    }

%>