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


## Comandos básicos para os bancos de dados e tabelas

### Criar novo banco de dados
```
CREATE DATABASE [Curso]
```

### Usar banco de dados
```
USE [Curso]
```

### Criar tabela
```
CREATE TABLE [Produto](
    [Id] INT,
    [Nome] NVARCHAR(80),
    [Data_Inclusao] DATETIME,
    [Registro_Ativo] BIT,
)
GO
```

### Modificar tabelas
```
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