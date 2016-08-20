CREATE TABLE [dbo].[SolicitacaoProcedimentoItem] (
    [Codigo]                  INT IDENTITY (1, 1) NOT NULL,
    [Procedimento]            INT NULL,
    [SolicitacaoProcedimento] INT NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);



