package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import classes.ClsProveedor;
import java.sql.*;
import javax.sql.*;
import java.io.*;
import javax.naming.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Hello world from JSP</title>\n");
      out.write("        <!-- style css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"archivos/css/styles.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form name=\"f1\" action=\"index.jsp\">\n");
      out.write("            ");

                String vresult = "";
                String vIDPROVEEDOR = request.getParameter("TxtIDPROVEEDOR");
                String vNOMBRE = request.getParameter("TxtNOMBRE");
                String vDIRECCION = request.getParameter("TxtDIRECCION");
                String vTELEFONO = request.getParameter("TxtTELEFONO");
                String vCORREO_ELECTRONICO = request.getParameter("TxtCORREO_ELECTRONICO");
                String vFECHA_REGISTRO = request.getParameter("TxtFECHA_REGISTRO");
                String vPAIS = request.getParameter("TxtPAIS");
                String vCEDULA_JURIDICA = request.getParameter("TxtCEDULA_JURIDICA");

                try {
                    if (vIDPROVEEDOR.equals("null")) {
                    } else {
                        ClsProveedor proveedor = new ClsProveedor();
                        proveedor.Conectar();
                        switch (request.getParameter("btnop")) {
                            case "s":
                                vresult = proveedor.GuardarProveedor(vIDPROVEEDOR, vNOMBRE, vDIRECCION, vTELEFONO, vCORREO_ELECTRONICO,vFECHA_REGISTRO, vPAIS, vCEDULA_JURIDICA);
                                proveedor.desconectar();
                                if (vresult.equals("S")) {

                                    System.out.println("<script>alert('Guardado');</script>");

                                } else {
                                    System.out.println("<script>alert('" + vresult + "');</script>");

                                }
                                //empleado.GuardarEmpleado(vEmployeeID, vFirstName, vLastName, vTitle, vBirthDate, vAddress, vCity, vHomePhone);
                                break;

                            case "e":
                                vresult = proveedor.ModificarProveedor(vIDPROVEEDOR, vNOMBRE, vDIRECCION, vTELEFONO, vCORREO_ELECTRONICO,vFECHA_REGISTRO, vPAIS, vCEDULA_JURIDICA);
                                proveedor.desconectar();
                                break;

                            case "d":
                                vresult = proveedor.EliminarProveedor(vIDPROVEEDOR);
                                proveedor.desconectar();
                                break;

                            case "f":
                                break;

                            case "Select":

                                break;
                        }
                    }

                } catch (Exception Ex) {
                    vIDPROVEEDOR = "";
                    vNOMBRE = "";
                    System.out.println("<script>alert('" + Ex + " " + vresult + "');</script>");
                }

            
      out.write("\n");
      out.write("            <table >\n");
      out.write("                <tr>\n");
      out.write("                    <td>IDProveedor :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtIDPROVEEDOR\" value=\"");
      out.print(vIDPROVEEDOR);
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Nombre :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtNOMBRE\" value=\"");
      out.print(vNOMBRE);
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Dirección :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtDIRECCION\" value=\"");
      out.print(vDIRECCION);
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Teléfono :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtTELEFONO\" value=\"");
      out.print( vTELEFONO);
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Correo Electrónico :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtCORREO_ELECTRONICO\" value=\"");
      out.print(vCORREO_ELECTRONICO);
      out.write("\" ></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Fecha Regitro :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtFECHA_REGISTRO\" value=\"");
      out.print( vFECHA_REGISTRO);
      out.write("\" ></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>País :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtPAIS\" value=\"");
      out.print(vPAIS);
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Cédula Jurídica :</td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtCEDULA_JURIDICA\" value=\"");
      out.print(vCEDULA_JURIDICA);
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\">\n");
      out.write("                        <!-- <input type=\"button\" name=\"btop\" src=\"archivos/img/save.png\"   id=\"Guradar\">-->\n");
      out.write("                        <button  name=\"btnop\" value=\"s\" ><img src=\"archivos/img/save.png\"><br>  Guradar  </button>\n");
      out.write("                        <button  name=\"btnop\" value=\"e\" ><img src=\"archivos/img/edit.png\"><br>  Modificar </button>\n");
      out.write("                        <button  name=\"btnop\" value=\"f\" ><img src=\"archivos/img/find.png\"><br>  Buscar </button>\n");
      out.write("                        <button  name=\"btnop\" value=\"d\" ><img src=\"archivos/img/delete.png\"><br>    Eliminar </button>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <div style=\"max-height: 150px; width: 400px; overflow-y: scroll;\">\n");
      out.write("            <table border=\"1\" >\n");
      out.write("                <tr>\n");
      out.write("                    <td>Cedula</td><td>Nombre</td><td>Apellido</td><td>Accion</td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    ResultSet rs;

                    try {
                        ClsProveedor vProveedor = new ClsProveedor();
                        vProveedor.Conectar();

                        if (vIDPROVEEDOR.equals("")) {
                            rs = vProveedor.buscarProveedor("a", "Lista");
                        } else if (request.getParameter("btnop").equals("Select")) {
                            rs = vProveedor.buscarProveedor(vIDPROVEEDOR, "C");
                        } else {
                            rs = vProveedor.buscarProveedor("a", "Lista");
                        }

                        while (rs.next()) {
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                <form name=\"formFila\" action=\"index.jsp\" method=\"get\">\n");
      out.write("                    <td>");
      out.print( rs.getString("IDPROVEEDOR"));
      out.write("</td><td>");
      out.print( rs.getString("NOMBRE"));
      out.write("</td> <td>");
      out.print( rs.getString("DIRECCION"));
      out.write("</td> <td><input type=\"submit\" name=\"btnop\" value=\"Select\"> <input type=\"submit\" name=\"btnop\" value=\"X\"></td>\n");
      out.write("                    <input type=\"hidden\" name=\"TxtIDPROVEEDOR\" value=\"");
      out.print(rs.getString("IDPROVEEDOR"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtNOMBRE\" value=\"");
      out.print(rs.getString("NOMBRE"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtDIRECCION\" value=\"");
      out.print(rs.getString("DIRECCION"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtTELEFONO\" value=\"");
      out.print(rs.getString("TELEFONO"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtCOREEO_ELECTRONICO\" value=\"");
      out.print("" + rs.getString("COREEO_ELECTRONICO"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtFECHA_REGISTRO\" value=\"");
      out.print(rs.getString("FECHA_REGISTRO"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtPAIS\" value=\"");
      out.print(rs.getString("PAIS"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"TxtCEDULA_JURIDICA\" value=\"");
      out.print(rs.getString("CEDULA_JURIDICA"));
      out.write("\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                </form>\n");
      out.write("                </tr>\n");
      out.write("                ");

                        }
                    } catch (Exception Ex) {
                        System.out.println(" " + Ex.getMessage());
                    }
                
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
