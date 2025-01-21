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
//    String zwischen=request.getParameter("eingabe");%>
    <%! List<Auto> liste;%>
    <%
//    if (zwischen!=null) {
//        Spiel spiel=new Spiel();
//        spiel.setName(zwischen);
//            bean.addSpiel(spiel);
//        }
    liste=bean.getAutos();
 %> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
    
            <tr><th><%= ("Autoliste Anzahl: "+liste.size())%></th></tr><ul>
          <% for (Auto x : liste) { %>
            <tr> <li><%= x %></li></tr>       
             <%  } %>
        </ul></table><br><br>
             
        <table><tr><form action="autosBearbeiten.jsp" method="get">
                <select name="autos">
                    <option value="0">neues Auto anlegen</option>
                <% out.println("Anzahl an Autos: "+liste.size());
           for (Auto x:liste) { %>
           <option value="<%=x.getId()%>"><%= x %></option>     
             <%  } %>   
            </select>
            <input type="submit" value="bearbeiten" name="button">
            <input type="submit" value="loeschen" name="button">
            <input type="submit" value="verleihen" name="button">
            </form></tr><br>
            <tr> <a href="kunden.jsp">weiter zu den Kunden</a></tr>
            </table>
    </body>
</html>
