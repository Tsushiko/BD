USE Dom;

INSERT INTO Administrativo(idAdministrativo,Nome, Salário, Ativo)
      VALUES (1,'Joao',650,'Sim'),(2,'Ricardo',800,'Sim'),(3,'Ruben',700,'Sim'),(4,'Martim',750,'Sim');
      
INSERT INTO Estafeta(idEstafeta,Nome, Salário, Ativo)
	VALUES (1,'Vasco',700,'Sim'),(2,'Marta',750,'Sim'),(3,'André',700,'Sim'),(4,'Renato',600,'Sim'),(5,'Carolina',800,'Sim');

INSERT INTO Transporte(Matricula,CustoPortes)
	VALUES ('AA-12-LK',3),('VR-32-BA',2),('AE-21-FF',4),('XD-76-XG',3),('GG-13-AJ',3);
    
INSERT INTO Cliente(idCliente,Email,NIF,Nome)
	VALUES (1,'cm@gmail.com',236544365,'Carla Matos'),(2,'na@gmail.com',214228355,'Nuno Almeida'),(3,'ac@gmail.com',210579820,'Álvaro Cabral'),(4,'lc@gmail.com',285347276,'Lídia Costa');

INSERT INTO Telemóvel(NrTelemóvel,TCliente)
	VALUES ('911111111',1),('912222222',1),('911212122',2),('913333333',3),('917777777',4);
 
INSERT INTO Item(IdItem,Nome,Descrição,Preço,Stock)
	VALUES (1,"GeForce GTX 1080","Placa gráfica NVIDIA - 8GB DDR5",600,20),(2,"IntelCore i7 6500","Processador IntelCore da 7ª geração",400,20),(3,"Memória RAM 16GB","DDR4-3200MHz",40,20),
		   (4,"Motherboard B550M DS3H","Suporte para a 3ª Geração AMD Ryzen",100,20),(5,"Monitor 24 polegadas","144Hz, 1ms",250,20);
 
INSERT INTO Pedido(idPedido,dataR,dataE,dataP,Estado,Preço,Rua,Localidade,CodPostal,PCliente,PEstafeta,PTransporte,PAdministrativo)
	VALUES (1,'2022-10-19 16:30','2022-10-19 15:00','2022-10-16 18:30','Recebido',0.0,'Rua da Universidade','Braga','1111-111',1,1,'AA-12-LK',1),
		   (2,'2022-10-15 16:30','2022-10-15 15:00','2022-10-13 18:30','Recebido',0.0,'Rua deidadeidade Gualtar','Braga','2222-222',2,2,'VR-32-BA',2),
           (3,NULL,'2022-11-22 15:00','2022-11-21 20:30','Enviado',0.0,'Rua Fernando Pessoa','Braga','3333-333',3,3,'AE-21-FF',3),
           (4,NULL,NULL,'2022-12-03 20:30','Processamento',0.0,'Rua Alberto Caeiro','Braga','4444-444',4,4,'XD-76-XG',4),
           (5,'2022-10-18 14:21','2022-10-18 14:00','2022-10-14 10:23','Recebido',0.0,'Rua da Liberdade','Guimarães','4835-256',2,3,'AE-21-FF',3),
		   (6,'2022-12-17 16:30','2022-12-17 16:03','2022-12-15 15:59','Recebido',0.0,'Rua da Saudade','Guimarães','4835-321',3,4,'XD-76-XG',3),
           (7,'2022-12-13 18:43','2022-12-13 18:00','2022-12-10 19:32','Recebido',0.0,'Rua do Pombal','Guimarães','4835-275',3,1,'GG-13-AJ',4);
    
INSERT INTO Item_has_Pedidos(IPitem,IPPedido,PreçoTotal,Quantidade)
	VALUES (1,1,0.0,1),(2,1,0.0,1),(1,2,0.0,3),(1,3,0.0,2),(2,3,0.0,1),(3,3,0.0,1),(4,3,0.0,1),(4,4,0.0,2),(1,5,0.0,2),(3,5,0.0,2),(4,6,0.0,1),(2,7,0.0,2);
    
-- Atribuição dos preços ao Item_has_Pedidos e aos Pedidos    

SET SQL_SAFE_UPDATES = 0;

CALL UpdateAllIHP();

CALL UpdateAllP();

CALL UpdateAllStock();

-- Atualização do estado do pedido 4

CALL UpdateEstado("Enviado",4);

-- Visualização de tabelas

SELECT * FROM Cliente;
SELECT * FROM Pedido;
SELECT * FROM Item;
SELECT * FROM Item_has_Pedidos;