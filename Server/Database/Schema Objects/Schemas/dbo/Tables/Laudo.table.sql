CREATE TABLE [dbo].[Laudo] (
    [Codigo]               INT            IDENTITY (1, 1) NOT NULL,
    [Arquivo]              NVARCHAR (255) NULL,
    [SolicitacaoExameItem] INT            NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);





