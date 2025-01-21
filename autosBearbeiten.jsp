<%-- 
    Document   : autosBearbeiten
    Created on : 09.01.2025, 13:17:55
    Author     : TAmhof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.autovermietung.*,java.io.*,java.util.*, javax.naming.InitialContext,javax.naming.NamingException"%>
<!DOCTYPE html>
<%! Auto auto=new Auto();%>
<% 
 Properties props; 
 InitialContext ctx=null;
  
 props = new Properties(); 
 try { 
 ctx = new InitialContext(props); 
 } catch (NamingException ex) { 
 ex.printStackTrace(); 
 } 
    
    AutovermietungSessionBeanRemote bean=(AutovermietungSessionBeanRemote)ctx.lookup("AutovermietungSessionBean/remote");
    int id=Integer.parseInt(request.getParameter("autos"));
    String button=request.getParameter("button");
    
    if (button.equals("bearbeiten")) {
            if (id==0) {%>
            <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="verarbeiten.jsp" method="post">
            <input type="text" name="name" value="Bezeichnung">
            <input type="text" name="farbe" value="Farbe">
            <input type="submit" name="button" value="erstellen">
        </form>
    </body>
</html>                    
       <%         }
else {
       auto=bean.getAuto(id);
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
            <input type="button" name="button" value="aendern">
        </form>
    </body>
</html>  
<%}
        } else if (button.equals("loeschen")) {
                auto=bean.getAuto(i);
                bean.loescheAuto(id); %>
 

         <%   } else if (button.equals("verleihen")) {
               auto=bean.getAuto(id); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>An wen soll dieses Auto vermietet werden</div>
        <div><%=auto%></div>
        <form action="verarbeiten.jsp" method="post">
            <select>
            <% for (Object x : bean.getKunden()) { %>
            <option><%= (Kunde)x %></option>       
             <%  } %>
            </select>
            <input type="submit" name="button" value="aendern">
        </form>
    <option>
    </body>
</html>  

         <%   } 
%>



