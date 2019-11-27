<%--
    Document   : index
    Created on : 15-jul-2019, 22:48:03
    Author     : leony1
--%>


<%@page import="classes.ClsProductos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.ClsProveedor"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
    <head>
        <title>DISTRIBUIDORA RUIZ.</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
        <link rel="stylesheet" type="text/css" href="archivos/css/style.css" />
        <link rel="stylesheet" href="archivos/css/styles_1.css">
    </head>
    <body>
        <div id="main">
            <div id="header">
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <h1><a href="index.html">DISTRIBUIDORA<span class="logo_colour">RUIZ.</span></a></h1>
                        <h2>Liberia Gte</h2>
                    </div>
                </div>
                <div id="menubar">
                    <ul id="menu">
                        <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
                        <li class="selected"><a href="index.html">Home</a></li>
                        <li><a href="frmMantenimientoProveedor.jsp">PROVEEDORES</a></li>
                        <li><a class="active" href="frmMantenimientoProductos.jsp">PRODUCTOS</a></li>
                        <li><a href="#contact">DETALLES</a></li>
                        <li><a href="#marca">MARCA</a></li>
                        <li><a href="frmMantenimientoClientes.jsp">CLIENTES</a></li>
                    </ul>
                </div>
            </div>
            <div id="content_header"></div>
            <div id="site_content">
                <form name="f1" action="frmMantenimientoProductos.jsp">
                    <%
                        String vresult = "";
                        String vIDPRODUCTO = "";
                        String vNOMBRE = "";
                        String vDESCRIPCION = "";
                        String vPRECIO_UND = "";
                        String vSTOCK = "";
                        String vPESO = "";
                        String vPRESENTACION = "";
                        String vMARCA = "";
                        String vPROVEEDOR = "";

                        try {

                            vresult = "";
                            vIDPRODUCTO = request.getParameter("TxtIDPRODUCTO");
                            vNOMBRE = request.getParameter("TxtNOMBRE");
                            vDESCRIPCION = request.getParameter("TxtDESCRIPCION");
                            vPRECIO_UND = request.getParameter("TxtPRECIO_UND");
                            vSTOCK = request.getParameter("TxtSTOCK");
                            vPESO = request.getParameter("TxtPESO");
                            vPRESENTACION = request.getParameter("TxtPRESENTACION");
                            vMARCA = request.getParameter("TxtMARCA");
                            vPROVEEDOR = request.getParameter("TxtPROVEEDOR");

                            if (vIDPRODUCTO.equals("null")) {

                            } else {
                                ClsProductos producto = new ClsProductos();
                                producto.Conectar();
                                switch (request.getParameter("btnop")) {
                                    case "s":
                                        vresult = producto.GuardarProductos(vIDPRODUCTO, vNOMBRE, vDESCRIPCION, Float.parseFloat(vPRECIO_UND), Integer.parseInt(vSTOCK), Float.parseFloat(vPESO), vPRESENTACION, vMARCA, vPROVEEDOR);
                                        producto.desconectar();
                                        if (vresult.equals("S")) {

                                            System.out.println("<script>alert('Guardado');</script>");

                                        } else {
                                            System.out.println("<script>alert('" + vresult + "');</script>");

                                        }
                                        //empleado.GuardarEmpleado(vEmployeeID, vFirstName, vLastName, vTitle, vBirthDate, vAddress, vCity, vHomePhone);
                                        break;

                                    case "e":
                                        vresult = producto.ModificarProductos(vIDPRODUCTO, vNOMBRE, vDESCRIPCION, Float.parseFloat(vPRECIO_UND), Integer.parseInt(vSTOCK), Float.parseFloat(vPESO), vPRESENTACION, vMARCA, vPROVEEDOR);
                                        producto.desconectar();
                                        break;

                                    case "d":
                                        vresult = producto.EliminarProductos(vIDPRODUCTO);
                                        producto.desconectar();
                                        break;

                                    case "f":
                                        break;

                                    case "Select":

                                        break;
                                }
                            }

                        } catch (Exception Ex) {

                            vresult = "";
                            vIDPRODUCTO = "";
                            vNOMBRE = "";
                            vDESCRIPCION = "";
                            vPRECIO_UND = "";
                            vSTOCK = "";
                            vPESO = "";
                            vPRESENTACION = "";
                            vMARCA = "";
                            vPROVEEDOR = "";
                            System.out.println("<script>alert('" + Ex + " " + vresult + "');</script>");
                        }

                    %>

                    <div class="tg-wrap">
                        <table class="tg">
                            <tr>
                                <td class="tg-0lax" colspan="6">
                                    Datos de los Productos
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax"><label for="IdProducti">IdProducto</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="text" name="TxtIDPRODUCTO" value="<%=vIDPRODUCTO%>" required></td>
                                <td class="tg-0lax"><label for="nombre">Nombre</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="text" name="TxtNOMBRE" value="<%=vNOMBRE%>" required></td>
                                <td class="tg-0lax"><label for="descripcion">Descripcion</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="text" name="TxtDESCRIPCION" value="<%=vDESCRIPCION%>" required></td>
                            </tr>
                            <tr>
                                <td class="tg-0lax"><label for="Tel">Precio Unid</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="float" name="TxtPRECIO_UND" value="<%= vPRECIO_UND%>" required></td>
                                <td class="tg-0lax"><label for="correo">Stock</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="integer" name="TxtSTOCK" value="<%=vSTOCK%>" required></td>
                                <td class="tg-0lax"><label for="Peso">Peso</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="float" name="TxtPESO" value="<%=vPESO%>" required></td>
                            </tr>
                            <tr>
                                <td class="tg-0lax"><label for="Presentacion">Presentacion</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="text" name="TxtPRESENTACION" value="<%=vPRESENTACION%>" required></td>
                                <td class="tg-0lax"><label for="Marca">Marca</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="text" name="TxtMARCA" value="<%=vMARCA%>" required></td>
                                <td class="tg-0lax"><label for="Prov">Proveedor</label></td>
                                <td class="tg-0lax"><input id="rcorners1" type="text" name="TxtPROVEEDOR" value="<%=vPROVEEDOR%>" required></td>
                            </tr>
                            <tr>
                                <td class="tg-0lax" colspan="6">
                                    <button  name="btnop" value="s" ><img src="archivos/img/save.png"><br>  Guardar  </button>
                                    <button  name="btnop" value="e" ><img src="archivos/img/edit.png"><br>  Modificar </button>
                                    <button  name="btnop" value="f" ><img src="archivos/img/find.png"><br>  Buscar </button>
                                    <button  name="btnop" value="d" ><img src="archivos/img/delete.png"><br>    Eliminar </button>
                                </td>
                            </tr>
                        </table></div>
                </form>



                <div class="tg-wrap">
                    <table id="tg-CAk3z" class="tg">

                        <thead>
                            <tr>
                                <th class="tg-0lax">IdProducto</th>
                                <th class="tg-0lax">Nombre</th>
                                <th class="tg-0lax">Descripcion</th>
                                <th class="tg-0lax">Precio Unid</th>
                                <th class="tg-0lax">Stock</th>
                                <th class="tg-0lax">Peso</th>
                                <th class="tg-0lax">Presentacion</th>
                                <th class="tg-0lax">Marca</th>
                                <th class="tg-0lax">Proveedor</th>
                                <th class="tg-0lax">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs;

                                try {
                                    ClsProductos vProducto = new ClsProductos();
                                    vProducto.Conectar();

                                    if (vIDPRODUCTO.equals("")) {
                                        rs = vProducto.buscarProductos("a", "Lista");
                                    } else if (request.getParameter("btnop").equals("Select")) {
                                        rs = vProducto.buscarProductos(vIDPRODUCTO, "C");
                                    } else if (request.getParameter("btnop").equals("f")) {
                                        rs = vProducto.buscarProductos(vIDPRODUCTO, "N");
                                    } else {
                                        rs = vProducto.buscarProductos("a", "Lista");
                                    }

                                    while (rs.next()) {
                            %>
                            <tr>
                        <form name="formFila" action="frmMantenimientoProductos.jsp" method="get">
                            <td class="tg-0lax"><%= rs.getString("IDPRODUCTO")%></td>
                            <td class="tg-0lax"><%= rs.getString("NOMBRE")%></td> 
                            <td class="tg-0lax"><%= rs.getString("DESCRIPCION")%></td> 
                            <td class="tg-0lax"><%= rs.getFloat("PRECIO_UND")%></td> 
                            <td class="tg-0lax"><%= rs.getInt("STOCK")%></td> 
                            <td class="tg-0lax"><%= rs.getFloat("PESO")%></td> 
                            <td class="tg-0lax"><%= rs.getString("PRESENTACION")%></td>
                            <td class="tg-0lax"><%= rs.getString("MARCA")%></td> 
                            <td class="tg-0lax"><%= rs.getString("PROVEEDOR")%></td> 
                            <td class="tg-0lax"><input type="submit" name="btnop" value="Select">                  

                                <input type="submit" name="btnop" value="X"></td>
                            <input type="hidden" name="TxtIDPRODUCTO" value="<%=rs.getString("IDPRODUCTO")%>">
                            <input type="hidden" name="TxtNOMBRE" value="<%=rs.getString("NOMBRE")%>">
                            <input type="hidden" name="TxtDESCRIPCION" value="<%=rs.getString("DESCRIPCION")%>">
                            <input type="hidden" name="TxtPRECIO_UND" value="<%=rs.getFloat("PRECIO_UND")%>">
                            <input type="hidden" name="TxtSTOCK" value="<%=rs.getInt("STOCK")%>">
                            <input type="hidden" name="TxtPESO" value="<%=rs.getFloat("PESO")%>">
                            <input type="hidden" name="TxtPRESENTACION" value="<%=rs.getString("PRESENTACION")%>">
                            <input type="hidden" name="TxtMARCA" value="<%=rs.getString("MARCA")%>">
                            <input type="hidden" name="TxtPROVEEDOR" value="<%=rs.getString("PROVEEDOR")%>">
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
                <script charset="utf-8">var TGSort = window.TGSort || function(n){"use strict"; function r(n){return n.length}function t(n, t){if (n)for (var e = 0, a = r(n); a > e; ++e)t(n[e], e)}function e(n){return n.split("").reverse().join("")}function a(n){var e = n[0]; return t(n, function(n){for (; !n.startsWith(e); )e = e.substring(0, r(e) - 1)}), r(e)}function o(n, r){return - 1 != n.map(r).indexOf(!0)}function u(n, r){return function(t){var e = ""; return t.replace(n, function(n, t, a){return e = t.replace(r, "") + "." + (a || "").substring(1)}), l(e)}}function i(n){var t = l(n); return!isNaN(t) && r("" + t) + 1 >= r(n)?t:NaN}function s(n){var e = []; return t([i, m, g], function(t){var a; r(e) || o(a = n.map(t), isNaN) || (e = a)}), e}function c(n){var t = s(n); if (!r(t)){var o = a(n), u = a(n.map(e)), i = n.map(function(n){return n.substring(o, r(n) - u)}); t = s(i)}return t}function f(n){var r = n.map(Date.parse); return o(r, isNaN)?[]:r}function v(n, r){r(n), t(n.childNodes, function(n){v(n, r)})}function d(n){var r, t = [], e = []; return v(n, function(n){var a = n.nodeName; "TR" == a?(r = [], t.push(r), e.push(n)):("TD" == a || "TH" == a) && r.push(n)}), [t, e]}function p(n){if ("TABLE" == n.nodeName){for (var e = d(n), a = e[0], o = e[1], u = r(a), i = u > 1 && r(a[0]) < r(a[1])?1:0, s = i + 1, v = a[i], p = r(v), l = [], m = [], g = [], h = s; u > h; ++h){for (var N = 0; p > N; ++N){r(m) < p && m.push([]); var T = a[h][N], C = T.textContent || T.innerText || ""; m[N].push(C.trim())}g.push(h - s)}var L = "tg-sort-asc", E = "tg-sort-desc", b = function(){for (var n = 0; p > n; ++n){var r = v[n].classList; r.remove(L), r.remove(E), l[n] = 0}}; t(v, function(n, t){l[t] = 0; var e = n.classList; e.add("tg-sort-header"), n.addEventListener("click", function(){function n(n, r){var t = d[n], e = d[r]; return t > e?a:e > t? - a:a * (n - r)}var a = l[t]; b(), a = 1 == a? - 1: + !a, a && e.add(a > 0?L:E), l[t] = a; var i = m[t], v = function(n, r){return a * i[n].localeCompare(i[r]) || a * (n - r)}, d = c(i); (r(d) || r(d = f(i))) && (v = n); var p = g.slice(); p.sort(v); for (var h = null, N = s; u > N; ++N)h = o[N].parentNode, h.removeChild(o[N]); for (var N = s; u > N; ++N)h.appendChild(o[s + p[N - s]])})})}}var l = parseFloat, m = u(/^(?:\s*)([+-]?(?:\d+)(?:,\d{3})*)(\.\d*)?$/g, /,/g), g = u(/^(?:\s*)([+-]?(?:\d+)(?:\.\d{3})*)(,\d*)?$/g, /\./g); n.addEventListener("DOMContentLoaded", function(){for (var t = n.getElementsByClassName("tg"), e = 0; e < r(t); ++e)try{p(t[e])} catch (a){}})}(document);</script>

            </div>
            <div id="content_footer"></div>
            <div id="footer">
                <p><a href="index.html">Home</a> </p>
                <p>Copyright &copy; 2019 | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </p>
            </div>
        </div>
    </body>
</html>
