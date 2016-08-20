ALTER TABLE [dbo].[SolicitacaoProcedimento]
    ADD CONSTRAINT [FKC19FE66B8DB1B275] FOREIGN KEY ([Atendimento]) REFERENCES [dbo].[Atendimento] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

