ALTER TABLE [dbo].[SolicitacaoExameItem]
    ADD CONSTRAINT [FKEA604ED1D3387EC6] FOREIGN KEY ([SolicitacaoExame]) REFERENCES [dbo].[SolicitacaoExame] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

