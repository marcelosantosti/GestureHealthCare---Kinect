﻿ALTER TABLE [dbo].[SolicitacaoExame]
    ADD CONSTRAINT [FKCF0BB378A8D5D0F5] FOREIGN KEY ([Medico]) REFERENCES [dbo].[Medico] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

