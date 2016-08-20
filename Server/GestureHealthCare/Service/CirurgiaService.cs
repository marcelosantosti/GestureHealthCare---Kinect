using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dto;

namespace Facdombosco.GestureHealthCare.Service
{
    public class CirurgiaService : BaseService<Cirurgia>
    {
        public static IList<Cirurgia> FindAllWithAtendimento()
        {
            return BaseService<Cirurgia>.FindAll("Atendimento", "Atendimento.Paciente", "Sala", "Medico", "Procedimento");
        }
    }
}
