using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord]
    public class SolicitacaoProcedimento
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [Property]
        public virtual DateTime? Data { get; set; }

        [BelongsTo]
        public virtual Medico Medico { get; set; }

        [BelongsTo]
        public virtual Atendimento Atendimento { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<SolicitacaoProcedimentoItem> SolicitacaoProcedimentoItem { get; set; }
    }
}
