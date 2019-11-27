CREATE PROCEDURE `StpActualizarMarca` ($IDMARCA varchar(45),
$pNOMBRE varchar(45))
BEGIN
UPDATE `inventario`.`marca`
SET
`NOMBRE` = $pNOMBRE
WHERE `IDMARCA` = $IDMARCA;

END$$