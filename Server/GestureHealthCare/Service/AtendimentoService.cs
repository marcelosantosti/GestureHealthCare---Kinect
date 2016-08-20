using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dto;
using Facdombosco.GestureHealthCare.Dal;

namespace Facdombosco.GestureHealthCare.Service
{
    public class AtendimentoService : BaseService<Atendimento>
    {
        public static IList<Atendimento> FindAllAtendimentoWithExame(int? idPaciente)
        {
            return AtendimentoDal.FindAllAtendimentoWithExame(idPaciente);
        }

        public static IList<Atendimento> FindAllAtendimentoWithProcedimento(int? idPaciente)
        {
            return AtendimentoDal.FindAllAtendimentoWithProcedimento(idPaciente);
        }

        public static IList<Atendimento> FindAllAtendimentoWithDiagnostico(int? idPaciente)
        {
            return AtendimentoDal.FindAllAtendimentoWithDiagnostico(idPaciente);
        }
    }
}
