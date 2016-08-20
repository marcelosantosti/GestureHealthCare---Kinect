using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class SalaConverter
    {
        public static Sala Converter(Facdombosco.GestureHealthCare.Dto.Sala sala)
        {
            Sala salaDataContract = new Sala();
            salaDataContract.Descricao = sala.Descricao;

            return salaDataContract;
        }
    }
}
