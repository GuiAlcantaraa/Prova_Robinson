
SELECT * FROM FORNECEDOR

SELECT * FROM MATERIAL

SELECT * FROM COTACAO

SELECT * FROM COTACAO_ITEM

CREATE TABLE FORNECEDOR(

FornecedorId int not null,
Nome varchar(200) not null

)

ALTER TABLE FORNECEDOR
ADD CONSTRAINT PK_FORNCEDOR PRIMARY KEY (FornecedorId)

CREATE TABLE MATERIAL(
MaterialId int not null,
Descricao varchar(200)

)

ALTER TABLE MATERIAL
ADD CONSTRAINT PK_MATERIAL PRIMARY KEY (MaterialId)

CREATE TABLE COTACAO
(
CotacaoId int not null,
FornecedorId int not null,
PrazoMedioPagamento int not null,
ValorLiquidoTotal money not null,
Observacao varchar(500) not null,
DataCriacao datetime,
DataModificacao datetime

)

ALTER TABLE COTACAO
ADD CONSTRAINT PK_COTACAO PRIMARY KEY (CotacaoId)

ALTER TABLE COTACAO
ADD CONSTRAINT FK_COTACAO_FORNE FOREIGN KEY (FornecedorId)
REFERENCES FORNECEDOR (FornecedorId)

CREATE TABLE COTACAO_ITEM(
CotacaoId int not null,
MaterialId int not null,
Quantidade int not null,
ValorMaterial money not null,
PorcentagemDesconto decimal(6, 2) not null

)

ALTER TABLE COTACAO_ITEM
ADD CONSTRAINT FK_COTAITEM_COTA FOREIGN KEY (CotacaoId)
REFERENCES COTACAO(CotacaoId)

ALTER TABLE COTACAO_ITEM
ADD CONSTRAINT pK_COTAITEM PRIMARY KEY (CotacaoId)

ALTER TABLE COTACAO_ITEM
ADD CONSTRAINT PK_COTAITEM_MATE PRIMARY KEY (MaterialId)

ALTER TABLE COTACAO_ITEM
ADD CONSTRAINT FK_COTAITEM_MATE FOREIGN KEY (MaterialId)
REFERENCES MATERIAL(MaterialId)

INSERT INTO FORNECEDOR(FornecedorId, Nome)
values  (1, 'Lucas Gabriel'),
		(2, 'Jeferson Pires'),
		(3, 'Guilherme Alcantara'),
		(4, 'Germano Dias')

INSERT INTO MATERIAL(MaterialId, Descricao)
values  (1, 'Saco de cimento 50kg'),
		(2, 'Tinta Coral Coralar Econômica Acrílica Fosca Branco 18 Litros'),
		(3, 'Argamassa Quartzolit Super Cimentcola Acii 20 KgFavorito'),
		(4, 'Tijolos Ceramica 19x29 - Ceramica são francisco')

INSERT INTO COTACAO(CotacaoId, FornecedorId, PrazoMedioPagamento, ValorLiquidoTotal, Observacao, DataCriacao)
VALUES	(1, 1 , 10, 100, 'Primeira cotacao', '20210612'),
		(2, 2 , 5,  200, 'Segunda cotacao', '20210612'),
		(3, 3 , 20, 300, 'Terceira cotacao', '20210612'),
		(4, 4 , 30, 400, 'Quarta cotacao', '20210612')

INSERT INTO COTACAO_ITEM(CotacaoId, MaterialId, Quantidade, ValorMaterial, PorcentagemDesconto)
VALUES	(1, 1, 10, 100, 10),
		(2, 2, 20, 200, 5),
		(3, 3, 30, 300, 15),
		(4, 4, 40, 400, 8)
		
		// EXERCICIO 3 //
		select 
		Fornecedor.FornecedorID,
		Nome,
		Cotacao.CotacaoID
		from Fornecedor
		left join Cotacao on Fornecedor.FornecedorID = Cotacao.FornecedorID


		// EXERCICIO 4 //

		select 
        Material.MaterialID,
        Material.Descricao,
        COTACAO_ITEM.Quantidade
		from Material
		left join COTACAO_ITEM on Material.MaterialID = COTACAO_ITEM.MaterialID


		// EXERCICIO 5 //

		select * from Cotacao_Item 
		where Quantidade = 0

		// EXERCICIO 6 //

		CREATE VIEW VwForne_cotacao
		AS
		select
		Fornecedor.FornecedorID,
		Nome,
		Cotacao.CotacaoID
		from Fornecedor
		left join Cotacao on Fornecedor.FornecedorID = Cotacao.FornecedorID

		SELECT * FROM VwForne_cotacao
		