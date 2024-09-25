USE Dom;

/*Vista que mostra a informação completa de todos os pedidos já feitos*/

CREATE VIEW InfoGeral 
AS
	SELECT IdCliente AS "Id do Cliente", 
		SUBSTRING_INDEX(Cliente.Nome, " ", 1) AS 'Nome',
        SUBSTRING(Cliente.Nome,(LENGTH(SUBSTRING_INDEX(Cliente.Nome, " ", 1)) + 1)) AS 'Apelido',
		Cliente.Email,
        Cliente.Nif,
        IdPedido AS 'Id do Pedido',
        dataP AS 'Data do Pedido',
        dataE AS 'Data do Envio',
        dataR AS 'Data da Receção',
        Estado,
        Preço,
        Rua,
        Localidade,
        CodPostal AS 'Código Postal',
        IdEstafeta AS 'Id do Estafeta',
        Estafeta.Nome AS 'Nome Estafeta',
        Estafeta.Salário AS 'Salário Estafeta',
        Estafeta.Ativo AS 'Estafeta Ativo?',
        Matricula,
        IdAdministrativo AS 'Id do Administrativo',
        Administrativo.Nome AS 'Nome Adminsitrativo',
        Administrativo.Salário AS 'Salário Administrativo',
        Administrativo.Ativo AS 'Administrativo Ativo?'
		FROM Cliente
			INNER JOIN Pedido
			ON idCliente = PCliente
				INNER JOIN Estafeta
				ON idEstafeta = PEstafeta
					INNER JOIN Transporte
					ON Matricula = PTransporte
						INNER JOIN Administrativo
						ON idAdministrativo = PAdministrativo;
			
SELECT *
	FROM InfoGeral;