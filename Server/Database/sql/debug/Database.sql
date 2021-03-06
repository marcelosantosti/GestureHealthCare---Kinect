﻿/*
Deployment script for Database
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NUMERIC_ROUNDABORT, QUOTED_IDENTIFIER OFF;


GO
:setvar DatabaseName "Database"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [GestureHealthCare], FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\GestureHealthCare.mdf', SIZE = 3072 KB, FILEGROWTH = 1024 KB)
    LOG ON (NAME = [GestureHealthCare_log], FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\GestureHealthCare_log.ldf', SIZE = 1024 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %) COLLATE Latin1_General_CI_AS
GO
EXECUTE sp_dbcmptlevel [$(DatabaseName)], 100;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS OFF,
                ANSI_PADDING OFF,
                ANSI_WARNINGS OFF,
                ARITHABORT OFF,
                CONCAT_NULL_YIELDS_NULL OFF,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER OFF,
                ANSI_NULL_DEFAULT OFF,
                CURSOR_DEFAULT GLOBAL,
                RECOVERY SIMPLE,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY CHECKSUM,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
USE [$(DatabaseName)]

GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Creating [dbo].[Atendimento]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Atendimento] (
    [Codigo]      INT          IDENTITY (1, 1) NOT NULL,
    [Data]        DATETIME     NULL,
    [Tipo]        NVARCHAR (1) NULL,
    [Paciente]    INT          NULL,
    [Diagnostico] INT          NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Cirurgia]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Cirurgia] (
    [Codigo]          INT           IDENTITY (1, 1) NOT NULL,
    [DataAgendamento] DATETIME      NULL,
    [Membro]          NVARCHAR (15) NULL,
    [Lado]            NVARCHAR (1)  NULL,
    [DataInicio]      DATETIME      NULL,
    [DataFim]         DATETIME      NULL,
    [Atendimento]     INT           NULL,
    [Sala]            INT           NULL,
    [Medico]          INT           NULL,
    [Procedimento]    INT           NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Diagnostico]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Diagnostico] (
    [Codigo]    INT           IDENTITY (1, 1) NOT NULL,
    [Descricao] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Exame]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Exame] (
    [Codigo]    INT           IDENTITY (1, 1) NOT NULL,
    [Descricao] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Laudo]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Laudo] (
    [Codigo]               INT            IDENTITY (1, 1) NOT NULL,
    [Arquivo]              NVARCHAR (255) NULL,
    [SolicitacaoExameItem] INT            NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Medico]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Medico] (
    [Codigo]          INT            IDENTITY (1, 1) NOT NULL,
    [Nome]            NVARCHAR (100) NULL,
    [Conselho]        NVARCHAR (10)  NULL,
    [CondigoConselho] NVARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Paciente]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Paciente] (
    [Codigo]         INT              IDENTITY (1, 1) NOT NULL,
    [Nome]           NVARCHAR (100)   NULL,
    [Sexo]           NVARCHAR (1)     NULL,
    [Foto]           VARBINARY (8000) NULL,
    [DataNascimento] DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Procedimento]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Procedimento] (
    [Codigo]    INT           IDENTITY (1, 1) NOT NULL,
    [Descricao] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[Sala]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Sala] (
    [Codigo]    INT           IDENTITY (1, 1) NOT NULL,
    [Descricao] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[SolicitacaoExame]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[SolicitacaoExame] (
    [Codigo]      INT      IDENTITY (1, 1) NOT NULL,
    [Data]        DATETIME NULL,
    [Atendimento] INT      NULL,
    [Medico]      INT      NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[SolicitacaoExameItem]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[SolicitacaoExameItem] (
    [Codigo]               INT IDENTITY (1, 1) NOT NULL,
    [QuantidadeSolicitada] INT NULL,
    [QuantidadeRealizada]  INT NULL,
    [SolicitacaoExame]     INT NULL,
    [Exame]                INT NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[SolicitacaoProcedimento]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[SolicitacaoProcedimento] (
    [Codigo]      INT      IDENTITY (1, 1) NOT NULL,
    [Data]        DATETIME NULL,
    [Medico]      INT      NULL,
    [Atendimento] INT      NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[SolicitacaoProcedimentoItem]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[SolicitacaoProcedimentoItem] (
    [Codigo]                  INT IDENTITY (1, 1) NOT NULL,
    [Procedimento]            INT NULL,
    [SolicitacaoProcedimento] INT NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating FK9361F3294C7D3844...';


GO
ALTER TABLE [dbo].[Atendimento] WITH NOCHECK
    ADD CONSTRAINT [FK9361F3294C7D3844] FOREIGN KEY ([Diagnostico]) REFERENCES [dbo].[Diagnostico] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK9361F3297B9EA384...';


GO
ALTER TABLE [dbo].[Atendimento] WITH NOCHECK
    ADD CONSTRAINT [FK9361F3297B9EA384] FOREIGN KEY ([Paciente]) REFERENCES [dbo].[Paciente] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK4BD7B8F2444612CA...';


GO
ALTER TABLE [dbo].[Cirurgia] WITH NOCHECK
    ADD CONSTRAINT [FK4BD7B8F2444612CA] FOREIGN KEY ([Sala]) REFERENCES [dbo].[Sala] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK4BD7B8F28DB1B275...';


GO
ALTER TABLE [dbo].[Cirurgia] WITH NOCHECK
    ADD CONSTRAINT [FK4BD7B8F28DB1B275] FOREIGN KEY ([Atendimento]) REFERENCES [dbo].[Atendimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK4BD7B8F2A8D5D0F5...';


GO
ALTER TABLE [dbo].[Cirurgia] WITH NOCHECK
    ADD CONSTRAINT [FK4BD7B8F2A8D5D0F5] FOREIGN KEY ([Medico]) REFERENCES [dbo].[Medico] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK4BD7B8F2D45CE946...';


GO
ALTER TABLE [dbo].[Cirurgia] WITH NOCHECK
    ADD CONSTRAINT [FK4BD7B8F2D45CE946] FOREIGN KEY ([Procedimento]) REFERENCES [dbo].[Procedimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK32BD35083813EFCE...';


GO
ALTER TABLE [dbo].[Laudo] WITH NOCHECK
    ADD CONSTRAINT [FK32BD35083813EFCE] FOREIGN KEY ([SolicitacaoExameItem]) REFERENCES [dbo].[SolicitacaoExameItem] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKCF0BB3788DB1B275...';


GO
ALTER TABLE [dbo].[SolicitacaoExame] WITH NOCHECK
    ADD CONSTRAINT [FKCF0BB3788DB1B275] FOREIGN KEY ([Atendimento]) REFERENCES [dbo].[Atendimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKCF0BB378A8D5D0F5...';


GO
ALTER TABLE [dbo].[SolicitacaoExame] WITH NOCHECK
    ADD CONSTRAINT [FKCF0BB378A8D5D0F5] FOREIGN KEY ([Medico]) REFERENCES [dbo].[Medico] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKEA604ED1D3387EC6...';


GO
ALTER TABLE [dbo].[SolicitacaoExameItem] WITH NOCHECK
    ADD CONSTRAINT [FKEA604ED1D3387EC6] FOREIGN KEY ([SolicitacaoExame]) REFERENCES [dbo].[SolicitacaoExame] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKEA604ED1F68B7769...';


GO
ALTER TABLE [dbo].[SolicitacaoExameItem] WITH NOCHECK
    ADD CONSTRAINT [FKEA604ED1F68B7769] FOREIGN KEY ([Exame]) REFERENCES [dbo].[Exame] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKC19FE66B8DB1B275...';


GO
ALTER TABLE [dbo].[SolicitacaoProcedimento] WITH NOCHECK
    ADD CONSTRAINT [FKC19FE66B8DB1B275] FOREIGN KEY ([Atendimento]) REFERENCES [dbo].[Atendimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKC19FE66BA8D5D0F5...';


GO
ALTER TABLE [dbo].[SolicitacaoProcedimento] WITH NOCHECK
    ADD CONSTRAINT [FKC19FE66BA8D5D0F5] FOREIGN KEY ([Medico]) REFERENCES [dbo].[Medico] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKE6E620B329EF121B...';


GO
ALTER TABLE [dbo].[SolicitacaoProcedimentoItem] WITH NOCHECK
    ADD CONSTRAINT [FKE6E620B329EF121B] FOREIGN KEY ([SolicitacaoProcedimento]) REFERENCES [dbo].[SolicitacaoProcedimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FKE6E620B3D45CE946...';


GO
ALTER TABLE [dbo].[SolicitacaoProcedimentoItem] WITH NOCHECK
    ADD CONSTRAINT [FKE6E620B3D45CE946] FOREIGN KEY ([Procedimento]) REFERENCES [dbo].[Procedimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
-- Refactoring step to update target server with deployed transaction logs
CREATE TABLE  [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
GO
sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Atendimento] WITH CHECK CHECK CONSTRAINT [FK9361F3294C7D3844];

ALTER TABLE [dbo].[Atendimento] WITH CHECK CHECK CONSTRAINT [FK9361F3297B9EA384];

ALTER TABLE [dbo].[Cirurgia] WITH CHECK CHECK CONSTRAINT [FK4BD7B8F2444612CA];

ALTER TABLE [dbo].[Cirurgia] WITH CHECK CHECK CONSTRAINT [FK4BD7B8F28DB1B275];

ALTER TABLE [dbo].[Cirurgia] WITH CHECK CHECK CONSTRAINT [FK4BD7B8F2A8D5D0F5];

ALTER TABLE [dbo].[Cirurgia] WITH CHECK CHECK CONSTRAINT [FK4BD7B8F2D45CE946];

ALTER TABLE [dbo].[Laudo] WITH CHECK CHECK CONSTRAINT [FK32BD35083813EFCE];

ALTER TABLE [dbo].[SolicitacaoExame] WITH CHECK CHECK CONSTRAINT [FKCF0BB3788DB1B275];

ALTER TABLE [dbo].[SolicitacaoExame] WITH CHECK CHECK CONSTRAINT [FKCF0BB378A8D5D0F5];

ALTER TABLE [dbo].[SolicitacaoExameItem] WITH CHECK CHECK CONSTRAINT [FKEA604ED1D3387EC6];

ALTER TABLE [dbo].[SolicitacaoExameItem] WITH CHECK CHECK CONSTRAINT [FKEA604ED1F68B7769];

ALTER TABLE [dbo].[SolicitacaoProcedimento] WITH CHECK CHECK CONSTRAINT [FKC19FE66B8DB1B275];

ALTER TABLE [dbo].[SolicitacaoProcedimento] WITH CHECK CHECK CONSTRAINT [FKC19FE66BA8D5D0F5];

ALTER TABLE [dbo].[SolicitacaoProcedimentoItem] WITH CHECK CHECK CONSTRAINT [FKE6E620B329EF121B];

ALTER TABLE [dbo].[SolicitacaoProcedimentoItem] WITH CHECK CHECK CONSTRAINT [FKE6E620B3D45CE946];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        DECLARE @VarDecimalSupported AS BIT;
        SELECT @VarDecimalSupported = 0;
        IF ((ServerProperty(N'EngineEdition') = 3)
            AND (((@@microsoftversion / power(2, 24) = 9)
                  AND (@@microsoftversion & 0xffff >= 3024))
                 OR ((@@microsoftversion / power(2, 24) = 10)
                     AND (@@microsoftversion & 0xffff >= 1600))))
            SELECT @VarDecimalSupported = 1;
        IF (@VarDecimalSupported > 0)
            BEGIN
                EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
            END
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET MULTI_USER 
    WITH ROLLBACK IMMEDIATE;


GO
