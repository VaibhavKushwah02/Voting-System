<%-- 
   Document   : adminactions
    Created on : 28 Jul, 2023, 4:14:58 AM
    Author     : vaibh
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jScript/adminoptions.js"></script>
        <script src="jScript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/admin.css" rel="stylesheet">
        <link href="stylesheet/result.css" rel="stylesheet">
        <title>Admin Actions Page</title>
    </head>
    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
            out.println("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>"+
        "<div class='subcandidate'>Admin Actions Page</div><br><br>"+
                    "<div class='logout'><a href='login.html'>logout</a></div></div>"+
        "<div class='container'>"+
            "<div id='dv1' onclick='showuser()'><img src='images/show.png' height='200px' width='200px' style='border:1px solid #000000'><br><h3>Show User</h3></div>"+
            "<div id='dv2' onclick='remove()'><img src='images/delete.jpg' height='200px' width='200px' style='border:1px solid #000000'><br><h3>Remove user</h3></div>"+
           "<br><br><div align='center' id='result'></div>"+
        "</div>");
        %>
    </body>
</html>

