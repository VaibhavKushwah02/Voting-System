<%-- 
    Document   : Verifyvote
    Created on : 21 Jul, 2023, 12:26:48 AM
    Author     : 91756
--%>

<%      
String userid=(String)session.getAttribute("userid");
if(userid==null){
    session.invalidate();
    response.sendRedirect("accessdenied.html");
    return;
}
boolean result=(boolean)request.getAttribute("result");
if(result==true)
out.println("success");
else
out.println("failed");
%>