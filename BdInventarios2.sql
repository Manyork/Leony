-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema INVENTARIO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema INVENTARIO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `INVENTARIO` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema inventario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventario` DEFAULT CHARACTER SET utf8 ;
USE `INVENTARIO` ;

-- -----------------------------------------------------
-- Table `INVENTARIO`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`CLIENTE` (
  `CEDULA` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `CORREO_ELECTRONICO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `FECHA_REGISTRO` DATETIME NOT NULL,
  `GENERO` VARCHAR(45) NULL,
  PRIMARY KEY (`CEDULA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `INVENTARIO`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`PROVEEDOR` (
  `IDPROVEEDOR` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `CORREO_ELECTRONICO` VARCHAR(45) NOT NULL,
  `FECHA_REGISTRO` DATETIME NOT NULL,
  `PAIS` VARCHAR(45) NULL,
  `CEDULA_JURIDICA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPROVEEDOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `INVENTARIO`.`PRESENTACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`PRESENTACION` (
  `IDPRESENTACION` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPRESENTACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `INVENTARIO`.`MARCA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`MARCA` (
  `IDMARCA` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDMARCA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `INVENTARIO`.`PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`PEDIDO` (
  `IDPEDIDO` INT NOT NULL,
  `NUMERO_PEDIDO` VARCHAR(45) NULL,
  `FECHA_REGISTRO` DATETIME NULL,
  `CLIENTE` VARCHAR(45) NULL,
  `NUMERO_FACTURA` VARCHAR(45) NULL,
  `DIRECCION_ENTREGA` VARCHAR(45) NULL,
  `IVA` DOUBLE NULL,
  `SUB_TOTAL` FLOAT NULL,
  `PRECIO_TOTAL` FLOAT NULL,
  PRIMARY KEY (`IDPEDIDO`),
  INDEX `CLIENTE_idx` (`CLIENTE` ASC),
  CONSTRAINT `CLIENTE`
    FOREIGN KEY (`CLIENTE`)
    REFERENCES `INVENTARIO`.`CLIENTE` (`CEDULA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `INVENTARIO`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`PRODUCTO` (
  `IDPRODUCTO` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NULL,
  `PRECIO_UND` FLOAT NOT NULL,
  `STOCK` INT NOT NULL,
  `PESO` FLOAT NULL,
  `PRESENTACION` VARCHAR(45) NOT NULL,
  `MARCA` VARCHAR(45) NOT NULL,
  `PROVEEDOR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPRODUCTO`, `PROVEEDOR`, `MARCA`, `PRESENTACION`),
  INDEX `PRESENTACIONPK_idx` (`PRESENTACION` ASC),
  INDEX `MARKAPK_idx` (`MARCA` ASC),
  INDEX `PROVEEDORPK_idx` (`PROVEEDOR` ASC),
  CONSTRAINT `PRESENTACIONPK`
    FOREIGN KEY (`PRESENTACION`)
    REFERENCES `INVENTARIO`.`PRESENTACION` (`IDPRESENTACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MARKAPK`
    FOREIGN KEY (`MARCA`)
    REFERENCES `INVENTARIO`.`MARCA` (`IDMARCA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PROVEEDORPK`
    FOREIGN KEY (`PROVEEDOR`)
    REFERENCES `INVENTARIO`.`PROVEEDOR` (`IDPROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `INVENTARIO`.`DETALLE_PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `INVENTARIO`.`DETALLE_PEDIDO` (
  `IDPRODUCTO` VARCHAR(45) NOT NULL,
  `IDPEDIDO` INT NOT NULL,
  `CANTIDAD` INT NOT NULL,
  INDEX `PRODUCTO_idx` (`IDPRODUCTO` ASC),
  INDEX `DETALLE_PEDIDO_idx` (`IDPEDIDO` ASC),
  PRIMARY KEY (`IDPRODUCTO`, `IDPEDIDO`),
  CONSTRAINT `PRODUCTO`
    FOREIGN KEY (`IDPRODUCTO`)
    REFERENCES `INVENTARIO`.`PRODUCTO` (`IDPRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DETALLE_PEDIDO`
    FOREIGN KEY (`IDPEDIDO`)
    REFERENCES `INVENTARIO`.`PEDIDO` (`IDPEDIDO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `inventario` ;

-- -----------------------------------------------------
-- Table `inventario`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`cliente` (
  `CEDULA` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NULL DEFAULT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `CORREO_ELECTRONICO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `FECHA_REGISTRO` DATETIME NOT NULL,
  `GENERO` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`CEDULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`pedido` (
  `IDPEDIDO` INT(11) NOT NULL,
  `NUMERO_PEDIDO` VARCHAR(45) NULL DEFAULT NULL,
  `FECHA_REGISTRO` DATETIME NULL DEFAULT NULL,
  `CLIENTE` VARCHAR(45) NULL DEFAULT NULL,
  `NUMERO_FACTURA` VARCHAR(45) NULL DEFAULT NULL,
  `DIRECCION_ENTREGA` VARCHAR(45) NULL DEFAULT NULL,
  `IVA` DOUBLE NULL DEFAULT NULL,
  `SUB_TOTAL` FLOAT NULL DEFAULT NULL,
  `PRECIO_TOTAL` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`IDPEDIDO`),
  INDEX `CLIENTE_idx` (`CLIENTE` ASC),
  CONSTRAINT `CLIENTE`
    FOREIGN KEY (`CLIENTE`)
    REFERENCES `inventario`.`cliente` (`CEDULA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`marca` (
  `IDMARCA` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDMARCA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`presentacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`presentacion` (
  `IDPRESENTACION` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPRESENTACION`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`proveedor` (
  `IDPROVEEDOR` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `CORREO_ELECTRONICO` VARCHAR(45) NOT NULL,
  `FECHA_REGISTRO` DATETIME NOT NULL,
  `PAIS` VARCHAR(45) NULL DEFAULT NULL,
  `CEDULA_JURIDICA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPROVEEDOR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`producto` (
  `IDPRODUCTO` VARCHAR(45) NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NULL DEFAULT NULL,
  `PRECIO_UND` FLOAT NOT NULL,
  `STOCK` INT(11) NOT NULL,
  `PESO` FLOAT NULL DEFAULT NULL,
  `PRESENTACION` VARCHAR(45) NOT NULL,
  `MARCA` VARCHAR(45) NOT NULL,
  `PROVEEDOR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPRODUCTO`, `PROVEEDOR`, `MARCA`, `PRESENTACION`),
  INDEX `PRESENTACIONPK_idx` (`PRESENTACION` ASC),
  INDEX `MARKAPK_idx` (`MARCA` ASC),
  INDEX `PROVEEDORPK_idx` (`PROVEEDOR` ASC),
  CONSTRAINT `MARKAPK`
    FOREIGN KEY (`MARCA`)
    REFERENCES `inventario`.`marca` (`IDMARCA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PRESENTACIONPK`
    FOREIGN KEY (`PRESENTACION`)
    REFERENCES `inventario`.`presentacion` (`IDPRESENTACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PROVEEDORPK`
    FOREIGN KEY (`PROVEEDOR`)
    REFERENCES `inventario`.`proveedor` (`IDPROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`detalle_pedido` (
  `IDPRODUCTO` VARCHAR(45) NOT NULL,
  `IDPEDIDO` INT(11) NOT NULL,
  `CANTIDAD` INT(11) NOT NULL,
  PRIMARY KEY (`IDPRODUCTO`, `IDPEDIDO`),
  INDEX `PRODUCTO_idx` (`IDPRODUCTO` ASC),
  INDEX `DETALLE_PEDIDO_idx` (`IDPEDIDO` ASC),
  CONSTRAINT `DETALLE_PEDIDO`
    FOREIGN KEY (`IDPEDIDO`)
    REFERENCES `inventario`.`pedido` (`IDPEDIDO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PRODUCTO`
    FOREIGN KEY (`IDPRODUCTO`)
    REFERENCES `inventario`.`producto` (`IDPRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario`.`proveedor_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventario`.`proveedor_producto` (
  `IDPROVEEDOR` VARCHAR(45) NOT NULL,
  `IDPRODUCTO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPROVEEDOR`, `IDPRODUCTO`),
  INDEX `FKPRODUCTO_idx` (`IDPRODUCTO` ASC),
  CONSTRAINT `FKPRODUCTO`
    FOREIGN KEY (`IDPRODUCTO`)
    REFERENCES `inventario`.`producto` (`IDPRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKPROVEEDOR`
    FOREIGN KEY (`IDPROVEEDOR`)
    REFERENCES `inventario`.`proveedor` (`IDPROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `inventario` ;

-- -----------------------------------------------------
-- procedure SP_EliminarProveedor
-- -----------------------------------------------------

DELIMITER $$
USE `inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EliminarProveedor`($pIDPROVEEDOR varchar(45))
BEGIN
DELETE FROM `inventario`.`proveedor`
WHERE IDPROVEEDOR=$pIDPROVEEDOR;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure StpActualizarProveedor
-- -----------------------------------------------------

DELIMITER $$
USE `inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `StpActualizarProveedor`($pIDPROVEEDOR varchar(45),
$pNOMBRE varchar(45) ,
$pDIRECCION varchar(45), 
$pTELEFONO varchar(45) ,
$pCORREO_ELECTRONICO varchar(45), 
$pFECHA_REGISTRO datetime ,
$pPAIS varchar(45) ,
$pCEDULA_JURIDICA varchar(45))
BEGIN
UPDATE `inventario`.`proveedor`
SET
`NOMBRE` = $pNOMBRE ,
`DIRECCION` = $pDIRECCION ,
`TELEFONO` = $pTELEFONO,
`CORREO_ELECTRONICO` = $pCORREO_ELECTRONICO,
`FECHA_REGISTRO` = $pFECHA_REGISTRO,
`PAIS` =$pPAIS,
`CEDULA_JURIDICA` =$pCEDULA_JURIDICA
WHERE `IDPROVEEDOR` = $pIDPROVEEDOR;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure StpBuscarProveedor
-- -----------------------------------------------------

DELIMITER $$
USE `inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `StpBuscarProveedor`($pBuscar Text,$pTipoBusqueda Text)
BEGIN
   if ($pTipoBusqueda ='N') then
		   select * from PROVEEDORES 
		   where IDPROVEEDOR = $pBuscar order by IDPROVEEDOR desc;
	else if($pTipoBusqueda ='C') then
			 select * from PROVEEDORES 
			 where  NOMBRE like concat('%',$pBuscar,'%')  order by IDPROVEEDOR desc;
	else
       select * from PROVEEDORES order by IDPROVEEDOR desc;
       
	   end if;
   End if;
      
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure StpInsertarProveedor
-- -----------------------------------------------------

DELIMITER $$
USE `inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `StpInsertarProveedor`( $pIDPROVEEDOR varchar(45),
$pNOMBRE varchar(45) ,
$pDIRECCION varchar(45), 
$pTELEFONO varchar(45) ,
$pCORREO_ELECTRONICO varchar(45), 
$pFECHA_REGISTRO datetime ,
$pPAIS varchar(45) ,
$pCEDULA_JURIDICA varchar(45))
BEGIN
IF NOT exists  (SELECT * FROM PROVEEDORES WHERE IDPROVEEDOR =IDPROVEEDOR) THEN

INSERT INTO `inventario`.`proveedor`
(`IDPROVEEDOR`,`NOMBRE`,`DIRECCION`,`TELEFONO`,`CORREO_ELECTRONICO`,`FECHA_REGISTRO`,`PAIS`,`CEDULA_JURIDICA`)
VALUES($pIDPROVEEDOR,$pNOMBRE,$pDIRECCION,$pTELEFONO,$pCORREO_ELECTRONICO,$pFECHA_REGISTRO,$pPAIS,$pCEDULA_JURIDICA);
ELSE 
SELECT 'EL REGISTRO YA SE ENCUENTRA REGISTRADO EN BD';
END IF;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
