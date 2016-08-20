using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class ProcedimentoConverter
    {
        public static Procedimento Converter(Facdombosco.GestureHealthCare.Dto.Procedimento procedimento)
        {
            Procedimento procedimentoDataContract = new Procedimento();
            procedimentoDataContract.Codigo = procedimento.Codigo;
            procedimentoDataContract.Descricao = procedimento.Descricao;

            return procedimentoDataContract;
        }
    }
}
