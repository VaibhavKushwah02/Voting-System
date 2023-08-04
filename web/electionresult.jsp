<%-- 
    Document   : adminactions
    Created on : 28 Jul, 2023, 4:14:58 AM
    Author     : vaibh
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Evoting.dto.CandidateDetails,java.util.LinkedHashMap,java.util.Iterator" %>
<%
    
 String userid=(String)session.getAttribute("userid");
          if(userid==null){
              response.sendRedirect("accessdenied.html");
              return;
          }
LinkedHashMap <CandidateDetails,Integer> resultDetails=(LinkedHashMap)request.getAttribute("result");
int votecount=(int)request.getAttribute("votecount");
Iterator it=resultDetails.entrySet().iterator();
StringBuffer sb=new StringBuffer("<table>");
sb.append("<tr><th>Candidate Id</th><th>Candidate Name</th><th>party</th><th>symbol</th><th>city</th><th>vote count</th><th>vote %</th></tr>");
while(it.hasNext()){
    Map.Entry<CandidateDetails,Integer> e=(Map.Entry)it.next();
    CandidateDetails cd=e.getKey();
    float voteper=(e.getValue()*100.0f)/votecount;
    sb.append("<tr><td>"+cd.getCandidateId()+"</td><td>"+cd.getCandidateName()+"</td><td>"+cd.getParty()+"</td><td><img src='data:image/jpg;base64,"+cd.getSymbol()+"'style='width:300px; height:200px;'/></td><td>"+cd.getCity()+"</td><td>"+e.getValue()+"</td><td>"+voteper+"</td></tr>");
    
}
sb.append("</table>");
out.println(sb);





%>