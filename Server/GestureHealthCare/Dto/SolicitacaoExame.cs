using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class SolicitacaoExame
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [Property]
        public virtual DateTime? Data { get; set; }

        [BelongsTo]
        public virtual Atendimento Atendimento { get; set; }

        [BelongsTo]
        public virtual Medico Medico { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<SolicitacaoExameItem> SolicitacaoExameItem { get; set; }
    }
}
