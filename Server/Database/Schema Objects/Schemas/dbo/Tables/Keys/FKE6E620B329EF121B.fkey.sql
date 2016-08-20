ALTER TABLE [dbo].[SolicitacaoProcedimentoItem]
    ADD CONSTRAINT [FKE6E620B329EF121B] FOREIGN KEY ([SolicitacaoProcedimento]) REFERENCES [dbo].[SolicitacaoProcedimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

