USE [Curso]

-- INSERT Endereços
INSERT INTO [Endereco]([Id], [Cep], [Logradouro], [Numero], [Complemento], [Bairro], [Municipio], [Estado])
VALUES (NEWID(), '62380000', 'Avenida Nossa Senhora dos Prazeres', 450, 'Casa', 'Centro', 'Guaraciaba do Norte', 'CE')
GO
INSERT INTO [Endereco]([Id], [Cep], [Logradouro], [Numero], [Complemento], [Bairro], [Municipio], [Estado])
VALUES (NEWID(), '89017375', 'Dezessete', 8352, 'Quadra 8', 'Centro', 'Itajaí', 'SC')
GO
INSERT INTO [Endereco]([Id], [Cep], [Logradouro], [Numero], [Complemento], [Bairro], [Municipio], [Estado])
VALUES (NEWID(), '68917157', 'Paraíba', 6021, 'Cobertura 4', 'Planalto', 'Senador Canedo', 'GO')
GO
INSERT INTO [Endereco]([Id], [Cep], [Logradouro], [Numero], [Complemento], [Bairro], [Municipio], [Estado])
VALUES (NEWID(), '98197427', 'Sergipe', 6408, 'Casa', 'Santo Antônio', 'Brusque', 'SC')
GO

SELECT * from [Endereco]

-- INSERT Empresa
INSERT INTO [Empresa]([Id],[Razao_Social],[Cnpj],[Nome_Fantasia],[Inscricao_Estadual],[Inscricao_Municipal],[EnderecoId])
VALUES (NEWID(), 'Ery Bolsas e Variedades', '77844835000152', 'Ery Bolsas', '111111111111', '111111', '952e8ab1-fc3a-426e-8de7-92fd8bca89ed')

-- INSERT Usuário

INSERT INTO [Usuario]([Id], [Nome], [Login], [Senha], [Situacao], [Tipo], [EnderecoId])
VALUES (NEWID(), 'Rafael', 'admin', CONVERT(VARCHAR(32), HashBytes('MD5', 'admin'), 2), 1, 2, '952e8ab1-fc3a-426e-8de7-92fd8bca89ed')
GO
INSERT INTO [Usuario]([Id], [Nome], [Login], [Senha], [Situacao], [Tipo], [EnderecoId])
VALUES (NEWID(), 'Erineide', 'ery', CONVERT(VARCHAR(32), HashBytes('MD5', '123456'), 2), 1, 1, '952e8ab1-fc3a-426e-8de7-92fd8bca89ed')

-- Insert Vendedor

INSERT INTO [Vendedor]([Id], [Nome], [TaxaComissao], [EnderecoId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Erineide', 0, '952e8ab1-fc3a-426e-8de7-92fd8bca89ed', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Vendedor]([Id], [Nome], [TaxaComissao], [EnderecoId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Fernanda', 0.35, '8e8b3378-e33e-45ae-bb61-f59b31322385', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO

-- Insert Categoria

INSERT INTO [Categoria]([Id], [Nome], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Cintos', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Categoria]([Id], [Nome], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bonés', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Categoria]([Id], [Nome], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsas Femininas', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Categoria]([Id], [Nome], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Sombrinhas', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO

-- Insert Produto

INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Boné Louis Vuitton MONOGRAM ESSENTIAL', '8ee4258b-2e33-43a7-883b-76e5e82e4073', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Boné Louis Vuitton BONÉ LV DENIM', '8ee4258b-2e33-43a7-883b-76e5e82e4073', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsa Louis Vuitton ONTHEGO PM', 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsa Louis Vuitton COUSSIN PM', 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsa Louis Vuitton ALMA BB', 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsa Louis Vuitton TWIST MM', 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsa Louis Vuitton TOILETRY POUCH COM CORRENTE', 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Bolsa Louis Vuitton DAUPHINE MINI', 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Cinto Louis Vuitton CINTO DAUPHINE REVERSÍVEL 25 MM', '84bb0e87-e296-48c6-9467-b39a019b6c5a', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Cinto Louis Vuitton CINTO REVERSÍVEL LV INITIALES 40 MM', '84bb0e87-e296-48c6-9467-b39a019b6c5a', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Produto]([Id], [Nome], [CategoriaId], [Id_Usuario_Incusao])
VALUES (NEWID(), 'Cinto Louis Vuitton CINTO LV EYELETS', '84bb0e87-e296-48c6-9467-b39a019b6c5a', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO

-- Insert Lotes

INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 20.50, 50, '687219e3-e87f-4a2b-9c73-0271c7466fdf', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 10.50, 40, '2eb43137-9bbd-422d-b77d-23f21e9c8582', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 47.50, 100, '97a6cc7e-5641-4867-a3ba-398570322b3d', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 20.50, 50, '2648f461-1ddb-4d1f-96c7-42ee719cb4d4', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 5.50, 20, '04fc3a22-f633-4b64-945d-86f317a200fe', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 9.50, 20, 'bd858e56-50e1-46f4-9db2-873fb7d414eb2', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 30.50, 75, 'cfd4a767-3bae-4575-aa83-9ee684b49a3d', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 49.50, 98, 'b7d57b96-7fb9-4b62-af65-a43caf033a37', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 11.25, 30, '4dcba73d-0007-4f37-8d73-aba195859144', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 5.50, 15, '3799d523-acb5-4446-bd93-b44b7236bd01', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO
INSERT INTO [Lote]([Id], [Quantidade], [ValorUnitarioCompra], [ValorUnitarioVenda], [Id_Produto], [Id_Usuario_Incusao])
VALUES (NEWID(), 50, 59.50, 128, '27d0b1f5-df97-444a-953c-d677d87fc5f6', '2cb3855e-bfa9-44cd-92af-d138ae792cf5')
GO

-- Insert Clientes

select * from Cliente

INSERT INTO [Cliente]([Id], [Nome], [Id_Usuario_Incusao], [EnderecoId])
VALUES (NEWID(), 'Cliente Avulso', '2cb3855e-bfa9-44cd-92af-d138ae792cf5', '8e8b3378-e33e-45ae-bb61-f59b31322385')

-- Insert Vendas / Produto_Vendas / Pagamento / Vale

select * from Lote

INSERT INTO [Venda]([Id], [ClienteId], [VendedorId], [ValorTotal])
VALUES (NEWID(), '0fde3db4-364f-447e-80cc-e2334210b5fa', 'f715cd3f-c34f-4a00-b17a-001ccf525a1f', 100)
GO
INSERT INTO [Produto_Venda]([VendaId], [LoteId], [Quantidade])
VALUES ('d9e5ff46-e95c-45db-be40-e80e72937edc', '39d89a67-ca71-4156-86da-08fb2ed74687', 1)
INSERT INTO [Produto_Venda]([VendaId], [LoteId], [Quantidade])
VALUES ('d9e5ff46-e95c-45db-be40-e80e72937edc', 'ee1aed30-fa8b-4b4d-9b29-1fa510aeafab', 1)
GO
INSERT INTO [Pagamento]([Id], [VendaId], [Valor], [Tipo])
VALUES (NEWID(), 'd9e5ff46-e95c-45db-be40-e80e72937edc', 70, 0)
INSERT INTO [Pagamento]([Id], [VendaId], [Valor], [Tipo])
VALUES (NEWID(), 'd9e5ff46-e95c-45db-be40-e80e72937edc', 30, 3)
GO
INSERT INTO [Vale]([Id], [PagamentoId], [Data_Vencimento])
VALUES (NEWID(), 'c6c217f4-8fdc-42cf-bbfc-812314466a56', '08-01-2023')