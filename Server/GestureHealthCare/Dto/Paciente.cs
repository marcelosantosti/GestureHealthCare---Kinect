using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;

namespace Facdombosco.GestureHealthCare.Dto
{
    [ActiveRecord(Lazy = true)]
    public class Paciente
    {
        [PrimaryKey(Generator = PrimaryKeyType.Identity)]
        public virtual int? Codigo { get; set; }

        [Property(Length = 100)]
        public virtual string Nome { get; set; }

        [Property(Length = 1)]
        public virtual string Sexo { get; set; }

        [Property]
        public virtual byte[] Foto { get; set; }

        [Property]
        public virtual DateTime? DataNascimento { get; set; }

        [HasMany(Lazy = true)]
        public virtual IList<Atendimento> Atendimento { get; set; }
    }
}
