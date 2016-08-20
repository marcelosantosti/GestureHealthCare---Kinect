CREATE TABLE [dbo].[Medico] (
    [Codigo]          INT            IDENTITY (1, 1) NOT NULL,
    [Nome]            NVARCHAR (100) NULL,
    [Conselho]        NVARCHAR (10)  NULL,
    [CondigoConselho] NVARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);



