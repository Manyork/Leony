<%--
    Document   : index
    Created on : 15-jul-2019, 22:48:03
    Author     : leony1
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="classes.ClsProveedor"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
        <style>
        ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
  border-right:1px solid #bbb;
}

li:last-child {
  border-right: none;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
        }
        
        
        .dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}
        

img {
  border-radius: 50%;
  display:block;
  margin: auto;
  
}
        
    </style>
    <head>
        <title>Hello world from JSP</title>
        <!-- style css -->
        <link rel="stylesheet" href="archivos/css/styles.css">
    </head>
    <body>
        
        
    <ul>
        <li><a class="active" href="index.jsp">PROVEEDORES</a></li>
        <li><a href="#productos">PRODUCTOS</a></li>
        <li><a href="#contact">DETALLES</a></li>
        <li><a href="#marca">MARCA</a></li>
        <li><a href="#presentacion">PRESENTACION</a></li>
        <li><a href="#pedido">PEDIDO</a></li>
        <li style="float:right"><a href="#distribuidora">DISTRIBUIDORA RUIZ. LIBERIA-GUANACASTE</a></li>
    </ul>
    
    
 <img src= "archivos/img/ruiz.jpg" alt="ruiz" width="300" height="300">
    


        <form name="f1" action="index.jsp">
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
                                vresult = proveedor.GuardarProveedor(vIDPROVEEDOR, vNOMBRE, vDIRECCION, vTELEFONO, vCORREO_ELECTRONICO,Date.valueOf(vFECHA_REGISTRO), vPAIS, vCEDULA_JURIDICA);
                                proveedor.desconectar();
                                if (vresult.equals("S")) {

                                    System.out.println("<script>alert('Guardado');</script>");

                                } else {
                                    System.out.println("<script>alert('" + vresult + "');</script>");

                                }
                                //empleado.GuardarEmpleado(vEmployeeID, vFirstName, vLastName, vTitle, vBirthDate, vAddress, vCity, vHomePhone);
                                break;

                            case "e":
                                vresult = proveedor.ModificarProveedor(vIDPROVEEDOR, vNOMBRE, vDIRECCION, vTELEFONO, vCORREO_ELECTRONICO,Date.valueOf(vFECHA_REGISTRO), vPAIS, vCEDULA_JURIDICA);
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
                <tr>
                    <td>IDProveedor :</td><td><input id="rcorners1" type="text" name="TxtIDPROVEEDOR" value="<%=vIDPROVEEDOR%>"></td>
                </tr>
                <tr>
                    <td>Nombre :</td><td><input id="rcorners1" type="text" name="TxtNOMBRE" value="<%=vNOMBRE%>"></td>
                </tr>
                <tr>
                    <td>Dirección :</td><td><input id="rcorners1" type="text" name="TxtDIRECCION" value="<%=vDIRECCION%>"></td>
                </tr>
                <tr>
                    <td>Teléfono :</td><td><input id="rcorners1" type="text" name="TxtTELEFONO" value="<%= vTELEFONO%>"></td>
                </tr>
                <tr>
                    <td>Correo Electrónico :</td><td><input id="rcorners1" type="text" name="TxtCORREO_ELECTRONICO" value="<%=vCORREO_ELECTRONICO%>" ></td>
                </tr>
                <tr>
                    <td>Fecha Regitro :</td><td><input id="rcorners1" type="date" name="TxtFECHA_REGISTRO" value="<%= vFECHA_REGISTRO%>" ></td>
                </tr>
                <tr>
                    <td>País :</td><td><input id="rcorners1" type="text" name="TxtPAIS" value="<%=vPAIS%>"></td>
                </tr>
                <tr>
                    <td>Cédula Jurídica :</td><td><input id="rcorners1" type="text" name="TxtCEDULA_JURIDICA" value="<%=vCEDULA_JURIDICA%>"></td>
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
        <div style="max-height: 150px; width: 400px; overflow-y: scroll;">
            <table border="1" >
                <tr>
                    <td>IDPROVEEDOR</td><td>NOMBRE</td><td>DIRECCION</td><td>TELEFONO</td><td>CORREO_ELECTRONICO</td><td>FECHA_REGISTRO</td><td>PAIS</td><td>CEDULA_JURIDICA</td><td>Accion</td>
                </tr>
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
                        } 
                        else {
                            rs = vProveedor.buscarProveedor("a", "Lista");
                        }

                        while (rs.next()) {
                %>
                <tr>
                <form name="formFila" action="index.jsp" method="get">
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
            </table>
        </div>
    </body>
</html>
