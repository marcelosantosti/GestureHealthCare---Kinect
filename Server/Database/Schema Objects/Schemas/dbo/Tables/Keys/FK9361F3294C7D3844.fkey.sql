﻿ALTER TABLE [dbo].[Atendimento]
    ADD CONSTRAINT [FK9361F3294C7D3844] FOREIGN KEY ([Diagnostico]) REFERENCES [dbo].[Diagnostico] ([Codigo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

