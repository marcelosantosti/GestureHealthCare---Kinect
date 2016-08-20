using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class SolicitacaoExameItem
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [Property]
        public virtual int? QuantidadeSolicitada { get; set; }

        [Property]
        public virtual int? QuantidadeRealizada { get; set; }

        [BelongsTo]
        public virtual SolicitacaoExame SolicitacaoExame { get; set; }

        [BelongsTo]
        public virtual Exame Exame { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<Laudo> Laudo { get; set; }
    }
}
