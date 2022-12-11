# fundamentos_sql_server

## Ferramentas utilizadas
- Docker
- SQL Server
- Azure Data Studio

## Instalação docker
Rodando o SQL Server no docker

```docker run -v ~/docker --name sqlserver -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Ericsouza.123" -p 1433:1433 -d mcr.microsoft.com/mssql/server```

Connection string

```Server=localhost,1433;Database=Curso;User ID=sa;Password=Ericsouza.123```

# 07/12/2022
## Comandos básicos para os bancos de dados e tabelas

### Criar novo banco de dados
```SQL
CREATE DATABASE [Curso]
```

### Usar banco de dados
```SQL
USE [Curso]
```

### Criar tabela
```SQL
CREATE TABLE [Produto](
    [Id] INT,
    [Nome] NVARCHAR(80),
    [Data_Inclusao] DATETIME,
    [Registro_Ativo] BIT,
)
GO
```

### Modificar tabelas
```SQL
ALTER TABLE [Produto]
    ADD [Codigo] NVARCHAR(10)
GO

ALTER TABLE [Produto]
    DROP COLUMN [Codigo]
GO

ALTER TABLE [Produto]
    ALTER COLUMN [Codigo] VARCHAR(5)
GO
```

### Constraints NOT NULL, UNIQUE e DEFAULT
```SQL
CREATE TABLE [Produto](
    [Id] INT NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL,
    [Registro_Ativo] BIT NOT NULL DEFAULT(0),
)
GO  
```

### Constraints PRIMARY KEY E FOREIGN KEY
```SQL 
CREATE TABLE[Categoria](
    [Id] INT NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL,
    [Id_Usuario_Incusao] INT NOT NULL

    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
)
GO

CREATE TABLE [Produto](
    [Id] INT NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL,
    [Registro_Ativo] BIT NOT NULL DEFAULT(0),
    [CategoriaId] INT NOT NULL,

    CONSTRAINT [PK_Produto] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([CategoriaId])
        REFERENCES [Categoria]([Id])
)
GO 
```

### Índices (utilizado para campos pesquisados com mais frequência)
```SQL
CREATE INDEX [IX_Cliente_Nome] ON [Cliente]([Nome])
```

### Identify (Incrementação automática de Id inteiros)
```SQL
CREATE TABLE[Categoria](
    [Id] INT NOT NULL UNIQUE IDENTITY(1, 1),
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL,
    [Id_Usuario_Incusao] INT NOT NULL

    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
)
GO
```

### GUID (UNIQUEIDENTIFIER)
```SQL
CREATE TABLE[Categoria](
    [Id] UNIQUEIDENTIFIER NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Data_Inclusao] DATETIME NULL,
    [Id_Usuario_Incusao] INT NOT NULL

    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
)
GO

SELECT NEWID()
```

## Comandos de Queries

### Insert
```SQL
INSERT INTO [Endereco]([Id], [Cep], [Logradouro], [Numero], [Complemento], [Bairro], [Municipio], [Estado])
VALUES (NEWID(), '62380000', 'Avenida Nossa Senhora dos Prazeres', 450, 'Casa', 'Centro', 'Guaraciaba do Norte', 'CE')
GO
```

# 08/12/2022

## Comandos de Queries

### Select
```SQL
SELECT DISTINCT TOP 100
    [Nome], [Data_Inclusao]
FROM [Produto]
```

### Select where
```SQL
SELECT DISTINCT TOP 100
    [Nome], [Data_Inclusao], [CategoriaId]
FROM [Produto]
WHERE [CategoriaId] = 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f'
AND [Nome] != 'Bolsa Louis Vuitton ALMA BB'
```

### Order by
```SQL
SELECT DISTINCT TOP 100
    [Nome], [Data_Inclusao], [CategoriaId]
FROM [Produto]
WHERE [CategoriaId] = 'c8e9df2c-1ea0-410c-9cd3-81ca80c3297f'
AND [Nome] != 'Bolsa Louis Vuitton ALMA BB'
ORDER BY [Nome] ASC
```

### Update
```SQL
BEGIN TRANSACTION -- Iniciar transação para garantir resultado seguro
    UPDATE [Lote] 
    SET [Quantidade] = 60
    WHERE [Id] = '39d89a67-ca71-4156-86da-08fb2ed74687'
COMMIT -- Ou ROLLBACK
```

### Delete
```SQL
BEGIN TRANSACTION -- Iniciar transação para garantir resultado seguro
    DELETE FROM [Lote] 
    WHERE [Id] = '39d89a67-ca71-4156-86da-08fb2ed74687'
COMMIT -- Ou ROLLBACK
```

### Like e Alias
```SQL
SELECT DISTINCT TOP 100
    [Nome] AS [Produto], [Data_Inclusao], [CategoriaId]
FROM [Produto]
WHERE [Nome] LIKE 'Bolsa Louis Vuitton%'
ORDER BY [Nome] ASC
```

### INNER JOIN
```SQL
SELECT DISTINCT TOP 100
    [p].[Nome] AS [Produto], [p].[Data_Inclusao], [c].[Nome]
FROM [Produto] AS [p]
INNER JOIN [Categoria] AS [c] ON [c].[Id] = [p].[CategoriaId]
WHERE [p].[Nome] LIKE 'Bolsa Louis Vuitton%'
ORDER BY [p].[Nome] ASC
```