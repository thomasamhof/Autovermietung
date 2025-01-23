package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.autovermietung.*;
import java.io.*;
import java.util.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public final class autosBearbeiten_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("   ");
 Properties props; 
    InitialContext ctx=null;
  
    props = new Properties(); 
    try { 
        ctx = new InitialContext(props); 
    } catch (NamingException ex) { 
            ex.printStackTrace(); 
    } 
    
    AutovermietungSessionBeanRemote bean=(AutovermietungSessionBeanRemote)ctx.lookup("AutovermietungSessionBean/remote");
    int autoId=Integer.parseInt(request.getParameter("autos"));
    String button=request.getParameter("button");
     Auto auto=new Auto();
     auto=bean.getAuto(autoId); 
       
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("         <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"AutovermietungCSS.css\">\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
 if (button.equals("bearbeiten")) { 
      out.write("\r\n");
      out.write("        <h2>Auto bearbeiten</h2>\r\n");
      out.write("        <form action=\"verarbeiten.jsp\" method=\"post\">\r\n");
      out.write("            <table>\r\n");
      out.write("                <tr><td>bisherige Bezeichnung</td><td><input type=\"text\" name=\"name\" value=\"");
      out.print(auto.getBez());
      out.write("\"></td></tr>\r\n");
      out.write("            <tr><td>bisherige Farbe</td><td><input type=\"text\" name=\"farbe\" value=\"");
      out.print(auto.getFarbe());
      out.write("\"></td></tr>\r\n");
      out.write("            <tr><td><input type=\"submit\" class=\"btn-primary\" name=\"button\" value=\"aendern\"></td></tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <input hidden=\"true\" type=\"text\" name=\"autoId\" value=\"");
      out.print(autoId+"");
      out.write("\">\r\n");
      out.write("        </form> \r\n");
      out.write("        ");
 } else if (button.equals("verleihen")) {
      out.write("\r\n");
      out.write("            <h2>An wen soll dieses Auto vermietet werden</h2>\r\n");
      out.write("        <form action=\"verarbeiten.jsp\" method=\"post\"> \r\n");
      out.write("            <table>\r\n");
      out.write("                <tr><td>");
      out.print(auto);
      out.write("</td></tr>\r\n");
      out.write("                <tr><td><select name=\"kunde\">\r\n");
      out.write("            ");
 for (Object x : bean.getKunden()) { 
      out.write("\r\n");
      out.write("            <option value=\"");
      out.print(((Kunde)x).getid());
      out.write('"');
      out.write('>');
      out.print( (Kunde)x );
      out.write("</option>       \r\n");
      out.write("             ");
  } 
      out.write("\r\n");
      out.write("            </select>\r\n");
      out.write("            <input type=\"submit\" class=\"btn-primary\" name=\"button\" value=\"verleihen\"></td></tr>\r\n");
      out.write("            </table>\r\n");
      out.write("             <input hidden=\"true\" type=\"text\" name=\"autoId\" value=\"");
      out.print(autoId+"");
      out.write("\">\r\n");
      out.write("        </form>\r\n");
      out.write("            ");
 } 
      out.write("     \r\n");
      out.write("    </body>\r\n");
      out.write("</html>  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
