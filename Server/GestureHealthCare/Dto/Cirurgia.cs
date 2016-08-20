using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class Cirurgia
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [Property]
        public virtual DateTime? DataAgendamento { get; set; }

        [Property(Length = 15)]
        public virtual string Membro { get; set; }

        [Property(Length = 1)]
        public virtual string Lado { get; set; }

        [Property]
        public virtual DateTime? DataInicio { get; set; }

        [Property]
        public virtual DateTime? DataFim { get; set; }

        [BelongsTo]
        public virtual Atendimento Atendimento { get; set; }

        [BelongsTo]
        public virtual Sala Sala { get; set; }

        [BelongsTo]
        public virtual Medico Medico { get; set; }

        [BelongsTo]
        public virtual Procedimento Procedimento { get; set; }
    }
}
