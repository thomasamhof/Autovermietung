<%-- 
    Document   : verleihen
    Created on : 09.01.2025, 14:40:54
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
        <h1>Hello World!</h1>
    </body>
</html>
