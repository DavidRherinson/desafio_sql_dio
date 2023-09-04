

-- CLIENTES

-- Quantos clientes temos?
select count(*) as Quantity from clients;

-- Quais pedidos foram feitos por quais clientes?
select concat(FName, ' ', MInit, ' ', LName) as ClientName, CPF, Address, OrderStatus, OrderDescription, SendValue
	from clients c, orders o 
	where c.IdClient = o.IdOrder
    order by OrderStatus, ClientName;  -- Separar por Status e visualizar ordenado por nome
    
-- Quanto cada cliente gastou com frete?
select concat(FName, ' ', MInit, ' ', LName) as ClientName, CPF, sum(SendValue) as FreightSum
	from clients c
    left outer join orders o
		on c.IdClient = o.IdClient
	group by c.IdClient
    order by ClientName;

-- PEDIDOS

-- Quantos pedidos foram realizados?
select count(*) as OrderCount
	from orders;

-- Qual a quantidade de pedidos 'Em processamento' em contrapartida aos 'Confirmado's?
select OrderStatus, count(OrderStatus) as StatusCount
	from clients c, orders o 
	where c.IdClient = o.IdOrder
    group by OrderStatus;
    
-- Qual a quantidade de pedidos por Categoria de produto?
select Category, count(IdOrder) as OrderCount
	from productOrder po
	inner join product p
		on po.IdProduct = p.IdProduct
	group by Category
    order by OrderCount desc;

-- PAGAMENTO
 

-- PRODUTOS

-- Qual é o produto mais vendido?
select PName, Category, count(*) as SoldAmount
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct
	group by p.IdProduct
    order by SoldAmount desc;

-- Qual o produto com menor quantidade nos estoques?
select PName, Category, sum(Quantity) as QuantitySumByProduct
	from product p
    inner join productStock ps
		on p.IdProduct = ps.IdProduct
	group by p.IdProduct
	order by QuantitySumByProduct;
    
-- Qual o produto com menor quantidade em  estoque?
select Location, PName, Category, sum(ps.Quantity) as QuantitySumByProduct
	from product p
    inner join productStock ps
		on p.IdProduct = ps.IdProduct
	inner join stock s
		on s.IdStock = ps.IdStock
	group by s.IdStock, p.IdProduct
	order by QuantitySumByProduct;
    
    

-- RECEITA

-- Quanto foi gasto com frete?
select sum(SendValue ) as FreightSum from orders;

-- Qual a receita total gerada?
select round(sum(Category * Price), 2) as PriceSum
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct;

-- Qual a receita gerada por cada produto?
select PName, Category, round(sum(Category * Price), 2) as PriceSum
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct
	group by p.IdProduct
    order by PriceSum desc;