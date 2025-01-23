<%-- 
    Document   : verarbeiten
    Created on : 09.01.2025, 14:41:07
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
    int autoId = Integer.parseInt(request.getParameter("autoId"));
    String button=request.getParameter("button");
    String ausgabe="";
    
    if (button.equals("verleihen")) {
           Kunde kunde=bean.getKunde(Integer.parseInt(request.getParameter("kunde")));
            bean.verleiheAuto(autoId, kunde);
            ausgabe= bean.getAuto(autoId).getBez()+" an "+kunde.getName()+" verliehen";


    } else if (button.equals("bearbeiten")) {
            Auto auto=bean.getAuto(autoId);
            auto.setBez(request.getParameter("name"));
            auto.setFarbe(request.getParameter("farbe"));
            bean.aendereAuto(autoId, auto);
            ausgabe = auto.getBez()+" in der Farbe "+auto.getFarbe();
        }
    

%>
<html>
    <head>
        <link rel="stylesheet" href="AutovermietungCSS.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Änderungen</h2>
        <div class="AenderungenZeigen"><%=ausgabe%></div>
        <br>
        <a href="menu.jsp">zurück zum Menü</a>
    </body>
</html>
