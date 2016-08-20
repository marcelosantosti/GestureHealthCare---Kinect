﻿CREATE TABLE [dbo].[Paciente] (
    [Codigo]         INT              IDENTITY (1, 1) NOT NULL,
    [Nome]           NVARCHAR (100)   NULL,
    [Sexo]           NVARCHAR (1)     NULL,
    [Foto]           VARBINARY (8000) NULL,
    [DataNascimento] DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);



