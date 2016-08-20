using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class Atendimento
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual DateTime? Data { get; set; }

        [DataMember]
        public virtual string Tipo { get; set; }

        [DataMember]
        public virtual Paciente Paciente { get; set; }

        [DataMember]
        public virtual Diagnostico Diagnostico { get; set; }

        [DataMember]
        public virtual IList<Cirurgia> Cirurgia { get; set; }

        [DataMember]
        public virtual IList<SolicitacaoExame> SolicitacaoExame { get; set; }

        [DataMember]
        public virtual IList<SolicitacaoProcedimento> SolicitacaoProcedimento { get; set; }
    }
}
