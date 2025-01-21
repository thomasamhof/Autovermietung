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
          }
        
          if (!name.equals("Neues Auto") && name.matches("[a-zA-Z0-9 ]+") && !farbe.equals("Farbe") && farbe.matches("[a-zA-Z ]+") && button.equals("anlegen")) {
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
            <form action="menu.jsp" method="get">
             <input type="text" name="name" value="Neues Auto">
             <input type="text" name="farbe" value="Farbe">
             <input type="submit" name="button" value="anlegen">
            </form>
        <br>
        <br>
        <table>
            <tr>
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
           </tr><br>
            <tr> <a href="kunden.jsp">weiter zu den Kunden</a></tr>
            </table>
    </body>
</html>
