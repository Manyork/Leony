CREATE PROCEDURE `StpBuscarPresentacion`($pBuscar Text,$pTipoBusqueda Text)
BEGIN
   if ($pTipoBusqueda ='N') then
		   select * from presentacion 
		   where IDPRESENTACION = $pBuscar order by IDPRESENTACION desc;
	else if($pTipoBusqueda ='C') then
			 select * from presentacion 
			 where  DESCRIPCION like concat('%',$pBuscar,'%')  order by IDPRESENTACION desc;
	else
       select * from presentacion order by IDPRESENTACION desc;
       
	   end if;
   End if;
      
END$$