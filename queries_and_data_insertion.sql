-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address) 
	   values
			 ('Larisa','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Carlos','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores'),
			 ('João','O','Souza', 887654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Gabriel','D','Silva', 287654321,'rua alemeda 289, Centro - Cidade das flores');


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, Classification_kids, Category, Avaliação, Size, Price) values
							  ('Fone de ouvido',false,'Eletrônico','4',null,150.00),
                              ('Barbie Elsa',true,'Brinquedos','3',null,355.99),
                              ('Body Carters',true,'Vestimenta','5',null,328.98),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null,537.00),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80',1327.00),
                              ('Farinha de arroz',False,'Alimentos','2',null,7.30),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null,120.00),
							 ('Notebook', false, 'Eletrônico',7, '35x25x2 cm', 1299.99),
							 ('Vestido', true, 'Vestimenta',3, 'L', 49.99),
							 ('Quebra-Cabeça', true, 'Brinquedos',4, '30x30 cm', 9.99),
							 ('Arroz', true, 'Alimentos',8, '20x10x5 cm', 1.99),
							 ('Cadeira', false, 'Móveis', 6,'40x40x80 cm', 89.99),
							 ('Fone de Ouvido', false,'Eletrônico','7', '20x15x6 cm', 59.99);
                             


select * from payments;
-- Inserir dados fictícios na tabela payments
INSERT INTO payments (IdPayment, TypePayment, LimitAvailable)
VALUES
    (1, 'Boleto', 500),
    (2, 'Cartão', 1000),
    (3, 'Pix', 750),
    (4, 'Dois cartões', 1500),
    (5, 'Cartão', 200),
    (6, 'Boleto', 300),
    (7, 'Pix', 100),
    (8, 'Dois cartões', 600),
    (9, 'Boleto', 150),
    (10, 'Pix', 800),
	(11, 'Boleto', 150),
    (12, 'Pix', 800),
    (13, 'Boleto', 300);

INSERT INTO orders (IdOrder, OrderStatus, OrderDescription, SendValue, PaymentCash)
VALUES
    (1, 'Confirmado', 'Pedido de celular', 15, false),
    (2,  'Em processamento', 'Pedido de camiseta e vestido', 20, false),
    (3,  'Confirmado', 'Pedido de brinquedos', 10, false),
    (4,  'Em processamento', 'Pedido de chocolate e arroz', 10, true),
    (5,  'Confirmado', 'Pedido de sofá', 30, false),
    (6,  'Em processamento', 'Pedido de notebook', 25, false),
    (7,  'Confirmado', 'Pedido de quebra-cabeça', 8, false),
    (8,  'Em processamento', 'Pedido de fone de ouvido', 12, false),
    (9,  'Confirmado', 'Pedido de cadeira', 20, false),
    (10,  'Em processamento', 'Pedido de carrinho', 15, false),
	(11,  'Confirmado', 'Pedido de celular', 15, false),
    (12,  'Em processamento', 'Pedido de camiseta e vestido', 20, false),
    (13,  'Confirmado', 'Pedido de brinquedos', 10, false);
select * from orders;

INSERT INTO stock (Location)
VALUES
    ('Depósito A'),
    ('Depósito B'),
    ('Depósito C'),
    ('Estoque Principal'),
    ('Depósito D'),
    ('Depósito E'),
    ('Estoque Secundário'),
    ('Depósito F'),
    ('Estoque Central'),
    ('Depósito G');


insert into supplier (SocialName, CNPJ, Contact) 
	values 
		('Fornecedor A', '12345678901234', '98765432101'),
		('Fornecedor B', '23456789012345', '87654321012'),
		('Fornecedor C', '34567890123456', '76543210923'),
		('Fornecedor D', '45678901234567', '65432109834'),
		('Fornecedor E', '56789012345678', '54321098745'),
		('Fornecedor F', '67890123456789', '43210987656'),
		('Fornecedor G', '78901234567890', '32109876567'),
		('Fornecedor H', '89012345678901', '21098765478'),
		('Fornecedor I', '90123456789012', '10987654389'),
		('Fornecedor J', '01234567890123', '09876543290');


-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, Location, Contact) 
	values 
						('Tech eletronics', null, 123456789789564, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,712345678,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484),
						('Vendedor E', 'VendE', '56789012345678', '543210987', 'Rua E, 354, Bairro E, Cidade E', '43210987656'),
						('Vendedor F', 'VendF', '67890123456789', '432109876', 'Rua F, 368, Bairro F, Cidade F', '32109876567'),
						('Vendedor G', 'VendG', '78901234567890', '321098765', 'Rua G, 299, Bairro G, Cidade G', '21098765478'),
						('Vendedor H', 'VendH', '89012345678901', '210987654', 'Rua H, 684, Bairro H, Cidade H', '10987654389'),
						('Vendedor I', 'VendI', '90123456789012', '109876543', 'Rua I, 951, Bairro I, Cidade I', '09876543290'),
						('Vendedor J', 'VendJ', '01234567890123', '098765432', 'Rua J, 356, Bairro J, Cidade J', '98765432101');
 


-- idPseller, idPproduct, prodQuantity
insert into productSeller (IdProductSeller,IdPproduct, ProdQuantity) 
	values 
		(1,1,11),
		(2,2,20),
		(3,3,15),
		(4,5,30),
		(5,5,25),
		(6,6,12),
		(7,7,18),
		(8,8,8),
		(9,9,5),
		(10,10,40),
		(11,11,5),
		(12,12,8),
		(13,13,3);
	

INSERT INTO productOrder (IdOrder,IdProduct,PoQuantity, POStatus)
VALUES
    (1,1,2, 'Disponível'),
    (2,2,1, 'Disponível'),
    (3,3,5, 'Disponível'),
    (4,4,3, 'Sem estoque'),
    (5,5,4, 'Disponível'),
    (6,6,1, 'Disponível'),
    (7,7, 2, 'Disponível'),
    (8,8,2, 'Disponível'),
    (9,9,1, 'Disponível'),
    (10,10,3, 'Disponível'),
    (11,11,2, 'Disponível'),
    (12,12,1, 'Disponível'),
    (13,13,4, 'Disponível');
    

INSERT INTO productSuplier (IdProduct, IdSupplier, Quantity)
VALUES
    (1, 1, 50),
    (2, 2, 30),
    (3, 3, 40),
    (4, 4, 25),
    (5, 5, 15),
    (6, 6, 20),
    (7, 7, 10),
    (8, 8, 35),
    (9, 9, 5),
    (10, 10, 60),
    (1, 2, 20),
    (2, 3, 10),
    (3, 4, 15),
    (4, 5, 5),
    (5, 6, 8),
    (6, 7, 15),
    (7, 8, 5),
    (8, 9, 25),
    (9, 10, 3),
    (10, 1, 30);


INSERT INTO productStock (IdProduct, IdStock, Quantity)
VALUES
    (1, 1, 20),
    (2, 2, 15),
    (3, 3, 25),
    (4, 4, 10),
    (5, 5, 5),
    (6, 6, 18),
    (7, 7, 8),
    (8, 8, 30),
    (9, 9, 3),
    (10, 10, 40),
    (1, 2, 10),
    (2, 3, 8),
    (3, 4, 12),
    (4, 5, 3),
    (5, 6, 4),
    (6, 7, 9),
    (7, 8, 2),
    (8, 9, 20),
    (9, 10, 1),
    (10, 1, 25);


