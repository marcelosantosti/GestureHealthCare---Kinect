using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class MedicoConverter
    {
        public static Medico Converter(Facdombosco.GestureHealthCare.Dto.Medico medico)
        {
            Medico medicoDataContract = new Medico();
            medicoDataContract.Nome = medico.Nome;
            medicoDataContract.Conselho = medico.Conselho;
            medicoDataContract.CondigoConselho = medico.CondigoConselho;

            return medicoDataContract;
        }
    }
}
