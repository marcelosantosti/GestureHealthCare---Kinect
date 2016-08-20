ALTER TABLE [dbo].[SolicitacaoProcedimentoItem]
    ADD CONSTRAINT [FKE6E620B3D45CE946] FOREIGN KEY ([Procedimento]) REFERENCES [dbo].[Procedimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

