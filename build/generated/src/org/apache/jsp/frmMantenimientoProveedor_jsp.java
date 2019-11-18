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

public final class frmMantenimientoProveedor_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>simplestyle_4 - examples</title>\r\n");
      out.write("        <meta name=\"description\" content=\"website description\" />\r\n");
      out.write("        <meta name=\"keywords\" content=\"website keywords, website keywords\" />\r\n");
      out.write("        <meta http-equiv=\"content-type\" content=\"text/html; charset=windows-1252\" />\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"style/style.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"archivos/css/styles_1.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li><a class=\"active\" href=\"frmMantenimientoProveedor.jsp\">PROVEEDORES</a></li>\r\n");
      out.write("            <li><a href=\"#productos\">PRODUCTOS</a></li>\r\n");
      out.write("            <li><a href=\"#contact\">DETALLES</a></li>\r\n");
      out.write("            <li><a href=\"#marca\">MARCA</a></li>\r\n");
      out.write("            <li><a href=\"#presentacion\">PRESENTACION</a></li>\r\n");
      out.write("            <li><a href=\"#pedido\">PEDIDO</a></li>\r\n");
      out.write("            <li style=\"float:right\"><a href=\"#distribuidora\">DISTRIBUIDORA RUIZ. LIBERIA-GUANACASTE</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <H3 align=\"center\">Mantenimiento Proveedores</H3>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"center\">  <form name=\"f1\" action=\"frmMantenimientoProveedor.jsp\">\r\n");
      out.write("                ");

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
                                    vresult = proveedor.GuardarProveedor(vIDPROVEEDOR, vNOMBRE, vDIRECCION, vTELEFONO, vCORREO_ELECTRONICO, Date.valueOf(vFECHA_REGISTRO), vPAIS, vCEDULA_JURIDICA);
                                    proveedor.desconectar();
                                    if (vresult.equals("S")) {

                                        System.out.println("<script>alert('Guardado');</script>");

                                    } else {
                                        System.out.println("<script>alert('" + vresult + "');</script>");

                                    }
                                    //empleado.GuardarEmpleado(vEmployeeID, vFirstName, vLastName, vTitle, vBirthDate, vAddress, vCity, vHomePhone);
                                    break;

                                case "e":
                                    vresult = proveedor.ModificarProveedor(vIDPROVEEDOR, vNOMBRE, vDIRECCION, vTELEFONO, vCORREO_ELECTRONICO, Date.valueOf(vFECHA_REGISTRO), vPAIS, vCEDULA_JURIDICA);
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

                
      out.write("\r\n");
      out.write("                <table >\r\n");
      out.write("                    <caption>Datos del Proveedor</caption>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td> <label for=\"proveedor\">IDProveedor</label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtIDPROVEEDOR\" value=\"");
      out.print(vIDPROVEEDOR);
      out.write("\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"nombre\">Nombre </label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtNOMBRE\" value=\"");
      out.print(vNOMBRE);
      out.write("\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"dir\">Dirección</label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtDIRECCION\" value=\"");
      out.print(vDIRECCION);
      out.write("\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"Tel\">Teléfono</label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtTELEFONO\" value=\"");
      out.print( vTELEFONO);
      out.write("\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"correo\">Correo Electrónico</label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtCORREO_ELECTRONICO\" value=\"");
      out.print(vCORREO_ELECTRONICO);
      out.write("\" ></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"fecha\">Fecha Registro</label></td><td><input id=\"rcorners1\" type=\"date\" name=\"TxtFECHA_REGISTRO\" value=\"");
      out.print( vFECHA_REGISTRO);
      out.write("\" ></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"pais\">País</label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtPAIS\" value=\"");
      out.print(vPAIS);
      out.write("\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><label for=\"ced\">Cédula Jurídica</label></td><td><input id=\"rcorners1\" type=\"text\" name=\"TxtCEDULA_JURIDICA\" value=\"");
      out.print(vCEDULA_JURIDICA);
      out.write("\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td colspan=\"2\">\r\n");
      out.write("                            <!-- <input type=\"button\" name=\"btop\" src=\"archivos/img/save.png\"   id=\"Guradar\">-->\r\n");
      out.write("                            <button  name=\"btnop\" value=\"s\" ><img src=\"archivos/img/save.png\"><br>  Guardar  </button>\r\n");
      out.write("                            <button  name=\"btnop\" value=\"e\" ><img src=\"archivos/img/edit.png\"><br>  Modificar </button>\r\n");
      out.write("                            <button  name=\"btnop\" value=\"f\" ><img src=\"archivos/img/find.png\"><br>  Buscar </button>\r\n");
      out.write("                            <button  name=\"btnop\" value=\"d\" ><img src=\"archivos/img/delete.png\"><br>    Eliminar </button>\r\n");
      out.write("                        </td>\r\n");
      out.write("\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </table>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"center1\">  \r\n");
      out.write("            <table class=\"greenTable\">\r\n");
      out.write("\r\n");
      out.write("                <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th>Id Proveedor</th>\r\n");
      out.write("                        <th>Nombre</th>\r\n");
      out.write("                        <th>Dirección</th>\r\n");
      out.write("                        <th>Teléfono</th>\r\n");
      out.write("                        <th>Email</th>\r\n");
      out.write("                        <th>Fech Reg.</th>\r\n");
      out.write("                        <th>País</th>\r\n");
      out.write("                        <th>Cédula Jurídica</th>\r\n");
      out.write("                        <th>Acción</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    ");

                        ResultSet rs;

                        try {
                            ClsProveedor vProveedor = new ClsProveedor();
                            vProveedor.Conectar();

                            if (vIDPROVEEDOR.equals("")) {
                                rs = vProveedor.buscarProveedor("a", "Lista");
                            } else if (request.getParameter("btnop").equals("Select")) {
                                rs = vProveedor.buscarProveedor(vIDPROVEEDOR, "C");
                            } else if (request.getParameter("btnop").equals("f")) {
                                rs = vProveedor.buscarProveedor(vIDPROVEEDOR, "N");
                            } else {
                                rs = vProveedor.buscarProveedor("a", "Lista");
                            }

                            while (rs.next()) {
                    
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                <form name=\"formFila\" action=\"frmMantenimientoProveedor.jsp\" method=\"get\">\r\n");
      out.write("                    <td>");
      out.print( rs.getString("IDPROVEEDOR"));
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print( rs.getString("NOMBRE"));
      out.write("</td> \r\n");
      out.write("                    <td>");
      out.print( rs.getString("DIRECCION"));
      out.write("</td> \r\n");
      out.write("                    <td>");
      out.print( rs.getString("TELEFONO"));
      out.write("</td> \r\n");
      out.write("                    <td>");
      out.print( rs.getString("CORREO_ELECTRONICO"));
      out.write("</td> \r\n");
      out.write("                    <td>");
      out.print( rs.getDate("FECHA_REGISTRO"));
      out.write("</td> \r\n");
      out.write("                    <td>");
      out.print( rs.getString("PAIS"));
      out.write("</td> \r\n");
      out.write("                    <td>");
      out.print( rs.getString("CEDULA_JURIDICA"));
      out.write("</td> \r\n");
      out.write("                    <td><input type=\"submit\" name=\"btnop\" value=\"Select\">                  \r\n");
      out.write("\r\n");
      out.write("                        <input type=\"submit\" name=\"btnop\" value=\"X\"></td>\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtIDPROVEEDOR\" value=\"");
      out.print(rs.getString("IDPROVEEDOR"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtNOMBRE\" value=\"");
      out.print(rs.getString("NOMBRE"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtDIRECCION\" value=\"");
      out.print(rs.getString("DIRECCION"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtTELEFONO\" value=\"");
      out.print(rs.getString("TELEFONO"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtCORREO_ELECTRONICO\" value=\"");
      out.print(rs.getString("CORREO_ELECTRONICO"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtFECHA_REGISTRO\" value=\"");
      out.print(rs.getDate("FECHA_REGISTRO"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtPAIS\" value=\"");
      out.print(rs.getString("PAIS"));
      out.write("\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"TxtCEDULA_JURIDICA\" value=\"");
      out.print(rs.getString("CEDULA_JURIDICA"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                        }
                    } catch (Exception Ex) {
                        System.out.println(" " + Ex.getMessage());
                    }
                
      out.write("\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
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
