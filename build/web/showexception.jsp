<%-- 
    Document   : showexception
    Created on : 22 Jul, 2023, 5:59:47 PM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Exception ex=(Exception)request.getAttribute("Exception");
    System.out.println("Exception is:" +ex.getMessage());
    out.println("Some exception occured "+ex.getMessage());
%>
