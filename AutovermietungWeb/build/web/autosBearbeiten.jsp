<%-- 
    Document   : autosBearbeiten
    Created on : 09.01.2025, 13:17:55
    Author     : TAmhof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.autovermietung.*,java.io.*,java.util.*, javax.naming.InitialContext,javax.naming.NamingException"%>
<!DOCTYPE html>

   <% Properties props; 
    InitialContext ctx=null;
  
    props = new Properties(); 
    try { 
        ctx = new InitialContext(props); 
    } catch (NamingException ex) { 
            ex.printStackTrace(); 
    } 
    
    AutovermietungSessionBeanRemote bean=(AutovermietungSessionBeanRemote)ctx.lookup("AutovermietungSessionBean/remote");
    int autoId=Integer.parseInt(request.getParameter("autos"));
    String button=request.getParameter("button");
     Auto auto=new Auto();
     auto=bean.getAuto(autoId);
     
    if (button.equals("bearbeiten")) { 
       %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="verarbeiten.jsp" method="post">
            bisherige Bezeichnung: <input type="text" name="name" value="<%=auto.getBez()%>"><br>
            bisherige Farbe: <input type="text" name="farbe" value="<%=auto.getFarbe()%>"><br>
            <input hidden="true" type="text" name="autoId" value="<%=autoId+""%>">
            <input type="submit" name="button" value="aendern">
        </form>
    </body>
</html>  

         <%   } else if (button.equals("verleihen")) {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>An wen soll dieses Auto vermietet werden</div>
        <div><%=auto%></div>
        <form action="verarbeiten.jsp" method="post">
            <select name="kunde">
            <% for (Object x : bean.getKunden()) { %>
            <option value="<%=((Kunde)x).getid()%>"><%= (Kunde)x %></option>       
             <%  } %>
            </select>
            <input hidden="true" type="text" name="autoId" value="<%=autoId+""%>">
            <input type="submit" name="button" value="verleihen">
        </form>
    <option>
    </body>
</html>  

         <%   } 
%>



