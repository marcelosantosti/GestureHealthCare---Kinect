using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class Cirurgia
    {
        [DataMember]
        public virtual int? Codigo { get; set; }

        [DataMember]
        public virtual DateTime? DataAgendamento { get; set; }

        [DataMember]
        public string Membro { get; set; }

        [DataMember]
        public virtual string Lado { get; set; }

        [DataMember]
        public virtual DateTime? DataInicio { get; set; }

        [DataMember]
        public virtual DateTime? DataFim { get; set; }

        [DataMember]
        public virtual Atendimento Atendimento { get; set; }

        [DataMember]
        public virtual Sala Sala { get; set; }

        [DataMember]
        public virtual Medico Medico { get; set; }

        [DataMember]
        public virtual Procedimento Procedimento { get; set; }
    }
}
