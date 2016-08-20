using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class SolicitacaoProcedimentoItem
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public Procedimento Procedimento { get; set; }

        [DataMember]
        public virtual SolicitacaoProcedimento SolicitacaoProcedimento { get; set; }
    }
}
