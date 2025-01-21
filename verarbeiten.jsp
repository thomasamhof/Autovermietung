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
    String name=request.getParameter("name");
    String farbe=request.getParameter("farbe");
    
    if (farbe==null){
        Kunde kunde=new Kunde();
        kunde.setName(name);
        bean.addKunde(kunde);
        out.println(kunde+" erfolgreich angelegt");
    } else {
        Auto auto=new Auto();
        auto.setBez(name);
        auto.setFarbe(farbe);
        auto.setKunde((Kunde)bean.getKunden().get(0));
        bean.addAuto(auto);
        out.println(auto+" erfolgreich angelegt");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <a href="menu.jsp">zurück zum Menü</a>
    </body>
</html>
