<%--
    Document   : index
    Created on : 15-jul-2019, 22:48:03
    Author     : leony1
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="classes.ClsProveedor"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
    <head>
        <title>Hello world from JSP</title>
        <!-- style css -->
        <link rel="stylesheet" href="archivos/css/styles_1.css">
    </head>
    <body>

        <ul>
            <li><a class="active" href="frmMantenimientoProveedor.jsp">PROVEEDORES</a></li>
            <li><a href="#productos">PRODUCTOS</a></li>
            <li><a href="#contact">DETALLES</a></li>
            <li><a href="#marca">MARCA</a></li>
            <li><a href="#presentacion">PRESENTACION</a></li>
            <li><a href="#pedido">PEDIDO</a></li>
            <li style="float:right"><a href="#distribuidora">DISTRIBUIDORA RUIZ. LIBERIA-GUANACASTE</a></li>
        </ul>
        <H3 align="center">Mantenimiento Proveedores</H3>


        <div class="center">  <form name="f1" action="frmMantenimientoProveedor.jsp">
                <%
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

                %>
                <table >
                    <caption>Datos del Proveedor</caption>
                    <tr>
                        <td> <label for="proveedor">IDProveedor</label></td><td><input id="rcorners1" type="text" name="TxtIDPROVEEDOR" value="<%=vIDPROVEEDOR%>"></td>
                    </tr>
                    <tr>
                        <td><label for="nombre">Nombre </label></td><td><input id="rcorners1" type="text" name="TxtNOMBRE" value="<%=vNOMBRE%>"></td>
                    </tr>
                    <tr>
                        <td><label for="dir">Dirección</label></td><td><input id="rcorners1" type="text" name="TxtDIRECCION" value="<%=vDIRECCION%>"></td>
                    </tr>
                    <tr>
                        <td><label for="Tel">Teléfono</label></td><td><input id="rcorners1" type="text" name="TxtTELEFONO" value="<%= vTELEFONO%>"></td>
                    </tr>
                    <tr>
                        <td><label for="correo">Correo Electrónico</label></td><td><input id="rcorners1" type="text" name="TxtCORREO_ELECTRONICO" value="<%=vCORREO_ELECTRONICO%>" ></td>
                    </tr>
                    <tr>
                        <td><label for="fecha">Fecha Registro</label></td><td><input id="rcorners1" type="date" name="TxtFECHA_REGISTRO" value="<%= vFECHA_REGISTRO%>" ></td>
                    </tr>
                    <tr>
                        <td><label for="pais">País</label></td><td><input id="rcorners1" type="text" name="TxtPAIS" value="<%=vPAIS%>"></td>
                    </tr>
                    <tr>
                        <td><label for="ced">Cédula Jurídica</label></td><td><input id="rcorners1" type="text" name="TxtCEDULA_JURIDICA" value="<%=vCEDULA_JURIDICA%>"></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <!-- <input type="button" name="btop" src="archivos/img/save.png"   id="Guradar">-->
                            <button  name="btnop" value="s" ><img src="archivos/img/save.png"><br>  Guardar  </button>
                            <button  name="btnop" value="e" ><img src="archivos/img/edit.png"><br>  Modificar </button>
                            <button  name="btnop" value="f" ><img src="archivos/img/find.png"><br>  Buscar </button>
                            <button  name="btnop" value="d" ><img src="archivos/img/delete.png"><br>    Eliminar </button>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
        <div class="center1">  
            <table class="greenTable">

                <thead>
                    <tr>
                        <th>Id Proveedor</th>
                        <th>Nombre</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                        <th>Fech Reg.</th>
                        <th>País</th>
                        <th>Cédula Jurídica</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                <%
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
                %>
                <tr>
                <form name="formFila" action="frmMantenimientoProveedor.jsp" method="get">
                    <td><%= rs.getString("IDPROVEEDOR")%></td>
                    <td><%= rs.getString("NOMBRE")%></td> 
                    <td><%= rs.getString("DIRECCION")%></td> 
                    <td><%= rs.getString("TELEFONO")%></td> 
                    <td><%= rs.getString("CORREO_ELECTRONICO")%></td> 
                    <td><%= rs.getDate("FECHA_REGISTRO")%></td> 
                    <td><%= rs.getString("PAIS")%></td> 
                    <td><%= rs.getString("CEDULA_JURIDICA")%></td> 
                    <td><input type="submit" name="btnop" value="Select">                  

                        <input type="submit" name="btnop" value="X"></td>
                    <input type="hidden" name="TxtIDPROVEEDOR" value="<%=rs.getString("IDPROVEEDOR")%>">
                    <input type="hidden" name="TxtNOMBRE" value="<%=rs.getString("NOMBRE")%>">
                    <input type="hidden" name="TxtDIRECCION" value="<%=rs.getString("DIRECCION")%>">
                    <input type="hidden" name="TxtTELEFONO" value="<%=rs.getString("TELEFONO")%>">
                    <input type="hidden" name="TxtCORREO_ELECTRONICO" value="<%=rs.getString("CORREO_ELECTRONICO")%>">
                    <input type="hidden" name="TxtFECHA_REGISTRO" value="<%=rs.getDate("FECHA_REGISTRO")%>">
                    <input type="hidden" name="TxtPAIS" value="<%=rs.getString("PAIS")%>">
                    <input type="hidden" name="TxtCEDULA_JURIDICA" value="<%=rs.getString("CEDULA_JURIDICA")%>">

                </form>
                </tr>
                <%
                        }
                    } catch (Exception Ex) {
                        System.out.println(" " + Ex.getMessage());
                    }
                %>
                </tbody>
            </table>

        </div>
    </body>
</html>
