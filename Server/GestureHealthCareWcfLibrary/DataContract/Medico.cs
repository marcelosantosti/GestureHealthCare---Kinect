using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class Medico
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual string Nome { get; set; }

        [DataMember]
        public virtual string Conselho { get; set; }

        [DataMember]
        public virtual string CondigoConselho { get; set; }
    }
}
