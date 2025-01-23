package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.autovermietung.*;
import java.io.*;
import java.util.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
 
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
          if (button.equals("entfernen")){
              bean.loescheAuto(Integer.parseInt(request.getParameter("auswahl")));
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
 
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("       \r\n");
      out.write("        <link rel=\"stylesheet\" href=\"AutovermietungCSS.css\">\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Autoliste</h1>\r\n");
      out.write("        <form action=\"menu.jsp\" method=\"get\">\r\n");
      out.write("             <input type=\"text\" name=\"name\" value=\"Neues Auto\">\r\n");
      out.write("             <input type=\"text\" name=\"farbe\" value=\"Farbe\">\r\n");
      out.write("             <input type=\"submit\" class=\"btn-primary\" name=\"button\" value=\"anlegen\">\r\n");
      out.write("        </form>\r\n");
      out.write("        <br>\r\n");
      out.write("        <h2>");
      out.print( (liste.size())+" Autos in der Vermietung");
      out.write("</h2>\r\n");
      out.write("        <form action=\"autosBearbeiten.jsp\" method=\"post\">\r\n");
      out.write("            <table border=\"1\" class=\"vermieteteAutos\">\r\n");
      out.write("            \r\n");
      out.write("            <th width=\"35%\">Autobezeichnung</th><th width=\"15%\">Farbe</th><th width=\"30%\">vermietet an</th><th width=\"10%\">Auto ID</th><th width=\"10%\">Auswahl</th>\r\n");
      out.write("          ");
 for (Auto x : liste) { 
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td>");
      out.print( x.getBez() );
      out.write("</td><td>");
      out.print( x.getFarbe() );
      out.write("</td><td>");
      out.print( x.getKunde() );
      out.write("</td><td>");
      out.print( x.getId() );
      out.write("</td><td><input type=\"radio\" name=\"auswahl\" value=\"");
      out.print( x.getId() );
      out.write("\" required></td>  \r\n");
      out.write("            </tr>       \r\n");
      out.write("             ");
  } 
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("        <br>\r\n");
      out.write("        <input type=\"submit\" class=\"btn-primary\" value=\"bearbeiten\" name=\"button\">\r\n");
      out.write("        <input type=\"submit\" class=\"btn-primary\" value=\"verleihen\" name=\"button\">\r\n");
      out.write("        <input type=\"submit\" class=\"btn-danger\" value=\"entfernen\" name=\"button\" formaction=\"menu.jsp\">\r\n");
      out.write("        </form>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <a href=\"kunden.jsp\">weiter zu den Kunden</a>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
