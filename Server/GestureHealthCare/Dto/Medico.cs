using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class Medico
    {
        [PrimaryKey(Generator = PrimaryKeyType.Native)]
        public virtual int? Codigo { get; set; }

        [Property(Length = 100)]
        public virtual string Nome { get; set; }

        [Property(Length = 10)]
        public virtual string Conselho { get; set; }

        [Property(Length = 10)]
        public virtual string CondigoConselho { get; set; }
    }
}
