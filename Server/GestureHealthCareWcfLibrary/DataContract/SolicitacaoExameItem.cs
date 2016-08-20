using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class SolicitacaoExameItem
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual int? QuantidadeSolicitada { get; set; }

        [DataMember]
        public virtual int? QuantidadeRealizada { get; set; }

        [DataMember]
        public virtual SolicitacaoExame SolicitacaoExame { get; set; }

        [DataMember]
        public virtual Exame Exame { get; set; }

        [DataMember]
        public virtual IList<Laudo> Laudo { get; set; }
    }
}
