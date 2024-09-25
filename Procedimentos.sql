USE Dom;

/*Procedimentos*/

-- Atualiza os preços de todos os item_has_pedidos

DELIMITER $$
CREATE PROCEDURE UpdateAllIHP()
BEGIN
UPDATE Item_has_Pedidos
	SET PreçoTotal = (SELECT Preço FROM Item WHERE IdItem=IPitem) * Quantidade;
END $$


-- Atualiza os preços associados a um pedido em item_has_pedidos

DELIMITER $$
CREATE PROCEDURE UpdateOneIHP(IN Id INT)
BEGIN
UPDATE Item_has_Pedidos
	SET PreçoTotal = (SELECT Preço FROM Item WHERE IdItem=IPitem) * Quantidade WHERE IPPedido = Id;
END $$

-- Atualiza os preços de todos os pedidos

DELIMITER $$
CREATE PROCEDURE UpdateAllP()
BEGIN
UPDATE Pedido
	SET Preço = (SELECT SUM(PreçoTotal) + CustoPortes FROM Item_has_Pedidos, Transporte WHERE IPPedido = idPedido AND PTransporte = Matricula);
END $$

-- Atualiza os preços de 1 pedido

DELIMITER $$
CREATE PROCEDURE UpdateOneP(IN Id INT)
BEGIN
UPDATE Pedido
	SET Preço = (SELECT SUM(PreçoTotal) + CustoPortes FROM Item_has_Pedidos, Transporte WHERE IPPedido = idPedido AND PTransporte = Matricula) WHERE idPedido = Id;
END $$

-- Atualiza o stock de todos os items

DELIMITER $$
CREATE PROCEDURE UpdateAllStock()
BEGIN
UPDATE Item	
	SET Stock = (SELECT IF (IPitem = IdItem IS NOT NULL, (Stock - SUM(Quantidade)),Stock) FROM Item_has_Pedidos WHERE IPitem = IdItem);
END $$

-- Atualiza o stock de 1 item

DELIMITER $$
CREATE PROCEDURE UpdateOneStock(IN Id INT)
BEGIN
UPDATE Item	
	SET Stock = (SELECT IF (IPitem = IdItem IS NOT NULL, (Stock - SUM(Quantidade)),Stock) FROM Item_has_Pedidos WHERE IPitem = IdItem AND IdItem = Id);
END $$

-- Atualiza o estado de 1 pedido

DELIMITER $$
CREATE PROCEDURE UpdateEstado(IN NewEstado VARCHAR(45), IN Id INT)
BEGIN
UPDATE Pedido
	SET Estado = NewEstado WHERE idPedido = Id;
UPDATE Pedido
    SET DataE = (SELECT IF (STRCMP(NewEstado, 'Enviado')=0, now(),DataE) WHERE idPedido = Id) WHERE idPedido = Id;
UPDATE Pedido
    SET DataR = (SELECT IF (STRCMP(NewEstado, 'Recebido')=0, now(),DataR) WHERE idPedido = Id) WHERE idPedido = Id;
END $$