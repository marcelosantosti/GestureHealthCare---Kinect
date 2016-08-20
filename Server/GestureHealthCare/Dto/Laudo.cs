using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class Laudo
    {
        [PrimaryKey(Generator = PrimaryKeyType.Native)]
        public virtual int? Codigo { get; set; }

        [Property]
        public virtual string Arquivo { get; set; }

        [BelongsTo]
        public virtual SolicitacaoExameItem SolicitacaoExameItem { get; set; }
    }
}
