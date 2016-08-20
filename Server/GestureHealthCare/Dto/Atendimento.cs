using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class Atendimento
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [Property]
        public virtual DateTime? Data { get; set; }

        [Property(Length = 1)]
        public virtual string Tipo { get; set; }

        [BelongsTo]
        public virtual Paciente Paciente { get; set; }

        [BelongsTo]
        public virtual Diagnostico Diagnostico { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<Cirurgia> Cirurgia { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<SolicitacaoExame> SolicitacaoExame { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<SolicitacaoProcedimento> SolicitacaoProcedimento { get; set; }
    }
}
