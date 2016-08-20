using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class ExameConverter
    {
        public static Exame Converter(Facdombosco.GestureHealthCare.Dto.Exame exame)
        {
            Exame exameDataContract = new Exame();
            //exameDataContract.Codigo = exame.Codigo;
            exameDataContract.Descricao = exame.Descricao;

            return exameDataContract;
        }
    }
}
