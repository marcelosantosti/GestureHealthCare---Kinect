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



