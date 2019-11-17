DELIMITER $$
USE `inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `StpBuscarProveedor`($pBuscar Text,$pTipoBusqueda Text)
BEGIN
   if ($pTipoBusqueda ='N') then
		   select * from proveedor 
		   where IDPROVEEDOR = $pBuscar order by IDPROVEEDOR desc;
	else if($pTipoBusqueda ='C') then
			 select * from proveedor 
			 where  NOMBRE like concat('%',$pBuscar,'%')  order by IDPROVEEDOR desc;
	else
       select * from proveedor order by IDPROVEEDOR desc;
       
	   end if;
   End if;
      
END$$

DELIMITER ;