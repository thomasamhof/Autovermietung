package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.autovermietung.*;
import java.io.*;
import java.util.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public final class kunden_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    String name=request.getParameter("text");
    String button=request.getParameter("button");
    try {
          if (!name.equals("Neuer Kunde") && name.matches("[a-zA-Z ]+") && button.equals("anlegen")){
                Kunde kunde=new Kunde();
                kunde.setName(name);
                bean.addKunde(kunde); 
            }
        } catch (NullPointerException npe) {
        }

    List<Kunde> liste;
    liste=bean.getKunden();
 
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"AutovermietungCSS.css\">\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Kundenliste</h1>\r\n");
      out.write("        <form action=\"kunden.jsp\" method=\"get\">\r\n");
      out.write("            <input type=\"text\" name=\"text\" value=\"Neuer Kunde\">\r\n");
      out.write("            <input type=\"submit\" name=\"button\" value=\"anlegen\">\r\n");
      out.write("            <input type=\"submit\" name=\"button\" value=\"loeschen\">\r\n");
      out.write("        </form>\r\n");
      out.write("        <br>\r\n");
      out.write("        <table border=\"1\">\r\n");
      out.write("            <th width=\"150\">Name</th><th width=\"100\">Kdnr</th>\r\n");
      out.write("        ");
 for (Kunde x : liste) { 
      out.write("\r\n");
      out.write("            <tr><td>");
      out.print( x.getName() );
      out.write("</td><td>");
      out.print( x.getid() );
      out.write("</td></tr>     \r\n");
      out.write("             ");
  } 
      out.write("  \r\n");
      out.write("        </table>\r\n");
      out.write("        <br>\r\n");
      out.write("        <a href=\"menu.jsp\">zum Menü</a>\r\n");
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
