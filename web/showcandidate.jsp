<%-- 
    Document   : adminactions
    Created on : 28 Jul, 2023, 4:14:58 AM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,Evoting.dto.CandidateInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="jScript/Vote.js"></script>
        <script src="jScript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
        <title>Manage Candidate</title>
    </head>
    <body>
       <%
            String userid = (String) session.getAttribute("userid");
            if (userid == null) {
                response.sendRedirect("accessdenied.html");
                return;
            }
            StringBuffer displayBlock = new StringBuffer("");
            displayBlock.append("<div class='sticky'><div class='candidate'><marquee>VOTE FOR CHANGE</marquee></div><br>"
                    + "<div class='subcandidate'> Select candidate to vote for:</div>"+
            "<div class='logout'><a href='login.html'>Logout</a></div>"+
            "</div><div class='buttons'>");
            ArrayList<CandidateInfo>candidateList = (ArrayList<CandidateInfo>)request.getAttribute("candidateList");
            for(CandidateInfo ci : candidateList)
            {
                displayBlock.append("<input type='radio' name='flat' id ='"+ci.getCandidateId()+"' value='"+ci.getCandidateId()+"' onclick='addvote()'");
                displayBlock.append("<label for='"+ci.getCandidateId()+"'><img src='data:image/jpg;base64,"+ci.getSymbol()+"' style='width:300px; height:200px;'/></label>");
                displayBlock.append("<br><div class='candidateprofile'><p>Candidate Id: "+ci.getCandidateId()+"<br>");
                displayBlock.append("Candidate Name: "+ci.getCandidateName()+"<br>");
                displayBlock.append("Candidate Party: "+ci.getParty()+"<br></div>");
            }
            out.println(displayBlock);
         %>
        
        
    </body>
</html>
    

