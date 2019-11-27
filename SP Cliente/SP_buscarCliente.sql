DELIMITER $$
USE `inventario`$$
CREATE PROCEDURE `StpBuscarCliente`($pBuscar Text,$pTipoBusqueda Text)
BEGIN
   if ($pTipoBusqueda ='N') then
		   select * from cliente 
		   where CEDULA = $pBuscar order by CEDULA desc;
	else if($pTipoBusqueda ='C') then
			 select * from cliente 
			 where  NOMBRE like concat('%',$pBuscar,'%')  order by CEDULA desc;
	else
       select * from cliente order by CEDULA desc;
       
	   end if;
   End if;
      
END$$