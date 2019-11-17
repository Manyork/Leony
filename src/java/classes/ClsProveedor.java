/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


//public class ClsProveedor {
    
    public class ClsProveedor extends ClsConexion{
    
    String IDPROVEEDOR;
    String NOMBRE;
    String DIRECCION; 
    String TELEFONO; 
    String CORREO_ELECTRONICO; 
    Date FECHA_REGISTRO; 
    String PAIS; 
    String CEDULA_JURIDICA;
        
    
    public ClsProveedor() {
        super();
    }
    
    
   public String GuardarProveedor(String pIDPROVEEDOR, String pNOMBRE, String pDIRECCION, String pTELEFONO , String pCORREO_ELECTRONICO, Date pFECHA_REGISTRO, String pPAIS, String pCEDULA_JURIDICA) 
      {
         String Respuesta = "N";
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{call StpInsertarProveedor(?,?,?,?,?,?,?,?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pIDPROVEEDOR);  
            obj_Procedimiento.setString(2, pNOMBRE);
            obj_Procedimiento.setString(3, pDIRECCION);
            obj_Procedimiento.setString(4, pTELEFONO);
            obj_Procedimiento.setString(5, pCORREO_ELECTRONICO);
            obj_Procedimiento.setDate(6, pFECHA_REGISTRO);
            obj_Procedimiento.setString(7, pPAIS);
            obj_Procedimiento.setString(8, pCEDULA_JURIDICA);
            // se ejecuta
            obj_Procedimiento.execute();
            Respuesta = "S";
            System.out.println("insertado exitosamente");
        } catch (SQLException ex) {
            Respuesta = ex.getMessage();
           // Logger.getLogger(ClsFacturas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Respuesta;
    }
   
   
   
   public String ModificarProveedor(String pIDPROVEEDOR, String pNOMBRE, String pDIRECCION, String pTELEFONO , String pCORREO_ELECTRONICO, Date pFECHA_REGISTRO, String pPAIS, String pCEDULA_JURIDICA) 
      {
         String Respuesta = "N";
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{call StpActualizarProveedor(?,?,?,?,?,?,?,?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pIDPROVEEDOR);  
            obj_Procedimiento.setString(2, pNOMBRE);
            obj_Procedimiento.setString(3, pDIRECCION);
            obj_Procedimiento.setString(4, pTELEFONO);
            obj_Procedimiento.setString(5, pCORREO_ELECTRONICO);
            obj_Procedimiento.setDate(6, pFECHA_REGISTRO);
            obj_Procedimiento.setString(7, pPAIS);
            obj_Procedimiento.setString(8, pCEDULA_JURIDICA);
            // se ejecuta
            obj_Procedimiento.execute();
            Respuesta = "S";
            System.out.println("Modificado exitosamente");
        } catch (SQLException ex) {
            Respuesta = ex.getMessage();
           // Logger.getLogger(ClsFacturas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Respuesta;
    }
   
   
      public String EliminarProveedor(String pIDPROVEEDOR) 
      {
         String Respuesta = "N";
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{call StpEliminarProveedor(?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pIDPROVEEDOR);  
           
            // se ejecuta
            obj_Procedimiento.execute();
            Respuesta = "S";
            System.out.println("Modificado exitosamente");
        } catch (SQLException ex) {
            Respuesta = ex.getMessage();
           // Logger.getLogger(ClsFacturas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Respuesta;
    }
   
        public ResultSet buscarProveedor(String pBuscar, String pTipoBusqueda) {
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{CALL StpBuscarProveedor(?,?)}");
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
        
    public String getIDPROVEEDOR() {
        return IDPROVEEDOR;
    }

    public void setIDPROVEEDOR(String IDPROVEEDOR) {
        this.IDPROVEEDOR = IDPROVEEDOR;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getDIRECCION() {
        return DIRECCION;
    }

    public void setDIRECCION(String DIRECCION) {
        this.DIRECCION = DIRECCION;
    }

    public String getTELEFONO() {
        return TELEFONO;
    }

    public void setTELEFONO(String TELEFONO) {
        this.TELEFONO = TELEFONO;
    }

    public String getCORREO_ELECTRONICO() {
        return CORREO_ELECTRONICO;
    }

    public void setCORREO_ELECTRONICO(String CORREO_ELECTRONICO) {
        this.CORREO_ELECTRONICO = CORREO_ELECTRONICO;
    }

    public Date getFECHA_REGISTRO() {
        return FECHA_REGISTRO;
    }

    public void setFECHA_REGISTRO(Date FECHA_REGISTRO) {
        this.FECHA_REGISTRO = FECHA_REGISTRO;
    }

    public String getPAIS() {
        return PAIS;
    }

    public void setPAIS(String PAIS) {
        this.PAIS = PAIS;
    }

    public String getCEDULA_JURIDICA() {
        return CEDULA_JURIDICA;
    }

    public void setCEDULA_JURIDICA(String CEDULA_JURIDICA) {
        this.CEDULA_JURIDICA = CEDULA_JURIDICA;
    }
    
}
