-- criação do banco de dados para o cenário de E-commerce 
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
		IdClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(255),
        AccountType enum('PJ','PF') default('PF'),
        constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

create table product(
		IdProduct int auto_increment primary key,
        Pname varchar(255) not null,
        Classification_kids bool default false,
        Category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        Avaliação float default 0,
        Size varchar(15), -- Dimenssão da caixa do produto
        Price float not null
);

alter table product auto_increment=1;


create table payments(
	IdPayment int auto_increment primary key,
	Idclient int,
    TypePayment enum('Boleto','Cartão','Dois cartões','pix'),
    LimitAvailable float,
    constraint fk_payments_clients
		foreign key (IdClient) references clients(IdClient)
);


-- criar tabela pedido
-- drop table orders;
create table orders(
	IdOrder int auto_increment primary key,
	IdClient int,
    IdPayment int,
    OrderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    OrderDescription varchar(255),
    SendValue float default 10,
    PaymentCash boolean default false, 
    constraint fk_ordes_client foreign key (IdClient) references clients(IdClient)
		on update cascade,
	constraint fk_orders_payments
		foreign key (IdPayment) references payments(IdPayment)
);
alter table orders auto_increment=1;

desc orders;

-- criar tabela estoque
create table stock(
	IdStock int auto_increment primary key,
    Location varchar(255),
    Quantity int default 0
);
alter table stock auto_increment=1;


-- criar tabela fornecedor
create table supplier(
	IdSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;

desc supplier;

-- criar tabela vendedor
create table seller(
	IdSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;


-- tabelas de relacionamentos M:N
-- Criar tabela da relação entre produto e pedido
create table productSeller(
	IdProductSeller int auto_increment primary key,
	IdPseller int,
    IdPproduct int,
    ProdQuantity int default 1,
    constraint fk_product_seller foreign key (idPseller) references seller(IdSeller),
    constraint fk_product_product foreign key (idPproduct) references product(IdProduct)
);


-- Criar tabela da relação entre produto e pedido
create table productOrder(
	IdProduct int,
    IdOrder int,
    PoQuantity int default 1,
    PoStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (IdProduct, IdOrder),
    constraint fk_productorder_product foreign key (IdProduct) references product(IdProduct),
    constraint fk_productorder_order foreign key (IdOrder) references orders(IdOrder)

);

-- Criar tabela da relação entre produto e fornecedor
create table productSuplier (
	IdProductSuplier int auto_increment primary key,
    IdProduct int,
    IdSupplier int,
    Quantity int not null,
    constraint fk_productSuplier_product
		foreign key (IdProduct) references product(IdProduct),
	constraint fk_productSuplier_suplier
		foreign key (IdSupplier) references supplier(IdSupplier)
);
alter table productSuplier auto_increment = 1;

-- Criar tabela da relação entre produto e estoque
create table productStock (
    IdProduct int,
    IdStock int,
	Quantity int default 0,
    primary key (IdProduct, IdStock),
    constraint fk_productStock_product
		foreign key (IdProduct) references product(IdProduct),
	constraint fk_productStock_stock
		foreign key (IdStock) references stock(IdStock)
);