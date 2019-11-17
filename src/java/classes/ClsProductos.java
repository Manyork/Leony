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

//public class ClsProductos {
    
  public class ClsProductos extends ClsConexion{

    public ClsProductos() {
        super();
    }
    
     public ResultSet buscarProducto(String pBuscar, String pTipoBusqueda) {
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{CALL StpBuscarProducto(?,?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pBuscar);
            obj_Procedimiento.setString(2, pTipoBusqueda);
            // se ejecuta retornando el resultado en Registro
            Registro = obj_Procedimiento.executeQuery();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ClsProductos.class.getName()).log(Level.SEVERE, null, ex);
        }


        return Registro;
    }
     
     
      public ResultSet buscarProducto2(String pBuscar) {
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{CALL StpBuscarProducto(?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pBuscar);
            // se ejecuta retornando el resultado en Registro
            Registro = obj_Procedimiento.executeQuery();
         
        } catch (SQLException ex) {
            Logger.getLogger(ClsProductos.class.getName()).log(Level.SEVERE, null, ex);
        }


        return Registro;
    }
      
    
}
