using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class SolicitacaoProcedimento
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual DateTime? Data { get; set; }

        [DataMember]
        public virtual Medico Medico { get; set; }

        [DataMember]
        public virtual Atendimento Atendimento { get; set; }

        [DataMember]
        public virtual IList<SolicitacaoProcedimentoItem> SolicitacaoProcedimentoItem { get; set; }
    }
}
