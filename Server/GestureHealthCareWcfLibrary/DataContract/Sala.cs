using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class Sala
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual string Descricao { get; set; }
    }
}
