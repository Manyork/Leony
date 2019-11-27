CREATE PROCEDURE `StpBuscarMarca`($pBuscar Text,$pTipoBusqueda Text)
BEGIN
   if ($pTipoBusqueda ='N') then
		   select * from marca 
		   where IDMARCA = $pBuscar order by IDMARCA desc;
	else if($pTipoBusqueda ='C') then
			 select * from marca 
			 where  NOMBRE like concat('%',$pBuscar,'%')  order by IDMARCA desc;
	else
       select * from marca order by IDMARCA desc;
       
	   end if;
   End if;
      
END$$