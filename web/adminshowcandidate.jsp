<%-- 
    Document   : adminactions
    Created on : 28 Jul, 2023, 4:14:58 AM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="org.json.JSONObject" %>
 <%@page import="Evoting.dto.CandidateDetails" %>
 <%@page import="java.util.ArrayList" %>
 <% 
  String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
           
 
 String result=(String)request.getAttribute("result");
 StringBuffer displayBlock=new StringBuffer();
 if(result!=null && result.equalsIgnoreCase("candidateList")){
   ArrayList<String> candidateId=(ArrayList<String>)request.getAttribute("candidateid");
   displayBlock.append("<option>Choose Id</option>");
        for(String c:candidateId)
        {
displayBlock.append("<option value='"+c+"'>"+c+"</option>");

        }
JSONObject json=new JSONObject();

json.put("cid", displayBlock.toString());
out.println(json);
System.out.println("in admin  candidate");
System.out.println(displayBlock);
    

 }
 else if(result!=null && result.equals("details")){
     CandidateDetails cd=(CandidateDetails)request.getAttribute("candidate");
     System.out.println(cd);
  String str="<img src='data:image/jpg;base64,"+cd.getSymbol()+"' style='width:300px;height:200px;'/>";

displayBlock.append("<table>");
displayBlock.append("<tr><th>User Id:</th><td>"+cd.getUserId()+"</td></tr>");
displayBlock.append("<tr><th>Candidate Name:</th><td>"+cd.getCandidateName()+"</td></tr>");
displayBlock.append ("<tr><th>City:</th><td>"+cd.getCity()+"</td></tr>");
displayBlock.append ( "<tr><th>Party:</th><td>"+cd.getParty()+"</td></tr>");
displayBlock.append  ("<tr><th>Symbol:</th><td>"+str+"</td></tr>");
displayBlock.append ( "</table>");
System.out.println(displayBlock);
JSONObject json=new JSONObject();
//json.put("image", str);
json.put("subdetails", displayBlock.toString());
out.println(json);
    
System.out.println("in admin show candidate");
System.out.println(displayBlock);


     
 }
 
 
 
 %>
