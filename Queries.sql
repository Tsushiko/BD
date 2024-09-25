USE Dom;

/*----------------------------------------------------------*/

/*TOP 3 de clientes da loja */

SELECT Pcliente,Nome,SUM(Preço) AS Valor,COUNT(Preço) AS Numero_de_Compras FROM Cliente,Pedido WHERE idCliente=PCliente
	GROUP BY PCliente
	ORDER BY Valor DESC
	LIMIT 3;
    
SELECT Pcliente,Nome,SUM(Preço) AS Valor,COUNT(Preço) AS Numero_de_Compras
	FROM Cliente
		INNER JOIN Pedido
        ON idCliente = PCliente
	GROUP BY PCliente
	ORDER BY Valor DESC
	LIMIT 3;
		

/*Pedidos feitos em outubro de 2022 */

SELECT Cliente.Nome,Pedido.PCliente AS IdCliente,Pedido.IdPedido,DataP AS DataeHora FROM Pedido,CLiente
	WHERE MONTH(Pedido.DataP)="10" AND YEAR(Pedido.DataP)="2022" AND Pedido.PCliente=Cliente.idCliente;

/*Produto mais vendido*/

SELECT IPitem AS IdItem, Nome,SUM(Quantidade)AS Quantidade FROM Item_has_Pedidos,Item WHERE IPitem=idItem 
	GROUP BY IPitem
	ORDER BY Quantidade DESC
	LIMIT 1;

/*Funcionários que estiveram envolvidos em cada pedido*/

SELECT idPedido,idAdministrativo,Administrativo.Nome AS NomeAdministrativo,
idEstafeta, Estafeta.Nome AS NomeEstafeta,
Matricula AS Veiculo FROM Pedido,Estafeta,Administrativo,Transporte
	WHERE idEstafeta=PEstafeta AND
	idAdministrativo=PAdministrativo AND
	Matricula=PTransporte
    ORDER BY idPedido;

/*Administrativo que registou menos pedidos*/

SELECT idAdministrativo,Administrativo.Nome,COUNT(Administrativo.Nome) AS NumerodePedidos FROM Administrativo,Pedido
	WHERE PAdministrativo=idAdministrativo
		GROUP BY idAdministrativo
		ORDER BY NumerodePedidos
		LIMIT 1;
    
/*Todos os itens que fazem parte do pedido 3*/

SELECT IPitem AS IdItem, Item.Nome, Descrição, Item.Preço 
	FROM Item_has_Pedidos
		INNER JOIN Item 
			ON IPPedido = '3' AND IPitem=idItem;


/*Através das datas de receção e de envio, é possível calcular o tempo de entrega.*/

SELECT IdPedido, dataP AS DataPedido, dataR AS DataReceção, CONCAT(DATEDIFF(dataR,dataP), " dias") AS TempoEntrega FROM Pedido;

/*Cada cliente tem 1 ou mais números de telemóvel a si associados*/

SELECT IdCliente, Nome, NrTelemóvel AS Números
	FROM Cliente
		INNER JOIN Telemóvel
			ON TCliente = idCliente
			ORDER BY IdCliente;
            
/*Listar o histórico de pedidos feito por cada cliente*/

SELECT IdCliente, Nome, IdPedido, DataP AS DataPedido, Estado, Preço
	FROM Cliente
		INNER JOIN Pedido
			ON PCliente = idCliente
            ORDER BY IdCliente;


/*Através das datas em que os pedidos são feitos, é possível calcular o período de maior atividade.*/

SELECT CONCAT(HOUR(DataP), ":00") AS HoraDeMaiorAtividade FROM Pedido
	GROUP BY HOUR(DataP)
    ORDER BY COUNT(DataP) DESC
    LIMIT 1;
    
/*----------------------------------------------------------*/
    

				






