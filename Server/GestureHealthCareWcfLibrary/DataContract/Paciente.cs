using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Facdombosco.GestureHealthCareWcfLibrary.DataContract
{
    [DataContract]
    public class Paciente
    {
        [DataMember]
        public int? Codigo { get; set; }

        [DataMember]
        public string Nome { get; set; }

        [DataMember]
        public string Sexo { get; set; }

        [DataMember]
        public byte[] Foto { get; set; }

        [DataMember]
        public string IdadeAtual { get; set; }

        [DataMember]
        public DateTime? DataNascimento { get; set; }

        [DataMember]
        IList<Atendimento> Atendimento { get; set; }
    }
}
