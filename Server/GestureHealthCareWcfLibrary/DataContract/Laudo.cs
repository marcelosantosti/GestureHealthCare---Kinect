using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class Laudo
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual string Arquivo { get; set; }

        [DataMember]
        public virtual SolicitacaoExameItem SolicitacaoExameItem { get; set; }
    }
}
