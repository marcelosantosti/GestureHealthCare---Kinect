CREATE TABLE [dbo].[SolicitacaoProcedimento] (
    [Codigo]      INT      IDENTITY (1, 1) NOT NULL,
    [Data]        DATETIME NULL,
    [Medico]      INT      NULL,
    [Atendimento] INT      NULL,
    PRIMARY KEY CLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);



