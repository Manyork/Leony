DELIMITER $$
CREATE PROCEDURE `StpBuscarProducto`($pBuscar Text,$pTipoBusqueda Text)
BEGIN
   if ($pTipoBusqueda ='N') then
		   select * from producto 
		   where IDPRODUCTO = $pBuscar order by IDPRODUCTO desc;
	else if($pTipoBusqueda ='C') then
			 select * from producto 
			 where  NOMBRE like concat('%',$pBuscar,'%')  order by IDPRODUCTO desc;
	else
       select * from producto order by IDPRODUCTO desc;
       
	   end if;
   End if;
      
END$$
DELIMITER ;