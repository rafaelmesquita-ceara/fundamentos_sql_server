DROP TABLE [Empresa]
DROP TABLE [Endereco]
DROP TABLE [Produto_Venda]
DROP TABLE [Vale]

SELECT NEWID()

CREATE TABLE[Endereco](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Cep] NVARCHAR(8),
    [Logradouro] NVARCHAR(80),
    [Numero] SMALLINT,
    [Complemento] NVARCHAR(15),
    [Bairro] NVARCHAR(20),
    [Municipio] NVARCHAR(20),
    [Estado] NVARCHAR(2),

    CONSTRAINT [PK_Endereco] PRIMARY KEY([Id])
)
GO

CREATE TABLE[Empresa](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Razao_Social] NVARCHAR(50) NOT NULL,
    [Cnpj] NVARCHAR(14) NOT NULL,
    [Nome_Fantasia] NVARCHAR(50) NOT NULL,
    [Inscricao_Estadual] NVARCHAR(12) NOT NULL,
    [Inscricao_Municipal] NVARCHAR(20) NOT NULL,
    [EnderecoId] UNIQUEIDENTIFIER,
    [Logo] VARBINARY(max),

    CONSTRAINT [PK_Empresa] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Endereco] FOREIGN KEY([EnderecoId])
        REFERENCES [Endereco]([Id])
)
GO

CREATE TABLE[Usuario](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Login] NVARCHAR(80) NOT NULL,
    [Senha] NVARCHAR(80) NOT NULL,
    [Situacao] BIT NOT NULL DEFAULT(1), -- (0) Bloqueado, (1) Liberado
    [Tipo] BIT NOT NULL DEFAULT(0), -- (0) Usuário comum, (1) Gerente, (2) Administrador do Sistema
    [EnderecoId] UNIQUEIDENTIFIER,

    CONSTRAINT [PK_Usuario] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Usuario_Endereco] FOREIGN KEY([EnderecoId])
        REFERENCES [Endereco]([Id])
)
GO
CREATE TABLE[Vendedor](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [TaxaComissao] DECIMAL(10,2) NOT NULL,
    [EnderecoId] UNIQUEIDENTIFIER,
    [Id_Usuario_Incusao] UNIQUEIDENTIFIER NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_Vendedor] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Vendedor_Endereco] FOREIGN KEY([EnderecoId])
        REFERENCES [Endereco]([Id]),
    CONSTRAINT [FK_Usuario] FOREIGN KEY([Id_Usuario_Incusao])
        REFERENCES [Usuario]([Id])

)
GO

CREATE TABLE[Categoria](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),
    [Id_Usuario_Incusao] UNIQUEIDENTIFIER NOT NULL

    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
    CONSTRAINT [FK_Categoria_Usuario] FOREIGN KEY([Id_Usuario_Incusao])
        REFERENCES [Usuario]([Id])
)
GO

CREATE TABLE [Produto](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [CategoriaId] UNIQUEIDENTIFIER NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),
    [Id_Usuario_Incusao] UNIQUEIDENTIFIER NOT NULL,
    [Registro_Ativo] BIT NOT NULL DEFAULT(1), -- (0) Inativo, (1) Ativo
    
    CONSTRAINT [PK_Produto] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([CategoriaId])
        REFERENCES [Categoria]([Id]),
    CONSTRAINT [FK_Produto_Usuario] FOREIGN KEY([Id_Usuario_Incusao])
        REFERENCES [Usuario]([Id])
)
GO 

CREATE TABLE [Lote](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Quantidade] INT NOT NULL,
    [ValorUnitarioCompra] DECIMAL(10,2) NOT NULL,
    [ValorUnitarioVenda] DECIMAL(10,2) NOT NULL,
    [Id_Produto] UNIQUEIDENTIFIER NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),
    [Id_Usuario_Incusao] UNIQUEIDENTIFIER NOT NULL,
    
    CONSTRAINT [PK_Lote] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Lote_Usuario] FOREIGN KEY([Id_Usuario_Incusao])
        REFERENCES [Usuario]([Id]),
    CONSTRAINT [FK_Lote_Produto] FOREIGN KEY([Id_Produto])
        REFERENCES [Produto]([Id])
)
GO

CREATE TABLE [Cliente](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),
    [Id_Usuario_Incusao] UNIQUEIDENTIFIER NOT NULL,
    [Registro_Ativo] BIT NOT NULL DEFAULT(1), -- (0) Inativo, (1) Ativo
    [EnderecoId] UNIQUEIDENTIFIER,

    CONSTRAINT [PK_Cliente] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([Id_Usuario_Incusao])
        REFERENCES [Usuario]([Id]),
    CONSTRAINT [FK_Cliente_Endereco] FOREIGN KEY([EnderecoId])
        REFERENCES [Endereco]([Id])
)
GO

CREATE TABLE [Produto_Venda](
    [VendaId] UNIQUEIDENTIFIER NOT NULL,
    [LoteId] UNIQUEIDENTIFIER NOT NULL,
    [Quantidade] INT NOT NULL,

    CONSTRAINT [PK_Produto_Venda] PRIMARY KEY ([LoteId],[VendaId])
)
GO

CREATE TABLE [Venda](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [ClienteId] UNIQUEIDENTIFIER NOT NULL,
    [VendedorId] UNIQUEIDENTIFIER NOT NULL,
    [ValorTotal] DECIMAL(10,2) NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),
    [Situacao] BIT NOT NULL DEFAULT(0), -- (0) Pendente, (1) Concluída, (2) Cancelada

    CONSTRAINT [PK_Venda] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Venda_Cliente] FOREIGN KEY([ClienteId])
        REFERENCES [Cliente]([Id]),
    CONSTRAINT [FK_Venda_Vendedor] FOREIGN KEY([VendedorId])
        REFERENCES [Vendedor]([Id])
)
GO  

CREATE TABLE [Pagamento](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [VendaId] UNIQUEIDENTIFIER NOT NULL,
    [Valor] DECIMAL(10,2) NOT NULL,
    [Tipo] BIT NOT NULL DEFAULT(0), -- (0) Dinheiro, (1) Cartão de Crédito, (2) Cartão de Débito, (3) Vale
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_Pagamento] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Pagamento_Venda] FOREIGN KEY([VendaId])
        REFERENCES [Venda]([Id])
)
GO  

CREATE TABLE [Vale](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [PagamentoId] UNIQUEIDENTIFIER NOT NULL,
    [Situacao] BIT NOT NULL DEFAULT(0), -- (0) Pendente, (1) Efetuado, (2) Cancelado
    [Data_Vencimento] DATETIME NOT NULL,
    [Data_Inclusao] DATETIME NULL DEFAULT GETUTCDATE(),

    CONSTRAINT [PK_Vale] PRIMARY KEY ([Id])
)
GO

CREATE INDEX [IX_Cliente_Nome] ON [Cliente]([Nome])