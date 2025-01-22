<%-- 
    Document   : kunden
    Created on : 09.01.2025, 12:09:13
    Author     : TAmhof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.autovermietung.*,java.io.*,java.util.*, javax.naming.InitialContext,javax.naming.NamingException"%>
<!DOCTYPE html>
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
    String name=request.getParameter("text");
    String button=request.getParameter("button");
    try {
          if (!name.equals("Neuer Kunde") && name.matches("[a-zA-Z ]+") && button.equals("anlegen")) {
            Kunde kunde=new Kunde();
            kunde.setName(name);
            bean.addKunde(kunde);
        }  
        } catch (NullPointerException npe) {
        }
    
    
    
    List<Kunde> liste;
    liste=bean.getKunden();
 %>
<html>
    <head>
        <link rel="stylesheet" href="AutovermietungCSS.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Kundenliste</h1>
        <ul>      
       <% out.println("Anzahl an Kunden: "+liste.size());
           for (Kunde x : liste) { %>
            <li><%= x %></li>       
             <%  } %>  
   </ul>
   <br><br>
   <form action="kunden.jsp" method="get">
       <input type="text" name="text" value="Neuer Kunde">
       <input type="submit" name="button" value="anlegen">
   </form>
    </body>
    <br>
    <a href="menu.jsp">zum Menü</a>
</html>
