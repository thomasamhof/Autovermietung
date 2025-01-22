<%-- 
    Document   : index
    Created on : 09.01.2025, 10:55:21
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
    String button=request.getParameter("button");
    try {
          if (button.equals("loeschen")){
              bean.loescheAuto(Integer.parseInt(request.getParameter("autos")));
          } else if (!name.equals("Neues Auto") && name.matches("[a-zA-Z0-9 ]+") && !farbe.equals("Farbe") && farbe.matches("[a-zA-Z ]+") && button.equals("anlegen")) {
            Auto auto=new Auto();
            auto.setBez(name);
            auto.setFarbe(farbe);
            auto.setKunde(bean.getKunde(1));
            bean.addAuto(auto);
        }  
        } catch (NullPointerException npe) {
        }
    List<Auto> liste;
    liste=bean.getAutos();
 %> 

<html>
    <head>
        <link rel="stylesheet" href="AutovermietungCSS.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Autoliste</h1>
        <form action="menu.jsp" method="get">
             <input type="text" name="name" value="Neues Auto">
             <input type="text" name="farbe" value="Farbe">
             <input type="submit" name="button" value="anlegen">
        </form>
        <br>
        <h2><%= (liste.size())+" Autos in der Vermietung"%></h2>
        <table border="1">
            <th width="250">Autobezeichnung</th><th width="75">Farbe</th><th width="200">vermietet an</th><th>Auto ID</th>
          <% for (Auto x : liste) { %>
            <tr>
                <td><%= x.getBez() %></td><td><%= x.getFarbe() %></td><td><%= x.getKunde() %></td><td><%= x.getId() %></td>  
            </tr>       
             <%  } %>
        </table>
        <br><br>
            <h2>Auto verleihen</h2>

                <form action="autosBearbeiten.jsp" method="get">
                <select name="autos"> 
                    <% for (Auto x:liste) { %>
                    <option value="<%=x.getId()%>"><%= x %></option>     
                    <%  } %>   
                    </select>
                    <input type="submit" value="bearbeiten" name="button">
                    <input type="submit" value="verleihen" name="button">
                    <input type="submit" value="loeschen" name="button" formaction="menu.jsp">
                </form>
           <br>
        <a href="kunden.jsp">weiter zu den Kunden</a>
    </body>
</html>
