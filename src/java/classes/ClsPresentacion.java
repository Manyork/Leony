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
public class ClsPresentacion extends ClsConexion {

    int IDPRESENTACION;
    String PRESENTACION;

   public ClsPresentacion(){
   super();
   }
    public ResultSet buscarPresentacion() {

        try {
            obj_Procedimiento = Conexion.prepareCall("{CALL StpBuscarPresentaciones()}");
            Registro = obj_Procedimiento.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ClsProductos.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Registro;
    }

    public int getIDPRESENTACION() {
        return IDPRESENTACION;
    }

    public void setIDPRESENTACION(int IDPRESENTACION) {
        this.IDPRESENTACION = IDPRESENTACION;
    }

    public String getPRESENTACION() {
        return PRESENTACION;
    }

    public void setPRESENTACION(String PRESENTACION) {
        this.PRESENTACION = PRESENTACION;
    }
    
    
}
