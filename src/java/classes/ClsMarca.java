/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Manyor
 */
public class ClsMarca extends ClsConexion {

    int Marca;
    String Nombre;

    public ClsMarca() {
        super();
    }

    public ResultSet buscarMarcas() {
        try {
            obj_Procedimiento = Conexion.prepareCall("{CALL StpBuscarMarcas()}");
            Registro = obj_Procedimiento.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ClsProductos.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Registro;
    }
}
