using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord]
    public class SolicitacaoProcedimentoItem
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [BelongsTo]
        public virtual Procedimento Procedimento { get; set; }

        [BelongsTo]
        public virtual SolicitacaoProcedimento SolicitacaoProcedimento { get; set; }
    }
}
