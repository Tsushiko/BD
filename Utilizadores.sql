USE Dom;

/*Utilizadores*/

-- Admin
-- Os administrativos têm permissões para registar os pedidos e adicionar items.

CREATE USER 'admin'@'localhost';
SET PASSWORD FOR 'admin'@'localhost' = 'admin12';

GRANT SELECT, INSERT, UPDATE ON Pedido TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Cliente TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Item TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Item_has_Pedidos TO 'admin'@'localhost';

-- Estaf
-- Os estafetas só podem ver os pedidos que lhes são atribuídos e não podem modificá-los de nenhuma forma.

CREATE USER 'estaf'@'localhost';
SET PASSWORD FOR 'estaf'@'localhost' = 'estaf12';

GRANT SELECT ON Pedido TO 'estaf'@'localhost';

-- Gestor
-- Os Gestores têm permissões para registar os pedidos e adicionar items.

CREATE USER 'gestor'@'localhost';
SET PASSWORD FOR 'gestor'@'localhost' = 'gestor12';

GRANT ALL ON * TO  'gestor'@'localhost';

-- User
-- Os clientes têm acesso a algumas informações sobre os pedidos que fizeram e podem mudar os seus dados de Cliente através do site 

CREATE USER 'user'@'localhost';
SET PASSWORD FOR 'user'@'localhost' = 'user12';

GRANT SELECT, UPDATE ON Cliente TO 'user'@'localhost';

GRANT SELECT ON Pedido TO 'user'@'localhost';

SELECT * 
	FROM mysql.user;
	
SELECT User, Host 
	FROM mysql.user
	ORDER BY User;
    