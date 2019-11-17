/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;


import static java.lang.System.out;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ClsConexion {
    
    //Atributos de la clase
  protected Connection Conexion  = null;
  protected CallableStatement obj_Procedimiento = null;
  protected Statement objeto;
  public ResultSet Registro;
  //Metodos publicos de la clase ConexcionBD
  //Constructor default
   public ClsConexion (){

       
    }//===================Fin constructor default===============================
  //Establece conexion
    public void Conectar () throws SQLException
    {
        try { //Driver para para mySQL
            
            
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Error de driver "+ex.getMessage());
            Logger.getLogger(ClsConexion.class.getName()).log(Level.SEVERE, null, ex);
        }//Establece la conección con la bd usuario y clave correctas
        try {
            //Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dbsupermercado", "root", "xxx");
             //Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dbsupermercado", "root", "root");
            Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventario", "root", "Dario501");
             //Conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dbsupermercado099", "root", "root");
           out.println("Conexion Exitosa");
        } catch (SQLException ex) {
            System.out.println("Error con direccion de bd "+ex.getMessage());
            Logger.getLogger(ClsConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//===================Fin del método Conectar===============================
    //establece desconexion
     public void desconectar (){
        try {
            Registro.close();
             System.out.println("Desconexion Exitosa");
        } catch (SQLException ex) {
            System.out.println("Error al desconectar "+ex.getMessage());
            Logger.getLogger(ClsConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//===================Fin método desconectar===============================
    
}
