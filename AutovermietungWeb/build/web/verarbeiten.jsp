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
    
    if (button.equals("verleihen")) {
           Kunde kunde=bean.getKunde(Integer.parseInt(request.getParameter("kunde")));
            bean.verleiheAuto(autoId, kunde);
            out.println(bean.getAuto(autoId)+" an "+kunde+" verliehen");


    } else if (button.equals("aendern")) {
            Auto auto=bean.getAuto(autoId);
            auto.setBez(request.getParameter("name"));
            auto.setFarbe(request.getParameter("farbe"));
            bean.aendereAuto(autoId, auto);
            out.println(bean.getAuto(autoId)+" geaendert");
        }
    

%>
<html>
    <head>
        <link rel="stylesheet" href="AutovermietungCSS.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <a href="menu.jsp">zurück zum Menü</a>
    </body>
</html>
