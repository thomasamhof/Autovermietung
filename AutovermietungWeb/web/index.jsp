<%-- 
    Document   : index
    Created on : 09.01.2025, 15:47:00
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
    
    if (bean.getKunde(1)==null && bean.getKunden().size()==0) {
        Kunde kunde=new Kunde();
        kunde.setName("nicht verliehen");
            bean.addKunde(kunde);
        }
    ;%>
<html>
    <head>
        <link rel="stylesheet" href="AutovermietungCSS.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align='center'>Willkommen bei der Autovermietung</h1>
        <a class="startbild" href="menu.jsp"><img width="800" src="https://i.makeagif.com/media/5-13-2023/uWpM62.gif"></a>
    </body>
</html>
