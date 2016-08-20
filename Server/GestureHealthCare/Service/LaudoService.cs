using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dto;
using Facdombosco.GestureHealthCare.Dal;

namespace Facdombosco.GestureHealthCare.Service
{
    public class LaudoService : BaseService<Laudo>
    {
        public static IList<Laudo> FindAllLaudo(int? idPaciente)
        {
            return LaudoDal.FindAllLaudo(idPaciente);
        }
    }
}
