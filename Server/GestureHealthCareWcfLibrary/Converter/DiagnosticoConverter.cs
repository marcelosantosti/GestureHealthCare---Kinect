using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCareWcfLibrary.DataContract;

namespace Facdombosco.GestureHealthCareWcfLibrary.Converter
{
    public class DiagnosticoConverter
    {
        public static Diagnostico Converter(Facdombosco.GestureHealthCare.Dto.Diagnostico diagnostico)
        {
            Diagnostico diagnosticoDataContract = new Diagnostico();
            //diagnosticoDataContract.Codigo = diagnostico.Codigo;
            diagnosticoDataContract.Descricao = diagnostico.Descricao;

            return diagnosticoDataContract;
        }
    }
}
