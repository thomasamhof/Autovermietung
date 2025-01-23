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
    int autoId=0;
    AutovermietungSessionBeanRemote bean=(AutovermietungSessionBeanRemote)ctx.lookup("AutovermietungSessionBean/remote");
    autoId=Integer.parseInt(request.getParameter("auswahl")); 
    String button=request.getParameter("button");
     Auto auto=new Auto();
     auto=bean.getAuto(autoId); 
       %>
<html>
    <head>
        <link rel="stylesheet" href="AutovermietungCSS.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if (button.equals("bearbeiten")) { %>
        <h2>Auto bearbeiten</h2>
        <form action="verarbeiten.jsp" method="post">
            <table>
                <tr><td>bisherige Bezeichnung</td><td><input type="text" name="name" value="<%=auto.getBez()%>"></td></tr>
            <tr><td>bisherige Farbe</td><td><input type="text" name="farbe" value="<%=auto.getFarbe()%>"></td></tr>
            <tr><td><input type="submit" class="btn-primary" name="button" value="bearbeiten"></td></tr>
            </table>
            <input hidden="true" type="text" name="autoId" value="<%=autoId+""%>">
        </form> 
        <% } else if (button.equals("verleihen")) {%>
            <h2>An wen soll dieses Auto vermietet werden</h2>
        <form action="verarbeiten.jsp" method="post"> 
            <table>
                <tr><td><%=auto%></td></tr>
                <tr><td><select name="kunde">
            <% for (Object x : bean.getKunden()) { %>
            <option value="<%=((Kunde)x).getid()%>"><%= (Kunde)x %></option>       
             <%  } %>
            </select>
            <input type="submit" class="btn-primary" name="button" value="verleihen"></td></tr>
            </table>
             <input hidden="true" type="text" name="autoId" value="<%=autoId+""%>">
        </form>
            <% } %>     
    </body>
</html>  





