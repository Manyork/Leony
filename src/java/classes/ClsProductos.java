/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

//import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

//public class ClsProductos {
public class ClsProductos extends ClsConexion {

    String IDPRODUCTO;
    String NOMBRE;
    String DESCRIPCION;
    float PRECIO_UND;
    int STOCK;
    float PESO;
    String PRESENTACION;
    String MARCA;
    String PROVEEDOR;

    public ClsProductos() {
        super();
    }

    public String GuardarProductos(String pIDPRODUCTO, String pNOMBRE, String pDESCRIPCION, float pPRECIO_UND, int pSTOCK, float pPESO, String pPRESENTACION, String pMARCA, String pPROVEEDOR) {
        String Respuesta = "N";
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{call StpInsertarProducto(?,?,?,?,?,?,?,?,?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pIDPRODUCTO);
            obj_Procedimiento.setString(2, pNOMBRE);
            obj_Procedimiento.setString(3, pDESCRIPCION);
            obj_Procedimiento.setFloat(4, pPRECIO_UND);
            obj_Procedimiento.setInt(5, pSTOCK);
            obj_Procedimiento.setFloat(6, pPESO);
            obj_Procedimiento.setString(7, pPRESENTACION);
            obj_Procedimiento.setString(8, pMARCA);
            obj_Procedimiento.setString(9, pPROVEEDOR);
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

    public String ModificarProductos(String pIDPRODUCTO, String pNOMBRE, String pDESCRIPCION, float pPRECIO_UND, int pSTOCK, float pPESO, String pPRESENTACION, String pMARCA, String pPROVEEDOR) {
        String Respuesta = "N";
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{call StpActualizarProducto(?,?,?,?,?,?,?,?,?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pIDPRODUCTO);
            obj_Procedimiento.setString(2, pNOMBRE);
            obj_Procedimiento.setString(3, pDESCRIPCION);
            obj_Procedimiento.setFloat(4, pPRECIO_UND);
            obj_Procedimiento.setInt(5, pSTOCK);
            obj_Procedimiento.setFloat(6, pPESO);
            obj_Procedimiento.setString(7, pPRESENTACION);
            obj_Procedimiento.setString(8, pMARCA);
            obj_Procedimiento.setString(9, pPROVEEDOR);
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

    public String EliminarProductos(String pIDPRODUCTOS) {
        String Respuesta = "N";
        try {
            //se prepara la llamada al preocedimiento
            obj_Procedimiento = Conexion.prepareCall("{call StpEliminarProductos(?)}");
            // Se definen las entradas(parámetros) de los datos con sus caracteristicas
            obj_Procedimiento.setString(1, pIDPRODUCTOS);

            // se ejecuta
            obj_Procedimiento.execute();
            Respuesta = "S";
            System.out.println("Eliminado exitosamente");
        } catch (SQLException ex) {
            Respuesta = ex.getMessage();
            // Logger.getLogger(ClsFacturas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Respuesta;
    }

    public ResultSet buscarProductos(String pBuscar, String pTipoBusqueda) {
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

    public String getIDPRODUCTO() {
        return IDPRODUCTO;
    }

    public void setIDPRODUCTO(String IDPRODUCTO) {
        this.IDPRODUCTO = IDPRODUCTO;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getDESCRIPCION() {
        return DESCRIPCION;
    }

    public void setDESCRIPCION(String DESCRIPCION) {
        this.DESCRIPCION = DESCRIPCION;
    }

    public float getPRECIO_UND() {
        return PRECIO_UND;
    }

    public void setPRECIO_UND(float PRECIO_UND) {
        this.PRECIO_UND = PRECIO_UND;
    }

    public int getSTOCK() {
        return STOCK;
    }

    public void setSTOCK(int STOCK) {
        this.STOCK = STOCK;
    }

    public float getPESO() {
        return PESO;
    }

    public void setPESO(float PESO) {
        this.PESO = PESO;
    }

    public String getPRESENTACION() {
        return PRESENTACION;
    }

    public void setPRESENTACION(String PRESENTACION) {
        this.PRESENTACION = PRESENTACION;
    }

    public String getMARCA() {
        return MARCA;
    }

    public void setMARCA(String MARCA) {
        this.MARCA = MARCA;
    }

    public String getPROVEEDOR() {
        return PROVEEDOR;
    }

    public void setPROVEEDOR(String PROVEEDOR) {
        this.PROVEEDOR = PROVEEDOR;
    }

}
