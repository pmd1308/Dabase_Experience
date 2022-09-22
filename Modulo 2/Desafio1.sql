--Ciação
    -- Criação do DB
        create database ecommerce;
        use ecommerce;

    -- Tabelas
        create table client(
			idClient int auto_increment primary key,
	        Fname varchar(10),
	        Minit varchar(3),
	        Lname varchar(20),
            Identificacao_CPF_CPNJ enum ('CPF', 'CNPJ') not null,
	        CPF_CPNJ VARchar(14) not null,
	        Address varchar(30),
	        constraint unique_cpf_client unique (CPF_CPNJ)
        );

        create table product(
            idProduct int auto_increment primary key,
            Pname varchar(10) not null,
            classification_kids  bool default false,
            category enum ('Eletrônico', 'Vestimenta', 'Brinquedo', 'Alimentos', 'Móveis') not null,
            avaliação float,
            size varchar(10)
        );
        
        create table payments(
            idClient int,
            idPayment int,
            typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
            limitAvaiable float,
            primary key(idClient, idPayment)
        );
        
        create table orders(
            idOrder int auto_increment primary key,
            idOrderClient int,
            orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
            orderDescripition varchar(255),
            sendValue float default 10,
            paymentCash bool default false,
            constraint fk_orders_client foreign key (idOrderClient) references client(idClient)
        );

        create table productStorage(
            idProdStorage int auto_increment primary key,
            storageLocation varchar(225),
            quantity int default 0
        );

        create table supplier(
            idSupplier int auto_increment primary key,
            SocialName varchar(255) not null,
            CNPJ char(14) not null,
            contact char(11) not null,
            constraint unique_supplier unique (CNPJ)
        );
        
        create table seller(
            idSeller int auto_increment primary key,
            SocialName varchar(255) not null,
            AbstName varchar(255),
            Identificacao_CPF_CPNJ enum (‘CPF’, 'CNPJ') not null
            CPF_CPNJ varchar(14) not null,
            location varchar(255),
            contact char(11) not null,
            constraint unique_ CPF_CPNJ _seller unique (CPF_CPNJ)
        
        );

        create table productSeller(
            idPseller int,
            idProduct int,
            prodQuantity int default 1,
            primary key (idPseller, idProduct),
            constraint fk_productSeller_seller foreign key (idPseller) references seller(idSeller),
            constraint fk_productSeller_product foreign key (idProduct) references product(idProduct)
        );
        
        create table productOrder(
            idPOproduct int,
            idPOorder int,
            poQuantity int default 1,
            poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
            primary key (idPOproduct, idPOorder),
            constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
            constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)
        );
        
        create table storageLocation(
            idLproduct int,
            idLstorage int,
            location varchar(255) not null,
            primary key (idLproduct, idLstorage),
            constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
            constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
        );
        
        create table productSupplier(
            idPsSupplier int,
            idPsProduct int,
            quantity int not null,
            primary key (idPsSupplier, idPsProduct),
            constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
            constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
        );
        
        